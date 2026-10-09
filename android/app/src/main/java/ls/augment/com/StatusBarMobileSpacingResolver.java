package ls.augment.com;

import android.content.Context;
import android.os.SystemClock;
import android.view.Display;
import android.view.View;
import android.view.WindowManager;
import java.util.*;

/** Mobile-only draft validation. Missing display evidence is never rendering permission. */
final class StatusBarMobileSpacingResolver {
    private StatusBarMobileSpacingResolver(){}
    static final String[] PARTS={"signal","type","roaming","volte","activity_inout"};
    enum State { READY, NATIVE_RULE, CAPACITY, DEFERRED, COVERED, DORMANT, OVERRIDDEN }
    static boolean member(String id){return id!=null&&id.matches("mobile[12]\\.(signal|type|roaming|volte|activity_inout)");}
    static final class Entry {
        final String surface,message;final State state;
        Entry(String surface,State state,String message){this.surface=surface;this.state=state;this.message=message;}
    }
    static final class Result {
        final String scope;final List<Entry> entries=new ArrayList<>();
        Result(String scope){this.scope=scope;}
        boolean rejected(){for(Entry e:entries)if(e.state==State.CAPACITY)return true;return false;}
        boolean ready(){for(Entry e:entries)if(e.state==State.READY||e.state==State.NATIVE_RULE)return true;return false;}
        boolean deferred(){for(Entry e:entries)if(e.state==State.DEFERRED||e.state==State.COVERED||e.state==State.DORMANT)return true;return false;}
        // Shared values may be stored for currently absent/covered/unobserved locations.
        // Runtime still needs its own current, measured Plan before applying them.
        boolean editable(){return !rejected()&&(scope.equals("all")||ready());}
        String description(){StringBuilder s=new StringBuilder();for(Entry e:entries){if(s.length()>0)s.append('\n');s.append(StatusBarSurfaceSpec.label(e.surface)).append("：").append(e.message);}return s.toString();}
    }
    static final class Validation {
        final boolean allowed,deferred;final String message;
        Validation(boolean allowed,boolean deferred,String message){this.allowed=allowed;this.deferred=deferred;this.message=message;}
    }
    private static Display display(Context context){WindowManager wm=(WindowManager)context.getSystemService(Context.WINDOW_SERVICE);return wm==null?null:wm.getDefaultDisplay();}
    private static boolean current(Context context,Display display,StatusBarHeaderSpacingObservation p){
        if(display==null||p==null)return false;long now=SystemClock.elapsedRealtime();
        return p.current(now,System.currentTimeMillis()-now,BuildConfig.VERSION_CODE,display.getDisplayId(),display.getRotation(),Math.round(context.getResources().getDisplayMetrics().density*1000),Math.round(context.getResources().getConfiguration().fontScale*1000),context.getResources().getConfiguration().getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?1:0);
    }
    private static String read(Context context,String key){return context.getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString(key,"");}
    private static String dp(int px,float units){return String.valueOf((int)Math.floor(px/units));}
    private static Entry pending(String surface,String message){return new Entry(surface,State.DEFERRED,message);}
    static Result inspect(Context context,String scope,String id,Map<String,String> draft){
        return new Snapshot(context,draft).inspect(scope,id,StatusBarIconSpacingSpec.parse(draft.get(StatusBarIconSpacingSpec.KEY)));
    }
    static boolean useNativeEditor(Context context,String scope,Map<String,String> draft){
        boolean circle=ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP))&&("all".equals(scope)||StatusBarCircleSpacingResolver.surface(scope));
        if(!circle&&!"1".equals(draft.get(SystemUiOptions.SIGNAL_DUAL)))return true;
        Snapshot snapshot=new Snapshot(context,draft);
        if(circle)return false;
        for(String surface:scope.equals("all")?StatusBarSurfaceSpec.SURFACES:new String[]{scope}){
            DualSignalSpacingObservation d=snapshot.dual.get(surface);
            if(d==null||!surface.equals(d.surface)||!d.reason.equals("disabled")||!current(context,snapshot.display,d.profile)||!snapshot.environment.equals(d.environmentKey))return false;
        }
        return true;
    }
    /** Read/cache one immutable observation set per form refresh, not per slider trial. */
    static final class Snapshot {
        final Context context;final Display display;final Map<String,String> draft;
        final String environment,liveEnvironment;
        final StatusBarCircleSpacingResolver.Snapshot circles;
        final Map<String,DualSignalSpacingObservation> dual=new HashMap<>();
        final Map<String,StatusBarHeaderSpacingObservation> headers=new HashMap<>();
        Snapshot(Context context,Map<String,String> draft){
            this.context=context;this.display=display(context);this.draft=new LinkedHashMap<>(draft);
            environment=DualSignalSpacingObservation.environment(draft);
            liveEnvironment=DualSignalSpacingObservation.environment(new AppConfig(context).snapshot());
            circles=new StatusBarCircleSpacingResolver.Snapshot(context,draft);
            if(display!=null)for(String surface:StatusBarSurfaceSpec.SURFACES){
                dual.put(surface,DualSignalSpacingObservation.parse(read(context,DualSignalSpacingObservation.key(surface,display.getRotation()))));
                headers.put(surface,StatusBarHeaderSpacingObservation.parse(read(context,StatusBarHeaderSpacingObservation.KEY+surface+"_"+display.getRotation())));
            }
        }
        Result inspect(String scope,String id,StatusBarIconSpacingSpec spec){
        Result result=new Result(scope);
        if(!member(id)||spec==null||!StatusBarSurfaceSpec.validScope(scope))return result;
        StatusBarVisibilitySpec visibility=StatusBarVisibilitySpec.parse(draft.get(StatusBarVisibilitySpec.KEY));
        int slot=id.charAt(6)-'1';String part=id.substring(id.indexOf('.')+1);
        for(String surface:scope.equals("all")?StatusBarSurfaceSpec.SURFACES:new String[]{scope}){
            if(scope.equals("all")&&spec.explicit(surface,id)!=null){result.entries.add(new Entry(surface,State.OVERRIDDEN,"已有单独边距，共享值不覆盖此位置"));continue;}
            if(visibility!=null&&visibility.hidden(surface,id)){result.entries.add(new Entry(surface,State.DORMANT,"此图标已设为隐藏；边距参数保留待用"));continue;}
            Entry circleEntry=circles.circle(surface,id,spec);
            if(circleEntry!=null){result.entries.add(circleEntry);continue;}
            if(display==null){result.entries.add(pending(surface,"显示信息未确认；参数待核验"));continue;}
            DualSignalSpacingObservation d=dual.get(surface);
            boolean hasDual=d!=null&&surface.equals(d.surface)&&current(context,display,d.profile)&&environment.equals(d.environmentKey);
            if(hasDual&&!d.reason.equals("disabled")){
                if(d.reason.equals("awaiting_layout")||d.reason.equals("grid_pending")||d.reason.equals("slot_unknown")||d.reason.equals("native_hidden")){
                    result.entries.add(pending(surface,d.reason.equals("native_hidden")?"当前图标未显示；参数待用":"原生布局或 SIM 映射尚未完成；请显示此位置后刷新"));continue;
                }
                if(d.wholeConsumes){result.entries.add(new Entry(surface,State.COVERED,"当前由双排整图素材覆盖；内部边距暂不参与，参数保留"));continue;}
                if(!d.eligible(slot,part)){
                    result.entries.add(new Entry(surface,State.DORMANT,part.equals("activity_inout")?"当前不是可绘制活动箭头的数据卡；参数待用":"当前 SIM 或此子图标未显示；参数待用"));continue;
                }
                int[] needed=d.required(spec);if(needed==null){result.entries.add(pending(surface,"空间数据无效；请显示此位置后刷新"));continue;}String rows=d.rowSlots.length==1?"SIM "+(d.rowSlots[0]+1)+" 在下排":"SIM "+(d.rowSlots[0]+1)+" 在上、SIM "+(d.rowSlots[1]+1)+" 在下";
                String capacity="双排信号，"+rows+"；最近可用宽 "+dp(d.maxWidth,d.units())+" dp、高 "+dp(d.maxHeight,d.units())+" dp";
                boolean fits=d.accepts(spec);result.entries.add(new Entry(surface,fits?State.READY:State.CAPACITY,capacity+(fits?"，可容纳当前参数":"；当前参数所需 "+dp(needed[0],d.units())+"×"+dp(needed[1],d.units())+" dp，超出可用空间")));continue;
            }
            // A missing DSS cannot authorize a configured virtual carrier. A disabled
            // tombstone only releases the virtual claim, not native visibility.
            boolean circle=ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP))&&StatusBarCircleSpacingResolver.surface(surface);
            boolean nativePath=!circle&&(hasDual&&d.reason.equals("disabled")||!"1".equals(draft.get(SystemUiOptions.SIGNAL_DUAL)));
            // Preserve the existing ordinary main/lock parameter path. HSC belongs
            // only to panel headers; a circle or unknown virtual carrier cannot use it.
            if(nativePath&&(surface.equals("main")||surface.equals("lock"))){
                result.entries.add(new Entry(surface,State.NATIVE_RULE,"原生子图标规则；四边保留原有 0–24 dp 参数范围，仍由原生布局处理。此处未测得双排容量，也不代表当前图标可见"));continue;
            }
            boolean unchangedEnvironment=environment.equals(liveEnvironment);
            if(nativePath&&unchangedEnvironment&&(surface.equals("control")||surface.equals("notification"))){
                StatusBarHeaderSpacingObservation h=headers.get(surface);
                if(current(context,display,h)){
                    boolean fits=spec.resolve(surface,id).vertical()<=h.vertical;
                    result.entries.add(new Entry(surface,fits?State.READY:State.CAPACITY,"原生子图标路径；最近上下合计最多 "+h.vertical+" dp"+(fits?"（不代表此图标当前可见）":"，当前上下参数超限")));continue;
                }
            }
            result.entries.add(pending(surface,circle?"三合一内部图层的独立边距尚待适配；参数保留待用":"尚无当前设置下的载体与空间；请显示此位置后刷新"));
        }
        return result;
        }
    }
    static boolean same(StatusBarIconSpacingSpec.Insets a,StatusBarIconSpacingSpec.Insets b){return a==b||a!=null&&b!=null&&a.start==b.start&&a.top==b.top&&a.end==b.end&&a.bottom==b.bottom;}
    static Validation validateChanges(Context context,Map<String,String> before,Map<String,String> draft){
        if(Objects.equals(before.get(StatusBarIconSpacingSpec.KEY),draft.get(StatusBarIconSpacingSpec.KEY)))return new Validation(true,false,"");
        StatusBarIconSpacingSpec old=StatusBarIconSpacingSpec.parse(before.get(StatusBarIconSpacingSpec.KEY)),next=StatusBarIconSpacingSpec.parse(draft.get(StatusBarIconSpacingSpec.KEY));
        if(old==null||next==null)return new Validation(false,false,"图标间距格式无效，本次未保存");
        boolean deferred=false;Snapshot snapshot=new Snapshot(context,draft);
        for(String scope:StatusBarSurfaceSpec.SCOPES)for(int slot=1;slot<=2;slot++)for(String part:PARTS){
            String id="mobile"+slot+"."+part;StatusBarIconSpacingSpec.Insets value=next.explicit(scope,id);
            if(same(old.explicit(scope,id),value)||value==null||value.isZero())continue;
            Result result=snapshot.inspect(scope,id,next);
            if(result.rejected())return new Validation(false,false,result.description()+"\n空间已变化，本次未保存；请调整边距或恢复继承。");
            // Applying ART/SV1 in the same draft may invalidate a prior observation.
            // Store that explicitly as pending; never claim that the new carrier fit.
            deferred|=result.deferred()||!result.ready();
        }
        return new Validation(true,deferred,deferred?"已保存；部分图标边距待对应页面显示后核验":"");
    }
}
