"""Run the production color walker against nested OEM surfaces and legacy controls."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
files = {
    'android/content/res/ColorStateList.java': '''package android.content.res; public class ColorStateList {
 public final int color; public ColorStateList(int c){color=c;} public static ColorStateList valueOf(int c){return new ColorStateList(c);}}''',
    'android/content/res/Resources.java': '''package android.content.res; public class Resources {
 public String pkg="com.zte.personalagent",name="meeting_card_content_area"; public boolean missing;
 public String getResourcePackageName(int id){if(missing)throw new NotFoundException();return pkg;}
 public String getResourceEntryName(int id){if(missing)throw new NotFoundException();return name;}
 public static class NotFoundException extends RuntimeException {}}''',
    'android/view/View.java': '''package android.view; public class View {
 public static final int NO_ID=-1;public int id=1;public Object background=new Object();
 public android.content.res.Resources resources=new android.content.res.Resources();
 public int getId(){return id;}public Object getBackground(){return background;}public android.content.res.Resources getResources(){return resources;}}''',
    'android/view/ViewGroup.java': '''package android.view; public class ViewGroup extends View {
 public java.util.List<View> children=new java.util.ArrayList<>();public int getChildCount(){return children.size();}
 public View getChildAt(int i){return children.get(i);}}''',
    'android/widget/TextView.java': '''package android.widget; public class TextView extends android.view.View {
 public int color=0xff151515;public void setTextColor(int c){color=c;}}''',
    'android/widget/ImageView.java': '''package android.widget; public class ImageView extends android.view.View {
 public android.content.res.ColorStateList tint;public void setImageTintList(android.content.res.ColorStateList c){tint=c;}}''',
    'ls/augment/com/hook/TestCardContrast.java': '''package ls.augment.com.hook;
import android.view.*;import android.widget.*;
public class TestCardContrast {
 static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static class MeetingSubclass extends ViewGroup {}
 public static void main(String[]args){
  ViewGroup wrapper=new ViewGroup();wrapper.id=View.NO_ID;
  ViewGroup meeting=new MeetingSubclass();TextView title=new TextView(),join=new TextView(),ignore=new TextView();join.color=-1;
  meeting.children.add(title);meeting.children.add(join);meeting.children.add(ignore);wrapper.children.add(meeting);
  NativeIslandCardContrast.apply(wrapper,-1);
  check(title.color==0xff151515&&ignore.color==0xff151515&&join.color==-1,"nested light OEM panel retains distinct title and button colors");
  title.color=-1;ignore.color=0xffaaaaaa;NativeIslandCardContrast.apply(wrapper,0xff000000);
  check(title.color==-1&&ignore.color==0xffaaaaaa&&join.color==-1,"configuration refresh preserves OEM dark colors and primary button");
  ViewGroup capsule=new ViewGroup();capsule.resources.name="starryisland_meeting";TextView compact=new TextView();capsule.children.add(compact);
  NativeIslandCardContrast.apply(capsule,-1);check(compact.color==-1,"compact title still follows actual island foreground");
  meeting.resources.pkg="other.package";NativeIslandCardContrast.apply(meeting,0xff123456);
  check(title.color==0xff123456,"same root name in another package is not exempt");
  meeting.resources.pkg="com.zte.personalagent";meeting.background=null;NativeIslandCardContrast.apply(meeting,-1);
  check(title.color==-1,"transparent panel still needs host foreground");
  meeting.background=new Object();meeting.resources.missing=true;NativeIslandCardContrast.apply(meeting,0xff234567);
  check(title.color==0xff234567,"unknown resource preserves legacy tint without throwing");
  ViewGroup legacy=new ViewGroup();legacy.resources.name="countdown_panel";TextView value=new TextView();ImageView pause=new ImageView();pause.resources.name="play_pause_icon";
  ImageView record=new ImageView();record.resources.name="live_island_btn_resume_pause";ImageView brand=new ImageView();brand.resources.name="brand_logo";
  legacy.children.add(value);legacy.children.add(pause);legacy.children.add(record);legacy.children.add(brand);
  NativeIslandCardContrast.apply(legacy,-1);
  check(value.color==-1&&pause.tint.color==-1&&record.tint.color==-1,"countdown and recording foreground still corrected");
  check(brand.tint==null,"unrelated image tint preserved");
  NativeIslandCardContrast.apply(null,-1);check(true,"compact-only cards may have no large view");
  System.out.println("Native card contrast: "+checks+" checks");
 }}''',
}
with tempfile.TemporaryDirectory(prefix='duo-card-contrast-') as folder:
    sources = []
    for name, value in files.items():
        path = Path(folder) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(value, encoding='utf-8')
        sources.append(str(path))
    sources.append(str(ROOT / 'android/app/src/main/java/ls/augment/com/hook/NativeIslandCardContrast.java'))
    java = Path(os.environ['JAVA_HOME']) / 'bin'
    suffix = '.exe' if os.name == 'nt' else ''
    subprocess.run([str(java / ('javac' + suffix)), '-encoding', 'UTF-8', '-d', folder, *sources], check=True)
    subprocess.run([str(java / ('java' + suffix)), '-cp', folder, 'ls.augment.com.hook.TestCardContrast'], check=True)
