"""Production clock measurement + Geometry restoration under an adaptive-layout fallback.

The native parent centers its child before the grid's pre-draw pass. Exercise the
actual measurement block and actual Geometry class; no ADB/device access.
"""
from pathlib import Path
import os, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
SOURCE=ROOT/'android/app/src/main/java/ls/augment/com/hook/StatusBarGridHook.java'

def extract(source, marker):
    start=source.index(marker);end=source.index('{',start)+1;depth=1
    while depth:
        depth+=(source[end]=='{')-(source[end]=='}');end+=1
    return source[start:end]

source=SOURCE.read_text(encoding='utf-8')
geometry=extract(source,'private static final class Geometry {')
measurement=extract(source,'if(id.equals("clock")||text.isLayoutRequested()||text.getWidth()==0||text.getHeight()==0)')
harness=r'''
import java.util.*;
import ls.augment.com.StatusBarAdaptiveLayout;
import ls.augment.com.StatusBarGridLayout;
public class TestStatusBarClockFallbackGeometry {
 static class View {
  int left,top,right,bottom,mw,mh,measureCalls,layoutCalls,invalidations;boolean requested;
  float x,y,sx=1,sy=1,alpha=1;
  static class MeasureSpec {static final int EXACTLY=0x40000000,UNSPECIFIED=0;static int makeMeasureSpec(int size,int mode){return size|mode;}static int getSize(int spec){return spec&0x3fffffff;}}
  float getTranslationX(){return x;}float getTranslationY(){return y;}float getScaleX(){return sx;}float getScaleY(){return sy;}float getAlpha(){return alpha;}
  void setTranslationX(float value){x=value;}void setTranslationY(float value){y=value;}void setScaleX(float value){sx=value;}void setScaleY(float value){sy=value;}void setAlpha(float value){alpha=value;}
  int getLeft(){return left;}int getTop(){return top;}int getRight(){return right;}int getBottom(){return bottom;}int getWidth(){return right-left;}int getHeight(){return bottom-top;}
  int getMeasuredWidth(){return mw;}int getMeasuredHeight(){return mh;}
  void layout(int l,int t,int r,int b){layoutCalls++;left=l;top=t;right=r;bottom=b;requested=false;}
  void measure(int w,int h){measureCalls++;mw=MeasureSpec.getSize(w);mh=MeasureSpec.getSize(h);}
  void invalidate(){invalidations++;}boolean isLayoutRequested(){return requested;}
 }
 static class ViewGroup {static class LayoutParams {int width=-2;}}
 static class TextView extends View {
  int desiredWidth=198,desiredHeight=99;boolean failOnce;ViewGroup.LayoutParams params=new ViewGroup.LayoutParams();
  ViewGroup.LayoutParams getLayoutParams(){return params;}void scrollTo(int x,int y){}
  @Override void measure(int w,int h){super.measure(w,h);if((w&MeasureSpec.EXACTLY)==0)mw=desiredWidth;if((h&MeasureSpec.EXACTLY)==0)mh=desiredHeight;if(failOnce){failOnce=false;throw new IllegalStateException("native measurement failed");}}
 }
 // GEOMETRY
 static void measureClock(TextView text,Geometry state){String id="clock";
 // MEASUREMENT
 }
 static int checks;
 static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
 static TextView nativeClock(){TextView view=new TextView();nativeLayout(view,0,79,101,49);view.x=2;view.y=3;return view;}
 static void nativeLayout(TextView v,int left,int top,int width,int height){v.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(height,View.MeasureSpec.EXACTLY));v.layout(left,top,left+width,top+height);}
 static void expected(TextView v,int left,int top,int width,int height,String reason){
  check(v.getLeft()==left&&v.getTop()==top&&v.getWidth()==width&&v.getHeight()==height,reason+" frame expected="+left+","+top+","+width+","+height+" actual="+v.getLeft()+","+v.getTop()+","+v.getWidth()+","+v.getHeight());
  check(v.getMeasuredWidth()==width&&v.getMeasuredHeight()==height,reason+" measured dimensions must return to the native parent's allocation");
 }
 public static void main(String[] args){
  TextView clock=nativeClock();Geometry g=new Geometry(clock);measureClock(clock,g);
  check(clock.getWidth()==198&&clock.getHeight()==99,"actual pre-draw block reserves complete enlarged text");
  // Crowded adaptive packing returns before move()/mark(). The original failure path.
  StatusBarAdaptiveLayout.Result crowded=StatusBarAdaptiveLayout.pack(List.of(new StatusBarGridLayout.Node("clock","CS",0,198,62),new StatusBarGridLayout.Node("system_icons","RS",1,600,42)),1216,208,13,13,0,0,0,0,0);
  check(!crowded.valid,"actual adaptive solver rejects centered clock beside overfull right-side icons");
  if(!crowded.valid)g.restore(clock);expected(clock,0,79,101,49,"crowded first frame");
  check(clock.x==2&&clock.y==3,"native translation retained");
  int layouts=clock.layoutCalls,measures=clock.measureCalls;g.restore(clock);
  check(clock.layoutCalls==layouts&&clock.measureCalls==measures,"idempotent cleanup performs no layout/measurement writes");
  // A successful custom placement followed by later crowding must also restore.
  g=new Geometry(clock);measureClock(clock,g);clock.x=500;clock.y=40;clock.sx=1.2f;clock.sy=1.2f;g.mark(clock);
  for(int frame=0;frame<60;frame++){g.observe(clock);measureClock(clock,g);g.mark(clock);}
  g.restore(clock);expected(clock,0,79,101,49,"repeated custom frames do not become the native baseline");
  check(clock.x==2&&clock.y==3&&clock.sx==1&&clock.sy==1,"successful custom transforms restored");
  // The OEM can change its allocation while the grid is active (rotation/font/status bar size).
  g=new Geometry(clock);measureClock(clock,g);g.mark(clock);
  nativeLayout(clock,11,96,130,56);g.observe(clock);measureClock(clock,g);g.mark(clock);g.restore(clock);
  expected(clock,11,96,130,56,"latest native remeasure and layout replace old geometry");
  // A late native update before cleanup must win without needing a grid observe pass.
  g=new Geometry(clock);measureClock(clock,g);g.mark(clock);nativeLayout(clock,17,24,88,44);g.restore(clock);
  expected(clock,17,24,88,44,"late native frame preserved during release");
  // Geometry that never resized a native icon must not own or overwrite its frame.
  TextView icon=nativeClock();g=new Geometry(icon);nativeLayout(icon,8,10,60,40);int count=icon.layoutCalls;g.restore(icon);
  expected(icon,8,10,60,40,"untouched icon layout preserved");check(icon.layoutCalls==count,"no unrelated frame writes");
  // The finally block must record partial measurement when native text measurement throws.
  clock=nativeClock();g=new Geometry(clock);clock.failOnce=true;
  try{measureClock(clock,g);throw new AssertionError("expected native failure");}catch(IllegalStateException expected){}
  g.restore(clock);expected(clock,0,79,101,49,"partial failed measurement restored");
  System.out.println("Status-bar clock fallback geometry: "+checks+" production measurement/restoration assertions passed");
 }
}
'''.replace('// GEOMETRY',geometry).replace('// MEASUREMENT',measurement)
with tempfile.TemporaryDirectory(prefix='lsa-clock-fallback-') as tmp:
    path=Path(tmp)/'TestStatusBarClockFallbackGeometry.java';path.write_text(harness,encoding='utf-8')
    java=Path(os.environ['JAVA_HOME'])/'bin' if os.environ.get('JAVA_HOME') else None
    def binary(name):return str(java/(name+('.exe' if os.name=='nt' else ''))) if java else name
    models=SOURCE.parent.parent
    subprocess.run([binary('javac'),'-encoding','UTF-8','--release','17','-d',tmp,str(path),str(models/'StatusBarAdaptiveLayout.java'),str(models/'StatusBarGridLayout.java')],check=True)
    subprocess.run([binary('java'),'-cp',tmp,'TestStatusBarClockFallbackGeometry'],check=True,timeout=20)
