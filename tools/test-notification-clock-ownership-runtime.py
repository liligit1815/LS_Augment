"""Run both production header hooks together in both interceptor orders.

The facade tests shared size ownership and restoration; it cannot validate the
real RelativeLayout measure pass or phone rendering.
"""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"
helper = ROOT / "tools/test-notification-appearance-runtime.py"
scope = {"__file__": str(helper)}
exec(compile(helper.read_text(encoding="utf-8").split("java=Path(", 1)[0], str(helper), "exec"), scope)
files = scope["files"]

# A method can have several independent interceptors in production. A map of
# method -> one callback hides the very collision covered by this regression.
files["ls/augment/com/hook/AugmentModule.java"] = files["ls/augment/com/hook/AugmentModule.java"].replace(
    "Map<Method,Interceptor>", "Map<Method,List<Interceptor>>"
).replace(
    "final Object[] args;Chain", "final Object[] args;int index;Chain"
).replace(
    'Object proceed(Object[] a)throws Throwable{try{',
    'Object proceed(Object[] a)throws Throwable{List<Interceptor> list=active.hooks.get(method);if(list!=null&&index<list.size())return list.get(index++).run(this);try{'
).replace(
    'hooks.put(method,i);', 'hooks.computeIfAbsent(method,key->new ArrayList<>()).add(i);'
).replace(
    'Interceptor hook=active.hooks.get(m);return hook==null?c.proceed():hook.run(c);', 'return c.proceed();'
)
files.update({
"android/text/TextPaint.java": """package android.text;public class TextPaint extends android.graphics.Paint {public void set(android.graphics.Paint p){size=p.size;}public void setTextSize(float v){size=v;}}""",
"android/text/Layout.java": """package android.text;public class Layout {public static float getDesiredWidth(CharSequence s,TextPaint p){return p.measureText(s.toString());}}""",
"android/text/Spanned.java": """package android.text;public interface Spanned {int SPAN_EXCLUSIVE_EXCLUSIVE=33;}""",
"android/text/SpannableStringBuilder.java": """package android.text;public class SpannableStringBuilder implements CharSequence {final StringBuilder value=new StringBuilder();public SpannableStringBuilder(CharSequence s){value.append(s);}public SpannableStringBuilder append(CharSequence s){value.append(s);return this;}public void setSpan(Object o,int start,int end,int flags){}public int length(){return value.length();}public char charAt(int i){return value.charAt(i);}public CharSequence subSequence(int a,int b){return value.subSequence(a,b);}public String toString(){return value.toString();}}""",
"android/text/style/RelativeSizeSpan.java": """package android.text.style;public class RelativeSizeSpan {public RelativeSizeSpan(float value){}}""",
"android/text/format/DateFormat.java": """package android.text.format;public class DateFormat {public static boolean is24HourFormat(android.content.Context c){return true;}}""",
"android/os/LocaleList.java": """package android.os;public class LocaleList {public java.util.Locale get(int i){return java.util.Locale.US;}}""",
"android/view/ViewStub.java": """package android.view;public class ViewStub extends View {public View inflate(){return new android.widget.TextView();}}""",
"ls/augment/com/ConfigSnapshot.java": """package ls.augment.com;public class ConfigSnapshot {public long revision=1;final java.util.Map<String,String> values;public ConfigSnapshot(java.util.Map<String,String> v){values=new java.util.HashMap<>(v);}public String get(String key){return values.getOrDefault(key,\"\");}}""",
"ls/augment/com/hook/CarrierTextHook.java": """package ls.augment.com.hook;public class CarrierTextHook {static void bindHeader(Object view){}}""",
})
files["android/content/res/Configuration.java"] = files["android/content/res/Configuration.java"].replace(
    "public int orientation", "public android.os.LocaleList getLocales(){return new android.os.LocaleList();}public int orientation"
)
files["android/view/View.java"] = files["android/view/View.java"].replace(
    "public void invalidate(){}", """public interface OnClickListener {void onClick(View v);}public int layouts;public void requestLayout(){layouts++;}public boolean post(Runnable r){r.run();return true;}public boolean postDelayed(Runnable r,long delay){return true;}public void removeCallbacks(Runnable r){}public boolean hasOnClickListeners(){return click!=null;}public void setOnClickListener(OnClickListener l){click=l==null?null:()->l.onClick(this);}public void setClickable(boolean value){clickable=value;}public void setContentDescription(CharSequence s){}public void invalidate(){}"""
)
files["android/widget/TextView.java"] = files["android/widget/TextView.java"].replace(
    'public float getTextSize()', 'public boolean mShowSeconds=false;public void updateShowSeconds(){}public void updateClock(){}public int getCurrentTextColor(){return 0xff000000;}public void setTextColor(int c){}public float getTextSize()'
)
files["ls/augment/com/hook/FeatureSettings.java"] = files["ls/augment/com/hook/FeatureSettings.java"].replace(
    'public static final java.util.Map', 'public static ls.augment.com.ConfigSnapshot cached;public static ls.augment.com.ConfigSnapshot snapshot(android.content.Context c){if(cached==null)cached=new ls.augment.com.ConfigSnapshot(values);return cached;}public static final java.util.Map'
).replace('values.put(key,value);', 'values.put(key,value);cached=null;')
files["com/zte/controlcenter/widget/CCHeaderView.java"] = files["com/zte/controlcenter/widget/CCHeaderView.java"].replace(
    'public void native_updateVisibilities(){}', 'public void native_updateVisibilities(){}public boolean shouldQsCarrierVisible(){return false;}'
)
files["ls/augment/com/hook/TestNotificationAppearance.java"] = files["ls/augment/com/hook/TestNotificationAppearance.java"].replace(
    'check(NotificationAppearanceHook.install', 'if(args.length>0)ControlCenterHeaderHook.install(module,TestNotificationAppearance.class.getClassLoader());check(NotificationAppearanceHook.install'
).replace(
    '==15,"native appearance signatures install");', '==15,"native appearance signatures install");if(args.length==0)ControlCenterHeaderHook.install(module,TestNotificationAppearance.class.getClassLoader());'
).replace(
    'check(list.mAmbientState.mTopPadding>100,"real notification top padding reserves clock space");', '''check(list.mAmbientState.mTopPadding>100,"real notification top padding reserves clock space");
 check(NotificationAppearanceHook.ownsClock(header.mClockView),"expanded clock explicitly owns native TextView size");near(NotificationAppearanceHook.nativeClockSize(header.mClockView),24,"expanded appearance exposes its preserved native baseline");
 for(int i=0;i<50;i++)header.getViewTreeObserver().draw();near(header.mClockView.getTextSize(),64,"legacy fitClock cannot reset expanded clock on pre-draw");
 FeatureSettings.change("ls_augment_rm_qs_clock_seconds","1");header.getViewTreeObserver().draw();near(header.mClockView.getTextSize(),64,"seconds rendering coexists with expanded clock size");FeatureSettings.change("ls_augment_rm_qs_clock_seconds","0");
 header.nativeSize=28;header.updateHeaderResources();header.getViewTreeObserver().draw();near(header.mClockView.getTextSize(),64,"resource refresh re-expands after native size changes in either interceptor order");near(NotificationAppearanceHook.nativeClockSize(header.mClockView),28,"resource refresh captures true new native size rather than expanded size");
 FeatureSettings.change(NotificationAppearanceOptions.CLOCK_PORTRAIT,"0");header.getViewTreeObserver().draw();near(header.mClockView.getTextSize(),28,"disable and subsequent legacy pre-draw restore new native baseline");check(!NotificationAppearanceHook.ownsClock(header.mClockView),"disabled clock releases size ownership");
 header.nativeSize=24;header.updateHeaderResources();FeatureSettings.change(NotificationAppearanceOptions.CLOCK_PORTRAIT,"1");'''
).replace(
    'near(header.mClockView.getTextSize(),30,"disable restores latest OEM resource size, not stale first snapshot");', 'header.getViewTreeObserver().draw();near(header.mClockView.getTextSize(),30,"disable restores latest OEM resource size, not stale first snapshot");'
).replace(
    'Actual NotificationAppearanceHook:', 'Both production clock hooks (' + '"+(args.length==0?"appearance-first":"header-first")+"' + '):'
)
import runpy
runpy.run_path(str(ROOT/'tools/header-clock-facade-support.py'))['apply'](files,formatter=True)
files['android/text/StaticLayout.java']=files['android/text/StaticLayout.java'].replace(
    'public class StaticLayout extends Layout{','public class StaticLayout extends Layout{public static int builds;'
).replace('public StaticLayout build(){','public StaticLayout build(){builds++;')
files['android/view/ViewGroup.java']=files['android/view/ViewGroup.java'].replace(
    'public class ViewGroup extends View{','public class ViewGroup extends View{public static int searches;'
).replace('public View findViewById(int i){','public View findViewById(int i){searches++;')
assert 'findViewById(int i){searches++;' in files['android/view/ViewGroup.java']
files['android/view/View.java']=files['android/view/View.java'].replace(
    'public class View implements ViewParent{','public class View implements ViewParent{public static int rootReads;'
).replace('public View getRootView(){','public View getRootView(){rootReads++;')
assert 'getRootView(){rootReads++;' in files['android/view/View.java']
files['ls/augment/com/hook/TestNotificationAppearance.java']=files['ls/augment/com/hook/TestNotificationAppearance.java'].replace(
    'for(int i=0;i<50;i++)header.getViewTreeObserver().draw();',
    'int stableBuilds=android.text.StaticLayout.builds;check(stableBuilds>0,"layout counter observes actual initial measurement");for(int i=0;i<50;i++)header.getViewTreeObserver().draw();check(android.text.StaticLayout.builds<=stableBuilds+2,"steady header frames do not rebuild clock/date layouts");header.mClockView.setText("11:59");int nativeTextBuilds=android.text.StaticLayout.builds;header.getViewTreeObserver().draw();check(android.text.StaticLayout.builds>nativeTextBuilds,"native time changes remeasure even without a parent layout request");'
).replace(
    'FeatureSettings.change("ls_augment_rm_qs_clock_seconds","1");header.getViewTreeObserver().draw();',
    'FeatureSettings.change("ls_augment_rm_qs_clock_seconds","1");header.getViewTreeObserver().draw();int secondsBuilds=android.text.StaticLayout.builds;for(int i=0;i<25;i++)header.getViewTreeObserver().draw();check(android.text.StaticLayout.builds<=secondsBuilds+2,"steady formatted clock frames retain measured text boxes");'
).replace(
    'near(header.mClockView.getTextSize(),24,"default native clock");',
    'near(header.mClockView.getTextSize(),24,"default native clock");header.getViewTreeObserver().draw();int disabledSearches=ViewGroup.searches;header.getRootView();int disabledRoots=View.rootReads;check(disabledSearches>0,"window lookup counter observes actual initial binding");check(disabledRoots>0,"root lookup counter observes actual root getter");for(int i=0;i<200;i++){header.getViewTreeObserver().draw();footer.getViewTreeObserver().draw();list.updateChildren();}check(ViewGroup.searches==disabledSearches,"disabled header and footer skip whole-window lookup during shade frames");check(View.rootReads==disabledRoots,"disabled stack and viewport skip root discovery during shade frames");'
)
java = Path("C:/Program Files/Android/openjdk/jdk-21.0.8/bin")
with tempfile.TemporaryDirectory(prefix="lsa-clock-ownership-") as folder:
    work=Path(folder);paths=[]
    for name,code in files.items():
        path=work/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(code,encoding="utf-8");paths.append(path)
    paths += [SRC/name for name in ["HeaderClockGeometry.java","HeaderClockLayout.java","EnhancementOption.java","NotificationAppearanceOptions.java","NotificationLayoutPolicy.java","CarrierTextOptions.java","SystemUiPolicy.java","hook/SystemUiAdapter.java","hook/NotificationAppearanceHook.java","hook/NotificationViewportInset.java","hook/ControlCenterHeaderHook.java"]]
    subprocess.run([str(java/"javac.exe"),"-encoding","UTF-8","--release","17","-d",folder,*map(str,paths)],check=True)
    for arguments in ([],["header-first"]):
        subprocess.run([str(java/"java.exe"),"-cp",folder,"ls.augment.com.hook.TestNotificationAppearance",*arguments],check=True,timeout=10)
