"""Exercise the production ROM table adapter with distinct levels, error states and ambiguous resources."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
FILES = {
    'android/content/Context.java': '''package android.content;public class Context {
      public ClassLoader getClassLoader(){return getClass().getClassLoader();}
      public android.content.res.Resources getResources(){return new android.content.res.Resources();}}''',
    'android/content/res/Resources.java': '''package android.content.res;public class Resources {
      public int getIdentifier(String name,String kind,String pkg){return 0;}
      public String getResourceEntryName(int id){return "r"+id;}}''',
    'com/android/systemui/statusbar/connectivity/WifiIcons.java': '''package com.android.systemui.statusbar.connectivity;
      public class WifiIcons {public static final int[] WIFI_FULL_ICONS={101,102,103,104,105};
      public static final int[] WIFI_NO_INTERNET_ICONS={201,202,203,204,205};
      public static final int[] WIFI_6_FULL_ICONS={301,302,303,304,305};
      public static final int WIFI_NO_NETWORK=900;}''',
    'com/zte/feature/signal/icons/StrengthIcon.java': '''package com.zte.feature.signal.icons;import java.util.*;
      public class StrengthIcon {public final List<Integer> strengths=List.of(401,402,403,404,405,406);
      public final List<Integer> strengthsSingle=List.of(451,405,453,454,455,456);}''',
    'com/android/settingslib/mobile/TelephonyIcons.java': '''package com.android.settingslib.mobile;
      public class TelephonyIcons {public static final int ICON_4G=601,ICON_LTE=601,ICON_5G=602,ICON_5G_PLUS=603;
      public static final int ICON_G=604,ICON_3G=604;}''',
    'ls/augment/com/hook/TestNativeStateTable.java': '''package ls.augment.com.hook;import java.util.*;
      public class TestNativeStateTable {static int checks;static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
      static boolean has(StatusBarNativeStateTable table,String id,String resource,String state){return Arrays.asList(table.resolve(id,resource)).contains(state);}
      public static void main(String[] args){StatusBarNativeStateTable table=new StatusBarNativeStateTable(new android.content.Context());
       check(has(table,"wifi.signal","r105","level4"),"native five-level wifi scale is preserved");
       check(has(table,"wifi.signal","r205","no_internet")&&has(table,"wifi.signal","r205","level4"),"error and strength remain independent native state dimensions");
       check(has(table,"secondary_wifi.signal","r305","level4"),"secondary wifi uses its own displayed native resource");
       check(has(table,"wifi.standard","r305","wifi6"),"known standard comes from native table membership");
       check(has(table,"wifi.signal","r900","disconnected"),"native disconnected resource recognized");
       check(has(table,"mobile1.signal","r406","level5"),"six-state OEM mobile table retains level5");
       check(table.resolve("mobile2.signal","r405").length==0,"ambiguous resource cannot invent a signal level");
       check(has(table,"mobile1.type","r601","4g")&&has(table,"mobile2.type","r603","5g_plus"),"native display-type IDs, including plus override, are mapped");
       check(table.resolve("mobile1.type","r604").length==0,"ambiguous display-type resource remains native");
       check(table.resolve("wifi.signal","wifi_signal_5").length==0,"arbitrary resource digits never become a guessed level");
       check(table.resolve("bluetooth","r105").length==0,"native families never share unrelated icon states");
       System.out.println("Status-bar native state tables: "+checks+" assertions passed");}}
      ''',
}
with tempfile.TemporaryDirectory(prefix='statusbar-native-states-') as tmp:
    work = Path(tmp)
    for name, source in FILES.items():
        path = work / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding='utf-8')
    jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path('')
    production = ROOT / 'android/app/src/main/java/ls/augment/com/hook/StatusBarNativeStateTable.java'
    subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '-d', tmp, *map(str, work.rglob('*.java')), str(production)], check=True)
    subprocess.run([str(jdk / 'java'), '-cp', tmp, 'ls.augment.com.hook.TestNativeStateTable'], check=True)
