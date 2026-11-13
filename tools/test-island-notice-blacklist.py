"""Exercise per-user blacklist storage and the actual ordinary-notice precedence method."""
import os,re,subprocess,tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
JDK=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
hook=(SRC/'hook/DynamicIslandHook.java').read_text('utf-8')
method=re.search(r'int noticeMode\(StatusBarNotification source\)\{(.+?)\n        \}',hook,re.S).group(1)
source='''package ls.augment.com;
public final class TestBlacklist {
 static int checks;static void check(boolean ok,String name){checks++;if(!ok)throw new AssertionError(name);}
 static class StatusBarNotification {String pkg="org.test.chat";String getPackageName(){return pkg;}StatusBarNotification getNotification(){return this;}String getChannelId(){return "messages";}}
 int ownerUser;IslandNoticeBlacklist noticeBlacklist=IslandNoticeBlacklist.parse("");IslandNoticeRules noticeRules=IslandNoticeRules.parse("");
 int noticeMode(StatusBarNotification source){METHOD}
 public static void main(String[] args){
  TestBlacklist state=new TestBlacklist();StatusBarNotification notice=new StatusBarNotification();
  check(state.noticeMode(notice)==0,"empty blacklist inherits");
  state.noticeRules=IslandNoticeRules.parse("3"+IslandNoticeRules.channel(0,notice.pkg,"messages"));
  state.noticeBlacklist=IslandNoticeBlacklist.parse("0|org.test.chat");
  check(state.noticeMode(notice)==IslandNoticeRules.OFF,"blacklist beats explicit channel expansion");
  notice.pkg="org.test.chat.other";check(state.noticeMode(notice)==0,"exact package only");notice.pkg="org.test.chat";
  state.ownerUser=10;check(state.noticeMode(notice)==0,"separate user");
  state.noticeBlacklist=null;check(state.noticeMode(notice)==IslandNoticeRules.OFF,"invalid blacklist falls back to native notice");
  IslandNoticeBlacklist list=IslandNoticeBlacklist.parse("10|org.test.work;0|org.test.chat");
  check(list.contains(10,"org.test.work"),"work profile retained");
  String changed=list.updated(0,"org.test.second;org.test.first");
  check("0|org.test.first;0|org.test.second;10|org.test.work".equals(changed),"canonical update preserves other user");
  check("10|org.test.work".equals(IslandNoticeBlacklist.parse(changed).updated(0,"")),"clear current user only");
  check(list.packages(0).size()==1,"editor count excludes other user");
  for(String bad:new String[]{"-1|org.test.app","00|org.test.app","0|bad","0|org.test.app;","0|org.test.app;0|org.test.app","0|org.test.app|channel","x|org.test.app"})check(IslandNoticeBlacklist.parse(bad)==null,"reject malformed input "+bad);
  StringBuilder full=new StringBuilder();for(int i=0;i<128;i++){if(i>0)full.append(';');full.append("0|org.test.app").append(i);}
  check(IslandNoticeBlacklist.parse(full.toString())!=null,"128 entries supported");
  check(IslandNoticeBlacklist.parse(full+";0|org.test.extra")==null,"129 entries rejected");
  check(IslandNoticeBlacklist.parse("x".repeat(16385))==null,"bounded storage");
  System.out.println("PASS notification blacklist: "+checks+" checks");
 }
}'''.replace('METHOD',method)
with tempfile.TemporaryDirectory(prefix='duo-blacklist-') as tmp:
 p=Path(tmp)/'TestBlacklist.java';p.write_text(source,'utf-8')
 subprocess.run([JDK/'javac','-encoding','UTF-8','-d',tmp,p,*[SRC/(n+'.java') for n in ('IslandNoticeBlacklist','IslandNoticeRules','IslandDownloadConfig','AppPackageSet')]],check=True)
 subprocess.run([JDK/'java','-cp',tmp,'ls.augment.com.TestBlacklist'],check=True)
