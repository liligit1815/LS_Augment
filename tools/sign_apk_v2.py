#!/usr/bin/env python3
from __future__ import annotations
import argparse, hashlib, os, struct, subprocess, tempfile
from pathlib import Path
from cryptography import x509
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.asymmetric import padding, rsa
from cryptography.hazmat.primitives.serialization import pkcs12
from cryptography.x509.oid import NameOID
import datetime

V2_ID = 0x7109871A
MAGIC = b"APK Sig Block 42"
ALG_RSA_PKCS1_SHA256 = 0x0103
EOCD_SIG = b"PK\x05\x06"
CHUNK = 1024 * 1024


def lp32(b: bytes) -> bytes:
    return struct.pack('<I', len(b)) + b


def lp64(b: bytes) -> bytes:
    return struct.pack('<Q', len(b)) + b


def generate_keypair(key_path: Path, cert_path: Path, p12_path: Path, password: str) -> None:
    key = rsa.generate_private_key(public_exponent=65537, key_size=2048)
    name = x509.Name([x509.NameAttribute(NameOID.COMMON_NAME, 'LS_Augment Development')])
    now = datetime.datetime.now(datetime.timezone.utc)
    cert = (
        x509.CertificateBuilder()
        .subject_name(name)
        .issuer_name(name)
        .public_key(key.public_key())
        .serial_number(x509.random_serial_number())
        .not_valid_before(now - datetime.timedelta(days=1))
        .not_valid_after(now + datetime.timedelta(days=3650))
        .sign(key, hashes.SHA256())
    )
    key_path.parent.mkdir(parents=True, exist_ok=True)
    key_path.write_bytes(key.private_bytes(
        serialization.Encoding.PEM,
        serialization.PrivateFormat.PKCS8,
        serialization.NoEncryption(),
    ))
    cert_path.write_bytes(cert.public_bytes(serialization.Encoding.PEM))
    p12_path.write_bytes(pkcs12.serialize_key_and_certificates(
        b'ls_augment', key, cert, None,
        serialization.BestAvailableEncryption(password.encode()),
    ))


def load_key_cert(key_path: Path, cert_path: Path):
    key = serialization.load_pem_private_key(key_path.read_bytes(), password=None)
    cert = x509.load_pem_x509_certificate(cert_path.read_bytes())
    return key, cert


def find_eocd(apk: bytes) -> int:
    # EOCD must be in the last 65557 bytes. rfind is safe for our tiny APK.
    off = apk.rfind(EOCD_SIG)
    if off < 0 or off + 22 > len(apk):
        raise ValueError('EOCD not found')
    return off


def chunked_digest(sections: list[bytes]) -> bytes:
    chunks = []
    for sec in sections:
        for off in range(0, len(sec), CHUNK):
            c = sec[off:off + CHUNK]
            chunks.append(hashlib.sha256(b'\xA5' + struct.pack('<I', len(c)) + c).digest())
    return hashlib.sha256(b'\x5A' + struct.pack('<I', len(chunks)) + b''.join(chunks)).digest()


def build_v2_block(unsigned_apk: bytes, key, cert) -> tuple[bytes, int, int]:
    eocd_off = find_eocd(unsigned_apk)
    cd_off = struct.unpack_from('<I', unsigned_apk, eocd_off + 16)[0]
    if cd_off > eocd_off:
        raise ValueError('bad central directory offset')

    sec1 = unsigned_apk[:cd_off]
    sec2 = unsigned_apk[cd_off:eocd_off]
    eocd_for_digest = bytearray(unsigned_apk[eocd_off:])
    # During v2 digesting, EOCD central directory offset points to signing-block start.
    struct.pack_into('<I', eocd_for_digest, 16, cd_off)
    content_digest = chunked_digest([sec1, sec2, bytes(eocd_for_digest)])

    digest_record = struct.pack('<I', ALG_RSA_PKCS1_SHA256) + lp32(content_digest)
    digests = lp32(digest_record)
    cert_der = cert.public_bytes(serialization.Encoding.DER)
    certs = lp32(cert_der)
    attrs = b''
    signed_data = lp32(digests) + lp32(certs) + lp32(attrs)

    signature = key.sign(signed_data, padding.PKCS1v15(), hashes.SHA256())
    sig_record = struct.pack('<I', ALG_RSA_PKCS1_SHA256) + lp32(signature)
    signatures = lp32(sig_record)
    public_key = cert.public_key().public_bytes(
        serialization.Encoding.DER,
        serialization.PublicFormat.SubjectPublicKeyInfo,
    )
    signer = lp32(signed_data) + lp32(signatures) + lp32(public_key)
    signers = lp32(signer)
    v2_value = lp32(signers)

    pair_payload = struct.pack('<I', V2_ID) + v2_value
    pair = struct.pack('<Q', len(pair_payload)) + pair_payload
    size_no_first = len(pair) + 8 + len(MAGIC)
    block = struct.pack('<Q', size_no_first) + pair + struct.pack('<Q', size_no_first) + MAGIC
    return block, cd_off, eocd_off


def sign_v2(inp: Path, out: Path, key_path: Path, cert_path: Path) -> None:
    apk = inp.read_bytes()
    if MAGIC in apk:
        raise ValueError('input already contains APK Signing Block')
    key, cert = load_key_cert(key_path, cert_path)
    block, cd_off, eocd_off = build_v2_block(apk, key, cert)
    new_cd_off = cd_off + len(block)
    out_eocd = bytearray(apk[eocd_off:])
    struct.pack_into('<I', out_eocd, 16, new_cd_off)
    final = apk[:cd_off] + block + apk[cd_off:eocd_off] + bytes(out_eocd)
    out.write_bytes(final)


def verify_v2(apk_path: Path) -> str:
    apk = apk_path.read_bytes()
    mi = apk.find(MAGIC)
    if mi < 0:
        raise ValueError('APK Signing Block magic missing')
    size2 = struct.unpack_from('<Q', apk, mi - 8)[0]
    sb_start = mi + 16 - (size2 + 8)
    if struct.unpack_from('<Q', apk, sb_start)[0] != size2:
        raise ValueError('APK Signing Block size mismatch')
    pos = sb_start + 8
    end = mi - 8
    v2 = None
    while pos < end:
        plen = struct.unpack_from('<Q', apk, pos)[0]
        pos += 8
        pid = struct.unpack_from('<I', apk, pos)[0]
        value = apk[pos + 4: pos + plen]
        if pid == V2_ID:
            v2 = value
        pos += plen
    if v2 is None:
        raise ValueError('v2 signer block missing')

    def read_lp32(d: bytes, off: int):
        n = struct.unpack_from('<I', d, off)[0]
        return d[off+4:off+4+n], off+4+n

    seq, _ = read_lp32(v2, 0)
    signer, _ = read_lp32(seq, 0)
    sd, p = read_lp32(signer, 0)
    sigs, p = read_lp32(signer, p)
    pub, p = read_lp32(signer, p)
    digseq, q = read_lp32(sd, 0)
    certseq, q = read_lp32(sd, q)
    attrs, q = read_lp32(sd, q)
    drec, _ = read_lp32(digseq, 0)
    alg = struct.unpack_from('<I', drec, 0)[0]
    expected, _ = read_lp32(drec, 4)
    srec, _ = read_lp32(sigs, 0)
    salg = struct.unpack_from('<I', srec, 0)[0]
    signature, _ = read_lp32(srec, 4)
    cert_der, _ = read_lp32(certseq, 0)
    cert = x509.load_der_x509_certificate(cert_der)
    cert.public_key().verify(signature, sd, padding.PKCS1v15(), hashes.SHA256())

    eocd_off = find_eocd(apk)
    cd_off = struct.unpack_from('<I', apk, eocd_off + 16)[0]
    eocd_for_digest = bytearray(apk[eocd_off:])
    struct.pack_into('<I', eocd_for_digest, 16, sb_start)
    actual = chunked_digest([apk[:sb_start], apk[cd_off:eocd_off], bytes(eocd_for_digest)])
    if actual != expected:
        raise ValueError('content digest mismatch')
    if alg != ALG_RSA_PKCS1_SHA256 or salg != ALG_RSA_PKCS1_SHA256:
        raise ValueError('unexpected algorithm')
    fp = hashlib.sha256(cert_der).hexdigest()
    return fp


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('input')
    ap.add_argument('output')
    ap.add_argument('--key', required=True)
    ap.add_argument('--cert', required=True)
    ap.add_argument('--p12')
    ap.add_argument('--password', default='lsaugment')
    ap.add_argument('--generate', action='store_true')
    args = ap.parse_args()
    key = Path(args.key); cert = Path(args.cert)
    p12 = Path(args.p12) if args.p12 else key.with_suffix('.p12')
    if args.generate and (not key.exists() or not cert.exists() or not p12.exists()):
        generate_keypair(key, cert, p12, args.password)
    sign_v2(Path(args.input), Path(args.output), key, cert)
    fp = verify_v2(Path(args.output))
    print('APK Signature Scheme v2: VERIFIED')
    print('certificate_sha256=' + fp)

if __name__ == '__main__':
    main()
