"""Build an isolated, manually operated PackageInstaller probe locally. Never uses ADB.

Only the existing owned signature-v1/v2/v3 APKs are embedded. Each preparation,
commit and opening of the genuine system confirmation requires its own button.
No receiver, lifecycle callback or incoming Activity extra starts an install.
"""
from pathlib import Path
import hashlib
import json
import re
import subprocess
import zipfile

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'out/installer-session-fixture'
SDK = Path.home() / 'AppData/Local/Android/Sdk'
BUILD = SDK / 'build-tools/36.0.0'
ANDROID = SDK / 'platforms/android-36/android.jar'
JAVA = Path('C:/Program Files/Java/jdk-17/bin')
PACKAGE = 'ls.augment.regression.installer'
TARGET = 'ls.augment.regression.signature'
PINNED_ASSET_HASHES = [
    '62ba1d8ce9fb2dfa0bc55f18e7ccedbb4f9d273d116d78afbac5a63b64d1020a',
    'c3dcf82a2cdafecfa3a35e45fad54e6f56a33f9e4bf44d86906bb36fc2e9fcd1',
    'cd051aad2b2d2d673ce79f742e432255e7c8ef8a0a8dacc783b7b3dc302e32df',
]

SOURCE = r'''package ls.augment.regression.installer;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageInstaller;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.AtomicFile;
import android.util.Log;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import org.json.JSONArray;
import org.json.JSONObject;

public final class Probe extends Activity {
    static final String TARGET="ls.augment.regression.signature";
    static final String MODULE_AUTHORITY="ls.augment.com.config";
    static final String STATUS_ACTION="ls.augment.regression.installer.STATUS";
    static final String INSTALL_RESULT="android.intent.extra.INSTALL_RESULT";
    static final int PACKAGE_REQUEST=417;
    static final Handler MAIN=new Handler(Looper.getMainLooper());
    static final Map<Integer,Intent> PENDING=new HashMap<>();
    static WeakReference<Probe> visible=new WeakReference<>(null);
    static boolean working;
    final ArrayList<Button> buttons=new ArrayList<>();
    TextView status;
    boolean resumed;

    @Override public void onCreate(Bundle saved){
        super.onCreate(saved);
        LinearLayout body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);
        int pad=(int)(12*getResources().getDisplayMetrics().density);body.setPadding(pad,pad,pad,pad);
        TextView title=new TextView(this);title.setText("LS INSTALL SESSION TEST");title.setTextSize(22);body.addView(title);
        TextView hint=new TextView(this);
        hint.setText("Only owned signature v1/v2/v3. PREPARE, COMMIT and OPEN each require a tap. No automatic installation or background launch.");body.addView(hint);
        button(body,"PREPARE v1 (key A)",()->background("prepare",()->prepare(0)));
        button(body,"PREPARE v2 (key B)",()->background("prepare",()->prepare(1)));
        button(body,"PREPARE v3 (key A)",()->background("prepare",()->prepare(2)));
        button(body,"COMMIT PREPARED SESSION",()->background("commit",this::commit));
        button(body,"OPEN SYSTEM CONFIRM",this::openConfirmation);
        button(body,"ABANDON THIS SESSION",()->background("abandon",this::abandon));
        button(body,"OPEN PACKAGE URI",this::openPackage);
        button(body,"READ CONFIG (DENY EXPECTED)",()->background("config_read",this::readConfig));
        button(body,"REFRESH STATE",()->background("inspect",()->Store.event(getApplicationContext(),"inspect",inspection(getApplicationContext()))));
        status=new TextView(this);status.setTextSize(12);body.addView(status);
        ScrollView scroll=new ScrollView(this);scroll.addView(body);setContentView(scroll);
        evidence("activity_create",new JSONObject());
    }
    void button(LinearLayout body,String name,Runnable action){
        Button button=new Button(this);button.setText(name);button.setAllCaps(false);
        button.setOnClickListener(v->{if(resumed&&hasWindowFocus()&&!working)action.run();});
        buttons.add(button);body.addView(button);
    }
    @Override public void onResume(){super.onResume();resumed=true;visible=new WeakReference<>(this);evidence("activity_resume",new JSONObject());render();}
    @Override public void onPause(){resumed=false;super.onPause();}
    @Override public void onStop(){evidence("activity_stop",new JSONObject());super.onStop();}
    @Override public void onDestroy(){if(visible.get()==this)visible.clear();evidence("activity_destroy",new JSONObject());super.onDestroy();}
    interface Work {void run()throws Exception;}
    void background(String operation,Work task){
        if(working)return;working=true;render();
        // One finite thread per explicit operation; no service, executor queue or polling loop.
        new Thread(()->{
            try{task.run();}catch(Exception error){failure(operation,error);}
            finally{MAIN.post(()->{working=false;refreshVisible();});}
        },"LS-install-"+operation).start();
    }
    void evidence(String event,JSONObject details){
        try{Store.event(getApplicationContext(),event,details);}catch(Exception error){Log.e("LS-InstallProbe",event+":"+error.getClass().getSimpleName());}
    }
    void failure(String operation,Exception error){
        evidence("error",object("operation",operation,"error_type",error.getClass().getSimpleName()));
    }
    static void refreshVisible(){Probe p=visible.get();if(p!=null&&p.resumed&&!p.isFinishing()&&!p.isDestroyed())p.render();}
    void render(){
        for(Button button:buttons)button.setEnabled(!working);
        try{
            JSONObject state=Store.read(this);
            if(state.optBoolean("pending_ready")&&readPending(state.optInt("session_id",-1))==null)
                state.put("pending_intent_lost_in_this_process",true);
            status.setText((working?"Working; no repeated action accepted.\n":"")+
                    "Caller UID "+android.os.Process.myUid()+" / PID "+android.os.Process.myPid()+"\n"+
                    state.toString(2));
        }catch(Exception error){status.setText("Evidence error: "+error.getClass().getSimpleName());}
    }

    void prepare(int index)throws Exception{
        Context app=getApplicationContext();
        if(index<0||index>=Assets.NAMES.length)throw new IllegalArgumentException();
        PackageInstaller installer=app.getPackageManager().getPackageInstaller();
        assertOwnedTarget(app,false);
        // All sessions returned here belong to this normal application UID.
        if(!installer.getMySessions().isEmpty())throw new IllegalStateException("existing_own_session");
        JSONObject previous=Store.read(app);
        if(previous.optInt("session_id",-1)>=0&&!previous.optBoolean("terminal",false)
                &&previous.optBoolean("commit_called",false))throw new IllegalStateException("await_previous_terminal_status");
        String run=UUID.randomUUID().toString();
        Store.replace(app,object("run_id",run,"payload",Assets.NAMES[index],"payload_index",index,
                "package",TARGET,"payload_version",index+1,"payload_sha256",Assets.HASHES[index],
                "payload_signer_sha256",Assets.SIGNERS[index],"session_id",-1,"phase","VALIDATING",
                "terminal",false,"commit_called",false,"pending_ready",false,"pending_opened",false,"open_count",0));
        Store.event(app,"prepare_requested",object("can_request_package_installs",app.getPackageManager().canRequestPackageInstalls()));
        File payload=new File(app.getCacheDir(),Assets.NAMES[index]);
        int id=-1;
        try{
            MessageDigest digest=MessageDigest.getInstance("SHA-256");long copied=0;
            try(InputStream input=app.getAssets().open(Assets.NAMES[index]);FileOutputStream output=new FileOutputStream(payload)){
                byte[] buffer=new byte[32768];int n;
                while((n=input.read(buffer))!=-1){output.write(buffer,0,n);digest.update(buffer,0,n);copied+=n;}
                output.getFD().sync();
            }
            if(copied!=Assets.SIZES[index]||!hex(digest.digest()).equals(Assets.HASHES[index]))throw new SecurityException("asset_hash");
            PackageInfo info=app.getPackageManager().getPackageArchiveInfo(payload.getAbsolutePath(),PackageManager.GET_SIGNING_CERTIFICATES);
            if(info==null||!TARGET.equals(info.packageName)||info.getLongVersionCode()!=index+1
                    ||!signer(info).equals(Assets.SIGNERS[index]))throw new SecurityException("asset_identity");
            PackageInstaller.SessionParams params=new PackageInstaller.SessionParams(PackageInstaller.SessionParams.MODE_FULL_INSTALL);
            params.setAppPackageName(TARGET);params.setAppLabel("LS owned signature v"+(index+1));
            params.setSize(copied);params.setRequireUserAction(PackageInstaller.SessionParams.USER_ACTION_REQUIRED);
            id=installer.createSession(params);
            Store.update(app,object("session_id",id,"phase","WRITING"));
            Store.event(app,"session_created",sessionInfo(requireOwn(installer,id)));
            long written=0;
            try(PackageInstaller.Session session=installer.openSession(id);InputStream input=new FileInputStream(payload);
                    OutputStream output=session.openWrite("base.apk",0,copied)){
                byte[] buffer=new byte[32768];int n;
                while((n=input.read(buffer))!=-1){output.write(buffer,0,n);written+=n;}
                session.fsync(output);
            }
            if(written!=copied)throw new IllegalStateException("short_write");
            Store.update(app,object("phase","PREPARED","bytes_written",written));
            Store.event(app,"session_prepared",sessionInfo(requireOwn(installer,id)));
        }catch(Exception error){
            if(id>=0){
                try{requireOwn(installer,id);installer.abandonSession(id);Store.event(app,"failed_prepare_abandoned",object("abandoned_id",id));}
                catch(Exception abandonError){Store.event(app,"failed_prepare_abandon_error",object("error_type",abandonError.getClass().getSimpleName()));}
            }
            Store.update(app,object("phase","PREPARE_FAILED","terminal",true));throw error;
        }finally{
            boolean removed=!payload.exists()||payload.delete();
            Store.event(app,"private_payload_cleanup",object("removed",removed));
        }
    }

    void commit()throws Exception{
        Context app=getApplicationContext();JSONObject state=Store.read(app);int id=state.optInt("session_id",-1);
        if(!"PREPARED".equals(state.optString("phase"))||state.optBoolean("commit_called"))throw new IllegalStateException("not_prepared");
        PackageInstaller installer=app.getPackageManager().getPackageInstaller();
        assertOwnedTarget(app,false);
        PackageInstaller.SessionInfo info=requireOwn(installer,id);
        if(info.isCommitted()||info.isSealed())throw new IllegalStateException("already_committed");
        String run=state.getString("run_id");
        Intent reply=new Intent(app,StatusReceiver.class).setAction(STATUS_ACTION)
                .setData(Uri.parse("lsa-install-status:"+run)).putExtra("run_id",run);
        // Mutable is required by PackageInstaller for target >=35. Explicit/private receiver,
        // unique data and no ONE_SHOT: the same sender receives pending and terminal statuses.
        PendingIntent callback=PendingIntent.getBroadcast(app,id,reply,PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_MUTABLE);
        Store.update(app,object("commit_called",true,"phase","COMMIT_REQUESTED"));
        Store.event(app,"commit_requested",sessionInfo(info));
        try(PackageInstaller.Session session=installer.openSession(id)){
            session.commit(callback.getIntentSender());
            // A callback can beat this return. Do not overwrite the callback's phase/status.
            Store.event(app,"commit_call_returned",new JSONObject());
        }catch(Exception error){
            Store.event(app,"commit_call_error",object("error_type",error.getClass().getSimpleName(),"automatic_retry",false));
            throw error;
        }
    }

    void openConfirmation(){
        try{
            if(!resumed||!hasWindowFocus())throw new IllegalStateException("not_visible");
            JSONObject state=Store.read(this);int id=state.optInt("session_id",-1);
            if(!state.optBoolean("pending_ready")||state.optBoolean("terminal")||state.optBoolean("pending_opened"))
                throw new IllegalStateException("no_unopened_pending_system_intent");
            requireOwn(getPackageManager().getPackageInstaller(),id);
            Intent intent=readPending(id);
            if(intent==null)throw new IllegalStateException("system_intent_lost_after_process_restart");
            JSONObject metadata=intentEvidence(intent);metadata.put("open_count",state.optInt("open_count")+1);
            Store.update(this,object("open_count",state.optInt("open_count")+1,"pending_opened",true));
            Store.event(this,"open_genuine_system_confirmation",metadata);
            // The Intent is exactly the system-supplied Parcelable. No synthetic action,
            // session, component, source UID, trust flag or grant is substituted.
            try{startActivity(intent);}
            catch(Exception error){Store.update(this,object("pending_opened",false));throw error;}
        }catch(Exception error){failure("open_confirmation",error);}
        render();
    }

    void abandon()throws Exception{
        Context app=getApplicationContext();JSONObject state=Store.read(app);int id=state.optInt("session_id",-1);
        PackageInstaller installer=app.getPackageManager().getPackageInstaller();
        PackageInstaller.SessionInfo info=requireOwn(installer,id);
        // Never cancel an accepted/in-progress commit implicitly. The visible button may
        // abandon an uncommitted session or one still awaiting the user's confirmation.
        if(info.isCommitted()&&(!state.optBoolean("pending_ready")||state.optBoolean("pending_opened")))
            throw new IllegalStateException("commit_already_given_to_native_ui");
        if(state.optBoolean("terminal"))throw new IllegalStateException("already_terminal");
        boolean submitted=state.optBoolean("commit_called");
        if(submitted)Store.markAbandonRequested(app);
        Store.event(app,"explicit_abandon_requested",sessionInfo(info));
        installer.abandonSession(id);
        clearPending(id);
        if(submitted)Store.update(app,object("pending_ready",false));
        else Store.update(app,object("phase","ABANDONED","terminal",true,"pending_ready",false));
        // A committed session owns an IntentSender: wait for its real terminal callback.
        // It may have arrived before abandonSession returned; never overwrite that phase.
        Store.event(app,"explicit_abandon_returned",inspection(app));
    }

    void openPackage(){
        try{
            if(!resumed||!hasWindowFocus())throw new IllegalStateException("not_visible");
            assertOwnedTarget(this,true);
            if(!getPackageManager().getPackageInstaller().getMySessions().isEmpty())throw new IllegalStateException("own_session_still_exists");
            Intent intent=new Intent(Intent.ACTION_INSTALL_PACKAGE,Uri.parse("package:"+TARGET));
            intent.setComponent(new ComponentName("com.android.packageinstaller","com.android.packageinstaller.InstallStart"));
            intent.putExtra(Intent.EXTRA_RETURN_RESULT,true);
            Store.event(this,"open_owned_package_uri",intentEvidence(intent));
            startActivityForResult(intent,PACKAGE_REQUEST);
        }catch(Exception error){failure("package_uri",error);}
        render();
    }
    @Override protected void onActivityResult(int request,int result,Intent data){
        super.onActivityResult(request,result,data);
        if(request!=PACKAGE_REQUEST)return;
        try{
            Store.event(this,"package_uri_result",object("request_code",request,"result_code",result,
                    "install_result_present",data!=null&&data.hasExtra(INSTALL_RESULT),
                    "install_result",data==null?Integer.MIN_VALUE:data.getIntExtra(INSTALL_RESULT,Integer.MIN_VALUE),
                    "installed",installed(this)));
        }catch(Exception error){failure("package_result",error);}
    }

    void readConfig()throws Exception{
        Context app=getApplicationContext();JSONObject row=new JSONObject();
        row.put("provider_resolved",app.getPackageManager().resolveContentProvider(MODULE_AUTHORITY,0)!=null);
        try{
            Bundle result=app.getContentResolver().call(Uri.parse("content://"+MODULE_AUTHORITY),"snapshot",null,null);
            String snapshot=result==null?null:result.getString("snapshot");
            row.put("bundle_null",result==null).put("bundle_size",result==null?0:result.size())
                    .put("has_ok",result!=null&&result.containsKey("ok")).put("ok",result!=null&&result.getBoolean("ok",false))
                    .put("has_snapshot",snapshot!=null).put("snapshot_length",snapshot==null?0:snapshot.length())
                    .put("snapshot_sha256",snapshot==null?JSONObject.NULL:hash(snapshot.getBytes(StandardCharsets.UTF_8)));
            row.put("empty_bundle_denial",result!=null&&result.isEmpty());
        }catch(Exception error){row.put("error_type",error.getClass().getSimpleName()).put("empty_bundle_denial",false);}
        // No snapshot text, proxy, shell UID, grant or configuration mutation.
        Store.event(app,"direct_own_uid_config_read",row);
    }

    public static final class StatusReceiver extends BroadcastReceiver{
        @Override public void onReceive(Context context,Intent callback){
            if(callback==null||!STATUS_ACTION.equals(callback.getAction()))return;
            try{
                JSONObject state=Store.read(context);String run=callback.getStringExtra("run_id");
                int id=callback.getIntExtra(PackageInstaller.EXTRA_SESSION_ID,-1);
                if(run==null||!run.equals(state.optString("run_id"))||id!=state.optInt("session_id",-2)){
                    Store.event(context,"unmatched_callback_ignored",object("callback_session_id",id));return;
                }
                int status=callback.getIntExtra(PackageInstaller.EXTRA_STATUS,Integer.MIN_VALUE);
                String message=callback.getStringExtra(PackageInstaller.EXTRA_STATUS_MESSAGE);
                JSONObject row=object("status",status,"legacy_status",callback.getIntExtra("android.content.pm.extra.LEGACY_STATUS",Integer.MIN_VALUE),
                        "status_message_length",message==null?0:message.length(),
                        "status_message_sha256",message==null?JSONObject.NULL:hash(message.getBytes(StandardCharsets.UTF_8)));
                Store.event(context,"system_status_callback",row);
                if(status==PackageInstaller.STATUS_PENDING_USER_ACTION){
                    if(state.optBoolean("terminal")){Store.event(context,"late_pending_ignored",new JSONObject());return;}
                    requireOwn(context.getPackageManager().getPackageInstaller(),id);
                    Intent pending=callback.getParcelableExtra(Intent.EXTRA_INTENT,Intent.class);
                    if(pending==null)throw new IllegalStateException("missing_genuine_pending_intent");
                    writePending(id,pending);
                    Store.update(context,object("phase","AWAITING_USER_CONFIRMATION","pending_ready",true,
                            "pending_opened",false,"callback_status",status,"pending_intent",intentEvidence(pending)));
                }else if(status!=Integer.MIN_VALUE){
                    clearPending(id);
                    Store.update(context,object("phase","TERMINAL","terminal",true,"pending_ready",false,
                            "callback_status",status,"legacy_status",row.getInt("legacy_status")));
                    Store.event(context,"terminal_package_state",inspection(context));
                }else Store.event(context,"missing_status_ignored",new JSONObject());
            }catch(Exception error){
                try{Store.event(context,"receiver_error",object("error_type",error.getClass().getSimpleName()));}
                catch(Exception ignored){Log.e("LS-InstallProbe","receiver evidence error");}
            }finally{MAIN.post(Probe::refreshVisible);}
        }
    }

    static PackageInstaller.SessionInfo requireOwn(PackageInstaller installer,int id)throws Exception{
        if(id<0)throw new IllegalStateException("no_session");
        PackageInstaller.SessionInfo info=installer.getSessionInfo(id);
        // The platform may not resolve the package until parsing. The exact ID is read
        // from our durable creation record, and owner UID must always match.
        if(info==null||info.getInstallerUid()!=android.os.Process.myUid()
                ||(info.getAppPackageName()!=null&&!TARGET.equals(info.getAppPackageName())))
            throw new SecurityException("not_own_fixed_payload_session");
        return info;
    }
    static void assertOwnedTarget(Context context,boolean required)throws Exception{
        // Fixed name alone is not ownership proof. Never replace or act on an unknown
        // certificate/version that happens to occupy this package name.
        try{
            PackageInfo current=context.getPackageManager().getPackageInfo(TARGET,PackageManager.GET_SIGNING_CERTIFICATES);
            long version=current.getLongVersionCode();
            if(version<1||version>3||current.sharedUserId!=null||!signer(current).equals(Assets.SIGNERS[(int)version-1]))
                throw new SecurityException("existing_target_not_owned_fixture");
        }catch(PackageManager.NameNotFoundException absent){if(required)throw absent;}
    }
    static JSONObject sessionInfo(PackageInstaller.SessionInfo info)throws Exception{
        return object("session_id",info.getSessionId(),"installer_uid",info.getInstallerUid(),
                "installer_package",info.getInstallerPackageName(),"payload_package",info.getAppPackageName()==null?JSONObject.NULL:info.getAppPackageName(),
                "session_user_is_current",info.getUser()!=null&&info.getUser().equals(android.os.Process.myUserHandle()),
                "active",info.isActive(),"sealed",info.isSealed(),"committed",info.isCommitted(),
                "require_user_action",info.getRequireUserAction());
    }
    static JSONObject installed(Context context)throws Exception{
        try{
            PackageInfo info=context.getPackageManager().getPackageInfo(TARGET,PackageManager.GET_SIGNING_CERTIFICATES);
            return object("present",true,"package",info.packageName,"version",info.getLongVersionCode(),
                    "uid",info.applicationInfo.uid,"signer_sha256",signer(info));
        }catch(PackageManager.NameNotFoundException absent){return object("present",false,"package",TARGET);}
    }
    static JSONObject inspection(Context context)throws Exception{
        JSONArray sessions=new JSONArray();int unexpected=0;
        for(PackageInstaller.SessionInfo info:context.getPackageManager().getPackageInstaller().getMySessions()){
            if(TARGET.equals(info.getAppPackageName()))sessions.put(sessionInfo(info));else unexpected++;
        }
        return object("own_sessions",sessions,"unexpected_own_session_count",unexpected,"installed",installed(context));
    }
    static String signer(PackageInfo info)throws Exception{
        if(info.signingInfo==null||info.signingInfo.hasMultipleSigners())throw new SecurityException("not_one_signer");
        Signature[] signers=info.signingInfo.getApkContentsSigners();
        if(signers.length!=1)throw new SecurityException("not_one_signer");return hash(signers[0].toByteArray());
    }
    static JSONObject intentEvidence(Intent intent)throws Exception{
        return object("action",intent.getAction()==null?JSONObject.NULL:intent.getAction(),
                "component",intent.getComponent()==null?JSONObject.NULL:intent.getComponent().flattenToShortString(),
                "flags",intent.getFlags(),"session_id",intent.getIntExtra(PackageInstaller.EXTRA_SESSION_ID,-1),
                "has_data",intent.getData()!=null,"has_clip_data",intent.getClipData()!=null);
    }
    // Android 16 may attach live Binder creator tokens. Keep the ORIGINAL object in this
    // process; Parcel.marshall/toUri cannot safely persist and reconstruct that authority.
    static synchronized void writePending(int id,Intent intent){PENDING.put(id,intent);}
    static synchronized Intent readPending(int id){return PENDING.get(id);}
    static synchronized void clearPending(int id){PENDING.remove(id);}
    static JSONObject object(Object... values){
        JSONObject result=new JSONObject();try{for(int i=0;i<values.length;i+=2)result.put((String)values[i],values[i+1]);}
        catch(Exception error){throw new IllegalArgumentException(error);}return result;
    }
    static String hex(byte[] bytes){StringBuilder text=new StringBuilder();for(byte b:bytes)text.append(String.format(java.util.Locale.ROOT,"%02x",b&255));return text.toString();}
    static String hash(byte[] bytes)throws Exception{return hex(MessageDigest.getInstance("SHA-256").digest(bytes));}

    static final class Store{
        static File stateFile(Context context){return new File(context.getFilesDir(),"state.json");}
        static synchronized JSONObject read(Context context)throws Exception{
            AtomicFile file=new AtomicFile(stateFile(context));
            if(!file.getBaseFile().exists())return object("phase","IDLE","session_id",-1,"terminal",true);
            return new JSONObject(new String(file.readFully(),StandardCharsets.UTF_8));
        }
        static synchronized void replace(Context context,JSONObject state)throws Exception{atomic(stateFile(context),state.toString().getBytes(StandardCharsets.UTF_8));}
        static synchronized void update(Context context,JSONObject changes)throws Exception{
            JSONObject state=read(context);java.util.Iterator<String> keys=changes.keys();
            while(keys.hasNext()){String key=keys.next();state.put(key,changes.get(key));}replace(context,state);
        }
        static synchronized void markAbandonRequested(Context context)throws Exception{
            JSONObject state=read(context);
            if(state.optBoolean("terminal"))throw new IllegalStateException("terminal_callback_already_arrived");
            state.put("phase","ABANDON_REQUESTED");replace(context,state);
        }
        static synchronized void event(Context context,String event,JSONObject data)throws Exception{
            JSONObject state=read(context);JSONObject row=object("event",event,"time_ms",System.currentTimeMillis(),
                    "elapsed_ms",SystemClock.elapsedRealtime(),"pid",android.os.Process.myPid(),"uid",android.os.Process.myUid(),
                    "run_id",state.optString("run_id",""),"session_id",state.optInt("session_id",-1),"details",data);
            try(FileOutputStream stream=context.openFileOutput("events.jsonl",Context.MODE_APPEND)){
                stream.write((row.toString()+"\n").getBytes(StandardCharsets.UTF_8));stream.getFD().sync();
            }
            state.put("last_event",row);replace(context,state);
        }
        static void atomic(File file,byte[] bytes)throws Exception{
            AtomicFile target=new AtomicFile(file);FileOutputStream stream=null;
            try{stream=target.startWrite();stream.write(bytes);target.finishWrite(stream);}
            catch(Exception error){if(stream!=null)target.failWrite(stream);throw error;}
        }
    }
}
'''

MANIFEST = '''<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="ls.augment.regression.installer" android:versionCode="1" android:versionName="1">
    <uses-sdk android:minSdkVersion="33" android:targetSdkVersion="36" />
    <uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES" />
    <queries>
        <package android:name="ls.augment.regression.signature" />
        <package android:name="com.android.packageinstaller" />
        <provider android:authorities="ls.augment.com.config" />
    </queries>
    <application android:label="LS Install Session Test" android:allowBackup="false"
        android:theme="@android:style/Theme.Material.Light.NoActionBar">
        <activity android:name=".Probe" android:exported="true">
            <intent-filter><action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" /></intent-filter>
        </activity>
        <receiver android:name=".Probe$StatusReceiver" android:exported="false" />
    </application>
</manifest>
'''

README = '''# LS 安装会话测试工具

此 APK 仅在电脑本地构建，未安装/运行手机。包 `ls.augment.regression.installer`，Activity `.Probe`；唯一权限 `REQUEST_INSTALL_PACKAGES`。只含既有自有 `ls.augment.regression.signature` 的 v1/A、v2/B、v3/A 三个 APK；无网络/服务/自动后台循环，不读用户应用列表、文件或账号。

## 操作

1. root 按本轮方案保存新基线并正常安装本工具，打开 `ls.augment.regression.installer/.Probe`。工具不接受自动执行的 Intent extras；每一步实际点击按钮。需要时由原厂页面授权本工具来源，之后恢复原状态。
2. 点击 `PREPARE v1/v2/v3`。工具校验嵌入文件 SHA256、真实包名、版本、证书，创建自身 UID 持有的真实 session，实际写入/同步后显示 PREPARED。已有自身 session 时拒绝准备第二个。
3. 点击 `COMMIT PREPARED SESSION`，只提交一次；持久化 commit_called 后不自动重试不确定提交。可变且明确指向私有 receiver 的 PendingIntent 收取系统回调；不是伪造 CONFIRM_INSTALL。
4. 若收到 STATUS_PENDING_USER_ACTION=-1，页面显示 AWAITING_USER_CONFIRMATION，点击 `OPEN SYSTEM CONFIRM`。启动原样系统 EXTRA_INTENT，没有改 action、组件、来源、信任位、授权或 sessionId。接着实际点击原厂安装/取消。来源设置/系统确认中途离开本 Activity 是正常过程，不会触发自动 abandon。
5. 系统终态保存在 events.jsonl/state.json。`REFRESH STATE` 读取本 UID 自有 sessions 和固定目标包实际版本、UID、证书，既不安装也不改变状态。真正成功还应核系统 PackageManager 及目标私有数据；本工具不读取目标私有标记。
6. 如果会话尚未commit，或收到pending但尚未点击OPEN，`ABANDON THIS SESSION` 可显式放弃当前记录且ownerUID/目标包均核对的那个session。已经交给原厂确认页的提交不允许工具再放弃，以免取消正在进行的授权安装；请在原厂页面取消并等系统终态。不遍历/放弃其他session。
7. 无自身session且自有目标已安装时，`OPEN PACKAGE URI` 通过公开原厂 InstallStart 打开 `package:ls.augment.regression.signature` 并请求原生返回。此为 installExisting 既有包路径，已安装目标可能幂等完成，不能宣称新APK被复制安装。
8. 可选 `READ CONFIG (DENY EXPECTED)`：以本工具普通UID直接访问配置Provider，仅存返回存在性、长度/摘要，绝不存配置原文。空Bundle为应用层拒绝；Unknown authority/异常仅按实际记录，不冒充授权拒绝。此工具不在模块固定白名单，不能作为新增真实目标授权正向证据。

## 证据及生命周期

- `/data/user/0/ls.augment.regression.installer/files/events.jsonl`：实际请求/写入/commit返回/系统回调/Activity返回/错误类型；含runId、sessionId、PID/UID、时间。原始系统status_message只留长度和SHA256，实际legacy安装错误码保留。
- 同目录 `state.json`：当前阶段、所选固定payload、实际最后事件；每次写入用 AtomicFile。UI显示此数据，不把日志内容当安装结果。
- 系统回传Intent仅保留在进程内，保持Android16可能附带的活Binder creator token；不经过Parcel.marshall/toUri重建。Activity旋转可继续使用原对象；若进程死亡，UI明确 `pending_intent_lost_in_this_process`，OPEN拒绝执行，不能自动重新commit。尚未OPEN的本轮等待会话可显式abandon再新建；已经OPEN的会话从原厂现有页面取消/完成并等待真实终态。
- Activity旋转/Back/销毁不会重新prepare/commit、不会主动弹安装页、不会取消已提交工作；每份系统pending回调只允许一次明确OPEN。单次写入线程有限，完成即结束；无轮询。未完成状态下重开应用只查看状态，不自动执行下一步。
- 只有本工具现有固定payload包被查询；不申请角色、root或代理读取，不修改模块配置/系统保护/未知来源全局值。

## 清理

先在原厂页面取消未确认操作，等待系统终态并保存证据。未commit/明确pending的本轮当前session可用ABANDON按钮；已接受提交的安装等待结果。若进程恰在createSession与落盘之间被杀，REFRESH会显示孤立的自身session并拒绝新建，需root按本轮真实owner/ID证据单独处理，工具不会猜测并广泛清理。

核自有session清空后卸载本工具；卸载自动删除其私有JSON/cache。签名目标仅按本轮新基线和ownership卸载/恢复。恢复本工具的来源授权/app-op及本轮模块开关；不要提前关闭仍供后续必要安装的临时USB安装开关。禁止清空用户应用/会话/其他文件。这里v1/v2/v3是包版本，三个APK均为现代v3签名方案，不是旧v1签名方案验收。

本地构建校验见 inventory.json、asset-verification-builder.json、signature.txt、badging.txt、binary-manifest.txt、dexdump.txt。手机行为未运行，待root真实验收。
'''


def run(*args):
    result = subprocess.run(list(map(str, args)), capture_output=True, text=True,
                            encoding='utf-8', errors='replace')
    if result.returncode:
        raise RuntimeError(result.stdout + result.stderr)
    return result.stdout + result.stderr


def main():
    OUT.mkdir(parents=True, exist_ok=True)
    assets = []
    for version in (1, 2, 3):
        name = f'signature-v{version}.apk'
        path = ROOT / f'out/full-device-regression-20260908/fixtures/signature-v{version}' / name
        blob = path.read_bytes()
        if hashlib.sha256(blob).hexdigest() != PINNED_ASSET_HASHES[version - 1]:
            raise RuntimeError('Owned asset changed from the reviewed bytes: ' + name)
        signature = run(BUILD / 'apksigner.bat', 'verify', '--verbose', '--print-certs', path)
        badging = run(BUILD / 'aapt2.exe', 'dump', 'badging', path)
        identity = re.search(r"package: name='([^']+)' versionCode='([^']+)'", badging)
        signers = re.findall(r'Signer #\d+ certificate SHA-256 digest: ([0-9a-fA-F]+)', signature)
        if not identity or identity.groups() != (TARGET, str(version)) or len(signers) != 1:
            raise RuntimeError('Unexpected owned payload identity or signer: ' + name)
        if 'uses-permission:' in badging:
            raise RuntimeError('Owned signature payload unexpectedly requests permissions')
        assets.append({'name': name, 'path': str(path), 'package': TARGET, 'version': version,
                       'bytes': len(blob), 'sha256': hashlib.sha256(blob).hexdigest(),
                       'signer_sha256': signers[0].lower()})
        (OUT / (name + '-verification.txt')).write_text(signature + '\n' + badging, encoding='utf-8')
    if assets[0]['signer_sha256'] != assets[2]['signer_sha256'] or assets[0]['signer_sha256'] == assets[1]['signer_sha256']:
        raise RuntimeError('Expected signing order A/B/A')
    (OUT / 'asset-verification-builder.json').write_text(json.dumps(assets, indent=2), encoding='utf-8')
    assets_source = 'package ' + PACKAGE + '; final class Assets {\n'
    for name, field in [('NAMES', 'name'), ('HASHES', 'sha256'), ('SIGNERS', 'signer_sha256')]:
        assets_source += 'static final String[] ' + name + '={' + ','.join(json.dumps(a[field]) for a in assets) + '};\n'
    assets_source += 'static final long[] SIZES={' + ','.join(str(a['bytes']) + 'L' for a in assets) + '};\n}\n'
    (OUT / 'Probe.java').write_text(SOURCE, encoding='utf-8')
    (OUT / 'Assets.java').write_text(assets_source, encoding='utf-8')
    (OUT / 'AndroidManifest.xml').write_text(MANIFEST, encoding='utf-8')
    (OUT / 'README.md').write_text(README, encoding='utf-8')
    source_hash = hashlib.sha256((SOURCE + assets_source + MANIFEST).encode()).hexdigest()
    classes = OUT / ('classes-' + source_hash[:16]); classes.mkdir(exist_ok=True)
    compile_log = run(JAVA / 'javac.exe', '-J-Duser.language=en', '-J-Duser.country=US', '-J-Dfile.encoding=UTF-8',
                      '-encoding', 'UTF-8', '-source', '8', '-target', '8',
                      '-cp', ANDROID, '-d', classes, OUT / 'Probe.java', OUT / 'Assets.java')
    (OUT / 'javac.txt').write_text(compile_log, encoding='utf-8')
    run(BUILD / 'd8.bat', '--lib', ANDROID, '--min-api', '33', '--output', OUT, *sorted(classes.rglob('*.class')))
    unsigned, aligned, apk = [OUT / n for n in ('unsigned.apk', 'aligned.apk', 'installer-session.apk')]
    run(BUILD / 'aapt2.exe', 'link', '-o', unsigned, '-I', ANDROID, '--manifest', OUT / 'AndroidManifest.xml')
    with zipfile.ZipFile(unsigned, 'a') as archive:
        archive.write(OUT / 'classes.dex', 'classes.dex')
        for asset in assets:
            archive.write(asset['path'], 'assets/' + asset['name'])
    run(BUILD / 'zipalign.exe', '-f', '4', unsigned, aligned)
    run(BUILD / 'apksigner.bat', 'sign', '--ks', Path.home() / '.android/debug.keystore',
        '--ks-pass', 'pass:android', '--key-pass', 'pass:android', '--out', apk, aligned)
    signature = run(BUILD / 'apksigner.bat', 'verify', '--verbose', '--print-certs', apk)
    badging = run(BUILD / 'aapt2.exe', 'dump', 'badging', apk)
    manifest = run(BUILD / 'aapt2.exe', 'dump', 'xmltree', '--file', 'AndroidManifest.xml', apk)
    dex = run(BUILD / 'dexdump.exe', '-d', OUT / 'classes.dex')
    alignment = run(BUILD / 'zipalign.exe', '-c', '-v', '4', apk)
    for name, text in [('signature.txt', signature), ('badging.txt', badging),
                       ('binary-manifest.txt', manifest), ('dexdump.txt', dex), ('alignment.txt', alignment)]:
        (OUT / name).write_text(text, encoding='utf-8')
    permissions = re.findall(r"uses-permission: name='([^']+)'", badging)
    if permissions != ['android.permission.REQUEST_INSTALL_PACKAGES']:
        raise RuntimeError('Unexpected requested permissions: ' + repr(permissions))
    if 'E: service' in manifest or 'android.intent.action.BOOT_COMPLETED' in manifest or 'sharedUserId' in manifest:
        raise RuntimeError('Unexpected service, startup or shared UID')
    receiver = manifest.split('E: receiver', 1)[1]
    if 'Probe$StatusReceiver' not in receiver or not re.search(r'android:exported[^\n]*=false', receiver):
        raise RuntimeError('Status receiver must be explicit and unexported')
    for expected in ('createSession', 'setRequireUserAction', 'openWrite', 'fsync', 'commit', 'getIntentSender',
                     'getInstallerUid', 'getMySessions', 'STATUS', 'getParcelableExtra', 'events.jsonl'):
        if expected not in dex:
            raise RuntimeError('Expected compiled API/evidence missing: ' + expected)
    for forbidden in ('android.content.pm.action.CONFIRM_INSTALL', 'android.content.pm.action.CONFIRM_PRE_APPROVAL',
                      'Ljava/net/', 'Landroid/media/', 'Ljava/lang/Runtime;->exec', 'getInstalledPackages',
                      'getInstalledApplications', 'grantUriPermission', 'requestPermissions'):
        if forbidden in dex:
            raise RuntimeError('Unexpected synthetic action or authority: ' + forbidden)
    with zipfile.ZipFile(apk) as archive:
        if archive.read('classes.dex') != (OUT / 'classes.dex').read_bytes():
            raise RuntimeError('Signed DEX differs')
        names = sorted(n for n in archive.namelist() if n.startswith('assets/'))
        if names != sorted('assets/' + a['name'] for a in assets):
            raise RuntimeError('Unexpected embedded asset')
        for asset in assets:
            if hashlib.sha256(archive.read('assets/' + asset['name'])).hexdigest() != asset['sha256']:
                raise RuntimeError('Signed asset hash differs')
    inventory = {'package': PACKAGE, 'component': PACKAGE + '/.Probe', 'apk': str(apk),
                 'sha256': hashlib.sha256(apk.read_bytes()).hexdigest(), 'bytes': apk.stat().st_size,
                 'source_sha256': source_hash, 'requested_permissions': permissions,
                 'min_sdk': 33, 'target_sdk': 36, 'version_code': 1, 'assets': assets,
                 'private_events': '/data/user/0/' + PACKAGE + '/files/events.jsonl',
                 'private_state': '/data/user/0/' + PACKAGE + '/files/state.json',
                 'system_pending_intent': 'Original in-process object only; process loss explicitly blocks OPEN',
                 'manual_only': True, 'automatic_install_or_background_launch': False,
                 'verification': {'compile': 'passed', 'signature': 'passed', 'alignment': 'passed',
                                  'manifest': 'passed', 'dex': 'passed', 'signed_assets': 'passed'},
                 'installed': False, 'device_execution': 'not performed'}
    (OUT / 'inventory.json').write_text(json.dumps(inventory, indent=2), encoding='utf-8')
    print(json.dumps(inventory, ensure_ascii=False))


if __name__ == '__main__':
    main()
