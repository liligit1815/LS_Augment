package ls.augment.com;

import android.app.Instrumentation;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.AnimatedImageDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.AtomicFile;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.*;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/** Test APK only: actual user PNGs, independent live evidence, and crash-safe restoration. */
final class StatusBarUserAssetsDeviceCases {
    private static final String BASELINE="statusbar-user-assets-test-baseline.json";
    private static final String[] PACKS={"signal-state-test-fixture.zip","gentle-spin-1.0.0.zip","noto-sans-1.0.0.zip"};
    private static final String[] SIGNALS={"wifi.signal","mobile1.signal","mobile2.signal"};
    private static final String[] KEYS={StatusBarThemeSpec.KEY,StatusBarFontSpec.KEY,ConfigSchema.SYSTEMUI_MASTER,
            ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY,SystemUiOptions.PREFIX+"keyguard_statusbar_hide"};

    static JSONObject run(Instrumentation test,Bundle args)throws Exception {
        Context context=test.getTargetContext();String phase=args.getString("phase","observe");
        JSONObject result;
        switch(phase){
            case "decode":result=decode(context);break;
            case "apply":result=apply(context);break;
            case "restore":result=restore(context);break;
            case "observe":result=observe(test,args);break;
            case "screen_off":
                require(baseline(context).isFile(),"apply the user-asset fixture before its lifecycle test");
                result=StatusBarAssetsUiCases.screenOff(test);
                JSONObject resumed=awaitInventory(context,System.currentTimeMillis(),true);
                long deadline=SystemClock.elapsedRealtime()+15000;
                while(resumed.getJSONObject("runtime").optInt("playingAnimations")==0&&SystemClock.elapsedRealtime()<deadline){
                    SystemClock.sleep(250);resumed=inventory(context);
                }
                require(resumed.getJSONObject("runtime").optInt("playingAnimations")>0,"user-asset plus font animations resume after wake");
                result.put("resumed",resumed).put("evidenceType","actual SystemUI animation counters with imported font and signal PNGs");
                screenshot(test,context,"user-assets-resumed.png");break;
            default:throw new IllegalArgumentException("Unknown user-assets phase: "+phase);
        }
        result.put("phase",phase).put("restorePending",baseline(context).isFile());
        write(new File(folder(context),"user-assets-"+phase+"-latest.json"),result.toString(2));
        return result;
    }

    private static List<StatusBarAssetPack.Preview> inspect(Context context)throws Exception {
        List<StatusBarAssetPack.Preview> packs=new ArrayList<>();
        for(String name:PACKS){File file=new File(folder(context),name);require(file.isFile(),"Missing fixture: "+file);
            try(InputStream in=new FileInputStream(file)){packs.add(StatusBarAssetPack.inspect(in));}}
        require(packs.get(0).imageCount==9&&packs.get(0).animatedCount==0,"user package has 9 deduplicated static signal PNGs");
        require(packs.get(1).animatedCount==1,"gentle-spin contains one real frame animation");
        require(packs.get(2).fontCount==1,"Noto pack contains one real font");return packs;
    }

    private static JSONObject decode(Context context)throws Exception {
        Map<String,String> before=new AppConfig(context).snapshot();List<StatusBarAssetPack.Preview> packs=inspect(context);
        JSONArray decoded=new JSONArray();Bitmap sheet=Bitmap.createBitmap(840,560,Bitmap.Config.ARGB_8888);
        Canvas canvas=new Canvas(sheet);canvas.drawColor(Color.rgb(24,24,24));Paint text=new Paint(Paint.ANTI_ALIAS_FLAG);text.setColor(Color.WHITE);text.setTextSize(21);
        int index=0,checks=0;
        try{
            for(int packIndex=0;packIndex<PACKS.length;packIndex++)try(ZipFile zip=new ZipFile(new File(folder(context),PACKS[packIndex]))){
                JSONObject manifest=new JSONObject(new String(read(zip,zip.getEntry("manifest.json")),StandardCharsets.UTF_8));
                JSONObject images=manifest.getJSONObject("images");Iterator<String> hashes=images.keys();
                while(hashes.hasNext()){
                    String hash=hashes.next();byte[] bytes=read(zip,zip.getEntry(images.getString(hash)));
                    StatusBarAssetStore.Asset header=StatusBarAssetStore.validate(hash,bytes);
                    Drawable drawable=StatusBarAssetStore.decode(bytes,64);
                    require(header.animated==(drawable instanceof AnimatedImageDrawable),"Android decoder retains animation classification");checks++;
                    decoded.put(new JSONObject().put("pack",PACKS[packIndex]).put("hash",hash).put("width",header.width).put("height",header.height).put("animated",header.animated));
                    if(drawable instanceof AnimatedImageDrawable)((AnimatedImageDrawable)drawable).stop();
                    drawable.setCallback(null);
                }
                if(packIndex==0){
                    StatusBarThemeSpec theme=StatusBarThemeSpec.parse(packs.get(0).theme);
                    for(String id:SIGNALS)for(int level=0;level<=4;level++){
                        String state="level"+level;StatusBarAssetPolicy.Resolution match=StatusBarAssetPolicy.resolve(theme,id,new String[]{state},"whole","main");
                        require(match.binding!=null&&match.binding.state.equals(state),"user signal state resolves exactly");checks++;
                        Drawable drawable=StatusBarAssetStore.decode(read(zip,zip.getEntry(images.getString(match.binding.asset))),64);
                        int col=index%5,row=index/5,x=col*168+50,y=row*140+32;
                        drawable.setBounds(x,y,x+64,y+64);drawable.draw(canvas);drawable.setCallback(null);
                        canvas.drawText(id.replace(".signal","")+" "+level,col*168+8,y+96,text);index++;
                    }
                    for(String id:SIGNALS)for(String state:new String[]{"disconnected","no_internet","unknown"}){
                        String[] states=(state.equals("disconnected")||state.equals("no_internet"))?new String[]{state,"level3"}:new String[]{state};
                        require(StatusBarAssetPolicy.resolve(theme,id,states,"whole","main").binding==null,"unmapped and exceptional states keep native information: "+id+" / "+state);checks++;
                    }
                    // This device's prepared SIM fixture explicitly maps its sixth
                    // native level to the supplied full-signal artwork. Wi-Fi has
                    // only five levels. Preserve both explicit and absent cases.
                    for(String id:SIGNALS){
                        StatusBarThemeSpec.Binding explicit=null;
                        for(StatusBarThemeSpec.Binding candidate:theme.entries())
                            if(candidate.id.equals(id)&&candidate.state.equals("level5")&&candidate.layer.equals("whole"))explicit=candidate;
                        StatusBarAssetPolicy.Resolution actual=StatusBarAssetPolicy.resolve(theme,id,new String[]{"level5"},"whole","main");
                        require(explicit==null?actual.binding==null:actual.binding!=null&&actual.binding.state.equals("level5")&&actual.binding.asset.equals(explicit.asset),
                                "sixth native signal level follows its explicit fixture mapping, otherwise stays native: "+id);checks++;
                    }
                }
                if(packIndex==2){JSONObject fonts=manifest.getJSONObject("fontFiles");Iterator<String> keys=fonts.keys();
                    while(keys.hasNext()){String hash=keys.next();byte[] data=read(zip,zip.getEntry(fonts.getString(hash)));ManagedFont.validate(hash,data);
                        ByteBuffer buffer=ByteBuffer.allocateDirect(data.length);buffer.put(data).flip();
                        android.graphics.fonts.Font font=new android.graphics.fonts.Font.Builder(buffer).build();
                        Typeface face=new Typeface.CustomFallbackBuilder(new android.graphics.fonts.FontFamily.Builder(font).build()).build();
                        text.setTypeface(face);require(text.measureText("12:34 5G 99%")>0,"real Android font renders statusbar characters");checks++;
                        canvas.drawText("Noto Sans: 12:34  5G  99%  32 KB/s",18,500,text);
                    }
                }
            }
            try(OutputStream out=new FileOutputStream(new File(folder(context),"user-assets-decoded-samples.png"))){sheet.compress(Bitmap.CompressFormat.PNG,100,out);}
        }finally{sheet.recycle();}
        require(before.equals(new AppConfig(context).snapshot()),"decode must not modify configuration");
        return new JSONObject().put("success",true).put("assertions",checks).put("decoded",decoded).put("settingsUnchanged",true)
                .put("evidenceType","actual Android decode and pure state-policy checks; not proof every radio level occurred on SystemUI")
                .put("sourceLimitations",new JSONArray(Arrays.asList("Original user ZIP has no RedMagicDuo manifest; normalized test fixture is separate","All user files are static PNG; animation and font use repository fixtures","Wi-Fi level3 and level4 source bytes are identical","Battery sprite strips are not automatically split; six 6000px source images exceed 4096px decoder limit")));
    }

    private static JSONObject apply(Context context)throws Exception {
        require(!baseline(context).exists(),"Restore pending user-asset baseline before applying again");
        List<StatusBarAssetPack.Preview> packs=inspect(context);AppConfig config=new AppConfig(context);
        JSONObject saved=new JSONObject(),values=new JSONObject();for(String key:KEYS)values.put(key,config.get(key));
        Set<String> newImages=new LinkedHashSet<>(),newFonts=new LinkedHashSet<>(),newNotices=new LinkedHashSet<>();
        for(StatusBarAssetPack.Preview pack:packs){
            for(StatusBarThemeSpec.Binding b:StatusBarThemeSpec.parse(pack.theme).entries()){
                if(!StatusBarAssetStore.file(context,b.asset).exists())newImages.add(b.asset);
                if(!notice(context,b.asset).exists())newNotices.add(b.asset);
            }
            for(String hash:StatusBarFontSpec.parse(pack.fonts).hashes()){
                if(!ManagedFont.file(context,hash).exists())newFonts.add(hash);
                if(!notice(context,hash).exists())newNotices.add(hash);
            }
        }
        StatusBarThemeSpec theme=StatusBarThemeSpec.parse(packs.get(0).theme);
        String animation=StatusBarThemeSpec.parse(packs.get(1).theme).entries().get(0).asset;
        // Separate parent decorations leave each .signal row's exact matched state unambiguous.
        JSONArray animationTargets=new JSONArray();
        for(String id:new String[]{"wifi","bluetooth","connectivity"})
            {theme=theme.with(new StatusBarThemeSpec.Binding(id,"default","background",animation,true,100,0,0,100,false));animationTargets.put(id);}
        String observedAnimationTarget="";
        String fontHash=StatusBarFontSpec.parse(packs.get(2).fonts).hashes().iterator().next();
        String fonts=StatusBarFontSpec.empty().with("global","font:"+fontHash).serialize();
        Map<String,String> next=new LinkedHashMap<>();next.put(StatusBarThemeSpec.KEY,theme.serialize());next.put(StatusBarFontSpec.KEY,fonts);
        next.put(ConfigSchema.SYSTEMUI_MASTER,"1");next.put(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY,"0");next.put(SystemUiOptions.PREFIX+"keyguard_statusbar_hide","0");
        saved.put("values",values).put("newImages",new JSONArray(newImages)).put("newFonts",new JSONArray(newFonts)).put("newNotices",new JSONArray(newNotices))
                .put("fixtureTheme",theme.serialize()).put("fixtureFonts",fonts).put("animationTargets",animationTargets).put("observedAnimationTarget",observedAnimationTarget).put("appliedAt",System.currentTimeMillis());
        write(baseline(context),saved.toString());
        try{
            for(StatusBarAssetPack.Preview pack:packs)StatusBarAssetPack.install(context,pack);
            long activatedAt=System.currentTimeMillis();
            require(config.save(next).success,"Could not apply user-asset fixture");
            // An empty baseline does not keep the inventory engine active. First
            // activate the initial fixture, then select from a fresh live scan.
            JSONObject observed=awaitInventory(context,activatedAt,true);
            String activeSurface=observed.getJSONObject("runtime").optString("activeSurface");
            JSONObject surfaces=observed.optJSONObject("surfaces");JSONArray visibleRows=surfaces==null?null:surfaces.optJSONArray(activeSurface);
            if(visibleRows!=null)for(String candidate:new String[]{"volume","cooling_fan","battery"}){
                boolean hasWhole=false;for(StatusBarThemeSpec.Binding binding:theme.entries())if(binding.id.equals(candidate)&&binding.layer.equals("whole"))hasWhole=true;
                if(hasWhole)continue;
                for(int i=0;i<visibleRows.length();i++){JSONObject row=visibleRows.getJSONObject(i);
                    if(candidate.equals(row.optString("id"))&&"visible".equals(row.optString("state"))&&"whole_layers".equals(row.optString("capability"))){observedAnimationTarget=candidate;break;}}
                if(!observedAnimationTarget.isEmpty())break;
            }
            require(!observedAnimationTarget.isEmpty(),"Animation fixture prerequisite failed after fresh enabled scan: no visible supported volume/cooling_fan/battery target without whole-image artwork; restoring baseline");
            theme=theme.with(new StatusBarThemeSpec.Binding(observedAnimationTarget,"default","background",animation,true,100,0,0,100,false));
            animationTargets.put(observedAnimationTarget);next.put(StatusBarThemeSpec.KEY,theme.serialize());
            saved.put("fixtureTheme",theme.serialize()).put("animationTargets",animationTargets).put("observedAnimationTarget",observedAnimationTarget)
                    .put("animationTargetObservedAt",observed.getLong("observedAt")).put("appliedAt",System.currentTimeMillis());
            write(baseline(context),saved.toString());
            require(config.save(next).success,"Could not apply verified visible animation target");
            require(ManagedFont.load(context,"font:"+fontHash)!=null,"Imported font loads through actual config provider");
        }catch(Exception|AssertionError error){try{restore(context);}catch(Exception|AssertionError restoration){error.addSuppressed(restoration);}throw error;}
        return new JSONObject().put("success",true).put("theme",theme.serialize()).put("fonts",fonts).put("animationTargets",animationTargets).put("observedAnimationTarget",observedAnimationTarget).put("appliedAt",saved.getLong("appliedAt"))
                .put("evidenceType","Actual pack import and config save; live rendering is checked separately by observe");
    }

    private static JSONObject observe(Instrumentation test,Bundle args)throws Exception {
        Context context=test.getTargetContext();require(baseline(context).isFile(),"No active user-asset fixture");
        JSONObject saved=new JSONObject(new String(Files.readAllBytes(baseline(context).toPath()),StandardCharsets.UTF_8));AppConfig config=new AppConfig(context);
        require(config.get(StatusBarThemeSpec.KEY).equals(saved.getString("fixtureTheme"))&&config.get(StatusBarFontSpec.KEY).equals(saved.getString("fixtureFonts")),"Fixture artwork and font configuration changed before observation");
        long after=Math.max(saved.getLong("appliedAt"),Long.parseLong(args.getString("notBefore","0")));
        JSONObject snapshot=awaitInventory(context,after,true);String surface=snapshot.getJSONObject("runtime").optString("activeSurface","main");
        JSONArray rows=snapshot.getJSONObject("surfaces").optJSONArray(surface),checks=new JSONArray(),missing=new JSONArray();
        if(rows==null)rows=new JSONArray();StatusBarThemeSpec theme=StatusBarThemeSpec.parse(config.get(StatusBarThemeSpec.KEY));
        Set<String> applied=new LinkedHashSet<>(),visible=new LinkedHashSet<>();int failures=0,fallbacks=0;
        for(int i=0;i<rows.length();i++){
            JSONObject row=rows.getJSONObject(i);String id=row.optString("id");if(!Arrays.asList(SIGNALS).contains(id))continue;
            JSONArray sourceStates=row.optJSONArray("states");String[] states=new String[sourceStates==null?0:sourceStates.length()];for(int s=0;s<states.length;s++)states[s]=sourceStates.optString(s);
            StatusBarAssetPolicy.Resolution expected=StatusBarAssetPolicy.resolve(theme,id,states,"whole",surface);
            String outcome="not_visible";boolean isVisible=row.optString("state").equals("visible");
            if(isVisible){visible.add(id);
                if(!row.optString("capability").equals("whole_layers"))outcome="unverified_observe_only";
                else if(expected.binding==null){
                    boolean nativeResult=row.optString("application").startsWith("native_")&&row.optString("matchedAsset").isEmpty();
                    outcome=nativeResult?"native_fallback_verified":"fallback_mismatch";if(nativeResult)fallbacks++;else failures++;
                }else{
                    boolean matches=row.optString("application").equals("applied")&&row.optString("matchedAsset").equals(expected.binding.asset)&&row.optString("matchedState").equals(expected.binding.state);
                    outcome=matches?"actual_draw_verified":"expected_asset_not_drawn";if(matches)applied.add(id);else failures++;
                }
            }
            checks.put(new JSONObject().put("row",row).put("expectedPolicy",expected.code).put("expectedState",expected.binding==null?JSONObject.NULL:expected.binding.state).put("outcome",outcome));
        }
        String requested=args.getString("requireSignals","");for(String id:requested.split(","))if(!id.isEmpty()&&!applied.contains(id))missing.put(id);
        String wifi=args.getString("expectWifi","");boolean wifiExpected=!(wifi.equals("absent")&&visible.contains("wifi.signal"))&&!(wifi.equals("mapped")&&!applied.contains("wifi.signal"));
        int animations=snapshot.getJSONObject("runtime").optInt("playingAnimations");boolean animationExpected=!Boolean.parseBoolean(args.getString("requireAnimations","false"))||animations>0;
        require(animations<=8,"Visible animations exceed runtime budget");
        boolean passed=failures==0&&missing.length()==0&&wifiExpected&&animationExpected;
        String label=args.getString("label","observation").replaceAll("[^A-Za-z0-9_-]","_");screenshot(test,context,"user-assets-"+label+".png");
        JSONObject result=new JSONObject().put("success",passed).put("liveSignalChecks",checks).put("appliedSignals",new JSONArray(applied)).put("visibleSignals",new JSONArray(visible))
                .put("nativeFallbacks",fallbacks).put("mismatches",failures).put("missingRequiredSignals",missing).put("wifiExpectationMet",wifiExpected).put("animationExpectationMet",animationExpected)
                .put("inventory",snapshot).put("evidenceType","Actual SystemUI inventory from current surface; only actual_draw_verified/native_fallback_verified rows count as live evidence");
        write(new File(folder(context),"user-assets-"+label+".json"),result.toString(2));
        if(Boolean.parseBoolean(args.getString("strict","false")))require(passed,"User asset live observation failed: "+result);
        return result;
    }

    private static JSONObject restore(Context context)throws Exception {
        require(baseline(context).isFile(),"No user-asset baseline to restore");JSONObject saved=new JSONObject(new String(Files.readAllBytes(baseline(context).toPath()),StandardCharsets.UTF_8));
        JSONObject values=saved.getJSONObject("values");Map<String,String> next=new LinkedHashMap<>();for(String key:KEYS)next.put(key,values.getString(key));
        require(new AppConfig(context).save(next).success,"Could not restore original user assets");
        Map<String,String> actual=new AppConfig(context).snapshot();for(String key:KEYS)require(Objects.equals(actual.get(key),next.get(key)),"Restored key differs: "+key);
        JSONArray retained=new JSONArray();Set<String> usedImages=StatusBarAssetReferences.statusbarIcons(actual),usedFonts=StatusBarAssetReferences.fonts(actual);
        for(int i=0;i<saved.getJSONArray("newImages").length();i++){String hash=saved.getJSONArray("newImages").getString(i);if(usedImages.contains(hash))retained.put(hash);else StatusBarAssetStore.deleteUnused(context,hash);}
        for(int i=0;i<saved.getJSONArray("newFonts").length();i++){String hash=saved.getJSONArray("newFonts").getString(i);File file=ManagedFont.file(context,hash);if(usedFonts.contains(hash))retained.put(hash);else require(!file.exists()||file.delete(),"Could not remove temporary font");}
        for(int i=0;i<saved.getJSONArray("newNotices").length();i++){String hash=saved.getJSONArray("newNotices").getString(i);File file=notice(context,hash);if(!usedImages.contains(hash)&&!usedFonts.contains(hash))require(!file.exists()||file.delete(),"Could not remove temporary notice");}
        require(baseline(context).delete(),"Could not clear completed baseline");
        return new JSONObject().put("success",true).put("settingsRestored",true).put("restoredKeys",new JSONArray(Arrays.asList(KEYS))).put("retainedNowReferencedResources",retained);
    }

    private static JSONObject inventory(Context context)throws Exception {
        Bundle response=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"statusbar_inventory_get",null,null);
        String payload=response==null?"":response.getString("payload","");return payload.isEmpty()?new JSONObject():new JSONObject(payload);
    }
    private static JSONObject awaitInventory(Context context,long after,boolean interactive)throws Exception {
        long until=SystemClock.elapsedRealtime()+16000;JSONObject last=new JSONObject();
        do{last=inventory(context);JSONObject runtime=last.optJSONObject("runtime");
            if(last.optLong("observedAt")>=after&&runtime!=null&&runtime.optBoolean("enabled")&&runtime.optBoolean("interactive")==interactive)return last;
            SystemClock.sleep(250);
        }while(SystemClock.elapsedRealtime()<until);throw new AssertionError("No fresh enabled runtime inventory: "+last);
    }
    private static File folder(Context context){File f=context.getExternalFilesDir("statusbar-asset-tests");require(f!=null&&(f.isDirectory()||f.mkdirs()),"Fixture directory unavailable");return f;}
    private static File baseline(Context context){return new File(context.getFilesDir(),BASELINE);}
    private static File notice(Context context,String hash){require(hash.matches("[0-9a-f]{64}"),"Invalid resource hash");return new File(new File(context.getFilesDir(),"statusbar-pack-notices"),hash+".json");}
    private static byte[] read(ZipFile zip,ZipEntry entry)throws IOException {if(entry==null)throw new IOException("Missing ZIP entry");try(InputStream in=zip.getInputStream(entry)){return in.readAllBytes();}}
    private static void write(File file,String content)throws IOException {AtomicFile atomic=new AtomicFile(file);FileOutputStream out=atomic.startWrite();try{out.write(content.getBytes(StandardCharsets.UTF_8));atomic.finishWrite(out);}catch(IOException error){atomic.failWrite(out);throw error;}}
    private static void screenshot(Instrumentation test,Context context,String name)throws IOException {Bitmap bitmap=test.getUiAutomation(android.app.UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES).takeScreenshot();require(bitmap!=null,"Screenshot unavailable");try(OutputStream out=new FileOutputStream(new File(folder(context),name))){bitmap.compress(Bitmap.CompressFormat.PNG,100,out);}finally{bitmap.recycle();}}
    private static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
}
