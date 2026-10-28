package ls.augment.com;

import android.app.*;
import android.content.*;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.*;
import android.view.WindowManager;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;
import org.json.*;

/** Reads actual SystemUI geometry through the inventory bridge, with durable restoration. */
final class StatusBarNativeDefaultsDeviceCases {
    private final Instrumentation test;private final Context context;private final AppConfig config;
    private int checks;private File output;
    private StatusBarNativeDefaultsDeviceCases(Instrumentation test){this.test=test;context=test.getTargetContext();config=new AppConfig(context);}
    static JSONObject run(Instrumentation test)throws Exception{return new StatusBarNativeDefaultsDeviceCases(test).run();}
    private void require(boolean value,String reason){checks++;if(!value)throw new AssertionError(reason);}
    private long save(Map<String,String> values){long at=System.currentTimeMillis();require(config.save(values).success,"configuration saved");return at;}
    private JSONObject sample(long after,String state)throws Exception{
        return sample(after,state,"main");
    }
    private JSONObject sample(long after,String state,String surface)throws Exception{
        long until=SystemClock.uptimeMillis()+25000;JSONObject last=new JSONObject();
        do{Bundle response=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"statusbar_inventory_get",null,null);
            String raw=response==null?"":response.getString("payload","");if(!raw.isEmpty()){JSONObject inventory=new JSONObject(raw);JSONObject appearance=inventory.optJSONObject("nativeAppearance");
                if(appearance!=null&&appearance.optJSONObject(surface)!=null)last=appearance.getJSONObject(surface);
                String applied=config.diagnostic("ls_augment_statusbar_"+(surface.equals("lock")?"keyguard":"phone")+"_layout_state");
                if(inventory.optLong("observedAt")>after+1200&&(surface.equals("lock")||last.has("clock"))&&last.has("battery")&&(state.isEmpty()||applied.contains(state)))return last;}
            SystemClock.sleep(250);
        }while(SystemClock.uptimeMillis()<until);
        throw new AssertionError("fresh SystemUI appearance unavailable: "+state+" / "+last+" / "+config.diagnostic("ls_augment_statusbar_phone_layout_state"));
    }
    private void same(JSONObject before,JSONObject after,String except)throws Exception{
        for(Iterator<String> keys=before.keys();keys.hasNext();){String key=keys.next();if(key.equals(except))continue;
            require(after.has(key)&&sameGeometry(before.getJSONObject(key),after.getJSONObject(key),key),"native geometry changed unexpectedly: "+key+" before="+before.opt(key)+" after="+after.opt(key));}
    }
    private boolean sameGeometry(JSONObject a,JSONObject b,String path)throws Exception{
        if(a.length()!=b.length())return false;
        for(Iterator<String> keys=a.keys();keys.hasNext();){String key=keys.next();if(!b.has(key))return false;
            // Live traffic may blink between samples. Its original geometry is
            // still compared, and unfiltered observations remain in the report.
            if(key.equals("visibility")&&path.endsWith(":wifi_inout"))continue;
            Object left=a.get(key),right=b.get(key);if(left instanceof JSONObject&&right instanceof JSONObject){if(!sameGeometry((JSONObject)left,(JSONObject)right,path+"/"+key))return false;}
            else if(!Objects.equals(left,right))return false;
        }return true;
    }
    private void capture(String name,JSONObject appearance)throws Exception{
        Files.write(new File(output,name+".json").toPath(),appearance.toString(2).getBytes(StandardCharsets.UTF_8));
        Bitmap image=test.getUiAutomation().takeScreenshot();require(image!=null,"screenshot captured");
        try(OutputStream stream=new FileOutputStream(new File(output,name+".png"))){image.compress(Bitmap.CompressFormat.PNG,100,stream);}finally{image.recycle();}
    }
    private void shell(String command)throws Exception{try(InputStream input=new ParcelFileDescriptor.AutoCloseInputStream(test.getUiAutomation().executeShellCommand(command))){input.readAllBytes();}}
    private JSONObject run()throws Exception{
        Map<String,String> before=new LinkedHashMap<>(config.snapshot()),restore=new LinkedHashMap<>();
        for(String key:before.keySet())if(StatusBarWorkspaceSpec.ownsKey(key))restore.put(key,before.get(key));
        File backup=new File(context.getFilesDir(),"statusbar-native-defaults-backup.json");require(!backup.exists(),"no pending native-default restoration");
        Files.write(backup.toPath(),new JSONObject(restore).toString().getBytes(StandardCharsets.UTF_8));
        output=new File(context.getExternalFilesDir(null),"statusbar-native-defaults");output.mkdirs();Activity page=null;
        JSONObject report=new JSONObject();
        try{
            shell("input keyevent 224");shell("wm dismiss-keyguard");
            long changed=save(StatusBarWorkspaceSpec.reset());
            page=test.startActivitySync(new Intent(context,StatusBarWorkspaceActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            Activity shown=page;test.runOnMainSync(()->shown.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON));
            JSONObject off=sample(changed,"");capture("01-off",off);
            Map<String,String> reset=new LinkedHashMap<>(config.snapshot());changed=save(Collections.singletonMap(ConfigSchema.SYSTEMUI_MASTER,"1"));
            JSONObject on=sample(changed,"native_selective");capture("02-only-master",on);same(off,on,"");
            require(config.get(ConfigSchema.STATUSBAR_GRID).isEmpty()&&config.get(StatusBarEditPolicy.KEY).isEmpty(),"master alone has no saved grid or policy");
            for(String key:reset.keySet())if(!key.equals(ConfigSchema.SYSTEMUI_MASTER))require(Objects.equals(reset.get(key),config.get(key)),"master alone only changes master: "+key);
            require(config.diagnostic("ls_augment_statusbar_phone_layout_state").contains("changed=0;hidden=0"),"master applies zero transforms and hides no content");
            Map<String,String> single=new LinkedHashMap<>();single.put(StatusBarEditPolicy.KEY,StatusBarEditPolicy.partial().with("battery","size",true).serialize());
            single.put(ConfigSchema.STATUSBAR_GRID,StatusBarEditPolicy.nativeGrid().with("battery",new StatusBarGridSpec.Item("RS",3,8,true)).serialize());
            changed=save(single);JSONObject sized=sample(changed,"policy=SE1;partial;battery,size");capture("03-battery-size-only",sized);same(on,sized,"battery");
            require(sized.getJSONObject("battery").getDouble("scaleY")!=on.getJSONObject("battery").getDouble("scaleY"),"only battery size visibly changes");
            changed=save(Collections.singletonMap(ConfigSchema.SYSTEMUI_MASTER,"0"));JSONObject disabled=sample(changed,"");capture("04-disabled",disabled);same(off,disabled,"");
            changed=save(Collections.singletonMap(ConfigSchema.SYSTEMUI_MASTER,"1"));JSONObject again=sample(changed,"policy=SE1;partial;battery,size");same(sized,again,"");
            changed=save(Collections.singletonMap(StatusBarEditPolicy.KEY,StatusBarEditPolicy.partial().serialize()));JSONObject nativeAgain=sample(changed,"policy=SE1;partial");
            Map<String,String> ordered=new LinkedHashMap<>();ordered.put(StatusBarEditPolicy.KEY,StatusBarEditPolicy.partial().with("bluetooth","order",true).serialize());
            ordered.put(StatusBarWorkspaceSpec.ICONS,StatusBarWorkspaceSpec.empty().with("bluetooth",new StatusBarGridSpec.Item("RS",998,0,true)).serialize());
            changed=save(ordered);JSONObject order=sample(changed,"policy=SE1;partial;bluetooth,order");capture("05-icon-order-only",order);same(nativeAgain,order,"StatusIconContainer");
            require(!sameGeometry(nativeAgain.getJSONObject("StatusIconContainer"),order.getJSONObject("StatusIconContainer"),"StatusIconContainer"),"numeric icon order changes actual native positions");
            for(boolean dual:new boolean[]{true,false}){
                changed=save(StatusBarWorkspaceSpec.preset(dual,config.snapshot()));JSONObject preset=sample(changed,"grid_v2");capture(dual?"06-dual-preset":"07-single-preset",preset);
                require(StatusBarEditPolicy.resolve(config::get).full,"preset explicitly applies complete layout");
                require(config.diagnostic("ls_augment_statusbar_phone_last_error").isEmpty(),"complete preset fits actual device");
            }
            changed=save(StatusBarWorkspaceSpec.reset());sample(changed,"");shell("input keyevent 26");shell("input keyevent 224");SystemClock.sleep(2000);
            try{JSONObject locked=sample(System.currentTimeMillis(),"","lock");capture("08-lock-off",locked);
                changed=save(Collections.singletonMap(ConfigSchema.SYSTEMUI_MASTER,"1"));JSONObject lockOn=sample(changed,"native_selective","lock");capture("09-lock-only-master",lockOn);same(locked,lockOn,"");
                require(config.diagnostic("ls_augment_statusbar_keyguard_layout_state").contains("carrier_replaced=false"),"master alone does not replace lock carrier or insert a clock");
            }finally{shell("wm dismiss-keyguard");}
            report.put("success",true).put("checks",checks).put("scope","current connected device: phone and lock native geometry, partial size and numeric order, toggle restoration, both full presets");
            return report;
        }finally{
            if(page!=null){Activity shown=page;test.runOnMainSync(shown::finish);test.waitForIdleSync();}
            StatusBarEditSession.WORKER.submit(()->{}).get(10,java.util.concurrent.TimeUnit.SECONDS);
            require(config.save(restore).success&&before.equals(config.snapshot()),"original configuration restored");Files.delete(backup.toPath());
        }
    }
}
