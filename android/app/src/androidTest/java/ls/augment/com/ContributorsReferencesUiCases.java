package ls.augment.com;

import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.webkit.WebView;
import android.widget.ScrollView;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONObject;

/** Pure hosted-document acceptance; temporary Resources/DOM reads never write module or system settings. */
final class ContributorsReferencesUiCases implements Application.ActivityLifecycleCallbacks {
    private static final String[] PROJECTS={"HyperCeiler","LiftArc","红魔助手"};
    private static final String[] PROJECT_URLS={"https://github.com/ReChronoRain/HyperCeiler","https://github.com/miyupyxh/LiftArc"};
    private static final String[] ICON_MIMES={"image/webp","image/svg+xml","image/svg+xml"};
    private static final String[] ICON_SHA256={"0139470A9E2ECEAD8ACA277E06D41901F0E5B1F79E01088A05C39CFFB613FCC8","6DA5AF68C4A9106BF8F72D6AEB37404BED71CDE026BB7FFDD2598E216DC72157","DCD0008307597440F78DD6CD0AD815B23F267134DAC9441FD451CABB9F89E457"};
    private static final String THANKS_DESCRIPTION="红魔Duo使用了以下开源项目的部分或全部内容，感谢这些项目的开发者提供的大力支持（排名顺序不分先后）。";
    private static final String[] REMOVED={"卒迹","绀漓丨Sevtinge","红魔助手开发团队","HyperCeiler开发团队"};
    private static final String[] DONORS={"kj2548","福福","隐隐约约月","夕梦月初","ninemans","停！别浪费时间聊天","萌爱oo","ღ᭄爱莉瑟琳ঞৣ"};
    private static final String DOM="(()=>{const m=document.querySelector('main'),t=document.querySelector('.section-heading'),f=document.querySelector('footer'),last=document.querySelector('.donors li:last-child'),note=document.querySelector('.thanks-description'),list=document.querySelector('.projects');if(!m||!t||!f||!last||!note||!list)return null;"
            +"const s=getComputedStyle(m),r=m.getBoundingClientRect(),a=t.getBoundingClientRect(),b=f.getBoundingClientRect(),d=last.getBoundingClientRect(),h=document.querySelector('main>header'),ns=getComputedStyle(note),nr=note.getBoundingClientRect();"
            +"return {ready:document.readyState,title:document.title,marker:!!document.querySelector('meta[name=\"redmagic-duo-contributors\"][content=\"1\"]'),embedded:!!document.querySelector('#duo-native-embedded'),heading:document.querySelector('#projects-title')?.textContent.trim()||'',headings:Array.from(document.querySelectorAll('h2')).map(e=>e.textContent.trim()),"
            +"headingMetrics:Array.from(document.querySelectorAll('.section-heading')).map(e=>{const h=e.querySelector('h2'),s=getComputedStyle(h),r=e.getBoundingClientRect(),n=e.nextElementSibling.getBoundingClientRect();return {text:h.textContent.trim(),size:parseFloat(s.fontSize),weight:parseInt(s.fontWeight),color:s.color,bottom:r.bottom,nextTop:n.top}}),"
            +"thanksDescription:note.textContent.trim(),descriptionSize:parseFloat(ns.fontSize),descriptionColor:ns.color,descriptionBottom:nr.bottom,firstProjectTop:list.getBoundingClientRect().top,"
            +"projectRows:Array.from(document.querySelectorAll('.projects .project')).map(e=>{const h=e.querySelector('h3'),link=e.querySelector('a'),target=link||e.querySelector('.project-static'),r=target.getBoundingClientRect(),s=getComputedStyle(h),img=e.querySelector('img'),ir=img?.getBoundingClientRect(),is=img?getComputedStyle(img):null;return {name:h.textContent.trim(),href:link?link.getAttribute('href'):null,semantic:target.tagName.toLowerCase(),descriptionCount:e.querySelectorAll('p,.project-note').length,size:parseFloat(s.fontSize),color:s.color,decoration:s.textDecorationLine,left:r.left,top:r.top,width:r.width,height:r.height,iconCount:e.querySelectorAll('img').length,letterPlaceholder:e.querySelectorAll('span.initial').length,iconInline:!!(img&&img.getAttribute('src')?.startsWith('data:image/')),iconComplete:!!(img&&img.complete),iconNaturalWidth:img?.naturalWidth||0,iconNaturalHeight:img?.naturalHeight||0,iconWidth:ir?.width||0,iconHeight:ir?.height||0,iconFit:is?.objectFit||''}}),"
            +"projectLinkCount:document.querySelectorAll('.projects a').length,projects:Array.from(document.querySelectorAll('.projects .project h3')).map(e=>e.textContent.trim()),donors:Array.from(document.querySelectorAll('.donors li')).map(e=>e.textContent.trim()),oldPeople:document.querySelectorAll('.people,.person,#contributors-title').length,text:document.body.innerText,width:window.innerWidth,height:window.innerHeight,scrollY:window.scrollY,scrollHeight:Math.max(document.body.scrollHeight,document.documentElement.scrollHeight),scrollWidth:Math.max(document.body.scrollWidth,document.documentElement.scrollWidth),mainLeft:r.left,mainRight:r.right,paddingLeft:parseFloat(s.paddingLeft)||0,paddingRight:parseFloat(s.paddingRight)||0,firstTop:a.top,headerVisible:!!(h&&h.getBoundingClientRect().height),footerTop:b.top,footerBottom:b.bottom,lastDonorTop:d.top,lastDonorBottom:d.bottom}})()";
    private final DeviceRegressionRunner runner;
    private final Context context;
    private final boolean previewOnly;
    private final List<Activity> activities=new ArrayList<>();
    private final JSONArray layouts=new JSONArray(),screenshots=new JSONArray();
    private volatile Activity resumed;
    private File directory;
    private String previewHtml;
    private int checks;
    private boolean webScrollObserved;
    private int interceptedProjectIntents;
    private ContributorsReferencesUiCases(DeviceRegressionRunner runner,Bundle args){
        this.runner=runner;context=runner.getTargetContext();previewOnly=args!=null&&!args.getString("previewHtmlPath","").isEmpty();
    }
    static JSONObject run(DeviceRegressionRunner runner,Bundle arguments)throws Exception{return new ContributorsReferencesUiCases(runner,arguments).execute();}

    @SuppressWarnings("deprecation")
    private JSONObject execute()throws Exception{
        Map<String,?> before=new LinkedHashMap<>(context.getSharedPreferences(AppConfig.PREFS,0).getAll());
        float originalFontScale=main(()->context.getResources().getConfiguration().fontScale);
        directory=new File(context.getExternalFilesDir(null),"contributors-references-ui");require(directory.isDirectory()||directory.mkdirs(),"Evidence directory is available");
        if(previewOnly){
            File base=context.getExternalFilesDir(null),file=new File(base,"contributors-web-preview.html");
            require(base!=null&&file.isFile()&&!Files.isSymbolicLink(file.toPath())&&file.getCanonicalFile().getParentFile().equals(base.getCanonicalFile()),"Only the fixed app-owned web preview file is readable");
            require(file.length()>0&&file.length()<=512*1024,"Web preview stays within the production document limit");
            previewHtml=new String(Files.readAllBytes(file.toPath()),StandardCharsets.UTF_8);requireDocument(previewHtml);
        }
        Application app=(Application)context.getApplicationContext();app.registerActivityLifecycleCallbacks(this);Throwable failure=null;
        try{
            checkProjectAllowlist();
            scenario("01-normal",1.0f,false);scenario("02-large-font",1.5f,false);scenario("03-landscape",1.0f,true);
            require(screenshots.length()==6,"Three scenarios each saved top and bottom screenshots");
            require(webScrollObserved,"An overflowing scenario exercised the WebView's own scroll");
            require(interceptedProjectIntents==6,"All three scenarios exercised both real project link taps with external Intents intercepted");
        }catch(Throwable error){failure=error;}
        finally{
            try{
                main(()->{
                    for(Activity page:new ArrayList<>(activities))if(!page.isFinishing()&&!page.isDestroyed())page.finish();
                    Configuration restore=new Configuration(context.getResources().getConfiguration());restore.fontScale=originalFontScale;
                    context.getResources().updateConfiguration(restore,context.getResources().getDisplayMetrics());return null;
                });settle();
            }catch(Throwable cleanup){if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);}
            app.unregisterActivityLifecycleCallbacks(this);
        }
        boolean unchanged=before.equals(context.getSharedPreferences(AppConfig.PREFS,0).getAll());
        boolean fontRestored=Math.abs(main(()->context.getResources().getConfiguration().fontScale)-originalFontScale)<.001f;
        if(!unchanged&&failure==null)failure=new AssertionError("Web document inspection changed feature configuration");
        if(!fontRestored&&failure==null)failure=new AssertionError("Temporary Resources font scale was not restored");
        JSONObject report=new JSONObject().put("version",BuildConfig.VERSION_NAME).put("versionCode",BuildConfig.VERSION_CODE)
                .put("success",failure==null).put("checks",checks).put("configurationUnchanged",unchanged).put("configurationWrites",0)
                .put("systemDisplaySettingsChanged",false).put("fontScaleRestored",fontRestored).put("originalFontScale",originalFontScale)
                .put("previewOnly",previewOnly).put("source",previewOnly?"local-web-preview":"apk-hosted-document")
                .put("remoteProjectOpened",false).put("remotePagePublished",false).put("featureEfficacyChecked",false)
                .put("projectBrowserIntentsIntercepted",interceptedProjectIntents).put("projectTapNavigationChecked",interceptedProjectIntents==6)
                .put("webScrollObserved",webScrollObserved).put("layouts",layouts).put("screenshots",screenshots).put("directory",directory.getAbsolutePath());
        if(failure!=null)report.put("failure",android.util.Log.getStackTraceString(failure));
        Files.write(new File(directory,"report.json").toPath(),report.toString(2).getBytes(StandardCharsets.UTF_8));
        if(failure!=null)throw new AssertionError("Contributors web UI checks failed; inspect "+directory,failure);return report;
    }
    @SuppressWarnings("deprecation")
    private void scenario(String name,float fontScale,boolean landscape)throws Exception{
        Activity page=runner.startActivitySync(new Intent(context,ContributorsActivity.class).putExtra(ModuleNavigation.EXTRA_ROUTE,"contributors").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        Activity launched=page;int originalOrientation=main(launched::getRequestedOrientation);
        Configuration originalConfiguration=null;DisplayMetrics originalMetrics=null;
        try{
            prepareDocument(page);
            int wanted=landscape?Configuration.ORIENTATION_LANDSCAPE:Configuration.ORIENTATION_PORTRAIT;
            if(main(()->launched.getResources().getConfiguration().orientation)!=wanted){
                main(()->{launched.setRequestedOrientation(landscape?ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE:ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);return null;});
                settle();
                page=awaitOrientation(wanted);prepareDocument(page);
            }else if(landscape){
                main(()->{launched.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);return null;});
                settle();
                page=awaitOrientation(wanted);
                if(page!=launched)prepareDocument(page);
            }
            Activity owner=page;
            originalConfiguration=main(()->new Configuration(owner.getResources().getConfiguration()));
            originalMetrics=main(()->{DisplayMetrics metrics=new DisplayMetrics();metrics.setTo(owner.getResources().getDisplayMetrics());return metrics;});
            main(()->{
                Configuration temporary=new Configuration(owner.getResources().getConfiguration());temporary.fontScale=fontScale;
                owner.getResources().updateConfiguration(temporary,owner.getResources().getDisplayMetrics());
                invoke(owner,"renderPage",new Class<?>[]{Bundle.class},(Object)null);return null;
            });awaitDocument(owner);settle();
            main(()->{web(owner).scrollTo(0,0);return null;});settle();
            JSONObject top=readDom(owner);measure(owner,name,fontScale,landscape,top);capture(owner,name+"-top");
            checkProjectTaps(owner);
            main(()->{WebView view=web(owner);view.scrollTo(0,Integer.MAX_VALUE/4);return null;});settle();
            JSONObject bottom=readDom(owner);
            main(()->{
                WebView view=web(owner);require(!view.canScrollVertically(1),"WebView reached the actual document bottom");
                boolean needed=bottom.getDouble("scrollHeight")>bottom.getDouble("height")+1;
                if(needed){require(view.getScrollY()>0&&bottom.getDouble("scrollY")>0,"Overflow is scrolled by the WebView itself");webScrollObserved=true;}
                require(bottom.getDouble("footerTop")>=-1&&bottom.getDouble("footerBottom")<=bottom.getDouble("height")+2,"Document footer is fully reachable");
                require(bottom.getDouble("lastDonorTop")>=-1&&bottom.getDouble("lastDonorBottom")<=bottom.getDouble("height")+2,"The eighth donor is fully reachable");
                require(!view.getSettings().getJavaScriptEnabled(),"DOM inspection restored production JavaScript-off state");return null;
            });
            layouts.getJSONObject(layouts.length()-1).put("bottom",new JSONObject().put("scrollYCss",bottom.getDouble("scrollY"))
                    .put("documentHeightCss",bottom.getDouble("scrollHeight")).put("viewportHeightCss",bottom.getDouble("height"))
                    .put("footerBottomCss",bottom.getDouble("footerBottom")).put("lastDonorBottomCss",bottom.getDouble("lastDonorBottom")));
            capture(owner,name+"-bottom");
            // Restore temporary Resources before exercising the existing native back button.
            Configuration restore=originalConfiguration;DisplayMetrics metrics=originalMetrics;
            main(()->{
                owner.getResources().updateConfiguration(restore,metrics);
                View back=findDescription(owner.getWindow().getDecorView(),"返回上一页");require(back!=null&&back.performClick(),"Existing back button responds");return null;
            });awaitClosed(owner);layouts.getJSONObject(layouts.length()-1).put("backReturnedNormally",true);
        }finally{
            Activity owner=page;Configuration restore=originalConfiguration;DisplayMetrics metrics=originalMetrics;
            main(()->{
                if(restore!=null)owner.getResources().updateConfiguration(restore,metrics);
                if(!owner.isDestroyed()){owner.setRequestedOrientation(originalOrientation);if(!owner.isFinishing())owner.finish();}return null;
            });settle();
        }
    }
    private void prepareDocument(Activity page)throws Exception{
        awaitDocument(page);
        ExecutorService worker=main(()->{
            HttpURLConnection connection=(HttpURLConnection)get(page,"connection");if(connection!=null)connection.disconnect();
            ExecutorService writer=(ExecutorService)get(page,"worker");writer.shutdownNow();return writer;
        });require(worker.awaitTermination(12,TimeUnit.SECONDS),"Only the test Activity's HTTP worker has stopped");settle();
        if(previewOnly)main(()->{set(page,"pendingScrollY",0);invoke(page,"show",new Class<?>[]{String.class},previewHtml);return null;});
        awaitDocument(page);settle();
    }
    private void measure(Activity page,String name,float expectedScale,boolean landscape,JSONObject dom)throws Exception{main(()->{
        WebView view=web(page);View path=page.getWindow().getDecorView().findViewWithTag("page-path");
        require(path!=null&&view==page.getWindow().getDecorView().findViewWithTag("contributors-web"),"The pure document uses the existing native breadcrumb and WebView");
        require(dom.getBoolean("shownBodyMatches"),"DOM belongs to the currently loaded shownHtml");
        float density=page.getResources().getDisplayMetrics().density;
        double cssToDp=view.getWidth()/dom.getDouble("width")/density;
        double gap=(top(view)-bottom(path))/density+dom.getDouble("firstTop")*cssToDp;
        require(gap>=7.5&&gap<=12.5,"Breadcrumb bottom to actual first section keeps the total 8–12dp gap");
        require(Math.abs(dom.getDouble("paddingLeft")*cssToDp-16)<=.6&&Math.abs(dom.getDouble("paddingRight")*cssToDp-16)<=.6,"Document main keeps 16dp side insets");
        require(Math.abs(dom.getDouble("mainLeft"))*cssToDp<=.6&&Math.abs(dom.getDouble("width")-dom.getDouble("mainRight"))*cssToDp<=.6,"Document main fills the WebView width");
        require(!dom.getBoolean("headerVisible"),"The standalone brand heading is hidden beneath native chrome");
        require(dom.getDouble("scrollWidth")<=dom.getDouble("width")+1,"Document has no horizontal overflow");
        require("感谢".equals(dom.getString("heading")),"First web section is titled 感谢");
        require(THANKS_DESCRIPTION.equals(dom.getString("thanksDescription")),"The exact requested thanks description is retained");
        require(exact(dom.getJSONArray("headings"),new String[]{"感谢","捐赠列表"}),"Only the two requested section headings remain");
        UiKit ui=(UiKit)get(page,"ui");
        JSONArray headings=dom.getJSONArray("headingMetrics"),rows=dom.getJSONArray("projectRows");
        JSONArray iconSources=checkInlineIconSources((String)get(page,"shownHtml"));
        for(int i=0;i<headings.length();i++){
            JSONObject heading=headings.getJSONObject(i);
            require(heading.getInt("weight")>=700,"Section heading is bold");
            require(Math.abs(heading.getDouble("size")/dom.getDouble("descriptionSize")-UiKit.compactTextSize(16)/UiKit.compactTextSize(12))<.03,"Section title and description use public 16/12 typography");
            require(heading.getDouble("size")>=UiKit.compactTextSize(16)-.1,"Section heading uses the enlarged public size");
            require(cssColor(ui.text).equals(heading.getString("color")),"Section heading uses the common text color");
            require(Math.abs((heading.getDouble("nextTop")-heading.getDouble("bottom"))*cssToDp-16)<.6,"Section title to first content keeps 16dp");
        }
        require(cssColor(ui.muted).equals(dom.getString("descriptionColor")),"Thanks description uses the common muted color");
        require(Math.abs((dom.getDouble("firstProjectTop")-dom.getDouble("descriptionBottom"))*cssToDp-16)<.6,"Description to project list keeps 16dp");
        require(dom.getInt("projectLinkCount")==2,"Only the first two project rows have semantic links");
        for(int i=0;i<rows.length();i++){
            JSONObject row=rows.getJSONObject(i);
            require(row.getInt("descriptionCount")==0,"Project row contains no descriptions or version/license small text");
            require(row.getInt("iconCount")==1&&row.getInt("letterPlaceholder")==0,"Project uses one real image instead of a letter placeholder");
            require(row.getBoolean("iconInline")&&row.getBoolean("iconComplete")&&row.getInt("iconNaturalWidth")>0&&row.getInt("iconNaturalHeight")>0,"Project icon is decoded from the offline inline image");
            require(Math.abs(row.getDouble("iconWidth")*cssToDp-36)<.6&&Math.abs(row.getDouble("iconHeight")*cssToDp-36)<.6,"Project icon retains the common fixed 36dp bounds");
            require("contain".equals(row.getString("iconFit")),"Project icon keeps its original aspect without cropping");
            require(row.getDouble("height")*cssToDp>=47.5,"Project row keeps at least a 48dp target");
            require(headings.getJSONObject(0).getDouble("size")>row.getDouble("size"),"Section title is larger than project names");
            if(i<2){
                require("a".equals(row.getString("semantic"))&&PROJECT_URLS[i].equals(row.getString("href")),"Project name belongs to the exact semantic repository link");
                require(cssColor(ui.accent).equals(row.getString("color"))&&row.getString("decoration").contains("underline"),"Clickable names use common accent and underline");
            }else require(row.isNull("href")&&"div".equals(row.getString("semantic")),"红魔助手 remains a static name without an invented link");
        }
        require(!dom.getString("text").contains("1.0.22")&&!dom.getString("text").contains("GPL-3.0"),"Version and license small text was removed from the webpage");
        require(exact(dom.getJSONArray("projects"),PROJECTS),"Only HyperCeiler, LiftArc and 红魔助手 appear in the project list");
        require(exact(dom.getJSONArray("donors"),DONORS),"All eight original donors remain in order");
        require(dom.getInt("oldPeople")==0&&!arrayContains(dom.getJSONArray("headings"),"贡献者"),"Old contributors heading and people-list structure are absent");
        for(String removed:REMOVED)require(!dom.getString("text").contains(removed),"Removed contributor is absent: "+removed);
        require(!view.getSettings().getJavaScriptEnabled()&&view.getSettings().getBlockNetworkLoads()
                &&!view.getSettings().getAllowFileAccess()&&!view.getSettings().getAllowContentAccess(),"Production document restrictions remain enabled");
        for(View ancestor=view;ancestor.getParent() instanceof View;ancestor=(View)ancestor.getParent())require(!(ancestor instanceof ScrollView),"WebView has no outer native ScrollView");
        for(View nativeView:all(page.getWindow().getDecorView())){
            Object tag=nativeView.getTag();require(tag==null||!tag.toString().startsWith("open-source-"),"No native open-source reference card exists");
            if(nativeView instanceof TextView){String text=((TextView)nativeView).getText().toString();require(!text.equals("开源引用")&&!text.equals("感谢")&&!text.equals("LiftArc"),"Project content is rendered in the webpage");}
        }
        require(view.getScrollY()==0&&Math.abs(dom.getDouble("scrollY"))<.1,"Top measurement uses the document top");
        require(Math.abs(page.getResources().getConfiguration().fontScale-expectedScale)<.001,"Requested temporary font scale is actually applied");
        require(view.getSettings().getTextZoom()==Math.round(expectedScale*100),"WebView text zoom follows the temporary font scale");
        require(page.getResources().getConfiguration().orientation==(landscape?Configuration.ORIENTATION_LANDSCAPE:Configuration.ORIENTATION_PORTRAIT),"Scenario uses a real Activity orientation");
        require(page.hasWindowFocus()&&page.getWindow().getDecorView().isShown(),"Measured Activity is visible and focused");
        if(landscape)require(page.getWindow().getDecorView().getWidth()>page.getWindow().getDecorView().getHeight(),"Landscape is a real wide window");
        layouts.put(new JSONObject().put("state",name).put("density",density).put("fontScale",expectedScale)
                .put("orientation",page.getResources().getConfiguration().orientation).put("firstSectionGapDp",gap)
                .put("mainLeftInsetDp",dom.getDouble("paddingLeft")*cssToDp).put("mainRightInsetDp",dom.getDouble("paddingRight")*cssToDp)
                .put("breadcrumb",bounds(path,density)).put("webView",bounds(view,density)).put("projects",dom.getJSONArray("projects"))
                .put("donors",dom.getJSONArray("donors")).put("webViewOwnsScroll",true).put("nativeOpenSourceCard",false)
                .put("headingMetrics",headings).put("thanksDescription",dom.getString("thanksDescription")).put("projectRows",rows)
                .put("inlineIconSources",iconSources)
                .put("javaScriptRestoredOff",true).put("previewOnly",previewOnly));return null;
    });}

    private void checkProjectAllowlist(){
        for(String address:PROJECT_URLS){
            Intent intent=ContributorsActivity.projectLinkIntent(address,true,true,false);
            require(intent!=null&&Intent.ACTION_VIEW.equals(intent.getAction())&&address.equals(intent.getDataString())&&intent.hasCategory(Intent.CATEGORY_BROWSABLE),"Exact repository click produces a browser ACTION_VIEW");
            require(intent.getComponent()==null&&intent.getPackage()==null,"Project routing does not depend on a specific installed browser");
            require(ContributorsActivity.projectLinkIntent(address,false,true,false)==null,"Subframe navigation is rejected");
            require(ContributorsActivity.projectLinkIntent(address,true,false,false)==null,"Automatic navigation without a user gesture is rejected");
            require(ContributorsActivity.projectLinkIntent(address,true,true,true)==null,"Redirect navigation is rejected even after a gesture");
        }
        String[] rejected={null,""," https://github.com/miyupyxh/LiftArc","http://github.com/miyupyxh/LiftArc","javascript:alert(1)","file:///tmp/LiftArc","content://github.com/LiftArc","https://user@github.com/miyupyxh/LiftArc","https://github.com:443/miyupyxh/LiftArc","https://github.com/miyupyxh/LiftArc?tab=readme","https://github.com/miyupyxh/LiftArc#readme","https://github.com/miyupyxh/LiftArc/","https://github.com/miyupyxh/LiftArc/issues","https://github.com/miyupyxh/%4CiftArc","https://github.com/other/LiftArc","https://github.com.evil.test/miyupyxh/LiftArc","https://github.com./miyupyxh/LiftArc","https://GITHUB.com/miyupyxh/LiftArc","https://github.com//miyupyxh/LiftArc","https://redmagic-duo-contributors.pages.dev/"};
        for(String address:rejected)require(ContributorsActivity.projectLinkIntent(address,true,true,false)==null,"Non-exact repository address is rejected: "+address);
    }
    private JSONArray checkInlineIconSources(String html)throws Exception{
        Matcher icons=Pattern.compile("class=\"project-icon\"\\s+src=\"data:(image/(?:webp|svg\\+xml));base64,([A-Za-z0-9+/=]+)\"").matcher(html);
        JSONArray result=new JSONArray();
        for(int index=0;index<PROJECTS.length;index++){
            require(icons.find(),"The actual hosted HTML contains an inline original icon for "+PROJECTS[index]);
            require(ICON_MIMES[index].equals(icons.group(1)),"Original icon format is preserved");
            byte[] image=android.util.Base64.decode(icons.group(2),android.util.Base64.DEFAULT);
            byte[] digest=java.security.MessageDigest.getInstance("SHA-256").digest(image);StringBuilder hex=new StringBuilder(64);
            for(byte value:digest){hex.append(Character.forDigit((value>>4)&15,16));hex.append(Character.forDigit(value&15,16));}
            require(ICON_SHA256[index].equalsIgnoreCase(hex.toString()),"Inline icon bytes match the recorded original source SHA256");
            result.put(new JSONObject().put("project",PROJECTS[index]).put("mime",icons.group(1)).put("bytes",image.length).put("sha256",hex.toString()));
        }
        require(!icons.find(),"Only the three requested project icons are present");return result;
    }
    private void checkProjectTaps(Activity page)throws Exception{
        List<Intent> attempts=new java.util.concurrent.CopyOnWriteArrayList<>();
        Instrumentation.ActivityMonitor monitor=new Instrumentation.ActivityMonitor(){
            @Override public Instrumentation.ActivityResult onStartActivity(Intent intent){
                attempts.add(new Intent(intent));
                return new Instrumentation.ActivityResult(Activity.RESULT_CANCELED,null);
            }
        };
        runner.addMonitor(monitor);
        try{
            for(int index=0;index<3;index++){
                attempts.clear();tapProject(page,index);settle();
                if(index<2){
                    long deadline=SystemClock.uptimeMillis()+4000;
                    while(attempts.isEmpty()&&SystemClock.uptimeMillis()<deadline)SystemClock.sleep(60);
                    require(attempts.size()==1,"Actual project touch emits exactly one intercepted browser Intent");
                    Intent intent=attempts.get(0);
                    require(Intent.ACTION_VIEW.equals(intent.getAction())&&PROJECT_URLS[index].equals(intent.getDataString())&&intent.hasCategory(Intent.CATEGORY_BROWSABLE),"Actual project touch routes to the requested external repository");
                    interceptedProjectIntents++;
                }else{
                    SystemClock.sleep(300);require(attempts.isEmpty(),"Touching 红魔助手 emits no external navigation");
                }
                require(main(()->page.hasWindowFocus()&&!web(page).getSettings().getJavaScriptEnabled()),"Browser interception preserves the visible JS-disabled host");
            }
            layouts.getJSONObject(layouts.length()-1).put("projectTapIntentsIntercepted",2).put("staticProjectDoesNotNavigate",true);
        }finally{runner.removeMonitor(monitor);}
    }
    private void tapProject(Activity page,int index)throws Exception{
        JSONObject dom=readDom(page),row=dom.getJSONArray("projectRows").getJSONObject(index);
        double desired=dom.getDouble("scrollY")+row.getDouble("top")-Math.max(0,(dom.getDouble("height")-row.getDouble("height"))/2);
        double pixelsPerCss=main(()->web(page).getWidth())/dom.getDouble("width");
        main(()->{web(page).scrollTo(0,(int)Math.max(0,Math.round(desired*pixelsPerCss)));return null;});settle();
        dom=readDom(page);row=dom.getJSONArray("projectRows").getJSONObject(index);
        require(row.getDouble("top")>=-.5&&row.getDouble("top")+row.getDouble("height")<=dom.getDouble("height")+1,"Project touch target is fully visible");
        JSONObject target=row;double cssWidth=dom.getDouble("width");
        float[] point=main(()->{
            WebView view=web(page);int[] origin=new int[2];view.getLocationOnScreen(origin);double scale=view.getWidth()/cssWidth;
            return new float[]{(float)(origin[0]+(target.getDouble("left")+target.getDouble("width")/2)*scale),
                    (float)(origin[1]+(target.getDouble("top")+target.getDouble("height")/2)*scale)};
        });
        long down=SystemClock.uptimeMillis();
        injectTouch(down,MotionEvent.ACTION_DOWN,point);SystemClock.sleep(80);injectTouch(down,MotionEvent.ACTION_UP,point);
    }
    private void injectTouch(long down,int action,float[] point){
        MotionEvent touch=MotionEvent.obtain(down,SystemClock.uptimeMillis(),action,point[0],point[1],0);touch.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try{require(runner.getUiAutomation().injectInputEvent(touch,true),"Actual project touch is accepted by Android");}finally{touch.recycle();}
    }
    private static String cssColor(int color){return String.format(java.util.Locale.ROOT,"rgb(%d, %d, %d)",(color>>16)&255,(color>>8)&255,color&255);}
    private void awaitDocument(Activity page)throws Exception{
        long deadline=SystemClock.uptimeMillis()+15_000;
        while(SystemClock.uptimeMillis()<deadline){
            String shown=main(()->{if(page.isDestroyed())return null;WebView view=web(page);String html=(String)get(page,"shownHtml");return view.getContentHeight()>0&&view.getProgress()==100&&html!=null&&!html.isEmpty()?html:null;});
            if(shown!=null){
                requireDocument(shown);JSONObject dom=readDom(page);
                if(dom!=null&&"complete".equals(dom.optString("ready"))&&dom.optBoolean("marker")&&dom.optBoolean("embedded")&&dom.optBoolean("shownBodyMatches")
                        &&title(shown).equals(dom.optString("title"))&&main(()->shown.equals(get(page,"shownHtml"))))return;
            }
            SystemClock.sleep(80);
        }
        throw new AssertionError("Current shownHtml did not finish loading in the WebView");
    }
    private JSONObject readDom(Activity page)throws Exception{
        AtomicReference<String> result=new AtomicReference<>();CountDownLatch complete=new CountDownLatch(1);
        WebView view=main(()->web(page));boolean original=main(()->view.getSettings().getJavaScriptEnabled());
        String shown=main(()->(String)get(page,"shownHtml"));
        String script="(()=>{const result="+DOM+";if(result){const expected=new DOMParser().parseFromString("+JSONObject.quote(shown)+",'text/html');result.shownBodyMatches=document.body.innerHTML===expected.body.innerHTML;}return result;})()";
        require(!original,"Production JavaScript is disabled before read-only DOM measurement");
        try{
            main(()->{view.getSettings().setJavaScriptEnabled(true);view.evaluateJavascript(script,value->{result.set(value);complete.countDown();});return null;});
            require(complete.await(5,TimeUnit.SECONDS),"Read-only DOM measurement completed");
        }finally{main(()->{view.getSettings().setJavaScriptEnabled(original);return null;});}
        String raw=result.get();return raw==null||raw.equals("null")?null:new JSONObject(raw);
    }
    private void requireDocument(String html){
        require(html.contains("<meta name=\"redmagic-duo-contributors\" content=\"1\">")&&html.contains("</html>"),"The current document has the production completeness marker");
        require(!Pattern.compile("<script\\b",Pattern.CASE_INSENSITIVE).matcher(html).find(),"Only a static document is temporarily exposed to DOM measurement");
    }
    private static String title(String html){Matcher match=Pattern.compile("<title>\\s*(.*?)\\s*</title>",Pattern.DOTALL).matcher(html);return match.find()?match.group(1):"";}
    private Activity awaitOrientation(int orientation)throws Exception{
        long deadline=SystemClock.uptimeMillis()+15_000;
        while(SystemClock.uptimeMillis()<deadline){Activity candidate=resumed;if(candidate instanceof ContributorsActivity&&main(()->!candidate.isDestroyed()&&candidate.getResources().getConfiguration().orientation==orientation&&candidate.hasWindowFocus()))return candidate;SystemClock.sleep(80);}
        throw new AssertionError("Contributor Activity did not resume in the requested orientation");
    }
    private void awaitClosed(Activity owner)throws Exception{long deadline=SystemClock.uptimeMillis()+5000;while(SystemClock.uptimeMillis()<deadline){if(main(()->owner.isFinishing()||owner.isDestroyed()))return;SystemClock.sleep(50);}throw new AssertionError("Back did not close the contributor page");}
    private void capture(Activity page,String name)throws Exception{
        main(()->{require(page.hasWindowFocus()&&!web(page).getSettings().getJavaScriptEnabled(),"Screenshot belongs to the visible JS-disabled webpage");return null;});
        runner.waitForIdleSync();Bitmap bitmap=runner.getUiAutomation().takeScreenshot();require(bitmap!=null,"Screenshot captured");
        try{File target=new File(directory,name+".png");try(FileOutputStream out=new FileOutputStream(target)){require(bitmap.compress(Bitmap.CompressFormat.PNG,100,out),"Screenshot saved");}screenshots.put(new JSONObject().put("name",name).put("path",target.getAbsolutePath()).put("widthPx",bitmap.getWidth()).put("heightPx",bitmap.getHeight()));}finally{bitmap.recycle();}
    }
    private void settle(){runner.waitForIdleSync();SystemClock.sleep(350);runner.waitForIdleSync();}
    private interface Action<T>{T run()throws Exception;}
    private <T>T main(Action<T> action)throws Exception{AtomicReference<T> value=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();runner.runOnMainSync(()->{try{value.set(action.run());}catch(Throwable failure){error.set(failure);}});if(error.get()!=null)throw new AssertionError("Web UI inspection failed",error.get());return value.get();}
    private void require(boolean value,String label){checks++;if(!value)throw new AssertionError(label);}
    private static Object get(Object owner,String name)throws Exception{Field field=owner.getClass().getDeclaredField(name);field.setAccessible(true);return field.get(owner);}
    private static void set(Object owner,String name,Object value)throws Exception{Field field=owner.getClass().getDeclaredField(name);field.setAccessible(true);field.set(owner,value);}
    private static void invoke(Object owner,String name,Class<?>[] types,Object...args)throws Exception{Method method=owner.getClass().getDeclaredMethod(name,types);method.setAccessible(true);method.invoke(owner,args);}
    private static WebView web(Activity page)throws Exception{return (WebView)get(page,"web");}
    private static List<View> all(View view){List<View> result=new ArrayList<>();result.add(view);if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)result.addAll(all(group.getChildAt(i)));}return result;}
    private static View findDescription(View root,String description){for(View view:all(root))if(description.contentEquals(view.getContentDescription()==null?"":view.getContentDescription()))return view;return null;}
    private static boolean exact(JSONArray array,String[] expected){if(array.length()!=expected.length)return false;for(int i=0;i<expected.length;i++)if(!expected[i].equals(array.optString(i)))return false;return true;}
    private static boolean arrayContains(JSONArray array,String text){for(int i=0;i<array.length();i++)if(text.equals(array.optString(i)))return true;return false;}
    private static int top(View view){int[] at=new int[2];view.getLocationInWindow(at);return at[1];}
    private static int bottom(View view){return top(view)+view.getHeight();}
    private static JSONObject bounds(View view,float density)throws Exception{int[] at=new int[2];view.getLocationInWindow(at);return new JSONObject().put("leftDp",at[0]/density).put("topDp",at[1]/density).put("widthDp",view.getWidth()/density).put("heightDp",view.getHeight()/density);}
    @Override public void onActivityCreated(Activity page,Bundle state){activities.add(page);page.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);}
    @Override public void onActivityResumed(Activity page){resumed=page;}
    @Override public void onActivityPaused(Activity page){if(resumed==page)resumed=null;}
    @Override public void onActivityDestroyed(Activity page){if(resumed==page)resumed=null;}
    @Override public void onActivityStarted(Activity page){}
    @Override public void onActivityStopped(Activity page){}
    @Override public void onActivitySaveInstanceState(Activity page,Bundle state){}
}
