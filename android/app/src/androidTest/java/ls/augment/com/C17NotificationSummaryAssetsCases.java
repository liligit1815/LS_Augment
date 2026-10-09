package ls.augment.com;

import android.app.Instrumentation;
import android.app.KeyguardManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.AnimatedImageDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.PowerManager;
import android.util.AtomicFile;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.*;

/** Test-APK-only asset/config fixture. It never creates, cancels or edits a notification. */
final class C17NotificationSummaryAssetsCases {
    private static final String BASELINE="c17-notification-summary-assets-baseline.json";
    private static final String OWNER="c17-notification-summary-assets-v1";
    private static final String GIF="R0lGODlhDAAMAIEAAP8AAAAAAAAAAAAAACH/C05FVFNDQVBFMi4wAwEAAAAh+QQADAAAACwAAAAADAAMAAAIFgABCBxIsKDBgwgTKlzIsKHDhxARBgQAIfkEAQwAAQAsAAAAAAwADACBAP8AAAAAAAAAAAAACBYAAQgcSLCgwYMIEypcyLChw4cQEQYEADs=";
    private static final String[] KEYS={ConfigSchema.SYSTEMUI_MASTER,NotificationSummaryOptions.ENABLED,NotificationSummaryOptions.MODE,
            NotificationSummaryOptions.SYMBOL,NotificationSummaryOptions.TEXT,NotificationSummaryOptions.ASSET,NotificationSummaryOptions.SIZE};
    private C17NotificationSummaryAssetsCases(){}
    static JSONObject run(Instrumentation test,Bundle args)throws Exception{
        Context context=test.getTargetContext();String phase=args.getString("phase","inspect");
        switch(phase){
            case "prepare":return prepare(context,args.getString("runId",""));
            case "apply":return apply(context,args.getString("runId",""),args.getString("kind",""));
            case "inspect":return inspect(context);
            case "restore":return restore(context,args.getString("runId",""));
            default:throw new IllegalArgumentException("Unknown notification summary fixture phase");
        }
    }
    private static File baseline(Context context){return new File(context.getFilesDir(),BASELINE);}
    private static boolean exists(File file){return file.exists()||new File(file.getPath()+".bak").exists()||new File(file.getPath()+".new").exists();}
    private static File meta(Context context,String hash){return new File(StatusBarAssetStore.directory(context),hash+".json");}
    private static boolean resourceExists(Context context,String hash){return exists(StatusBarAssetStore.file(context,hash))||exists(meta(context,hash));}
    private static JSONObject values(AppConfig config)throws Exception{JSONObject result=new JSONObject();for(String key:KEYS)result.put(key,config.get(key));return result;}
    private static JSONObject read(Context context)throws Exception{
        require(exists(baseline(context)),"No durable notification summary fixture to restore or inspect");
        JSONObject saved=new JSONObject(new String(new AtomicFile(baseline(context)).readFully(),StandardCharsets.UTF_8));
        require(OWNER.equals(saved.getString("owner")),"Unexpected baseline owner; leave file intact");
        require(saved.getString("runId").matches("[0-9a-f-]{36}"),"Invalid fixture identity");
        return saved;
    }
    private static void write(File file,JSONObject value)throws Exception{
        AtomicFile atomic=new AtomicFile(file);FileOutputStream out=atomic.startWrite();
        try{out.write(value.toString(2).getBytes(StandardCharsets.UTF_8));out.getFD().sync();atomic.finishWrite(out);}
        catch(Exception error){atomic.failWrite(out);throw error;}
    }
    private static JSONObject prepare(Context context,String requestedRunId)throws Exception{
        require(!exists(baseline(context)),"Restore the pending summary baseline before preparing another run");
        AppConfig config=new AppConfig(context);JSONObject original=values(config);String runId=requestedRunId.isEmpty()?UUID.randomUUID().toString():requestedRunId;
        require(UUID.fromString(runId).toString().equals(runId),"Invalid requested fixture identity");
        PowerManager power=(PowerManager)context.getSystemService(Context.POWER_SERVICE);KeyguardManager keyguard=(KeyguardManager)context.getSystemService(Context.KEYGUARD_SERVICE);
        require(power!=null&&power.isInteractive()&&keyguard!=null&&!keyguard.isKeyguardLocked(),"Begin with an awake, unlocked phone; no fixture changes made");
        byte[] png=png(runId),gif=gif(runId);String pngHash=StatusBarAssetStore.hash(png),gifHash=StatusBarAssetStore.hash(gif);
        String missing=StatusBarAssetStore.hash((OWNER+" missing "+runId).getBytes(StandardCharsets.UTF_8));
        for(String hash:new String[]{pngHash,gifHash,missing})require(!resourceExists(context,hash),"Fixture resource already exists; nothing overwritten");
        require(!StatusBarAssetStore.validate(pngHash,png).animated,"PNG fixture is static");
        require(StatusBarAssetStore.validate(gifHash,gif).animated,"GIF fixture preserves real frames");
        Drawable decoded=StatusBarAssetStore.decode(gif,32);require(decoded instanceof AnimatedImageDrawable,"Android decoder recognizes animated GIF");((AnimatedImageDrawable)decoded).stop();decoded.setCallback(null);
        JSONObject saved=new JSONObject().put("owner",OWNER).put("runId",runId).put("preparedBuild",BuildConfig.VERSION_CODE)
                .put("preparedVersionName",BuildConfig.VERSION_NAME).put("createdAt",System.currentTimeMillis()).put("values",original)
                .put("newAssets",new JSONArray(Arrays.asList(pngHash,gifHash))).put("pngHash",pngHash).put("gifHash",gifHash).put("missingHash",missing)
                .put("phase","prepared").put("phaseAt",System.currentTimeMillis());
        // The durable record precedes every asset write and every configuration change.
        write(baseline(context),saved);
        try{
            require(!resourceExists(context,pngHash)&&!resourceExists(context,gifHash),"No existing source or metadata is overwritten");
            StatusBarAssetStore.store(context,pngHash,png);StatusBarAssetStore.store(context,gifHash,gif);
            require(Arrays.equals(png,StatusBarAssetStore.read(context,pngHash))&&Arrays.equals(gif,StatusBarAssetStore.read(context,gifHash)),"Stored fixture bytes are exact");
            for(String key:KEYS)require(original.getString(key).equals(config.get(key)),"Preparation leaves configuration unchanged: "+key);
            return inspect(context).put("preparationOnly",true).put("androidAnimatedDecode",true);
        }catch(Exception|AssertionError error){try{restore(context,runId);}catch(Exception|AssertionError cleanup){error.addSuppressed(cleanup);}throw error;}
    }
    private static JSONObject apply(Context context,String runId,String kind)throws Exception{
        JSONObject saved=read(context);require(saved.getString("runId").equals(runId),"Run ownership mismatch");
        require(Arrays.asList("native","png","gif","missing","disabled").contains(kind),"Unknown image fixture kind");
        Map<String,String> next=new LinkedHashMap<>();next.put(ConfigSchema.SYSTEMUI_MASTER,"1");next.put(NotificationSummaryOptions.ENABLED,kind.equals("native")||kind.equals("disabled")?"0":"1");
        next.put(NotificationSummaryOptions.MODE,"2");next.put(NotificationSummaryOptions.SIZE,"18");
        String hash=kind.equals("png")?saved.getString("pngHash"):kind.equals("missing")?saved.getString("missingHash"):saved.getString("gifHash");
        if(kind.equals("missing"))require(!resourceExists(context,hash),"Missing-image fallback requires a genuinely absent test hash");
        next.put(NotificationSummaryOptions.ASSET,hash);
        saved.put("phase",kind).put("phaseAt",System.currentTimeMillis()).put("expected",new JSONObject(next));write(baseline(context),saved);
        AppConfig config=new AppConfig(context);AppConfig.SaveResult result=config.save(next);require(result.success,"Could not save summary fixture");
        for(Map.Entry<String,String> entry:next.entrySet())require(entry.getValue().equals(config.get(entry.getKey())),"Fixture save readback: "+entry.getKey());
        return inspect(context).put("runtimeSynced",result.runtimeSynced);
    }
    private static JSONObject inspect(Context context)throws Exception{
        JSONObject saved=read(context);JSONArray assets=new JSONArray();
        for(int i=0;i<saved.getJSONArray("newAssets").length();i++){
            String hash=saved.getJSONArray("newAssets").getString(i);File file=StatusBarAssetStore.file(context,hash);
            assets.put(new JSONObject().put("hash",hash).put("exists",file.isFile()).put("bytesVerified",file.isFile()&&hash.equals(StatusBarAssetStore.hash(StatusBarAssetStore.read(context,hash)))));
        }
        return new JSONObject().put("success",true).put("runId",saved.getString("runId")).put("currentBuild",BuildConfig.VERSION_CODE)
                .put("preparedBuild",saved.getInt("preparedBuild")).put("baseline",baseline(context).getAbsolutePath()).put("phase",saved.getString("phase"))
                .put("phaseAt",saved.getLong("phaseAt")).put("pngHash",saved.getString("pngHash")).put("gifHash",saved.getString("gifHash"))
                .put("missingHash",saved.getString("missingHash")).put("missingStillAbsent",!resourceExists(context,saved.getString("missingHash")))
                .put("configuration",values(new AppConfig(context))).put("assets",assets)
                .put("evidenceScope","Only real asset decode/store and configuration. SystemUI drawing/eligibility requires separate observation; no notifications modified.");
    }
    private static JSONObject restore(Context context,String runId)throws Exception{
        JSONObject saved=read(context);require(runId.isEmpty()||saved.getString("runId").equals(runId),"Run ownership mismatch; baseline retained");
        JSONObject original=saved.getJSONObject("values");Map<String,String> next=new LinkedHashMap<>();for(String key:KEYS)next.put(key,original.getString(key));
        AppConfig config=new AppConfig(context);require(config.save(next).success,"Failed to restore summary configuration; baseline retained");
        for(String key:KEYS)require(next.get(key).equals(config.get(key)),"Restored value differs; retain baseline: "+key);
        JSONArray removed=new JSONArray(),retained=new JSONArray();
        for(int i=0;i<saved.getJSONArray("newAssets").length();i++){
            String hash=saved.getJSONArray("newAssets").getString(i);require(hash.matches("[0-9a-f]{64}"),"Only validated recorded hashes can be cleaned");
            if(StatusBarAssetReferences.statusbarIcons(config.snapshot()).contains(hash)){retained.put(hash);continue;}
            StatusBarAssetStore.deleteUnused(context,hash);
            // These two hashes were absent before this run; clean interrupted AtomicFile sidecars too.
            new AtomicFile(StatusBarAssetStore.file(context,hash)).delete();new AtomicFile(meta(context,hash)).delete();
            require(!resourceExists(context,hash),"Temporary resource cleanup incomplete; retain baseline");removed.put(hash);
        }
        new AtomicFile(baseline(context)).delete();require(!exists(baseline(context)),"Completed fixture baseline did not clear");
        return new JSONObject().put("success",true).put("runId",saved.getString("runId")).put("settingsRestored",true).put("restoredValues",original)
                .put("removedNewAssets",removed).put("retainedNewAssetsNowReferenced",retained).put("notificationsModified",false);
    }
    private static byte[] png(String runId)throws Exception{
        Bitmap image=Bitmap.createBitmap(24,16,Bitmap.Config.ARGB_8888);
        for(int y=0;y<16;y++)for(int x=0;x<24;x++)image.setPixel(x,y,x<8?0xff00d8ff:x<16?0xffff00b8:0xffffff00);
        // Unique content changes only four corner pixels; the three colored bands remain visible.
        for(int i=0;i<4;i++)image.setPixel(i,0,0xff000000|(runId.hashCode()>>>i*3&0xffffff));
        ByteArrayOutputStream out=new ByteArrayOutputStream();try{require(image.compress(Bitmap.CompressFormat.PNG,100,out),"PNG encoding");return out.toByteArray();}finally{image.recycle();}
    }
    private static byte[] gif(String runId)throws Exception{
        byte[] source=Base64.getDecoder().decode(GIF),comment=runId.getBytes(StandardCharsets.US_ASCII);require(source[source.length-1]==0x3b,"GIF trailer");
        ByteArrayOutputStream out=new ByteArrayOutputStream();out.write(source,0,source.length-1);out.write(0x21);out.write(0xfe);out.write(comment.length);out.write(comment);out.write(0);out.write(0x3b);return out.toByteArray();
    }
    private static void require(boolean condition,String message){if(!condition)throw new AssertionError(message);}
}
