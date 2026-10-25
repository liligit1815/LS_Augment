"""Exercise production MIME/action receiver selection across package changes."""
from pathlib import Path
import runpy
import tempfile

SUPPORT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-engine.py")))

SOURCES = {
    "android/content/Intent.java": r'''package android.content;
public class Intent {
 public static final String ACTION_SEND="send",ACTION_SEND_MULTIPLE="multiple",CATEGORY_DEFAULT="default";
 public String action,type,category,pkg;public Intent(String action){this.action=action;}
 public Intent setPackage(String value){pkg=value;return this;}
 public Intent setType(String type){this.type=type;return this;}public Intent addCategory(String category){this.category=category;return this;}
}''',
    "android/content/ComponentName.java": r'''package android.content;
public class ComponentName {final String pkg,name;public ComponentName(String pkg,String name){this.pkg=pkg;this.name=name;}
 public String flattenToString(){return pkg+"/"+name;}public String getPackageName(){return pkg;}}
''',
    "android/content/pm/ApplicationInfo.java": "package android.content.pm;public class ApplicationInfo {public boolean enabled=true;public int uid=12345;}",
    "android/content/pm/ActivityInfo.java": r'''package android.content.pm;
public class ActivityInfo {public ApplicationInfo applicationInfo=new ApplicationInfo();public boolean enabled=true,exported=true;
 public String packageName,name,permission;}
''',
    "android/content/pm/ResolveInfo.java": r'''package android.content.pm;
public class ResolveInfo {public ActivityInfo activityInfo;public String label,mime,action;public CharSequence loadLabel(PackageManager pm){return label;}
 public android.graphics.drawable.Drawable loadIcon(PackageManager pm){return null;}}
''',
    "android/content/pm/PackageManager.java": r'''package android.content.pm;
public class PackageManager {public static final int MATCH_DEFAULT_ONLY=1;
 public final java.util.List<ResolveInfo> entries=new java.util.ArrayList<>();public android.content.Intent last;public int flags;public boolean fails;
 public java.util.List<ResolveInfo> queryIntentActivities(android.content.Intent query,int flags){if(fails)throw new SecurityException();last=query;this.flags=flags;return entries.stream().filter(r->(r.mime==null||r.mime.equals(query.type))&&(r.action==null||r.action.equals(query.action))).toList();}
 public CharSequence getApplicationLabel(ApplicationInfo app){return "App";}}
''',
    "android/content/Context.java": r'''package android.content;
public class Context {public final android.content.pm.PackageManager pm=new android.content.pm.PackageManager();
 public android.content.pm.PackageManager getPackageManager(){return pm;}public String getPackageName(){return "ls.augment.com";}}
''',
    "android/os/Process.java": "package android.os;public class Process {public static int myUid(){return 12345;}}",
    "android/graphics/drawable/Drawable.java": "package android.graphics.drawable;public class Drawable {}",
    "ls/augment/com/AtomicWorkbenchTransferStore.java": r'''package ls.augment.com;
final class AtomicWorkbenchTransferStore {static class Payload {String text="";final java.util.List<String> mimes=new java.util.ArrayList<>();}}
''',
}
TEST = r'''package ls.augment.com;
import android.content.*;import android.content.pm.*;import java.util.*;
public class TestShareTargets {
 static int cases,checks;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
 static void test(String name,Runnable body){body.run();cases++;System.out.println("PASS share targets: "+name);}
 static ResolveInfo receiver(Context c,String pkg,String name){ResolveInfo r=new ResolveInfo();r.activityInfo=new ActivityInfo();
  r.activityInfo.packageName=pkg;r.activityInfo.name=name;r.label=name;c.pm.entries.add(r);return r;}
 static AtomicWorkbenchShareTargetRepository.Descriptor descriptor(String... mimes){return new AtomicWorkbenchShareTargetRepository.Descriptor(mimes.length==0,Arrays.asList(mimes));}
 public static void main(String[] args){
  test("actual file count and MIME family select a default public receiver query",()->{
   String[][] inputs={{},{"image/png"},{"image/png","image/jpeg"},{"video/mp4"},{"application/pdf","image/png"}};
   String[] expected={"text/plain","image/png","image/*","video/mp4","*/*"};
   for(int i=0;i<inputs.length;i++){Context c=new Context();AtomicWorkbenchShareTargetRepository.load(c,descriptor(inputs[i]),0);
    check(c.pm.last.type.equals(expected[i]),"wrong MIME "+i);check(c.pm.last.action.equals(inputs[i].length>1?Intent.ACTION_SEND_MULTIPLE:Intent.ACTION_SEND),"wrong action "+i);
    check(Intent.CATEGORY_DEFAULT.equals(c.pm.last.category)&&c.pm.flags==PackageManager.MATCH_DEFAULT_ONLY,"query not default-public");}
  });
  test("receiver identity preserves distinct Activity branches without any launcher dependency",()->{
   Context c=new Context();receiver(c,"example.share",".OnlyShare");receiver(c,"example.share",".AnotherBranch");receiver(c,"example.share",".OnlyShare");
   var result=AtomicWorkbenchShareTargetRepository.load(c,descriptor(),0);
   check(result.available&&result.targets.size()==2,"Activity identity collapsed or duplicated");
   check(!result.targets.get(0).key().equals(result.targets.get(1).key()),"same-package branches share identity");
   try{result.targets.clear();throw new AssertionError("mutable snapshot");}catch(UnsupportedOperationException expected){}
  });
  test("non-exported disabled permission-protected own-user and foreign-user targets are rejected",()->{
   for(String reason:new String[]{"unexported","disabled","app_disabled","permission","own","foreign","missing_app","missing_name"}){
    Context c=new Context();ResolveInfo r=receiver(c,"example.share",".Receiver");ActivityInfo a=r.activityInfo;
    switch(reason){case "unexported":a.exported=false;break;case "disabled":a.enabled=false;break;case "app_disabled":a.applicationInfo.enabled=false;break;
     case "permission":a.permission="signature.only";break;case "own":a.packageName=c.getPackageName();break;case "foreign":a.applicationInfo.uid=1012345;break;
     case "missing_app":a.applicationInfo=null;break;case "missing_name":a.name=null;break;}
    check(AtomicWorkbenchShareTargetRepository.load(c,descriptor(),0).targets.isEmpty(),"unsafe receiver admitted: "+reason);
   }
  });
  test("unsupported users and query failure are explicit rather than empty-success",()->{
   Context c=new Context();receiver(c,"example.share",".Receiver");
   check(!AtomicWorkbenchShareTargetRepository.load(c,descriptor(),10).available&&c.pm.last==null,"queried wrong user as current user");
   c.pm.fails=true;check(!AtomicWorkbenchShareTargetRepository.load(c,descriptor(),0).available,"failed query reported available");
   c.pm.fails=false;c.pm.entries.clear();var empty=AtomicWorkbenchShareTargetRepository.load(c,descriptor(),0);
   check(empty.available&&empty.targets.isEmpty()&&!empty.message.isEmpty(),"legitimate no-support state lost");
  });
  test("recheck rejects uninstall new MIME/action and disabled target before dispatch",()->{
   Context c=new Context();ResolveInfo r=receiver(c,"example.share",".Receiver");var plain=descriptor();
   var target=AtomicWorkbenchShareTargetRepository.load(c,plain,0).targets.get(0);
   check(AtomicWorkbenchShareTargetRepository.contains(c,plain,target),"fresh receiver rejected");
   check(!AtomicWorkbenchShareTargetRepository.contains(c,descriptor("image/png"),target),"old MIME proof reused");
   check(!AtomicWorkbenchShareTargetRepository.contains(c,descriptor("image/png","image/png"),target),"old single action proof reused");
   r.activityInfo.enabled=false;check(!AtomicWorkbenchShareTargetRepository.contains(c,plain,target),"disabled target dispatched");
   c.pm.entries.clear();check(!AtomicWorkbenchShareTargetRepository.contains(c,plain,target),"uninstalled target dispatched");
  });
  test("invalid empty or over-limit descriptors never enumerate receivers",()->{
   try{new AtomicWorkbenchShareTargetRepository.Descriptor(false,List.of());throw new AssertionError("empty payload admitted");}catch(IllegalArgumentException expected){checks++;}
   try{new AtomicWorkbenchShareTargetRepository.Descriptor(false,Collections.nCopies(17,"image/png"));throw new AssertionError("over-limit payload admitted");}catch(IllegalArgumentException expected){checks++;}
  });
  test("drop receive capability binds actual type action package UID and fresh enabled state",()->{
   Context c=new Context();ResolveInfo image=receiver(c,"arbitrary.receiver",".Image");image.mime="image/png";image.action=Intent.ACTION_SEND;
   check(AtomicWorkbenchShareTargetRepository.accepts(c,descriptor("image/png"),"arbitrary.receiver",12345),"actual image route refused");
   check("arbitrary.receiver".equals(c.pm.last.pkg),"query not scoped to receiving app");
   for(String mime:new String[]{"video/mp4","application/pdf","text/plain"})check(!AtomicWorkbenchShareTargetRepository.accepts(c,descriptor(mime),"arbitrary.receiver",12345),"image-only app accepted "+mime);
   check(!AtomicWorkbenchShareTargetRepository.accepts(c,descriptor("image/png","image/png"),"arbitrary.receiver",12345),"single receiver accepted multiple action");
   check(!AtomicWorkbenchShareTargetRepository.accepts(c,descriptor("image/png"),"other.app",12345),"foreign package candidate used");
   check(!AtomicWorkbenchShareTargetRepository.accepts(c,descriptor("image/png"),"arbitrary.receiver",12346),"old UID used");
   check(!AtomicWorkbenchShareTargetRepository.accepts(c,descriptor("image/png"),"arbitrary.receiver",1012345),"other user used");
   image.activityInfo.exported=false;check(!AtomicWorkbenchShareTargetRepository.accepts(c,descriptor("image/png"),"arbitrary.receiver",12345),"private receiver used");
   image.activityInfo.exported=true;image.activityInfo.enabled=false;check(!AtomicWorkbenchShareTargetRepository.accepts(c,descriptor("image/png"),"arbitrary.receiver",12345),"disabled route reused");
   image.activityInfo.enabled=true;c.pm.entries.clear();check(!AtomicWorkbenchShareTargetRepository.accepts(c,descriptor("image/png"),"arbitrary.receiver",12345),"removed route reused");
  });
  System.out.println("SHARE TARGET RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def main():
    sources = dict(SOURCES)
    sources["ls/augment/com/TestShareTargets.java"] = TEST
    with tempfile.TemporaryDirectory(prefix="lsa-share-targets-") as directory:
        SUPPORT["compile_run"](Path(directory), sources,
                               ["AtomicWorkbenchTransferPolicy.java", "AtomicWorkbenchShareTargetRepository.java"],
                               "ls.augment.com.TestShareTargets")


if __name__ == "__main__":
    main()
