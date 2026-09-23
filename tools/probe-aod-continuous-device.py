"""Capture actual AOD frames across its native timeout, without UiAutomation delays."""
import sys,json,time,io
from PIL import Image,ImageDraw
import numpy as np
from adb_regression import OUTPUT,adb,shell,instrument
from aod_device_helpers import select_native,restore_native,config,RESTORE
P=sys.argv[1];enabled=int(sys.argv[2]);folder=OUTPUT/P;folder.mkdir(exist_ok=True)
rows=[];tiles=[]
try:
    select_native(6,P+'style');config(P,{'seconds':enabled,'period':enabled})
    shell('input keyevent 223');start=time.monotonic()
    for i in range(40):
        raw=adb('exec-out','screencap -p');elapsed=time.monotonic()-start
        (folder/f'frame-{i:02d}.png').write_bytes(raw)
        im=Image.open(io.BytesIO(raw)).convert('RGB');a=np.asarray(im)
        rows.append({'frame':i,'seconds':elapsed,'whitePixels':int((a.max(axis=2)>100).sum()),'leftClockPixels':int((a[420:720,0:350].max(axis=2)>100).sum()),'datePixels':int((a[440:710,1010:1200].max(axis=2)>100).sum())})
        crop=im.crop((0,390,1216,850));crop.thumbnail((365,138));tiles.append((elapsed,crop))
        time.sleep(.25)
    (folder/'frames.json').write_text(json.dumps(rows,indent=2),encoding='utf-8')
    sheet=Image.new('RGB',(1104,168*((len(tiles)+2)//3)),'#333333');d=ImageDraw.Draw(sheet)
    for i,(elapsed,im) in enumerate(tiles):
        x=i%3*368;y=i//3*168;sheet.paste(im,(x,y+22));d.text((x+3,y+3),f'{i}: {elapsed:.2f}s',fill='white')
    sheet.save(folder/'timeline.jpg')
    print(rows,flush=True)
finally:
    instrument('set',P+'restore',RESTORE);restore_native(P+'style');shell('input keyevent 224');shell('wm dismiss-keyguard')
