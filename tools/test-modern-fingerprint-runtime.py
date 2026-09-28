"""Run current APK-shaped selector and renderer doubles through the production hooks."""
import ast
from pathlib import Path
import subprocess
import tempfile
ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
base=ast.parse((ROOT/'tools/test-collab-runtime.py').read_text(encoding='utf-8'))
files=ast.literal_eval(next(n.value for n in base.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='files' for t in n.targets)))
del files['ls/augment/com/hook/TestCollabRuntime.java']
files['ls/augment/com/hook/AugmentModule.java']=files['ls/augment/com/hook/AugmentModule.java'].replace('public boolean deoptimize(java.lang.reflect.Executable method){return true;}', 'public final Set<java.lang.reflect.Executable> deopts=new HashSet<>();public boolean deoptimize(java.lang.reflect.Executable method){deopts.add(method);return true;}')
for package in ('com.zte.fingerprint','com.fingerprint.sensorservice'):
    source='package '+package+'.config;\nimport ls.augment.com.hook.AugmentModule;public class OperatorConfig {\n'
    for name in ('CN_IP_PB','GENPBUS','GENPBEU','TTYE','WutheringWaves','Fighting','Chisa','LTY'):
        native='isCustomizeForCN_IP_PB()||isCustomizeForGENPBUS()||isCustomizeForGENPBEU()' if name=='TTYE' else 'false'
        source+='public static boolean isCustomizeFor'+name+'(){return (Boolean)AugmentModule.dispatch(OperatorConfig.class,"isCustomizeFor'+name+'",new Class[]{},new Object[]{},()->'+native+');}\n'
    source+='public static boolean isKddi(){return false;}}'
    files[package.replace('.','/')+'/config/OperatorConfig.java']=source
files['com/zte/fingerprint/model/PhoneInfo.java']='package com.zte.fingerprint.model;public class PhoneInfo{}'
files['com/zte/fingerprint/theme/normal/LTYIPAnimation.java']='package com.zte.fingerprint.theme.normal;public class LTYIPAnimation{public LTYIPAnimation create(android.content.Context c){return this;}}'
files['com/zte/fingerprint/theme/FingerprintAnimProcess.java']='''package com.zte.fingerprint.theme;
import android.content.Context;import java.util.*;import ls.augment.com.hook.AugmentModule;
import com.zte.fingerprint.config.OperatorConfig;import com.zte.fingerprint.model.PhoneInfo;
import com.zte.fingerprint.theme.normal.*;
public class FingerprintAnimProcess {
 public static boolean fail;public static int calls;public static Object[] seen;public static ArrayList<Object> original;
 public static Object createForceMatrixAnimation(Context c,boolean ultrasonic){
  return AugmentModule.dispatch(FingerprintAnimProcess.class,"createForceMatrixAnimation",new Class[]{Context.class,boolean.class},new Object[]{c,ultrasonic},()->
   OperatorConfig.isCustomizeForTTYE()?"16:gold":OperatorConfig.isCustomizeForWutheringWaves()?new WutheringWaves():"16:matrix");
 }
 public static ArrayList<Object> getAllFpAnim(Context c,PhoneInfo phone,boolean a,String text,boolean b,boolean d){
  return (ArrayList<Object>)AugmentModule.dispatch(FingerprintAnimProcess.class,"getAllFpAnim",new Class[]{Context.class,PhoneInfo.class,boolean.class,String.class,boolean.class,boolean.class},new Object[]{c,phone,a,text,b,d},()->{
   calls++;seen=new Object[]{c,phone,a,text,b,d};
   if(fail&&OperatorConfig.isCustomizeForFighting())throw new IllegalStateException("bad native resource");
   ArrayList<Object> result=new ArrayList<>();result.add("base");
   if(OperatorConfig.isCustomizeForFighting())result.add("17:fighting");
   Object force=createForceMatrixAnimation(c,true);
   if(OperatorConfig.isCustomizeForWutheringWaves()){result.add(force);result.add(new FlameCipher());}
   else {if(OperatorConfig.isCustomizeForChisa())result.add(new Chisa());result.add(force);result.add(new FlameCipher());}
   original=result;return result;
  });
 }
 public static ArrayList<Object> getAllFpAnim(String c,PhoneInfo p,boolean a,String s,boolean b,boolean d){return new ArrayList<>();}
}
'''
files['com/fingerprint/sensorservice/view/FloatWindowAnimalView.java']='''package com.fingerprint.sensorservice.view;
import com.fingerprint.sensorservice.config.OperatorConfig;
public class FloatWindowAnimalView {public static boolean fail;public static String setAuthAnimalBackground(String flag){
 return (String)ls.augment.com.hook.AugmentModule.dispatch(FloatWindowAnimalView.class,"setAuthAnimalBackground",new Class[]{String.class},new Object[]{flag},()->{if(fail)throw new IllegalStateException("renderer");return switch(flag){case "21"->"chisa";case "19"->"lty";case "17"->OperatorConfig.isCustomizeForFighting()?"fighting":"matrix";
 case "20"->OperatorConfig.isCustomizeForTTYE()?"gold_flame":"flame";
 case "16"->OperatorConfig.isCustomizeForTTYE()?"gold":OperatorConfig.isCustomizeForWutheringWaves()?"chun":"matrix";default->"native";};});}}
'''
files['com/zte/fingerprint/theme/FingerprintAnimStyle.java']='package com.zte.fingerprint.theme;public class FingerprintAnimStyle{public String fingerprintAnimName,fingerprintStyleFlag;public int fingerprintAnimNameId,fingerprintDrawableId,fingerprintAnimIconId,fingerprintDefaultDrawableId;public String getName(android.content.Context c){return "native";}}'
files['com/zte/fingerprint/theme/normal/WutheringWaves.java']='package com.zte.fingerprint.theme.normal;public class WutheringWaves extends com.zte.fingerprint.theme.FingerprintAnimStyle{public String toString(){return "16:chun";}}'
files['com/zte/fingerprint/theme/normal/FlameCipher.java']='package com.zte.fingerprint.theme.normal;public class FlameCipher extends com.zte.fingerprint.theme.FingerprintAnimStyle{public FlameCipher(){fingerprintStyleFlag="20";}public FlameCipher create(android.content.Context c){return this;}public String toString(){return fingerprintStyleFlag+":flame";}}'
files['com/fingerprint/sensorservice/view/FloatWindowSensorView.java']='''package com.fingerprint.sensorservice.view;
import com.fingerprint.sensorservice.config.OperatorConfig;import ls.augment.com.hook.AugmentModule;
public class FloatWindowSensorView{public static String setSensorViewIconForRedMagic(boolean a,int b,String flag){
 return (String)AugmentModule.dispatch(FloatWindowSensorView.class,"setSensorViewIconForRedMagic",new Class[]{boolean.class,int.class,String.class},new Object[]{a,b,flag},()->
 "16".equals(flag)?OperatorConfig.isCustomizeForTTYE()?"gold":OperatorConfig.isCustomizeForWutheringWaves()?"chun":"matrix":OperatorConfig.isCustomizeForTTYE()?"gold_flame":"flame");}}
'''
files['ls/augment/com/hook/TestModernFingerprint.java']='''package ls.augment.com.hook;
import android.content.Context;import java.util.*;import ls.augment.com.*;
import com.zte.fingerprint.theme.FingerprintAnimProcess;import com.zte.fingerprint.model.PhoneInfo;
import com.zte.fingerprint.theme.normal.*;import com.fingerprint.sensorservice.view.FloatWindowAnimalView;
public class TestModernFingerprint {
 static int checks;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
 public static void main(String[] args)throws Throwable{
  AugmentModule m=new AugmentModule();AugmentModule.active=m;ClassLoader loader=TestModernFingerprint.class.getClassLoader();
  check(CollabUnlockHook.install(m,loader,"com.zte.fingerprints")==11,"modern gates, matrix scope, label and exact list");
  check(CollabUnlockHook.install(m,loader,"com.fingerprint.sensorservice")==10,"modern renderer gates and scoped matrix selectors");
  check(m.hooks.size()==21,"unrelated six-argument overload is not hooked");
  Context context=FeatureSettings.current;PhoneInfo phone=new PhoneInfo();
  String[] keys={CollabOptions.FP_CHISA,CollabOptions.FP_CHUN,CollabOptions.FP_FIGHTING,CollabOptions.FP_GOLD,CollabOptions.FP_LTY};
  for(int mask=0;mask<32;mask++){
   for(int i=0;i<keys.length;i++)FeatureSettings.set(keys[i],(mask&(1<<i))!=0);
   int before=FingerprintAnimProcess.calls;
   ArrayList<Object> list=FingerprintAnimProcess.getAllFpAnim(context,phone,true,"sentinel",false,true);
   check(FingerprintAnimProcess.calls==before+1,"native executes once "+mask);
   check(Arrays.equals(FingerprintAnimProcess.seen,new Object[]{context,phone,true,"sentinel",false,true}),"all six arguments preserved");
   check(list.stream().filter(x->x instanceof Chisa).count()==((mask&1)!=0?1:0),"Chisa retained exactly once "+mask);
   check(list.stream().filter(x->x instanceof LTYIPAnimation).count()==((mask&16)!=0?1:0),"LTY independent on RedMagic "+mask);
   check(list.stream().filter(x->x instanceof FlameCipher&&"20".equals(((FlameCipher)x).fingerprintStyleFlag)).count()==1,"native flame preserved exactly once");
   check(list.contains("17:fighting")==((mask&4)!=0),"fighting selection");
   String force=(mask&2)!=0?"chun":"matrix";
   check(list.stream().anyMatch(x->x.toString().equals("16:"+force))&&list.stream().filter(x->x.toString().startsWith("16:")).count()==1,"shared flag has one selection");
   check(FloatWindowAnimalView.setAuthAnimalBackground("16").equals(force),"renderer agrees with selector");
   check(com.fingerprint.sensorservice.view.FloatWindowSensorView.setSensorViewIconForRedMagic(true,0,"16").equals(force),"lockscreen icon agrees");
   if((mask&2)!=0)check(list.stream().anyMatch(x->x instanceof WutheringWaves&&"椿 · 鸣潮".equals(((WutheringWaves)x).fingerprintAnimName)),"Chun named candidate");
   if((mask&8)!=0)check(list.stream().anyMatch(x->x instanceof FlameCipher&&GoldFingerprintHook.NAME.equals(((FlameCipher)x).fingerprintAnimName)&&GoldFingerprintHook.FLAG.equals(((FlameCipher)x).fingerprintStyleFlag)),"separate golden flame candidate without replacing native");
   if(mask!=0)check("native_list_ready".equals(FeatureSettings.diagnostics.get("ls_augment_collab_fingerprint_list_runtime")),"all enabled entries accounted for");
   check(FloatWindowAnimalView.setAuthAnimalBackground("17").equals((mask&4)!=0?"fighting":"matrix"),"fighting renderer gate");
   check(FloatWindowAnimalView.setAuthAnimalBackground("20").equals("flame"),"gold flame renderer gate");
   check(FloatWindowAnimalView.setAuthAnimalBackground("21").equals("chisa")&&FloatWindowAnimalView.setAuthAnimalBackground("19").equals("lty"),"independent style flags");
   for(Object item:list)if(item instanceof com.zte.fingerprint.theme.FingerprintAnimStyle){
    var method=com.zte.fingerprint.theme.FingerprintAnimStyle.class.getDeclaredMethod("getName",Context.class);
    Object label=m.hooks.get(method).intercept(new AugmentModule.Call(item,new Object[]{context},()->"native"));
    String expected=item instanceof WutheringWaves&&(mask&2)!=0?"椿 · 鸣潮":GoldFingerprintHook.FLAG.equals(((com.zte.fingerprint.theme.FingerprintAnimStyle)item).fingerprintStyleFlag)?GoldFingerprintHook.NAME:"native";
    check(expected.equals(label),"name accessor and candidate label agree");
   }
   if(mask==0)check(list==FingerprintAnimProcess.original,"disabled returns native identity");
  }
  int before=FingerprintAnimProcess.calls;FingerprintAnimProcess.fail=true;
  ArrayList<?> fallback=FingerprintAnimProcess.getAllFpAnim(context,phone,false,"fallback",true,false);
  check(FingerprintAnimProcess.calls==before+2&&fallback==FingerprintAnimProcess.original&&!fallback.contains("17:fighting"),"missing native resource retries unmodified gates");
  check(com.zte.fingerprint.config.OperatorConfig.isCustomizeForFighting(),"failure restores override state");
  check(!com.zte.fingerprint.config.OperatorConfig.isKddi()&&!com.fingerprint.sensorservice.config.OperatorConfig.isKddi(),"unrelated device predicates unchanged");
  check(m.deopts.stream().anyMatch(x->x.getName().equals("getAllFpAnim"))&&m.deopts.stream().anyMatch(x->x.getName().equals("setAuthAnimalBackground")),"verified gate callers deoptimized");
  int size=m.hooks.size();CollabUnlockHook.install(m,loader,"com.zte.fingerprints");CollabUnlockHook.install(m,loader,"com.fingerprint.sensorservice");check(m.hooks.size()==size,"repeat install is idempotent");
  FloatWindowAnimalView.fail=true;try{FloatWindowAnimalView.setAuthAnimalBackground("16");throw new AssertionError("expected");}catch(IllegalStateException expected){}finally{FloatWindowAnimalView.fail=false;}
  check(!com.fingerprint.sensorservice.config.OperatorConfig.isCustomizeForTTYE(),"renderer exception restores scoped gold gate");
  check(FloatWindowAnimalView.setAuthAnimalBackground("20").equals("flame"),"failed matrix rendering cannot hijack original 20");
  check(m.errors.isEmpty(),"registration has no errors");
  System.out.println("PASS modern fingerprint selector/renderer: "+checks+" checks across 32 switch combinations");
 }
}
'''
for name in ('EnhancementOption.java','CollabOptions.java','CollabPolicy.java','hook/CollabUnlockHook.java','hook/OemHooks.java','hook/GoldFingerprintHook.java'):
    files['ls/augment/com/'+name]=(SRC/name).read_text(encoding='utf-8')
with tempfile.TemporaryDirectory(prefix='duo-fingerprint-') as temp:
    sources=[]
    for name,source in files.items():
        p=Path(temp)/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source,encoding='utf-8');sources.append(str(p))
    subprocess.run(['javac','-encoding','UTF-8','-d',temp,*sources],check=True)
    subprocess.run(['java','-cp',temp,'ls.augment.com.hook.TestModernFingerprint'],check=True)
