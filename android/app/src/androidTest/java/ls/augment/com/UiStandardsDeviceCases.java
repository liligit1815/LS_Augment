package ls.augment.com;

import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Switch;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.LinkedHashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Read-only audit of secondary entry points omitted from the ordinary route catalogue. */
final class UiStandardsDeviceCases implements Application.ActivityLifecycleCallbacks {
    private final Instrumentation test;
    private final Context context;
    private final File directory;
    private final JSONArray pages=new JSONArray();
    private final JSONArray screenshots=new JSONArray();
    private final List<Activity> activities=new ArrayList<>();
    private final boolean landscape;
    private boolean compliant=true;
    private boolean landscapeRecreated;
    private volatile Activity resumed;
    private Activity current;
    private Activity landscapeBackdrop;
    private UiStandardsDeviceCases(Instrumentation test,boolean landscape){
        this.test=test;context=test.getTargetContext();this.landscape=landscape;
        directory=new File(context.getExternalFilesDir(null),"ui-standards");
    }
    static JSONObject run(Instrumentation test,boolean strict,boolean landscape)throws Exception{
        return new UiStandardsDeviceCases(test,landscape).execute(strict);
    }
    private JSONObject execute(boolean strict)throws Exception{
        if(!directory.isDirectory()&&!directory.mkdirs())throw new IllegalStateException("Cannot create UI audit directory");
        SharedPreferences prefs=context.getSharedPreferences(AppConfig.PREFS,0);
        Map<String,?> before=new LinkedHashMap<>(prefs.getAll());
        SharedPreferences consent=context.getSharedPreferences("ls_augment_consent",0);
        Map<String,?> originalConsent=new LinkedHashMap<>(consent.getAll());
        File fixture=new File(context.getCacheDir(),"ui-standards-crop-fixture.png");
        JSONObject result=new JSONObject().put("version",BuildConfig.VERSION_NAME).put("pages",pages)
                .put("featureControlsChanged",false).put("fixtureImageOnly",true)
                .put("landscapeRequested",landscape).put("screenshots",screenshots);
        Application app=(Application)context.getApplicationContext();
        app.registerActivityLifecycleCallbacks(this);
        Throwable failure=null;
        try{
            if(!consent.edit().putInt("accepted_version",ModuleLegal.VERSION).commit())throw new AssertionError("Cannot prepare temporary consent");
            capturePage(SupportActivity.class,"01-support","support-description");
            capturePage(LauncherCompatibilityActivity.class,"02-launcher-compatibility",null);
            Bitmap bitmap=Bitmap.createBitmap(128,128,Bitmap.Config.ARGB_8888);
            new Canvas(bitmap).drawColor(Color.rgb(45,130,200));
            try(FileOutputStream output=new FileOutputStream(fixture)){bitmap.compress(Bitmap.CompressFormat.PNG,100,output);}finally{bitmap.recycle();}
            current=launch(new Intent(context,IconCropActivity.class).setData(Uri.fromFile(fixture))
                    .putExtra("gesture_icon",true).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            settle();pages.put(measureDetail(current,"03-icon-crop",null));capture("03-icon-crop");close();
            for(String kind:new String[]{"launcher","tile"}){
                current=launch(new Intent(context,IconCropActivity.class).setData(Uri.fromFile(fixture))
                        .putExtra("tile_icon","tile".equals(kind)).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                settle();JSONObject crop=measureDetail(current,"03-icon-crop-"+kind,null);
                crop.put("route",main(()->ModuleNavigation.route(current)));
                pages.put(crop);capture("03-icon-crop-"+kind);close();
            }
            current=launch(new Intent(context,ExtraDimActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            settle();SystemClock.sleep(1200);settle();
            JSONObject dim=main(()->{
                View decor=current.getWindow().getDecorView();Switch toggle=find(decor,Switch.class);
                float density=current.getResources().getDisplayMetrics().density;
                boolean glass=find(decor,LiquidGlassLayout.class)!=null;
                float track=toggle==null||toggle.getTrackDrawable()==null?0:toggle.getTrackDrawable().getIntrinsicHeight()/density;
                float thumb=toggle==null||toggle.getThumbDrawable()==null?0:toggle.getThumbDrawable().getIntrinsicWidth()/density;
                boolean valid=glass&&Math.abs(track-28)<1&&Math.abs(thumb-22)<1;
                compliant&=valid;
                return geometry(current,new JSONObject().put("screen","04-extra-dim").put("activity",current.getClass().getSimpleName())
                        .put("floatingDialog",true).put("commonGlassSurface",glass).put("trackHeightDp",track)
                        .put("thumbWidthDp",thumb).put("compliant",valid));
            });
            pages.put(dim);capture("04-extra-dim");checkDimFolds(dim);close();
            capturePage(ModuleScopeActivity.class,"05-scope",null);
            current=launch(new Intent(context,ContributorsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            settle();SystemClock.sleep(1800);settle();
            JSONObject contributors=measureDetail(current,"06-contributors",null);
            measureEmbeddedContributors(current,contributors);
            pages.put(contributors);capture("06-contributors");close();
            for(String tab:new String[]{"home","settings","about"}){
                current=launch(new Intent(context,SettingsActivity.class).putExtra("tab",tab).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                settle();SystemClock.sleep(1500);settle();
                pages.put(main(()->geometry(current,new JSONObject().put("screen","07-"+tab).put("primaryTab",true)
                        .put("fontScale",current.getResources().getConfiguration().fontScale))));
                capture("07-"+tab);close();
            }
        }catch(Throwable error){failure=error;result.put("failure",android.util.Log.getStackTraceString(error));}
        finally{
            try{closeAll();}catch(Throwable cleanup){if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);}
            finally{app.unregisterActivityLifecycleCallbacks(this);}
            fixture.delete();
            SharedPreferences.Editor restore=consent.edit().clear();
            for(Map.Entry<String,?> entry:originalConsent.entrySet()){
                Object value=entry.getValue();String key=entry.getKey();
                if(value instanceof Integer)restore.putInt(key,(Integer)value);
                else if(value instanceof Boolean)restore.putBoolean(key,(Boolean)value);
                else if(value instanceof Long)restore.putLong(key,(Long)value);
                else if(value instanceof Float)restore.putFloat(key,(Float)value);
                else if(value instanceof String)restore.putString(key,(String)value);
                else if(value instanceof java.util.Set)restore.putStringSet(key,new java.util.HashSet<>((java.util.Set<String>)value));
            }
            boolean restored=restore.commit()&&originalConsent.equals(consent.getAll());
            boolean unchanged=before.equals(prefs.getAll());
            result.put("configurationUnchanged",unchanged).put("consentRestoredExactly",restored).put("compliant",compliant)
                    .put("captureCompleted",failure==null).put("directory",directory.getAbsolutePath())
                    .put("landscapeRecreated",landscapeRecreated);
            if(!unchanged&&failure==null)failure=new AssertionError("UI audit changed configuration");
            if(!restored&&failure==null)failure=new AssertionError("UI audit did not restore consent");
            Files.write(new File(directory,"report.json").toPath(),result.toString(2).getBytes(StandardCharsets.UTF_8));
        }
        if(failure!=null)throw new AssertionError("UI standards capture failed",failure);
        if(strict&&!compliant)throw new AssertionError("UI standards defects remain; inspect ui-standards/report.json");
        return result;
    }
    private void capturePage(Class<? extends Activity> type,String name,String tag)throws Exception{
        current=launch(new Intent(context,type).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        settle();pages.put(measureDetail(current,name,tag));capture(name);close();
    }
    private JSONObject measureDetail(Activity activity,String name,String contentTag)throws Exception{return main(()->{
        View root=activity.getWindow().getDecorView(),path=root.findViewWithTag("page-path");
        JSONObject entry=geometry(activity,new JSONObject().put("screen",name).put("activity",activity.getClass().getSimpleName())
                .put("density",activity.getResources().getDisplayMetrics().density)
                .put("fontScale",activity.getResources().getConfiguration().fontScale).put("commonBreadcrumb",path!=null));
        if(path==null){compliant=false;return entry.put("compliant",false).put("issue","missing common detail chrome");}
        View content=contentTag==null?null:root.findViewWithTag(contentTag);
        if(content==null){ViewGroup chrome=(ViewGroup)path.getParent();content=firstContent(chrome.getChildAt(chrome.indexOfChild(path)+2));}
        float density=activity.getResources().getDisplayMetrics().density;
        float gap=(top(content)-top(path)-path.getHeight())/density;
        boolean valid=gap>=7.5f&&gap<=12.5f;compliant&=valid;
        return entry.put("pathBottomPx",top(path)+path.getHeight()).put("firstContentTopPx",top(content))
                .put("firstContentClass",content.getClass().getSimpleName()).put("contentGapDp",gap).put("compliant",valid);
    });}
    private static View firstContent(View view){
        if(view instanceof LiquidGlassLayout||view instanceof TextView||!(view instanceof ViewGroup))return view;
        ViewGroup group=(ViewGroup)view;
        for(int i=0;i<group.getChildCount();i++){View child=group.getChildAt(i);if(child.getVisibility()==View.VISIBLE&&child.getHeight()>0)return firstContent(child);}
        return view;
    }
    private void measureEmbeddedContributors(Activity activity,JSONObject entry)throws Exception{
        android.webkit.WebView web=main(()->find(activity.getWindow().getDecorView(),android.webkit.WebView.class));
        AtomicReference<String> measured=new AtomicReference<>();
        boolean scriptEnabled=main(()->web.getSettings().getJavaScriptEnabled());
        try{
            main(()->{web.getSettings().setJavaScriptEnabled(true);web.evaluateJavascript("(()=>{const t=document.querySelector('.section-heading'),h=document.querySelector('main>header');return t?{top:t.getBoundingClientRect().top,width:window.innerWidth,headerVisible:!!(h&&h.getBoundingClientRect().height)}:null})()",measured::set);return null;});
            long deadline=SystemClock.uptimeMillis()+5000;
            while(measured.get()==null&&SystemClock.uptimeMillis()<deadline)SystemClock.sleep(50);
        }finally{main(()->{web.getSettings().setJavaScriptEnabled(scriptEnabled);return null;});}
        String raw=measured.get();
        if(raw==null||"null".equals(raw)){entry.put("webContentMeasured",false).put("webMeasurementLimit","WebView did not expose document bounds");return;}
        JSONObject rect=new JSONObject(raw);
        double gap=entry.getDouble("contentGapDp")+rect.getDouble("top")*web.getWidth()/rect.getDouble("width")/activity.getResources().getDisplayMetrics().density;
        boolean valid=gap>=7.5&&gap<=12.5&&!rect.getBoolean("headerVisible");compliant&=valid;
        entry.put("webContentMeasured",true).put("firstSectionGapDp",gap)
                .put("duplicateBrandVisible",rect.getBoolean("headerVisible")).put("compliant",valid);
    }
    private void checkDimFolds(JSONObject entry)throws Exception{
        java.lang.reflect.Field foldField;
        try{foldField=ExtraDimActivity.class.getDeclaredField("intensityFold");}catch(NoSuchFieldException baseline){entry.put("foldPreviewAvailable",false);return;}
        foldField.setAccessible(true);
        java.lang.reflect.Field rendering=ExtraDimActivity.class.getDeclaredField("rendering");rendering.setAccessible(true);
        UiKit.Fold fold=main(()->(UiKit.Fold)foldField.get(current));
        boolean checked=main(()->fold.control.isChecked()),enabled=main(()->fold.control.isEnabled());
        try{
            main(()->{rendering.setBoolean(current,true);fold.control.setEnabled(true);fold.control.setChecked(true);fold.sync();return null;});settle();
            if(!main(()->fold.content.isShown()))throw new AssertionError("Enabling dim does not expand intensity");
            capture("04-extra-dim-expanded-preview");
            main(()->{fold.arrow.performClick();return null;});
            if(!main(()->fold.control.isChecked()&&!fold.content.isShown()))throw new AssertionError("Collapsing dim changed enabled state");
            main(()->{fold.control.setChecked(false);fold.sync();fold.arrow.performClick();return null;});
            if(!main(()->!fold.content.isShown()))throw new AssertionError("Disabled dim can expand");
            entry.put("inMemoryFoldPreview",true).put("disabledCannotExpand",true).put("collapsePreservesEnabled",true);
        }finally{main(()->{fold.control.setChecked(checked);fold.control.setEnabled(enabled);fold.sync();rendering.setBoolean(current,false);return null;});}
    }
    private static int top(View view){int[] position=new int[2];view.getLocationInWindow(position);return position[1];}
    private Activity launch(Intent intent)throws Exception{
        if(landscape&&intent.getComponent()!=null
                &&ExtraDimActivity.class.getName().equals(intent.getComponent().getClassName())){
            // Floating activities inherit the orientation of the opaque page below
            // them. Keep a test-owned, already-verified landscape page alive until
            // the dim dialog closes; do not mutate the phone's rotation settings.
            landscapeBackdrop=launch(new Intent(context,SupportActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        }
        Activity original=test.startActivitySync(intent);current=original;
        if(!landscape)return original;
        boolean changed=main(()->original.getResources().getConfiguration().orientation!=Configuration.ORIENTATION_LANDSCAPE);
        boolean floating=main(()->original.getWindow().isFloating());
        if(!floating)main(()->{original.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);return null;});
        long deadline=SystemClock.uptimeMillis()+15000;
        while(SystemClock.uptimeMillis()<deadline){
            Activity candidate=resumed;
            if(candidate!=null&&candidate.getClass()==original.getClass()&&(!changed||candidate!=original)
                    &&main(()->!candidate.isFinishing()&&!candidate.isDestroyed()
                    &&candidate.getTaskId()==original.getTaskId()
                    &&candidate.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE)){
                current=candidate;landscapeRecreated|=candidate!=original;settle();
                main(()->{geometry(candidate,new JSONObject());return null;});return candidate;
            }
            SystemClock.sleep(50);
        }
        throw new AssertionError("Actual landscape activity did not resume: "+original.getClass().getSimpleName());
    }
    /** Called on the main thread after any orientation-driven recreation. */
    private JSONObject geometry(Activity activity,JSONObject entry)throws Exception{
        int orientation=activity.getResources().getConfiguration().orientation;
        if(landscape&&orientation!=Configuration.ORIENTATION_LANDSCAPE)
            throw new AssertionError("Page is not actually landscape: "+activity.getClass().getSimpleName());
        android.util.DisplayMetrics metrics=activity.getResources().getDisplayMetrics();
        View decor=activity.getWindow().getDecorView();
        return entry.put("orientation",orientation).put("width",metrics.widthPixels).put("height",metrics.heightPixels)
                .put("windowWidthPx",decor.getWidth()).put("windowHeightPx",decor.getHeight());
    }
    private void capture(String name)throws Exception{
        Bitmap screenshot=test.getUiAutomation().takeScreenshot();if(screenshot==null)throw new AssertionError("No screenshot: "+name);
        try{
            if(landscape&&screenshot.getWidth()<=screenshot.getHeight())
                throw new AssertionError("Screenshot is not actually landscape: "+name+" "+screenshot.getWidth()+"x"+screenshot.getHeight());
            JSONObject capture=main(()->geometry(current,new JSONObject().put("screen",name)));
            capture.put("screenshotWidthPx",screenshot.getWidth()).put("screenshotHeightPx",screenshot.getHeight());
            screenshots.put(capture);
            try(FileOutputStream output=new FileOutputStream(new File(directory,name+".png"))){screenshot.compress(Bitmap.CompressFormat.PNG,100,output);}
        }finally{screenshot.recycle();}
    }
    private void close()throws Exception{if(current!=null){Activity owner=current,backdrop=landscapeBackdrop;
        main(()->{owner.finish();if(backdrop!=null&&!backdrop.isDestroyed())backdrop.finish();return null;});
        current=null;landscapeBackdrop=null;settle();}}
    private void closeAll()throws Exception{
        main(()->{for(Activity activity:new ArrayList<>(activities))if(!activity.isDestroyed())activity.finish();return null;});
        current=null;landscapeBackdrop=null;settle();
    }
    @Override public void onActivityCreated(Activity activity,Bundle state){activities.add(activity);}
    @Override public void onActivityResumed(Activity activity){resumed=activity;}
    @Override public void onActivityPaused(Activity activity){if(resumed==activity)resumed=null;}
    @Override public void onActivityDestroyed(Activity activity){if(resumed==activity)resumed=null;}
    @Override public void onActivityStarted(Activity activity){}
    @Override public void onActivityStopped(Activity activity){}
    @Override public void onActivitySaveInstanceState(Activity activity,Bundle state){}
    private void settle(){test.waitForIdleSync();SystemClock.sleep(500);test.waitForIdleSync();}
    private interface Action<T>{T run()throws Exception;}
    private <T>T main(Action<T> action)throws Exception{
        AtomicReference<T> value=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();
        test.runOnMainSync(()->{try{value.set(action.run());}catch(Throwable failure){error.set(failure);}});
        if(error.get()!=null)throw new AssertionError("UI measurement failed",error.get());return value.get();
    }
    private static <T extends View>T find(View root,Class<T> type){
        if(type.isInstance(root))return type.cast(root);
        if(root instanceof ViewGroup){ViewGroup group=(ViewGroup)root;for(int i=0;i<group.getChildCount();i++){T match=find(group.getChildAt(i),type);if(match!=null)return match;}}
        return null;
    }
}
