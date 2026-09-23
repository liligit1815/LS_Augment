"""Fetch the 200 public HKO factual calendar tables linked by its index."""
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from urllib.parse import urljoin
from urllib.request import urlopen
import hashlib
import json
import re
import sys

sys.stdout.reconfigure(encoding='utf-8')
folder = Path(__file__).resolve().parents[1] / 'out/full-device-regression-20260908/round12-calendar-reference'
folder.mkdir(parents=True, exist_ok=True)
index_url = 'https://www.hko.gov.hk/tc/gts/time/conversion1_text.htm'
if not (folder / 'index.html').exists():
    with urlopen(index_url, timeout=40) as response:
        (folder / 'index.html').write_bytes(response.read())
index = (folder / 'index.html').read_text(encoding='utf-8-sig')
links = re.findall(r'[^"\s]*T\d{4}c\.txt', index)
assert len(links) == 200

def fetch(link):
    url = urljoin(index_url, link)
    path = folder / url.rsplit('/', 1)[1]
    if not path.exists():
        with urlopen(url, timeout=40) as response:
            raw = response.read()
        assert '年公曆與農曆日期對照表' in raw.decode('utf-8-sig')
        path.write_bytes(raw)
    raw = path.read_bytes()
    return {'file': path.name, 'url': url, 'sha256': hashlib.sha256(raw).hexdigest()}

results = []
with ThreadPoolExecutor(max_workers=4) as pool:
    for future in as_completed([pool.submit(fetch, link) for link in links]):
        results.append(future.result())
        if len(results) % 20 == 0:
            print(f'Official reference calendars retained: {len(results)}/200', flush=True)
results.sort(key=lambda row: row['file'])
(folder / 'sources.json').write_text(json.dumps(results, ensure_ascii=False, indent=2), encoding='utf-8')
print('All 200 reference files retained and hashed.', flush=True)
