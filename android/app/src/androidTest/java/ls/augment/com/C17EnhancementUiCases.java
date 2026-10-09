package ls.augment.com;

import android.app.*;
import android.content.*;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.net.Uri;
import android.os.*;
import android.util.AtomicFile;
import android.view.*;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.*;
import java.io.*;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicReference;
import org.json.*;

/** Production controls and normal save/provider readback. No SystemUI rendering claim.
 * Arguments: c17_landscape=true requests landscape only for these activities;
 * c17_expected_font_scale=1.3 verifies an externally selected font scale without changing it.
 * Document results use an ActivityMonitor fixture; the production importer still runs.
 * The durable baseline must survive a failed test/process until explicit restore succeeds.
 */
final class C17EnhancementUiCases implements Application.ActivityLifecycleCallbacks {
    private final Instrumentation test;
    private final Context context;
    private final AppConfig config;
    private final Bundle args;
    private final File baseline,directory,reportFile;
    private final JSONArray cases=new JSONArray(),steps=new JSONArray(),layouts=new JSONArray(),screenshots=new JSONArray();
    private final List<Activity> activities=new ArrayList<>();
    private volatile Activity resumed;
    private Activity page;
    private String route="",currentScenario="";
    private JSONObject progressReport;
    private int assertions,failures,iconEntries;
    private C17EnhancementUiCases(Instrumentation test,Bundle args){
        this.test=test;this.args=args==null?new Bundle():args;context=test.getTargetContext();config=new AppConfig(context);
        baseline=new File(context.getFilesDir(),"c17-enhancement-ui-baseline.json");
        directory=new File(context.getExternalFilesDir(null),"c17-enhancement-ui-"+BuildConfig.VERSION_CODE);
        reportFile=new File(directory,"report.json");
    }
    static JSONObject run(Instrumentation test,Bundle args)throws Exception{return new C17EnhancementUiCases(test,args).execute();}
    static JSONObject restore(Instrumentation test)throws Exception{
        C17EnhancementUiCases suite=new C17EnhancementUiCases(test,null);suite.restoreBaseline();
        return new JSONObject().put("success",true).put("settingsRestored",true);
    }
    private JSONObject execute()throws Exception{
        require(!baselinePresent(),"Previous C17 baseline exists; restore it before another run");
        require(directory.isDirectory()||directory.mkdirs(),"Evidence directory available");
        Map<String,String> before=new LinkedHashMap<>(config.snapshot());
        JSONObject saved=new JSONObject().put("settings",new JSONObject(before))
                .put("nativeValueOverrides",new JSONObject(context.getSharedPreferences("native_value_overrides",0).getAll()))
                .put("temporaryAssets",new JSONArray());
        durableWrite(baseline,saved.toString());
        JSONObject report=new JSONObject().put("evidenceScope","Actual production controls, callbacks, save, preference/provider readback and module-page bounds; SystemUI visual effects require separate device observations")
                .put("documentPickerEvidence","Actual image button and choice dialog; ActivityMonitor supplies private fixture URI to the production onActivityResult/importer. External DocumentsUI is not exercised.")
                .put("baseline",baseline.getAbsolutePath()).put("cases",cases).put("steps",steps).put("layouts",layouts).put("screenshots",screenshots)
                .put("landscapeRequested",flag("c17_landscape")).put("fontScale",context.getResources().getConfiguration().fontScale);
        progressReport=report;persistProgress("baseline-saved");
        Throwable fatal=null;boolean restored=false;
        Application application=(Application)context.getApplicationContext();application.registerActivityLifecycleCallbacks(this);
        try{
            Map<String,String> setup=new LinkedHashMap<>();
            List<EnhancementOption> options=new ArrayList<>();options.addAll(NotificationSummaryOptions.options());options.addAll(CarrierTextOptions.options());
            options.addAll(NotificationAppearanceOptions.options());options.addAll(ControlCenterAppearanceOptions.options());options.addAll(StatusBarIconLayoutOptions.options());
            for(EnhancementOption option:options){require(ConfigSchema.keys().contains(option.key),"Registered option "+option.key);setup.put(option.key,ConfigSchema.defaultValue(option.key));}
            setup.put(ConfigSchema.SYSTEMUI_MASTER,"1");setup.put(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY,"0");
            require(config.save(setup).success,"Prepare isolated values while preserving the durable user baseline");
            scenario("summary modes, visibility, import and disabled retention",this::summary);
            scenario("independent carrier settings in three positions",this::carriers);
            scenario("portrait and landscape notification clock controls",this::clocks);
            scenario("notification clear button controls",this::clearButton);
            scenario("control-center radius, tile fill and media controls",this::controlCenter);
            scenario("every supported icon spacing entry and independent boundaries",this::iconSpacing);
            scenario("system hint priority and independent count",this::priority);
        }catch(Throwable error){fatal=error;failures++;report.put("fatal",android.util.Log.getStackTraceString(error));persistProgress("fatal-before-restore");}
        finally{
            // Evidence I/O must never prevent the original user settings from being restored.
            try{persistProgress("restoring-baseline");}catch(Throwable evidenceFailure){report.put("progressWriteError",android.util.Log.getStackTraceString(evidenceFailure));}
            try{close();finishAndDrainAll();restoreBaseline();restored=before.equals(config.snapshot());require(restored,"All original configuration restored");}
            catch(Throwable cleanup){if(fatal==null)fatal=cleanup;else fatal.addSuppressed(cleanup);failures++;}
            application.unregisterActivityLifecycleCallbacks(this);
            report.put("success",failures==0).put("failures",failures).put("assertions",assertions).put("supportedIconEntries",iconEntries)
                    .put("settingsRestored",restored).put("baselineRetained",baselinePresent()).put("reportFile",reportFile.getAbsolutePath())
                    .put("inProgress",false).put("phase",failures==0?"complete":"failed").put("updatedAt",System.currentTimeMillis());
            if(fatal!=null)report.put("fatal",android.util.Log.getStackTraceString(fatal));
            durableWrite(reportFile,report.toString(2));
        }
        if(failures!=0)throw new AssertionError("C17 enhancement UI regression failed; report="+reportFile.getAbsolutePath(),fatal);
        return report;
    }
    private void scenario(String name,Action action)throws Exception{
        currentScenario=name;int index=cases.length();JSONObject result=new JSONObject().put("name",name).put("state","running");long start=SystemClock.uptimeMillis();
        cases.put(result);persistProgress("scenario-start");
        try{action.run();result.put("pass",true).put("state","passed");}
        catch(Throwable failure){failures++;result.put("pass",false).put("state","failed").put("error",android.util.Log.getStackTraceString(failure));persistProgress("scenario-error");
            try{capture("failure-"+index);}catch(Throwable captureFailure){result.put("captureError",android.util.Log.getStackTraceString(captureFailure));}}
        finally{try{close();}catch(Throwable error){failures++;result.put("pass",false).put("state","failed").put("cleanupError",android.util.Log.getStackTraceString(error));}
            result.put("elapsedMs",SystemClock.uptimeMillis()-start);persistProgress("scenario-finished");}
    }
    private void persistProgress(String phase)throws Exception{
        if(progressReport==null)return;
        progressReport.put("inProgress",true).put("success",false).put("settingsRestored",false).put("baselineRetained",baselinePresent())
                .put("phase",phase).put("currentScenario",currentScenario).put("currentRoute",route).put("failures",failures)
                .put("assertions",assertions).put("supportedIconEntries",iconEntries).put("updatedAt",System.currentTimeMillis()).put("reportFile",reportFile.getAbsolutePath());
        durableWrite(reportFile,progressReport.toString(2));
    }
    private void summary()throws Exception{
        openKey(NotificationSummaryOptions.ENABLED);toggle(NotificationSummaryOptions.ENABLED,true);
        choice(NotificationSummaryOptions.MODE,0);visible(NotificationSummaryOptions.SYMBOL,true);visible(NotificationSummaryOptions.TEXT,false);visible(NotificationSummaryOptions.ASSET,false);
        input(NotificationSummaryOptions.SYMBOL,"◆");invalid(NotificationSummaryOptions.SYMBOL,"1234567890123");input(NotificationSummaryOptions.SYMBOL,"");input(NotificationSummaryOptions.SYMBOL,"◆");
        input(NotificationSummaryOptions.SIZE,"21");invalid(NotificationSummaryOptions.SIZE,"");invalid(NotificationSummaryOptions.SIZE,"41");capture("summary-symbol");
        choice(NotificationSummaryOptions.MODE,1);visible(NotificationSummaryOptions.SYMBOL,false);visible(NotificationSummaryOptions.TEXT,true);visible(NotificationSummaryOptions.ASSET,false);
        input(NotificationSummaryOptions.TEXT,"两条新消息");invalid(NotificationSummaryOptions.TEXT,"bad\nline");capture("summary-text");
        choice(NotificationSummaryOptions.MODE,2);visible(NotificationSummaryOptions.SYMBOL,false);visible(NotificationSummaryOptions.TEXT,false);visible(NotificationSummaryOptions.ASSET,true);
        String hash=importFixtures();capture("summary-image");
        Map<String,String> parameters=values(NotificationSummaryOptions.MODE,NotificationSummaryOptions.SYMBOL,NotificationSummaryOptions.TEXT,NotificationSummaryOptions.ASSET,NotificationSummaryOptions.SIZE);
        toggle(NotificationSummaryOptions.ENABLED,false);visible(NotificationSummaryOptions.MODE,false);unchanged(parameters,"Summary close preserves valid parameters and image");
        close();openKey(NotificationSummaryOptions.ENABLED);visible(NotificationSummaryOptions.MODE,false);unchanged(parameters,"Summary remains disabled after returning");
        toggle(NotificationSummaryOptions.ENABLED,true);visible(NotificationSummaryOptions.ASSET,true);require(hash.equals(config.get(NotificationSummaryOptions.ASSET)),"Imported image remains selected after reopen");
        clickControl(NotificationSummaryOptions.ASSET);dialogClick("移除图片");readback(NotificationSummaryOptions.ASSET,"");
    }
    private String importFixtures()throws Exception{
        File invalidFile=new File(context.getCacheDir(),"c17-ui-invalid-image.fixture"),pngFile=new File(context.getCacheDir(),"c17-ui-valid-image.png");
        try{
            durableWrite(invalidFile,"This is deliberately not an image");
            Bitmap bitmap=Bitmap.createBitmap(13,7,Bitmap.Config.ARGB_8888);
            for(int y=0;y<7;y++)for(int x=0;x<13;x++)bitmap.setPixel(x,y,0xff000000|(x*17<<16)|(y*31<<8)|0x59);
            try(FileOutputStream out=new FileOutputStream(pngFile)){require(bitmap.compress(Bitmap.CompressFormat.PNG,100,out),"PNG fixture encoded");}finally{bitmap.recycle();}
            String hash=StatusBarAssetStore.hash(Files.readAllBytes(pngFile.toPath()));
            File asset=StatusBarAssetStore.file(context,hash),metadata=new File(StatusBarAssetStore.directory(context),hash+".json");
            if(!asset.exists()&&!metadata.exists()){
                JSONObject saved=readJson(baseline);saved.getJSONArray("temporaryAssets").put(hash);durableWrite(baseline,saved.toString());
            }
            String previous=config.get(NotificationSummaryOptions.ASSET);
            documentResult(invalidFile,Activity.RESULT_OK);settleWorker();readback(NotificationSummaryOptions.ASSET,previous);
            require(!StatusBarAssetStore.file(context,StatusBarAssetStore.hash(Files.readAllBytes(invalidFile.toPath()))).exists(),"Invalid image never enters asset store");
            documentResult(pngFile,Activity.RESULT_OK);readback(NotificationSummaryOptions.ASSET,hash);
            require(asset.isFile()&&Arrays.equals(Files.readAllBytes(pngFile.toPath()),Files.readAllBytes(asset.toPath())),"Imported source bytes match the fixture");
            require(main(()->"更换图片".contentEquals(((Button)control(NotificationSummaryOptions.ASSET)).getText())),"Image button reflects successful import");
            documentResult(invalidFile,Activity.RESULT_OK);settleWorker();readback(NotificationSummaryOptions.ASSET,hash);
            documentResult(null,Activity.RESULT_CANCELED);settleWorker();readback(NotificationSummaryOptions.ASSET,hash);
            steps.put(new JSONObject().put("control","image import").put("pass",true).put("invalidRejected",true).put("cancelPreservesImage",true).put("hash",hash));return hash;
        }finally{Files.deleteIfExists(invalidFile.toPath());Files.deleteIfExists(pngFile.toPath());}
    }
    private void documentResult(File fixture,int result)throws Exception{
        Intent data=fixture==null?null:new Intent().setData(Uri.fromFile(fixture));
        IntentFilter filter=new IntentFilter(Intent.ACTION_OPEN_DOCUMENT);filter.addCategory(Intent.CATEGORY_OPENABLE);filter.addDataType("image/*");
        Intent expected=new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("image/*");
        require(filter.match(context.getContentResolver(),expected,false,"C17EnhancementUiCases")>=0,"Document monitor matches production image MIME type and openable category");
        Instrumentation.ActivityMonitor monitor=test.addMonitor(filter,new Instrumentation.ActivityResult(result,data),true);
        try{persistProgress("document-result-start");clickControl(NotificationSummaryOptions.ASSET);dialogClick("选择图片");test.waitForIdleSync();require(monitor.getHits()==1,"Actual document intent intercepted exactly once");
            steps.put(new JSONObject().put("route",route).put("control","document result fixture").put("fixture",fixture==null?"canceled":fixture.getName()).put("monitorHits",monitor.getHits()).put("resultCode",result).put("pass",true));persistProgress("document-result-delivered");}
        finally{test.removeMonitor(monitor);}
    }
    private void carriers()throws Exception{
        for(int index=0;index<CarrierTextOptions.PANELS.length;index++){
            String panel=CarrierTextOptions.PANELS[index],enabled=CarrierTextOptions.key(panel,"enabled");Map<String,String> others=new LinkedHashMap<>();
            for(EnhancementOption option:CarrierTextOptions.options())if(!option.key.startsWith(CarrierTextOptions.key(panel,"")))others.put(option.key,config.get(option.key));
            openKey(enabled);toggle(enabled,true);choice(CarrierTextOptions.key(panel,"mode"),1);
            visible(CarrierTextOptions.key(panel,"text"),true);visible(CarrierTextOptions.key(panel,"pattern"),false);
            input(CarrierTextOptions.key(panel,"text"),"Duo "+panel);input(CarrierTextOptions.key(panel,"size"),String.valueOf(15+index));invalid(CarrierTextOptions.key(panel,"size"),"41");
            choice(CarrierTextOptions.key(panel,"mode"),2);visible(CarrierTextOptions.key(panel,"text"),false);visible(CarrierTextOptions.key(panel,"pattern"),true);
            input(CarrierTextOptions.key(panel,"pattern"),index==0?"HH:mm:ss":index==1?"MM-dd E":"HH:mm");invalid(CarrierTextOptions.key(panel,"pattern"),"'");invalid(CarrierTextOptions.key(panel,"pattern"),"");
            choice(CarrierTextOptions.key(panel,"mode"),0);visible(CarrierTextOptions.key(panel,"text"),false);visible(CarrierTextOptions.key(panel,"pattern"),false);
            choice(CarrierTextOptions.key(panel,"mode"),index==2?2:1);capture("carrier-"+panel);
            Map<String,String> selected=values(CarrierTextOptions.key(panel,"mode"),CarrierTextOptions.key(panel,"text"),CarrierTextOptions.key(panel,"pattern"),CarrierTextOptions.key(panel,"size"));
            toggle(enabled,false);visible(CarrierTextOptions.key(panel,"mode"),false);unchanged(selected,"Disabling "+panel+" preserves its parameters");unchanged(others,"Editing "+panel+" does not alter other positions");
            close();openKey(enabled);unchanged(selected,"Carrier values survive reopening "+panel);visible(CarrierTextOptions.key(panel,"mode"),false);close();
        }
    }
    private void clocks()throws Exception{
        for(boolean landscape:new boolean[]{false,true}){
            String enabled=NotificationAppearanceOptions.clock(landscape,"enabled");openKey(enabled);toggle(enabled,true);
            String[][] changes={{"size",landscape?"48":"68"},{"compact_size","22"},{"collapse_distance","132"},{"x","-7"},{"y","9"},{"date_size","16"},{"date_gap","8"},{"list_gap","20"}};
            Map<String,String> other=new LinkedHashMap<>();for(EnhancementOption option:NotificationAppearanceOptions.options())if(option.key.startsWith(NotificationAppearanceOptions.clock(!landscape,"")))other.put(option.key,config.get(option.key));
            for(String[] change:changes)input(NotificationAppearanceOptions.clock(landscape,change[0]),change[1]);choice(NotificationAppearanceOptions.clock(landscape,"align"),2);
            invalid(NotificationAppearanceOptions.clock(landscape,"size"),"101");invalid(NotificationAppearanceOptions.clock(landscape,"size"),"");
            Map<String,String> parameters=prefixValues(NotificationAppearanceOptions.clock(landscape,""),enabled);capture(landscape?"clock-landscape-parameters":"clock-portrait-parameters");
            toggle(enabled,false);visible(NotificationAppearanceOptions.clock(landscape,"size"),false);unchanged(parameters,"Clock disabled keeps values");unchanged(other,"Clock orientation settings independent");close();
        }
    }
    private void clearButton()throws Exception{
        openKey(NotificationAppearanceOptions.CLEAR);toggle(NotificationAppearanceOptions.CLEAR,true);
        choice(NotificationAppearanceOptions.CLEAR_ALIGN,2);input(NotificationAppearanceOptions.CLEAR_X,"-9");input(NotificationAppearanceOptions.CLEAR_Y,"7");
        input(NotificationAppearanceOptions.CLEAR_LIGHT,"#234567");input(NotificationAppearanceOptions.CLEAR_DARK,"#FF345678");input(NotificationAppearanceOptions.CLEAR_TRAVEL,"17");input(NotificationAppearanceOptions.CLEAR_DURATION,"320");
        invalid(NotificationAppearanceOptions.CLEAR_LIGHT,"not-a-color");invalid(NotificationAppearanceOptions.CLEAR_DURATION,"601");
        Map<String,String> parameters=prefixValues(NotificationAppearanceOptions.PREFIX+"clear_",NotificationAppearanceOptions.CLEAR);capture("clear-button");
        toggle(NotificationAppearanceOptions.CLEAR,false);visible(NotificationAppearanceOptions.CLEAR_ALIGN,false);unchanged(parameters,"Clear button disabled keeps values");close();
    }
    private void controlCenter()throws Exception{
        openKey(ControlCenterAppearanceOptions.CORNERS);toggle(ControlCenterAppearanceOptions.CORNERS,true);input(ControlCenterAppearanceOptions.RADIUS,"29");invalid(ControlCenterAppearanceOptions.RADIUS,"49");
        toggle(ControlCenterAppearanceOptions.CORNERS,false);readback(ControlCenterAppearanceOptions.RADIUS,"29");visible(ControlCenterAppearanceOptions.RADIUS,false);close();
        openKey(ControlCenterAppearanceOptions.TILES);toggle(ControlCenterAppearanceOptions.TILES,true);
        input(ControlCenterAppearanceOptions.TILE_LIGHT,"#2266AA");input(ControlCenterAppearanceOptions.TILE_DARK,"#445577");input(ControlCenterAppearanceOptions.TILE_OPACITY,"73");
        choice(ControlCenterAppearanceOptions.TILE_GRADIENT,0);visible(ControlCenterAppearanceOptions.TILE_END_LIGHT,false);visible(ControlCenterAppearanceOptions.TILE_END_DARK,false);visible(ControlCenterAppearanceOptions.TILE_DIRECTION,false);
        choice(ControlCenterAppearanceOptions.TILE_GRADIENT,1);visible(ControlCenterAppearanceOptions.TILE_END_LIGHT,true);input(ControlCenterAppearanceOptions.TILE_END_LIGHT,"#889944");input(ControlCenterAppearanceOptions.TILE_END_DARK,"#AA7733");choice(ControlCenterAppearanceOptions.TILE_DIRECTION,2);capture("tiles-gradient");
        Map<String,String> gradient=values(ControlCenterAppearanceOptions.TILE_END_LIGHT,ControlCenterAppearanceOptions.TILE_END_DARK,ControlCenterAppearanceOptions.TILE_DIRECTION);
        choice(ControlCenterAppearanceOptions.TILE_GRADIENT,0);unchanged(gradient,"Pure fill retains gradient parameters");invalid(ControlCenterAppearanceOptions.TILE_OPACITY,"101");
        Map<String,String> tile=prefixValues(ControlCenterAppearanceOptions.PREFIX+"tile_",ControlCenterAppearanceOptions.TILES);toggle(ControlCenterAppearanceOptions.TILES,false);visible(ControlCenterAppearanceOptions.TILE_LIGHT,false);unchanged(tile,"Tile close preserves parameters");close();
        openKey(ControlCenterAppearanceOptions.MEDIA);toggle(ControlCenterAppearanceOptions.MEDIA,true);input(ControlCenterAppearanceOptions.MEDIA_OPACITY,"64");input(ControlCenterAppearanceOptions.MEDIA_BLUR,"9");
        choice(ControlCenterAppearanceOptions.MEDIA_GLOW,0);visible(ControlCenterAppearanceOptions.GLOW_OPACITY,false);visible(ControlCenterAppearanceOptions.GLOW_WIDTH,false);
        choice(ControlCenterAppearanceOptions.MEDIA_GLOW,1);visible(ControlCenterAppearanceOptions.GLOW_OPACITY,true);visible(ControlCenterAppearanceOptions.GLOW_WIDTH,true);input(ControlCenterAppearanceOptions.GLOW_OPACITY,"35");input(ControlCenterAppearanceOptions.GLOW_WIDTH,"14");capture("media-glow");
        invalid(ControlCenterAppearanceOptions.GLOW_WIDTH,"0");invalid(ControlCenterAppearanceOptions.MEDIA_BLUR,"25");Map<String,String> glow=values(ControlCenterAppearanceOptions.GLOW_OPACITY,ControlCenterAppearanceOptions.GLOW_WIDTH);
        choice(ControlCenterAppearanceOptions.MEDIA_GLOW,0);unchanged(glow,"Glow close retains parameters");Map<String,String> media=prefixValues(ControlCenterAppearanceOptions.PREFIX+"media_",ControlCenterAppearanceOptions.MEDIA);
        toggle(ControlCenterAppearanceOptions.MEDIA,false);visible(ControlCenterAppearanceOptions.MEDIA_OPACITY,false);unchanged(media,"Media close preserves parameters");close();
    }
    private void iconSpacing()throws Exception{
        String unchanged=config.get(StatusBarIconSpacingSpec.KEY);
        StatusBarIconSpacingSpec initial=StatusBarIconSpacingSpec.parse(unchanged);
        require(initial!=null,"Valid isolated spacing configuration");
        for(StatusBarIconCatalog.Icon icon:StatusBarIconCatalog.all()){
            if(!StatusBarIconSpacingSpec.supported(icon.id))continue;
            String[] scopes=StatusBarHeaderSpacingObservation.child(icon.id)?new String[]{"all","control","notification"}
                    :"privacy.dot".equals(icon.id)?new String[]{"all","main","lock","control","notification"}:new String[]{"all"};
            for(String scope:scopes){open("asset/"+icon.id,scope);inspectSpacing(scope,icon.id,initial,true);close();}
            iconEntries++;
        }
        readback(StatusBarIconSpacingSpec.KEY,unchanged);
        for(String scope:new String[]{"all","control","notification"})linkedHeaderSpacing(scope,initial);
        privacySpacingMaintenance(initial);
        readback(StatusBarIconSpacingSpec.KEY,unchanged);
        open("asset/wifi","main");int[] actual=new int[4];
        for(int side=0;side<4;side++){final int index=side;actual[side]=touchSpacing("wifi",index,side+2);}
        StatusBarIconSpacingSpec next=StatusBarIconSpacingSpec.parse(unchanged).with("main","wifi",new StatusBarIconSpacingSpec.Insets(actual[0],actual[1],actual[2],actual[3]));
        require(unchanged.equals(config.get(StatusBarIconSpacingSpec.KEY)),"Asset spacing stays a draft before Apply");applyAssets();readback(StatusBarIconSpacingSpec.KEY,next.serialize());capture("wifi-four-boundaries");
        clickButton("此位置使用原厂边距");applyAssets();String original=next.with("main","wifi",StatusBarIconSpacingSpec.ZERO).serialize();readback(StatusBarIconSpacingSpec.KEY,original);
        clickButton("恢复继承共享边距");applyAssets();readback(StatusBarIconSpacingSpec.KEY,next.with("main","wifi",null).serialize());close();
        open("status_notifications",null);int start=touchSpacing("notifications",0,4);StatusBarIconSpacingSpec notification=StatusBarIconSpacingSpec.parse(config.get(StatusBarIconSpacingSpec.KEY)).with("all","notifications",new StatusBarIconSpacingSpec.Insets(start,0,0,0));
        readback(StatusBarIconSpacingSpec.KEY,notification.serialize());clickButton("恢复此图标原厂边距");readback(StatusBarIconSpacingSpec.KEY,notification.with("all","notifications",null).serialize());close();
    }
    /** Read the same real diagnostics/profile as the editor. Never manufacture capacity evidence. */
    private Integer headerCapacity(String scope,String id,StatusBarIconSpacingSpec spec){
        Display display=page.getWindowManager().getDefaultDisplay();if(display==null)return null;
        long now=SystemClock.elapsedRealtime(),epoch=System.currentTimeMillis()-now;int capacity=48;
        for(String surface:"all".equals(scope)?new String[]{"control","notification"}:new String[]{scope}){
            StatusBarHeaderSpacingObservation value=StatusBarHeaderSpacingObservation.parse(page.getSharedPreferences(AppConfig.DIAGNOSTICS,0)
                    .getString(StatusBarHeaderSpacingObservation.KEY+surface+"_"+display.getRotation(),""));
            if(value==null||!value.current(now,epoch,BuildConfig.VERSION_CODE,display.getDisplayId(),display.getRotation(),
                    Math.round(page.getResources().getDisplayMetrics().density*1000),Math.round(page.getResources().getConfiguration().fontScale*1000),
                    page.getResources().getConfiguration().getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?1:0))return null;
            int peer=StatusBarWifiSpacingPolicy.member(id)?spec.resolve(surface,StatusBarWifiSpacingPolicy.peer(id)).vertical():0;
            capacity=Math.min(capacity,Math.max(0,value.vertical-peer));
        }
        return capacity;
    }
    private StatusBarWifiSpacingObservation wifiCarrier(String scope,String id){
        if(!StatusBarWifiSpacingPolicy.member(id))return null;Display display=page.getWindowManager().getDefaultDisplay();if(display==null)return null;
        long now=SystemClock.elapsedRealtime();StatusBarWifiSpacingObservation nativeValue=null;
        for(String surface:"all".equals(scope)?new String[]{"control","notification"}:new String[]{scope}){
            StatusBarWifiSpacingObservation value=StatusBarWifiSpacingObservation.parse(page.getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString(StatusBarWifiSpacingObservation.key(surface,display.getRotation(),id),""));
            if(value==null||!value.profile.current(now,System.currentTimeMillis()-now,BuildConfig.VERSION_CODE,display.getDisplayId(),display.getRotation(),Math.round(page.getResources().getDisplayMetrics().density*1000),Math.round(page.getResources().getConfiguration().fontScale*1000),page.getResources().getConfiguration().getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?1:0))return null;
            if(!value.reason.equals("native"))return value;nativeValue=value;
        }return nativeValue;
    }
    private PrivacyDotSpacingObservation privacyCapacity(){
        Display display=page.getWindowManager().getDefaultDisplay();if(display==null)return null;
        PrivacyDotSpacingObservation value=PrivacyDotSpacingObservation.parse(page.getSharedPreferences(AppConfig.DIAGNOSTICS,0)
                .getString(PrivacyDotSpacingObservation.KEY+display.getRotation(),""));
        long now=SystemClock.elapsedRealtime();
        return value!=null&&value.current(now,System.currentTimeMillis()-now,BuildConfig.VERSION_CODE,display.getDisplayId(),display.getRotation(),
                Math.round(page.getResources().getDisplayMetrics().density*1000),Math.round(page.getResources().getConfiguration().fontScale*1000),
                page.getResources().getConfiguration().getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?1:0)?value:null;
    }
    private void spacingButton(View form,String label){Button found=button(form,label);require(found!=null&&found.isEnabled()&&shown(found),"Available spacing action: "+label);}
    private void inspectSpacing(String scope,String id,StatusBarIconSpacingSpec expected,boolean refresh)throws Exception{
        main(()->{
            View form=tag("icon-spacing:"+scope+":"+id);require(form!=null,"Spacing entry "+scope+"/"+id);expandAncestors(form);require(shown(form),"Spacing entry expands "+scope+"/"+id);
            if(tag("icon-spacing-asset-capacity:"+scope+":"+id)!=null){
                spacingButton(form,"刷新本机可用空间");if(refresh){require(button(form,"刷新本机可用空间").performClick(),"Refresh custom full-canvas capacity");form=tag("icon-spacing:"+scope+":"+id);require(form!=null,"Custom spacing survives refresh");expandAncestors(form);}
                View status=tag("icon-spacing-asset-capacity:"+scope+":"+id);require(status instanceof TextView&&shown(status),"Measured custom-canvas state visible");
                StatusBarIconSpacingSpec.Insets value=expected.resolve(scope,id);int[] edges={value.start,value.top,value.end,value.bottom};JSONArray observed=new JSONArray();
                for(int side=0;side<4;side++){View control=tag("icon-spacing-"+side+":"+id);require(control instanceof SeekBar,"Four real custom-canvas edge controls");SeekBar bar=(SeekBar)control;int max=-1;
                    for(int candidate=0;candidate<=24;candidate++){int[] next=edges.clone();next[side]=candidate;if(StatusBarWifiAssetSpacingEditor.accepts(page,scope,id,expected.with(scope,id,new StatusBarIconSpacingSpec.Insets(next[0],next[1],next[2],next[3]))))max=candidate;}
                    require(bar.getProgress()==edges[side],"Custom edge preserves exact saved/draft value");require(bar.getMax()==Math.max(edges[side],Math.max(0,max)),"Custom edge max matches current complete allocation");require(bar.isEnabled()==(max>=0&&(max>0||edges[side]>0)),"Unknown or exhausted custom capacity cannot enable ineffective controls");
                    observed.put(new JSONObject().put("side",side).put("max",bar.getMax()).put("enabled",bar.isEnabled()).put("progress",bar.getProgress()));
                }
                spacingButton(form,scope.equals("all")?"清除共享额外边距":"恢复继承共享边距");if(!scope.equals("all"))spacingButton(form,"此位置不增加额外边距");
                steps.put(new JSONObject().put("control","icon spacing").put("scope",scope).put("icon",id).put("branch","asset-isolated-canvases").put("boundaries",observed).put("pass",true).put("SystemUiVisualEffectVerified",false));return null;
            }
            boolean privacy="privacy.dot".equals(id),header=StatusBarHeaderSpacingObservation.child(id)&&Arrays.asList("all","control","notification").contains(scope);
            if(privacy&&Arrays.asList("control","notification").contains(scope)){
                for(int side=0;side<4;side++)require(tag("icon-spacing-"+side+":"+id)==null,"Hidden native privacy dot has no panel spacing slider");
                require(hasText(form,"系统在展开通知中心或控制中心时收起这个圆点"),"Privacy panel explains native visibility and applicable positions");
                steps.put(new JSONObject().put("control","icon spacing").put("scope",scope).put("icon",id).put("branch","native-dot-hidden-in-panel").put("pass",true));return null;
            }
            String reload=privacy?"刷新本机可用空间":header?"刷新本机纵向空间":StatusBarWifiSpacingPolicy.member(id)?"刷新本机图层状态":null;
            if(reload!=null){spacingButton(form,reload);if(refresh){require(button(form,reload).performClick(),"Refresh actual on-phone capacity");form=tag("icon-spacing:"+scope+":"+id);require(form!=null,"Spacing entry survives refresh");expandAncestors(form);}}
            StatusBarIconSpacingSpec.Insets edge=expected.resolve(scope,id);int[] values={edge.start,edge.top,edge.end,edge.bottom};
            Integer vertical=header?headerCapacity(scope,id,expected):null;PrivacyDotSpacingObservation measured=privacy?privacyCapacity():null;
            StatusBarWifiSpacingObservation carrier=wifiCarrier(scope,id);boolean wifiBlocked=StatusBarWifiSpacingPolicy.member(id)&&(carrier==null||!carrier.reason.equals("native"));
            if(StatusBarWifiSpacingPolicy.member(id)){View status=tag("icon-spacing-wifi-contract:"+scope+":"+id);require(status instanceof TextView&&shown(status),"WiFi carrier status always visible");String text=((TextView)status).getText().toString();require(carrier==null?text.contains("尚未取得")&&text.contains("刷新"):text.contains(carrier.explanation()),"WiFi carrier UI matches actual current observation");}
            boolean privacyAvailable=measured!=null&&measured.available(),privacyValid=privacyAvailable&&measured.accepts(edge);
            if(privacy){
                View status=tag("privacy-dot-spacing-capacity");require(status instanceof TextView&&shown(status),"Privacy capacity status remains visible");
                String text=((TextView)status).getText().toString();
                require(privacyAvailable?text.contains("横向两边合计 ≤ "+measured.horizontal+" dp")&&text.contains("纵向两边合计 ≤ "+measured.vertical+" dp")
                        :text.contains("尚未取得")&&text.contains("刷新"),"Privacy status reflects actual observation or an explicit refresh prerequisite");
                spacingButton(form,"此位置使用原厂边距");spacingButton(form,"all".equals(scope)?"移除共享边距设置":"恢复继承共享边距");
            }else{
                spacingButton(form,"all".equals(scope)?"恢复此图标原厂边距":"恢复继承共享边距");if(!"all".equals(scope))spacingButton(form,"此位置使用原厂边距");
                if(header){View status=tag("icon-spacing-vertical-capacity:"+scope+":"+id);require(status instanceof TextView&&shown(status),"Header capacity status visible");String text=((TextView)status).getText().toString();
                    require(vertical==null?text.contains("尚未取得")&&text.contains("刷新"):text.contains("顶部与底部合计最多 "+vertical+" dp"),"Header status reflects exact current capacity");}
            }
            JSONArray boundaries=new JSONArray();
            for(int side=0;side<4;side++){
                View found=tag("icon-spacing-"+side+":"+id);
                if(privacy&&!privacyValid){require(found==null,"Privacy sliders absent without usable measured capacity "+scope+"/"+side);continue;}
                require(found instanceof SeekBar,"Four real spacing sliders "+scope+"/"+id+"/"+side);SeekBar bar=(SeekBar)found;
                boolean verticalSide=side==1||side==3;
                int remaining=privacy?measured.maximum(side,values[(side+2)%4]):header&&verticalSide
                        ?vertical==null?values[side]:Math.max(0,Math.min(24,vertical-values[(side+2)%4])):24;
                int maximum=privacy?remaining:Math.max(remaining,values[side]);
                boolean enabled=!wifiBlocked&&(privacy||!header||!verticalSide||vertical!=null&&edge.vertical()<=vertical)&&remaining>0;
                require(bar.getMin()==0&&bar.getMax()==maximum,"Exact opposite-linked maximum "+scope+"/"+id+"/"+side+": expected "+maximum+", actual "+bar.getMax());
                require(bar.getProgress()==values[side],"Spacing retains resolved value "+scope+"/"+id+"/"+side);
                require(bar.isEnabled()==enabled,"Capacity controls enabled state "+scope+"/"+id+"/"+side);
                boundaries.put(new JSONObject().put("side",side).put("max",maximum).put("progress",bar.getProgress()).put("enabled",enabled));
            }
            steps.put(new JSONObject().put("control","icon spacing").put("scope",scope).put("icon",id).put("pass",true).put("boundaries",boundaries)
                    .put("branch",privacy?(privacyValid?"measured-sliders":privacyAvailable?"saved-combination-outside-capacity":"no-valid-observation"):header?(vertical==null?"vertical-disabled-without-observation":"measured-vertical-capacity"):"four-24dp-boundaries")
                    .put("headerVerticalCapacity",vertical==null?JSONObject.NULL:vertical).put("wifiCarrier",carrier==null?JSONObject.NULL:carrier.serialize()).put("privacyObservation",measured==null?JSONObject.NULL:measured.serialize()).put("SystemUiVisualEffectVerified",false));
            return null;
        });
    }
    private void linkedHeaderSpacing(String scope,StatusBarIconSpacingSpec initial)throws Exception{
        String id="wifi.signal";open("asset/"+id,scope);inspectSpacing(scope,id,initial,true);
        StatusBarWifiSpacingObservation carrier=main(()->wifiCarrier(scope,id));
        if(carrier==null||!carrier.reason.equals("native")){steps.put(new JSONObject().put("control","header opposite-edge touch").put("scope",scope).put("state","not-exercised").put("reason",carrier==null?"No current real WiFi carrier observation":carrier.explanation()));close();return;}
        Integer capacity=main(()->headerCapacity(scope,id,initial));
        if(capacity==null||capacity==0){steps.put(new JSONObject().put("control","header opposite-edge touch").put("scope",scope).put("state","not-exercised").put("reason",capacity==null?"No current real header capacity observation":"Current measured capacity is zero"));close();return;}
        int amount=Math.min(24,capacity);
        // Keep these edits as drafts: changing one edge must immediately reduce the other edge's exact maximum.
        touchSpacing(scope,id,1,amount);inspectSpacing(scope,id,initial.with(scope,id,new StatusBarIconSpacingSpec.Insets(0,amount,0,0)),false);
        touchSpacing(scope,id,1,0);touchSpacing(scope,id,3,amount);inspectSpacing(scope,id,initial.with(scope,id,new StatusBarIconSpacingSpec.Insets(0,0,0,amount)),false);
        require(initial.serialize().equals(config.get(StatusBarIconSpacingSpec.KEY)),"Header linked-edge touches remain drafts");close();
    }
    private void privacySpacingMaintenance(StatusBarIconSpacingSpec initial)throws Exception{
        String id="privacy.dot",scope="all";open("asset/"+id,scope);inspectSpacing(scope,id,initial,true);
        PrivacyDotSpacingObservation measured=main(this::privacyCapacity);
        if(measured!=null&&measured.accepts(initial.resolve(scope,id))){
            for(int axis=0;axis<2;axis++){
                int capacity=axis==0?measured.horizontal:measured.vertical;
                if(capacity==0){steps.put(new JSONObject().put("control","privacy opposite-edge touch").put("axis",axis).put("state","not-exercised").put("reason","Current measured capacity is zero"));continue;}
                int amount=Math.min(24,capacity);int[] values=new int[4];values[axis]=amount;
                touchSpacing(scope,id,axis,amount);inspectSpacing(scope,id,initial.with(scope,id,new StatusBarIconSpacingSpec.Insets(values[0],values[1],values[2],values[3])),false);
                touchSpacing(scope,id,axis,0);values[axis]=0;values[axis+2]=amount;
                touchSpacing(scope,id,axis+2,amount);inspectSpacing(scope,id,initial.with(scope,id,new StatusBarIconSpacingSpec.Insets(values[0],values[1],values[2],values[3])),false);
                clickButton("此位置使用原厂边距");inspectSpacing(scope,id,initial.with(scope,id,StatusBarIconSpacingSpec.ZERO),false);
            }
        }else steps.put(new JSONObject().put("control","privacy opposite-edge touch").put("state","not-exercised").put("reason","No current usable real privacy-dot capacity observation; no diagnostics were injected"));
        require(initial.serialize().equals(config.get(StatusBarIconSpacingSpec.KEY)),"Privacy linked-edge touches remain drafts");
        clickButton("此位置使用原厂边距");applyAssets();StatusBarIconSpacingSpec nativeSpec=initial.with(scope,id,StatusBarIconSpacingSpec.ZERO);readback(StatusBarIconSpacingSpec.KEY,nativeSpec.serialize());
        inspectSpacing(scope,id,nativeSpec,false);clickButton("移除共享边距设置");applyAssets();readback(StatusBarIconSpacingSpec.KEY,initial.with(scope,id,null).serialize());close();
    }
    private static boolean hasText(View view,String part){if(view instanceof TextView&&((TextView)view).getText().toString().contains(part))return true;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)if(hasText(((ViewGroup)view).getChildAt(i),part))return true;return false;}
    private int touchSpacing(String id,int side,int desired)throws Exception{
        return touchSpacing(page instanceof StatusBarAssetsActivity?"main":"all",id,side,desired);
    }
    private int touchSpacing(String scope,String id,int side,int desired)throws Exception{
        main(()->{View form=tag("icon-spacing:"+scope+":"+id);require(form!=null,"Spacing form "+id);expandAncestors(form);return null;});settle();
        return main(()->{SeekBar bar=(SeekBar)tag("icon-spacing-"+side+":"+id);require(bar!=null&&bar.isEnabled()&&shown(bar),"Active boundary slider");reveal(bar);
            require(desired>=bar.getMin()&&desired<=bar.getMax(),"Requested touch fits exact available capacity");
            float fraction=desired/(float)bar.getMax();if(bar.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL)fraction=1-fraction;
            float x=bar.getPaddingLeft()+fraction*(bar.getWidth()-bar.getPaddingLeft()-bar.getPaddingRight()),y=bar.getHeight()/2f;
            require(bar.getWidth()>bar.getPaddingLeft()+bar.getPaddingRight(),"Measured touch track");long now=SystemClock.uptimeMillis();
            int tick=0;for(int action:new int[]{MotionEvent.ACTION_DOWN,MotionEvent.ACTION_MOVE,MotionEvent.ACTION_UP}){MotionEvent event=MotionEvent.obtain(now,now+(tick++)*8,action,x,y,0);try{require(bar.dispatchTouchEvent(event),"Boundary control consumes actual touch "+action);}finally{event.recycle();}}
            require(bar.getProgress()==desired,"Boundary touch reached representative value "+desired);return bar.getProgress();});
    }
    private void priority()throws Exception{
        openKey(StatusBarIconOrderPolicy.ENABLED);toggle(StatusBarIconOrderPolicy.ENABLED,true);
        mutate(StatusBarIconOrderPolicy.LIMIT,"4",()->{SeekBar bar=described(root(),"最多系统提示图标（0 跟随原厂）",SeekBar.class);require(bar!=null,"Independent hint limit slider");reveal(bar);Bundle value=new Bundle();value.putFloat(AccessibilityNodeInfo.ACTION_ARGUMENT_PROGRESS_VALUE,4);require(bar.performAccessibilityAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SET_PROGRESS.getId(),value),"Real limit progress action");});
        List<String> order=new ArrayList<>(StatusBarIconOrderPolicy.order(config.get(StatusBarIconOrderPolicy.ORDER)));String id=order.get(1);StatusBarIconCatalog.Icon icon=StatusBarIconCatalog.find(id);
        clickButton("调整保留优先级");dialogClick("2. "+(icon==null?id:icon.title));dialogClick("置于首位");order.remove(1);order.add(0,id);String expected=String.join(",",order);readback(StatusBarIconOrderPolicy.ORDER,expected);
        test.sendKeyDownUpSync(KeyEvent.KEYCODE_BACK);settle();capture("hint-priority");
        toggle(StatusBarIconOrderPolicy.ENABLED,false);readback(StatusBarIconOrderPolicy.ORDER,expected);readback(StatusBarIconOrderPolicy.LIMIT,"4");
        toggle(StatusBarIconOrderPolicy.ENABLED,true);clickButton("恢复默认优先级与数量");readback(StatusBarIconOrderPolicy.ORDER,"");readback(StatusBarIconOrderPolicy.LIMIT,"0");close();
    }
    private void openKey(String key)throws Exception{
        String selected=ModuleHierarchy.featureRoute(key);require(selected!=null&&!selected.isEmpty(),"Public feature destination "+key);open(selected,null);
    }
    private void open(String requested,String scope)throws Exception{
        close();route=ModuleHierarchy.resolve(requested);Class<? extends Activity> type=route.startsWith("asset/")||"status_assets".equals(route)?StatusBarAssetsActivity.class:StatusBarPages.editor(route)?StatusBarSettingsActivity.class:EnhancementSettingsActivity.class;
        Intent intent=new Intent(context,type).putExtra(ModuleNavigation.EXTRA_ROUTE,route).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        ModuleHierarchy.Section section=ModuleHierarchy.group(route);if(section!=null)intent.putExtra("target",section.target);if(scope!=null)intent.putExtra("status_surface",scope);
        // Persist before Activity.onCreate: an uncaught production UI exception can kill
        // this process before instrumentation gets a chance to enter its own finally block.
        persistProgress("opening-public-page");
        page=test.startActivitySync(intent);settle();require(page!=null&&!page.isFinishing(),"Public page opened "+route);
        if(flag("c17_landscape")){
            main(()->{page.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);return null;});long deadline=SystemClock.uptimeMillis()+15000;
            do{Activity current=resumed;if(current!=null&&!current.isFinishing()&&route.equals(ModuleNavigation.route(current))&&current.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE){page=current;break;}SystemClock.sleep(50);}while(SystemClock.uptimeMillis()<deadline);
            require(page.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE,"Requested landscape reached "+route);settle();
        }
        main(()->{require(route.equals(ModuleNavigation.route(page)),"Canonical public route "+route);String expected=args.getString("c17_expected_font_scale");if(expected!=null)require(Math.abs(page.getResources().getConfiguration().fontScale-Float.parseFloat(expected))<.02f,"Expected externally selected font scale");measureLayout();return null;});persistProgress("public-page-opened");
    }
    private void measureLayout()throws Exception{
        View path=tag("page-path");require(path!=null&&path.getParent() instanceof ViewGroup,"Common path navigation");ViewGroup chrome=(ViewGroup)path.getParent();int position=chrome.indexOfChild(path);
        require(position+2<chrome.getChildCount(),"Common content after path and gap");View first=firstContent(chrome.getChildAt(position+2));require(first!=null,"First actual content");
        float density=page.getResources().getDisplayMetrics().density,gap=(top(first)-top(path)-path.getHeight())/density;
        require(gap>=7.5f&&gap<=12.5f,"Navigation-to-content is 8–12dp: "+route+" = "+gap);
        layouts.put(new JSONObject().put("route",route).put("gapDp",gap).put("density",density).put("fontScale",page.getResources().getConfiguration().fontScale).put("orientation",page.getResources().getConfiguration().orientation));
    }
    private static View firstContent(View view){
        if(view.getVisibility()!=View.VISIBLE)return null;if(view instanceof TextView||view instanceof LiquidGlassLayout)return view;
        if(view instanceof ViewGroup){ViewGroup parent=(ViewGroup)view;for(int i=0;i<parent.getChildCount();i++){View found=firstContent(parent.getChildAt(i));if(found!=null)return found;}return null;}return view.getHeight()>0?view:null;
    }
    private void toggle(String key,boolean enabled)throws Exception{
        mutate(key,enabled?"1":"0",()->{View found=tag("config:"+key);if(found==null)found=tag("feature-control:"+key);require(found instanceof Switch,"Production toggle "+key);Switch control=(Switch)found;expandAncestors(control);reveal(control);require(control.isEnabled(),"Enabled toggle "+key);if(control.isChecked()!=enabled)control.performClick();require(control.isChecked()==enabled,"Toggle state "+key);});
    }
    private void choice(String key,int selection)throws Exception{mutate(key,String.valueOf(selection),()->{View value=control(key);require(value instanceof Spinner,"Choice input "+key);expandAncestors(value);require(shown(value),"Choice is visible "+key);reveal(value);Spinner spinner=(Spinner)value;require(selection>=0&&selection<spinner.getCount(),"Choice range");spinner.setSelection(selection);});}
    private void input(String key,String value)throws Exception{String expected=ConfigSchema.normalize(key,value);require(expected!=null,"Valid representative "+key);mutate(key,expected,()->{View view=control(key);require(view instanceof EditText,"Text input "+key);expandAncestors(view);require(shown(view),"Input visible "+key);reveal(view);EditText field=(EditText)view;field.setText(value);inputValidation(key,field,false);});}
    private void invalid(String key,String value)throws Exception{
        String before=config.get(key);mutate(key,before,()->{EditText field=(EditText)control(key);expandAncestors(field);require(shown(field),"Invalid input exercised on visible control");reveal(field);field.setText(value);inputValidation(key,field,true);});
        inlineValidationLayout(key);input(key,before);
    }
    /** Ownership, rather than inheritance or tag presence, identifies the changed input path. */
    private boolean affectedEnhancement(String key,EditText field)throws Exception{
        if(!(page instanceof EnhancementSettingsActivity))return false;
        Object owned=get(page,"controls");return owned instanceof Map&&((Map<?,?>)owned).get(key)==field;
    }
    private void inputValidation(String key,EditText field,boolean invalid)throws Exception{
        if(!affectedEnhancement(key,field)){require((field.getError()!=null)==invalid,"Existing editor validation "+key);return;}
        View found=tag("input-error:"+key);require(found instanceof TextView,"Generic field has inline feedback "+key);TextView error=(TextView)found;
        require(field.getError()==null,"Generic field does not use an error popup "+key);
        require(error.getParent()==field.getParent()&&error.getParent() instanceof LinearLayout,"Inline feedback shares the field container "+key);
        LinearLayout row=(LinearLayout)error.getParent();require(row.getOrientation()==LinearLayout.VERTICAL&&row.indexOfChild(error)==row.indexOfChild(field)+1,"Feedback follows the field in vertical flow "+key);
        require(error.getAccessibilityLiveRegion()==View.ACCESSIBILITY_LIVE_REGION_POLITE,"Polite inline feedback "+key);
        if(invalid)require(shown(error)&&error.length()>0,"Invalid value has visible inline text "+key);
        else require(error.getVisibility()==View.GONE&&error.length()==0,"Valid value clears inline feedback "+key);
        AccessibilityNodeInfo node=field.createAccessibilityNodeInfo();require(node!=null,"Field accessibility node "+key);
        try{require(node.isContentInvalid()==invalid,"Field content-invalid semantics "+key);
            require(invalid?error.getText().toString().contentEquals(node.getError()==null?"":node.getError()):node.getError()==null,"Field error semantics follow inline text "+key);
            require(Objects.equals(field.getContentDescription(),node.getContentDescription()),"Field title remains its accessible description "+key);
        }finally{node.recycle();}
    }
    private void inlineValidationLayout(String key)throws Exception{
        boolean affected=main(()->{EditText field=(EditText)control(key);if(!affectedEnhancement(key,field))return false;reveal(tag("input-error:"+key));return true;});
        if(!affected)return;settle();
        main(()->{EditText field=(EditText)control(key);TextView error=(TextView)tag("input-error:"+key);inputValidation(key,field,true);
            require(error.getTop()>=field.getBottom(),"Inline error does not overlap its field "+key);
            require(field.getHeight()/page.getResources().getDisplayMetrics().density>=47.5f,"Field retains its 48dp target "+key);
            Rect visible=new Rect();require(error.getGlobalVisibleRect(visible)&&visible.width()==error.getWidth()&&visible.height()==error.getHeight(),"Complete inline feedback is visible after reveal "+key);
            android.text.Layout layout=error.getLayout();require(layout!=null&&layout.getLineCount()>0,"Inline text has a completed layout "+key);
            for(int line=0;line<layout.getLineCount();line++)require(layout.getEllipsisCount(line)==0,"Inline error is not ellipsized "+key);
            require(layout.getLineBottom(layout.getLineCount()-1)<=error.getHeight()-error.getCompoundPaddingTop()-error.getCompoundPaddingBottom(),"Inline text is not clipped vertically "+key);
            return null;});
    }
    private void mutate(String key,String expected,Action action)throws Exception{
        String before=config.get(key);JSONObject step=new JSONObject().put("route",route).put("key",key).put("before",before).put("expected",expected)
                .put("valueTransition",!Objects.equals(before,expected)).put("state","running").put("SystemUiVisualEffectVerified",false);steps.put(step);persistProgress("control-action");
        try{main(()->{action.run();return null;});readback(key,expected);step.put("pass",true).put("state","passed");persistProgress("control-readback-passed");}
        catch(Throwable error){step.put("pass",false).put("state","failed").put("error",android.util.Log.getStackTraceString(error));persistProgress("control-error");throw error;}
    }
    private void readback(String key,String expected)throws Exception{
        long deadline=SystemClock.uptimeMillis()+8000,stableSince=0;String saved="",runtime="";
        do{saved=config.get(key);Bundle result=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"snapshot",null,null);ConfigSnapshot snapshot=result==null?null:ConfigSnapshot.parse(result.getString("snapshot"));runtime=snapshot==null?null:snapshot.get(key);
            if(Objects.equals(expected,saved)&&Objects.equals(expected,runtime)){if(stableSince==0)stableSince=SystemClock.uptimeMillis();if(SystemClock.uptimeMillis()-stableSince>=650){test.waitForIdleSync();return;}}else stableSince=0;SystemClock.sleep(50);
        }while(SystemClock.uptimeMillis()<deadline);throw new AssertionError(key+" expected="+expected+" saved="+saved+" provider="+runtime);
    }
    private void visible(String key,boolean expected)throws Exception{settle();main(()->{View view=control(key);require(view!=null,"Conditional input exists "+key);require(shown(view)==expected,"Conditional visibility "+key+" expected "+expected);return null;});}
    private void unchanged(Map<String,String> values,String label)throws Exception{for(Map.Entry<String,String> entry:values.entrySet())require(entry.getValue().equals(config.get(entry.getKey())),label+": "+entry.getKey());steps.put(new JSONObject().put("control",label).put("keys",new JSONArray(values.keySet())).put("pass",true));}
    private Map<String,String> values(String...keys){Map<String,String> values=new LinkedHashMap<>();for(String key:keys)values.put(key,config.get(key));return values;}
    private Map<String,String> prefixValues(String prefix,String except){Map<String,String> result=new LinkedHashMap<>();for(Map.Entry<String,String> entry:config.snapshot().entrySet())if(entry.getKey().startsWith(prefix)&&!entry.getKey().equals(except))result.put(entry.getKey(),entry.getValue());return result;}
    private void clickControl(String key)throws Exception{main(()->{View view=control(key);require(view!=null,"Button input "+key);expandAncestors(view);require(shown(view),"Visible button "+key);reveal(view);require(view.performClick(),"Click button "+key);return null;});settle();}
    private void clickButton(String label)throws Exception{main(()->{Button button=button(root(),label);require(button!=null,"Action button "+label);expandAncestors(button);require(shown(button),"Visible action "+label);reveal(button);require(button.isEnabled()&&button.performClick(),"Click "+label);return null;});settle();}
    private void applyAssets()throws Exception{clickButton("应用到状态栏");settleWorker();}
    private void dialogClick(String label)throws Exception{
        long deadline=SystemClock.uptimeMillis()+5000;
        do{AccessibilityNodeInfo root=test.getUiAutomation().getRootInActiveWindow();if(root!=null){List<AccessibilityNodeInfo> nodes=root.findAccessibilityNodeInfosByText(label);for(AccessibilityNodeInfo node:nodes){if(node.getText()==null||!label.contentEquals(node.getText()))continue;AccessibilityNodeInfo current=node;while(current!=null&&!current.isClickable())current=current.getParent();if(current!=null&&current.isEnabled()&&current.performAction(AccessibilityNodeInfo.ACTION_CLICK)){settle();return;}}}SystemClock.sleep(50);}while(SystemClock.uptimeMillis()<deadline);
        throw new AssertionError("Visible dialog item not clickable: "+label);
    }
    private View control(String key)throws Exception{
        Object controls=get(page,"controls");View view=controls instanceof Map?(View)((Map<?,?>)controls).get(key):null;
        if(view==null){view=tag("config:"+key);if(view==null)view=tag("feature-control:"+key);}return view;
    }
    /** Expand only through the same disclosure controls users can click. */
    private void expandAncestors(View wanted){
        List<View> chain=new ArrayList<>();for(View current=wanted;current!=null;current=current.getParent() instanceof View?(View)current.getParent():null)chain.add(current);Collections.reverse(chain);
        for(View current:chain)if(current.getVisibility()==View.GONE&&current.getParent() instanceof ViewGroup){ViewGroup parent=(ViewGroup)current.getParent();ImageButton disclosure=null;
            for(int i=0;i<parent.getChildCount();i++){View sibling=parent.getChildAt(i);if(sibling==current)continue;disclosure=expandArrow(sibling);if(disclosure!=null)break;}
            if(disclosure!=null&&disclosure.isEnabled())disclosure.performClick();
        }
    }
    private static ImageButton expandArrow(View view){if(view instanceof ImageButton&&view.isEnabled()&&view.getContentDescription()!=null&&view.getContentDescription().toString().startsWith("展开"))return(ImageButton)view;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){ImageButton found=expandArrow(((ViewGroup)view).getChildAt(i));if(found!=null)return found;}return null;}
    private static boolean shown(View view){for(View current=view;current!=null;current=current.getParent() instanceof View?(View)current.getParent():null)if(current.getVisibility()!=View.VISIBLE)return false;return view!=null;}
    private static void reveal(View view){view.requestRectangleOnScreen(new Rect(0,0,view.getWidth(),view.getHeight()),true);}
    private View root(){return page.getWindow().getDecorView();}
    private View tag(String tag){return root().findViewWithTag(tag);}
    private static Button button(View root,String label){if(root instanceof Button&&label.contentEquals(((Button)root).getText()))return(Button)root;if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++){Button found=button(((ViewGroup)root).getChildAt(i),label);if(found!=null)return found;}return null;}
    private static <T extends View>T described(View root,String label,Class<T> type){if(type.isInstance(root)&&label.contentEquals(root.getContentDescription()==null?"":root.getContentDescription()))return type.cast(root);if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++){T found=described(((ViewGroup)root).getChildAt(i),label,type);if(found!=null)return found;}return null;}
    private static float top(View view){int[] location=new int[2];view.getLocationInWindow(location);return location[1];}
    private void capture(String name)throws Exception{settle();Bitmap image=test.getUiAutomation().takeScreenshot();require(image!=null,"Device screenshot available");File file=new File(directory,name+".png");try(FileOutputStream out=new FileOutputStream(file)){require(image.compress(Bitmap.CompressFormat.PNG,100,out),"Screenshot encoded");}finally{image.recycle();}screenshots.put(file.getAbsolutePath());}
    private void close()throws Exception{
        Activity old=page;if(old==null)return;main(()->{if(!old.isDestroyed())old.finish();return null;});test.waitForIdleSync();drain(old);page=null;test.waitForIdleSync();
    }
    private void finishAndDrainAll()throws Exception{
        List<Activity> all=main(()->new ArrayList<>(activities));main(()->{for(Activity old:all)if(!old.isDestroyed())old.finish();return null;});test.waitForIdleSync();for(Activity old:all)drain(old);test.waitForIdleSync();
    }
    private void settleWorker()throws Exception{test.waitForIdleSync();if(page!=null)drain(page);settle();}
    private void drain(Activity owner)throws Exception{
        if(owner instanceof EnhancementSettingsActivity){Map<?,?> editors=(Map<?,?>)get(owner,"editors");for(Object editor:editors.values())if(editor instanceof StatusBarEditorController)barrier((ExecutorService)get(editor,"worker"));barrier((ExecutorService)get(owner,"worker"));}
        if(owner instanceof StatusBarAssetsActivity)barrier((ExecutorService)get(owner,"WORKER"));
    }
    private void barrier(ExecutorService worker)throws Exception{if(worker.isShutdown())require(worker.awaitTermination(10,TimeUnit.SECONDS),"Pending saves drained");else worker.submit(()->{}).get(10,TimeUnit.SECONDS);}
    private void restoreBaseline()throws Exception{
        require(baselinePresent(),"Durable C17 baseline available");JSONObject saved=readJson(baseline),settings=saved.getJSONObject("settings");Map<String,String> values=new LinkedHashMap<>();
        for(Iterator<String> iterator=settings.keys();iterator.hasNext();){String key=iterator.next();values.put(key,settings.getString(key));}
        require(config.save(values).success,"Original configuration saved");require(values.equals(config.snapshot()),"Exact original configuration restored");
        JSONObject memory=saved.getJSONObject("nativeValueOverrides");SharedPreferences.Editor editor=context.getSharedPreferences("native_value_overrides",0).edit().clear();
        for(Iterator<String> iterator=memory.keys();iterator.hasNext();){String key=iterator.next();Object value=memory.get(key);if(value instanceof Boolean)editor.putBoolean(key,(Boolean)value);else if(value instanceof String)editor.putString(key,(String)value);else throw new AssertionError("Unexpected UI memory type; retain baseline: "+key);}
        require(editor.commit(),"Original input memory restored");
        Map<String,?> actualMemory=context.getSharedPreferences("native_value_overrides",0).getAll();require(actualMemory.size()==memory.length(),"Original input memory keys restored");
        for(Iterator<String> iterator=memory.keys();iterator.hasNext();){String key=iterator.next();require(Objects.equals(memory.get(key),actualMemory.get(key)),"Original input memory value restored: "+key);}
        JSONArray added=saved.optJSONArray("temporaryAssets");if(added!=null)for(int i=0;i<added.length();i++){String hash=added.getString(i);require(hash.matches("[0-9a-f]{64}"),"Validated test asset identifier");require(StatusBarAssetStore.deleteUnused(context,hash),"Only recorded test asset removed");}
        Files.deleteIfExists(new File(context.getCacheDir(),"c17-ui-invalid-image.fixture").toPath());Files.deleteIfExists(new File(context.getCacheDir(),"c17-ui-valid-image.png").toPath());
        new AtomicFile(baseline).delete();require(!baselinePresent(),"Completed baseline removed");
    }
    private boolean baselinePresent(){return baseline.isFile()||new File(baseline.getPath()+".bak").isFile();}
    private static JSONObject readJson(File file)throws Exception{return new JSONObject(new String(new AtomicFile(file).readFully(),StandardCharsets.UTF_8));}
    private static void durableWrite(File file,String value)throws IOException{AtomicFile target=new AtomicFile(file);FileOutputStream output=target.startWrite();try{output.write(value.getBytes(StandardCharsets.UTF_8));output.getFD().sync();target.finishWrite(output);}catch(IOException failure){target.failWrite(output);throw failure;}}
    private boolean flag(String key){Object value=args.get(key);return Boolean.TRUE.equals(value)||"true".equalsIgnoreCase(String.valueOf(value))||"1".equals(String.valueOf(value));}
    private void settle(){test.waitForIdleSync();SystemClock.sleep(180);}
    private static Object get(Object owner,String name)throws Exception{for(Class<?> type=owner.getClass();type!=null;type=type.getSuperclass())try{Field field=type.getDeclaredField(name);field.setAccessible(true);return field.get(owner);}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    private interface Action{void run()throws Exception;}
    private interface Main<T>{T run()throws Exception;}
    private <T>T main(Main<T> action)throws Exception{AtomicReference<T> value=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();test.runOnMainSync(()->{try{value.set(action.run());}catch(Throwable failure){error.set(failure);}});if(error.get()!=null)throw new AssertionError("Production UI operation failed",error.get());return value.get();}
    private void require(boolean condition,String message){assertions++;if(!condition)throw new AssertionError(message);}
    @Override public void onActivityCreated(Activity activity,Bundle saved){activities.add(activity);activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);}
    @Override public void onActivityResumed(Activity activity){resumed=activity;}
    @Override public void onActivityPaused(Activity activity){if(resumed==activity)resumed=null;}
    @Override public void onActivityDestroyed(Activity activity){if(resumed==activity)resumed=null;}
    @Override public void onActivityStarted(Activity activity){}
    @Override public void onActivityStopped(Activity activity){}
    @Override public void onActivitySaveInstanceState(Activity activity,Bundle saved){}
}
