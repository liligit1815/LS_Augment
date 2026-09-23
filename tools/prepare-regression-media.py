"""Create deterministic disposable media and real import documents for device tests."""
import base64
import hashlib
import io
import json
from PIL import Image, ImageDraw
from adb_regression import *

folder=OUTPUT/'media-fixtures';folder.mkdir(exist_ok=True)
image=Image.new('RGBA',(256,256),(0,0,0,0));draw=ImageDraw.Draw(image)
draw.rounded_rectangle((12,12,244,244),radius=35,fill='#1177cc')
draw.rectangle((52,52,102,204),fill='white');draw.rectangle((102,154,202,204),fill='white')
buffer=io.BytesIO();image.save(buffer,format='PNG');png=buffer.getvalue()
font=adb('exec-out','cat /system/fonts/RobotoStatic-Regular.ttf')
pngHash=hashlib.sha256(png).hexdigest();fontHash=hashlib.sha256(font).hexdigest()
(folder/'test-icon.png').write_bytes(png);(folder/'test-font.ttf').write_bytes(font)
def document(settings,images=None,fonts=None):
    return {'format':'LS_Augment.settings','version':1,'settings':settings,'images':images or {},'fonts':fonts or {}}
cases={
    'media-valid':document({'ls_augment_tile_icon':pngHash,'ls_augment_tile_label':'ADB_MEDIA','ls_augment_rm_lock_clock_font':'font:'+fontHash},
                          {pngHash:base64.b64encode(png).decode()},{fontHash:base64.b64encode(font).decode()}),
    'media-bad-hash':document({'ls_augment_tile_icon':'1'*64,'ls_augment_tile_label':'MUST_NOT_SAVE'},
                             {'1'*64:base64.b64encode(png).decode()}),
    'media-bad-font':document({'ls_augment_rm_lock_clock_font':'font:'+'2'*64,'ls_augment_tile_label':'MUST_NOT_SAVE'},
                             fonts={'2'*64:base64.b64encode(b'not a font - regression fixture').decode()}),
    'media-clear':document({'ls_augment_tile_icon':'','ls_augment_tile_label':'LS_Augment','ls_augment_rm_lock_clock_font':''})
}
for name,value in cases.items():
    file=folder/('LSA-regression-'+name+'-20260908.json')
    file.write_text(json.dumps(value,ensure_ascii=False),encoding='utf-8')
    adb('push',file,'/sdcard/Download/'+file.name)
(folder/'hashes.json').write_text(json.dumps({'png':pngHash,'font':fontHash}),encoding='utf-8')
print(json.dumps({'imageBytes':len(png),'fontBytes':len(font),'caseFiles':len(cases),'folder':str(folder)}))
