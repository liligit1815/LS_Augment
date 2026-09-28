"""Exercise GOLDEN SAGA render hooks alongside the existing qualification hook."""
from pathlib import Path
import subprocess,tempfile
ROOT=Path(__file__).resolve().parents[1]
base=(ROOT/'tools/test-collab-runtime.py').read_text(encoding='utf8')
ns={'__file__':str(ROOT/'tools/test-collab-runtime.py')};exec(base[:base.index('with tempfile.TemporaryDirectory')],ns);files=ns['files'];SRC=ns['SRC']
files['android/content/Context.java']='''package android.content;public class Context {
 public final android.content.res.Resources resources=new android.content.res.Resources();
 public ClassLoader getClassLoader(){return getClass().getClassLoader();}public String getPackageName(){return "com.fingerprint.sensorservice";}
 public android.content.res.Resources getResources(){return resources;}}
'''
files['android/content/res/Resources.java']='''package android.content.res;public class Resources {
 public String getString(int id){return "native";}public CharSequence getText(int id){return "native";}public int id=99;public int getIdentifier(String n,String t,String p){return id;}}
'''
s=files['ls/augment/com/hook/AugmentModule.java']
s=s.replace('hooks.put(method,h);','''Hooker previous=hooks.get(method);hooks.put(method,previous==null?h:chain->h.intercept(new Call(chain.getThisObject(),chain.getArgs().toArray(),()->previous.intercept(new Call(chain.getThisObject(),currentArgs.get(),()->chain.proceed(currentArgs.get()))))));''')
s=s.replace(' public static Object dispatch(Class<?> type', ''' public static Object owned(Object owner,String name,Class<?>[] types,Object[] args,Original original){
 try{Method m=owner.getClass().getDeclaredMethod(name,types);Hooker h=active.hooks.get(m);return h==null?original.run():h.intercept(new Call(owner,args,original));}catch(Throwable e){throw new RuntimeException(e);}}
 public static Object dispatch(Class<?> type''');files['ls/augment/com/hook/AugmentModule.java']=s
s=files['ls/augment/com/hook/FeatureSettings.java'].replace('static final Map<String,Integer> writes', 'static final java.util.List<Runnable> listeners=new java.util.ArrayList<>();\n static boolean addSnapshotListener(Context c,Runnable r){listeners.add(r);return true;}static void removeSnapshotListener(Runnable r){listeners.remove(r);}\n static final Map<String,Integer> writes')
s=s.replace('static Context from(Object o){return current;}', 'static Context from(Object owner){if(owner instanceof Context)return (Context)owner;Object found=OemHooks.field(owner,"context");return found instanceof Context?(Context)found:current;}')
files['ls/augment/com/hook/FeatureSettings.java']=s
files['com/fingerprint/sensorservice/view/FloatWindowAnimalView.java']='''package com.fingerprint.sensorservice.view;
import android.content.Context;import ls.augment.com.hook.AugmentModule;
public class FloatWindowAnimalView {
 public Context context=new Context();public final Animation authAnimal=new Animation();public int calls;public boolean fail;public String seen;public boolean golden;
 public static class Animation{public int[] frames;public void setBitmapResourceID(int[] frames){this.frames=frames;}}
 private int[] getData(int id){return new int[]{id,100,101};}
 public void setAuthAnimalBackground(String flag){AugmentModule.owned(this,"setAuthAnimalBackground",new Class[]{String.class},new Object[]{flag},()->{calls++;seen=(String)AugmentModule.currentArgs.get()[0];golden=com.fingerprint.sensorservice.config.OperatorConfig.isCustomizeForTTYE();if(fail)throw new IllegalStateException("native");authAnimal.frames=new int[]{Integer.parseInt(seen)};return null;});}}
'''
files['com/zte/fingerprint/theme/normal/FlameCipher.java']='''package com.zte.fingerprint.theme.normal;
public class FlameCipher {public String fingerprintStyleFlag="20",fingerprintAnimName="焰旋流光";public int fingerprintAnimNameId=20,fingerprintDrawableId=20,fingerprintAnimIconId=20,fingerprintDefaultDrawableId=20;
public FlameCipher create(android.content.Context c){return this;}}
'''
files['com/zte/fingerprint/theme/StyleFlag.java']='package com.zte.fingerprint.theme;public class StyleFlag{public static String getAnimStyleName(String flag,android.content.Context c){return "native";}}'
files['com/fingerprint/sensorservice/config/OperatorConfig.java']='package com.fingerprint.sensorservice.config;import ls.augment.com.hook.AugmentModule;public class OperatorConfig{public static boolean isCustomizeForTTYE(){return (Boolean)AugmentModule.dispatch(OperatorConfig.class,"isCustomizeForTTYE",new Class[]{},new Object[]{},()->false);}}'
files['com/fingerprint/sensorservice/view/FloatWindowSensorView.java']='package com.fingerprint.sensorservice.view;import ls.augment.com.hook.AugmentModule;public class FloatWindowSensorView{public String seen;public boolean golden;public void setSensorViewIconForRedMagic(boolean a,int b,String flag){AugmentModule.owned(this,"setSensorViewIconForRedMagic",new Class[]{boolean.class,int.class,String.class},new Object[]{a,b,flag},()->{seen=(String)AugmentModule.currentArgs.get()[2];golden=com.fingerprint.sensorservice.config.OperatorConfig.isCustomizeForTTYE();return null;});}}'
files['ls/augment/com/hook/CollabRenderHook.java']=(SRC/'hook/CollabRenderHook.java').read_text(encoding='utf8')
files['ls/augment/com/hook/TestCollabRender.java']='''package ls.augment.com.hook;
import ls.augment.com.CollabOptions;import com.fingerprint.sensorservice.view.*;import com.zte.fingerprint.theme.normal.FlameCipher;import java.util.*;
public class TestCollabRender{
static int checks,qualificationCalls;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
public static void main(String[] args)throws Throwable{
AugmentModule m=new AugmentModule();AugmentModule.active=m;ClassLoader loader=TestCollabRender.class.getClassLoader();
CollabUnlockHook.install(m,loader,"com.fingerprint.sensorservice");
m.prepareFeatureHook(FloatWindowAnimalView.class.getDeclaredMethod("setAuthAnimalBackground",String.class),"test.coexist",false).intercept(c->{qualificationCalls++;return c.proceed();});
CollabRenderHook.install(m,loader,"com.fingerprint.sensorservice");CollabRenderHook.install(m,loader,"com.fingerprint.sensorservice");
FloatWindowAnimalView sensor=new FloatWindowAnimalView();sensor.setAuthAnimalBackground("20");
check(sensor.calls==1&&qualificationCalls==1&&sensor.authAnimal.frames[0]==20,"off calls native and existing hook once");
FeatureSettings.set(CollabOptions.FP_GOLD,true);for(Runnable r:new ArrayList<>(FeatureSettings.listeners))r.run();
check(sensor.calls==2&&qualificationCalls==2&&sensor.authAnimal.frames[0]==20&&!sensor.golden,"enabling gold never replaces original flame");
sensor.setAuthAnimalBackground(GoldFingerprintHook.FLAG);
check(sensor.seen.equals("20")&&sensor.golden&&sensor.authAnimal.frames[0]==99,"custom flag translates to native gold renderer and uses gold frames");
check(!GoldFingerprintHook.scoped()&&!com.fingerprint.sensorservice.config.OperatorConfig.isCustomizeForTTYE(),"gold scope confined to custom render call");
FeatureSettings.set(CollabOptions.FP_GOLD,false);for(Runnable r:new ArrayList<>(FeatureSettings.listeners))r.run();
check(sensor.seen.equals("20")&&!sensor.golden&&sensor.authAnimal.frames[0]==20,"disabled custom flag uses safe native fallback");
FeatureSettings.set(CollabOptions.FP_GOLD,true);for(Runnable r:new ArrayList<>(FeatureSettings.listeners))r.run();
check(sensor.golden&&sensor.authAnimal.frames[0]==99,"refresh remembers custom persisted flag");
sensor.context.resources.id=0;sensor.setAuthAnimalBackground(GoldFingerprintHook.FLAG);check(sensor.authAnimal.frames[0]==20,"missing array preserves native renderer result");sensor.context.resources.id=99;
sensor.setAuthAnimalBackground("16");check(sensor.seen.equals("16")&&!sensor.golden&&sensor.authAnimal.frames[0]==16,"native matrix never hijacked");
sensor.fail=true;try{sensor.setAuthAnimalBackground(GoldFingerprintHook.FLAG);throw new AssertionError("expected");}catch(RuntimeException expected){}sensor.fail=false;check(!GoldFingerprintHook.scoped(),"native exception restores gold scope");
FloatWindowSensorView icon=new FloatWindowSensorView();icon.setSensorViewIconForRedMagic(true,0,GoldFingerprintHook.FLAG);check(icon.seen.equals("20")&&icon.golden,"custom idle icon follows gold scope");
icon.setSensorViewIconForRedMagic(true,0,"20");check(!icon.golden,"native idle icon unchanged");
CollabRenderHook.install(m,loader,"com.zte.fingerprints");android.content.Context context=new android.content.Context();FlameCipher nativeItem=new FlameCipher();List<Object> list=new ArrayList<>(List.of(nativeItem));
check(GoldFingerprintHook.append(context,loader,list)&&list.size()==2&&list.get(1)==nativeItem,"independent gold precedes native flame");FlameCipher gold=(FlameCipher)list.get(0);
check(gold!=nativeItem&&gold.fingerprintStyleFlag.equals(GoldFingerprintHook.FLAG)&&gold.fingerprintDrawableId==99,"custom flag and assets belong to distinct object");
check(nativeItem.fingerprintStyleFlag.equals("20")&&nativeItem.fingerprintAnimName.equals("焰旋流光")&&nativeItem.fingerprintDrawableId==20,"native name, id and animation preserved");
check(GoldFingerprintHook.append(context,loader,list)&&list.size()==2,"repeat population cannot duplicate gold");
context.resources.id=0;List<Object> missing=new ArrayList<>(List.of(nativeItem));check(!GoldFingerprintHook.append(context,loader,missing)&&missing.size()==1,"missing gold resources leave native list alone");
for(String name:new String[]{"getText","getString"}){var method=android.content.res.Resources.class.getDeclaredMethod(name,int.class);check(GoldFingerprintHook.NAME.equals(m.hooks.get(method).intercept(new AugmentModule.Call(context.resources,new Object[]{GoldFingerprintHook.NAME_ID},()->"native"))),"carousel resource title resolves");check("native".equals(m.hooks.get(method).intercept(new AugmentModule.Call(context.resources,new Object[]{20},()->"native"))),"native title resources unchanged");}
var label=com.zte.fingerprint.theme.StyleFlag.class.getDeclaredMethod("getAnimStyleName",String.class,android.content.Context.class);
check(GoldFingerprintHook.NAME.equals(m.hooks.get(label).intercept(new AugmentModule.Call(null,new Object[]{GoldFingerprintHook.FLAG,context},()->"native"))),"personalization summary resolves custom name");
System.out.println("PASS independent gold render/list/names: "+checks+" checks");}}
'''
with tempfile.TemporaryDirectory(prefix='duo-gold-render-') as tmp:
 paths=[]
 for name,source in files.items():
  path=Path(tmp)/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(source,encoding='utf8');paths.append(str(path))
 subprocess.run(['javac','-encoding','UTF-8','-d',tmp,*paths],check=True)
 subprocess.run(['java','-cp',tmp,'ls.augment.com.hook.TestCollabRender'],check=True)
