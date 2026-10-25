"""Production dot editor interactions on widget facades; no Android visual QA claim."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
helper=ROOT/'tools/test-privacy-dot-spacing-runtime.py'
scope={'__file__':str(helper)}
exec(compile(helper.read_text(encoding='utf-8').split('with tempfile.TemporaryDirectory(',1)[0],str(helper),'exec'),scope)
files={k:v for k,v in scope['files'].items() if k.startswith('android/') or k=='ls/augment/com/BuildConfig.java'}
files.update({
'android/content/Context.java': '''package android.content;public class Context{public static final String WINDOW_SERVICE="window";public final android.content.res.Resources resources=new android.content.res.Resources();public final android.view.WindowManager wm=new android.view.WindowManager();public final SharedPreferences prefs=new SharedPreferences();public String getPackageName(){return "ls.augment.com";}public android.content.res.Resources getResources(){return resources;}public Object getSystemService(String n){return wm;}public SharedPreferences getSharedPreferences(String n,int mode){return prefs;}}''',
'android/content/SharedPreferences.java':'package android.content;public class SharedPreferences{public final java.util.Map<String,String> map=new java.util.HashMap<>();public String getString(String k,String d){return map.getOrDefault(k,d);}}',
'android/content/res/Configuration.java':'package android.content.res;public class Configuration{public float fontScale=1;public int direction;public int getLayoutDirection(){return direction;}}',
'android/view/WindowManager.java':'package android.view;public class WindowManager{public final Display display=new Display();public Display getDefaultDisplay(){return display;}}',
'android/widget/TextView.java':'package android.widget;public class TextView extends android.view.View{public String text="";public TextView(android.content.Context c){}public void setText(CharSequence s){text=s.toString();}}',
'android/widget/Button.java':'package android.widget;public class Button extends TextView{public Button(android.content.Context c){super(c);}}',
'android/widget/LinearLayout.java':'''package android.widget;public class LinearLayout extends android.view.ViewGroup{public static final int VERTICAL=1;public LinearLayout(android.content.Context c){}public void setOrientation(int v){}public void addView(android.view.View v,Object...lp){add(v);}}''',
'android/widget/SeekBar.java':'''package android.widget;public class SeekBar extends android.view.View{public interface OnSeekBarChangeListener{void onStartTrackingTouch(SeekBar b);void onProgressChanged(SeekBar b,int p,boolean u);void onStopTrackingTouch(SeekBar b);}public int max=100,progress;public OnSeekBarChangeListener listener;public SeekBar(android.content.Context c){}public void setMax(int v){max=v;setProgress(Math.min(progress,v));}public int getMax(){return max;}public void setProgress(int v){progress=Math.max(0,Math.min(max,v));if(listener!=null)listener.onProgressChanged(this,progress,false);}public int getProgress(){return progress;}public void setOnSeekBarChangeListener(OnSeekBarChangeListener l){listener=l;}public void drag(int p){listener.onStartTrackingTouch(this);progress=p;listener.onProgressChanged(this,p,true);}public void release(){listener.onStopTrackingTouch(this);}}''',
'android/widget/Toast.java':'package android.widget;public class Toast{public static final int LENGTH_LONG=1;public static String latest="";public static Toast makeText(android.content.Context c,String s,int length){latest=s;return new Toast();}public void show(){}}',
'ls/augment/com/AppConfig.java':'package ls.augment.com;public class AppConfig{public static final String DIAGNOSTICS="diagnostics";}',
'ls/augment/com/UiKit.java':'''package ls.augment.com;import android.widget.*;public class UiKit{public int muted;public final android.content.Context context;public UiKit(android.content.Context c){context=c;}public TextView text(String s,int size,int color,boolean bold){TextView v=new TextView(context);v.setText(s);return v;}public int dp(int v){return v;}public Object wrap(){return new Object();}public Object margins(int a,int b,int c,int d){return new Object();}public Button tonalButton(String s){Button b=new Button(context);b.setText(s);return b;}public android.view.View foldingSection(String title,android.view.View content,boolean open){return content;}}''',
'ls/augment/com/TestPrivacyDotEditor.java':'''package ls.augment.com;import android.view.*;import android.widget.*;import android.content.*;import java.util.*;
public class TestPrivacyDotEditor{
 static int checks,writes,refreshes;static String raw="";static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
 static List<View> all(View root){List<View> out=new ArrayList<>();out.add(root);if(root instanceof ViewGroup)for(View child:((ViewGroup)root).children)out.addAll(all(child));return out;}
 static List<SeekBar> bars(View root){List<SeekBar> out=new ArrayList<>();for(View v:all(root))if(v instanceof SeekBar)out.add((SeekBar)v);return out;}
 static boolean hasText(View root,String text){for(View v:all(root))if(v instanceof TextView&&((TextView)v).text.contains(text))return true;return false;}
 static Button button(View root,String text){for(View v:all(root))if(v instanceof Button&&((Button)v).text.equals(text))return (Button)v;throw new AssertionError(text);}
 static View page(Context c,String target){LinearLayout parent=new LinearLayout(c);PrivacyDotSpacingEditor.add(c,new UiKit(c),parent,target,()->raw,value->{raw=value;writes++;},()->refreshes++);return parent;}
 static void evidence(Context c,int h,int v){long now=android.os.SystemClock.now;c.prefs.map.put(PrivacyDotSpacingObservation.KEY+c.wm.display.rotation,new PrivacyDotSpacingObservation(System.currentTimeMillis()-now,now,20452,0,c.wm.display.rotation,1000,1000,0,h,v,"native").serialize());}
 public static void main(String[]args){Context c=new Context();raw=StatusBarIconSpacingSpec.empty().with("all","wifi",new StatusBarIconSpacingSpec.Insets(1,2,3,4)).serialize();
 View page=page(c,"all");check(bars(page).isEmpty()&&hasText(page,"摄像头或麦克风"),"missing actual capacity offers acquisition conditions without active sliders");check(writes==0,"opening cannot save zero over another icon's draft");
 evidence(c,7,8);page=page(c,"all");List<SeekBar> sliders=bars(page);check(sliders.size()==4,"verified observation enables four edges");check(sliders.get(0).max==7&&sliders.get(1).max==8,"measured horizontal and vertical limits replace guessed 24dp");
 sliders.get(0).drag(5);check(sliders.get(2).max==2,"start drag immediately reduces end maximum");sliders.get(0).release();StatusBarIconSpacingSpec spec=StatusBarIconSpacingSpec.parse(raw);check(spec.resolve("main","privacy.dot").start==5,"valid value written exactly");check(spec.resolve("main","wifi").start==1&&spec.resolve("main","wifi").bottom==4,"unrelated icon draft preserved");
 sliders.get(1).drag(3);check(sliders.get(3).max==5,"vertical total coupled independently");sliders.get(1).release();check(StatusBarIconSpacingSpec.parse(raw).resolve("lock","privacy.dot").top==3,"shared valid parameters inherited");
 int before=writes;c.wm.display.rotation=1;sliders.get(0).release();check(writes==before&&refreshes==1&&Toast.latest.contains("未保存"),"capacity change before release refuses stale write");check(bars(page(c,"all")).isEmpty(),"rotation with no observation disables editor");
 c.wm.display.rotation=0;raw=StatusBarIconSpacingSpec.parse(raw).with("all","privacy.dot",new StatusBarIconSpacingSpec.Insets(24,24,24,24)).serialize();page=page(c,"all");check(bars(page).isEmpty()&&hasText(page,"超过当前方向")&&raw.contains("24,24,24,24"),"oversized import stays visible and unchanged, cannot masquerade as applied");
 button(page,"此位置使用原厂边距").performClick();check(StatusBarIconSpacingSpec.parse(raw).resolve("main","privacy.dot").isZero(),"explicit native reset works while out of range");check(bars(page(c,"all")).size()==4,"reset returns to bounded editable values");
 check(bars(page(c,"control")).isEmpty()&&hasText(page(c,"notification"),"收起这个圆点"),"native-hidden shade surfaces have no ineffective controls");
 evidence(c,0,0);page=page(c,"main");check(bars(page).size()==4,"verified zero capacity remains explained");for(SeekBar slider:bars(page))check(!slider.enabled&&slider.max==0,"zero-capacity edge cannot be moved");
 android.os.SystemClock.now+=PrivacyDotSpacingObservation.MAX_AGE_MS+1;check(bars(page(c,"all")).isEmpty(),"aged observation cannot activate controls");
 System.out.println("Privacy dot production editor facade: "+checks+" assertions passed (not screenshot QA)");
}}
'''
})
files['android/view/View.java']=files['android/view/View.java'].replace('public class View {','''public class View {
 public interface OnClickListener{void onClick(View v);}public OnClickListener click;public boolean enabled=true;public Object tag;public int minimumHeight;public void setEnabled(boolean v){enabled=v;}public void setTag(Object v){tag=v;}public void setMinimumHeight(int v){minimumHeight=v;}public void setContentDescription(String s){}public void setOnClickListener(OnClickListener v){click=v;}public void performClick(){if(click!=null)click.onClick(this);}
''')
# Match current UiKit and string resources while exercising the real spacing policy.
files['ls/augment/com/UiKit.java']=files['ls/augment/com/UiKit.java'].replace('public int muted;', 'public SeekBar slider(){return new SeekBar(context);}public int muted;')
files['ls/augment/com/R.java']='package ls.augment.com;public class R{public static class string{public static final int status_privacydotspacingeditor_36=0,status_statusbariconspacingeditor_44=1,status_statusbariconspacingeditor_45=2;}}'
files['android/content/Context.java']=files['android/content/Context.java'].replace('public class Context{', 'public class Context{public String getString(int id,Object...args){return String.format(java.util.Locale.ROOT,new String[]{"%1$s · %2$s / %3$s dp","%1$s · %2$s dp%3$s","%1$s · %2$s dp"}[id],args);}')

# Dialog rendering is covered by NumericParameterUiCases; retain this suite's widget boundary.
files['ls/augment/com/NumericParameterEditor.java']='package ls.augment.com;class NumericParameterEditor{static void linear(UiKit u,android.widget.SeekBar b,String t,double o,double s,String unit,android.view.View...v){}}'


with tempfile.TemporaryDirectory(prefix='duo-privacy-dot-ui-') as tmp:
    paths=[]
    for name,text in files.items():
        path=Path(tmp)/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(text,encoding='utf-8');paths.append(path)
    jdk=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
    names=['StatusBarIconSpacingSpec.java','StatusBarSurfaceSpec.java','StatusBarIconCatalog.java','PrivacyDotSpacingObservation.java','PrivacyDotSpacingEditor.java']
    subprocess.run([str(jdk/'javac.exe'),'-encoding','UTF-8','--release','17','-d',tmp,*map(str,paths),*[str(SRC/n) for n in names]],check=True)
    subprocess.run([str(jdk/'java.exe'),'-cp',tmp,'ls.augment.com.TestPrivacyDotEditor'],check=True,timeout=10)
