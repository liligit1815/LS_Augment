"""Run actual native history parsing and sanitized export without phone or Root.

The export harness compiles its production method and source formatter. Only the
su launch boundary is redirected to a local Java child; RootShell.runProcess,
merged stderr, capture bounds, protocol sanitizer and export formatting are real.
"""
from pathlib import Path
import runpy,subprocess,tempfile
BASE=runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-engine.py')))
SRC=BASE['SRC']
SOURCES={
'android/os/Process.java':'package android.os;public class Process {public static int uid;public static int myUid(){return uid;}}',
'android/system/ErrnoException.java':'package android.system;public class ErrnoException extends Exception {public final int errno;public ErrnoException(int e){errno=e;}}',
'android/system/OsConstants.java':'package android.system;public class OsConstants {public static final int O_RDONLY=0,O_CLOEXEC=1,O_NOFOLLOW=2,O_NONBLOCK=4,ENOENT=2;public static boolean S_ISDIR(int m){return m==1;}public static boolean S_ISREG(int m){return m==2;}}',
'android/system/StructStat.java':'package android.system;public class StructStat {public int st_uid,st_mode;public long st_nlink=1,st_size;}',
'android/system/Os.java':r'''package android.system;import java.io.*;import java.nio.file.*;import java.util.*;public class Os {
 public static int uid=10446,flags,opens,closes;public static boolean parentLink,wrongFile,hardLink,oversized,failRead,grow;public static final Map<FileDescriptor,RandomAccessFile> handles=new HashMap<>();
 public static void reset(){uid=10446;flags=opens=closes=0;parentLink=wrongFile=hardLink=oversized=failRead=grow=false;}
 public static StructStat lstat(String p)throws Exception {if(!Files.exists(Path.of(p)))throw new ErrnoException(2);StructStat s=new StructStat();s.st_uid=uid;s.st_mode=parentLink?3:1;return s;}
 public static FileDescriptor open(String p,int f,int mode)throws Exception {flags=f;if(!Files.exists(Path.of(p)))throw new ErrnoException(2);RandomAccessFile file=new RandomAccessFile(p,"r");FileDescriptor fd=file.getFD();handles.put(fd,file);opens++;return fd;}
 public static StructStat fstat(FileDescriptor fd)throws Exception{StructStat s=new StructStat();s.st_uid=wrongFile?10001:uid;s.st_mode=2;s.st_nlink=hardLink?2:1;s.st_size=oversized?200000:handles.get(fd).length();return s;}
 public static int read(FileDescriptor fd,byte[] b,int off,int len)throws Exception {if(failRead)throw new IOException("private-read-error");if(grow){Arrays.fill(b,(byte)'x');return b.length;}return handles.get(fd).read(b,off,len);}
 public static void close(FileDescriptor fd)throws Exception{closes++;handles.remove(fd).close();}
}''',
'ls/augment/com/TestLauncherNativeCrash.java':r'''package ls.augment.com;
import java.io.*;import java.nio.file.*;import java.nio.charset.StandardCharsets;import android.system.*;
public class TestLauncherNativeCrash {
 static int cases,checks;static void yes(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}interface Case{void run()throws Exception;}
 static void test(String n,Case r)throws Exception {Os.reset();r.run();yes(Os.handles.isEmpty(),"descriptor leaked");cases++;System.out.println("PASS native crash history: "+n);}
 static String frame="com.android.quickstep.TaskAnimationManager/TaskAnimationManager.java/123/startRecentsAnimation";
 static String entry(String key,String value){return "<string name=\""+key+"\">"+value+"</string>";}
 static String xml(String extra){return "<map>"+entry("CRASH_EXCEPTION_1",frame)+"<long name=\"CRASH_EXCEPTION_TIME_1\" value=\"1792119917987\"/><int name=\"ACTIVITY_STATE\" value=\"1\"/>"+extra+"</map>";}
 static String parse(String value)throws Exception {return LauncherNativeCrashEvidence.parse(value);}
 public static void main(String[] args)throws Exception {Path base=Path.of(args[0]);
 test("only native frame/time/state are exported",()->{String s=parse(xml(entry("account_password","private-account-value")+entry("route","private-destination")));
 yes(s.startsWith("status=READ;summaries=1;activity_state=1")&&s.contains("wall=1792119917987")&&s.contains("firstFrame="+frame),"summary missing");yes(!s.contains("private")&&!s.contains("password")&&!s.contains("route"),"unrelated preference leaked");});
 test("empty history remains explicitly unknown",()->{String s=parse("<map><int name=\"ACTIVITY_STATE\" value=\"0\"/></map>");yes(s.contains("NO_RETAINED_SUMMARY")&&!s.contains("status=READ"),"absence claimed success");});
 test("mixed and malformed summaries are never partial",()->{yes(parse(xml(entry("CRASH_EXCEPTION_1",frame))).contains("duplicate_key"),"duplicate accepted");yes(parse(xml("<string name=\"CRASH_EXCEPTION_TIME_2\">1</string>")).contains("field_type"),"wrong type accepted");yes(parse(xml(entry("CRASH_EXCEPTION_2",frame)+"<long name=\"CRASH_EXCEPTION_TIME_2\" value=\"-1\"/>")).contains("invalid_time"),"bad time exported");});
 test("frame payload cannot carry paths messages or controls",()->{for(String f:new String[]{"private-message",frame+"/password", "pkg.Cls//12/method", "pkg.Cls/File.java/1/method\nsecret", "pkg.Cls/File.java/1/method?token=x"}){String s=parse(xml("").replace(frame,f));yes(s.contains("invalid_frame")&&!s.contains("firstFrame="),"unsafe frame");}});
 test("unknown and native frames preserve precise locations",()->{for(String f:new String[]{"a.b$C/Unknown Source/-1/$r8$lambda$abc","a.b.C/null/-2/run","a.C/F.kt/42/run"})yes(parse(xml("").replace(frame,f)).contains("firstFrame="+f),"valid frame lost");});
 test("DTD and entity declarations never resolve local or network input",()->{yes(parse("<!DOCTYPE map SYSTEM 'file:///private/secret'>"+xml("")).contains("unsafe_xml"),"DTD read allowed");yes(parse("<!ENTITY account SYSTEM 'http://private/secret'>"+xml("")).contains("unsafe_xml"),"entity read allowed");});
 test("bounds reject excessive content entries and fields",()->{yes(parse("x".repeat(131073)).contains("unsafe_xml"),"input bound");yes(parse(xml(entry("CRASH_EXCEPTION_2","x".repeat(513)))).contains("field_limit"),"field bound");yes(parse("<map>"+"<s/>".repeat(4097)+"</map>").contains("entry_limit"),"entry bound");});
 test("actual read-only files are scoped to five known stores",()->{Path app=base.resolve("normal");Files.createDirectories(app.resolve("shared_prefs"));Files.writeString(app.resolve("shared_prefs/com.android.launcher3.prefs.xml"),xml(entry("secret","never-export")));
 String s=LauncherNativeCrashEvidence.collect(app.toFile(),10446);yes(s.contains("status=READ")&&s.contains("history_only=true")&&s.contains("absence_not_no_crash=true")&&!s.contains("never-export"),"file export mismatch");yes(s.lines().filter(l->l.startsWith("store=")).count()==5,"unbounded stores");yes(Os.opens==1&&Os.closes==1&&(Os.flags&2)!=0&&(Os.flags&4)!=0,"readonly nofollow guards");});
 test("wrong user owner directory and hardlinks cannot export data",()->{Path app=base.resolve("normal");Os.uid=1010446;yes(LauncherNativeCrashEvidence.collect(app.toFile(),10446).contains("directory_identity")&&Os.opens==0,"foreign user path read");Os.reset();Os.parentLink=true;yes(!LauncherNativeCrashEvidence.collect(app.toFile(),10446).contains("status=READ")&&Os.opens==0,"parent symlink read");Os.reset();Os.wrongFile=true;yes(LauncherNativeCrashEvidence.collect(app.toFile(),10446).contains("file_identity"),"foreign file owner read");Os.reset();Os.hardLink=true;yes(LauncherNativeCrashEvidence.collect(app.toFile(),10446).contains("file_identity"),"hardlink accepted");});
 test("read failure growth and malformed XML do not leak raw output",()->{Path app=base.resolve("normal");Os.failRead=true;String s=LauncherNativeCrashEvidence.collect(app.toFile(),10446);yes(s.contains("IOException")&&!s.contains("private-read-error"),"error message leak");Os.reset();Os.grow=true;yes(LauncherNativeCrashEvidence.collect(app.toFile(),10446).contains("size_limit"),"growth bound");Os.reset();Files.writeString(app.resolve("shared_prefs/com.android.launcher3.prefs.xml"),"<map>private-account-unclosed");s=LauncherNativeCrashEvidence.collect(app.toFile(),10446);yes(s.contains("UNAVAILABLE")&&!s.contains("private-account-unclosed"),"malformed raw XML leak");});
 test("main rejects non-Root and malformed identities before file access",()->{PrintStream old=System.out;ByteArrayOutputStream output=new ByteArrayOutputStream();try{System.setOut(new PrintStream(output));android.os.Process.uid=10055;LauncherNativeCrashEvidence.main(new String[]{"0","10446"});yes(output.toString().contains("root_required")&&Os.opens==0,"nonroot main");output.reset();android.os.Process.uid=0;LauncherNativeCrashEvidence.main(new String[]{"10","10446"});yes(output.toString().contains("UNAVAILABLE")&&Os.opens==0,"crossuser args");}finally{System.setOut(old);}});
 System.out.println("NATIVE CRASH HISTORY RESULT "+cases+" cases; "+checks+" assertions");}}
'''}

# Keep Android ownership lookups as boundaries, not copies of the export logic.
SOURCES.update({
'android/content/pm/ApplicationInfo.java':r'''package android.content.pm;public class ApplicationInfo {public int uid=10446;public String sourceDir="/private/module's app.apk";}''',
'android/content/pm/PackageManager.java':r'''package android.content.pm;public class PackageManager {
 public int uid=10446,lookups;public String requested;public boolean missing;
 public ApplicationInfo getApplicationInfo(String p,int flags)throws NameNotFoundException {lookups++;requested=p;if(missing)throw new NameNotFoundException("private-account-package-path");ApplicationInfo a=new ApplicationInfo();a.uid=uid;return a;}
 public static class NameNotFoundException extends Exception {public NameNotFoundException(String m){super(m);}}
}''',
'android/content/Context.java':r'''package android.content;public class Context {
 public final android.content.pm.PackageManager pm=new android.content.pm.PackageManager();
 public android.content.pm.PackageManager getPackageManager(){return pm;}
 public android.content.pm.ApplicationInfo getApplicationInfo(){return new android.content.pm.ApplicationInfo();}
}''',
'ls/augment/com/HarnessTransport.java':r'''package ls.augment.com;
import java.nio.file.*;import java.util.function.Consumer;
final class HarnessTransport {
 static String scenario="valid",command;static int calls;static RootShell.Result raw;
 static void reset(){scenario="valid";command=null;calls=0;raw=null;}
 static RootShell.Result run(String requested,String stdin,long seconds,int limit,Consumer<String> sink){
  calls++;command=requested;if(stdin!=null||seconds!=8||limit!=16384)throw new AssertionError("transport contract changed");
  if(scenario.equals("throw"))throw new SecurityException("private-account-token-path");
  String[] identity=requested.substring(requested.lastIndexOf("LauncherNativeCrashEvidence ")+28).split(" ");
  if(identity.length!=2)throw new AssertionError("unexpected identity arguments: "+requested);
  ProcessBuilder child=scenario.equals("missing_executable")?new ProcessBuilder("/private/account-token/does-not-exist")
   :new ProcessBuilder(Path.of(System.getProperty("java.home"),"bin","java").toString(),"-Dfile.encoding=UTF-8","-cp",System.getProperty("java.class.path"),"ls.augment.com.NativeCrashChild",scenario,identity[0],identity[1]);
  raw=RootShell.runProcess(child.redirectErrorStream(true),stdin,seconds,limit,sink);return raw;
 }
}''',
'ls/augment/com/NativeCrashChild.java':r'''package ls.augment.com;public class NativeCrashChild {
 public static void main(String[] a){int user=Integer.parseInt(a[1]),uid=Integer.parseInt(a[2]);String value=TestLauncherNativeCrash.protocol(user,uid);
  switch(a[0]){
   case "mixed_stderr":System.out.print(value);System.out.flush();System.err.print("\n/private/account.xml: password=private-account-token\n");break;
   case "stderr_only":System.err.print("java.io.IOException: /private/account.xml password=private-account-token\n");System.exit(42);break;
   case "forged_user":System.out.print(TestLauncherNativeCrash.protocol(user+1,uid+100000));break;
   case "truncated":System.out.print(value.substring(0,value.length()/2));break;
   case "oversize":System.out.print(value+"x".repeat(17000));break;
   case "denied":System.out.print("status=DENIED;reason=root_required\n");System.exit(13);break;
   default:System.out.print(value);
  }
 }
}''',
})

PROTOCOL_HELPERS=r'''
 static String header(int user,int uid){return "user="+user+";uid="+uid+";source=rom_crash_history;history_only=true;absence_not_no_crash=true";}
 static String summary(int i){return "summary="+i+";wall="+(1792119917987L+i)+";firstFrame="+frame;}
 static String protocol(int user,int uid){StringBuilder s=new StringBuilder(header(user,uid));for(int i=0;i<5;i++){
  s.append("\nstore=").append(LauncherNativeCrashEvidence.STORES[i]).append(';');
  if(i==0){s.append("status=READ;summaries=3;activity_state=1");for(int n=1;n<=3;n++)s.append('\n').append(summary(n));}
  else s.append(i==1?"status=NO_RETAINED_SUMMARY;summaries=0;activity_state=UNKNOWN":i==2?"status=MISSING":i==3?"status=UNAVAILABLE;error=IOException":"status=DENIED;reason=file_identity");
 }return s.toString();}
 static String safe(String value){return LauncherNativeCrashEvidence.sanitizeOutput(value,0,10446);}
 static void rejected(String value,String why){String out=safe(value);yes(out.equals("status=UNAVAILABLE;reason=invalid_child_protocol;child_output_redacted=true"),why);}
 static android.content.Context exportContext(){HarnessTransport.reset();android.os.Process.uid=10055;return new android.content.Context();}
 static String exported(android.content.Context context)throws Exception {StringBuilder s=new StringBuilder();var method=DiagnosticExport.class.getDeclaredMethod("appendLauncherCrashHistory",StringBuilder.class,android.content.Context.class);method.setAccessible(true);method.invoke(null,s,context);return s.toString();}
 static void privateFree(String value){yes(!value.contains("private-account")&&!value.contains("/private/")&&!value.contains("password=")&&!value.contains("account-token")&&!value.contains("<map>"),"raw private transport text escaped sanitizer");}
'''

PROTOCOL_TESTS=r'''
 test("valid complete five-store protocol retains all three native summaries",()->{String p=protocol(0,10446);yes(safe(p).equals(p),"valid complete protocol rejected");yes(safe(" \r\n"+p+"\r\n ").equals(p),"terminal whitespace changed valid protocol");yes(safe(p).lines().filter(l->l.startsWith("summary=")).count()==3,"valid summary lost");});
 test("only fixed statuses and exception class names survive",()->{String p=protocol(0,10446);for(String status:new String[]{"status=MISSING","status=DENIED;reason=directory_identity","status=UNAVAILABLE;reason=unsafe_xml","status=UNAVAILABLE;error=SAXParseException","status=UNAVAILABLE;error=OutOfMemoryError"})yes(safe(p.replace("status=UNAVAILABLE;error=IOException",status)).contains(status),"valid store status rejected: "+status);for(String reason:new String[]{"size_limit","unsafe_xml","unexpected_xml","entry_limit","duplicate_key","field_type","field_limit","invalid_frame","invalid_time"}){String status="status=UNAVAILABLE;reason="+reason;yes(safe(p.replace("status=UNAVAILABLE;error=IOException",status)).contains(status),"valid collector reason rejected");}yes(safe("status=DENIED;reason=root_required").equals("status=DENIED;reason=root_required"),"root denial rejected");yes(safe("status=UNAVAILABLE;error=NumberFormatException").contains("NumberFormatException"),"safe top-level exception rejected");});
 test("protocol identity must exactly match current user and launcher UID",()->{String p=protocol(10,1010446);yes(LauncherNativeCrashEvidence.sanitizeOutput(p,10,1010446).equals(p),"secondary current-user protocol lost");rejected(p,"cross-user protocol accepted");rejected(protocol(0,10001),"wrong package UID accepted");rejected(protocol(0,10446).replace("user=0;uid=10446","user=00;uid=10446"),"noncanonical identity accepted");});
 test("raw stderr paths messages XML and extra protocol lines are redacted",()->{String p=protocol(0,10446);for(String raw:new String[]{"IOException: /private/account.xml password=private-account-token","<map>private-account-value</map>",p+"\n/private/account.xml: private-account-token","private-account-token\n"+p,p+"\nstatus=UNAVAILABLE;error=IOException", "status=UNAVAILABLE;error=IOException:private-account-token","status=DENIED;reason=root_required\nprivate-account-token"}){rejected(raw,"raw child diagnostic accepted");privateFree(safe(raw));}});
 test("null empty oversized and truncated child output is rejected",()->{rejected(null,"null accepted");rejected("","empty accepted");rejected("x".repeat(16385),"oversize accepted");String p=protocol(0,10446);rejected(p.substring(0,p.length()/2),"partial store accepted");rejected(p.substring(0,p.lastIndexOf('\n')),"missing last store accepted");rejected(p+"\n".repeat(30)+"private-account-token","excess lines accepted");});
 test("five stores must occur exactly once in declared order",()->{String p=protocol(0,10446);rejected(p.replace("store="+LauncherNativeCrashEvidence.STORES[1]+";","store="+LauncherNativeCrashEvidence.STORES[0]+";"),"duplicate store accepted");rejected(p.replace("store="+LauncherNativeCrashEvidence.STORES[2]+";","store=other.prefs;"),"unknown store accepted");rejected(p+"\nstore="+LauncherNativeCrashEvidence.STORES[4]+";status=MISSING","sixth store accepted");String[] lines=p.split("\n");String swap=lines[5];lines[5]=lines[6];lines[6]=swap;rejected(String.join("\n",lines),"reordered store accepted");});
 test("summary counts status and unique indexes remain coherent",()->{String p=protocol(0,10446);rejected(p.replace(summary(2),summary(1)),"duplicate summary accepted");rejected(p.replace(summary(3)+"\n",""),"missing counted summary accepted");rejected(p.replace("summaries=3","summaries=2"),"extra summary accepted");rejected(p.replace("status=READ;summaries=3","status=NO_RETAINED_SUMMARY;summaries=3"),"nonempty no-summary accepted");rejected(p.replace("status=NO_RETAINED_SUMMARY;summaries=0","status=READ;summaries=0"),"empty READ accepted");rejected(p.replace("summary=3;","summary=0;"),"invalid summary index accepted");rejected(p.replace("summaries=3","summaries=4"),"count bound ignored");});
 test("summary timestamps frame syntax and overflow cannot inject data",()->{String p=protocol(0,10446);for(String wall:new String[]{"0","-1","9223372036854775808","12345678901234567890","1;token=private-account-token"})rejected(p.replace("wall=1792119917988;","wall="+wall+";"),"unsafe wall accepted");for(String bad:new String[]{"pkg.Cls//12/method","pkg.Cls/File.java/1/method?token=private-account-token","pkg.Cls/File.java/12345678901/method","pkg.Cls/File.java/1/method\nprivate-account-token","/private/account.xml/1/method"})rejected(p.replace(frame,bad),"unsafe frame accepted");rejected(p.replace("activity_state=1","activity_state=2"),"invalid activity state accepted");});
 test("native source metadata variants survive while unknown protocol forms fail closed",()->{String p=protocol(0,10446);for(String value:new String[]{"a.b$C/Unknown Source/-1/$r8$lambda$abc","a.b.C/null/-2/run","a.C/F.kt/42/<init>"})yes(safe(p.replace(frame,value)).contains("firstFrame="+value),"valid native frame shape rejected");for(String status:new String[]{"status=READ_ALL","status=UNAVAILABLE;reason=account_token","status=UNAVAILABLE;error=java.io.IOException","status=UNAVAILABLE;error=IOException\u0000private-account-token","status=UNAVAILABLE;error=<map>"})rejected(p.replace("status=UNAVAILABLE;error=IOException",status),"unrecognized transport status accepted");});
 test("export compiles production method and retains valid current-user evidence",()->{android.content.Context c=exportContext();String s=exported(c);yes(HarnessTransport.calls==1&&LauncherNativeCrashEvidence.PACKAGE.equals(c.pm.requested),"actual package lookup or transport missing");yes(HarnessTransport.command.equals("CLASSPATH="+RootShell.quote(c.getApplicationInfo().sourceDir)+" exec /system/bin/app_process /system/bin ls.augment.com.LauncherNativeCrashEvidence 0 10446"),"fixed read-only CLI or quoting changed");yes(s.contains(protocol(0,10446))&&s.contains("captureState=COMPLETE")&&s.contains("upstreamComplete=true")&&s.contains("status=READ exit=0"),"real transport/source formatting lost");privateFree(s);});
 test("export uses app current user and rejects foreign launcher before transport",()->{android.content.Context c=exportContext();android.os.Process.uid=1010055;c.pm.uid=1010446;String s=exported(c);yes(s.contains(protocol(10,1010446))&&HarnessTransport.command.endsWith(" 10 1010446"),"current app user not honored");c=exportContext();c.pm.uid=1010446;s=exported(c);yes(HarnessTransport.calls==0&&s.contains("error=SecurityException")&&!s.contains("launcher user mismatch"),"cross-user launcher reached Root");privateFree(s);});
 test("actual merged stderr mixed with valid stdout cannot enter export",()->{android.content.Context c=exportContext();HarnessTransport.scenario="mixed_stderr";String s=exported(c);yes(HarnessTransport.raw.output.contains("private-account-token")&&HarnessTransport.raw.output.contains("summary=1"),"stdout/stderr merge was not actually exercised");yes(HarnessTransport.raw.capture!=null&&HarnessTransport.raw.capture.complete,"real process capture missing");yes(s.contains("invalid_child_protocol")&&!s.contains("firstFrame="),"mixed stderr accepted as evidence");privateFree(s);});
 test("actual failed child stderr retains transport failure without raw message",()->{android.content.Context c=exportContext();HarnessTransport.scenario="stderr_only";String s=exported(c);yes(HarnessTransport.raw.exitCode==42&&HarnessTransport.raw.output.contains("private-account-token"),"real stderr child did not run");yes(s.contains("status=READ_FAILED exit=42")&&s.contains("invalid_child_protocol"),"native transport failure hidden");privateFree(s);});
 test("actual RootShell process-start exception is redacted before source formatting",()->{android.content.Context c=exportContext();HarnessTransport.scenario="missing_executable";String s=exported(c);yes(HarnessTransport.raw.exitCode==127&&HarnessTransport.raw.output.contains("account-token"),"real start failure boundary not exercised");yes(s.contains("status=READ_FAILED exit=127")&&s.contains("invalid_child_protocol"),"start failure was not reported safely");privateFree(s);});
 test("export rejects forged identity and truncated captured protocol",()->{for(String scenario:new String[]{"forged_user","truncated","oversize"}){android.content.Context c=exportContext();HarnessTransport.scenario=scenario;String s=exported(c);yes(s.contains("invalid_child_protocol")&&!s.contains("firstFrame="),"partial or foreign child evidence accepted: "+scenario);if(scenario.equals("oversize"))yes(HarnessTransport.raw.capture.truncated&&s.contains("captureState=TRUNCATED")&&s.contains("upstreamTruncated=true"),"actual output cap status lost");privateFree(s);}});
 test("export retains safe Root denial and never leaks lookup/transport exception messages",()->{android.content.Context c=exportContext();HarnessTransport.scenario="denied";String s=exported(c);yes(s.contains("status=READ_FAILED exit=13")&&s.contains("status=DENIED;reason=root_required"),"safe denial lost");c=exportContext();c.pm.missing=true;s=exported(c);yes(HarnessTransport.calls==0&&s.contains("error=NameNotFoundException"),"lookup error leaked or invoked Root");privateFree(s);c=exportContext();HarnessTransport.scenario="throw";s=exported(c);yes(s.contains("error=SecurityException")&&!s.contains("private-account"),"transport exception message leaked");privateFree(s);});
'''

SOURCES['ls/augment/com/TestLauncherNativeCrash.java']=SOURCES['ls/augment/com/TestLauncherNativeCrash.java'].replace(
 ' public static void main(String[] args)throws Exception',PROTOCOL_HELPERS+' public static void main(String[] args)throws Exception').replace(
 ' System.out.println("NATIVE CRASH HISTORY RESULT',PROTOCOL_TESTS+' System.out.println("NATIVE CRASH HISTORY RESULT')


def extract_method(source, signature):
 """Extract exact production text; braces inside Java strings/comments are ignored."""
 start=source.index(signature)
 opening=source.index('{',start)
 depth=0;state='code';escaped=False;i=opening
 while i<len(source):
  c=source[i];following=source[i+1] if i+1<len(source) else ''
  if state in ('string','char'):
   if escaped:escaped=False
   elif c=='\\':escaped=True
   elif c==('"' if state=='string' else "'"):state='code'
  elif state=='line':
   if c=='\n':state='code'
  elif state=='block':
   if c=='*' and following=='/':state='code';i+=1
  elif c=='/' and following=='/':state='line';i+=1
  elif c=='/' and following=='*':state='block';i+=1
  elif c=='"':state='string'
  elif c=="'":state='char'
  elif c=='{':depth+=1
  elif c=='}':
   depth-=1
   if depth==0:return source[start:i+1]
  i+=1
 raise AssertionError('unterminated production method: '+signature)


def production_export_slice():
 source=(SRC/'DiagnosticExport.java').read_text(encoding='utf-8')
 signatures=[
  'private static void appendLauncherCrashHistory(StringBuilder out,Context context)',
  'private static void source(StringBuilder out,String name,RootShell.Result result,int limit)',
  'private static void source(StringBuilder out,String name,RootShell.Result result,int limit,boolean values)',
  'private static void source(StringBuilder out,String name,RootShell.Result result,int limit,boolean values,boolean filtered)',
  'private static int lineCount(String value)',
 ]
 return ('package ls.augment.com;import android.content.Context;import java.nio.charset.StandardCharsets;final class DiagnosticExport {\n'
  +'\n'.join(extract_method(source,s) for s in signatures)
  +'\nstatic String diagnosticValues(String unused){throw new AssertionError("unreachable optional values formatter");}\n}')


def production_transport_slice():
 source=(SRC/'RootShell.java').read_text(encoding='utf-8')
 signature='static Result run(String command, String stdin, long timeoutSeconds, int maxOutput,\n            Consumer<String> onOutput)'
 method=extract_method(source,signature)
 # Replace only privileged process creation. Actual runProcess, readers, merged
 # stdout/stderr capture, error handling and Result classes compile unchanged.
 replacement=method[:method.index('{')+1]+'\nreturn HarnessTransport.run(command,stdin,timeoutSeconds,maxOutput,onOutput);\n}'
 return source.replace(method,replacement,1)

def main():
 with tempfile.TemporaryDirectory(prefix='lsa-native-crash-history-') as t:
  work=Path(t);files=[]
  sources=dict(SOURCES)
  sources['ls/augment/com/DiagnosticExport.java']=production_export_slice()
  sources['ls/augment/com/RootShell.java']=production_transport_slice()
  for name,content in sources.items():
   p=work/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(content,encoding='utf-8');files.append(str(p))
  subprocess.run([BASE['JAVAC'],'--release','17','-encoding','UTF-8','-d',str(work),str(SRC/'LauncherNativeCrashEvidence.java'),*files],check=True,timeout=60,env=BASE['ENV'])
  subprocess.run([BASE['JAVA'],'-Dfile.encoding=UTF-8','-cp',str(work),'ls.augment.com.TestLauncherNativeCrash',str(work/'data')],check=True,timeout=30,env=BASE['ENV'])
if __name__=='__main__':main()
