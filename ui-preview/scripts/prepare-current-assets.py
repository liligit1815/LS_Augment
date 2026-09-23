"""Keep current source copy and source images reproducible; never replace the old baseline."""
from pathlib import Path
import re,json
from PIL import Image
root=Path(__file__).resolve().parents[2]
s=(root/'android/app/src/main/java/ls/augment/com/ModuleLegal.java').read_text(encoding='utf-8')
body=s.split('private static final String[][] SECTIONS = {')[1].split('\n    };')[0]
rows=[]
for item in re.findall(r'\{([^{}]+)\}',body):
    vals=[json.loads('"'+x+'"') for x in re.findall(r'"((?:\\.|[^"\\])*)"',item)]
    rows.append([vals[0],''.join(vals[1:])])
(root/'ui-preview/app/current-legal.json').write_text(json.dumps(rows,ensure_ascii=False),encoding='utf-8')
im=Image.open(root/'outputs/ui-refresh-20288/screens/04-home.png')
for name,top in zip(['system','systemui','settings','launcher'],[1280,1558,1836,2113]):
    im.crop((96,top,236,top+140)).save(root/f'ui-preview/public/current/app-{name}.png')
print('Prepared',len(rows),'legal sections and 4 observed app icons')
