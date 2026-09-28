"""Exercise real volume percentage formatting and label ownership with Android view doubles."""
from pathlib import Path
import ast,subprocess,tempfile
ROOT=Path(__file__).resolve().parents[1];SRC=ROOT/'android/app/src/main/java/ls/augment/com'
tree=ast.parse((ROOT/'tools/test-back-gesture-runtime.py').read_text(encoding='utf-8'))
base=next(ast.literal_eval(n.value) for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='files' for t in n.targets))
files={k:v for k,v in base.items() if k.startswith('android/') or k.startswith('io/') or k.endswith('/AugmentModule.java')}
files.update({
'android/media/AudioManager.java':'package android.media;public class AudioManager{public static final int STREAM_VOICE_CALL=0,STREAM_RING=2,STREAM_MUSIC=3,STREAM_ALARM=4,STREAM_NOTIFICATION=5;}',
'android/util/DisplayMetrics.java':'package android.util;public class DisplayMetrics{public float density=1,scaledDensity=1;}',
'android/view/View.java':'''package android.view;import java.util.*;public class View{public static final int VISIBLE=0,INVISIBLE=4,GONE=8;public int visibility=VISIBLE;public Overlay overlay=new Overlay();public interface OnLayoutChangeListener{void onLayoutChange(View v,int l,int t,int r,int b,int ol,int ot,int or,int ob);}public android.content.Context getContext(){return new android.content.Context();}public android.content.res.Resources getResources(){return new android.content.res.Resources();}public int getWidth(){return 120;}public int getHeight(){return 400;}public int getVisibility(){return visibility;}public Overlay getOverlay(){return overlay;}public void addOnLayoutChangeListener(OnLayoutChangeListener l){}public void removeOnLayoutChangeListener(OnLayoutChangeListener l){}public void getLocationOnScreen(int[] p){p[0]=0;p[1]=0;}public boolean getGlobalVisibleRect(android.graphics.Rect r){r.set(40,10,80,350);return true;}public static class Overlay{public java.util.List<android.graphics.drawable.Drawable> items=new ArrayList<>();public void add(android.graphics.drawable.Drawable d){items.add(d);}public void remove(android.graphics.drawable.Drawable d){items.remove(d);}}}''',
'android/widget/TextView.java':'package android.widget;public class TextView extends android.view.View{String text="媒体";public CharSequence getText(){return text;}public void setText(CharSequence s){text=s.toString();}}',
'android/graphics/Paint.java':'''package android.graphics;public class Paint{public static final int ANTI_ALIAS_FLAG=1;float size;public enum Align{CENTER}public Paint(int f){}public void setTextAlign(Align a){}public void setTypeface(Typeface t){}public void setTextSize(float s){size=s;}public float getTextSize(){return size;}public void setColor(int c){}public void setAlpha(int a){}public void setColorFilter(ColorFilter f){}public void setShadowLayer(float r,float x,float y,int c){}public float ascent(){return -size;}public float descent(){return size*.2f;}}''',
'android/graphics/Typeface.java':'package android.graphics;public class Typeface{public static final int NORMAL=0;public static Typeface create(String n,int w){return new Typeface();}}',
'android/graphics/ColorFilter.java':'package android.graphics;public class ColorFilter{}',
'android/graphics/PixelFormat.java':'package android.graphics;public class PixelFormat{public static final int TRANSLUCENT=-3;}',
'android/graphics/Rect.java':'''package android.graphics;public class Rect{public int left,top,right,bottom;public void set(int a,int b,int c,int d){left=a;top=b;right=c;bottom=d;}public void offset(int x,int y){left+=x;right+=x;top+=y;bottom+=y;}public boolean intersect(int l,int t,int r,int b){left=Math.max(l,left);top=Math.max(t,top);right=Math.min(r,right);bottom=Math.min(b,bottom);return left<right&&top<bottom;}public int width(){return right-left;}public float exactCenterX(){return (left+right)/2f;}}''',
'android/graphics/Canvas.java':'package android.graphics;public class Canvas{public String text;public float x,y;public void drawText(String s,float x,float y,Paint p){text=s;this.x=x;this.y=y;}}',
'android/graphics/drawable/Drawable.java':'''package android.graphics.drawable;import android.graphics.*;public abstract class Drawable{public void setBounds(int a,int b,int c,int d){}public void invalidateSelf(){}public abstract void draw(Canvas c);public abstract void setAlpha(int a);public abstract void setColorFilter(ColorFilter f);public abstract int getOpacity();}''',
'ls/augment/com/ConfigSchema.java':'package ls.augment.com;public class ConfigSchema{public static final String AUDIO_GAIN_ENABLED="gain";}',
'ls/augment/com/SystemUiOptions.java':'package ls.augment.com;public class SystemUiOptions{public static final String QS_VOLUME_PERCENT="percent";}',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;public class FeatureSettings{static java.util.Set<String> enabled=new java.util.HashSet<>();static String scale="";static boolean enabled(android.content.Context c,String k){return enabled.contains(k);}static android.content.Context from(Object o){return new android.content.Context();}static String diagnosticValue(android.content.Context c,String k){return scale;}}''',
'ls/augment/com/hook/TestVolumePercent.java':'''package ls.augment.com.hook;import android.view.*;import android.widget.*;import android.graphics.*;import java.lang.reflect.*;public class TestVolumePercent{
 static int count;static void check(boolean ok,String s){count++;if(!ok)throw new AssertionError(s);}public static class State{public int level=5,levelMax=15;public boolean muted;}public static class Row{public TextView header=new TextView(),number=new TextView();public State ss=new State();public View slider=new View(),icon=new View();}
 static Method update;static void show(Row row,View root,int stream)throws Exception{update.invoke(null,new android.content.Context(),row,root,stream);}
 public static void main(String[] args)throws Exception{update=AudioGainUiHook.class.getDeclaredMethod("updateVolumeLabel",android.content.Context.class,Object.class,View.class,int.class);update.setAccessible(true);Row row=new Row();View root=new View();
 FeatureSettings.enabled.add("percent");show(row,root,2);check(row.number.getText().toString().equals("33%")&&root.overlay.items.isEmpty(),"ring uses visible OEM number, no duplicate overlay");
 row.ss.muted=true;show(row,root,3);check(row.number.getText().toString().equals("0%"),"muted media reports zero");row.ss.muted=false;
 FeatureSettings.enabled.add("gain");FeatureSettings.scale="15,5,200";row.ss.levelMax=35;row.ss.level=26;show(row,root,3);check(row.number.getText().toString().equals("155%"),"validated gain may exceed 100%");
 FeatureSettings.enabled.add("ls_augment_rm_audio_steps_media_enabled");show(row,root,3);check(row.number.getText().toString().equals("155%")&&row.header.getText().toString().contains("26 / 35"),"steps do not replace percentage");
 row.number.visibility=View.GONE;show(row,root,3);check(root.overlay.items.size()==1,"hidden OEM number gets one fallback");show(row,root,3);check(root.overlay.items.size()==1,"updates reuse fallback");Canvas canvas=new Canvas();root.overlay.items.get(0).draw(canvas);check("155%".equals(canvas.text)&&canvas.x==60&&canvas.y>=10&&canvas.y<=350,"fallback inside slider bounds, away from speaker");
 row.number.visibility=View.VISIBLE;show(row,root,3);check(root.overlay.items.isEmpty(),"visible OEM label removes old overlay");
 FeatureSettings.scale="15,5,300";show(row,root,3);check(row.number.getText().toString().equals("74%"),"stale gain range not trusted");
 row.number.visibility=View.GONE;row.ss.muted=true;show(row,root,3);canvas=new Canvas();root.overlay.items.get(0).draw(canvas);check("0%".equals(canvas.text),"muted overlay stays zero");
 FeatureSettings.enabled.clear();show(row,root,3);check(root.overlay.items.isEmpty()&&row.header.getText().toString().equals("媒体"),"off removes decorations and step suffix");
 row.ss.levelMax=0;show(row,root,3);check(root.overlay.items.isEmpty(),"invalid max never divides");
 System.out.println("PASS production volume labels: "+count+" checks");}
}'''
})
for name in ('AudioGainPolicy.java','hook/AudioGainUiHook.java'):files['ls/augment/com/'+name]=(SRC/name).read_text(encoding='utf-8')
with tempfile.TemporaryDirectory(prefix='lsa-volume-label-') as temp:
 sources=[]
 for name,source in files.items():
  path=Path(temp)/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(source,encoding='utf-8');sources.append(str(path))
 subprocess.run(['javac','-encoding','UTF-8','-d',temp,*sources],check=True)
 subprocess.run(['java','-cp',temp,'ls.augment.com.hook.TestVolumePercent'],check=True)
