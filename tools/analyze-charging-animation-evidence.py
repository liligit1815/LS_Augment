"""Use decoded frame timestamps, never nominal FPS, for Android VFR recordings."""
import sys,json,subprocess,shutil
from pathlib import Path
import cv2
from PIL import Image,ImageDraw
from adb_regression import OUTPUT
P=sys.argv[1];imageInterval=float(sys.argv[2]) if len(sys.argv)>2 else 2;p=OUTPUT/P;meta=json.loads((p/'recording.json').read_text(encoding='utf-8'))
settings=meta['settings'];wake=next(e['hostMonotonic'] for e in meta['events'] if e['name']=='wake-request')-meta['recordCommandAt']
video=p/'screen.mp4';probe=p/'ffprobe-frame-timestamps.json'
if not probe.exists() or probe.stat().st_mtime<video.stat().st_mtime:
    raw=subprocess.run([shutil.which('ffprobe') or 'C:/Users/lilil/AppData/Local/Microsoft/WinGet/Links/ffprobe.exe','-v','error','-select_streams','v:0','-show_frames','-show_entries','frame=pts_time,best_effort_timestamp_time','-of','json',str(video)],capture_output=True,check=True,timeout=180).stdout
    probe.write_bytes(raw)
times=[float(f.get('best_effort_timestamp_time',f.get('pts_time'))) for f in json.loads(probe.read_text(encoding='utf-8'))['frames']]
assert all(times[i]>times[i-1] for i in range(1,len(times))), 'Nonmonotonic original video timestamps'
for name in ['reviewed-results.json','frame-observations.json']:
    prior=p/name;backup=p/name.replace('.json','-opencv.json')
    if prior.exists() and not backup.exists():shutil.copy2(prior,backup)
v=cv2.VideoCapture(str(video));samples=[];images=[];nextImage=0;edges={};lastFrame=None;previous=None
def preview(a):
    im=Image.fromarray(cv2.cvtColor(a,cv2.COLOR_BGR2RGB));im.thumbnail((304,672));return im
while True:
    ok,a=v.read()
    if not ok:break
    # OpenCV returns zero for this encoder's final buffered frames. Associate
    # sequentially decoded pixels with their original ffprobe presentation time.
    t=times[len(samples)];roi=a[600:1800,200:1000].astype('int16')
    blue=int(((roi[:,:,0]-roi[:,:,2]>35)&(roi[:,:,1]-roi[:,:,2]>20)).sum())
    samples.append({'seconds':t,'bluePixels':blue})
    if t>wake+.1 and blue>12000:
        if 'firstRing' not in edges:
            if previous is not None:edges['beforeRing']=previous
            edges['firstRing']=(t,a)
        edges['lastRing']=(t,a);edges.pop('afterRing',None)
    elif 'lastRing' in edges and 'afterRing' not in edges:edges['afterRing']=(t,a)
    if t>=nextImage:
        im=Image.fromarray(cv2.cvtColor(a,cv2.COLOR_BGR2RGB));im.thumbnail((152,336));images.append((t,im));nextImage+=imageInterval
    previous=(t,a) if 'firstRing' not in edges else None
    lastFrame=a
v.release();assert len(samples)==len(times),(len(samples),len(times))
if images[-1][0]<samples[-1]['seconds']:
    im=preview(lastFrame);im.thumbnail((152,336));images.append((samples[-1]['seconds'],im))
(p/'frame-observations.json').write_text(json.dumps(samples),encoding='utf-8')
ring=[s['seconds'] for s in samples if s['seconds']>wake+.1 and s['bluePixels']>12000]
expected=bool(settings['enabled'] and settings.get('everyWake',1) and settings.get('unlockAfter',-1)<0)
result={'case':P,'settings':settings,'wakeRequestOnVideoAxis':wake,'animationExpected':expected,'frames':len(samples),'ringFrames':len(ring),'method':'Sequential decoded pixels paired with original ffprobe presentation timestamps; native blue ring pixels and visible before/after boundary frames.'}
if ring:
    result.update(firstRingSeconds=ring[0],lastRingSeconds=ring[-1],visibleSpanSeconds=ring[-1]-ring[0],delayFromWake=ring[0]-wake)
    result['offFrameAfterAnimation']=edges.get('afterRing',(None,))[0]
    result['pass']=expected and settings['delay']-.2<=ring[0]-wake<=settings['delay']+1.5 and abs((ring[-1]-ring[0])-settings['duration'])<.8 and 'afterRing' in edges
else:result['pass']=not expected
(p/'reviewed-results.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
sheet=Image.new('RGB',(1216,360*((len(images)+3)//4)),'#eeeeee');draw=ImageDraw.Draw(sheet)
for i,(t,im) in enumerate(images):
    x=(i%4)*304+75;y=(i//4)*360+20;sheet.paste(im,(x,y));draw.text((x,y-18),str(round(t,2))+' sec',fill='black')
sheet.save(p/'reviewed-timeline.jpg');print(result,flush=True)
if edges:
    edges['lastVideoFrame']=(samples[-1]['seconds'],lastFrame)
    sheet=Image.new('RGB',(305*len(edges),704),'#eeeeee');draw=ImageDraw.Draw(sheet)
    for i,(name,(t,frame)) in enumerate(edges.items()):
        sheet.paste(preview(frame),(i*305,26));draw.text((i*305+5,6),name+' '+str(round(t,3))+' sec',fill='black')
    sheet.save(p/'reviewed-boundaries.jpg',quality=95)
assert result['pass'],result
