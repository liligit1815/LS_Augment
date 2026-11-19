package ls.augment.com.hook;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.*;
import android.view.View;
import java.lang.ref.WeakReference;
import java.lang.reflect.*;
import java.util.*;
import java.util.function.BooleanSupplier;
import java.util.function.IntSupplier;
import ls.augment.com.*;

/** Standard text Toast source. Native presentation and token/callback cleanup always run. */
final class IslandToastEvents {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static boolean contract;
    private static Field presenterField;
    private static Method presenterToken,presenterPackage,hideToast;
    private static IslandToastEvents active;
    private final Context context;
    private final View root;
    private final Runnable changed;
    private final BooleanSupplier allowed;
    private final IntSupplier currentUser;
    private final Map<String,Entry> entries=new LinkedHashMap<>();
    private final Map<IBinder,Pending> pending=new LinkedHashMap<>();
    private final Map<String,Long> dedupe=new LinkedHashMap<>();
    private final Runnable tick=this::tick;
    private int user=-1;
    private String configuration="";
    private boolean closed;
    private static final class Entry {
        final IslandEvent event;final long until;final int display;boolean expand;
        Entry(IslandEvent event,long until,int display,boolean expand){this.event=event;this.until=until;this.display=display;this.expand=expand;}
    }
    private static final class Pending {
        final WeakReference<Object> host;final String pkg,key;final IBinder token;final Object revision;
        final long until;final int display;boolean ready;
        Pending(Object host,String pkg,IBinder token,String key,Object revision,long until,int display,boolean ready){
            this.host=new WeakReference<>(host);this.pkg=pkg;this.token=token;this.key=key;this.revision=revision;this.until=until;this.display=display;this.ready=ready;
        }
    }
    static int install(AugmentModule module,ClassLoader loader){
        try{
            Class<?> type=Class.forName("com.android.systemui.toast.ToastUI",false,loader);
            Class<?> callback=Class.forName("android.app.ITransientNotificationCallback",false,loader);
            Class<?> presenter=Class.forName("android.widget.ToastPresenter",false,loader);
            Method show=MagicIslandScenes.exact(type,"showToast",void.class,int.class,String.class,IBinder.class,CharSequence.class,
                    IBinder.class,int.class,callback,int.class);
            Field field=findField(type,"mPresenter");if(field.getType()!=presenter)throw new NoSuchFieldException("mPresenter:type");
            Method token=MagicIslandScenes.exact(presenter,"getToken",IBinder.class);
            Method pkg=MagicIslandScenes.exact(presenter,"getPackageName",String.class);
            Method hide=MagicIslandScenes.exact(type,"hideToast",void.class,String.class,IBinder.class);
            module.registerFeatureHook(module.prepareFeatureHook(show,"island.source.toast",false).intercept(chain->{
                // Let SystemUI own queue order, accessibility announcements and callback delivery.
                Object result=chain.proceed();
                try{
                    Object host=chain.getThisObject();int uid=(Integer)chain.getArg(0),display=(Integer)chain.getArg(7);
                    String source=(String)chain.getArg(1);IBinder identity=(IBinder)chain.getArg(2);
                    CharSequence value=(CharSequence)chain.getArg(3);String text=value==null?"":value.toString();
                    MAIN.post(()->{IslandToastEvents owner=active;if(owner!=null)owner.accept(host,uid,source,identity,text,display);});
                }catch(RuntimeException malformed){FeatureRuntimeLog.state("ISLAND_TOAST","source","invalid_payload");}
                return result;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(hide,"island.source.toast_end",false).intercept(chain->{
                Object result=chain.proceed(),host=chain.getThisObject();String source=(String)chain.getArg(0);IBinder identity=(IBinder)chain.getArg(1);
                MAIN.post(()->{IslandToastEvents owner=active;if(owner!=null)owner.nativeHidden(host,source,identity);});return result;
            }));
            presenterField=field;presenterToken=token;presenterPackage=pkg;hideToast=hide;contract=true;return 2;
        }catch(Exception missing){module.logFeatureInfo("ISLAND_TOAST_SOURCE_UNAVAILABLE "+missing.getClass().getSimpleName()+":"+missing.getMessage());return 0;}
    }
    private static Field findField(Class<?> type,String name)throws NoSuchFieldException{
        for(Class<?> next=type;next!=null;next=next.getSuperclass())try{Field field=next.getDeclaredField(name);field.setAccessible(true);return field;}catch(NoSuchFieldException absent){}
        throw new NoSuchFieldException(name);
    }
    IslandToastEvents(Context context,View root,Runnable changed,BooleanSupplier allowed,IntSupplier currentUser){
        this.context=context;this.root=root;this.changed=changed;this.allowed=allowed;this.currentUser=currentUser;
    }
    void start(){active=this;user=currentUser.getAsInt();}
    boolean capable(){return contract;}
    private IslandToastRules rules(){
        String raw=FeatureSettings.text(context,IslandToastRules.KEY,"");
        int nextUser=currentUser.getAsInt();
        if(user!=nextUser||!configuration.equals(raw)){reset();configuration=raw;user=nextUser;}
        return IslandToastRules.parse(raw);
    }
    private boolean enabled(){return !closed&&contract&&allowed.getAsBoolean()&&user>=0&&user==currentUser.getAsInt()&&IslandSceneSelection.enabled(context,"toast");}
    private boolean display(int id){return root.getDisplay()!=null&&root.getDisplay().getDisplayId()==id;}
    private void accept(Object host,int uid,String pkg,IBinder token,String raw,int display){
        try{
            IslandToastRules rules=rules();
            if(!enabled()||rules==null||token==null||pkg==null||"ls.augment.com".equals(pkg)||uid<0||uid/100000!=user
                    ||!display(display))return;
            if(raw.length()>16384)return;String text=raw.trim();if(text.isEmpty())return;
            IslandToastRules.Rule rule=rules.rule(user,pkg);if(rule==null)return;
            int presentation=IslandPresentation.mode(context,root,user,"toast",pkg,"",IslandEnvironmentRules.INHERIT);
            if(presentation==IslandEnvironmentRules.OFF)return;
            // UID/package belongs to the system's actual Toast, including cloned/work users.
            if(!Arrays.asList(Optional.ofNullable(context.getPackageManager().getPackagesForUid(uid)).orElse(new String[0])).contains(pkg))return;
            long now=SystemClock.elapsedRealtime();prune(now);
            boolean filtered=!rule.accepts(text);
            if(filtered){
                if(pending.size()<16)pending.put(token,new Pending(host,pkg,token,null,null,now+5000,display,true));
                tick();return;
            }
            if(rule.mode==IslandToastRules.FILTER)return;
            String key="toast_"+uid+"_"+pkg,duplicate=uid+"|"+pkg+"|"+text;
            Entry previous=entries.get(key);
            Long last=dedupe.get(duplicate);
            boolean repeated=last!=null&&now-last<1200;
            Entry entry=previous;
            if(!repeated){
                if(previous==null&&entries.size()>=16)return;
                Object instance=previous==null?new Object():previous.event.instance;
                Context sourceContext=(Context)Context.class.getMethod("createContextAsUser",UserHandle.class,int.class)
                        .invoke(context,UserHandle.getUserHandleForUid(uid),0);
                ApplicationInfo info=sourceContext.getPackageManager().getApplicationInfo(pkg,0);
                String label=sourceContext.getPackageManager().getApplicationLabel(info).toString();
                IslandEvent event=new IslandEvent(key,"toast",user,uid,instance,new Object(),label,text,text,
                        sourceContext.getPackageManager().getApplicationIcon(info),null,List.of(),64).source(pkg,"");
                boolean expand=presentation==IslandEnvironmentRules.EXPAND||presentation==IslandEnvironmentRules.INHERIT
                        &&(previous==null?rule.firstExpand:rule.updateExpand);
                entry=new Entry(event,now+rule.seconds*1000L,display,expand);
                entries.put(key,entry);dedupe.put(duplicate,now);
                while(dedupe.size()>64)dedupe.remove(dedupe.keySet().iterator().next());
                changed.run();
            }
            // A duplicate may only replace the original when the very same text is still displayed.
            if(rule.mode==IslandToastRules.REPLACE&&entry!=null&&entry.event.detail.equals(text)&&pending.size()<16)
                pending.put(token,new Pending(host,pkg,token,key,entry.event.revision,now+5000,display,false));
            tick();
        }catch(Exception unavailable){FeatureRuntimeLog.state("ISLAND_TOAST","source",unavailable.getClass().getSimpleName());}
    }
    Map<String,IslandEvent> snapshot(int current,boolean permitted){
        IslandToastRules rules=rules();
        if(!permitted||current!=user||!enabled()||rules==null){reset();return Collections.emptyMap();}
        prune(SystemClock.elapsedRealtime());Map<String,IslandEvent> result=new LinkedHashMap<>();
        entries.forEach((key,value)->result.put(key,value.event));arm();return result;
    }
    void presented(IslandEvent event,boolean canExpand,Runnable expand){
        rules();Entry entry=entries.get(event.key);if(entry==null||entry.event!=event||!enabled()||!display(entry.display))return;
        int mode=IslandPresentation.mode(context,root,user,"toast",event.sourcePackage,"",IslandEnvironmentRules.INHERIT);
        if(mode==IslandEnvironmentRules.OFF){entries.remove(event.key);pending.values().removeIf(p->event.key.equals(p.key));return;}
        if(mode==IslandEnvironmentRules.COMPACT)entry.expand=false;
        if(entry.expand&&canExpand){entry.expand=false;expand.run();}
        for(Pending value:pending.values())if(Objects.equals(value.key,event.key)&&value.revision==event.revision)value.ready=true;
        tick();
    }
    private void nativeHidden(Object host,String pkg,IBinder token){
        Pending value=pending.get(token);if(value!=null&&value.host.get()==host&&value.pkg.equals(pkg))pending.remove(token);
        arm();
    }
    private void tick(){
        MAIN.removeCallbacks(tick);
        rules();if(!enabled()){boolean had=!entries.isEmpty();reset();if(had)changed.run();return;}
        boolean expired=prune(SystemClock.elapsedRealtime());
        for(Pending value:new ArrayList<>(pending.values())){
            if(!value.ready)continue;
            if(value.key!=null){Entry entry=entries.get(value.key);if(entry==null||entry.event.revision!=value.revision){pending.remove(value.token);continue;}}
            Object host=value.host.get();if(host==null){pending.remove(value.token);continue;}
            try{
                Object presenter=presenterField.get(host);
                if(presenter!=null&&value.token.equals(presenterToken.invoke(presenter))&&value.pkg.equals(presenterPackage.invoke(presenter))){
                    pending.remove(value.token);
                    // The OEM end path owns the animation, onToastHidden and finishToken transaction.
                    hideToast.invoke(host,value.pkg,value.token);
                }
            }catch(Exception unavailable){pending.remove(value.token);FeatureRuntimeLog.state("ISLAND_TOAST","hide",unavailable.getClass().getSimpleName());}
        }
        if(expired)changed.run();arm();
    }
    private boolean prune(long now){
        boolean expired=entries.values().removeIf(entry->entry.until<=now||!display(entry.display)
                ||IslandPresentation.mode(context,root,user,"toast",entry.event.sourcePackage,"",IslandEnvironmentRules.INHERIT)==IslandEnvironmentRules.OFF);
        pending.values().removeIf(value->value.until<=now||value.host.get()==null||!display(value.display)
                ||IslandPresentation.mode(context,root,user,"toast",value.pkg,"",IslandEnvironmentRules.INHERIT)==IslandEnvironmentRules.OFF);
        dedupe.values().removeIf(at->now-at>=1200);return expired;
    }
    private void arm(){
        MAIN.removeCallbacks(tick);long now=SystemClock.elapsedRealtime(),next=Long.MAX_VALUE;
        for(Entry entry:entries.values())next=Math.min(next,entry.until);
        if(!pending.isEmpty())next=Math.min(next,now+50);
        if(next<Long.MAX_VALUE)MAIN.postDelayed(tick,Math.max(1,next-now));
    }
    void reset(){MAIN.removeCallbacks(tick);entries.clear();pending.clear();dedupe.clear();}
    void close(){closed=true;reset();if(active==this)active=null;}
}
