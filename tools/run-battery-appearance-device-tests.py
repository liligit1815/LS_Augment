"""Compare actual battery geometry and composited color in the current physical charging state."""
import json
import numpy as np
from PIL import Image
from statusbar_device_helpers import *

folder=OUTPUT/'round15m-battery-appearance-results';folder.mkdir(exist_ok=True)
require_systemui_build(folder.name)
results=[];images={}
def sample(name,settings):
    label='round15m-battery-'+name;configure(label,settings);o=observe(label)
    a=np.array(Image.open(OUTPUT/label/'screen.png').convert('RGB'))[:156].astype(int)
    images[name]=a
    m=a.min(2)<170;y,x=np.where(m)
    # The native drawable applies another 68/255 alpha to its fill. Compare
    # the actual composited hue, not fully saturated source-color RGB bytes.
    magenta=(a[:,:,0]-a[:,:,1]>30)&(a[:,:,2]-a[:,:,1]>30)
    cyan=(a[:,:,1]-a[:,:,0]>35)&(a[:,:,2]-a[:,:,0]>35)
    red_over_green=a[:,:,0]-a[:,:,1];tinted=red_over_green[(red_over_green>10)&(a[:,:,2]-a[:,:,1]>10)]
    r={'case':name,'ink':[int(x.min()),int(y.min()),int(x.max()+1),int(y.max()+1)] if len(x) else None,
       'pixels':int(m.sum()),'magentaPixels':int(magenta.sum()),'cyanPixels':int(cyan.sum()),
       'magentaStrength':float(np.percentile(tinted,95)) if len(tinted) else 0,
       'nativeDescription':[n['description'] for n in by_id(o,'mfv_battery_meterview')],'result':'observed'}
    results.append(r);save();print(name,r,flush=True);return r
def save():(folder/'results.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8')
def check(r,condition,detail):
    r['result']='pass' if condition else 'failed';r['check']=detail;save();assert condition,r
base=sample('width0',{'systemui_master':1,'statusbar_grid_v2':grid({'battery':{'zone':'RS','size':20}},only=['battery']),
    'statusbar_height_dp':48,'rm_battery_style':4,'rm_battery_colors':0,'rm_battery_alpha_percent':100,'rm_battery_width_dp':0})
wide=sample('width100',{'rm_battery_width_dp':100})
check(wide,wide['ink'][0]<base['ink'][0]-150 and abs(wide['ink'][3]-wide['ink'][1]-base['ink'][3]+base['ink'][1])<=2,'100 dp reserves more space without changing icon height')
small=sample('width20',{'rm_battery_width_dp':20})
check(small,small['ink'][2]-small['ink'][0]<=67 and small['ink'][3]-small['ink'][1]<40,'Narrow fixed width scales the complete icon proportionally')
again=sample('width-restored',{'rm_battery_width_dp':0})
check(base,base['ink']==again['ink'],'Original geometry returns')
check(again,base['ink']==again['ink'],'Zero width restores automatic size')
transparent=sample('color-alpha0',{'rm_battery_colors':1,'rm_battery_charging_color':'#00FF00FF','rm_battery_color_2':'#FF0000FF'})
mag=sample('charging-magenta',{'rm_battery_charging_color':'#FFFF00FF'})
check(mag,mag['magentaPixels']>200 and any('正在充电' in x for x in mag['nativeDescription']),'Actual charging state uses its chosen magenta color')
opaque=images['charging-magenta'];mask=(opaque[:,:,0]-opaque[:,:,1]>30)&(opaque[:,:,2]-opaque[:,:,1]>30)
def contrast(result):
    signal=images['color-alpha0'][:,:,1]-images[result['case']][:,:,1]
    result['colorContrast']=float(np.median(signal[mask]));save();return result['colorContrast']
full=contrast(mag)
check(transparent,transparent['magentaPixels']==0 and full>50,'Zero color alpha removes the tint; original native border and charge symbol remain')
half=sample('color-alpha128',{'rm_battery_charging_color':'#80FF00FF'})
check(half,full*.4<contrast(half)<full*.65,'Color alpha halves the actual contrast against the transparent-color reference')
quarter=sample('combined-alpha',{'rm_battery_alpha_percent':50})
check(quarter,half['colorContrast']*.35<contrast(quarter)<half['colorContrast']*.65,'Icon opacity composes with color alpha')
cyan=sample('charging-cyan',{'rm_battery_alpha_percent':100,'rm_battery_charging_color':'#FF00FFFF'})
check(cyan,cyan['cyanPixels']>200 and cyan['magentaPixels']==0,'Changing the charging color refreshes the actual native icon')
off=sample('color-off',{'rm_battery_colors':0})
check(off,off['magentaPixels']==0 and off['cyanPixels']==0,'Disabling custom color restores native color')
print('Ten actual battery appearance cases passed')
