"""Run actual guarded SystemUI service methods against changing host capabilities.

Only Android service boundaries are faked. The production methods, including
checks, error handling, state reset, retry and diagnostics, compile unchanged.
"""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'
NETWORK = (JAVA / 'hook/ConnectivityIconSource.java').read_text(encoding='utf-8')
WALLPAPER = (JAVA / 'hook/LiftArcGlassStrip.java').read_text(encoding='utf-8')


def extract(source, marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


network_methods = '\n'.join(extract(NETWORK, marker) for marker in (
    'private void startWifiListener()', 'private void wifi()',
    'private void readWifiInternet(', 'private void wifiPermission('))
wallpaper_methods = '\n'.join(extract(WALLPAPER, marker) for marker in (
    'private ParcelFileReader openWallpaper(', 'private void wallpaperReadState('))
assert NETWORK.count('@androidx.annotation.RequiresPermission(value=Manifest.permission.ACCESS_NETWORK_STATE,conditional=true)') == 3
assert '@androidx.annotation.RequiresPermission(anyOf={Manifest.permission.MANAGE_EXTERNAL_STORAGE,"android.permission.READ_WALLPAPER_INTERNAL"},conditional=true)' in WALLPAPER
assert 'WallpaperManager.getInstance(getContext())' in WALLPAPER
assert 'isExternalStorageManager' not in wallpaper_methods
assert 'SuppressLint' not in network_methods + wallpaper_methods

HARNESS = r'''import java.util.*;import ls.augment.com.ConnectivityIconState;
public class TestSystemUiHostPermissions {
 static class Manifest {static class permission {static final String ACCESS_NETWORK_STATE="network",MANAGE_EXTERNAL_STORAGE="manage";}}
 static class PackageManager {static final int PERMISSION_GRANTED=0,PERMISSION_DENIED=-1;}
 static class Context {
  boolean network,internal,manage;final ConnectivityManager cm=new ConnectivityManager();final WifiManager wm=new WifiManager();
  int checkSelfPermission(String permission){return (permission.equals("network")?network:permission.equals("manage")?manage:internal)?0:-1;}
  String getPackageName(){return "com.android.systemui";}
  <T>T getSystemService(Class<T> type){return type.cast(type==ConnectivityManager.class?cm:wm);}
 }
 static class FeatureSettings {static final List<String> log=new ArrayList<>();static void diagnostic(Context c,String key,String value){log.add(key+"="+value);}}
 static class Network {}
 static class NetworkInfo {boolean isConnected(){return true;}}
 static class NetworkCapabilities {static final int TRANSPORT_WIFI=1,NET_CAPABILITY_VALIDATED=2;boolean hasTransport(int n){return true;}boolean hasCapability(int n){return true;}}
 static class NetworkRequest {static class Builder {Builder clearCapabilities(){return this;}Builder addTransportType(int transport){return this;}NetworkRequest build(){return new NetworkRequest();}}}
 static class ConnectivityManager {
  static final int TYPE_WIFI=1;int registrations,reads,capabilities;boolean denyRegistration,denyRead,denyCapabilities;
  static class NetworkCallback {public void onAvailable(Network n){}public void onCapabilitiesChanged(Network n,NetworkCapabilities c){}public void onLost(Network n){}}
  void registerNetworkCallback(NetworkRequest r,NetworkCallback c,Object w){registrations++;if(denyRegistration)throw new SecurityException();}
  NetworkInfo getNetworkInfo(int type){reads++;if(denyRead)throw new SecurityException();return new NetworkInfo();}
  NetworkCapabilities getNetworkCapabilities(Network n){capabilities++;if(denyCapabilities)throw new SecurityException();return new NetworkCapabilities();}
 }
 enum SupplicantState {COMPLETED}
 static class WifiInfo {SupplicantState getSupplicantState(){return SupplicantState.COMPLETED;}int getRssi(){return -50;}}
 static class WifiManager {static final int WIFI_STATE_UNKNOWN=4,WIFI_STATE_ENABLED=3;int getWifiState(){return WIFI_STATE_ENABLED;}WifiInfo getConnectionInfo(){return new WifiInfo();}int getMaxSignalLevel(){return 4;}int calculateSignalLevel(int rssi){return 3;}}
 static class SystemUiAdapter {static Object call(Object owner,String method)throws ReflectiveOperationException{return new Network();}}
 static class NetworkSubject {
  final Context context;final Object worker=new Object();ConnectivityManager connectivity;ConnectivityManager.NetworkCallback wifiCallback;
  String wifiError="",wifiListenerError="",wifiReason="test",wifiPhase="unread",wifiInternetError="",wifiPermissionState="";
  int wifiRadioState=WifiManager.WIFI_STATE_UNKNOWN,wifiLevel,wifiBars=4;boolean wifiRead,wifiConnected,wifiLinkConnected;
  ConnectivityIconState.WifiInternet wifiInternet=ConnectivityIconState.WifiInternet.UNKNOWN;
  NetworkSubject(Context c){context=c;connectivity=c.cm;}
  void refreshWifi(String reason){wifi();}
  // NETWORK_METHODS
 }
 static class WallpaperManager {
  final Context context;int reads;boolean deny,missing;WallpaperManager(Context c){context=c;}
  android.os.ParcelFileDescriptor getWallpaperFile(int flag){reads++;if(deny)throw new SecurityException();return missing?null:new android.os.ParcelFileDescriptor();}
 }
 static class WallpaperSubject {
  final Context context;volatile String wallpaperReadState="not_requested";WallpaperSubject(Context c){context=c;}Context getContext(){return context;}
  static class ParcelFileReader {final android.os.ParcelFileDescriptor file;final int flag;ParcelFileReader(android.os.ParcelFileDescriptor f,int i){file=f;flag=i;}}
  // WALLPAPER_METHODS
 }
 static int checks,cases;static void check(boolean ok,String reason){checks++;if(!ok)throw new AssertionError(reason);}
 static long permissionLogs(){return FeatureSettings.log.stream().filter(v->v.startsWith("ls_augment_statusbar_wifi_permission=")).count();}
 public static void main(String[] args){
  Context c=new Context();NetworkSubject n=new NetworkSubject(c);n.wifiConnected=true;n.wifiLinkConnected=true;n.wifiRead=true;n.wifiLevel=4;
  n.startWifiListener();n.wifi();n.readWifiInternet(c.wm);
  check(c.cm.registrations==0&&c.cm.reads==0&&c.cm.capabilities==0,"denied host skips all three restricted APIs");
  check(!n.wifiConnected&&!n.wifiLinkConnected&&!n.wifiRead&&n.wifiLevel==0,"denial clears previous Wi-Fi presentation");
  check(n.wifiInternet==ConnectivityIconState.WifiInternet.UNKNOWN&&n.wifiError.contains("permission_denied"),"denial exposes unknown and reason");
  check(permissionLogs()==1,"repeated/stage denial is deduplicated");
  check(FeatureSettings.log.stream().anyMatch(v->v.contains("uid=1000;context_package=com.android.systemui")),"diagnostics identify actual process and Context");cases++;

  c.network=true;n.wifi();
  check(c.cm.registrations==1&&n.wifiCallback!=null,"permission recovery retries previously denied registration");
  check(n.wifiConnected&&n.wifiRead&&n.wifiInternet==ConnectivityIconState.WifiInternet.VALIDATED,"same source recovers current network/capabilities");
  n.wifi();check(c.cm.registrations==1,"refresh never duplicates active callback");check(permissionLogs()==2,"grant emits one transition");cases++;

  int reads=c.cm.reads,caps=c.cm.capabilities;c.network=false;n.wifi();n.readWifiInternet(c.wm);
  check(c.cm.reads==reads&&c.cm.capabilities==caps,"revocation skips restricted reads");
  check(!n.wifiConnected&&!n.wifiLinkConnected&&n.wifiInternet==ConnectivityIconState.WifiInternet.UNKNOWN,"revocation cannot retain positive state");cases++;

  Context race=new Context();race.network=true;race.cm.denyRegistration=true;NetworkSubject retry=new NetworkSubject(race);retry.startWifiListener();
  check(retry.wifiCallback==null&&retry.wifiListenerError.equals("access_denied:SecurityException"),"post-check registration rejection stays unavailable");
  race.cm.denyRegistration=false;retry.wifi();check(race.cm.registrations==2&&retry.wifiCallback!=null,"post-check rejection is retried without recreating source");cases++;

  race.cm.denyRead=true;retry.wifi();check(!retry.wifiRead&&!retry.wifiConnected&&!retry.wifiLinkConnected&&retry.wifiError.equals("SecurityException"),"post-check network rejection clears state");
  race.cm.denyRead=false;race.cm.denyCapabilities=true;retry.wifi();
  check(retry.wifiInternet==ConnectivityIconState.WifiInternet.UNKNOWN&&retry.wifiInternetError.equals("SecurityException"),"post-check capabilities rejection stays unknown");cases++;

  Context w=new Context();WallpaperSubject glass=new WallpaperSubject(w);WallpaperManager wm=new WallpaperManager(w);FeatureSettings.log.clear();
  check(glass.openWallpaper(wm,2)==null&&wm.reads==0,"neither wallpaper permission skips direct API");glass.openWallpaper(wm,2);
  check(FeatureSettings.log.size()==1&&glass.wallpaperReadState.equals("permission_denied"),"wallpaper denial has deduplicated reason");cases++;

  w.internal=true;check(glass.openWallpaper(wm,2)!=null&&wm.reads==1&&!w.manage,"SystemUI internal signature permission alone permits file");
  check(wm.context==glass.getContext(),"manager and checked Context share host identity");cases++;

  w.internal=false;w.manage=true;check(glass.openWallpaper(wm,1)!=null&&wm.reads==2,"ROM accepts granted MANAGE without extra app-op gate");cases++;

  wm.deny=true;check(glass.openWallpaper(wm,1)==null&&glass.wallpaperReadState.equals("access_denied:SecurityException"),"wallpaper post-check rejection is contained and diagnosed");
  wm.deny=false;check(glass.openWallpaper(wm,1)!=null&&glass.wallpaperReadState.equals("file_open"),"temporary wallpaper rejection is not cached");cases++;

  w.manage=false;int old=wm.reads;check(glass.openWallpaper(wm,1)==null&&wm.reads==old,"revoked wallpaper permission skips file API");
  w.internal=true;wm.missing=true;check(glass.openWallpaper(wm,2)==null&&glass.wallpaperReadState.equals("static_file_unavailable"),"missing static wallpaper is distinct from denial");cases++;
  System.out.println("SystemUI host permission capabilities: "+cases+" cases, "+checks+" assertions passed");
 }
}'''

with tempfile.TemporaryDirectory(prefix='systemui-host-permissions-') as tmp:
    work = Path(tmp)
    source = work / 'TestSystemUiHostPermissions.java'
    source.write_text(HARNESS.replace('// NETWORK_METHODS', network_methods).replace('// WALLPAPER_METHODS', wallpaper_methods), encoding='utf-8')
    (work / 'android/os').mkdir(parents=True)
    (work / 'android/os/Process.java').write_text('package android.os;public class Process {public static int myUid(){return 1000;}}', encoding='utf-8')
    (work / 'android/os/ParcelFileDescriptor.java').write_text('package android.os;public class ParcelFileDescriptor {}', encoding='utf-8')
    jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path('')
    subprocess.run([str(jdk / 'javac'), '-encoding', 'UTF-8', '-d', tmp, str(source), str(JAVA / 'ConnectivityIconState.java'), *(str(p) for p in (work / 'android/os').glob('*.java'))], check=True)
    subprocess.run([str(jdk / 'java'), '-cp', tmp, 'TestSystemUiHostPermissions'], check=True)
