"""Exercise the phone channel inventory entry point against notification service doubles."""
import json
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
JDK = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
JSON = next((Path.home() / '.gradle/caches/modules-2/files-2.1/org.json/json').glob('*/*/*.jar'))

FILES = {
    'android/os/IBinder': 'public interface IBinder {}',
    'android/os/Process': 'public class Process { public static int myUid(){return Integer.getInteger("caller",0);} }',
    'android/os/ServiceManager': '''public class ServiceManager {
        public static IBinder getService(String name){return name.equals("notification") ? new IBinder(){} : null;}
    }''',
    'android/content/Context': '''import android.content.pm.*; public class Context {
        public PackageManager getPackageManager(){return new PackageManager();}
        public ApplicationInfo getApplicationInfo(){return new ApplicationInfo();}
    }''',
    'android/content/pm/ApplicationInfo': 'public class ApplicationInfo { public int uid; public String sourceDir; }',
    'android/content/pm/PackageManager': '''public class PackageManager {
        public ApplicationInfo getApplicationInfo(String pkg,int flags){return new ApplicationInfo();}
    }''',
    'android/content/pm/ParceledListSlice': '''import java.util.*; abstract class SliceBase {
        public final List<?> getList(){return rows;} List<?> rows;
    }
    public class ParceledListSlice extends SliceBase { public ParceledListSlice(List<?> list){rows=list;} }''',
    'android/app/NotificationChannel': '''public class NotificationChannel { String id,name;
        NotificationChannel(String id,String name){this.id=id;this.name=name;}
        public String getId(){return id;} public CharSequence getName(){return name;}
    }''',
    'android/app/INotificationManager': '''import android.content.pm.ParceledListSlice; import java.util.*;
    public interface INotificationManager {
        ParceledListSlice getNotificationChannelsForPackage(String pkg,int uid,boolean includeDeleted);
        class Stub { public static INotificationManager asInterface(android.os.IBinder binder) {
            if(binder==null)throw new IllegalStateException();
            return (pkg,uid,deleted)->{
                if (!pkg.equals("org.example.chat") || uid!=1012345 || deleted) throw new SecurityException();
                List<?> channels = Boolean.getBoolean("invalid") ? List.of(42) : List.of(
                    new NotificationChannel("chat,|","同名"),new NotificationChannel("other","同名"),
                    new NotificationChannel("fallback",null),new NotificationChannel("","invalid"));
                return new ParceledListSlice(channels){};
            };
        }}
    }''',
}

with tempfile.TemporaryDirectory(prefix='duo-notice-channels-') as temp:
    folder = Path(temp)
    for name, body in FILES.items():
        path = folder / (name + '.java')
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text('package ' + name.rsplit('/', 1)[0].replace('/', '.') + ';' + body, encoding='utf-8')
    sources = [SRC / (name + '.java') for name in ('IslandNoticeChannels','IslandNoticeRules','IslandDownloadConfig','RootShell')]
    subprocess.run([JDK/'javac','-encoding','UTF-8','-cp',JSON,'-d',folder,*folder.rglob('*.java'),*sources], check=True)

    def query(*properties):
        return subprocess.run([JDK/'java','-Dfile.encoding=UTF-8','-Dstdout.encoding=UTF-8','-Dstderr.encoding=UTF-8',
                               *properties,'-cp',os.pathsep.join(map(str,[folder,JSON])),
                               'ls.augment.com.IslandNoticeChannels','org.example.chat','1012345'],
                              capture_output=True, encoding='utf-8')

    success = query()
    assert success.returncode == 0, success.stderr
    assert success.stdout.startswith('DUO_CHANNELS ')
    assert json.loads(success.stdout.split(' ',1)[1]) == {'chat,|':'同名','other':'同名','fallback':'fallback'}
    for prop,stage in [('-Dcaller=10001','caller'),('-Dinvalid=true','NotificationChannel')]:
        failed = query(prop)
        assert failed.returncode and not failed.stdout and ('DUO_CHANNEL_ERROR ' + stage) in failed.stderr
    service = folder / 'android/app/INotificationManager.class'
    service.unlink()
    missing = query()
    assert missing.returncode and 'DUO_CHANNEL_ERROR notification_service ClassNotFoundException' in missing.stderr
    print('PASS channel inventory: package/uid, live channels, inherited list, duplicate labels, null names, malformed row, missing service, root boundary')
