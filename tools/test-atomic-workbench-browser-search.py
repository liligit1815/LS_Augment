"""Execute real browser capability/sanitization code; these are offline boundaries, not app acceptance."""
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
JDK=Path(r'C:\Program Files\Android\openjdk\jdk-21.0.8\bin')
STUBS={
'android/os/Bundle.java':r'''package android.os;import java.util.*;public class Bundle{public final Map<String,Object> m=new HashMap<>();public Object get(String k){return m.get(k);}public Set<String> keySet(){return m.keySet();}}''',
'android/net/Uri.java':r'''package android.net;public class Uri{final String value;private Uri(String s){value=s;}public static Uri parse(String s){return new Uri(s);}public String toString(){return value;}}''',
'android/app/SearchManager.java':'package android.app;public class SearchManager{public static final String QUERY="query";}',
'android/content/ComponentName.java':'package android.content;public class ComponentName{public final String p,c;public ComponentName(String p,String c){this.p=p;this.c=c;}}',
'android/content/Intent.java':r'''package android.content;import android.os.Bundle;import android.net.Uri;public class Intent{
public static final String ACTION_VIEW="view",ACTION_WEB_SEARCH="web_search",ACTION_SEARCH="search",CATEGORY_BROWSABLE="browsable";
public String action,pkg,type;public Uri data;public Object clip;public Intent selector;public ComponentName component;public int flags;public Bundle extras=new Bundle();
public Intent(String a){action=a;}public Intent(String a,Uri d){action=a;data=d;}public Intent addCategory(String c){return this;}
public Intent setPackage(String p){pkg=p;return this;}public Intent putExtra(String k,String v){extras.m.put(k,v);return this;}
public String getAction(){return action;}public Uri getData(){return data;}public String getType(){return type;}
public Object getClipData(){return clip;}public Intent getSelector(){return selector;}public ComponentName getComponent(){return component;}
public int getFlags(){return flags;}public Bundle getExtras(){return extras;}public Bundle getBundleExtra(String k){return extras.get(k) instanceof Bundle?(Bundle)extras.get(k):null;}}
''',
'android/content/Context.java':r'''package android.content;public class Context{public final android.content.pm.PackageManager pm=new android.content.pm.PackageManager();public android.content.pm.PackageManager getPackageManager(){return pm;}}''',
'android/content/pm/PackageManager.java':r'''package android.content.pm;import java.util.*;import android.content.Intent;public class PackageManager{public static final int MATCH_DEFAULT_ONLY=1;public final List<ResolveInfo> view=new ArrayList<>(),search=new ArrayList<>(),directSearch=new ArrayList<>();public List<ResolveInfo> queryIntentActivities(Intent i,int f){return Intent.ACTION_VIEW.equals(i.action)?view:Intent.ACTION_SEARCH.equals(i.action)?(f==0?directSearch:List.of()):search;}}''',
'android/content/pm/ActivityInfo.java':'package android.content.pm;public class ActivityInfo{public String packageName,name,permission;public boolean enabled=true,exported=true;public ApplicationInfo applicationInfo=new ApplicationInfo();}',
'android/content/pm/ApplicationInfo.java':'package android.content.pm;public class ApplicationInfo{public boolean enabled=true;public int uid=10500;}',
'android/content/pm/ResolveInfo.java':'package android.content.pm;public class ResolveInfo{public ActivityInfo activityInfo;}',
'ls/augment/com/AtomicWorkbenchProtocol.java':'package ls.augment.com;public class AtomicWorkbenchProtocol{static final String EXTRA_EXACT_TARGET="private_exact";}',
}
TEST=r'''package ls.augment.com;import android.app.SearchManager;import android.content.*;import android.content.pm.*;import android.os.Bundle;
public class TestBrowserSearch{
static int checks;static void ok(boolean b){checks++;if(!b)throw new AssertionError("browser search contract "+checks);}
static void rejects(Runnable r){try{r.run();throw new AssertionError("unsafe query accepted");}catch(IllegalArgumentException expected){checks++;}}
static ResolveInfo candidate(String pkg){ResolveInfo r=new ResolveInfo();r.activityInfo=new ActivityInfo();r.activityInfo.packageName=pkg;r.activityInfo.name="SearchActivity";return r;}
static Intent request(){Intent i=AtomicWorkbenchBrowserSearch.textIntent("browser.app","  原始 文字\nQuery ");i.extras.m.put(AtomicWorkbenchProtocol.EXTRA_EXACT_TARGET,new Bundle());return i;}
public static void main(String[] args){Context c=new Context();ResolveInfo web=candidate("browser.app"),search=candidate("browser.app");c.pm.view.add(web);c.pm.search.add(search);c.pm.directSearch.add(search);
ok(AtomicWorkbenchBrowserSearch.browser(c,"browser.app",10500));ok(AtomicWorkbenchBrowserSearch.textReceiver(c,"browser.app",10500)!=null);
c.pm.view.clear();ok(AtomicWorkbenchBrowserSearch.textReceiver(c,"browser.app",10500)==null);rejects(()->AtomicWorkbenchBrowserSearch.textIntent(c,"browser.app",10500,"query"));
c.pm.view.add(web);ok(AtomicWorkbenchBrowserSearch.textIntent(c,"browser.app",10500,"query").getAction().equals(Intent.ACTION_VIEW));
Intent direct=AtomicWorkbenchBrowserSearch.textIntent(c,"browser.app",10500,"query");direct.extras.m.put(AtomicWorkbenchProtocol.EXTRA_EXACT_TARGET,new Bundle());
ok(AtomicWorkbenchBrowserSearch.sanitize(direct,"browser.app").getAction().equals(Intent.ACTION_VIEW));
for(int shape=0;shape<7;shape++){ActivityInfo a=web.activityInfo;String oldPackage=a.packageName,oldPermission=a.permission;boolean oldEnabled=a.enabled,oldExported=a.exported,oldApp=a.applicationInfo.enabled;int oldUid=a.applicationInfo.uid;
if(shape==0)a.enabled=false;if(shape==1)a.exported=false;if(shape==2)a.applicationInfo.enabled=false;if(shape==3)a.applicationInfo.uid=1010500;if(shape==4)a.packageName="other.app";if(shape==5)a.permission="private.permission";if(shape==6)web.activityInfo=null;
ok(AtomicWorkbenchBrowserSearch.textReceiver(c,"browser.app",10500)==null);web.activityInfo=a;a.packageName=oldPackage;a.permission=oldPermission;a.enabled=oldEnabled;a.exported=oldExported;a.applicationInfo.enabled=oldApp;a.applicationInfo.uid=oldUid;}
c.pm.view.clear();ok(AtomicWorkbenchBrowserSearch.textReceiver(c,"browser.app",10500)==null);c.pm.view.add(web);
Intent original=request(),clean=AtomicWorkbenchBrowserSearch.sanitize(original,"browser.app");ok(clean!=original&&clean.extras.keySet().isEmpty());ok(java.net.URLDecoder.decode(clean.data.toString().substring("https://www.bing.com/search?q=".length()),java.nio.charset.StandardCharsets.UTF_8).equals("  原始 文字\nQuery "));ok(clean.flags==0&&clean.clip==null&&clean.type==null);
rejects(()->AtomicWorkbenchBrowserSearch.sanitize(AtomicWorkbenchBrowserSearch.textIntent("browser.app","text"),"browser.app"));
for(int shape=0;shape<9;shape++){Intent i=request();if(shape==0)i.action="send";if(shape==1)i.data=android.net.Uri.parse("content://source/private");if(shape==2)i.type="image/png";if(shape==3)i.clip=new Object();if(shape==4)i.selector=new Intent("view");if(shape==5)i.component=new ComponentName("browser.app","Search");if(shape==6)i.flags=1;if(shape==7)i.extras.m.put("arbitrary","payload");if(shape==8)i.extras.m.put(SearchManager.QUERY,123);rejects(()->AtomicWorkbenchBrowserSearch.sanitize(i,"browser.app"));}
for(String text:new String[]{null,"","  ","x".repeat(32769)})rejects(()->AtomicWorkbenchBrowserSearch.textIntent("browser.app",text));
ok(AtomicWorkbenchBrowserSearch.textIntent("browser.app","x".repeat(32768)).data.toString().length()>32768);
for(String url:new String[]{"https://evil.example/search?q=query","https://www.bing.com/search?q=query&extra=1","https://www.bing.com/search?q=query#fragment","https://www.bing.com/search?q=%ZZ","https://www.bing.com/search?q=%71uery"}){Intent i=request();i.data=android.net.Uri.parse(url);rejects(()->AtomicWorkbenchBrowserSearch.sanitize(i,"browser.app"));}
Intent encoded=AtomicWorkbenchBrowserSearch.textIntent("browser.app","https://example.com/?a=1&b=2 #文字");encoded.extras.m.put(AtomicWorkbenchProtocol.EXTRA_EXACT_TARGET,new Bundle());ok(AtomicWorkbenchBrowserSearch.sanitize(encoded,"browser.app").data.toString().equals(encoded.data.toString()));ok(encoded.data.toString().contains("%26")&&encoded.data.toString().contains("%23"));
for(var kind:AtomicWorkbenchDragDeliveryPolicy.Kind.values())for(boolean text:new boolean[]{false,true})for(boolean image:new boolean[]{false,true}){
var expected=kind==AtomicWorkbenchDragDeliveryPolicy.Kind.TEXT&&text?AtomicWorkbenchDragDeliveryPolicy.Action.TEXT_SEARCH:kind==AtomicWorkbenchDragDeliveryPolicy.Kind.IMAGE&&image?AtomicWorkbenchDragDeliveryPolicy.Action.IMAGE_SEARCH:AtomicWorkbenchDragDeliveryPolicy.Action.UNSUPPORTED;
ok(AtomicWorkbenchDragDeliveryPolicy.browser(kind,text,image)==expected);}
ok(AtomicWorkbenchDragDeliveryPolicy.UNSUPPORTED.equals("当前app暂不支持"));System.out.println("PASS actual browser search / type restrictions: "+checks+" assertions");}}
'''
with tempfile.TemporaryDirectory(prefix='duo-browser-drop-') as temp:
    directory=Path(temp);sources=[]
    for name,source in STUBS.items():
        path=directory/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(source,encoding='utf-8');sources.append(path)
    for name in ('AtomicWorkbenchBrowserSearch.java','AtomicWorkbenchDragDeliveryPolicy.java'):
        path=directory/'ls/augment/com'/name;path.write_text((SRC/name).read_text(encoding='utf-8'),encoding='utf-8');sources.append(path)
    test=directory/'ls/augment/com/TestBrowserSearch.java';test.write_text(TEST,encoding='utf-8');sources.append(test)
    subprocess.run([str(JDK/'javac.exe'),'--release','17','-encoding','UTF-8','-d',str(directory/'classes'),*map(str,sources)],check=True)
    subprocess.run([str(JDK/'java.exe'),'-cp',str(directory/'classes'),'ls.augment.com.TestBrowserSearch'],check=True)
