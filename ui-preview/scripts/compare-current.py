from pathlib import Path
from PIL import Image,ImageCms
import io,sys
root=Path(__file__).resolve().parents[2]
name=sys.argv[1];source=sys.argv[2]
folder=root/'outputs/prototype-current'
im=Image.open(folder/f'web-{name}-full.png')
if im.info.get('icc_profile'):
    im=ImageCms.profileToProfile(im,ImageCms.ImageCmsProfile(io.BytesIO(im.info['icc_profile'])),ImageCms.createProfile('sRGB'),outputMode='RGB')
ratio=im.width/1000
im=im.crop(tuple(round(v*ratio) for v in (313,42,687,869))).resize((374,827),Image.Resampling.LANCZOS)
im.save(folder/f'web-{name}.png')
native=Image.open(root/'outputs/ui-refresh-20288/screens'/source).convert('RGB').resize((374,827))
out=Image.new('RGB',(748,827),'white');out.paste(native,(0,0));out.paste(im,(374,0));out.save(folder/f'compare-{name}.png')
print(folder/f'compare-{name}.png')
