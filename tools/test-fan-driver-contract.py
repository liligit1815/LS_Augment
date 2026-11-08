"""Compile the current production contract and validate supplied audited ELF driver images."""
import argparse
import re
import struct
import subprocess
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('images', type=Path, nargs='+')
args = parser.parse_args()
with tempfile.TemporaryDirectory(prefix='lsa-fan-driver-') as temp:
    root = Path(temp)
    inputs = []
    for index, image in enumerate(args.images):
        content = image.read_bytes()
        table = struct.unpack_from('<Q', content, 40)[0]
        stride, count, names_index = struct.unpack_from('<HHH', content, 58)
        def header(i):
            return struct.unpack_from('<IIQQQQIIQQ', content, table + i * stride)
        names_header = header(names_index)
        names = content[names_header[4]:names_header[4] + names_header[5]]
        for i in range(count):
            section = header(i)
            if names[section[0]:].split(b'\x00', 1)[0] == b'.note.gnu.build-id':
                note = root / f'note-{index}'
                note.write_bytes(content[section[4]:section[4] + section[5]])
                release = re.search(br'\x00vermagic=([^ ]+) ', content)[1].decode()
                inputs.extend([str(image.resolve()), str(note), release])
                break
        else:
            raise AssertionError(f'ELF build-id missing: {image.name}')
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', temp,
                    str(ROOT / 'android/app/src/main/java/ls/augment/com/hook/FanDriverContract.java'),
                    str(ROOT / 'tools/TestFanDriverContract.java')], check=True)
    subprocess.run(['java', '-cp', temp, 'ls.augment.com.hook.TestFanDriverContract', *inputs], check=True)
