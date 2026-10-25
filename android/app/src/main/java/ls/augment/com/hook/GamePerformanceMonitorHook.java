package ls.augment.com.hook;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.GameOptions;
import ls.augment.com.GamePerformanceMonitorConfig;
import io.github.libxposed.api.XposedInterface.Chain;

/** Customizes the OEM monitor in GameAssist; OEM collectors and window ownership stay intact. */
final class GamePerformanceMonitorHook {
    private static final String TYPE="cn.nubia.gameassist.dessert.policy.performancemonitor.PerformanceMonitorFloatingWindow";
    private final AugmentModule module;
    private final Access access;
    private final Map<Object,State> states=new WeakHashMap<>();
    private boolean listening;
    private final Runnable configurationChanged=()->{
        for(Object owner:new ArrayList<>(states.keySet()))try{refresh(owner,true);}catch(Throwable error){error(error);}
    };

    private GamePerformanceMonitorHook(AugmentModule module,ClassLoader loader)throws ReflectiveOperationException{
        this.module=module;access=Access.resolve(loader);
    }

    static void install(AugmentModule module,ClassLoader loader){
        FloatingPositionLock.install(module);
        try{
            GamePerformanceMonitorHook hooks=new GamePerformanceMonitorHook(module,loader);
            hooks.install();
            module.logFeatureInfo("GAME_MONITOR_REGISTERED route="+hooks.access.route+";items=9;background_only=true");
        }catch(Throwable error){module.logFeatureError("GAME_MONITOR_ROUTE_UNAVAILABLE",error);}
    }

    private void install(){
        hook(access.init,chain->{
            Object owner=chain.getThisObject();State old=states.remove(owner);
            if(old!=null)old.telemetry.dispose();
            if(old!=null&&old.applied&&old.originalWidth>0&&access.fullWidth.getInt(owner)==old.appliedWidth)
                access.fullWidth.setInt(owner,old.originalWidth);
            Object result=chain.proceed();
            try{refresh(owner,false);}catch(Throwable error){error(error);}
            return result;
        });
        hook(access.dimensions,chain->{
            Object owner=chain.getThisObject();
            try{refresh(owner,false);}catch(Throwable error){error(error);}
            State state=states.get(owner);
            // initSize reads the OEM full width. Give it the retained native value,
            // then accept its result even if a new native width equals our last custom width.
            if(state!=null&&state.applied&&state.originalWidth>0&&access.fullWidth.getInt(owner)==state.appliedWidth)
                access.fullWidth.setInt(owner,state.originalWidth);
            Object result=chain.proceed();
            try{refresh(owner,access.added.getBoolean(owner),true);}catch(Throwable error){error(error);}
            return result;
        });
        for(Method method:new Method[]{access.params,access.showMode,access.add})hook(method,chain->{
            Object owner=chain.getThisObject();
            try{refresh(owner,false);}catch(Throwable error){error(error);}
            Object result=chain.proceed();
            try{refresh(owner,false);}catch(Throwable error){error(error);}
            return result;
        });
        hook(access.backgroundAlpha,chain->{
            if(enabled(chain.getThisObject()))return chain.proceed(new Object[]{opacity(chain.getThisObject())});
            return chain.proceed();
        });
        hook(access.hitIndex,chain->{
            State state=states.get(chain.getThisObject());
            if(state==null||!state.applied)return chain.proceed();
            return hitIndex(state,((Number)chain.getArg(0)).floatValue());
        });
        hook(access.click,chain->{
            if(FloatingPositionLock.cancelling())return null;
            Object owner=chain.getThisObject();State state=states.get(owner);
            if(state==null||!state.applied)return chain.proceed();
            // The stock animation divides by (full width - selected width). A single
            // selected item has no collapse transition; it must never enter that path.
            if(state.count==1)return null;
            try{click(owner,state,((Number)chain.getArg(0)).floatValue());}
            catch(Throwable error){error(error);}
            return null;
        });
    }

    private void hook(Method method,Action action){
        module.registerFeatureHook(module.prepareFeatureHook(method,"game.monitor."+method.getName(),true)
                .intercept(chain->action.run(chain)));
    }

    private boolean enabled(Object owner)throws IllegalAccessException{
        return FeatureSettings.enabled((Context)access.context.get(owner),GameOptions.PERFORMANCE_MONITOR,false);
    }

    private float opacity(Object owner)throws IllegalAccessException{
        return 1f-FeatureSettings.integer((Context)access.context.get(owner),GameOptions.MONITOR_TRANSPARENCY,50,0,100)/100f;
    }

    private void refresh(Object owner,boolean live)throws ReflectiveOperationException{
        refresh(owner,live,false);
    }

    private void refresh(Object owner,boolean live,boolean nativeSizing)throws ReflectiveOperationException{
        ViewGroup content=(ViewGroup)access.content.get(owner);
        if(content==null)return;
        Context context=content.getContext();
        if(!listening)listening=FeatureSettings.addSnapshotListener(context,configurationChanged);
        State state=states.get(owner);
        if(state==null||state.content!=content){
            if(content.getChildCount()!=5)return;
            if(state!=null)state.telemetry.dispose();
            state=new State(content,(View)access.background.get(owner),(View)access.shortBackground.get(owner));
            states.put(owner,state);
        }
        FloatingPositionLock.monitor((View)access.activeRoot.get(owner));
        int nativeWidth=access.fullWidth.getInt(owner);
        // Never promote a width written by this hook into the native baseline.
        // Zero/wrap-content values can precede sizing; wait for a real OEM width.
        if(nativeWidth>0&&(nativeSizing||!state.applied||nativeWidth!=state.appliedWidth)
                &&(nativeSizing||nativeWidth!=state.originalWidth||!state.sizingReady))state.capture(nativeWidth);
        boolean requested=enabled(owner);
        String selected=GamePerformanceMonitorConfig.normalizeItems(FeatureSettings.text(context,GameOptions.MONITOR_ITEMS,GamePerformanceMonitorConfig.DEFAULT_ITEMS));
        if(selected==null)selected=GamePerformanceMonitorConfig.DEFAULT_ITEMS;
        if(state.originalWidth<=0){
            if(requested)report(owner,state,requested,selected,nativeWidth,nativeWidth,
                    nativeWidth>0?state.sizingPhase:"pending_native_size");
            return;
        }
        String[] items=GamePerformanceMonitorConfig.items();
        int customWidth=state.originalWidth;
        for(int i=0;i<5;i++)if(!GamePerformanceMonitorConfig.selected(selected,items[i]))customWidth-=state.widths[i];
        for(int i=5;i<9;i++)if(GamePerformanceMonitorConfig.selected(selected,items[i]))customWidth+=state.widths[i];
        boolean on=requested&&state.sizingReady&&customWidth>1;
        if(!on&&!state.applied){
            if(requested)report(owner,state,requested,selected,nativeWidth,nativeWidth,
                    state.sizingReady?"invalid_selected_width":state.sizingPhase);
            return;
        }
        int width=state.fit(on,selected,on?customWidth:state.originalWidth);
        boolean changed=state.applied!=on||!selected.equals(state.selection)||state.appliedWidth!=width;
        state.selection=selected;state.count=0;
        for(int i=0;i<9;i++){
            View item=content.getChildAt(i);
            state.selected[i]=on?GamePerformanceMonitorConfig.selected(selected,items[i]):i<5;
            if(state.selected[i])state.count++;
            item.setVisibility(!state.selected[i]?View.GONE:state.visibility[i]);
            // Only our instant mode transition runs while customized, so reused OEM
            // items cannot retain the stock animation's hidden alpha/translation.
            if(changed){item.setAlpha(1f);item.setTranslationX(0f);}
        }
        state.applied=on;
        state.telemetry.configure(on,selected);
        state.appliedWidth=width;
        access.fullWidth.setInt(owner,width);
        boolean shortened=access.shortened.getBoolean(owner);
        int selectedIndex=access.selectedIndex.getInt(owner);
        boolean reopen=shortened&&(!on||selectedIndex<0||selectedIndex>=5||!state.selected[selectedIndex]);
        WindowManager.LayoutParams params=(WindowManager.LayoutParams)access.layoutParams.get(owner);
        int shortWidth=access.shortWidth.getInt(owner);
        if(shortened&&!reopen&&(shortWidth<=0||shortWidth<state.cellWidths[selectedIndex])){
            shortWidth=itemWidth(state,selectedIndex);
            if(shortWidth>0)access.shortWidth.setInt(owner,shortWidth);else reopen=true;
        }
        if(reopen){
            shortened=false;access.shortened.setBoolean(owner,false);access.selectedIndex.setInt(owner,-1);
            // Recover the original full-list anchor before replacing a single-item
            // window, including when customization is switched off while collapsed.
            if(params!=null&&selectedIndex>=0&&selectedIndex<5){
                params.x-=content.getLeft()+content.getChildAt(selectedIndex).getLeft();
                access.pointX.setInt(owner,params.x);access.saveX.invoke(owner,params.x);
            }
        }
        int activeWidth=shortened?shortWidth:width;
        changed|=access.currentWidth.getInt(owner)!=activeWidth||params!=null&&params.width!=activeWidth;
        access.currentWidth.setInt(owner,activeWidth);
        if(params!=null)params.width=activeWidth;
        access.rectangle.invoke(state.background,0f,(float)width);
        if(shortened)access.rectangle.invoke(state.shortBackground,0f,(float)activeWidth);
        state.background.setAlpha(on?opacity(owner):state.backgroundAlpha);
        state.shortBackground.setAlpha(on?opacity(owner):state.shortBackgroundAlpha);
        if(reopen&&live&&access.added.getBoolean(owner))access.showMode.invoke(owner,false);
        if(live&&changed&&access.added.getBoolean(owner)){
            View root=(View)access.activeRoot.get(owner);
            // Reuse OEM positioning and window update logic.
            access.clamp.invoke(owner);
            Object manager=access.windowManager.get(owner);
            access.updateWindow.invoke(manager,root,params);
            root.requestLayout();
        }
        report(owner,state,requested,selected,nativeWidth,activeWidth,on?"applied":requested?state.sizingPhase:"restored");
    }

    private void report(Object owner,State state,boolean requested,String selected,int nativeWidth,int width,String phase)throws IllegalAccessException{
        FeatureSettings.diagnostic(state.content.getContext(),GameOptions.PERFORMANCE_MONITOR+"_state",
                "enabled="+requested+";items="+selected+";width="+width+";background_alpha="+state.background.getAlpha()
                +";text_alpha="+(state.applied?"1":"native")+";state="+(state.applied?"APPLIED":requested?"WAITING_FOR_SIZE":"RESTORED")
                +";phase="+phase+";applied="+state.applied+";nativeFullWidth="+nativeWidth+";originalWidth="+state.originalWidth
                +";appliedWidth="+state.appliedWidth+";shortened="+access.shortened.getBoolean(owner)+";shortWidth="+access.shortWidth.getInt(owner));
    }

    private int hitIndex(State state,float x){
        int last=0;
        for(int i=0;i<9;i++)if(state.selected[i]){
            last=i;View item=state.content.getChildAt(i);
            int right=item.getWidth()>0?item.getRight():item.getLeft()+state.cellWidths[i];
            if(x<state.content.getLeft()+right)return i;
        }
        return last;
    }

    private void click(Object owner,State state,float x)throws ReflectiveOperationException{
        boolean shortened=access.shortened.getBoolean(owner);
        WindowManager.LayoutParams params=(WindowManager.LayoutParams)access.layoutParams.get(owner);
        if(params==null)return;
        if(shortened){
            int previous=access.selectedIndex.getInt(owner);
            if(previous>=0&&previous<5)params.x-=state.content.getLeft()+state.content.getChildAt(previous).getLeft();
            access.shortened.setBoolean(owner,false);access.selectedIndex.setInt(owner,-1);
            params.width=access.fullWidth.getInt(owner);
        }else{
            int index=hitIndex(state,x);View item=state.content.getChildAt(index);
            // OEM compact roots contain only the five native views. Keep additional
            // sensor cells expanded instead of requesting a nonexistent compact view.
            if(index>=5)return;
            int width=itemWidth(state,index);
            if(width<=0)return;
            params.x+=state.content.getLeft()+item.getLeft();
            access.selectedIndex.setInt(owner,index);access.shortened.setBoolean(owner,true);
            access.shortWidth.setInt(owner,width);params.width=width;
        }
        access.pointX.setInt(owner,params.x);
        access.currentWidth.setInt(owner,params.width);
        access.saveX.invoke(owner,params.x);
        access.showMode.invoke(owner,!shortened);
        refresh(owner,true);
        access.fade.invoke(owner,true);
    }

    private static int itemWidth(State state,int index){
        View item=state.content.getChildAt(index);
        return Math.max(item.getWidth(),state.cellWidths[index]);
    }

    private void error(Throwable error){
        FeatureSettings.diagnosticError(FeatureSettings.from(null),GameOptions.PERFORMANCE_MONITOR+"_error","monitor",error);
    }

    private static final class State{
        final ViewGroup content;final View background,shortBackground;
        int originalWidth,appliedWidth;final int[] widths=new int[9],cellWidths=new int[9],visibility=new int[9];
        final boolean[] selected=new boolean[9];final float backgroundAlpha,shortBackgroundAlpha;
        final MonitorTelemetry telemetry;
        final int[] nativeCellWidths=new int[9];final float[] nativeWeights=new float[9];
        String selection="",sizingPhase="pending_cell_sizes";boolean applied,sizingReady,cellsShrunk;int count;
        State(ViewGroup content,View background,View shortBackground){
            this.content=content;this.background=background;this.shortBackground=shortBackground;
            backgroundAlpha=background.getAlpha();shortBackgroundAlpha=shortBackground.getAlpha();
            for(int i=0;i<5;i++)visibility[i]=content.getChildAt(i).getVisibility();
            telemetry=new MonitorTelemetry(content);
            for(int i=5;i<9;i++){visibility[i]=View.VISIBLE;widths[i]=cellWidths[i]=content.getChildAt(i).getLayoutParams().width;}
            for(int i=0;i<9;i++){ViewGroup.LayoutParams p=content.getChildAt(i).getLayoutParams();nativeCellWidths[i]=p.width;
                if(p instanceof android.widget.LinearLayout.LayoutParams)nativeWeights[i]=((android.widget.LinearLayout.LayoutParams)p).weight;}
        }
        int fit(boolean on,String selection,int wanted){
            int maximum=content.getContext().getResources().getDisplayMetrics().widthPixels;
            boolean shrink=on&&maximum>0&&wanted>maximum;
            int chrome=originalWidth;for(int i=0;i<5;i++)chrome-=widths[i];
            int cells=0,margins=0;String[] items=GamePerformanceMonitorConfig.items();
            for(int i=0;i<9;i++)if(GamePerformanceMonitorConfig.selected(selection,items[i])){cells+=cellWidths[i];margins+=widths[i]-cellWidths[i];}
            float ratio=shrink&&cells>0?Math.max(1,maximum-chrome-margins)/(float)cells:1f;
            if(shrink||cellsShrunk)for(int i=0;i<9;i++){
                View item=content.getChildAt(i);ViewGroup.LayoutParams p=item.getLayoutParams();
                int width=shrink?Math.max(1,(int)(cellWidths[i]*ratio)):nativeCellWidths[i];
                float weight=shrink?0:nativeWeights[i];boolean changed=p.width!=width;p.width=width;
                if(p instanceof android.widget.LinearLayout.LayoutParams){android.widget.LinearLayout.LayoutParams linear=(android.widget.LinearLayout.LayoutParams)p;changed|=linear.weight!=weight;linear.weight=weight;}
                if(changed)item.setLayoutParams(p);
            }
            cellsShrunk=shrink;
            return shrink?maximum:wanted;
        }
        void capture(int width){
            sizingReady=false;sizingPhase="pending_cell_sizes";
            // The OEM cells use wrap_content + weight. Measure the original five
            // cells at each valid native size, including those currently hidden by us.
            int[] currentVisibility=new int[5];
            int[] currentWidths=new int[5];float[] currentWeights=new float[5];
            for(int i=0;i<5;i++){ViewGroup.LayoutParams p=content.getChildAt(i).getLayoutParams();
                if(!cellsShrunk){nativeCellWidths[i]=p.width;if(p instanceof android.widget.LinearLayout.LayoutParams)nativeWeights[i]=((android.widget.LinearLayout.LayoutParams)p).weight;}
                currentWidths[i]=p.width;p.width=nativeCellWidths[i];
                if(p instanceof android.widget.LinearLayout.LayoutParams){currentWeights[i]=((android.widget.LinearLayout.LayoutParams)p).weight;((android.widget.LinearLayout.LayoutParams)p).weight=nativeWeights[i];}}
            int[] extraVisibility=new int[4];
            for(int i=5;i<9;i++){extraVisibility[i-5]=content.getChildAt(i).getVisibility();content.getChildAt(i).setVisibility(View.GONE);}
            for(int i=0;i<5;i++){View item=content.getChildAt(i);currentVisibility[i]=item.getVisibility();item.setVisibility(visibility[i]);}
            try{
                content.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
                int[] cells=new int[5],occupied=new int[5];boolean ready=true;
                long minimum=content.getPaddingLeft()+content.getPaddingRight();
                for(int i=0;i<5;i++){
                    View item=content.getChildAt(i);ViewGroup.LayoutParams params=item.getLayoutParams();
                    cells[i]=item.getMeasuredWidth()>0?item.getMeasuredWidth():params.width>0?params.width:0;
                    occupied[i]=cells[i];if(cells[i]<=0)ready=false;
                    if(params instanceof ViewGroup.MarginLayoutParams){ViewGroup.MarginLayoutParams margin=(ViewGroup.MarginLayoutParams)params;occupied[i]+=margin.leftMargin+margin.rightMargin;}
                    minimum+=occupied[i];
                }
                if(!ready)return;
                if(width<minimum){sizingPhase="native_width_too_small";return;}
                originalWidth=width;sizingReady=true;sizingPhase="ready";
                System.arraycopy(cells,0,cellWidths,0,5);System.arraycopy(occupied,0,widths,0,5);
            }finally{for(int i=0;i<5;i++)content.getChildAt(i).setVisibility(currentVisibility[i]);
                for(int i=0;i<5;i++){ViewGroup.LayoutParams p=content.getChildAt(i).getLayoutParams();p.width=currentWidths[i];if(p instanceof android.widget.LinearLayout.LayoutParams)((android.widget.LinearLayout.LayoutParams)p).weight=currentWeights[i];}
                for(int i=5;i<9;i++)content.getChildAt(i).setVisibility(extraVisibility[i-5]);}
        }
    }

    /** Validate the whole known OEM route before registering any interception. */
    private static final class Access{
        final String route;
        final Field context,content,background,shortBackground,fullWidth,currentWidth,shortWidth,layoutParams,shortened,selectedIndex,added,activeRoot,windowManager,pointX;
        final Method init,dimensions,params,showMode,add,backgroundAlpha,hitIndex,click,rectangle,clamp,updateWindow,saveX,fade;
        static Access resolve(ClassLoader loader)throws ReflectiveOperationException{
            // Keep the established 17 route first. Resolve a complete contract before
            // trying 16, so an unfamiliar APK can never combine members from both.
            try{return new Access(loader,false);}
            catch(ReflectiveOperationException modern){
                try{return new Access(loader,true);}
                catch(ReflectiveOperationException legacy){legacy.addSuppressed(modern);throw legacy;}
            }
        }
        private Access(ClassLoader loader,boolean legacy)throws ReflectiveOperationException{
            route=legacy?"GameAssist16":"GameAssist17";
            Class<?> type=Class.forName(TYPE,false,loader);
            context=field(type,name(legacy,"j","mContext"),Context.class);content=field(type,name(legacy,"m","mContentLayout"),android.widget.LinearLayout.class);
            background=field(type,name(legacy,"n","mMonitorBackgroundView"),Class.forName(TYPE.replace("PerformanceMonitorFloatingWindow","CornerRectangle"),false,loader));
            shortBackground=field(type,name(legacy,"o","mShortenMonitorBackgroundView"),background.getType());fullWidth=field(type,name(legacy,"J","mFixedWidth"),int.class);currentWidth=field(type,name(legacy,"L","mWindowWidth"),int.class);shortWidth=field(type,name(legacy,"R","mShortenViewWidth"),int.class);
            layoutParams=field(type,name(legacy,"v","mLayoutParams"),WindowManager.LayoutParams.class);shortened=field(type,name(legacy,"U","mIsViewGroupShorten"),boolean.class);selectedIndex=field(type,name(legacy,"V","mLastClickIndex"),int.class);added=field(type,name(legacy,"h","mWindowAdd"),boolean.class);
            activeRoot=field(type,name(legacy,"k","mFloatLayout"),ViewGroup.class);windowManager=field(type,name(legacy,"w","mWindowManager"),Class.forName("cn.nubia.gameassist.utils.WindowManagerUtil",false,loader));pointX=field(type,name(legacy,"S","mPointX"),int.class);
            init=method(type,name(legacy,"I","initView"),void.class);dimensions=method(type,name(legacy,"H","initSize"),void.class);params=method(type,name(legacy,"G","initLayoutParams"),WindowManager.LayoutParams.class);
            showMode=method(type,name(legacy,"v","addOpenOrShortenWindow"),void.class,boolean.class);add=method(type,"addFloatView",void.class,String.class);
            backgroundAlpha=method(type,name(legacy,"R","setAlpha"),void.class,float.class);hitIndex=method(type,name(legacy,"A","getItemIndex"),int.class,float.class);click=method(type,name(legacy,"N","onItemClick"),void.class,float.class);
            rectangle=method(background.getType(),"setRectanglePara",void.class,float.class,float.class);clamp=method(type,name(legacy,"w","checkLayoutParams"),void.class);
            updateWindow=method(windowManager.getType(),name(legacy,"c","updateViewLayout"),void.class,View.class,ViewGroup.LayoutParams.class);
            saveX=method(type,name(legacy,"Q","saveFloatingX"),void.class,int.class);fade=method(type,name(legacy,"y","fadeLayout"),void.class,boolean.class);
        }
        private static String name(boolean legacy,String modern,String older){return legacy?older:modern;}
        private static Field field(Class<?> type,String name,Class<?> expected)throws ReflectiveOperationException{
            Field field=type.getDeclaredField(name);if(field.getType()!=expected)throw new NoSuchFieldException(name+":type");field.setAccessible(true);return field;
        }
        private static Method method(Class<?> type,String name,Class<?> result,Class<?>...args)throws ReflectiveOperationException{
            Method method=type.getDeclaredMethod(name,args);if(method.getReturnType()!=result)throw new NoSuchMethodException(name+":return");method.setAccessible(true);return method;
        }
    }
    private interface Action{Object run(Chain chain)throws Throwable;}
}
