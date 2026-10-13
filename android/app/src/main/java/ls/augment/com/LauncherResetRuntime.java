package ls.augment.com;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import java.io.IOException;

/** Ephemeral reset request/receipt; the dedicated provider never mutates user configuration. */
final class LauncherResetRuntime {
    private static final Uri URI=Uri.parse("content://ls.augment.com.config/launcher-reset");
    private static volatile LauncherResetPolicy.Session current;
    private LauncherResetRuntime(){ }
    static synchronized LauncherResetPolicy.Session begin(Context context,int launcherUid,int user,long serial)
            throws IOException {
        if(!ResetWriteFence.owns())throw new IOException("桌面清理只能由本次总重置请求");
        if(current!=null)throw new IOException("已有桌面清理请求，请稍后重试");
        ConfigSnapshot snapshot=new AppConfig(context).configSnapshot();
        if(!paused(snapshot))throw new IOException("模块功能尚未全部暂停，未请求清理桌面");
        long now=SystemClock.elapsedRealtime();
        LauncherResetPolicy.Request request=new LauncherResetPolicy.Request(java.util.UUID.randomUUID().toString(),
                user,serial,launcherUid,BuildConfig.VERSION_CODE,snapshot.revision,snapshot.checksum,
                now,now+LauncherResetPolicy.MAX_TTL_MS,ResetWriteFence.generation());
        if(!LauncherResetPolicy.valid(request,now))throw new IOException("桌面清理请求身份无效");
        if(!HideUserIdentity.match(context,user,serial).success)throw new IOException("桌面用户空间已变化");
        current=new LauncherResetPolicy.Session(request);
        try{context.getContentResolver().notifyChange(URI,null);}
        catch(RuntimeException unavailable){current=null;throw new IOException("无法通知系统桌面，未清除页面记录",unavailable);}
        return current;
    }
    static LauncherResetPolicy.Receipt await(LauncherResetPolicy.Session session) throws IOException {
        long deadline=Math.min(session.request.expiresAt,SystemClock.elapsedRealtime()+12000L);
        synchronized(session){
            while(session.receipt()==null&&SystemClock.elapsedRealtime()<deadline){
                if(current!=session||!ResetWriteFence.active()||ResetWriteFence.generation()!=session.request.generation)
                    throw new IOException("本次桌面清理请求已失效");
                try{session.wait(Math.min(250L,Math.max(1L,deadline-SystemClock.elapsedRealtime())));}
                catch(InterruptedException interrupted){Thread.currentThread().interrupt();throw new IOException("桌面清理已中断",interrupted);}
            }
        }
        LauncherResetPolicy.Receipt receipt=session.receipt();
        if(current!=session||!ResetWriteFence.active()||ResetWriteFence.generation()!=session.request.generation
                ||!LauncherResetPolicy.valid(session.request,SystemClock.elapsedRealtime()))
            throw new IOException("本次桌面清理请求已失效，未提交默认设置");
        if(receipt==null)throw new IOException("系统桌面未确认清理，请检查 LSPosed 桌面作用域并重启手机后重试；恢复依据已保留");
        return receipt;
    }
    static synchronized void end(Context context,LauncherResetPolicy.Session session){
        if(current==session){current=null;try{context.getContentResolver().notifyChange(URI,null);}catch(RuntimeException ignored){ }}
    }
    static synchronized Bundle call(Context context,String method,int uid,int pid,String caller,String[] packages,Bundle extras){
        Bundle result=new Bundle();
        LauncherResetPolicy.Session session=current;
        if(session==null||!ResetWriteFence.active()||session.request.generation!=ResetWriteFence.generation()
                ||!LauncherResetPolicy.valid(session.request,SystemClock.elapsedRealtime())
                ||!LauncherResetPolicy.caller(session.request,uid,caller,packages)
                ||!HideUserIdentity.match(context,session.request.user,session.request.serial).success)return result;
        ConfigSnapshot snapshot=new AppConfig(context).configSnapshot();
        if(!paused(snapshot)||snapshot.revision!=session.request.revision
                ||!snapshot.checksum.equals(session.request.checksum))return result;
        LauncherResetPolicy.Request r=session.request;
        if("launcher_reset_read".equals(method)){
            if(extras!=null||!session.claim(pid,SystemClock.elapsedRealtime()))return result;
            result.putBoolean("ok",true);result.putString("nonce",r.nonce);
            result.putInt("user",r.user);result.putLong("serial",r.serial);result.putInt("uid",r.launcherUid);
            result.putInt("version",r.moduleVersion);result.putLong("revision",r.revision);result.putString("checksum",r.checksum);
            result.putLong("createdAt",r.createdAt);result.putLong("expiresAt",r.expiresAt);result.putLong("generation",r.generation);
            return result;
        }
        if("launcher_reset_pages_clear".equals(method)){
            if(extras==null||extras.size()!=1||!(extras.get("nonce") instanceof String)
                    ||!r.nonce.equals(extras.getString("nonce"))||!session.claim(pid,SystemClock.elapsedRealtime()))return result;
            result.putBoolean("ok",LauncherOwnedStateStore.clearPagesForReset(context));return result;
        }
        if(!"launcher_reset_ack".equals(method)||extras==null||extras.size()!=9
                ||!(extras.get("nonce") instanceof String)||!(extras.get("user") instanceof Integer)
                ||!(extras.get("serial") instanceof Long)||!(extras.get("version") instanceof Integer)
                ||!(extras.get("revision") instanceof Long)||!(extras.get("checksum") instanceof String)
                ||!(extras.get("generation") instanceof Long)||!(extras.get("success") instanceof Boolean)
                ||!(extras.get("code") instanceof String)
                ||!LauncherResetPolicy.matches(r,extras.getString("nonce"),extras.getInt("user",-1),extras.getLong("serial",-1),
                    extras.getInt("version",-1),extras.getLong("revision",-1),extras.getString("checksum"),
                    extras.getLong("generation",-1),SystemClock.elapsedRealtime()))return result;
        result.putBoolean("ok",session.ack(pid,extras.getBoolean("success",false),extras.getString("code"),SystemClock.elapsedRealtime()));
        return result;
    }
    private static boolean paused(ConfigSnapshot snapshot){
        if(snapshot==null)return false;
        for(String key:ConfigSchema.booleanKeys())if(ConfigSchema.isRuntimeKey(key)&&!"0".equals(snapshot.get(key)))return false;
        return true;
    }
}
