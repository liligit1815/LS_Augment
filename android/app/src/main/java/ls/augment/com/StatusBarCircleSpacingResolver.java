package ls.augment.com;

import android.content.Context;
import android.os.SystemClock;
import android.view.Display;
import android.view.View;
import android.view.WindowManager;
import java.util.*;
import static ls.augment.com.StatusBarMobileSpacingResolver.State;

/** Consumes phone-measured immutable CCS; never remeasures glyphs or artwork in the editor. */
final class StatusBarCircleSpacingResolver {
    private StatusBarCircleSpacingResolver(){}
    static boolean member(String id){return "wifi.signal".equals(id)||"mobile1.signal".equals(id)||"mobile2.signal".equals(id);}
    static boolean surface(String value){return "main".equals(value)||"lock".equals(value);}
    static boolean applies(String scope,String id,Map<String,String> draft){return member(id)&&("all".equals(scope)||surface(scope))&&ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP));}
    private static StatusBarMobileSpacingResolver.Entry entry(String surface,State state,String message){return new StatusBarMobileSpacingResolver.Entry(surface,state,message);}
    private static StatusBarMobileSpacingResolver.Entry pending(String surface,String message){return entry(surface,State.DEFERRED,message);}
    private static boolean current(Context c,Display d,StatusBarHeaderSpacingObservation p){
        if(d==null||p==null)return false;long now=SystemClock.elapsedRealtime();
        // Producer refreshes unchanged CCS at30s; the shared profile allows10min.
        // A different display/build/font/rotation/boot is still rejected immediately.
        return p.current(now,System.currentTimeMillis()-now,BuildConfig.VERSION_CODE,d.getDisplayId(),d.getRotation(),Math.round(c.getResources().getDisplayMetrics().density*1000),Math.round(c.getResources().getConfiguration().fontScale*1000),c.getResources().getConfiguration().getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?1:0);
    }
    private static String read(Context c,String key){return c.getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString(key,"");}
    private static String size(int pixels,float density,boolean required){return String.valueOf((int)(required?Math.ceil(pixels/density):Math.floor(pixels/density)));}
    private static String rejection(String why){switch(why){
        case "capacity":return "完整排列空间不足";
        case "cell_overlap":return "与另一个信号图层的预留区域重叠";
        case "stationary_overlap":return "与电量文字或其它固定内容的预留区域重叠";
        case "nonlower_ring_overlap":return "与电池圆环重叠";
        case "ring_interval_unsupported":return "当前圆环开口无法容纳这组边距";
        case "ring_material_gap":return "当前圆环素材不能调整到所需开口";
        default:return "当前组合不能安全排列";
    }}
    private static boolean unmeasured(String reason){return Arrays.asList("awaiting_layout","grid_pending","overflow","slot_unknown","slot_ambiguous","unmeasured_stationary","invalid_stationary").contains(reason);}
    static StatusBarMobileSpacingResolver.Result inspect(Context context,String scope,String id,Map<String,String> draft){
        return new Snapshot(context,draft).inspectWifi(scope,id,StatusBarIconSpacingSpec.parse(draft.get(StatusBarIconSpacingSpec.KEY)));
    }
    /** One immutable observation set per form sync, shared by every candidate trial. */
    static final class Snapshot {
        final Context context;final Display display;final Map<String,String> draft;
        final String environment,wifiEnvironment,liveWifiEnvironment;
        final Map<String,CircleConnectivitySpacingObservation> circles=new HashMap<>();
        final Map<String,StatusBarWifiSpacingObservation> wifi=new HashMap<>();
        final Map<String,StatusBarWifiAssetSpacingObservation> wifiAssets=new HashMap<>();
        final Map<String,StatusBarHeaderSpacingObservation> headers=new HashMap<>();
        Snapshot(Context c,Map<String,String> values){context=c;draft=new LinkedHashMap<>(values);
            WindowManager wm=(WindowManager)c.getSystemService(Context.WINDOW_SERVICE);display=wm==null?null:wm.getDefaultDisplay();
            environment=CircleConnectivitySpacingObservation.environment(draft);
            wifiEnvironment=StatusBarWifiAssetSpacingObservation.environment(draft,"wifi.signal");
            liveWifiEnvironment=StatusBarWifiAssetSpacingObservation.environment(new AppConfig(c).snapshot(),"wifi.signal");
            if(display!=null)for(String s:StatusBarSurfaceSpec.SURFACES){int r=display.getRotation();
                circles.put(s,CircleConnectivitySpacingObservation.parse(read(c,CircleConnectivitySpacingObservation.key(s,r))));
                wifi.put(s,StatusBarWifiSpacingObservation.parse(read(c,StatusBarWifiSpacingObservation.key(s,r,"wifi.signal"))));
                wifiAssets.put(s,StatusBarWifiAssetSpacingObservation.parse(read(c,StatusBarWifiAssetSpacingObservation.key(s,r,"wifi.signal"))));
                headers.put(s,StatusBarHeaderSpacingObservation.parse(read(c,StatusBarHeaderSpacingObservation.KEY+s+"_"+r)));
            }
        }
        /** Null means this carrier does not own this surface/leaf; caller uses its original policy. */
        StatusBarMobileSpacingResolver.Entry circle(String surface,String id,StatusBarIconSpacingSpec spec){
            if(!member(id)||!StatusBarCircleSpacingResolver.surface(surface)||!ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP)))return null;
            if(!ConfigSchema.truthy(draft.get(ConfigSchema.SYSTEMUI_MASTER))||ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY)))return pending(surface,"三合一当前未参与排列；边距参数待用");
            CircleConnectivitySpacingObservation value=circles.get(surface);
            if(value==null||!surface.equals(value.surface)||!current(context,display,value.profile)||!environment.equals(value.environmentKey))return pending(surface,"尚无当前设置下的三合一可用空间；请显示此位置后刷新");
            if(value.reason.equals("disabled"))return pending(surface,"此位置的三合一载体尚未启用；边距参数待用");
            if(value.reason.equals("native_hidden"))return entry(surface,State.DORMANT,"当前三合一图标未显示；边距参数待用");
            if(unmeasured(value.reason)||value.measured==null)return pending(surface,"三合一布局、SIM 映射或字形空间尚未确认；请显示此位置后刷新");
            if(value.measured.wholeCovered)return entry(surface,State.COVERED,"当前由三合一整图覆盖；内部边距暂不参与，参数保留");
            if(!value.eligible(id))return entry(surface,State.DORMANT,"当前三合一没有显示此信号图层；边距参数待用");
            CircleConnectivityPlan plan=value.plan(spec);int[] needed=value.required(spec);
            if(plan==null||needed==null||unmeasured(plan.reason))return pending(surface,"三合一空间数据尚未完整；请显示此位置后刷新");
            float density=value.measured.density;
            String capacity="三合一固定图形外预留空间；最近可用宽 "+size(value.maxWidth,density,false)+" dp、高 "+size(value.maxHeight,density,false)+" dp";
            if(value.accepts(spec))return entry(surface,State.READY,capacity+"，可容纳当前参数");
            return entry(surface,State.CAPACITY,capacity+"；当前参数所需 "+size(needed[0],density,true)+"×"+size(needed[1],density,true)+" dp，"+rejection(plan.reason));
        }
        StatusBarMobileSpacingResolver.Entry nativeWifi(String surface,StatusBarIconSpacingSpec spec){
            StatusBarWifiSpacingObservation contract=wifi.get(surface);
            if(contract==null||!current(context,display,contract.profile))return pending(surface,"尚无当前显示设置下的 Wi-Fi 图层信息；边距待核验");
            if(contract.reason.equals("hidden"))return entry(surface,State.DORMANT,"当前原生 Wi-Fi 未显示；边距参数待用");
            if(contract.reason.equals("asset_cells")){
                StatusBarWifiAssetSpacingObservation asset=wifiAssets.get(surface);
                if(asset==null||!current(context,display,asset.profile)||!wifiEnvironment.equals(asset.assetKey))return pending(surface,"尚无当前素材与设置下的 Wi-Fi 画布空间；边距待核验");
                boolean fits=asset.accepts(spec,surface,"wifi.signal");
                return entry(surface,fits?State.READY:State.CAPACITY,"Wi-Fi 素材画布，最近可用宽 "+size(asset.maxWidth,asset.units,false)+" dp、高 "+size(asset.maxHeight,asset.units,false)+" dp"+(fits?"，可容纳当前信号与活动箭头参数":"；当前信号与活动箭头的完整组合超出可用空间"));
            }
            if(!contract.reason.equals("native"))return pending(surface,contract.explanation()+"；边距参数待核验");
            if(!wifiEnvironment.equals(liveWifiEnvironment))return pending(surface,"此草稿已改变 Wi-Fi 载体设置；原生空间待重新核验");
            if(surface.equals("control")||surface.equals("notification")){
                StatusBarHeaderSpacingObservation h=headers.get(surface);
                if(!current(context,display,h))return pending(surface,"原生 Wi-Fi 上下空间尚未确认；请展开此页面后刷新");
                int vertical=spec.resolve(surface,"wifi.signal").vertical()+spec.resolve(surface,"wifi.activity_inout").vertical();
                boolean fits=vertical<=h.vertical;
                return entry(surface,fits?State.NATIVE_RULE:State.CAPACITY,"原生 Wi-Fi 信号与活动箭头上下合计 "+vertical+" dp，最近最多 "+h.vertical+" dp"+(fits?"（不代表此刻可见）":"，当前组合超限"));
            }
            return entry(surface,State.NATIVE_RULE,"原生 Wi-Fi 图层沿用既有边距规则；不代表此刻可见");
        }
        StatusBarMobileSpacingResolver.Result inspectWifi(String scope,String id,StatusBarIconSpacingSpec spec){
            StatusBarMobileSpacingResolver.Result result=new StatusBarMobileSpacingResolver.Result(scope);
            if(!"wifi.signal".equals(id)||spec==null||!StatusBarSurfaceSpec.validScope(scope))return result;
            StatusBarVisibilitySpec visibility=StatusBarVisibilitySpec.parse(draft.get(StatusBarVisibilitySpec.KEY));
            for(String s:scope.equals("all")?StatusBarSurfaceSpec.SURFACES:new String[]{scope}){
                if(scope.equals("all")&&spec.explicit(s,id)!=null){result.entries.add(entry(s,State.OVERRIDDEN,"已有单独边距，共享值不覆盖此位置"));continue;}
                if(visibility!=null&&visibility.hidden(s,id)){result.entries.add(entry(s,State.DORMANT,"此图标已设为隐藏；边距参数保留待用"));continue;}
                StatusBarMobileSpacingResolver.Entry e=circle(s,id,spec);result.entries.add(e==null?nativeWifi(s,spec):e);
            }
            return result;
        }
    }
    /** Mobile signal changes are already checked through MobileSpacingResolver's CCS dispatch. */
    static StatusBarMobileSpacingResolver.Validation validateWifiChanges(Context context,Map<String,String> before,Map<String,String> draft){
        if(Objects.equals(before.get(StatusBarIconSpacingSpec.KEY),draft.get(StatusBarIconSpacingSpec.KEY)))return new StatusBarMobileSpacingResolver.Validation(true,false,"");
        StatusBarIconSpacingSpec old=StatusBarIconSpacingSpec.parse(before.get(StatusBarIconSpacingSpec.KEY)),next=StatusBarIconSpacingSpec.parse(draft.get(StatusBarIconSpacingSpec.KEY));
        if(old==null||next==null)return new StatusBarMobileSpacingResolver.Validation(false,false,"图标间距格式无效，本次未保存");
        boolean deferred=false;Snapshot snapshot=new Snapshot(context,draft);
        for(String scope:StatusBarSurfaceSpec.SCOPES){
            StatusBarIconSpacingSpec.Insets value=next.explicit(scope,"wifi.signal");
            if(!applies(scope,"wifi.signal",draft)||StatusBarMobileSpacingResolver.same(old.explicit(scope,"wifi.signal"),value)||value==null||value.isZero())continue;
            StatusBarMobileSpacingResolver.Result result=snapshot.inspectWifi(scope,"wifi.signal",next);
            if(result.rejected())return new StatusBarMobileSpacingResolver.Validation(false,false,result.description()+"\n空间已变化，本次未保存；请调整边距或恢复继承。");
            deferred|=result.deferred()||!result.ready();
        }
        return new StatusBarMobileSpacingResolver.Validation(true,deferred,deferred?"已保存；部分图标边距待对应页面显示后核验":"");
    }
}
