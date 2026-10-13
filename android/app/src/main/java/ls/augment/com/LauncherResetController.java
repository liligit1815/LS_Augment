package ls.augment.com;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/** Discards only module-owned page metadata; keeps grid originals until the OEM verifies restoration. */
final class LauncherResetController {
    private static final String PACKAGE="com.zte.mifavor.launcher";
    private static final Set<String> ROLES=Set.of("grid","grid_bak","pages","pages_bak");
    private LauncherResetController() { }
    static Result prepare(Context context) {
        Context appContext=context.getApplicationContext();
        int user=android.os.Process.myUid()/100000;
        HideUserIdentity.Snapshot identity=HideUserIdentity.read(appContext,user);
        if(!identity.success)return failure("系统桌面用户身份未确认",true);
        ApplicationInfo app;
        try { app=appContext.getPackageManager().getApplicationInfo(PACKAGE,0); }
        catch (PackageManager.NameNotFoundException missing) { return failure("未找到系统桌面，未清理恢复依据",true); }
        catch (RuntimeException unavailable) { return failure("系统桌面身份暂不可读取",true); }
        String base="/data/user/"+user+"/"+PACKAGE;
        String deviceBase="/data/user_de/"+user+"/"+PACKAGE;
        if(!PACKAGE.equals(app.packageName)||app.uid/100000!=user||app.dataDir==null
                ||!(app.dataDir.equals(base)||app.dataDir.equals(deviceBase)
                    ||(user==0&&app.dataDir.equals("/data/data/"+PACKAGE))))
            return failure("系统桌面身份或目录未确认",true);
        String body;
        try(InputStream input=appContext.getAssets().open("launcher_reset_records.sh")){
            body=new String(input.readAllBytes(),StandardCharsets.UTF_8);
        }catch(IOException missing){return failure("无法读取桌面记录清理程序",true);}
        // Root only observes the two fixed stores. The owning process updates
        // its cached SharedPreferences and acknowledges this exact reset.
        boolean pending=LauncherOwnedStateStore.pendingGrid(appContext),history=LauncherOwnedStateStore.pagesHistory(appContext);
        String primary=app.dataDir.equals(deviceBase)?deviceBase:base;
        for(String directory:new String[]{base,deviceBase}){
            String header="expected_uid="+app.uid+"\nexpected_user="+user+"\nbase="+RootShell.quote(directory)
                    +"\nrequired_base="+(directory.equals(primary)?1:0)+"\n";
            RootShell.Result observed=RootShell.run("nsenter -t 1 -m -- sh",header+"stage=read\n"+body,20,1500000);
            if(!observed.isSuccess())return failure(transportError("桌面模块记录无法安全读取：",observed),true);
            try{
                Map<String,Record> records=readRecords(observed.output);
                for(Map.Entry<String,Record> entry:records.entrySet())if(entry.getValue().bytes!=null){
                    boolean grid=entry.getKey().startsWith("grid");
                    LauncherResetXml.State state=LauncherResetXml.read(entry.getValue().bytes,grid);
                    pending|=grid&&state.pendingGridRestore;history|=!grid&&state.historyPresent;
                }
            }catch(IOException invalid){return failure(invalid.getMessage(),true);}
        }
        if(!HideUserIdentity.match(appContext,user,identity.userSerial).success)
            return failure("桌面记录读取后用户身份已变化，未清理恢复依据",true);
        LauncherResetPolicy.Session session=null;
        try{
            session=LauncherResetRuntime.begin(appContext,app.uid,user,identity.userSerial);
            LauncherResetPolicy.Receipt receipt=LauncherResetRuntime.await(session);
            if(!receipt.success)return failure("系统桌面未确认清理："+receipt.code+"；恢复依据已保留",pending);
            if(LauncherOwnedStateStore.pagesHistory(appContext))return failure("模块私有页面记录仍存在，未提交默认设置",pending);
            pending|=LauncherOwnedStateStore.pendingGrid(appContext);
            for(String directory:new String[]{base,deviceBase}){
                String header="expected_uid="+app.uid+"\nexpected_user="+user+"\nbase="+RootShell.quote(directory)
                        +"\nrequired_base="+(directory.equals(primary)?1:0)+"\nstage=read\n";
                RootShell.Result observed=RootShell.run("nsenter -t 1 -m -- sh",header+body,20,1500000);
                if(!observed.isSuccess())return failure(transportError("桌面清理结果无法安全读取：",observed),pending);
                for(Map.Entry<String,Record> entry:readRecords(observed.output).entrySet())if(entry.getValue().bytes!=null){
                    boolean grid=entry.getKey().startsWith("grid");
                    LauncherResetXml.State state=LauncherResetXml.read(entry.getValue().bytes,grid);
                    if(!grid&&state.historyPresent)return failure("桌面页面记录仍存在，未提交默认设置；恢复依据已保留",pending);
                    pending|=grid&&state.pendingGridRestore;
                }
            }
        }catch(IOException incomplete){return failure(incomplete.getMessage(),pending);}
        finally{if(session!=null)LauncherResetRuntime.end(appContext,session);}
        if(!HideUserIdentity.match(appContext,user,identity.userSerial).success)
            return failure("桌面清理后用户身份已变化，请核对恢复依据",true);
        return new Result(true,pending,history,pending
                ?"桌面模块页面记录已清理；原始行列恢复依据已保留，等待系统桌面核验恢复"
                :"桌面模块页面记录已清理；未改写原生桌面布局");
    }
    static Map<String,Record> readRecords(String output)throws IOException{
        String[] lines=output.split("\\r?\\n",-1);
        if(lines.length!=6||!"LAUNCHER_RESET_RECORDS_V1".equals(lines[0])
                ||!"LAUNCHER_RESET_RECORDS_END".equals(lines[5]))throw new IOException("桌面记录读取结果不完整");
        Map<String,Record> records=new LinkedHashMap<>();
        for(int i=1;i<=4;i++){
            String[] values=lines[i].split("\\|",-1);
            if(values.length!=5||!"file".equals(values[0])||!ROLES.contains(values[1])||records.containsKey(values[1]))
                throw new IOException("桌面记录清单无效");
            if("0".equals(values[2])&&"-".equals(values[3])&&"-".equals(values[4]))records.put(values[1],new Record("absent",null));
            else if("1".equals(values[2])&&values[3].matches("[0-9a-f]{64}")){
                try{
                    byte[] bytes=Base64.getDecoder().decode(values[4]);
                    if(bytes.length>262144||!hex(MessageDigest.getInstance("SHA-256").digest(bytes)).equals(values[3]))throw new IOException("桌面记录校验失败");
                    records.put(values[1],new Record(values[3],bytes));
                }catch(IOException invalid){throw invalid;}
                catch(Exception invalid){throw new IOException("桌面记录编码无效",invalid);}
            }else throw new IOException("桌面记录状态无效");
        }
        return records;
    }
    private static String hex(byte[] bytes){StringBuilder value=new StringBuilder();for(byte b:bytes)value.append(String.format(java.util.Locale.ROOT,"%02x",b&255));return value.toString();}
    private static String transportError(String prefix,RootShell.Result result){
        if(result.output.contains("LAUNCHER_RESET_ERROR=process_still_running"))
            return "桌面 UID 仍有进程，未清理页面记录及行列恢复依据";
        return prefix+result.publicError();
    }
    private static Result failure(String message,boolean pending){return new Result(false,pending,false,message);}
    static final class Record{final String hash;final byte[] bytes;Record(String hash,byte[] bytes){this.hash=hash;this.bytes=bytes;}}
    static final class Result {
        final boolean success,pendingGridRestore,pageHistoryPresent;
        final String message;
        Result(boolean ok,boolean pending,boolean history,String text){success=ok;pendingGridRestore=pending;pageHistoryPresent=history;message=text;}
    }
}
