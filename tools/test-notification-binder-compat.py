"""Run the actual NMS evidence hook against anonymous and inherited named binders."""
from pathlib import Path
import runpy, tempfile

base=runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-media-evidence.py')))
# Reuse the wire/authority facades, with current dependencies for this focused reader test.
# Media transport and the newer notification-action protocol have their own suites.
stubs=base['STUBS']
key='com/android/server/notification/NotificationManagerService$13.java'
test=base['TEST']
start=test.index(' public static void main(')
opening=test.index('{',start);depth=1;end=opening+1
while depth:
    if test[end]=='{':depth+=1
    if test[end]=='}':depth-=1
    end+=1
main=''' public static void main(String[] args)throws Throwable{
 MediaBootstrap.install();NativeBinderWire.remote=false;
 for(int flags:new int[]{0,2,16,18}){F f=new F();Parcel d=stageNmsPacket(f),r=Parcel.obtain();yes(f.notificationBinder.transact(0xD04E04,d,r,flags),"own published binder handles evidence");r.readException();Bundle b=r.readBundle(getClassLoader());yes(b.getBoolean("success")&&b.getParcelableArrayList("records",Bundle.class).size()==1,"metadata listed");yes(f.notificationBinder.originals==0,"native AIDL untouched for owned transaction");}
 for(int kind=0;kind<3;kind++){F f=new F();if(kind==0)f.notification.notification.visibility=Notification.VISIBILITY_SECRET;if(kind==1)f.notification.user=11;if(kind==2)f.notification.notification.flags=Notification.FLAG_GROUP_SUMMARY;Parcel r=Parcel.obtain();f.notificationBinder.transact(0xD04E04,stageNmsPacket(f),r,0);r.readException();yes(r.readBundle(getClassLoader()).getParcelableArrayList("records",Bundle.class).isEmpty(),"privacy/user/summary exclusion retained");}
 {F f=new F();Binder.uid=10055;Parcel r=Parcel.obtain();f.notificationBinder.transact(0xD04E04,stageNmsPacket(f),r,0);r.readException();yes(!r.readBundle(getClassLoader()).getBoolean("success"),"foreign caller denied");}
 {F f=new F();f.nms.mService=new Live();yes(!f.notificationBinder.transact(0xD04E04,stageNmsPacket(f),Parcel.obtain(),0)&&f.notificationBinder.originals==1,"unpublished binder stays native");}
 {F f=new F();yes(!f.notificationBinder.transact(17,Parcel.obtain(),Parcel.obtain(),0)&&f.notificationBinder.originals==1,"ordinary transaction stays native");}
 System.out.println("NMS binder compatibility checks="+checks);
 }
'''
base['run'].__globals__['TEST']=test[:start]+main+test[end:]
for variant in ['anonymous','named-inherited']:
    if variant=='named-inherited':
        sources=base['STUBS'];key='com/android/server/notification/NotificationManagerService$13.java'
        value=sources.pop(key).replace('NotificationManagerService$13','NotificationManagerService$Stub')
        value=value.replace('public int originals;','').replace('public boolean onTransact(int code,Parcel d,Parcel r,int flags){originals++;return false;}','')
        sources[key.replace('$13','$Stub')]=value
        sources['android/app/INotificationManager.java']='package android.app;public interface INotificationManager{abstract class Stub implements android.os.IBinder{public int originals;public boolean onTransact(int c,android.os.Parcel d,android.os.Parcel r,int f){originals++;return false;}}}'
        base['run'].__globals__['TEST']=base['run'].__globals__['TEST'].replace('NotificationManagerService$13','NotificationManagerService$Stub')
    with tempfile.TemporaryDirectory(prefix='duo-nms-') as folder:
        result=base['run'](Path(folder));print(variant,result.stdout,end='');assert result.returncode==0,result.stderr
