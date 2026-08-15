#!/usr/bin/env python3
import struct, sys, zipfile
from pathlib import Path

def check(path: Path):
    data=path.read_bytes()
    bad=[]
    with zipfile.ZipFile(path,'r') as z:
        for info in z.infolist():
            if info.compress_type != zipfile.ZIP_STORED:
                continue
            off=info.header_offset
            if data[off:off+4] != b'PK\x03\x04':
                bad.append((info.filename,'bad local header'))
                continue
            name_len, extra_len=struct.unpack_from('<HH',data,off+26)
            data_off=off+30+name_len+extra_len
            if data_off % 4:
                bad.append((info.filename,f'data offset {data_off} mod4={data_off%4}'))
    return bad

if __name__=='__main__':
    p=Path(sys.argv[1])
    bad=check(p)
    if bad:
        for name,why in bad: print(f'BAD {name}: {why}')
        raise SystemExit(1)
    print('OK: all uncompressed entries are 4-byte aligned')
