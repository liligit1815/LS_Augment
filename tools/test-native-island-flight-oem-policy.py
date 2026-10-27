"""Exercise actual extracted OEM flight policy bodies against Duo's read-only policy adapter.

This is an optional ROM-analysis check, not a device or live-flight test. Android storage,
logging and AttributeHelper conversion are fixtures. The selected policy bodies are copied
unchanged from the local APK extractions, and their hashes are saved with the result.
"""
from pathlib import Path
import hashlib, json, os, re, subprocess, tempfile

ROOT = Path(__file__).resolve().parents[1]
AUDIT = ROOT / 'audit-output/native-island-goal-20261026'
REL = 'java/com/zte/briefagent/event/scene/travel/starryisland/FlightStarryIslandAdapter.java'
OLD = AUDIT / 'flight-runtime' / REL
NEW = AUDIT / 'flight-redmagic12' / REL


def method(source, name):
    found = list(re.finditer(r'^    (?:private|public) (?:static )?[^\n]+\b' + re.escape(name) + r'\([^\n]*\)\s*\{', source, re.M))
    assert len(found) == 1, (name, len(found))
    start = found[0].start()
    pos = source.index('{', start)
    depth = 1
    end = pos + 1
    # The selected policy methods contain no braces in strings or comments.
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    result = source[start:end]
    assert 'UnsupportedOperationException' not in result, name
    return result


common = ['inferPhaseFromCardType', 'shouldShowStarryIsland', 'shouldSkipDisplayFor10SecondPhase']
modern = ['getDisplayTimeFromPrefs', 'getCombinedLastDisplayTime', 'is10SecondPhase', 'isPersistentPhase',
          'isAlertPhase', 'isFixedDurationAlertPhase', 'isIslandGateChangeState', 'isPersistentIsland',
          'isAlertDisplayDurationReached']
source_hashes = {}
files = {}
for path, name, names in [(OLD, 'OldPolicy', common), (NEW, 'ModernPolicy', common + modern)]:
    raw = path.read_text(encoding='utf-8')
    bodies = '\n'.join(method(raw, name) for name in names)
    source_hashes[str(path.relative_to(ROOT))] = {
        'sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
        'methods': {name: hashlib.sha256(method(raw, name).encode()).hexdigest() for name in names}}
    files[f'ls/augment/com/hook/{name}.java'] = '''package ls.augment.com.hook;
import java.util.*;import android.content.Context;import android.text.TextUtils;import android.util.Log;
import com.zte.briefagent.util.AttributeHelper;
public class ''' + name + ''' {
private static final String TAG="OEM",PREFS_NAME="flight_starry_island_display_time",
 EXTRA_ISLAND_GATE_CHANGED="islandGateChanged",EXTRA_ALERT_ISLAND_PERSISTENT="alertIslandPersistent",
 EXTRA_ALERT_ISLAND_OCCUR_TIME="alertIslandOccurTimeMillis";
static class WorkRequest {static final long MIN_BACKOFF_MILLIS=10000;}
''' + bodies + '\n}'

files.update({
'android/content/Context.java': '''package android.content;import java.util.*;public class Context {
public final Map<String,SharedPreferences> stores=new HashMap<>();
public SharedPreferences getSharedPreferences(String n,int mode){return stores.computeIfAbsent(n,x->new SharedPreferences());}}''',
'android/content/SharedPreferences.java': '''package android.content;import java.util.*;public class SharedPreferences {
public final Map<String,Object> values=new HashMap<>();public String getString(String n,String d){Object v=values.get(n);return v==null?d:(String)v;}}''',
'android/text/TextUtils.java': '''package android.text;public class TextUtils {public static boolean isEmpty(CharSequence s){return s==null||s.length()==0;}}''',
'android/util/Log.java': '''package android.util;public class Log {public static void d(String t,String s){}public static void w(String t,String s){}public static void w(String t,String s,Throwable e){}}''',
'com/zte/briefagent/util/AttributeHelper.java': '''package com.zte.briefagent.util;import java.util.*;public class AttributeHelper {
public static Object getExtra(Map m,String key,Object fallback){Object v=m==null?null:m.get(key);if(v==null)return fallback;
if(fallback instanceof Long){try{return Long.parseLong(v.toString());}catch(Exception e){return fallback;}}return v;}}''',
'com/zte/briefagent/event/scene/travel/task/TravelFlightIgnoreManager.java': '''package com.zte.briefagent.event.scene.travel.task;
import android.content.Context;import java.util.*;public class TravelFlightIgnoreManager {
public static Set<String> ignored=new HashSet<>();public static String resolveStateKey(Map m){return String.valueOf(m.getOrDefault("fixtureStateKey",m.getOrDefault("flightPhase","")));}
public static boolean isIgnored(Context c,String key,String phase){return ignored.contains(key+"_"+phase);}}''',
'ls/augment/com/hook/NativeIslandPersonalScene.java': '''package ls.augment.com.hook;import java.lang.reflect.*;class NativeIslandPersonalScene {
static Method exact(Class<?> c,String n,Class<?> r,Class<?>...a)throws Exception {Method m=c.getMethod(n,a);if(m.getReturnType()!=r)throw new NoSuchMethodException(n);m.setAccessible(true);return m;}}''',
'ls/augment/com/hook/NativeIslandPersonalCards.java': '''package ls.augment.com.hook;import java.lang.reflect.*;class NativeIslandPersonalCards {
static Method require(Class<?> c,String n,Class<?> r,Class<?>...a)throws Exception {Method m=NativeIslandSceneContract.method(c,n,r,a);if(m==null)throw new NoSuchMethodException(n);return m;}
static Method requireStatic(Class<?> c,String n,Class<?> r,Class<?>...a)throws Exception {Method m=require(c,n,r,a);if(!Modifier.isStatic(m.getModifiers()))throw new NoSuchMethodException(n);return m;}}''',
'ls/augment/com/hook/TestOemFlightPolicy.java': '''package ls.augment.com.hook;
import android.content.Context;import java.util.*;import java.lang.reflect.*;
import com.zte.briefagent.event.scene.travel.task.TravelFlightIgnoreManager;
public class TestOemFlightPolicy {
static int checks;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
public static class Card {public String type="TRAVEL_FLIGHT_AIRPORT",key="trip";public Map<String,Object> data=new HashMap<>();
public String getType(){return type;}public String getRelateKey(){return key;}public Map<String,Object> getExtraData(){return data;}}
public static class ModernChild extends ModernPolicy {}
public static class WrongReturn extends OldPolicy {private Object shouldSkipDisplayFor10SecondPhase(String p,Map m,Context c){return false;}}
public static class WrongStatic extends OldPolicy {private static boolean shouldSkipDisplayFor10SecondPhase(String p,Map m,Context c){return false;}}
public static class Incomplete extends OldPolicy {private boolean shouldSkipDisplayFor10SecondPhase(String p,Map m,Context c){return false;}}
static NativeIslandPersonalFlightState make(Class<?> adapter)throws Exception {return new NativeIslandPersonalFlightState(TestOemFlightPolicy.class.getClassLoader(),adapter,Card.class);}
static void phase(Card c,String phase){c.data.clear();c.data.put("flightPhase",phase);c.data.put("flightKey",c.key);}
static Object call(Object o,String name,Class<?>[] types,Object...args)throws Exception {Method m=o.getClass().getDeclaredMethod(name,types);m.setAccessible(true);return m.invoke(o,args);}
public static void main(String[] args)throws Exception {
Context context=new Context();Card card=new Card();NativeIslandPersonalFlightState old=make(OldPolicy.class),modern=make(ModernPolicy.class);
check(!old.modern&&modern.modern,"signature capability selects policy");
for(String p:List.of("AFTER_BOOKING","BEFORE_DEPARTURE_24H","AT_AIRPORT","BOARDING","DELAYED","AFTER_ARRIVAL")){
 phase(card,p);Map<String,Object> before=new HashMap<>(card.data);check(old.displayable(context,card),"old display "+p);check(modern.displayable(context,card),"modern display "+p);check(card.data.equals(before),"preflight never mutates source "+p);
}
for(String p:List.of("BEFORE_DEPARTURE_DAYS","IN_FLIGHT")) {phase(card,p);check(!old.displayable(context,card)&&!modern.displayable(context,card),"native excluded phase "+p);}
for(String p:List.of("BEFORE_DEPARTURE_3H","ABNORMAL","CANCELLED","REFUNDED")) {
 phase(card,p);check(modern.displayable(context,card),"new phase "+p);try{old.displayable(context,card);throw new AssertionError("old guessed phase");}catch(IllegalStateException e){check(e.getMessage().contains("unsupported_flight_phase"),"old rejects unsupported "+p);}
}
phase(card,"UNKNOWN");try{modern.displayable(context,card);throw new AssertionError();}catch(IllegalStateException expected){check(true,"unknown modern phase rejected");}
card.data.clear();card.type="TRAVEL_CAROUSEL";check(modern.phase(card).equals("AFTER_ARRIVAL")&&modern.displayable(context,card),"native type inference");card.type="TRAVEL_FLIGHT_AIRPORT";
phase(card,"AFTER_BOOKING");Map<String,Object> untouched=new HashMap<>(card.data);
call(new ModernPolicy(),"shouldSkipDisplayFor10SecondPhase",new Class[]{String.class,Map.class,Context.class},"AFTER_BOOKING",card.data,context);
check(card.data.containsKey("lastStarryIslandDisplayTime"),"actual OEM method starts clock when invoked on source");
card.data=Collections.unmodifiableMap(untouched);check(modern.displayable(context,card)&&card.data.equals(untouched),"Duo reads even immutable source without clock write");card.data=new HashMap<>(untouched);
context.getSharedPreferences("flight_starry_island_display_time",0).values.put("trip_AFTER_BOOKING",String.valueOf(System.currentTimeMillis()-12000));
check(!modern.displayable(context,card)&&old.displayable(context,card),"new persisted suppression read with actual Context");
check(card.data.equals(untouched),"persisted suppression leaves source untouched");context.stores.clear();
for(String p:List.of("AFTER_BOOKING","BEFORE_DEPARTURE_24H","DELAYED","ABNORMAL","CANCELLED","REFUNDED")) {
 phase(card,p);card.data.put("lastFlightPhase",p);card.data.put("lastStarryIslandDisplayTime",String.valueOf(System.currentTimeMillis()-12000));
 check(!modern.displayable(context,card),"old modern short stage suppressed "+p);
 card.data.put("lastFlightPhase","different");check(modern.displayable(context,card),"new transition allowed "+p);
}
for(String p:List.of("BEFORE_DEPARTURE_3H","AT_AIRPORT","BOARDING","AFTER_ARRIVAL")) {
 phase(card,p);card.data.put("lastFlightPhase",p);card.data.put("lastStarryIslandDisplayTime",String.valueOf(System.currentTimeMillis()-90000));
 check(modern.displayable(context,card),"persistent stage not turned into ten seconds "+p);
}
phase(card,"AFTER_ARRIVAL");card.data.put("lastFlightPhase","AFTER_ARRIVAL");card.data.put("lastStarryIslandDisplayTime",String.valueOf(System.currentTimeMillis()-12000));
check(!old.displayable(context,card)&&modern.displayable(context,card),"arrival semantics preserved by actual contract");
for(String p:List.of("DELAYED","CANCELLED","ABNORMAL")) {
 phase(card,p);card.data.put("lastFlightPhase",p);card.data.put("lastStarryIslandDisplayTime",String.valueOf(System.currentTimeMillis()-90000));card.data.put("alertIslandPersistent",true);
 check(modern.displayable(context,card),"persistent alert uses native policy "+p);
}
phase(card,"AFTER_BOOKING");card.data.put("lastFlightPhase","AFTER_BOOKING");card.data.put("lastStarryIslandDisplayTime",String.valueOf(System.currentTimeMillis()-12000));
card.data.put("alertIslandPersistent",true);card.data.put("islandGateChanged",true);card.data.put("boardingGate","A1");
check(modern.displayable(context,card),"gate change persistent override");card.data.put("boardingGate","");check(!modern.displayable(context,card),"empty gate does not invent a persistent reminder");
phase(card,"BOARDING");TravelFlightIgnoreManager.ignored.add("trip_BOARDING");check(!modern.displayable(context,card),"ignored airport state excluded");
card.type="TRAVEL_FLIGHT_PLAN";check(modern.displayable(context,card),"ignore applicability follows actual adapter type check");card.type="TRAVEL_FLIGHT_AIRPORT";
card.data.put("fixtureStateKey","gate-v2");check(modern.displayable(context,card),"new native state key independent of ignored phase");TravelFlightIgnoreManager.ignored.add("trip_gate-v2");check(!modern.displayable(context,card),"native resolved state key honored");TravelFlightIgnoreManager.ignored.clear();
check(make(ModernChild.class).displayable(context,card),"inherited private policy supported");
try{modern.displayable(null,card);throw new AssertionError();}catch(IllegalArgumentException e){check(true,"missing Context not silently using old path");}
for(Class<?> bad:List.of(WrongReturn.class,WrongStatic.class,Incomplete.class))try{make(bad);throw new AssertionError("bad contract accepted");}catch(NoSuchMethodException expected){check(true,"unknown modern contract rejected "+bad.getSimpleName());}
Context fresh=new Context();phase(card,"AFTER_BOOKING");Map<String,Object> before=new HashMap<>(card.data);modern.displayable(fresh,card);modern.displayable(fresh,card);
check(card.data.equals(before)&&fresh.stores.values().stream().allMatch(s->s.values.isEmpty()),"repeated capability checks never start native persistence");
System.out.println("OEM flight policy: "+checks+" checks");}}
'''
})

with tempfile.TemporaryDirectory(prefix='duo-oem-flight-state-') as folder:
    sources=[]
    for name,value in files.items():
        path=Path(folder)/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(value,encoding='utf-8');sources.append(str(path))
    for name in ['NativeIslandPersonalFlightState.java','NativeIslandSceneContract.java']:
        sources.append(str(ROOT/'android/app/src/main/java/ls/augment/com/hook'/name))
    java=Path(os.environ['JAVA_HOME'])/'bin';suffix='.exe' if os.name=='nt' else ''
    subprocess.run([str(java/('javac'+suffix)),'-encoding','UTF-8','-d',folder,*sources],check=True)
    result=subprocess.run([str(java/('java'+suffix)),'-cp',folder,'ls.augment.com.hook.TestOemFlightPolicy'],capture_output=True,text=True,check=True)
    print(result.stdout.strip())
    (AUDIT/'flight-oem-policy-results.json').write_text(json.dumps({
        'output':result.stdout.strip(),'referenceMethods':source_hashes,
        'moduleSourceSha256':hashlib.sha256((ROOT/'android/app/src/main/java/ls/augment/com/hook/NativeIslandPersonalFlightState.java').read_bytes()).hexdigest(),
        'deviceFlightBusinessVerified':False,'modernActionsTestedByThisCheck':False,
        'environment':'host JVM; Android storage, logging, AttributeHelper and ignore-manager fixtures'},indent=2),encoding='utf-8')
