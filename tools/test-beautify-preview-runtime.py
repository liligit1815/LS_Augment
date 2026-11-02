"""Execute the production preview hook across native download/apply, off and missing capabilities."""
from pathlib import Path
import ast, os, subprocess, tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com/hook'
# Reuse only the Android/Xposed boundaries, without executing the other test suite.
tree = ast.parse((ROOT / 'tools/test-theme-trial-runtime.py').read_text(encoding='utf8'))
S = ast.literal_eval(next(n.value for n in tree.body if isinstance(n, ast.Assign) and any(isinstance(t, ast.Name) and t.id == 'S' for t in n.targets)))
S['io/github/libxposed/api/XposedInterface.java'] = S['io/github/libxposed/api/XposedInterface.java'].replace('public Object proceed()throws', 'public Object proceed(Object[] replacement)throws Throwable {args=replacement;return proceed();}public Object proceed()throws')
S.update({
'android/view/View.java': '''package android.view;public class View {public interface OnClickListener{void onClick(View v);}public OnClickListener listener;public boolean visible;public void setOnClickListener(OnClickListener l){listener=l;}public void click(){listener.onClick(this);}}''',
'android/widget/Button.java': '''package android.widget;public class Button extends android.view.View{public String text;public void setText(CharSequence s){text=s.toString();}}''',
'com/zte/beautify/model/local/data/Bean.java': '''package com.zte.beautify.model.local.data;public class Bean {public int type=1;public String id="downloaded",path="/native/try/theme.zip",from="try";public int getResType(){return type;}public String getSrcId(){return id;}}''',
'com/zte/beautify/view/common/preview/tryuse/TryUseJobHelper.java': '''package com.zte.beautify.view.common.preview.tryuse;public class TryUseJobHelper {public static boolean theme=true,font=true;public static void setTringTheme(boolean b){theme=b;}public static void setTringFont(boolean b){font=b;}}''',
'com/zte/beautify/view/base/BaseSetWallPaperManager.java': '''package com.zte.beautify.view.base;import android.content.Context;import com.zte.beautify.model.local.data.Bean;public class BaseSetWallPaperManager {public int trials,normal;public Bean applied;public boolean fail;public void tryUseDirectly(Context c,Bean b){trials++;}public void showDialogOnPreview(Context c,Bean b){normal++;applied=b;if(fail)throw new IllegalStateException("compatibility failure");}}''',
'com/zte/beautify/view/common/preview/online/OnlineThemePreviewFragment.java': '''package com.zte.beautify.view.common.preview.online;
import android.content.*;import android.view.*;import android.widget.*;import com.zte.beautify.model.local.data.Bean;import com.zte.beautify.view.base.BaseSetWallPaperManager;
public class OnlineThemePreviewFragment {
 public Bean mBean=new Bean();public Context mContext=new Context();public Button mBeautyBtnBuy=new Button(),mBeautyBtnApplication=new Button(),mBeautyBtnTry=new Button();public int currentButtonState=-1,downloads,prepares;public BaseSetWallPaperManager manager=new BaseSetWallPaperManager();
 public View.OnClickListener tryDownloadListener=v->{downloads++;};public View.OnClickListener tryApplyListener=v->{prepares++;try{ls.augment.com.hook.AugmentModule.active.call(BaseSetWallPaperManager.class,manager,"tryUseDirectly",new Class[]{Context.class,Bean.class},mContext,mBean);}catch(Throwable e){throw new RuntimeException(e);}};
 private void refreshButtonState(){}private boolean themeDownload(boolean t){return true;}private void doApplyTheme(){}private void doApplyFont(){}
 private void showButton(int state){if(currentButtonState==state)return;currentButtonState=state;mBeautyBtnBuy.visible=mBeautyBtnTry.visible=mBeautyBtnApplication.visible=false;
 if(state==0){mBeautyBtnTry.visible=mBeautyBtnBuy.visible=true;mBeautyBtnBuy.setText("购买");}if(state==3){mBeautyBtnBuy.visible=true;mBeautyBtnBuy.setText("下载");mBeautyBtnBuy.setOnClickListener(v->{throw new AssertionError("payment route");});}
 if(state==12){mBeautyBtnTry.visible=mBeautyBtnBuy.visible=true;}if(state==6||state==7||state==23||state==26){mBeautyBtnApplication.visible=true;mBeautyBtnApplication.setText("应用");mBeautyBtnApplication.setOnClickListener(v->{throw new AssertionError("missing native resource preparation");});}}
}''',
'ls/augment/com/hook/TestBeautifyPreview.java': '''package ls.augment.com.hook;
import com.zte.beautify.view.common.preview.online.OnlineThemePreviewFragment;import com.zte.beautify.view.base.BaseSetWallPaperManager;import com.zte.beautify.model.local.data.Bean;import com.zte.beautify.view.common.preview.tryuse.TryUseJobHelper;import android.content.Context;
public class TestBeautifyPreview {
 static int checks;static void yes(boolean v,String why){checks++;if(!v)throw new AssertionError(why);}static void show(AugmentModule m,OnlineThemePreviewFragment f,int state)throws Throwable{m.call(f.getClass(),f,"showButton",new Class[]{int.class},state);}
 public static void main(String[] args)throws Throwable{
 AugmentModule m=new AugmentModule();AugmentModule.active=m;int installed=BeautifyPreviewHook.install(m,TestBeautifyPreview.class.getClassLoader());
 if(args.length>0){yes(installed==0&&m.hooks.isEmpty(),"unknown contract must leave native behavior");System.out.println("PASS preview missing capability: "+args[0]);return;}
 yes(installed==2&&m.errors.isEmpty(),"two native preview hooks");FeatureSettings.trial=true;FeatureSettings.master=false;OnlineThemePreviewFragment f=new OnlineThemePreviewFragment();
 show(m,f,0);yes(f.currentButtonState==3&&f.mBeautyBtnBuy.visible&&!f.mBeautyBtnTry.visible&&!f.mBeautyBtnApplication.visible&&"下载".equals(f.mBeautyBtnBuy.text),"only download before download");f.mBeautyBtnBuy.click();yes(f.downloads==1,"original trial downloader preserves valid resource acquisition");
 show(m,f,12);yes(f.currentButtonState==6&&f.mBeautyBtnApplication.visible&&!f.mBeautyBtnBuy.visible&&!f.mBeautyBtnTry.visible&&"使用".equals(f.mBeautyBtnApplication.text),"only use after download");f.mBeautyBtnApplication.click();yes(f.prepares==1&&f.manager.normal==1&&f.manager.trials==0&&!TryUseJobHelper.theme,"native preparation and normal application without trial start");yes(f.manager.applied==f.mBean&&"try".equals(f.mBean.from)&&f.mBean.path.equals("/native/try/theme.zip"),"resource identity and paths preserved");
 show(m,f,12);f.mBeautyBtnApplication.click();yes(f.manager.normal==2&&f.manager.trials==0,"repeated cached state retains correct listener");
 f.mBean.type=4;f.mBeautyBtnApplication.click();yes(!TryUseJobHelper.font&&f.manager.normal==3,"font normal application");
 for(int state:new int[]{6,7,23,26}){show(m,f,state);yes("使用".equals(f.mBeautyBtnApplication.text),"native apply state uses requested label");}
 show(m,f,5);yes(f.currentButtonState==5&&!f.mBeautyBtnApplication.visible,"native progress retained");
 FeatureSettings.trial=false;show(m,f,12);yes(f.currentButtonState==12&&f.mBeautyBtnTry.visible&&f.mBeautyBtnBuy.visible,"off restores native buttons");m.call(BaseSetWallPaperManager.class,f.manager,"tryUseDirectly",new Class[]{Context.class,Bean.class},f.mContext,f.mBean);yes(f.manager.trials==1,"off restores native trial");
 FeatureSettings.trial=true;show(m,f,12);yes(f.currentButtonState==6&&!f.mBeautyBtnBuy.visible,"reenable replaces previous native state");
 f.mBean.type=99;show(m,f,0);yes(f.currentButtonState==0,"unknown resource native");m.call(BaseSetWallPaperManager.class,f.manager,"tryUseDirectly",new Class[]{Context.class,Bean.class},f.mContext,f.mBean);yes(f.manager.trials==2,"unknown resource no conversion");
 f.mBean.type=1;f.mBean.id="";show(m,f,12);yes(f.currentButtonState==12,"missing identity native");f.mBean.id="downloaded";FeatureSettings.verified=false;show(m,f,0);yes(f.currentButtonState==0,"unverified configuration native");FeatureSettings.verified=true;
 f.tryApplyListener=null;show(m,f,12);yes(f.currentButtonState==12,"missing listener native");
 f.manager.fail=true;boolean threw=false;try{m.call(BaseSetWallPaperManager.class,f.manager,"tryUseDirectly",new Class[]{Context.class,Bean.class},f.mContext,f.mBean);}catch(IllegalStateException expected){threw=true;}yes(threw&&f.manager.trials==2,"native compatibility failure does not start trial fallback");
 System.out.println("PASS production preview: "+checks+" checks");
 }}'''
})
bin = Path(os.environ['JAVA_HOME']) / 'bin'
variants = {'valid': None, 'missing_normal_apply': ('com/zte/beautify/view/base/BaseSetWallPaperManager.java', 'showDialogOnPreview', 'missingNormal'), 'missing_listener': ('com/zte/beautify/view/common/preview/online/OnlineThemePreviewFragment.java', 'tryDownloadListener', 'missingDownload')}
for label, mutation in variants.items():
    with tempfile.TemporaryDirectory(prefix='duo-preview-') as temp:
        sources = dict(S)
        if mutation:
            name, old, new = mutation
            sources[name] = sources[name].replace(old, new)
        paths = []
        for name, code in sources.items():
            path = Path(temp) / name; path.parent.mkdir(parents=True, exist_ok=True); path.write_text(code, encoding='utf8'); paths.append(path)
        paths.extend(SRC / (name + '.java') for name in ['BeautifyTrialGate', 'BeautifyPreviewHook'])
        subprocess.run([str(bin / 'javac.exe'), '-encoding', 'UTF-8', '--release', '17', '-d', temp, *map(str, paths)], check=True)
        subprocess.run([str(bin / 'java.exe'), '-cp', temp, 'ls.augment.com.hook.TestBeautifyPreview', *([] if label == 'valid' else [label])], check=True)
