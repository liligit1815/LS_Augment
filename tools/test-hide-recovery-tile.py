"""Execute the real tile recovery launcher with offline Android API stubs.

Compiles the entire production AugmentTileService and invokes openRecovery().
No device, Root transport, PackageManager operation, or real activity launch.
"""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
PRODUCTION = ROOT / 'android/app/src/main/java/ls/augment/com/AugmentTileService.java'
SOURCES = {
    'android/annotation/SuppressLint.java': '''package android.annotation;
public @interface SuppressLint {String[] value();}''',
    'android/content/Context.java': 'package android.content;public class Context {}',
    'android/content/Intent.java': '''package android.content;import java.util.*;
public final class Intent {
    public static final int FLAG_ACTIVITY_NEW_TASK=0x10000000,FLAG_ACTIVITY_CLEAR_TOP=0x04000000;
    public final Class<?> target;public int flags;private final Map<String,Boolean> extras=new HashMap<>();
    public Intent(Context context,Class<?> type){target=type;}
    public Intent addFlags(int value){flags|=value;return this;}
    public Intent putExtra(String key,boolean value){extras.put(key,value);return this;}
    public boolean getBooleanExtra(String key,boolean fallback){return extras.getOrDefault(key,fallback);}
}''',
    'android/app/PendingIntent.java': '''package android.app;
import android.content.Context;import android.content.Intent;
public final class PendingIntent {
    public static final int FLAG_UPDATE_CURRENT=0x08000000,FLAG_IMMUTABLE=0x04000000;
    public static int created;public final Intent intent;public final int requestCode,flags;
    private PendingIntent(Intent value,int code,int options){intent=value;requestCode=code;flags=options;}
    public static PendingIntent getActivity(Context context,int code,Intent intent,int options){
        created++;return new PendingIntent(intent,code,options);
    }
}''',
    'android/os/Build.java': '''package android.os;
public final class Build {
    public static final class VERSION {public static int SDK_INT=28;}
    public static final class VERSION_CODES {public static final int UPSIDE_DOWN_CAKE=34;}
}''',
    'android/os/Looper.java': 'package android.os;public final class Looper {public static Looper getMainLooper(){return new Looper();}}',
    'android/os/Handler.java': 'package android.os;public final class Handler {public Handler(Looper l){}public boolean post(Runnable r){r.run();return true;}}',
    'android/service/quicksettings/Tile.java': '''package android.service.quicksettings;
public final class Tile {
    public static final int STATE_UNAVAILABLE=0,STATE_INACTIVE=1,STATE_ACTIVE=2;
    public void setState(int value){}public void updateTile(){}
}''',
    'android/service/quicksettings/TileService.java': '''package android.service.quicksettings;
import android.app.PendingIntent;import android.content.*;import android.os.Build;
public class TileService extends Context {
    public boolean locked;public int unlockRequests,intentLaunches,pendingLaunches,destroyCallbacks;
    public Intent launchedIntent;public PendingIntent launchedPending;public Runnable unlockCallback;
    public RuntimeException unlockFailure,launchFailure;
    public void onTileAdded(){}public void onStartListening(){}public void onClick(){}
    public void onDestroy(){destroyCallbacks++;}
    public Tile getQsTile(){return new Tile();}public boolean isLocked(){return locked;}
    public void unlockAndRun(Runnable callback){
        unlockRequests++;if(unlockFailure!=null)throw unlockFailure;unlockCallback=callback;
    }
    public void finishUnlock(){
        locked=false;Runnable callback=unlockCallback;unlockCallback=null;if(callback!=null)callback.run();
    }
    public void cancelUnlock(){unlockCallback=null;}
    public void startActivityAndCollapse(Intent intent){
        if(Build.VERSION.SDK_INT>=34)throw new UnsupportedOperationException("Intent overload on API 34+");
        if(launchFailure!=null)throw launchFailure;intentLaunches++;launchedIntent=intent;
    }
    public void startActivityAndCollapse(PendingIntent pending){
        if(Build.VERSION.SDK_INT<34)throw new UnsupportedOperationException("PendingIntent overload before API 34");
        if(launchFailure!=null)throw launchFailure;pendingLaunches++;launchedPending=pending;launchedIntent=pending.intent;
    }
}''',
    'android/widget/Toast.java': '''package android.widget;import android.content.Context;
public final class Toast {
    public static final int LENGTH_LONG=1;public static int shown;
    public static Toast makeText(Context c,String message,int duration){return new Toast();}
    public void show(){shown++;}
}''',
    'ls/augment/com/HideRecoveryActivity.java': '''package ls.augment.com;import android.content.*;
public final class HideRecoveryActivity {
    static Intent intent(Context c,boolean configured){return new Intent(c,HideRecoveryActivity.class).putExtra("configured_only",configured);}
}''',
    'ls/augment/com/AppConfig.java': '''package ls.augment.com;import android.content.Context;
final class AppConfig {
    static final String TILE_ENABLED="tile";AppConfig(Context c){}
    boolean getBoolean(String key){return true;}
}''',
    'ls/augment/com/AuditLog.java': 'package ls.augment.com;import android.content.Context;final class AuditLog {static void write(Context c,String tag,String message){}}',
    'ls/augment/com/TilePresentation.java': 'package ls.augment.com;import android.content.Context;import android.service.quicksettings.Tile;final class TilePresentation {static void apply(Context c,Tile tile,String state){}}',
    'ls/augment/com/RootHideManager.java': '''package ls.augment.com;import android.content.Context;
final class RootHideManager {
    static int backendTouches;
    RootHideManager(Context c){backendTouches++;throw new AssertionError("Recovery launch must not instantiate a PM/Root backend");}
    OperationResult toggleAll(){throw new AssertionError("Unexpected package-state operation");}
    RootStatus rootStatus(){throw new AssertionError("Unexpected Root probe");}
    ConflictState conflictState(){throw new AssertionError("Unexpected Root probe");}
    Summary summary(){throw new AssertionError("Unexpected package-state query");}
    enum RootState {GRANTED,DENIED}enum Aggregate {ERROR,EMPTY,ALL_VISIBLE}
    static final class RootStatus {RootState state;String provider,message;}
    static final class ConflictState {
        ConflictState(boolean a,boolean b,String text){}boolean hasConflict(){return false;}
    }
    static final class Summary {
        Aggregate aggregate;
        Summary(Aggregate value,int a,int b,int c,int d,int e){aggregate=value;}
    }
    static final class OperationResult {
        final boolean success,reviewRequired;final String message;
        OperationResult(boolean ok,boolean review,String text){success=ok;reviewRequired=review;message=text;}
        static OperationResult failure(String text){return new OperationResult(false,false,text);}
    }
}''',
    'ls/augment/com/TestHideRecoveryTile.java': r'''package ls.augment.com;
import android.app.PendingIntent;import android.content.Intent;import android.os.Build;
import android.widget.Toast;import java.lang.reflect.Method;
public final class TestHideRecoveryTile {
    static int checks;static Method open;
    static void check(boolean condition,String message){checks++;if(!condition)throw new AssertionError(message);}
    static void invoke(AugmentTileService tile)throws Exception{open.invoke(tile);}
    static AugmentTileService fresh(int sdk,boolean locked){
        Build.VERSION.SDK_INT=sdk;PendingIntent.created=0;
        AugmentTileService tile=new AugmentTileService();tile.locked=locked;return tile;
    }
    static void launched(AugmentTileService tile,int sdk){
        check(tile.intentLaunches==(sdk<34?1:0)&&tile.pendingLaunches==(sdk>=34?1:0),
                "wrong launch overload or repeated launch on API "+sdk);
        check(tile.launchedIntent.target==HideRecoveryActivity.class,"launcher opened hide-management or another activity");
        check(tile.launchedIntent.getBooleanExtra("configured_only",false),"tile did not request configured-target review");
        check(tile.launchedIntent.flags==(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_CLEAR_TOP),
                "activity launch flags changed");
        check(PendingIntent.created==(sdk>=34?1:0),"wrong PendingIntent creation count");
        if(sdk>=34){
            check(tile.launchedPending.flags==(PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_IMMUTABLE),
                    "PendingIntent is mutable or not updated");
            check(tile.launchedPending.requestCode==204,"PendingIntent request code changed");
        }
    }
    public static void main(String[] args)throws Exception {
        open=AugmentTileService.class.getDeclaredMethod("openRecovery");open.setAccessible(true);
        for(int sdk:new int[]{28,33,34,36}){
            AugmentTileService tile=fresh(sdk,false);invoke(tile);
            launched(tile,sdk);check(tile.unlockRequests==0,"unlocked tile prompted for unlock");

            tile=fresh(sdk,true);invoke(tile);invoke(tile);
            check(tile.unlockRequests==1,"locked click issued duplicate unlock requests");
            check(tile.intentLaunches==0&&tile.pendingLaunches==0&&PendingIntent.created==0,
                    "locked device launched or prepared an activity before successful unlock");
            check(tile.unlockCallback!=null,"locked launch did not wait for system unlock callback");
            tile.finishUnlock();launched(tile,sdk);

            tile=fresh(sdk,true);invoke(tile);tile.cancelUnlock();
            check(tile.intentLaunches==0&&tile.pendingLaunches==0&&PendingIntent.created==0,
                    "cancelled unlock started recovery");

            tile=fresh(sdk,false);tile.onDestroy();invoke(tile);
            check(tile.destroyCallbacks==1&&tile.intentLaunches==0&&tile.pendingLaunches==0&&tile.unlockRequests==0,
                    "destroyed service launched or requested unlock");
            tile=fresh(sdk,true);invoke(tile);tile.onDestroy();tile.finishUnlock();
            check(tile.intentLaunches==0&&tile.pendingLaunches==0&&PendingIntent.created==0,
                    "late unlock callback launched after destruction");

            tile=fresh(sdk,false);tile.launchFailure=new IllegalStateException("launch rejected");
            int shown=Toast.shown;invoke(tile);
            check(Toast.shown==shown+1&&tile.intentLaunches==0&&tile.pendingLaunches==0,
                    "launch error escaped or was silently reported as success");
            tile.launchFailure=null;PendingIntent.created=0;invoke(tile);launched(tile,sdk);

            tile=fresh(sdk,true);tile.unlockFailure=new IllegalStateException("unlock rejected");
            shown=Toast.shown;invoke(tile);
            check(Toast.shown==shown+1&&tile.intentLaunches==0&&tile.pendingLaunches==0,
                    "unlock error launched or escaped");
            tile.unlockFailure=null;invoke(tile);
            check(tile.unlockRequests==2&&tile.unlockCallback!=null,"unlock failure did not release retry gate");
            tile.finishUnlock();launched(tile,sdk);
        }
        check(RootHideManager.backendTouches==0,"launcher touched a PM or Root backend");
        System.out.println("AugmentTileService.openRecovery(): "+checks+" assertions passed for API 28/33/34/36, lock/unlock/cancel, errors/retry and destroyed lifecycle.");
        System.out.println("Executed the real production method with Android stubs; no PM, Root, device, or real SystemUI launch.");
    }
}''',
}
with tempfile.TemporaryDirectory(prefix='ls-hide-recovery-tile-') as directory:
    temporary = Path(directory)
    files = [str(PRODUCTION)]
    for name, content in SOURCES.items():
        target = temporary / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(content, encoding='utf-8')
        files.append(str(target))
    classes = temporary / 'classes'
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17',
                    '-d', str(classes), *files], check=True, timeout=30)
    subprocess.run(['java', '-cp', str(classes), 'ls.augment.com.TestHideRecoveryTile'],
                   check=True, timeout=15)

