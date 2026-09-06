"""Import measured Android view geometry; no screenshot is used as a page background."""
import json,hashlib
from pathlib import Path
from PIL import Image
root=Path(__file__).resolve().parents[1];source=root.parent/'out/ui-faithful'
assets=root/'public/native-assets';assets.mkdir(exist_ok=True)
pages={}
for file in source.glob('*-native.json'):
    name=file.name.removesuffix('-native.json')
    if not (source/(name+'.png')).exists():continue
    node=json.loads(file.read_text(encoding='utf-8'))
    shot=Image.open(source/(name+'.png'))
    def process(n):
        if n['class'].endswith(('ImageView','ImageButton')):
            x,y,r,b=n['absolute']
            if 0<=x<r<=1216 and 0<=y<b<=2688:
                picture=shot.crop((x,y,r,b));token=hashlib.sha256(picture.tobytes()).hexdigest()[:16]+'.png'
                picture.save(assets/token);n['asset']='/native-assets/'+token
        for c in n.get('children',[]):process(c)
    process(node);pages[name]=node
(root/'app/native-pages.json').write_text(json.dumps(pages,ensure_ascii=False,separators=(',',':')),encoding='utf-8')
print('Imported',len(pages),'native screens')
