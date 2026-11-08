"""Execute the production download panel against old/inherited/missing OEM view contracts."""
from pathlib import Path
import os
import runpy
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
base=runpy.run_path(str(ROOT/'tools/test-island-download-runtime.py'))
FILES=dict(base['FILES'])
FILES.update({
'android/content/Context.java':'package android.content;public class Context{public int getColor(int id){return id;}public android.content.res.Resources getResources(){return new android.content.res.Resources();}}',
'android/content/res/Resources.java':'package android.content.res;public class Resources{public static java.util.Map<String,Integer> colors=new java.util.HashMap<>();public int getIdentifier(String n,String t,String p){return colors.getOrDefault(n,0);}public android.content.res.Configuration getConfiguration(){return new android.content.res.Configuration();}public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}}',
'android/content/res/Configuration.java':'package android.content.res;public class Configuration{public float fontScale=1;}',
'android/util/TypedValue.java':'package android.util;public class TypedValue{public static final int COMPLEX_UNIT_PX=0;}',
'android/util/DisplayMetrics.java':'package android.util;public class DisplayMetrics{public float density=1;}',
'android/content/res/ColorStateList.java':'package android.content.res;public class ColorStateList{public int color;public static ColorStateList valueOf(int c){ColorStateList v=new ColorStateList();v.color=c;return v;}}',
'android/graphics/Color.java':'package android.graphics;public class Color{public static final int WHITE=-1;}',
'android/graphics/drawable/Drawable.java':'package android.graphics.drawable;public class Drawable{}',
'android/text/TextPaint.java':'package android.text;public class TextPaint{public float measureText(String t){return 9*t.length();}}',
'android/text/TextUtils.java':'package android.text;public class TextUtils{public enum TruncateAt{END}public static boolean isEmpty(CharSequence s){return s==null||s.length()==0;}}',
'android/view/Gravity.java':'package android.view;public class Gravity{public static final int CENTER_VERTICAL=16,END=8388613;}',
'android/graphics/Typeface.java':'package android.graphics;public class Typeface{public static final int NORMAL=0;public static Typeface create(String s,int n){return new Typeface();}}',
'android/R.java':'package android;public class R{public static class attr{public static final int progressBarStyleHorizontal=1;}}',
'android/view/View.java':'''package android.view;import android.content.Context;public class View{
public static final int VISIBLE=0,GONE=8;public Object parent;public Object getParent(){return parent;}public int visibility,padding,minHeight;public Object params;public Context context;
public interface OnClickListener{void onClick(View v);}public OnClickListener click;public View(Context c){context=c;}
public static class MeasureSpec{public static final int UNSPECIFIED=0,EXACTLY=1;public static int makeMeasureSpec(int size,int mode){return size;}public static int getSize(int n){return n;}}
public void measure(int w,int h){}public int getMeasuredWidth(){return 40;}public int getMeasuredHeight(){return 60;}public int getVisibility(){return visibility;}
public int getPaddingLeft(){return 8;}public int getPaddingTop(){return 8;}public int getPaddingRight(){return 8;}public int getPaddingBottom(){return 8;}public Context getContext(){return context;}public void setOnClickListener(OnClickListener l){click=l;}public void click(){if(click!=null)click.onClick(this);}
public void setVisibility(int v){visibility=v;}public void setPadding(int a,int b,int c,int d){padding=a+b+c+d;}public void setLayoutParams(Object p){params=p;}
public void setMinimumWidth(int w){}public void setMinWidth(int w){}public ViewGroup.LayoutParams getLayoutParams(){return (ViewGroup.LayoutParams)params;}public void setMinHeight(int h){minHeight=h;}public void setMinimumHeight(int h){minHeight=h;}}''',
'android/view/ViewGroup.java':'''package android.view;import java.util.*;public class ViewGroup extends View{
public static class LayoutParams{public int width,height;public LayoutParams(int w,int h){width=w;height=h;}}
public List<View> children=new ArrayList<>();public ViewGroup(android.content.Context c){super(c);}public void addView(View v,Object p){v.parent=this;v.setLayoutParams(p);children.add(v);}
public void addView(View v,int index,Object p){v.parent=this;v.setLayoutParams(p);children.add(index,v);}public void removeView(View v){children.remove(v);v.parent=null;}public void removeAllViews(){children.clear();}public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}}''',
'android/widget/FrameLayout.java':'''package android.widget;public class FrameLayout extends android.view.ViewGroup{public FrameLayout(android.content.Context c){super(c);}
public static class LayoutParams extends android.view.ViewGroup.LayoutParams{public void setMarginEnd(int margin){}public LayoutParams(int w,int h){super(w,h);}}}''',
'android/widget/LinearLayout.java':'''package android.widget;public class LinearLayout extends android.view.ViewGroup{public static final int VERTICAL=1;
public static final int HORIZONTAL=0;public LinearLayout(android.content.Context c){super(c);}public void setOrientation(int v){}public int getOrientation(){return 0;}public void setGravity(int v){}protected void onMeasure(int w,int h){}
public static class LayoutParams extends android.view.ViewGroup.LayoutParams{public int topMargin;public LayoutParams(int w,int h){super(w,h);}public LayoutParams(int w,int h,float weight){super(w,h);}public void setMarginStart(int v){}}}''',
'android/widget/ScrollView.java':'''package android.widget;public class ScrollView extends FrameLayout{public ScrollView(android.content.Context c){super(c);}public void setFillViewport(boolean v){}}''',
'android/widget/TextView.java':'''package android.widget;public class TextView extends android.view.View{public CharSequence text;public int color=0xff222222,maxLines;public float size=16,spacing;public boolean include=true;public android.graphics.Typeface typeface=new android.graphics.Typeface();
public TextView(android.content.Context c){super(c);}public void setText(CharSequence t){text=t;}public CharSequence getText(){return text;}public float getTextSize(){return size;}public void setTextSize(int v){size=v;}public void setTextSize(int u,float v){size=v;}public android.content.res.ColorStateList getTextColors(){return android.content.res.ColorStateList.valueOf(color);}public int getCurrentTextColor(){return color;}public void setTextColor(android.content.res.ColorStateList v){color=v.color;}public float getLetterSpacing(){return spacing;}public void setLetterSpacing(float v){spacing=v;}public boolean getIncludeFontPadding(){return include;}public void setIncludeFontPadding(boolean v){include=v;}public android.graphics.Typeface getTypeface(){return typeface;}public void setTextColor(int c){color=c;}
public android.text.TextPaint getPaint(){return new android.text.TextPaint();}public void setGravity(int g){}public void setSingleLine(boolean single){}public void setMaxWidth(int max){}public void setTypeface(android.graphics.Typeface f){typeface=f;}
public void setMaxLines(int n){maxLines=n;}public void setEllipsize(android.text.TextUtils.TruncateAt t){}}''',
'android/widget/ImageView.java':'''package android.widget;public class ImageView extends android.view.View{public enum ScaleType{CENTER_CROP}public android.graphics.drawable.Drawable drawable;
public ImageView(android.content.Context c){super(c);}public void setScaleType(ScaleType t){}public void setImageDrawable(android.graphics.drawable.Drawable d){drawable=d;}}''',
'android/widget/ProgressBar.java':'''package android.widget;public class ProgressBar extends android.view.View{public int progress;public boolean indeterminate;
public ProgressBar(android.content.Context c,Object a,int s){super(c);}public void setMax(int m){}public void setProgress(int p){progress=p;}public void setIndeterminate(boolean b){indeterminate=b;}
public void setProgressTintList(android.content.res.ColorStateList c){}public void setIndeterminateTintList(android.content.res.ColorStateList c){}}''',
'android/widget/Button.java':'''package android.widget;public class Button extends TextView{public Button(android.content.Context c){super(c);}public void setAllCaps(boolean b){}public void setBackgroundTintList(android.content.res.ColorStateList c){}}''',
'ls/augment/com/hook/NativeIslandHost.java':'package ls.augment.com.hook;class NativeIslandHost{static void applyIconShape(android.widget.ImageView v,boolean circle,float radius){}}',
'ls/augment/com/SystemUiOptions.java':'package ls.augment.com;public class SystemUiOptions{public static final String ISLAND_APP_STYLE="style";}',
'ls/augment/com/hook/SystemUiAdapter.java':'''package ls.augment.com.hook;class SystemUiAdapter{static Object field(Object o,String name){
for(Class<?> t=o.getClass();t!=null;t=t.getSuperclass())try{var f=t.getDeclaredField(name);f.setAccessible(true);return f.get(o);}catch(ReflectiveOperationException missing){}return null;}}''',
})
FILES['ls/augment/com/hook/FeatureSettings.java']=FILES['ls/augment/com/hook/FeatureSettings.java'].replace('static Map<','static int integer(Context c,String k,int d,int min,int max){return d;}static Map<')
FILES['android/app/Notification.java']=FILES['android/app/Notification.java'].replace('EXTRA_MEDIA_SESSION="media"','EXTRA_TITLE="title",EXTRA_TEXT="text",EXTRA_MEDIA_SESSION="media"')
FILES['android/os/Bundle.java']=FILES['android/os/Bundle.java'].replace('public int getInt','public CharSequence getCharSequence(String k){return (CharSequence)get(k);}public int getInt')
HARNESS=r'''package ls.augment.com.hook;
import java.util.*;import android.view.*;import android.widget.*;import android.app.*;import android.content.*;import android.service.notification.*;import ls.augment.com.*;
public class DownloadPanelTest{
static int checks;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
static class Panel extends FrameLayout{public List<View> mViewList=new ArrayList<>();public TextView mDisplayText,mDisplaySecondText;public ImageView mDisplayIcon;Panel(){super(new Context());mDisplayText=new TextView(context);mDisplayText.size=19;mDisplaySecondText=new TextView(context);mDisplaySecondText.color=0xff555555;mDisplayIcon=new ImageView(context);mDisplayIcon.setLayoutParams(new FrameLayout.LayoutParams(34,34));addView(new View(context),new FrameLayout.LayoutParams(5,5));padding=32;}}
static class Child extends Panel{}
static class Missing extends FrameLayout{Missing(){super(new Context());addView(new View(context),new FrameLayout.LayoutParams(5,5));}}
static class Wrong extends Missing{public String mViewList="unknown";}
static Object field(Object o,String name){return SystemUiAdapter.field(o,name);}
public static void main(String[] args)throws Exception{
for(FrameLayout invalid:new FrameLayout[]{new Missing(),new Wrong()}){
boolean failed=false;try{new DuoDownloadPanel(invalid);}catch(IllegalStateException expected){failed=true;}
check(failed&&invalid.getChildCount()==1,"missing or malformed OEM contract fails before child mutation");}
for(Panel panel:new Panel[]{new Panel(),new Child()}){
DuoDownloadPanel content=new DuoDownloadPanel(panel);
check(((TextView)field(content,"title")).color==panel.mDisplayText.color&&((TextView)field(content,"detail")).color==panel.mDisplaySecondText.color,"OEM light glass text roles retained");
check(((TextView)field(content,"title")).size==19&&((TextView)field(content,"title")).typeface==panel.mDisplayText.typeface,"OEM title font and size retained");
check(panel.getChildCount()==1&&panel.mViewList.size()==1&&panel.mViewList.get(0)==panel.getChildAt(0),"native animation tracks current download content");
check(panel.getChildAt(0) instanceof ScrollView&&panel.padding==32,"scrollable content retains the single native outer padding");
check(content.desiredHeight(300)==76,"desired height includes native outer padding and the full body");
FrameLayout.LayoutParams bounds=(FrameLayout.LayoutParams)panel.params;check(bounds.width==-1&&bounds.height==-1,"content respects native panel bounds");
IslandDownloadPolicy<StatusBarNotification> policy=new IslandDownloadPolicy<>();
StatusBarNotification n=new StatusBarNotification("task",1,12);n.notification.extras.put("title","Large filename");n.notification.extras.put("text","source text");
PendingIntent pause=new PendingIntent(),open=new PendingIntent();n.notification.contentIntent=open;n.notification.actions=new Notification.Action[]{new Notification.Action("鏆傚仠",pause)};
policy.update("task","channel",1,1,true,false,12,100,n);var first=policy.get("task");
List<PendingIntent> commands=new ArrayList<>();List<Long> revisions=new ArrayList<>();
java.util.function.BiConsumer<IslandDownloadPolicy.Entry<StatusBarNotification>,PendingIntent> dispatch=(e,p)->{commands.add(p);revisions.add(e.revision);};
content.bind(first,new android.graphics.drawable.Drawable(),"Downloader",dispatch);
Button[] buttons=(Button[])field(content,"actionButtons");Button original=buttons[0];ProgressBar progress=(ProgressBar)field(content,"progress");
check(original.visibility==0&&original.minHeight>=48&&original.text.equals("鏆傚仠"),"source button label and touch height preserved");
check(buttons[1].visibility==8&&buttons[2].visibility==8,"no fabricated buttons");
check(progress.progress==12&&!progress.indeterminate,"determinate progress bound");
check(original.getParent()==field(content,"trackRow"),"one download action belongs beside progress");original.click();check(commands.get(0)==pause&&revisions.get(0)==first.revision,"button dispatches exact source intent and revision");
((TextView)field(content,"title")).click();check(commands.get(1)==open,"content opens original intent");
policy.update("task","channel",1,2,true,false,34,100,n);var second=policy.get("task");content.bind(second,null,"Downloader",dispatch);
check(buttons[0]==original&&progress.progress==34,"progress update reuses control instead of canceling touch");
original.click();check(revisions.get(2)==second.revision,"reused button targets latest source revision");
content.foreground(0xff101010);check(original.color==0xff101010&&((TextView)field(content,"title")).color==0xff101010,"glass foreground propagates to text and controls");
policy.update("task","channel",1,3,true,true,-1,0,n);content.bind(policy.get("task"),null,"Downloader",dispatch);check(progress.indeterminate,"indeterminate source supported");
List<PendingIntent> notices=new ArrayList<>();List<StatusBarNotification> reminders=new ArrayList<>();
n.notification.flags=0;
content.bindNotice(n,null,"App",(source,intent)->{check(source==n,"notice source identity lost");notices.add(intent);},reminders::add);
Button remind=(Button)field(content,"snooze");remind.click();check(remind.visibility==0&&reminders.equals(List.of(n)),"snooze targets original notification, separate from app actions");
check(original.getParent()==field(content,"headingRow"),"single message action placed next to message");check(progress.visibility==8&&!progress.indeterminate,"ordinary notice fabricated progress");original.click();
check(notices.size()==1&&notices.get(0)==pause,"notice button did not preserve PendingIntent");
n.notification.actions=new Notification.Action[]{new Notification.Action("A",pause),new Notification.Action("B",open)};content.bindNotice(n,null,"App",(item,intent)->{},reminders::add);
check(original.getParent()==field(content,"buttons")&&buttons[1].visibility==0,"multiple actions use separate row in source order");
n.notification.actions=new Notification.Action[0];n.notification.flags=32;content.bindNotice(n,null,"App",(item,intent)->{},reminders::add);
check(remind.visibility==8&&remind.click==null,"non-clearable notice has no snooze");
check(((LinearLayout)field(content,"buttons")).getVisibility()==8&&original.click==null,"no action leaves no row or callback");
content.bind(policy.get("task"),null,"Downloader",dispatch);check(progress.visibility==0&&progress.indeterminate,"download progress not restored after notice");
check(remind.visibility==8&&remind.click==null,"reused download panel cannot snooze an old notice");
android.content.res.Resources.colors.put("dynamic_island_panel_text_color",0xe6000000);
android.content.res.Resources.colors.put("dynamic_island_text_color",0xa6000000);
content.bind(policy.get("task"),null,"Downloader",dispatch);
check(((TextView)field(content,"title")).color==0xe6000000&&((TextView)field(content,"detail")).color==0xa6000000,"OEM named light resources override legacy white text");
android.content.res.Resources.colors.put("dynamic_island_panel_text_color",0xffffffff);
android.content.res.Resources.colors.put("dynamic_island_text_color",0xffffffff);
content.bindNotice(n,null,"App",(item,intent)->{},reminders::add);
check(((TextView)field(content,"title")).color==0xffffffff&&((TextView)field(content,"detail")).color==0xffffffff,"night theme resources retained when reused for notice");
android.content.res.Resources.colors.clear();
content.clear();int count=commands.size();original.click();((ImageView)field(content,"icon")).click();
check(commands.size()==count&&original.click==null,"retired panel releases actions");
check(!progress.indeterminate&&progress.progress==0&&((TextView)field(content,"title")).text.length()==0,"hidden panel stops progress and clears notification content");
}
System.out.println("PASS download panel contracts/render/actions: "+checks+" checks (framework doubles, not device UI acceptance)");
}}
'''
with tempfile.TemporaryDirectory(prefix='duo-download-panel-') as tmp:
    folder=Path(tmp);files=dict(FILES)
    for name in ('IslandDownloadConfig','IslandDownloadPolicy'):
        files['ls/augment/com/'+name+'.java']=(base['SRC']/(name+'.java')).read_text(encoding='utf-8')
    for name in ('DuoDownloadPanel','IslandDownloadSource'):
        files['ls/augment/com/hook/'+name+'.java']=(base['SRC']/'hook'/(name+'.java')).read_text(encoding='utf-8')
    files['ls/augment/com/hook/DownloadPanelTest.java']=HARNESS
    for name,content in files.items():
        path=folder/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(content,encoding='utf-8')
    subprocess.run([str(base['JDK']/'javac'),'-encoding','UTF-8','-d',str(folder),*map(str,folder.rglob('*.java'))],check=True)
    subprocess.run([str(base['JDK']/'java'),'-cp',str(folder),'ls.augment.com.hook.DownloadPanelTest'],check=True)
