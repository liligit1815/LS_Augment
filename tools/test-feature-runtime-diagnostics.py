"""Execute release runtime logging, SystemUI assistant handoff and the phone-side fan probe."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
SOURCES = {
    'android/os/SystemClock.java': 'package android.os;public class SystemClock {public static long now=1000;public static long elapsedRealtime(){return now;}}',
    'android/os/Bundle.java': '''package android.os;public class Bundle extends java.util.HashMap<String,Object>{
        public void putBoolean(String k,boolean v){put(k,v);}public boolean getBoolean(String k){return Boolean.TRUE.equals(get(k));}
        public void putString(String k,String v){put(k,v);}public String getString(String k){return (String)get(k);}
        public void putLong(String k,long v){put(k,v);}public int getInt(String k,int d){return containsKey(k)?(Integer)get(k):d;}}''',
    'android/content/Context.java': 'package android.content;public class Context {}',
    'android/content/ComponentName.java': 'package android.content;public record ComponentName(String name){public String flattenToShortString(){return name;}}',
    'ls/augment/com/SystemOptions.java': 'package ls.augment.com;public class SystemOptions {public static String key(String key){return key;}}',
    'ls/augment/com/StartupDiagnostics.java': '''package ls.augment.com;public class StartupDiagnostics {
        public static final java.util.List<String> events=new java.util.ArrayList<>();public static boolean fail;
        public static void record(String stage,String detail,Throwable error){if(fail)throw new IllegalStateException("sink failed");events.add(stage+":"+detail);}}''',
    'ls/augment/com/RootShell.java': '''package ls.augment.com;public class RootShell {
        static String output="loaded_note_unavailable";static boolean success;static int reads;
        static Result run(String script,String stdin,int timeout,int limit){reads++;if(!script.contains("/lib/modules/soc_fan.ko"))throw new AssertionError("missing module path");return new Result();}
        static class Result {String output=RootShell.output;boolean isSuccess(){return success;}}}''',
    'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;import android.content.Context;class FeatureSettings {
        static boolean power,gesture;static boolean enabled(Context c,String key){return key.equals("power_default_assistant")?power:gesture;}
        static String runtimeEvidence(){return "configVerified=true;configRevision=321";}}''',
    'ls/augment/com/hook/AugmentModule.java': 'package ls.augment.com.hook;class AugmentModule {}',
    'ls/augment/com/hook/OemHooks.java': '''package ls.augment.com.hook;
        import java.util.*;import java.lang.reflect.*;import android.content.Context;
        class OemHooks {
            interface Hook {Object run(Chain chain)throws Throwable;}interface Chain {Object proceed()throws Throwable;Object getArg(int i);Object getThisObject();List<Object> getArgs();}
            static final Map<String,Hook> hooks=new HashMap<>();
            static int observedMethods(AugmentModule module,ClassLoader loader,String name,String method,Class<?> result,int argc,String key,Hook hook,Class<?>[] args){
                try{Method target=Class.forName(name,false,loader).getDeclaredMethod(method,args);
                    if(target.getReturnType()!=result)return 0;hooks.put(method,hook);return 1;
                }catch(ReflectiveOperationException missing){return 0;}}
            static Context context(Object o,List<Object> args){return new Context();}
        }''',
    'com/android/systemui/assist/AssistManager.java': '''package com.android.systemui.assist;public class AssistManager {
        public void startAssist(android.os.Bundle bundle){}public void startAssist(String wrongSignature){}}''',
    'com/zte/adapt/mifavor/navbar/AssistManagerAdapt.java': '''package com.zte.adapt.mifavor.navbar;public class AssistManagerAdapt {
        public boolean handleStartAssist(android.os.Bundle b,android.content.Context c){return true;}
        public android.content.ComponentName getAssistInfoForUser(android.content.ComponentName c){return c;}}''',
    'ls/augment/com/hook/TestFeatureRuntime.java': r'''package ls.augment.com.hook;
        import java.util.*;import android.os.*;import android.content.*;import ls.augment.com.StartupDiagnostics;
        public class TestFeatureRuntime {
            static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
            interface Body{Object run()throws Throwable;}
            static Object invoke(String method,List<Object> args,Body body)throws Throwable{
                OemHooks.Hook hook=OemHooks.hooks.get(method);if(hook==null)return body.run();
                return hook.run(new OemHooks.Chain(){public Object proceed()throws Throwable{return body.run();}
                    public Object getArg(int i){return args.get(i);}public Object getThisObject(){return new Object();}public List<Object> getArgs(){return args;}});
            }
            static Bundle args(int kind){Bundle b=new Bundle();b.put("invocation_type",kind);return b;}
            public static void main(String[] ignored)throws Throwable{
                FeatureRuntimeLog.state("TEST_STATE","normal","normal");
                for(int i=0;i<1000;i++)FeatureRuntimeLog.state("TEST_STATE","normal","normal");
                check(StartupDiagnostics.events.size()==1,"unchanged samples must not flood journal");
                FeatureRuntimeLog.state("TEST_STATE","failed","reason=offline");
                check(StartupDiagnostics.events.size()==2&&StartupDiagnostics.events.get(1).contains("suppressed=1000"),"transition and suppression retained");
                check(StartupDiagnostics.events.get(1).contains("configRevision=321"),"journal ties evidence to config");
                for(int i=0;i<1000;i++)FeatureRuntimeLog.event("TEST_BURST","value="+i);
                check(StartupDiagnostics.events.size()==14,"changing events bounded to 12 per ten seconds");
                SystemClock.now+=300_001;FeatureRuntimeLog.state("TEST_STATE","failed","reason=offline");
                check(StartupDiagnostics.events.size()==15,"long-lived state receives heartbeat on next observation");
                FeatureRuntimeLog.event("TEST_SIZE","x".repeat(10000));
                check(StartupDiagnostics.events.get(15).length()<2200,"payload bounded");
                StartupDiagnostics.fail=true;FeatureRuntimeLog.event("TEST_FAILURE","fail");StartupDiagnostics.fail=false;
                FeatureRuntimeLog.event("TEST_RECOVERY","okay");check(StartupDiagnostics.events.size()==17,"logger failure cannot escape into caller");
                check(FeatureRuntimeLog.failure(new java.lang.reflect.InvocationTargetException(new IllegalStateException("secret"))).equals("java.lang.IllegalStateException"),"exception evidence unwraps type and omits message");
                DefaultAssistantUiHook.install(new AugmentModule(),TestFeatureRuntime.class.getClassLoader());
                check(OemHooks.hooks.size()==3,"expected exact SystemUI signatures registered");
                ComponentName selected=new ComponentName("third.party/.Assist"),oem=new ComponentName("oem/.Assist");
                FeatureSettings.power=true;
                invoke("startAssist",List.of(args(6)),()->{
                    check(invoke("getAssistInfoForUser",List.of(selected),()->oem)==selected,"power preserves chosen assistant");
                    check(invoke("handleStartAssist",List.of(args(6),new Context()),()->true).equals(false),"power bypasses OEM override");
                    invoke("startAssist",List.of(args(1)),()->{check(invoke("getAssistInfoForUser",List.of(selected),()->oem)==selected,"nested non-power call preserves existing scope");return null;});
                    return null;});
                check(invoke("getAssistInfoForUser",List.of(selected),()->oem)==oem,"scope restored after dispatch");
                invoke("startAssist",List.of(args(1)),()->{check(invoke("handleStartAssist",List.of(args(1),new Context()),()->true).equals(true),"other triggers retain native decision");return null;});
                FeatureSettings.power=false;
                invoke("startAssist",List.of(args(6)),()->{check(invoke("getAssistInfoForUser",List.of(selected),()->oem)==oem,"disabled option preserves native component");return null;});
                invoke("startAssist",Collections.singletonList(null),()->{check(invoke("getAssistInfoForUser",List.of(selected),()->oem)==oem,"null native bundle preserved");return null;});
                FeatureSettings.power=true;RuntimeException original=new RuntimeException("private payload");
                try{invoke("startAssist",List.of(args(6)),()->{throw original;});throw new AssertionError("swallowed original");}catch(RuntimeException caught){check(caught==original,"same native exception propagates");}
                check(invoke("getAssistInfoForUser",List.of(selected),()->oem)==oem,"scope restored after exception");
                check(StartupDiagnostics.events.stream().anyMatch(s->s.contains("result=chain_threw;error=java.lang.RuntimeException")),"release logs native dispatch failure");
                check(StartupDiagnostics.events.stream().noneMatch(s->s.contains("private payload")),"no exception payload logged");
                check(StartupDiagnostics.events.stream().anyMatch(s->s.contains("business=unconfirmed")),"return is not claimed as visible assistant");
                OemHooks.hooks.clear();ClassLoader missing=new ClassLoader(TestFeatureRuntime.class.getClassLoader()){
                    protected Class<?> loadClass(String name,boolean resolve)throws ClassNotFoundException{if(name.contains("AssistManagerAdapt"))throw new ClassNotFoundException(name);return super.loadClass(name,resolve);}};
                DefaultAssistantUiHook.install(new AugmentModule(),missing);
                check(OemHooks.hooks.size()==1,"missing OEM adapter preserves remaining native entry");
                check(StartupDiagnostics.events.stream().anyMatch(s->s.contains("ASSIST_UI_CAPABILITY:")&&s.contains("handleStartAssist=0")),"missing interface installation survives absent logcat");
                check(invoke("handleStartAssist",List.of(args(6),new Context()),()->true).equals(true),"missing interface leaves native result");
                System.out.println("PASS release runtime journal and SystemUI assistant: "+checks+" assertions");
            }
        }''',
    'ls/augment/com/TestFanProbe.java': r'''package ls.augment.com;import android.os.*;import java.nio.file.*;
        public class TestFanProbe {
            static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);}
            public static void main(String[] args)throws Exception{
                check(!FanDriverProbe.read().getBoolean("verified"),"unavailable loaded note rejects");
                check(RootShell.reads==1,"one initial read");FanDriverProbe.read();check(RootShell.reads==1,"negative cache avoids root spin");
                SystemClock.now+=30_001;RootShell.success=true;
                RootShell.output="6.6.30-android15-8-maybe-dirty-4k\n040000001400000003000000474e5500a0711bd15d5c7ecb30f8f2e6a41d874e018c4d22\ndriver_path=/lib/modules/soc_fan.ko\n0693fb6f722969a9cc830e58f3df7ff96c21215e5b8f665b71c374bdd03cd8cc";
                check(FanDriverProbe.read().getBoolean("verified"),"known driver recovers after initial failure");
                check(FanDriverProbe.describe().contains("driver_path=/lib/modules/soc_fan.ko"),"export retains actual candidate location");
                check(RootShell.reads==2,"positive proof cache reused");
                SystemClock.now+=300_001;RootShell.output=RootShell.output.replace("a0711bd15", "000000000");
                check(!FanDriverProbe.read().getBoolean("verified"),"changed running module cannot inherit cached proof");
                check(FanDriverProbe.describe().contains("loaded_build_id_mismatch"),"precise mismatch reason exported");
                Files.writeString(Path.of(args[0]),AssistantDiagnosticSnapshot.SCRIPT);
                System.out.println("PASS phone-side driver probe: unavailable, bounded retry, recovered proof, changed identity, export");
            }
        }''',
}
for name in ['hook/FeatureRuntimeLog.java', 'hook/DefaultAssistantUiHook.java', 'hook/FanDriverContract.java',
             'FanDriverProbe.java', 'AssistantDiagnosticSnapshot.java']:
    SOURCES['ls/augment/com/' + name] = (SRC / name).read_text(encoding='utf-8')

with tempfile.TemporaryDirectory(prefix='lsa-feature-runtime-') as temp:
    root = Path(temp)
    paths = []
    for name, content in SOURCES.items():
        path = root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding='utf-8')
        paths.append(str(path))
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', temp, *paths], check=True)
    subprocess.run(['java', '-cp', temp, 'ls.augment.com.hook.TestFeatureRuntime'], check=True, timeout=15)
    script = root / 'assistant-export.sh'
    subprocess.run(['java', '-cp', temp, 'ls.augment.com.TestFanProbe', str(script)], check=True, timeout=15)
    fixtures = r'''
am() { echo 10; }
settings() { [ "$1" = --user ] && [ "$2" = 10 ] && [ "$3" = get ] && [ "$4" = secure ] || exit 42; echo 'third.party/.Assist'; }
dumpsys() {
  if [ "$1" = window ]; then printf 'mCurrentUserId=10\nmLongPressOnPowerBehavior=5\nmPowerKeyHandled=true\nsecretWindow=PRIVATE\n';
  else printf '  mCurUser=10\n  mComponent=third.party/.Assist\n  mBound=true\n  mSession=PRIVATE_SPEECH\n  recognition=PRIVATE_SPEECH\n'; fi
}
'''
    bash = Path('C:/Program Files/Git/bin/bash.exe')
    command = str(bash) if bash.exists() else 'bash'
    result = subprocess.run([command, '-c', fixtures + script.read_text(encoding='utf-8')], text=True, capture_output=True, check=True)
    assert 'currentUser=10' in result.stdout and 'mBound=true' in result.stdout and 'mLongPressOnPowerBehavior=5' in result.stdout
    assert 'PRIVATE' not in result.stdout, result.stdout
    print('PASS assistant export: current-user settings, native policy/service fields, speech/session/window payload excluded')
