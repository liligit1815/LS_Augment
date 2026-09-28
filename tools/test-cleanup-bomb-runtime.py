"""Execute the real cleanup hook with a fake clock and OEM task selection; never clears real tasks."""
from pathlib import Path
import ast
import subprocess
import tempfile
ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
tree=ast.parse((ROOT/'tools/test-back-gesture-runtime.py').read_text(encoding='utf-8'))
base=next(ast.literal_eval(n.value) for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='files' for t in n.targets))
files={k:v for k,v in base.items() if k.startswith('android/') or k.startswith('io/') or k.endswith('/AugmentModule.java')}
files.update({
'android/content/Context.java': 'package android.content;public class Context{public String getPackageName(){return "launcher";}}',
'android/content/res/Resources.java': 'package android.content.res;public class Resources{public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}public int getIdentifier(String n,String t,String p){return 1;}}',
'android/graphics/Color.java': 'package android.graphics;public class Color{public static int argb(int a,int r,int g,int b){return a<<24|r<<16|g<<8|b;}}',
'android/graphics/ColorFilter.java': 'package android.graphics;public class ColorFilter{}',
'android/graphics/PixelFormat.java': 'package android.graphics;public class PixelFormat{public static final int TRANSLUCENT=-3;}',
'android/graphics/Typeface.java': 'package android.graphics;public class Typeface{public static final int BOLD=1;public static Typeface create(String s,int w){return new Typeface();}}',
'android/graphics/Paint.java': '''package android.graphics;public class Paint{public static final int ANTI_ALIAS_FLAG=1;public enum Style{FILL,STROKE}public enum Cap{ROUND}public enum Align{CENTER}public Paint(int f){}public void setStyle(Style s){}public void setStrokeWidth(float f){}public void setStrokeCap(Cap c){}public void setColor(int c){}public void setTypeface(Typeface t){}public void setTextAlign(Align a){}public void setTextSize(float s){}public float ascent(){return -20;}}''',
'android/graphics/Path.java': 'package android.graphics;public class Path{public void moveTo(float x,float y){}public void cubicTo(float a,float b,float c,float d,float e,float f){}}',
'android/graphics/Rect.java': 'package android.graphics;public class Rect{public int left,top,right,bottom;public void set(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}public int width(){return right-left;}public int height(){return bottom-top;}public float exactCenterX(){return (left+right)/2f;}public float exactCenterY(){return (top+bottom)/2f;}}',
'android/graphics/Canvas.java': '''package android.graphics;public class Canvas{public boolean clipped;public int circles;public int save(){return 1;}public void restoreToCount(int n){clipped=false;}public void clipRect(int a,int b,int c,int d){clipped=true;}public void rotate(float a,float x,float y){}public void drawCircle(float x,float y,float r,Paint p){circles++;}public void drawOval(float a,float b,float c,float d,Paint p){}public void drawPath(Path p,Paint paint){}public void drawText(String s,float x,float y,Paint p){}}''',
'android/graphics/drawable/Drawable.java': '''package android.graphics.drawable;import android.graphics.*;public abstract class Drawable{private final Rect bounds=new Rect();public void setBounds(int a,int b,int c,int d){bounds.set(a,b,c,d);}public Rect getBounds(){return bounds;}public void invalidateSelf(){}public abstract void draw(Canvas c);public abstract void setAlpha(int a);public abstract void setColorFilter(ColorFilter f);public abstract int getOpacity();}''',
'android/view/View.java': '''package android.view;import java.util.*;public class View{
 public int width=1080,height=2400,visibility;public float alpha=1;public boolean attached=true,shown=true;public View root=this,child;public final Overlay overlay=new Overlay();public List<OnAttachStateChangeListener> listeners=new ArrayList<>();
 public interface OnAttachStateChangeListener{void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}
 public static class Overlay{public boolean fail;public List<android.graphics.drawable.Drawable> items=new ArrayList<>();public void add(android.graphics.drawable.Drawable d){if(fail)throw new IllegalStateException("no overlay");items.add(d);}public void remove(android.graphics.drawable.Drawable d){items.remove(d);}}
 public android.content.Context getContext(){return new android.content.Context();}public android.content.res.Resources getResources(){return new android.content.res.Resources();}
 public int getWidth(){return width;}public int getHeight(){return height;}public void getLocationOnScreen(int[] p){p[0]=100;p[1]=1800;}public boolean isAttachedToWindow(){return attached;}public boolean isShown(){return shown;}public View getRootView(){return root;}
 public Overlay getOverlay(){return overlay;}public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.add(l);}public void removeOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.remove(l);}public View findViewById(int id){return child;}
 public float getAlpha(){return alpha;}public void setAlpha(float a){alpha=a;}public void detach(){attached=false;for(var l:new ArrayList<>(listeners))l.onViewDetachedFromWindow(this);}
}''',
'android/widget/ImageView.java': 'package android.widget;public class ImageView extends android.view.View{android.graphics.drawable.Drawable image;public android.graphics.drawable.Drawable getDrawable(){return image;}public void setImageDrawable(android.graphics.drawable.Drawable d){image=d;}}',
'android/widget/Toast.java': 'package android.widget;public class Toast{public static final int LENGTH_SHORT=0;public static Toast makeText(android.content.Context c,String s,int t){return new Toast();}public void show(){}}',
'android/view/animation/LinearInterpolator.java':'package android.view.animation;public class LinearInterpolator{}',
'android/animation/Animator.java':'package android.animation;public class Animator{}',
'android/animation/AnimatorListenerAdapter.java':'package android.animation;public class AnimatorListenerAdapter{public void onAnimationEnd(Animator a){}}',
'android/animation/ValueAnimator.java':'''package android.animation;public class ValueAnimator extends Animator{
 public static boolean enabled=true;public static ValueAnimator last;float value;public long duration;public boolean cancelled;public interface Update{void run(ValueAnimator a);}Update update;AnimatorListenerAdapter listener;
 public static ValueAnimator ofFloat(float...v){last=new ValueAnimator();return last;}public static boolean areAnimatorsEnabled(){return enabled;}public void setDuration(long n){duration=n;}public void setInterpolator(Object i){}public void addUpdateListener(Update u){update=u;}public void addListener(AnimatorListenerAdapter a){listener=a;}public void start(){}public Object getAnimatedValue(){return value;}public void cancel(){cancelled=true;if(listener!=null)listener.onAnimationEnd(this);}public void tick(float v){value=v;update.run(this);if(v>=1&&listener!=null)listener.onAnimationEnd(this);}
}''',
'ls/augment/com/LauncherOptions.java':'package ls.augment.com;public class LauncherOptions{public static final String CLEANUP_BOMB="bomb";}',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;public class FeatureSettings{public static boolean on;public static java.util.List<Runnable> listeners=new java.util.ArrayList<>();static boolean enabled(android.content.Context c,String k){return on;}static void addSnapshotListener(android.content.Context c,Runnable r){listeners.add(r);}static void removeSnapshotListener(Runnable r){listeners.remove(r);}}''',
'com/android/quickstep/views/ClearAllButton.java':'package com.android.quickstep.views;public class ClearAllButton extends android.view.View{public int draws;public void draw(android.graphics.Canvas c){draws++;}}',
'com/android/quickstep/views/OverviewActionsView.java':'package com.android.quickstep.views;public class OverviewActionsView extends android.view.View{public void onFinishInflate(){}}',
'com/android/quickstep/views/RecentsView.java':'''package com.android.quickstep.views;import android.view.View;import ls.augment.com.hook.AugmentModule;public class RecentsView extends View{
 public boolean mOverviewStateEnabled=true,fail;public int calls,unlocked=3,locked=2,cleanups;public long duration;
 public void dismissAllTasks(View source)throws Throwable{calls++;if(fail)throw new IllegalStateException("oem");AugmentModule.call(this,RecentsView.class,"createAllTasksDismissAnimation",new Class[]{long.class},300L);unlocked=0;cleanups++;}
 public Object createAllTasksDismissAnimation(long millis){duration=millis;return new Object();}
}''',
'ls/augment/com/hook/TestCleanupBomb.java':'''package ls.augment.com.hook;import android.view.*;import android.animation.*;import android.graphics.*;import com.android.quickstep.views.*;public class TestCleanupBomb{
 static int checks;static void check(boolean ok,String s){checks++;if(!ok)throw new AssertionError(s);}static void click(RecentsView r,View b)throws Throwable{AugmentModule.call(r,RecentsView.class,"dismissAllTasks",new Class[]{View.class},b);}
 public static void main(String[] args)throws Throwable{AugmentModule m=new AugmentModule();AugmentModule.active=m;LauncherCleanupBombHook.install(m,TestCleanupBomb.class.getClassLoader());
 View button=new View();RecentsView nativeView=new RecentsView();FeatureSettings.on=false;click(nativeView,button);check(nativeView.calls==1&&nativeView.duration==300,"disabled keeps original timing");
 FeatureSettings.on=true;RecentsView r=new RecentsView();click(r,button);ValueAnimator a=ValueAnimator.last;check(r.calls==0&&button.alpha==1&&r.overlay.items.size()==1,"flight precedes OEM cleanup and preserves source visibility");
 click(r,button);check(ValueAnimator.last==a&&r.calls==0,"double tap does not create another flight");a.tick(.47f);check(r.calls==0,"no early cleanup");a.tick(.48f);check(r.calls==1&&r.cleanups==1&&r.unlocked==0&&r.locked==2&&r.duration==300,"explosion invokes OEM once, locked tasks preserved, native transition timing preserved");a.tick(.8f);a.tick(1);check(r.calls==1&&r.overlay.items.isEmpty()&&button.alpha==1,"animation ends without another cleanup or residue");
 r=new RecentsView();click(r,button);a=ValueAnimator.last;r.detach();a.tick(.8f);check(r.calls==0&&r.overlay.items.isEmpty()&&button.alpha==1,"detach cancels pending cleanup");
 r=new RecentsView();click(r,button);a=ValueAnimator.last;r.mOverviewStateEnabled=false;a.tick(.49f);check(r.calls==0&&r.overlay.items.isEmpty(),"leaving overview while attached cancels cleanup");
 r=new RecentsView();click(r,button);a=ValueAnimator.last;r.width=2400;a.tick(.49f);check(r.calls==0,"rotation cancels pending flight");
 r=new RecentsView();r.overlay.fail=true;click(r,button);check(r.calls==1&&r.duration==300,"overlay failure falls through once");
 ValueAnimator.enabled=false;r=new RecentsView();click(r,button);check(r.calls==1&&r.duration==300,"disabled animations run OEM directly");ValueAnimator.enabled=true;
 r=new RecentsView();r.fail=true;click(r,button);a=ValueAnimator.last;a.tick(.5f);a.tick(1);check(r.calls==1&&r.overlay.items.isEmpty(),"OEM failure never retries mutation");
 OverviewActionsView host=new OverviewActionsView();android.widget.ImageView icon=new android.widget.ImageView();host.child=icon;AugmentModule.call(host,OverviewActionsView.class,"onFinishInflate",new Class[]{});check(icon.getDrawable()!=null,"actual OEM image button changes");FeatureSettings.on=false;for(Runnable changed:new java.util.ArrayList<>(FeatureSettings.listeners))changed.run();check(icon.getDrawable()==null,"disabling restores original image");icon.detach();check(FeatureSettings.listeners.isEmpty(),"icon detach removes config listener");
 System.out.println("PASS cleanup production callbacks: "+checks+" checks; task selection is an OEM fixture, no device mutations");}
}'''
})
files['ls/augment/com/hook/AugmentModule.java']=files['ls/augment/com/hook/AugmentModule.java'].replace('Object proceed()throws Throwable {','Object proceed(Object[] replacement)throws Throwable{args=replacement;return proceed();}Object proceed()throws Throwable {')

# OEM thumbnail doubles exercise production fragment selection and resource lifetime.
files['android/graphics/Canvas.java']=files['android/graphics/Canvas.java'].replace('public boolean clipped;', 'public static int nodes;public static boolean failBitmap;public void drawBitmap(Bitmap b,Rect src,RectF dest,Paint p){if(failBitmap)throw new IllegalStateException("gpu draw");nodes++;}public boolean clipped;public boolean isHardwareAccelerated(){return true;}public int saveLayerAlpha(RectF r,int a){return 1;}public int saveLayerAlpha(float a,float b,float c,float d,int e){return 1;}public void concat(Matrix m){}public void translate(float x,float y){}public void scale(float x,float y,float a,float b){}public void clipPath(Path p){}public void drawRenderNode(RenderNode n){nodes++;}public void drawLine(float a,float b,float c,float d,Paint p){}')
files['android/graphics/Path.java']=files['android/graphics/Path.java'].replace('public void moveTo', 'public void lineTo(float x,float y){}public void close(){}public void moveTo')
files['android/graphics/Matrix.java']='package android.graphics;public class Matrix{public void mapRect(RectF r){}}'
files['android/graphics/RectF.java']='package android.graphics;public class RectF{public RectF(float a,float b,float c,float d){}public boolean intersect(float a,float b,float c,float d){return true;}}'
files['android/graphics/RecordingCanvas.java']='package android.graphics;public class RecordingCanvas extends Canvas{}'
files['android/graphics/RenderNode.java']='package android.graphics;public class RenderNode{public static int recordings,releases;public RenderNode(String s){}public void setPosition(int a,int b,int c,int d){}public RecordingCanvas beginRecording(int w,int h){recordings++;return new RecordingCanvas();}public void endRecording(){}public void discardDisplayList(){releases++;}}'
files['android/view/View.java']=files['android/view/View.java'].replace('public int getWidth()', 'public int getId(){return 42;}public boolean failDraw;public void draw(android.graphics.Canvas c){if(failDraw)throw new IllegalStateException("draw");}public void transformMatrixToGlobal(android.graphics.Matrix m){}public void transformMatrixToLocal(android.graphics.Matrix m){}public int getWidth()')
files['android/graphics/drawable/Drawable.java']=files['android/graphics/drawable/Drawable.java'].replace('private final Rect', 'public int getIntrinsicWidth(){return -1;}public int getIntrinsicHeight(){return -1;}private final Rect')
files['ls/augment/com/LauncherOptions.java']=files['ls/augment/com/LauncherOptions.java'].replace('CLEANUP_BOMB="bomb"','CLEANUP_STYLE="style",CLEANUP_BOMB="bomb"')
files['ls/augment/com/hook/FeatureSettings.java']=files['ls/augment/com/hook/FeatureSettings.java'].replace('public static boolean on;', 'public static boolean on;public static String style="0";static java.util.Map<String,String> snapshot(android.content.Context c){return java.util.Map.of("style",style);}')
files['com/android/quickstep/views/OverviewActionsView.java']='package com.android.quickstep.views;public class OverviewActionsView extends android.view.View{public android.widget.ImageView mClearAllButton;public void onFinishInflate(){}public void onForeColorChanged(int color){mClearAllButton.setImageDrawable(null);}}'
files['com/android/quickstep/views/RecentsView.java']=files['com/android/quickstep/views/RecentsView.java'].replace('public boolean mOverview', 'public View selected=new View(),protectedCard=new View();public int queued;public void addDismissedTaskAnimations(View card,long d,Object pending,boolean dismiss){queued++;}public boolean mOverview').replace('public Object createAllTasksDismissAnimation(long millis){duration=millis;return new Object();}', 'public Object createAllTasksDismissAnimation(long millis)throws Throwable{duration=millis;AugmentModule.call(this,RecentsView.class,"addDismissedTaskAnimations",new Class[]{View.class,long.class,Object.class,boolean.class},selected,millis,new Object(),true);return new Object();}')
files['ls/augment/com/hook/TestCleanupBomb.java']=files['ls/augment/com/hook/TestCleanupBomb.java'].replace('host.child=icon;', 'host.child=icon;host.mClearAllButton=icon;').replace('FeatureSettings.on=false;for(Runnable changed:', 'AugmentModule.call(host,OverviewActionsView.class,"onForeColorChanged",new Class[]{int.class},-1);check(icon.getDrawable()!=null&&FeatureSettings.listeners.size()==1,"OEM theme reset reapplies bomb without duplicate listeners");FeatureSettings.on=false;for(Runnable changed:').replace(' System.out.println(', '''
 FeatureSettings.on=true;FeatureSettings.style="1";r=new RecentsView();click(r,button);a=ValueAnimator.last;check(a.duration==820&&r.calls==0,"particle style waits for impact");a.tick(.06f);check(r.calls==1&&r.queued==1&&View.thumbnailReads==1&&r.locked==2,"only OEM selected card captured, protected cards untouched");r.overlay.items.get(0).draw(new Canvas());check(Canvas.nodes==108,"OEM thumbnail rendered as 108 triangular shards");r.mOverviewStateEnabled=false;a.tick(.7f);check(!r.overlay.items.isEmpty(),"effect survives OEM leaving overview after cleanup");a.tick(1);check(r.calls==1&&r.overlay.items.isEmpty(),"overlay released and cleanup runs once");
 r=new RecentsView();r.selected.failDraw=true;click(r,button);a=ValueAnimator.last;a.tick(.06f);a.tick(1);check(r.cleanups==1&&View.thumbnailReads==2,"thumbnail failure skips fragments and preserves OEM cleanup");
 r=new RecentsView();click(r,button);a=ValueAnimator.last;r.detach();a.tick(.1f);check(r.calls==0&&r.overlay.items.isEmpty(),"particle exit before impact cancels");
 System.out.println(''')
files['ls/augment/com/hook/RecentsParticleEffect.java']=(SRC/'hook/RecentsParticleEffect.java').read_text(encoding='utf-8')
files['android/graphics/Bitmap.java']='package android.graphics;public class Bitmap{public enum Config{ARGB_8888}public boolean recycled;public boolean isRecycled(){return recycled;}}'
files['android/graphics/Paint.java']=files['android/graphics/Paint.java'].replace('public void setStyle','public void setAlpha(int a){}public void setStyle')
files['ls/augment/com/hook/OemHooks.java']='package ls.augment.com.hook;public class OemHooks{static Object invoke(Object o,String name,Object...args)throws ReflectiveOperationException{return o.getClass().getMethod(name).invoke(o);}}'
files['android/view/View.java']=files['android/view/View.java'].replace('public int getId()', 'public static int thumbnailReads;public static class Container{public View target;Container(View v){target=v;}public android.graphics.Bitmap getThumbnail(){thumbnailReads++;if(target.failDraw)throw new IllegalStateException("unavailable");return new android.graphics.Bitmap();}public View getSnapshotView(){return target;}}public java.util.List<Container> getTaskContainers(){return java.util.List.of(new Container(this));}public int getId()')
files['android/graphics/Canvas.java']=files['android/graphics/Canvas.java'].replace('public int save(){return 1;}', 'public int depth;public int save(){return ++depth;}').replace('clipped=false;', 'clipped=false;depth=n-1;')
files['ls/augment/com/hook/TestCleanupBomb.java']=files['ls/augment/com/hook/TestCleanupBomb.java'].replace(' System.out.println(', '''
 r=new RecentsView();View ancestor=new View();r.root=ancestor;click(r,ancestor);a=ValueAnimator.last;check(ancestor.alpha==1,"OEM source can be launcher root without hiding screen");a.tick(.06f);Canvas broken=new Canvas();Canvas.failBitmap=true;ancestor.overlay.items.get(0).draw(broken);Canvas.failBitmap=false;check(broken.depth==0,"bitmap failure restores every canvas save");a.tick(1);check(r.calls==1&&ancestor.overlay.items.isEmpty(),"draw failure does not replay cleanup or leave an overlay");
 System.out.println(''')
# OEM uses the same animation helper for protected-card movement with dismiss=false.
files['com/android/quickstep/views/RecentsView.java']=files['com/android/quickstep/views/RecentsView.java'].replace('return new Object();}', 'AugmentModule.call(this,RecentsView.class,"addDismissedTaskAnimations",new Class[]{View.class,long.class,Object.class,boolean.class},protectedCard,millis,new Object(),false);return new Object();}')
files['android/graphics/Canvas.java']=files['android/graphics/Canvas.java'].replace('public boolean clipped;', 'public int paths;public boolean clipped;').replace('public void drawPath(Path p,Paint paint){}', 'public void drawPath(Path p,Paint paint){paths++;}')
# Current contract: original click executes once synchronously; effects never own surfaces.
files['android/graphics/drawable/AnimatedVectorDrawable.java']='''package android.graphics.drawable;
public class AnimatedVectorDrawable extends Drawable{
 public int starts;public void start(){starts++;}public void draw(android.graphics.Canvas c){}
 public void setAlpha(int a){}public void setColorFilter(android.graphics.ColorFilter f){}public int getOpacity(){return -3;}}
'''
# Match the real OEM onClick: the drawable cast happens BEFORE onRemove/dismissAllTasks.
files['com/android/quickstep/views/OverviewActionsView.java']='''package com.android.quickstep.views;
import android.graphics.drawable.AnimatedVectorDrawable;import ls.augment.com.hook.AugmentModule;
public class OverviewActionsView extends android.view.View {
 public android.widget.ImageView mClearAllButton;public int removes,other;public boolean fail;
 public Runnable duringClick;public void onFinishInflate(){}
 public void onForeColorChanged(int color){mClearAllButton.setImageDrawable(new AnimatedVectorDrawable());}
 public void onClick(android.view.View clicked){
  if(clicked!=mClearAllButton){other++;return;}
  ((AnimatedVectorDrawable)mClearAllButton.getDrawable()).start();
  if(duringClick!=null)duringClick.run();
  ((AnimatedVectorDrawable)mClearAllButton.getDrawable()).start();
  removes++;if(fail)throw new IllegalStateException("OEM remove failed");
 }
}'''
files['ls/augment/com/hook/TestCleanupBomb.java']='''package ls.augment.com.hook;
import android.view.*;import android.animation.*;import android.graphics.*;import com.android.quickstep.views.*;
public class TestCleanupBomb{
 static int checks;static void check(boolean ok,String s){checks++;if(!ok)throw new AssertionError(s);}
 static void click(RecentsView r,View b)throws Throwable{AugmentModule.call(r,RecentsView.class,"dismissAllTasks",new Class[]{View.class},b);}
 public static void main(String[] args)throws Throwable{
  AugmentModule m=new AugmentModule();AugmentModule.active=m;LauncherCleanupBombHook.install(m,TestCleanupBomb.class.getClassLoader());
  for(String style:new String[]{"0","1"}){
   FeatureSettings.on=true;FeatureSettings.style=style;RecentsView r=new RecentsView();View decor=new View();r.root=decor;
   click(r,decor);ValueAnimator a=ValueAnimator.last;
   check(r.calls==1&&r.cleanups==1&&r.locked==2&&r.duration==("1".equals(style)?1150:1450),"OEM cleanup stays synchronous; particles share native duration");
   check(decor.overlay.items.isEmpty()&&decor.alpha==1&&r.overlay.items.size()==1,"effect stays off decor without hiding any ancestor");
   click(r,decor);check(r.calls==1&&ValueAnimator.last==a,"double click during effect suppressed");
   a.tick(.5f);Canvas canvas=new Canvas();r.overlay.items.get(0).draw(canvas);check(canvas.depth==0,"drawing restores canvas");if("1".equals(style))check(canvas.lines>100&&canvas.circles>100,"holographic particles produce trails and fine light points");
   a.tick(1);check(r.calls==1&&r.overlay.items.isEmpty(),"animator never redispatches cleanup");
   r=new RecentsView();click(r,decor);a=ValueAnimator.last;r.detach();a.tick(.8f);check(r.calls==1&&r.overlay.items.isEmpty(),"detach only releases visuals");
   r=new RecentsView();click(r,decor);a=ValueAnimator.last;r.mOverviewStateEnabled=false;a.tick(.2f);check(r.overlay.items.isEmpty(),"leaving recents removes effect immediately");
   r=new RecentsView();click(r,decor);a=ValueAnimator.last;r.width=2400;a.tick(.2f);check(r.calls==1&&r.overlay.items.isEmpty(),"rotation releases visuals without another mutation");
   r=new RecentsView();r.overlay.fail=true;click(r,decor);check(r.calls==1&&r.duration==("1".equals(style)?1150:1450)&&r.overlay.items.isEmpty(),"overlay failure still calls OEM once and restores visuals");
   r=new RecentsView();r.fail=true;try{click(r,decor);throw new AssertionError("expected OEM failure");}catch(IllegalStateException expected){}
   check(r.calls==1&&r.overlay.items.isEmpty(),"OEM exception cleans visuals and is never retried");
  }
  check(View.thumbnailReads==0&&Canvas.nodes==0,"no OEM bitmap or render node retained or drawn");
  FeatureSettings.on=false;RecentsView r=new RecentsView();click(r,new View());check(r.calls==1&&r.overlay.items.isEmpty(),"off uses OEM");
  FeatureSettings.on=true;ValueAnimator.enabled=false;r=new RecentsView();click(r,new View());check(r.calls==1&&r.overlay.items.isEmpty(),"disabled system animations use OEM");ValueAnimator.enabled=true;
  OverviewActionsView host=new OverviewActionsView();android.widget.ImageView icon=new android.widget.ImageView();host.mClearAllButton=icon;host.child=icon;
  android.graphics.drawable.AnimatedVectorDrawable nativeIcon=new android.graphics.drawable.AnimatedVectorDrawable();icon.setImageDrawable(nativeIcon);
  AugmentModule.call(host,OverviewActionsView.class,"onFinishInflate",new Class[]{});check(icon.getDrawable()!=null,"bomb icon installed");
  android.graphics.drawable.Drawable bomb=icon.getDrawable();
  try{host.onClick(icon);throw new AssertionError("expected OEM cast failure without hook");}catch(ClassCastException expected){}
  check(host.removes==0,"regression reproduces failure before cleanup entry");
  host.duringClick=()->{for(Runnable listener:new java.util.ArrayList<>(FeatureSettings.listeners))listener.run();};
  AugmentModule.call(host,OverviewActionsView.class,"onClick",new Class[]{View.class},icon);
  check(host.removes==1&&nativeIcon.starts==2&&icon.getDrawable()==bomb,"native cast and animation preserved, remove once, bomb restored after config refresh");
  host.fail=true;try{AugmentModule.call(host,OverviewActionsView.class,"onClick",new Class[]{View.class},icon);throw new AssertionError("expected");}catch(IllegalStateException expected){}
  check(host.removes==2&&icon.getDrawable()==bomb,"original exception restores icon without retrying removal");host.fail=false;
  AugmentModule.call(host,OverviewActionsView.class,"onClick",new Class[]{View.class},new View());check(host.other==1&&icon.getDrawable()==bomb,"unrelated actions unaffected");
  AugmentModule.call(host,OverviewActionsView.class,"onForeColorChanged",new Class[]{int.class},-1);check(icon.getDrawable()!=null,"theme refresh retains bomb");
  AugmentModule.call(host,OverviewActionsView.class,"onClick",new Class[]{View.class},icon);check(host.removes==3&&icon.getDrawable()==bomb,"theme replacement still supports native click");
  host.duringClick=()->{FeatureSettings.on=false;for(Runnable listener:new java.util.ArrayList<>(FeatureSettings.listeners))listener.run();};
  AugmentModule.call(host,OverviewActionsView.class,"onClick",new Class[]{View.class},icon);
  check(host.removes==4&&icon.getDrawable() instanceof android.graphics.drawable.AnimatedVectorDrawable,"turning off during click leaves native drawable");
  AugmentModule.call(host,OverviewActionsView.class,"onClick",new Class[]{View.class},icon);check(host.removes==5,"disabled click remains native");
  icon.detach();check(FeatureSettings.listeners.isEmpty(),"listener released");
  System.out.println("PASS cleanup lifecycle: "+checks+" checks; no device mutations");
 }
}'''
# Preserve the OEM image object even when its outer layout receives the click.
files['android/view/View.java']=files['android/view/View.java'].replace('public int getId()', 'public void invalidate(){}public int getId()')
files['android/widget/ImageView.java']=files['android/widget/ImageView.java'].replace('android.graphics.drawable.Drawable image;', 'public int draws;public void onDraw(android.graphics.Canvas c){draws++;}android.graphics.drawable.Drawable image;')
files['com/android/quickstep/views/OverviewActionsView.java']=files['com/android/quickstep/views/OverviewActionsView.java'].replace('public android.widget.ImageView mClearAllButton;', 'public android.view.View outer=new android.view.View();public android.widget.ImageView mClearAllButton;').replace('clicked!=mClearAllButton','clicked!=mClearAllButton&&clicked!=outer')
test=files['ls/augment/com/hook/TestCleanupBomb.java'].replace('r.calls==1&&ValueAnimator.last==a,"double click during effect suppressed"','r.calls==2&&ValueAnimator.last==a,"duplicate click preserves OEM decision without another effect"').replace('a.tick(1);check(r.calls==1&&r.overlay.items.isEmpty()','a.tick(1);check(r.calls==2&&r.overlay.items.isEmpty()')
a=test.index('  AugmentModule.call(host,OverviewActionsView.class,"onFinishInflate"');b=test.index('  icon.detach();',a)
test=test[:a]+'''  AugmentModule.call(host,OverviewActionsView.class,"onFinishInflate",new Class[]{});
  check(icon.getDrawable()==nativeIcon,"binding never replaces OEM drawable");
  Canvas drawing=new Canvas();AugmentModule.call(icon,android.widget.ImageView.class,"onDraw",new Class[]{Canvas.class},drawing);
  check(icon.getDrawable()==nativeIcon&&icon.draws==1&&drawing.depth==0,"custom draw retains native object and restores canvas");
  host.onClick(host.outer);check(host.removes==1&&nativeIcon.starts==2,"outer-layout click accepts native AnimatedVectorDrawable");
  host.onClick(icon);check(host.removes==2,"direct image click also remains native");
  AugmentModule.call(host,OverviewActionsView.class,"onForeColorChanged",new Class[]{int.class},-1);
  android.graphics.drawable.Drawable themed=icon.getDrawable();host.onClick(host.outer);
  check(themed instanceof android.graphics.drawable.AnimatedVectorDrawable&&host.removes==3,"theme refresh retains OEM animation class");
  FeatureSettings.on=false;for(Runnable listener:new java.util.ArrayList<>(FeatureSettings.listeners))listener.run();
  check(icon.getDrawable()==themed,"off retains latest native theme object");
'''+test[b:]
test=test.replace('click(r,decor);ValueAnimator a=ValueAnimator.last;', 'click(r,decor);ValueAnimator a=ValueAnimator.last; if("1".equals(style)){check(r.selected.alpha==0&&r.protectedCard.alpha==1,"only native-selected cards are hidden during shattering");AugmentModule.call(r.selected,View.class,"setAlpha",new Class[]{float.class},.37f);check(r.selected.alpha==0,"native fade cannot repaint the sliding card");}')
test=test.replace('r.detach();a.tick(.8f);check(r.calls==1&&r.overlay.items.isEmpty(),"detach only releases visuals");','r.detach();a.tick(.8f);check(r.calls==1&&r.overlay.items.isEmpty(),"detach only releases visuals");if("1".equals(style))check(r.selected.alpha==1,"cancel restores card opacity for recycling");')
files['ls/augment/com/hook/TestCleanupBomb.java']=test
files['ls/augment/com/hook/LauncherCleanupBombHook.java']=(SRC/'hook/LauncherCleanupBombHook.java').read_text(encoding='utf-8')
files['android/view/ViewParent.java']='package android.view;public interface ViewParent{ViewParent getParent();}'
files['android/view/View.java']=files['android/view/View.java'].replace('public class View{','public class View implements ViewParent{public ViewParent parent;public ViewParent getParent(){return parent;}')
files['ls/augment/com/hook/FeatureSettings.java']=files['ls/augment/com/hook/FeatureSettings.java'].replace('public class FeatureSettings{','public class FeatureSettings{public static void diagnostic(android.content.Context c,String k,String v){}')
files['ls/augment/com/hook/HolographicBlastEffect.java']=(SRC/'hook/HolographicBlastEffect.java').read_text(encoding='utf-8')
files['android/graphics/Canvas.java']=files['android/graphics/Canvas.java'].replace('public int circles;', 'public int circles,lines,arcs;public void drawArc(float a,float b,float c,float d,float start,float sweep,boolean useCenter,Paint p){arcs++;}public void drawRoundRect(float a,float b,float c,float d,float rx,float ry,Paint p){}').replace('public void drawLine(float a,float b,float c,float d,Paint p){}','public void drawLine(float a,float b,float c,float d,Paint p){lines++;}')
# Android rendering and sound doubles exercise production cleanup, including cancellation.
files['android/graphics/RuntimeShader.java']='package android.graphics;public class RuntimeShader{public RuntimeShader(String source){}public void setFloatUniform(String key,float...v){}}'
files['android/graphics/Paint.java']=files['android/graphics/Paint.java'].replace('public void setStyle','public void setShader(RuntimeShader s){}public void setStyle')
files['android/graphics/Path.java']=files['android/graphics/Path.java'].replace('public void lineTo','public void reset(){}public void lineTo')
files['android/graphics/Canvas.java']=files['android/graphics/Canvas.java'].replace('public int circles,', 'public void drawRect(float a,float b,float c,float d,Paint p){}public int circles,')
files['ls/augment/com/hook/CleanupExplosionSound.java']=(SRC/'hook/CleanupExplosionSound.java').read_text(encoding='utf8')
files['android/content/Context.java']=files['android/content/Context.java'].replace('public String getPackageName()', 'public static final String AUDIO_SERVICE="audio";public Context createPackageContext(String p,int flags){return this;}public Object getSystemService(String key){return new android.media.AudioManager();}public android.content.res.Resources getResources(){return new android.content.res.Resources();}public String getPackageName()')
files['android/content/res/Resources.java']=files['android/content/res/Resources.java'].replace('public int getIdentifier','public android.content.res.AssetFileDescriptor openRawResourceFd(int id){return new android.content.res.AssetFileDescriptor();}public int getIdentifier')
files['android/content/res/AssetFileDescriptor.java']='package android.content.res;public class AssetFileDescriptor implements AutoCloseable{public void close(){}}'
files['android/media/AudioAttributes.java']='package android.media;public class AudioAttributes{public static final int USAGE_ASSISTANCE_SONIFICATION=13,CONTENT_TYPE_SONIFICATION=4;public static class Builder{public Builder setUsage(int n){return this;}public Builder setContentType(int n){return this;}public AudioAttributes build(){return new AudioAttributes();}}}'
files['android/media/AudioManager.java']='package android.media;public class AudioManager{public static final int RINGER_MODE_NORMAL=2,STREAM_SYSTEM=1;public static int mode=2,volume=5;public int getRingerMode(){return mode;}public int getStreamVolume(int stream){return volume;}}'
files['android/media/SoundPool.java']='package android.media;import android.content.res.AssetFileDescriptor;public class SoundPool{public static int plays,stops,loads;public static SoundPool last;public interface OnLoadCompleteListener{void onLoadComplete(SoundPool pool,int id,int status);}public OnLoadCompleteListener listener;public void setOnLoadCompleteListener(OnLoadCompleteListener l){listener=l;}public int load(AssetFileDescriptor fd,int priority){loads++;return 1;}public int play(int id,float left,float right,int priority,int loop,float rate){if(loop!=0)throw new AssertionError("must not loop");return ++plays;}public void stop(int stream){stops++;}public void release(){}public static class Builder{public Builder setMaxStreams(int n){return this;}public Builder setAudioAttributes(AudioAttributes a){return this;}public SoundPool build(){return last=new SoundPool();}}}'
test=files['ls/augment/com/hook/TestCleanupBomb.java']
test=test.replace('  for(String style:', '  CleanupExplosionSound.prepare(new android.content.Context());android.media.SoundPool.last.listener.onLoadComplete(android.media.SoundPool.last,1,0);\n  for(String style:')
test=test.replace('   a.tick(.5f);Canvas canvas=', '   int plays=android.media.SoundPool.plays; a.tick(.05f);check(android.media.SoundPool.plays==plays,"no sound before detonation");a.tick(.5f);check(android.media.SoundPool.plays==plays+("0".equals(style)?1:0),"only explosion impact plays sound once");a.tick(.6f);check(android.media.SoundPool.plays==plays+("0".equals(style)?1:0),"later animation frames cannot repeat sound");Canvas canvas=')
test=test.replace('  System.out.println(', '  android.media.AudioManager.mode=1;int muted=android.media.SoundPool.plays;check(CleanupExplosionSound.play(new android.content.Context())==0&&muted==android.media.SoundPool.plays,"vibrate mode is honored");android.media.AudioManager.mode=2;android.media.AudioManager.volume=0;check(CleanupExplosionSound.play(new android.content.Context())==0,"zero system volume is honored");android.media.AudioManager.volume=5;CleanupExplosionSound.prepare(new android.content.Context());check(android.media.SoundPool.loads==1,"sample preloaded only once");check(android.media.SoundPool.stops>0,"effect end releases sound stream");\n  System.out.println(')
files['ls/augment/com/hook/TestCleanupBomb.java']=test
with tempfile.TemporaryDirectory(prefix='lsa-bomb-') as temp:
 sources=[]
 for name,source in files.items():
  path=Path(temp)/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(source,encoding='utf-8');sources.append(str(path))
 subprocess.run(['javac','-encoding','UTF-8','-d',temp,*sources],check=True)
 subprocess.run(['java','-cp',temp,'ls.augment.com.hook.TestCleanupBomb'],check=True)
