"""Exercise real volume percentage formatting and label ownership with Android view doubles."""
from pathlib import Path
import ast,subprocess,tempfile
ROOT=Path(__file__).resolve().parents[1];SRC=ROOT/'android/app/src/main/java/ls/augment/com'
tree=ast.parse((ROOT/'tools/test-back-gesture-runtime.py').read_text(encoding='utf-8'))
base=next(ast.literal_eval(n.value) for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='files' for t in n.targets))
files={k:v for k,v in base.items() if k.startswith('android/') or k.startswith('io/') or k.endswith('/AugmentModule.java')}
files.update({
'android/media/AudioManager.java':'package android.media;public class AudioManager{public static final int STREAM_VOICE_CALL=0,STREAM_RING=2,STREAM_MUSIC=3,STREAM_ALARM=4,STREAM_NOTIFICATION=5;public int getStreamMaxVolume(int stream){return 15;}}',
'android/widget/SeekBar.java':'package android.widget;public class SeekBar extends android.view.View{public int getMax(){return 15;}}',
'android/os/Bundle.java':'''package android.os;public class Bundle{private final java.util.Map<String,Object> values=new java.util.HashMap<>();public int size(){return values.size();}public void putInt(String k,int v){values.put(k,v);}public void putLong(String k,long v){values.put(k,v);}public void putString(String k,String v){values.put(k,v);}public void putBoolean(String k,boolean v){values.put(k,v);}public int getInt(String k,int d){Object v=values.get(k);return v instanceof Integer?(Integer)v:d;}public long getLong(String k,long d){Object v=values.get(k);return v instanceof Long?(Long)v:d;}public String getString(String k,String d){Object v=values.get(k);return v instanceof String?(String)v:d;}public boolean getBoolean(String k){return Boolean.TRUE.equals(values.get(k));}}''',
'android/util/DisplayMetrics.java':'package android.util;public class DisplayMetrics{public float density=1,scaledDensity=1;}',
'android/content/res/Resources.java':'package android.content.res;public class Resources{public static final android.util.DisplayMetrics metrics=new android.util.DisplayMetrics();public android.util.DisplayMetrics getDisplayMetrics(){return metrics;}}',
'android/view/ViewParent.java':'package android.view;public interface ViewParent{}',
'android/view/ViewTreeObserver.java':'''package android.view;import java.util.*;public class ViewTreeObserver{public interface OnPreDrawListener{boolean onPreDraw();}public List<OnPreDrawListener> listeners=new ArrayList<>();public boolean alive=true;public boolean isAlive(){return alive;}public void addOnPreDrawListener(OnPreDrawListener l){listeners.add(l);}public void removeOnPreDrawListener(OnPreDrawListener l){listeners.remove(l);}public void draw(){for(OnPreDrawListener l:new ArrayList<>(listeners))l.onPreDraw();}}''',
'android/view/View.java':'''package android.view;import java.util.*;public class View implements ViewParent{public static final int VISIBLE=0,INVISIBLE=4,GONE=8;public int visibility=VISIBLE,width=120,height=400,left=40,top=10,right=80,bottom=350;public boolean shown=true,attached=true,globalVisible=true;public float alpha=1;public ViewParent parent;public ViewTreeObserver tree=new ViewTreeObserver();public Overlay overlay=new Overlay();public List<OnAttachStateChangeListener> attaches=new ArrayList<>();public interface OnAttachStateChangeListener{void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}public interface OnLayoutChangeListener{void onLayoutChange(View v,int l,int t,int r,int b,int ol,int ot,int or,int ob);}public android.content.Context getContext(){return new android.content.Context();}public android.content.res.Resources getResources(){return new android.content.res.Resources();}public int getWidth(){return width;}public int getHeight(){return height;}public float getAlpha(){return alpha;}public ViewParent getParent(){return parent;}public boolean isAttachedToWindow(){return attached;}public boolean isShown(){return shown&&visibility==VISIBLE&&(!(parent instanceof View)||((View)parent).isShown());}public int getVisibility(){return visibility;}public Overlay getOverlay(){return overlay;}public ViewTreeObserver getViewTreeObserver(){return tree;}public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){attaches.add(l);}public void removeOnAttachStateChangeListener(OnAttachStateChangeListener l){attaches.remove(l);}public void attach(){attached=true;tree=new ViewTreeObserver();for(OnAttachStateChangeListener l:new ArrayList<>(attaches))l.onViewAttachedToWindow(this);}public void detach(){attached=false;for(OnAttachStateChangeListener l:new ArrayList<>(attaches))l.onViewDetachedFromWindow(this);tree.alive=false;overlay.items.clear();}public void addOnLayoutChangeListener(OnLayoutChangeListener l){}public void removeOnLayoutChangeListener(OnLayoutChangeListener l){}public void getLocationOnScreen(int[] p){p[0]=0;p[1]=0;}public boolean getGlobalVisibleRect(android.graphics.Rect r){r.set(left,top,right,bottom);return globalVisible&&isShown();}public static class Overlay{public java.util.List<android.graphics.drawable.Drawable> items=new ArrayList<>();public void add(android.graphics.drawable.Drawable d){if(!items.contains(d))items.add(d);}public void remove(android.graphics.drawable.Drawable d){items.remove(d);}}}''',
'android/widget/TextView.java':'package android.widget;public class TextView extends android.view.View{String text="媒体";public CharSequence getText(){return text;}public void setText(CharSequence s){text=s.toString();}}',
'android/graphics/Paint.java':'''package android.graphics;public class Paint{public static final int ANTI_ALIAS_FLAG=1;float size;public enum Align{CENTER}public Paint(int f){}public void setTextAlign(Align a){}public void setTypeface(Typeface t){}public void setTextSize(float s){size=s;}public float getTextSize(){return size;}public float measureText(String text){return text.length()*size*.55f;}public void setColor(int c){}public void setAlpha(int a){}public void setColorFilter(ColorFilter f){}public void setShadowLayer(float r,float x,float y,int c){}public float ascent(){return -size;}public float descent(){return size*.2f;}}''',
'android/graphics/Typeface.java':'package android.graphics;public class Typeface{public static final int NORMAL=0;public static Typeface create(String n,int w){return new Typeface();}}',
'android/graphics/ColorFilter.java':'package android.graphics;public class ColorFilter{}',
'android/graphics/PixelFormat.java':'package android.graphics;public class PixelFormat{public static final int TRANSLUCENT=-3;}',
'android/graphics/Rect.java':'''package android.graphics;public class Rect{public int left,top,right,bottom;public void set(int a,int b,int c,int d){left=a;top=b;right=c;bottom=d;}public void offset(int x,int y){left+=x;right+=x;top+=y;bottom+=y;}public boolean intersect(int l,int t,int r,int b){left=Math.max(l,left);top=Math.max(t,top);right=Math.min(r,right);bottom=Math.min(b,bottom);return left<right&&top<bottom;}public int width(){return right-left;}public int height(){return bottom-top;}public float exactCenterX(){return (left+right)/2f;}}''',
'android/graphics/Canvas.java':'package android.graphics;public class Canvas{public String text;public float x,y,size;public void drawText(String s,float x,float y,Paint p){text=s;this.x=x;this.y=y;size=p.getTextSize();}}',
'android/graphics/drawable/Drawable.java':'''package android.graphics.drawable;import android.graphics.*;public abstract class Drawable{public int invalidations;public void setBounds(int a,int b,int c,int d){}public void invalidateSelf(){invalidations++;}public abstract void draw(Canvas c);public abstract void setAlpha(int a);public abstract void setColorFilter(ColorFilter f);public abstract int getOpacity();}''',
'ls/augment/com/ConfigSchema.java':'package ls.augment.com;public class ConfigSchema{public static final String AUDIO_GAIN_ENABLED="gain",AUDIO_GAIN_STEP="step";public static boolean truthy(String value){return "1".equals(value);}}',
'ls/augment/com/ConfigSnapshot.java':'''package ls.augment.com;public class ConfigSnapshot{public final java.util.Map<String,String> values=new java.util.HashMap<>();public String get(String key){return values.getOrDefault(key,"0");}}''',
'ls/augment/com/SystemUiOptions.java':'package ls.augment.com;public class SystemUiOptions{public static final String QS_VOLUME_PERCENT="percent";}',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;import ls.augment.com.*;public class FeatureSettings{
static java.util.Set<String> enabled=new java.util.HashSet<>();static final ConfigSnapshot options=new ConfigSnapshot();static AudioGainState live;
static boolean enabled(android.content.Context c,String k){return enabled.contains(k);}static android.content.Context from(Object o){return new android.content.Context();}
static ConfigSnapshot snapshot(android.content.Context context){options.values.put(ConfigSchema.AUDIO_GAIN_ENABLED,enabled.contains("gain")?"1":"0");return options;}
static void diagnostic(android.content.Context c,String key,String value){}
static void gain(int base,int step,int limit,int current,boolean muted){enabled.add("gain");options.values.put(ConfigSchema.AUDIO_GAIN_STEP,Integer.toString(step));
 for(String route:new String[]{"speaker","wired","bluetooth"})options.values.put(AudioGainPolicy.key(route,3),route.equals("speaker")?Integer.toString(limit):"100");
 String configuration=AudioGainState.configuration(snapshot(new android.content.Context()),3);
 live=new AudioGainState(1,1,1000,1,3,2,"speaker",configuration,true,muted,base,muted?0:Math.min(base,current),current,base+AudioGainPolicy.extraSteps(limit,step),step,limit);}
}''',
# The presentation test controls live readback delivery; validate the supplied
# packet with the production AudioGainState before making it available to UI.
'ls/augment/com/hook/AudioGainStateClient.java':'''package ls.augment.com.hook;import ls.augment.com.*;public class AudioGainStateClient{static class Watch{final android.view.View view;int stream;boolean closed;Watch(android.view.View view,Runnable changed){this.view=view;}void bind(int stream){this.stream=stream;}AudioGainState state(){AudioGainState state=FeatureSettings.live;return !closed&&state!=null&&state.valid(1,1,1000,stream,AudioGainState.configuration(FeatureSettings.snapshot(view.getContext()),stream))?state:null;}void close(){closed=true;}}}''',
'com/android/systemui/volume/VolumeDialogImpl.java':'''package com.android.systemui.volume;import ls.augment.com.hook.TestVolumePercent.Row;public class VolumeDialogImpl{public android.content.Context mContext=new android.content.Context();public java.util.List<Row> mRows=new java.util.ArrayList<>();public void updateVolumeRowH(Row row){if(row.number!=null)row.number.setText(Integer.toString(row.ss.level));}public void showH(int reason,boolean locked,int flags){}public void updateRowsH(Row active){}}''',
'com/zte/feature/volume/MfvVolumeDialogImpl.java':'''package com.zte.feature.volume;import ls.augment.com.hook.TestVolumePercent.Row;public class MfvVolumeDialogImpl extends com.android.systemui.volume.VolumeDialogImpl{public void updateRowsH(Row active){active.number.shown=false;}public void updateExpandedH(boolean expanded){}}''',
'ls/augment/com/hook/TestVolumePercent.java':'''package ls.augment.com.hook;import android.view.*;import android.widget.*;import android.graphics.*;import java.lang.reflect.*;public class TestVolumePercent{
 static int count;static void check(boolean ok,String s){count++;if(!ok)throw new AssertionError(s);}public static class State{public int level=5,levelMax=15;public boolean muted;}public static class Row{public int stream=3;public TextView header=new TextView(),number=new TextView();public State ss=new State();public View view=new View(),slider=new View(),icon=new View();}
 static Method update;static void show(Row row,View root,int stream)throws Exception{update.invoke(null,new android.content.Context(),row,root,stream);}
 public static void main(String[] args)throws Throwable{update=AudioGainUiHook.class.getDeclaredMethod("updateVolumeLabel",android.content.Context.class,Object.class,View.class,int.class);update.setAccessible(true);Row row=new Row();View root=new View();
 FeatureSettings.enabled.add("percent");show(row,root,2);check(row.number.getText().toString().equals("33%")&&root.overlay.items.isEmpty(),"ring uses visible OEM number, no duplicate overlay");
 row.number.shown=false;show(row,root,2);check(root.overlay.items.size()==1,"VISIBLE number under hidden OEM container must not suppress fallback");row.number.shown=true;show(row,root,2);
 row.number.shown=false;root.tree.draw();check(root.overlay.items.size()==1,"collapse visibility change without volume update restores fallback");row.number.shown=true;root.tree.draw();check(root.overlay.items.isEmpty(),"expansion with visible native label removes fallback without volume update");
 row.number.globalVisible=false;root.tree.draw();check(root.overlay.items.size()==1,"clipped native number cannot own percentage");row.number.globalVisible=true;root.tree.draw();
 View transparentParent=new View();transparentParent.alpha=0;row.number.parent=transparentParent;root.tree.draw();check(root.overlay.items.size()==1,"transparent label ancestor cannot own percentage");row.number.parent=null;root.tree.draw();
 Row narrow=new Row();narrow.number=null;narrow.ss.level=15;View narrowRoot=new View();narrowRoot.width=56;narrow.slider.left=18;narrow.slider.right=38;
 show(narrow,narrowRoot,3);Canvas trackCanvas=new Canvas();narrowRoot.overlay.items.get(0).draw(trackCanvas);check("100%".equals(trackCanvas.text)&&trackCanvas.size>=6&&trackCanvas.x==28,"OEM rotated 20dp track in 56dp row must render percentage");
 for(float density:new float[]{1,2,3.25f})for(float font:new float[]{1,1.3f,1.6f}){
  android.content.res.Resources.metrics.density=density;android.content.res.Resources.metrics.scaledDensity=density*font;
  Row sized=new Row();sized.number=null;sized.ss.level=15;View sizedRoot=new View();sizedRoot.width=Math.round(56*density);sizedRoot.height=Math.round(400*density);
  sized.slider.left=Math.round(18*density);sized.slider.right=Math.round(38*density);sized.slider.top=Math.round(10*density);sized.slider.bottom=Math.round(350*density);
  show(sized,sizedRoot,3);Canvas output=new Canvas();sizedRoot.overlay.items.get(0).draw(output);
  check("100%".equals(output.text)&&output.size>=6*density&&output.size*4*.55f<=49*density,"20dp track renders within row at supported density/font scales");
 }
 android.content.res.Resources.metrics.density=1;android.content.res.Resources.metrics.scaledDensity=1;
 android.graphics.drawable.Drawable cached=narrowRoot.overlay.items.get(0);int invalidations=cached.invalidations;for(int frame=0;frame<100;frame++)narrowRoot.tree.draw();check(cached.invalidations==invalidations,"unchanged pre-draw must not start a perpetual rendering loop");
 View oldSlider=narrow.slider;narrow.slider=new View();narrow.slider.left=28;narrow.slider.right=48;narrowRoot.width=76;show(narrow,narrowRoot,3);trackCanvas=new Canvas();narrowRoot.overlay.items.get(0).draw(trackCanvas);check(trackCanvas.x==38&&narrowRoot.overlay.items.size()==1,"replacement route slider updates anchor without duplicate overlay");
 narrowRoot.detach();check(narrowRoot.tree.listeners.isEmpty()&&narrowRoot.overlay.items.isEmpty(),"dismiss releases old view tree observer and overlay");narrowRoot.attach();narrowRoot.tree.draw();check(narrowRoot.tree.listeners.size()==1&&narrowRoot.overlay.items.size()==1,"reshow rebinds a single observer and fallback");
 row.ss.muted=true;show(row,root,3);check(row.number.getText().toString().equals("0%"),"muted media reports zero");row.ss.muted=false;
 FeatureSettings.gain(15,5,200,26,false);row.ss.levelMax=35;row.ss.level=26;show(row,root,3);check(row.number.getText().toString().equals("155%"),"validated live gain may exceed 100%");
 FeatureSettings.enabled.add("ls_augment_rm_audio_steps_media_enabled");show(row,root,3);check(row.number.getText().toString().equals("155%")&&row.header.getText().toString().contains("26 / 35"),"steps do not replace percentage");
 row.number.visibility=View.GONE;show(row,root,3);check(root.overlay.items.size()==1,"hidden OEM number gets one fallback");show(row,root,3);check(root.overlay.items.size()==1,"updates reuse fallback");Canvas canvas=new Canvas();root.overlay.items.get(0).draw(canvas);check("155%".equals(canvas.text)&&canvas.x==60&&canvas.y>=10&&canvas.y<=350,"fallback inside slider bounds, away from speaker");
 row.number.visibility=View.VISIBLE;show(row,root,3);check(root.overlay.items.isEmpty(),"visible OEM label removes old overlay");
 FeatureSettings.gain(15,5,300,26,false);show(row,root,3);check(row.number.getText().toString().equals("26 / 35")&&root.overlay.items.isEmpty(),"mismatched live range preserves step count and suppresses an invented percentage");
 FeatureSettings.gain(15,5,200,0,true);row.number.visibility=View.GONE;row.ss.muted=true;show(row,root,3);canvas=new Canvas();root.overlay.items.get(0).draw(canvas);check("0%".equals(canvas.text),"muted live readback overlay stays zero");
 FeatureSettings.enabled.clear();show(row,root,3);check(root.overlay.items.isEmpty()&&row.header.getText().toString().equals("媒体"),"off removes decorations and step suffix");
 show(narrow,narrowRoot,3);check(narrowRoot.tree.listeners.isEmpty()&&narrowRoot.attaches.isEmpty()&&narrowRoot.overlay.items.isEmpty(),"off releases all cached row presentation listeners");
 row.ss.levelMax=0;show(row,root,3);check(root.overlay.items.isEmpty(),"invalid max never divides");
 FeatureSettings.enabled.add("percent");AugmentModule.active=new AugmentModule();AudioGainUiHook.install(AugmentModule.active,TestVolumePercent.class.getClassLoader());
 com.android.systemui.volume.VolumeDialogImpl dialog=new com.android.systemui.volume.VolumeDialogImpl();Row shown=new Row();shown.number=null;dialog.mRows.add(shown);
 AugmentModule.call(dialog,com.android.systemui.volume.VolumeDialogImpl.class,"showH",new Class[]{int.class,boolean.class,int.class},1,false,0);
 check(shown.view.overlay.items.size()==1,"show refreshes cached rows even if optional range controller is absent");
 com.zte.feature.volume.MfvVolumeDialogImpl mfv=new com.zte.feature.volume.MfvVolumeDialogImpl();Row collapsed=new Row();mfv.mRows.add(collapsed);
 AugmentModule.call(mfv,com.zte.feature.volume.MfvVolumeDialogImpl.class,"updateRowsH",new Class[]{Row.class},collapsed);
 check(collapsed.view.overlay.items.size()==1,"OEM layout-only collapse refreshes presentation after container changes");
 System.out.println("PASS production volume labels: "+count+" checks");}
}'''
})
files['android/view/View.java']=files['android/view/View.java'].replace('public int getWidth(){','public int getId(){return 3;}public int getWidth(){')
files['android/view/View.java']=files['android/view/View.java'].replace('public boolean shown=true,','public int globalX,globalY,windowX,windowY;public boolean shown=true,').replace('p[0]=0;p[1]=0;','p[0]=globalX+windowX;p[1]=globalY+windowY;').replace('public boolean getGlobalVisibleRect(android.graphics.Rect r){','public boolean getGlobalVisibleRect(android.graphics.Rect r,android.graphics.Point offset){offset.x=globalX;offset.y=globalY;return getGlobalVisibleRect(r);}public boolean getGlobalVisibleRect(android.graphics.Rect r){')
files['android/graphics/Point.java']='package android.graphics;public class Point{public int x,y;}'
files['android/graphics/Rect.java']=files['android/graphics/Rect.java'].replace('public int width(){','public String toShortString(){return "["+left+","+top+","+right+","+bottom+"]";}public int width(){')
files['ls/augment/com/hook/TestVolumePercent.java']=files['ls/augment/com/hook/TestVolumePercent.java'].replace('slider=new View(),icon=new View();','slider=new View(),icon;')
files['ls/augment/com/hook/TestVolumePercent.java']=files['ls/augment/com/hook/TestVolumePercent.java'].replace(' android.graphics.drawable.Drawable cached=', ''' // Captured OEM floating window: screen row [968,954], root-view origin [890,140].
 // getGlobalVisibleRect deliberately excludes the window's [78,814] screen offset.
 android.content.res.Resources.metrics.density=3.25f;android.content.res.Resources.metrics.scaledDensity=3.25f;
 Row floating=new Row();floating.number=null;floating.ss.level=54;floating.ss.levelMax=150;View floatingRoot=new View();
 floatingRoot.width=182;floatingRoot.height=686;floatingRoot.globalX=890;floatingRoot.globalY=140;floatingRoot.windowX=78;floatingRoot.windowY=814;
 floatingRoot.left=890;floatingRoot.top=140;floatingRoot.right=1072;floatingRoot.bottom=826;
 floating.slider.left=949;floating.slider.top=180;floating.slider.right=1014;floating.slider.bottom=655;
 show(floating,floatingRoot,3);Canvas floatingCanvas=new Canvas();floatingRoot.overlay.items.get(0).draw(floatingCanvas);
 check("36%".equals(floatingCanvas.text)&&floatingCanvas.x==91.5f&&floatingCanvas.y>=40&&floatingCanvas.y<=515,"OEM floating window must convert slider and row in the same root coordinate space");
 floatingRoot.left=920;floatingRoot.top=160;floatingCanvas=new Canvas();floatingRoot.overlay.items.get(0).draw(floatingCanvas);
 check("36%".equals(floatingCanvas.text)&&floatingCanvas.x==91.5f,"clipped row bounds must not replace its un-clipped local origin");
 floatingRoot.globalVisible=false;floatingRoot.tree.draw();floatingCanvas=new Canvas();floatingRoot.overlay.items.get(0).draw(floatingCanvas);
 check(floatingCanvas.text==null,"hidden floating row cannot draw a percentage");
 // OEM expand starts with the inactive rows clipped by their ancestor and
 // then animates only that ancestor. A RenderNode can reuse the empty draw.
 android.graphics.drawable.Drawable inactiveBadge=floatingRoot.overlay.items.get(0);int emptyRecording=inactiveBadge.invalidations;
 floatingRoot.globalVisible=true;floatingRoot.tree.draw();
 if(inactiveBadge.invalidations!=emptyRecording){floatingCanvas=new Canvas();inactiveBadge.draw(floatingCanvas);}
 check("36%".equals(floatingCanvas.text),"expanded inactive row must invalidate the empty clipped recording without a volume change");
 int recordedVisible=inactiveBadge.invalidations;for(int frame=0;frame<100;frame++)floatingRoot.tree.draw();
 check(inactiveBadge.invalidations==recordedVisible,"settled expansion must not cause a perpetual redraw loop");
 floating.slider.bottom-=20;floatingRoot.tree.draw();
 check(inactiveBadge.invalidations==recordedVisible+1,"ancestor clipping geometry change must invalidate once even while the row remains visible");
 // OEM's 41px footer gap is outside every possible thumb position. Test
 // glyph edges, not only baseline, with the user's supported font scales.
 for(float font:new float[]{1,1.3f,1.6f}){
  android.content.res.Resources.metrics.scaledDensity=3.25f*font;
  Row footerRow=new Row();footerRow.number=null;footerRow.ss.levelMax=150;View footerRoot=new View();
  footerRoot.width=182;footerRoot.height=686;footerRoot.globalX=890;footerRoot.globalY=140;footerRoot.windowX=78;footerRoot.windowY=814;
  footerRoot.left=890;footerRoot.top=140;footerRoot.right=1072;footerRoot.bottom=826;
  footerRow.slider.left=949;footerRow.slider.top=180;footerRow.slider.right=1014;footerRow.slider.bottom=655;
  footerRow.icon=new View();footerRow.icon.left=942;footerRow.icon.top=696;footerRow.icon.right=1020;footerRow.icon.bottom=774;
  for(int volume:new int[]{0,10,75,150}){
   footerRow.ss.level=volume;show(footerRow,footerRoot,3);Canvas gapCanvas=new Canvas();footerRoot.overlay.items.get(0).draw(gapCanvas);
   check((Math.round(volume*100f/150)+"%").equals(gapCanvas.text)&&gapCanvas.y-gapCanvas.size>=518.24f&&gapCanvas.y+gapCanvas.size*.2f<=552.76f,
     "percentage glyphs must fit the OEM footer gap without touching thumb or icon at every tested volume and font scale");
  }
  FeatureSettings.gain(15,5,300,55,false);footerRow.ss.levelMax=55;footerRow.ss.level=55;show(footerRow,footerRoot,3);
  Canvas maxGain=new Canvas();footerRoot.overlay.items.get(0).draw(maxGain);
  check("300%".equals(maxGain.text)&&maxGain.y-maxGain.size>=518.24f&&maxGain.y+maxGain.size*.2f<=552.76f
     &&maxGain.size*4*.55f<=155f,"maximum gain label must fit both footer gap and row width at every tested font scale");
  FeatureSettings.enabled.remove("gain");FeatureSettings.live=null;footerRow.ss.levelMax=150;footerRow.ss.level=150;show(footerRow,footerRoot,3);
  android.graphics.drawable.Drawable footerBadge=footerRoot.overlay.items.get(0);int beforeFooterMove=footerBadge.invalidations;
  footerRow.icon.top+=10;footerRoot.tree.draw();
  check(footerBadge.invalidations==beforeFooterMove+1,"footer icon geometry change must refresh the gap placement once");
  View newFooter=new View();newFooter.left=942;newFooter.top=696;newFooter.right=1020;newFooter.bottom=774;footerRow.icon=newFooter;show(footerRow,footerRoot,3);
  check(footerRoot.overlay.items.size()==1&&footerRoot.overlay.items.get(0)!=footerBadge,"replaced footer icon must rebind its geometry without a duplicate badge");
  footerBadge=footerRoot.overlay.items.get(0);newFooter.globalVisible=false;footerRoot.tree.draw();Canvas clippedFooter=new Canvas();footerBadge.draw(clippedFooter);
  check(clippedFooter.text==null,"temporarily clipped known footer must not put text back over the thumb");
  int clippedRecording=footerBadge.invalidations;newFooter.globalVisible=true;footerRoot.tree.draw();Canvas revealedFooter=new Canvas();footerBadge.draw(revealedFooter);
  check(footerBadge.invalidations==clippedRecording+1&&"100%".equals(revealedFooter.text),"revealed footer must restore one gap rendering after ancestor animation");
  int stableFooter=footerBadge.invalidations;for(int frame=0;frame<100;frame++)footerRoot.tree.draw();
  check(footerBadge.invalidations==stableFooter,"unchanged footer geometry must remain idle");
  newFooter.top=656;footerRoot.tree.draw();Canvas noGap=new Canvas();footerBadge.draw(noGap);
  check(noGap.text==null,"transient gap smaller than the safety padding must not overlap native controls");
 }
 android.content.res.Resources.metrics.density=1;android.content.res.Resources.metrics.scaledDensity=1;
 android.graphics.drawable.Drawable cached=''')
for name in ('AudioGainPolicy.java','AudioGainState.java','hook/AudioGainUiHook.java'):files['ls/augment/com/'+name]=(SRC/name).read_text(encoding='utf-8')
with tempfile.TemporaryDirectory(prefix='lsa-volume-label-') as temp:
 sources=[]
 for name,source in files.items():
  path=Path(temp)/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(source,encoding='utf-8');sources.append(str(path))
 subprocess.run(['javac','-encoding','UTF-8','-d',temp,*sources],check=True)
 subprocess.run(['java','-cp',temp,'ls.augment.com.hook.TestVolumePercent'],check=True)
 # Reinsert the original track-width rejection. The OEM-shaped 20dp case
 # must catch the missing pixels, independent of text formatting assertions.
 production=files['ls/augment/com/hook/AudioGainUiHook.java']
 marker='paint.setColor(0xff20242a);'
 mutant=production.replace(marker,'paint.setTextSize(Math.min(11*r.getResources().getDisplayMetrics().scaledDensity,bounds.width()/3.6f));if(paint.getTextSize()<6*d)return;'+marker,1)
 if mutant==production:raise AssertionError('Volume drawing marker missing')
 hook=Path(temp)/'ls/augment/com/hook/AudioGainUiHook.java';hook.write_text(mutant,encoding='utf-8')
 subprocess.run(['javac','-encoding','UTF-8','-cp',temp,'-d',temp,str(hook)],check=True)
 result=subprocess.run(['java','-cp',temp,'ls.augment.com.hook.TestVolumePercent'],capture_output=True,text=True)
 if result.returncode==0 or 'OEM rotated 20dp track in 56dp row must render percentage' not in result.stderr:
  raise AssertionError('The narrow-track regression did not reject the old renderer: '+result.stderr)
 print('PASS old 20dp track-width renderer rejected by OEM-shaped regression')
 # Reproduce the second device failure: the row's screen position includes
 # the floating window offset, while the slider rectangle does not.
 marker='bounds.offset(-origin.x,-origin.y);'
 mutant=production.replace(marker,'int[] screen=new int[2];r.getLocationOnScreen(screen);bounds.offset(-screen[0],-screen[1]);',1)
 if mutant==production:raise AssertionError('Volume root-coordinate marker missing')
 hook.write_text(mutant,encoding='utf-8')
 subprocess.run(['javac','-encoding','UTF-8','-cp',temp,'-d',temp,str(hook)],check=True)
 result=subprocess.run(['java','-cp',temp,'ls.augment.com.hook.TestVolumePercent'],capture_output=True,text=True)
 if result.returncode==0 or 'OEM floating window must convert slider and row in the same root coordinate space' not in result.stderr:
  raise AssertionError('The floating-window regression did not reject mixed coordinates: '+result.stderr)
 print('PASS screen/window coordinate mutant rejected by floating-window regression')
 mutant=production.replace('badge.updateGeometry();','',1)
 if mutant==production:raise AssertionError('Volume geometry refresh marker missing')
 hook.write_text(mutant,encoding='utf-8')
 subprocess.run(['javac','-encoding','UTF-8','-cp',temp,'-d',temp,str(hook)],check=True)
 result=subprocess.run(['java','-cp',temp,'ls.augment.com.hook.TestVolumePercent'],capture_output=True,text=True)
 if result.returncode==0 or 'expanded inactive row must invalidate the empty clipped recording without a volume change' not in result.stderr:
  raise AssertionError('The expansion regression did not reject stale clipped recording: '+result.stderr)
 print('PASS stale clipped recording mutant rejected by expansion regression')
 marker='canvas.drawText(text,center,baseline,paint);'
 mutant=production.replace(marker,'baseline=Math.max(bounds.top-paint.ascent(),bounds.bottom-8*d-paint.descent());'+marker,1)
 if mutant==production:raise AssertionError('Volume label placement marker missing')
 hook.write_text(mutant,encoding='utf-8')
 subprocess.run(['javac','-encoding','UTF-8','-cp',temp,'-d',temp,str(hook)],check=True)
 result=subprocess.run(['java','-cp',temp,'ls.augment.com.hook.TestVolumePercent'],capture_output=True,text=True)
 if result.returncode==0 or 'percentage glyphs must fit the OEM footer gap without touching thumb or icon at every tested volume and font scale' not in result.stderr:
  raise AssertionError('The footer-gap regression did not reject old thumb-overlapping placement: '+result.stderr)
 print('PASS old thumb-overlapping position rejected by footer-gap regression')
