"""Compile and exercise real recovery identity methods with offline Android stubs.

No RootShell transport, su, device query, or filesystem outside temporary test
directories is used. Dumpsys fixtures model documented AOSP output, not an OEM
compatibility or real-device identity guarantee.
"""
import hashlib
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
PRODUCTION = ROOT / 'android/app/src/main/java/ls/augment/com/HideRecoveryIdentity.java'
CANONICAL = (
    'package-evidence-v1\npackage=com.example.app\nuser=10\nappId=10123\n'
    'firstInstallTime=2026-08-02 11:22:33\nceDataInode=200\ndeDataInode=300\n'
)
EXPECTED = hashlib.sha256(CANONICAL.encode('utf-8')).hexdigest()

SOURCES = {
    'android/content/SharedPreferences.java': r'''package android.content;
public interface SharedPreferences {
    boolean contains(String key);String getString(String key,String fallback);Editor edit();
    interface Editor {Editor putString(String key,String value);boolean commit();}
}''',
    'android/content/pm/ApplicationInfo.java': r'''package android.content.pm;
public class ApplicationInfo {public int uid;}''',
    'android/content/Context.java': r'''package android.content;
import android.content.pm.ApplicationInfo;
public abstract class Context {
    public static final int MODE_PRIVATE=0;
    public abstract ApplicationInfo getApplicationInfo();
    public abstract SharedPreferences getSharedPreferences(String name,int mode);
    public abstract <T> T getSystemService(Class<T> type);
}''',
    'android/os/UserHandle.java': r'''package android.os;
public final class UserHandle {
    public final int id;private UserHandle(int value){id=value;}
    public static UserHandle getUserHandleForUid(int uid){return new UserHandle(uid/100000);}
    public boolean equals(Object other){return other instanceof UserHandle&&id==((UserHandle)other).id;}
    public int hashCode(){return id;}
}''',
    'android/os/UserManager.java': r'''package android.os;
public class UserManager {
    public long serial=42;public int lastUser=-1,calls;public RuntimeException failure;
    public long getSerialNumberForUser(UserHandle user){
        calls++;lastUser=user.id;if(failure!=null)throw failure;return serial;
    }
    public UserHandle getUserForSerialNumber(long value){return value==serial&&value>=0?UserHandle.getUserHandleForUid(lastUser*100000):null;}
}''',
    'ls/augment/com/RootHideManager.java': r'''package ls.augment.com;
final class RootHideManager {
    static final class Target {
        final int userId;final String packageName;final long userSerial=-1;
        Target(int user,String pkg){userId=user;packageName=pkg;}
        boolean isBound(){return false;}
    }
}''',
    'ls/augment/com/RootShell.java': r'''package ls.augment.com;
final class RootShell {
    static Result next;static int calls,limit;static long timeout;static String command,stdin;
    static RuntimeException failure;
    static Result run(String value,String input,long seconds,int max){
        calls++;command=value;stdin=input;timeout=seconds;limit=max;
        if(failure!=null)throw failure;return next;
    }
    static String quote(String value){return "'"+value.replace("'","'\"'\"'")+"'";}
    static final class Result {
        final int exitCode;final String output;final boolean timedOut;
        Result(int code,String text,boolean timeout){exitCode=code;output=text==null?"":text;timedOut=timeout;}
        boolean isSuccess(){return exitCode==0&&!timedOut;}
    }
}''',
    'ls/augment/com/TestHideRecoveryIdentity.java': r'''package ls.augment.com;
import android.content.*;import android.content.pm.ApplicationInfo;import android.os.UserManager;
import java.util.*;import java.util.concurrent.*;
public final class TestHideRecoveryIdentity {
    static final String PKG="com.example.app",KEY="instance_id";
    static final String UUID_VALUE="123e4567-e89b-42d3-a456-426614174000";
    static int checks;
    static void check(boolean condition,String message){checks++;if(!condition)throw new AssertionError(message);}
    static final class Prefs implements SharedPreferences {
        final Map<String,Object> values=new HashMap<>();int edits,commits;
        boolean commitOk=true,discard,readFailure,editFailure,commitFailure;String replaceAfterCommit;
        public boolean contains(String key){return values.containsKey(key);}
        public String getString(String key,String fallback){
            if(readFailure)throw new IllegalStateException("read failure");
            Object value=values.get(key);return value==null?fallback:(String)value;
        }
        public Editor edit(){
            edits++;if(editFailure)throw new IllegalStateException("edit failure");
            return new Editor(){
                String key,value;public Editor putString(String k,String v){key=k;value=v;return this;}
                public boolean commit(){
                    commits++;
                    // Android can update memory even if the disk commit fails.
                    if(!discard)values.put(key,replaceAfterCommit==null?value:replaceAfterCommit);
                    if(commitFailure)throw new IllegalStateException("commit failure");
                    return commitOk;
                }
            };
        }
    }
    static final class Ctx extends Context {
        ApplicationInfo info=new ApplicationInfo();Prefs prefs=new Prefs();UserManager users=new UserManager();
        String preferenceName;int preferenceMode,preferenceCalls;
        public ApplicationInfo getApplicationInfo(){return info;}
        public SharedPreferences getSharedPreferences(String name,int mode){
            preferenceName=name;preferenceMode=mode;preferenceCalls++;return prefs;
        }
        public <T> T getSystemService(Class<T> type){return type.cast(users);}
    }
    static String dump(){
        return "Packages:\n"
            +"  Package ["+PKG+"] (a1):\n"
            +"    appId=10123\n"
            +"    firstInstallTime=2001-01-01 00:00:00\n"
            +"    User 0: ceDataInode=100 installed=true hidden=false\n"
            +"      firstInstallTime=2020-01-01 00:00:00\n"
            +"    User 10: ceDataInode=200 deDataInode=300 installed=true hidden=true\n"
            +"      firstInstallTime=2026-08-02 11:22:33\n";
    }
    static String identity(String value){return HideRecoveryIdentity.packageIdentity(PKG,10,value);}
    static void unknown(String value,String reason){check("unknown".equals(identity(value)),reason);}
    static void ownerTests()throws Exception {
        Ctx c=new Ctx();c.info.uid=1010123;
        HideRecoveryIdentity.Owner owner=HideRecoveryIdentity.owner(c);
        check(owner.success&&owner.userId==10,"owner did not use application uid's user");
        check(UUID.fromString(owner.id).version()==4,"new instance is not a generated UUID");
        check(c.preferenceName.equals("hide_recovery_v1")&&c.preferenceMode==0,"instance did not use independent private preferences");
        check(c.prefs.commits==1&&owner.id.equals(c.prefs.values.get(KEY)),"new UUID not committed and read back");
        check(HideRecoveryIdentity.owner(c).id.equals(owner.id),"instance changed across reads");
        for(Object invalid:new Object[]{"","1-1-1-1-1","not-a-uuid",UUID_VALUE+" ",123,null}){
            c=new Ctx();c.prefs.values.put(KEY,invalid);
            HideRecoveryIdentity.Owner failed=HideRecoveryIdentity.owner(c);
            check(!failed.success&&failed.id.isEmpty(),"invalid old UUID accepted");
            check(c.prefs.edits==0&&Objects.equals(c.prefs.values.get(KEY),invalid),"invalid old UUID overwritten");
        }
        c=new Ctx();c.prefs.values.put(KEY,UUID_VALUE.toUpperCase(Locale.ROOT));
        check(HideRecoveryIdentity.owner(c).id.equals(UUID_VALUE),"canonical UUID case normalization failed");
        c=new Ctx();c.prefs.commitOk=false;
        check(!HideRecoveryIdentity.owner(c).success,"commit false released an owner");
        String inMemory=(String)c.prefs.values.get(KEY);
        check(inMemory!=null&&!HideRecoveryIdentity.owner(c).success&&c.prefs.commits==2,
            "failed commit's in-memory UUID was mistaken for durable storage");
        c.prefs.commitOk=true;
        check(HideRecoveryIdentity.owner(c).id.equals(inMemory),"retry replaced the pending instance UUID");
        c=new Ctx();c.prefs.discard=true;
        check(!HideRecoveryIdentity.owner(c).success,"commit without matching readback accepted");
        c=new Ctx();c.prefs.replaceAfterCommit=UUID_VALUE;
        check(!HideRecoveryIdentity.owner(c).success,"mismatched valid UUID readback accepted");
        c=new Ctx();c.prefs.readFailure=true;
        check(!HideRecoveryIdentity.owner(c).success&&c.prefs.edits==0,"read failure changed storage");
        c=new Ctx();c.prefs.editFailure=true;
        check(!HideRecoveryIdentity.owner(c).success,"edit exception escaped or released owner");
        c=new Ctx();c.prefs.commitFailure=true;
        check(!HideRecoveryIdentity.owner(c).success,"commit exception escaped or released owner");
        c=new Ctx();c.info.uid=-1;
        check(!HideRecoveryIdentity.owner(c).success&&c.preferenceCalls==0,"negative UID fell back to user zero");
        c=new Ctx();c.info=null;
        check(!HideRecoveryIdentity.owner(c).success&&c.preferenceCalls==0,"missing app info fell back to user zero");
        check(!HideRecoveryIdentity.owner(null).success,"null owner context accepted");
        Ctx shared=new Ctx();List<String> ids=Collections.synchronizedList(new ArrayList<>());
        ExecutorService pool=Executors.newFixedThreadPool(8);
        try {
            List<Future<?>> tasks=new ArrayList<>();
            for(int i=0;i<16;i++)tasks.add(pool.submit(()->{
                HideRecoveryIdentity.Owner result=HideRecoveryIdentity.owner(shared);
                if(!result.success)throw new AssertionError("concurrent owner failed");
                ids.add(result.id);
            }));
            for(Future<?> task:tasks)task.get(5,TimeUnit.SECONDS);
        }finally{pool.shutdownNow();}
        check(ids.size()==16&&new HashSet<>(ids).size()==1,"concurrent calls created different instances");
    }
    static void parserTests(){
        String original=dump(),base=identity(original);
        check(base.equals("__EXPECTED__"),"canonical independent SHA256 vector mismatch");
        check(identity(original.replace("\n","\r\n")).equals(base),"CRLF changed identity");
        check(identity(original.replace("ceDataInode=200","ceDataInode=000200")).equals(base),"numeric canonicalization failed");
        check(identity(original.replace("2020-01-01","2021-02-02")).equals(base),"another user's time leaked into identity");
        check(identity(original.replace("2001-01-01","2002-02-02")).equals(base),"global install time leaked into identity");
        check(identity(original.replace("hidden=true","hidden=false")).equals(base),"hidden state was treated as installation identity");
        check(identity(original+"  Package [com.other.app] (b2):\n    appId=555\n    User 10: ceDataInode=9\n      firstInstallTime=2025-01-01 00:00:00\n").equals(base),"another package contaminated selected user evidence");
        for(String changed:new String[]{
            original.replace("2026-08-02","2026-08-03"),
            original.replace("ceDataInode=200","ceDataInode=201"),
            original.replace("deDataInode=300","deDataInode=301"),
            original.replace("appId=10123","appId=10124")}){
            check(!identity(changed).equals(base)&&!identity(changed).equals("unknown"),"identity evidence change was not distinguished");
        }
        check(!HideRecoveryIdentity.packageIdentity(PKG,0,original).equals(base),"user zero mixed with selected user");
        String renamed=original.replace(PKG,"com.other.app");
        check(!HideRecoveryIdentity.packageIdentity("com.other.app",10,renamed).equals(base),"package name missing from fingerprint");
        String noInodes=original.replace("ceDataInode=200 deDataInode=300 ","");
        check(!identity(noInodes).equals("unknown")&&!identity(noInodes).equals(base),"optional missing inodes not represented");
        check(identity(original.replace("appId=10123","userId=10123")).equals(base),"legacy global userId not normalized to appId");
        check(identity(original.replace("appId=10123","appId=10123\n    userId=10123")).equals(base),"consistent legacy/current app identity disagreed");
        unknown(null,"null dump accepted");unknown("","empty dump accepted");
        unknown(original.replace("Packages:\n",""),"unframed package section accepted");
        unknown(renamed,"another package's fields accepted");
        unknown(original.replace("User 10:","User 11:"),"another user's fields accepted");
        unknown(original.replace("      firstInstallTime=2026-08-02 11:22:33\n",""),"global time filled missing per-user time");
        unknown(original+"    User 10: installed=true\n      firstInstallTime=2026-08-02 11:22:33\n","duplicate target user accepted");
        unknown(original+"    User 0: installed=true\n","duplicate other user accepted");
        unknown(original+original.substring("Packages:\n".length()),"duplicate target package accepted");
        unknown(original.replace("2026-08-02","2026-02-30"),"invalid calendar timestamp accepted");
        unknown(original.replace("2026-08-02","1970-01-01"),"default epoch timestamp accepted");
        check(!HideRecoveryIdentity.packageIdentity(PKG,10,original.replace("2026-08-02","1970-06-05")).equals("unknown"),"valid OEM installation later in 1970 rejected");
        unknown(original.replace("appId=10123\n",""),"missing global app id accepted");
        unknown(original.replace("appId=10123","appId=10123\n    appId=10123"),"duplicate global field accepted");
        unknown(original.replace("appId=10123","appId=10123\n    userId=10124"),"conflicting global fields accepted");
        unknown(original.replace("ceDataInode=200","ceDataInode=-1"),"negative inode accepted");
        unknown(original.replace("ceDataInode=200","ceDataInode="),"empty inode treated as absent");
        unknown(original.replace("ceDataInode=200","ceDataInode = 200"),"unknown inode format treated as absent");
        unknown(original.replace("ceDataInode=200","ceDataInode=999999999999999999999"),"overflow inode accepted");
        unknown(original.replace("ceDataInode=200","ceDataInode=200 ceDataInode=200"),"duplicate inode accepted");
        unknown(original+"      firstInstallTime=2026-08-02 11:22:33\n","duplicate time accepted");
        unknown(original+"      firstInstallTime unknown\n","unknown duplicate time format accepted");
        unknown(original.replace("appId=10123","appId = 10123\n    userId=10123"),"unknown global appId format accepted");
        unknown(original.replace("User 10:","User ???:"),"unknown user header accepted");
        unknown(original.replace("    User 10:", "Outside section:\n    User 10:"),"outside section used as user evidence");
        unknown(original+"\0","binary dump accepted");
        unknown("x".repeat(1024*1024),"oversized dump accepted");
        check(HideRecoveryIdentity.packageIdentity("com.example;id",10,original).equals("unknown"),"unsafe package accepted");
        check(HideRecoveryIdentity.packageIdentity(PKG,-1,original).equals("unknown"),"negative user accepted");
        check(HideRecoveryIdentity.packageIdentity(PKG,100000,original).equals("unknown"),"out-of-range user accepted");
    }
    static void resetRoot(){
        RootShell.calls=0;RootShell.failure=null;
        RootShell.next=new RootShell.Result(0,dump()+"\nLSA_PACKAGE_IDENTITY_END:0",false);
    }
    static void readTests(){
        Ctx c=new Ctx();RootHideManager.Target target=new RootHideManager.Target(10,PKG);
        resetRoot();HideRecoveryIdentity.Snapshot value=HideRecoveryIdentity.read(c,target);
        check(value.success&&value.userSerial==42&&value.packageIdentity.equals(identity(dump())),"valid snapshot failed");
        check(value.observedState.equals("HIDDEN")&&RootShell.calls==1,"identity and state were not read together");
        check(c.users.lastUser==10&&c.users.calls==2,"serial lookup/recheck did not target explicit user");
        check(RootShell.command.startsWith("/system/bin/dumpsys package '"+PKG+"';"),"dumpsys package was not strictly quoted");
        check(RootShell.timeout==12&&RootShell.limit==1024*1024&&RootShell.stdin==null,"read-only query bounds changed");
        c.users.serial=0;resetRoot();value=HideRecoveryIdentity.read(c,target);
        check(value.success&&value.userSerial==0&&c.users.lastUser==10,"valid returned serial zero was mistaken for fallback");
        c.users.serial=-1;resetRoot();value=HideRecoveryIdentity.read(c,target);
        check(!value.success&&value.userSerial==-1&&RootShell.calls==0,"missing serial fell back or queried package");
        c.users.failure=new SecurityException("denied");resetRoot();
        check(!HideRecoveryIdentity.read(c,target).success&&RootShell.calls==0,"serial security failure fell back");
        c=new Ctx();c.users=null;resetRoot();
        check(!HideRecoveryIdentity.read(c,target).success&&RootShell.calls==0,"missing UserManager fell back");
        c=new Ctx();resetRoot();
        check(!HideRecoveryIdentity.read(c,new RootHideManager.Target(99999,PKG)).success
            &&c.users.calls==0&&RootShell.calls==0,"UID multiplication overflow selected another user");
        resetRoot();
        check(!HideRecoveryIdentity.read(c,new RootHideManager.Target(10,PKG+"'; id")).success
            &&c.users.calls==0&&RootShell.calls==0,"invalid package reached root query");
        check(!HideRecoveryIdentity.read(null,target).success,"null snapshot context accepted");
        check(!HideRecoveryIdentity.read(c,null).success,"null target accepted");
        for(RootShell.Result result:new RootShell.Result[]{
            new RootShell.Result(1,dump()+"\nLSA_PACKAGE_IDENTITY_END:0",false),
            new RootShell.Result(0,dump()+"\nLSA_PACKAGE_IDENTITY_END:0",true),
            new RootShell.Result(0,dump(),false),
            new RootShell.Result(0,"",false),
            new RootShell.Result(0,dump()+"\nLSA_PACKAGE_IDENTITY_END:",false),
            new RootShell.Result(0,dump()+"\nLSA_PACKAGE_IDENTITY_END:1",false),
            new RootShell.Result(0,dump()+"\nLSA_PACKAGE_IDENTITY_END:0\nextra",false),null}){
            resetRoot();RootShell.next=result;value=HideRecoveryIdentity.read(c,target);
            check(!value.success&&value.userSerial==-1&&!value.message.isEmpty(),
                "failed/incomplete root read was treated as optional package evidence");
        }
        for(String complete:new String[]{
            "LSA_PACKAGE_IDENTITY_END:0",
            "garbage\nLSA_PACKAGE_IDENTITY_END:0",
            "Unable to find package: "+PKG+"\nLSA_PACKAGE_IDENTITY_END:0",
            dump().replace("      firstInstallTime=2026-08-02 11:22:33\n","")+"\nLSA_PACKAGE_IDENTITY_END:0",
            dump()+"    User 10: installed=true\n\nLSA_PACKAGE_IDENTITY_END:0"}){
            resetRoot();RootShell.next=new RootShell.Result(0,complete,false);
            value=HideRecoveryIdentity.read(c,target);
            check(value.success&&value.userSerial==42&&value.packageIdentity.equals("unknown"),
                "successful complete but missing/ambiguous metadata did not remain unknown");
        }
        resetRoot();RootShell.failure=new IllegalStateException("transport failed");
        value=HideRecoveryIdentity.read(c,target);
        check(!value.success&&value.userSerial==-1&&!value.message.isEmpty(),"transport exception did not stop the snapshot");
    }
    public static void main(String[] args)throws Exception {
        ownerTests();parserTests();readTests();
        System.out.println("HideRecoveryIdentity: "+checks+" behavior assertions passed; real owner/read/parser methods, offline Android/RootShell stubs.");
        System.out.println("Fixtures do not establish OEM dump compatibility, an installation UUID, mutation ownership, or absence of later manual changes.");
    }
}'''.replace('__EXPECTED__', EXPECTED),
}

with tempfile.TemporaryDirectory(prefix='ls-hide-identity-') as directory:
    temporary = Path(directory)
    files = [str(PRODUCTION), str(PRODUCTION.with_name('HideUserIdentity.java')), str(PRODUCTION.with_name('HidePackageSnapshot.java')), str(PRODUCTION.with_name('HideBatchExecutor.java'))]
    for name, content in SOURCES.items():
        target = temporary / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(content, encoding='utf-8')
        files.append(str(target))
    classes = temporary / 'classes'
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17',
                    '-d', str(classes), *files], check=True, timeout=30)
    subprocess.run(['java', '-cp', str(classes),
                    'ls.augment.com.TestHideRecoveryIdentity'], check=True, timeout=15)
