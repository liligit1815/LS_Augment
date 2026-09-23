"""Run the production mode hooks with OEM-shaped fixtures; optionally verify real APK contracts.

This is a JVM regression, not an on-device Android/Xposed test.
"""
import argparse
import importlib.util
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
HOOKS = ROOT / 'android/app/src/main/java/ls/augment/com/hook'

FILES = {
    'android/content/Context.java': 'package android.content; public class Context {}',
    'android/content/ContentResolver.java': 'package android.content; public class ContentResolver {}',
    'android/graphics/Rect.java': '''package android.graphics;
public class Rect {
    public int left, top, right, bottom;
    public Rect(int l,int t,int r,int b) {left=l;top=t;right=r;bottom=b;}
    public Rect(Rect r) {this(r.left,r.top,r.right,r.bottom);}
}''',
    'cn/nubia/tgk/TgkHelper.java': '''package cn.nubia.tgk;
public class TgkHelper {
    public static boolean IS_SUPPORT_TGK_SHORTCUT_FUNCTION;
    public static final int TGK_CONTROL_SGAME_MAP_VIEW=10, TGK_CONTROL_SGAME_SCORE_VIEW=11, TGK_OFF_OPT=9, TGK_SINGLE_OPT=0;
    public static int loads;
    public static void loadingTgkCases(android.content.ContentResolver c,cn.nubia.tgk.data.TgkGameInfo info) {loads++;}
}''',
    'cn/nubia/tgk/data/TgkData.java': '''package cn.nubia.tgk.data;
import android.content.Context;
import android.graphics.Rect;
public class TgkData {
    public String packageName;
    public int[] optionArray={0,0,9}, setLinkFlagArray={0,0,0};
    public int isLandscape=1, calls, state=5;
    public long ID=47;
    public boolean mainSw=true, vibrateSw=true;
    public boolean[] optionSwArray={true,false,false};
    public String showName="user case";
    public Rect[][] pointsArray=new Rect[3][2];
    public TgkData(String pkg,int type) {packageName=pkg;updateDefaultPointsArray(1);}
    public void updateDefaultPointsArray(int orientation) {
        for(int i=0;i<3;i++)for(int j=0;j<2;j++) {
            int x=(orientation==1?200:400)+i*50+j*10;
            pointsArray[i][j]=new Rect(x,300,x+20,320);
        }
    }
    public void setCustomizedTgkData(Context c,int n) {
        calls++;
        if(n<0)throw new IllegalArgumentException("OEM failure");
        if(packageName.equals("com.tencent.tmgp.sgame") || packageName.equals("com.tencent.tmgp.sgamece"))
            optionArray=new int[]{10,11,9};
    }
}''',
    'cn/nubia/tgk/data/TgkGameInfo.java': '''package cn.nubia.tgk.data;
import java.util.ArrayList;
public class TgkGameInfo {
    public ArrayList<TgkData> presetTableList=new ArrayList<>(), importTableList=new ArrayList<>();
    public int selectedTableId,selectedCasePosition;
    public TgkData getSelectedCaseData() {
        ArrayList<TgkData> list=selectedTableId==1?importTableList:presetTableList;
        return list.isEmpty()?null:list.get(selectedCasePosition);
    }
}''',
    'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;
import java.lang.reflect.*;
import java.util.*;
class AugmentModule {
    final Map<Method,Interceptor> hooks=new HashMap<>();
    final List<String> logs=new ArrayList<>();
    final List<Throwable> errors=new ArrayList<>();
    interface Interceptor {Object run(Chain c)throws Throwable;}
    static class Chain {
        final Method method; final Object owner; final Object[] args; int calls;
        Chain(Method m,Object o,Object...a) {method=m;owner=o;args=a;}
        Object getThisObject(){return owner;}
        Object getArg(int i){return args[i];}
        Object proceed()throws Throwable {
            calls++;
            try{return method.invoke(owner,args);}catch(InvocationTargetException e){throw e.getCause();}
        }
    }
    class Builder {
        final Method method;
        Builder(Method m){method=m;}
        Object intercept(Interceptor i){hooks.put(method,i);return i;}
    }
    Builder prepareFeatureHook(Method m,String id,boolean before){return new Builder(m);}
    void registerFeatureHook(Object h){}
    void logFeatureInfo(String s){logs.add(s);}
    void logFeatureError(String s,Throwable t){errors.add(t);}
    Object call(Method m,Object o,Object...args)throws Throwable {
        Chain c=new Chain(m,o,args);
        try{return hooks.containsKey(m)?hooks.get(m).run(c):c.proceed();}
        finally{if(c.calls!=1)throw new AssertionError("OEM must run exactly once: "+m);}
    }
}''',
    'ls/augment/com/hook/TestModeCompat.java': r'''package ls.augment.com.hook;
import android.content.Context;
import android.content.ContentResolver;
import android.graphics.Rect;
import cn.nubia.tgk.TgkHelper;
import cn.nubia.tgk.data.*;
import java.lang.reflect.*;
import java.util.*;
public class TestModeCompat {
    static boolean master=true, shoulder=true, eligible=true;
    static int assertions;
    static final String GAME="com.tencent.tmgp.sgame";
    static Method customize, selected;
    static AugmentModule module;
    static void check(boolean ok,String message){assertions++;if(!ok)throw new AssertionError(message);}
    static void modes(TgkData d,int...expected){check(Arrays.equals(d.optionArray,expected),"modes "+Arrays.toString(d.optionArray));}
    static TgkData special(String pkg){TgkData d=new TgkData(pkg,0);d.optionArray=new int[]{10,11,9};return d;}
    static TgkData select(TgkData d,boolean imported)throws Throwable {
        TgkGameInfo info=new TgkGameInfo();
        (imported?info.importTableList:info.presetTableList).add(d);
        info.selectedTableId=imported?1:0;
        Object out=module.call(selected,info);
        check(out==d,"selected identity preserved");
        check(info.selectedTableId==(imported?1:0)&&info.selectedCasePosition==0,"table selection preserved");
        return (TgkData)out;
    }
    static void panel(TgkData d){
        // Reproduce both ordinary-panel array consumers that used to throw at 10/11.
        int[] titles=new int[10];Object[] floatingButtons=new Object[10];
        for(int mode:d.optionArray){int title=titles[mode];Object button=floatingButtons[mode];}
        assertions++;
    }
    public static void main(String[] args)throws Throwable {
        module=new AugmentModule();
        check(ShoulderModeCompatibilityHook.install(module,TestModeCompat.class.getClassLoader(),
                p->master&&shoulder&&eligible)==3,"install all three hooks");
        customize=TgkData.class.getDeclaredMethod("setCustomizedTgkData",Context.class,int.class);
        selected=TgkGameInfo.class.getDeclaredMethod("getSelectedCaseData");
        for(String pkg:new String[]{GAME,"com.tencent.tmgp.sgamece"}) {
            for(int[] before:new int[][]{{0,0,9},{2,1,7}}){
                TgkData d=new TgkData(pkg,0);d.optionArray=before.clone();
                module.call(customize,d,new Context(),1);
                modes(d,before[0],before[1],9);check(d.calls==1,"customize side effect");panel(d);
            }
            for(boolean imported:new boolean[]{false,true}) {
                TgkData d=special(pkg);d.mainSw=false;
                d.setLinkFlagArray=new int[]{1000,1011,123};
                int[] aliasedModes=d.optionArray,aliasedLinks=d.setLinkFlagArray;
                Rect[][] aliasedPoints=d.pointsArray;
                boolean[] switches=d.optionSwArray;
                select(d,imported);modes(d,0,0,9);panel(d);
                check(Arrays.equals(aliasedModes,new int[]{10,11,9}),"no aliased mode mutation");
                check(Arrays.equals(aliasedLinks,new int[]{1000,1011,123}),"no aliased link mutation");
                check(Arrays.equals(d.setLinkFlagArray,new int[]{0,0,123}),"only converted links cleared");
                check(d.pointsArray[0][0]==aliasedPoints[0][0]&&d.pointsArray[1][1]==aliasedPoints[1][1],"valid user points retained");
                check(d.pointsArray[2]==aliasedPoints[2],"normal direction unchanged");
                check(d.ID==47&&d.state==5&&!d.mainSw&&d.vibrateSw&&d.showName.equals("user case")&&d.optionSwArray==switches,"metadata and switches retained");
                int[] normalized=d.optionArray;Rect[][] repaired=d.pointsArray;
                select(d,imported);check(d.optionArray==normalized&&d.pointsArray==repaired,"idempotent selection");
            }
        }
        for(int orientation:new int[]{0,1}) {
            TgkData d=special(GAME);d.isLandscape=orientation;
            Rect keep=d.pointsArray[0][1];
            d.pointsArray[0][0]=new Rect(-1,-1,-1,-1);d.pointsArray[1]=null;d.setLinkFlagArray=null;
            select(d,false);modes(d,0,0,9);panel(d);
            check(d.pointsArray[0][0].left==(orientation==1?200:400),"OEM orientation-aware defaults");
            check(d.pointsArray[0][1]==keep,"valid second point preserved");
            check(d.pointsArray[1][1].right>d.pointsArray[1][1].left,"missing direction repaired");
        }
        for(int a=0;a<=9;a++) {
            TgkData d=new TgkData(GAME,0);d.optionArray=new int[]{a,9-a,9};
            int[] old=d.optionArray;Rect[][] p=d.pointsArray;
            select(d,false);check(d.optionArray==old&&d.pointsArray==p,"ordinary modes unchanged");panel(d);
        }
        TgkData mixed=special(GAME);mixed.optionArray=new int[]{10,5,9};select(mixed,false);modes(mixed,0,5,9);
        for(int gates=0;gates<4;gates++) {
            master=(gates&1)!=0;shoulder=(gates&2)!=0;
            TgkData d=special(GAME);int[] old=d.optionArray;select(d,false);
            check(master&&shoulder?d.optionArray!=old:d.optionArray==old,"both module switches required");
            TgkData fresh=new TgkData(GAME,0);module.call(customize,fresh,new Context(),0);
            modes(fresh,master&&shoulder?0:10,master&&shoulder?0:11,9);
        }
        master=shoulder=true;
        eligible=false;TgkData excluded=special(GAME);select(excluded,false);modes(excluded,10,11,9);eligible=true;
        TgkData other=special("other.app");select(other,false);modes(other,10,11,9);
        TgkHelper.IS_SUPPORT_TGK_SHORTCUT_FUNCTION=true;
        TgkData shortcut=special(GAME);select(shortcut,false);modes(shortcut,10,11,9);
        module.call(customize,shortcut,new Context(),0);modes(shortcut,10,11,9);
        TgkHelper.IS_SUPPORT_TGK_SHORTCUT_FUNCTION=false;
        TgkGameInfo loaded=new TgkGameInfo();
        for(int i=0;i<5;i++)loaded.presetTableList.add(special(GAME));
        loaded.importTableList.add(special(GAME));loaded.selectedCasePosition=3;
        Object presets=loaded.presetTableList, imports=loaded.importTableList;
        Method load=TgkHelper.class.getDeclaredMethod("loadingTgkCases",ContentResolver.class,TgkGameInfo.class);
        module.call(load,null,new ContentResolver(),loaded);
        check(TgkHelper.loads==1&&loaded.selectedCasePosition==3,"load side effects and selection retained");
        check(loaded.presetTableList==presets&&loaded.importTableList==imports,"table identities preserved");
        for(TgkData d:loaded.presetTableList){modes(d,0,0,9);panel(d);}
        for(TgkData d:loaded.importTableList){modes(d,0,0,9);panel(d);}
        loaded.importTableList.add(special(GAME));shoulder=false;
        module.call(load,null,new ContentResolver(),loaded);modes(loaded.importTableList.get(1),10,11,9);shoulder=true;
        check(module.call(selected,new TgkGameInfo())==null,"null selection passthrough");
        try{module.call(customize,new TgkData(GAME,0),new Context(),-1);throw new AssertionError("OEM exception swallowed");}
        catch(IllegalArgumentException expected){check(expected.getMessage().equals("OEM failure"),"original exception retained");}
        TgkData unknown=special(GAME);unknown.optionArray=new int[]{12,-1,9};int[] original=unknown.optionArray;
        select(unknown,false);check(unknown.optionArray==original,"unknown OEM modes untouched");
        check(module.errors.isEmpty(),"no compatibility errors: "+module.errors);
        check(module.logs.stream().anyMatch(s->s.contains("from=[10, 11, 9] to=[0, 0, 9]")),"conversion diagnostic");
        System.out.println("PASS production shoulder mode hooks: "+assertions+" assertions");
    }
}''',
    'ls/augment/com/hook/TestLegacy.java': '''package ls.augment.com.hook;
public class TestLegacy {
    public static void main(String[] args) {
        AugmentModule module=new AugmentModule();
        if(ShoulderModeCompatibilityHook.install(module,TestLegacy.class.getClassLoader(),p->true)!=0
                || !module.hooks.isEmpty() || !module.errors.isEmpty())throw new AssertionError("Legacy must skip");
        System.out.println("PASS legacy GameSpace installs no mode hooks");
    }
}''',
}


def check_apk(path, legacy):
    spec = importlib.util.spec_from_file_location('oem', ROOT / 'tools/check-shoulder-oem-targets.py')
    reader = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(reader)
    classes = reader.load_apk(path)
    helper = classes['Lcn/nubia/tgk/TgkHelper;']
    flag = 'IS_SUPPORT_TGK_SHORTCUT_FUNCTION:Z'
    if legacy:
        assert flag not in helper['fields'], 'Expected older GameSpace without shortcut flag'
    else:
        for field in [flag, 'TGK_CONTROL_SGAME_MAP_VIEW:I', 'TGK_CONTROL_SGAME_SCORE_VIEW:I', 'TGK_OFF_OPT:I', 'TGK_SINGLE_OPT:I']:
            assert helper['fields'][field] & 8, field
        data = classes['Lcn/nubia/tgk/data/TgkData;']
        for field in ['packageName:Ljava/lang/String;', 'optionArray:[I', 'pointsArray:[[Landroid/graphics/Rect;',
                      'setLinkFlagArray:[I', 'isLandscape:I']:
            assert not data['fields'][field] & 8, field
        for method in ['<init>(Ljava/lang/String;I)V', 'setCustomizedTgkData(Landroid/content/Context;I)V',
                       'updateDefaultPointsArray(I)V']:
            assert not data['methods'][method] & 8, method
        info = classes['Lcn/nubia/tgk/data/TgkGameInfo;']
        assert not info['methods']['getSelectedCaseData()Lcn/nubia/tgk/data/TgkData;'] & 8
        for field in ['presetTableList:Ljava/util/ArrayList;', 'importTableList:Ljava/util/ArrayList;']:
            assert not info['fields'][field] & 8, field
        assert helper['methods']['loadingTgkCases(Landroid/content/ContentResolver;Lcn/nubia/tgk/data/TgkGameInfo;)V'] & 8
    print('PASS real APK ' + ('legacy skip' if legacy else 'compatibility contracts') + ': ' + str(path), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--fault-apk', type=Path)
    parser.add_argument('--legacy-apk', type=Path)
    args = parser.parse_args()
    for path, legacy in [(args.fault_apk, False), (args.legacy_apk, True)]:
        if path:
            check_apk(path, legacy)
    with tempfile.TemporaryDirectory(prefix='ls-shoulder-modes-') as temp:
        root = Path(temp)
        for name, source in FILES.items():
            dest = root / name
            dest.parent.mkdir(parents=True, exist_ok=True)
            dest.write_text(source, encoding='utf-8')
        for name in ['ShoulderModeCompatibilityHook.java', 'ShoulderHookTargets.java']:
            (root / 'ls/augment/com/hook' / name).write_text((HOOKS / name).read_text(encoding='utf-8'), encoding='utf-8')
        subprocess.run(['javac', '-encoding', 'UTF-8', '-d', temp, *map(str, root.rglob('*.java'))], check=True)
        subprocess.run(['java', '-cp', temp, 'ls.augment.com.hook.TestModeCompat'], check=True)
        legacy_helper = root / 'cn/nubia/tgk/TgkHelper.java'
        legacy_helper.write_text('package cn.nubia.tgk; public class TgkHelper {}', encoding='utf-8')
        subprocess.run(['javac', '-d', temp, str(legacy_helper)], check=True)
        subprocess.run(['java', '-cp', temp, 'ls.augment.com.hook.TestLegacy'], check=True)


if __name__ == '__main__':
    main()
