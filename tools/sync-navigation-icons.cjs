// Match the approved prototype's Lucide geometry. Keep the ISC attribution in each vector.
const fs=require('node:fs'),path=require('node:path');
const root=path.resolve(__dirname,'..'),modules=path.join(root,'ui-preview/node_modules');
const React=require(path.join(modules,'react')),render=require(path.join(modules,'react-dom/server')).renderToStaticMarkup;
const icons=require(path.join(modules,'lucide-react'));
const names=['Palette','Moon','Volume2','Download','Shield','AppWindow','Gamepad2','Fan','AudioLines','HeartPulse','Layers','Fingerprint','Usb'];
const destination=path.join(root,'android/app/src/main/res/drawable');
function geometry(tag,a){
  if(tag==='path')return a.d;
  if(tag==='line')return `M${a.x1} ${a.y1}L${a.x2} ${a.y2}`;
  if(tag==='polyline'||tag==='polygon')return `M${a.points.trim().replace(/\s+/g,' L')}${tag==='polygon'?'Z':''}`;
  if(tag==='circle'){const x=+a.cx,y=+a.cy,r=+a.r;return `M${x-r} ${y}a${r} ${r} 0 1 0 ${2*r} 0a${r} ${r} 0 1 0 ${-2*r} 0`;}
  if(tag==='rect'){const x=+(a.x||0),y=+(a.y||0),w=+a.width,h=+a.height,r=+(a.rx||0);return r?`M${x+r} ${y}h${w-2*r}a${r} ${r} 0 0 1 ${r} ${r}v${h-2*r}a${r} ${r} 0 0 1 ${-r} ${r}h${2*r-w}a${r} ${r} 0 0 1 ${-r} ${-r}v${2*r-h}a${r} ${r} 0 0 1 ${r} ${-r}Z`:`M${x} ${y}h${w}v${h}h${-w}Z`;}
  throw Error(`Unsupported SVG geometry: ${tag}`);
}
for(const name of names){
  const svg=render(React.createElement(icons[name])),paths=[];
  for(const m of svg.matchAll(/<(path|line|polyline|polygon|circle|rect)\s+([^>]+)>/g)){
    const a=Object.fromEntries([...m[2].matchAll(/([\w-]+)="([^"]*)"/g)].map(x=>[x[1],x[2]]));
    paths.push(`<path android:pathData="${geometry(m[1],a)}" android:fillColor="#00000000" android:strokeColor="#FF1F74C5" android:strokeWidth="1.9" android:strokeLineCap="round" android:strokeLineJoin="round"/>`);
  }
  if(!paths.length)throw Error(`No geometry for ${name}`);
  const filename='ice_'+name.replace(/([a-z])([A-Z])/g,'$1_$2').toLowerCase()+'.xml';
  fs.writeFileSync(path.join(destination,filename),'<!-- Lucide icons, ISC license. Generated from installed lucide-react; geometry unmodified. -->\n<vector xmlns:android="http://schemas.android.com/apk/res/android" android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">\n'+paths.join('\n')+'\n</vector>\n');
}
