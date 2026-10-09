package ls.augment.com.hook;

import android.graphics.*;
import android.graphics.drawable.*;
import android.net.Uri;
import android.os.*;
import android.text.*;
import android.view.*;
import java.io.*;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.*;
import java.util.concurrent.*;
import ls.augment.com.*;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Draws within the measured notification slot while leaving native notification ownership intact. */
final class StatusBarNotificationSummaryHook {
    private static final String TYPE="com.android.systemui.statusbar.phone.NotificationIconContainer";
    private static final String CLOCK="com.android.systemui.statusbar.policy.Clock";
    private static final Map<ViewGroup,State> STATES=new WeakHashMap<>();
    private static final Map<View,Palette> PALETTES=new WeakHashMap<>();
    private static final ExecutorService IMAGES=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"Duo-notification-art");t.setDaemon(true);return t;});
    private static Method measured;
    private static Method nativeTint;
    private static boolean drawReady;
    static int install(AugmentModule module,ClassLoader loader){
        try{measured=View.class.getDeclaredMethod("setMeasuredDimension",int.class,int.class);measured.setAccessible(true);}catch(Exception e){module.logFeatureError("SUMMARY_MEASURE",e);}
        int count=0;
        try{
            nativeTint=Class.forName("com.android.systemui.plugins.DarkIconDispatcher",false,loader)
                    .getDeclaredMethod("getTint",Collection.class,View.class,int.class);
            nativeTint.setAccessible(true);
        }catch(ReflectiveOperationException ignored){/* Same-phone native clock remains the fallback. */}
        count+=hookNamed(module,loader,"notification_summary",CLOCK,"onDarkChanged",3,null,(o,a,r)->{
            if(o instanceof View&&a[0] instanceof Collection&&a[2] instanceof Number){
                View clock=(View)o;PALETTES.put(clock,new Palette((Collection<?>)a[0],((Number)a[2]).intValue()));
                View root=phoneRoot(clock);
                for(State state:new ArrayList<>(STATES.values()))if(!state.closed&&phoneRoot(state.view)==root&&root!=null)state.view.invalidate();
            }
            return PASS;
        });
        count+=hookNamed(module,loader,"notification_summary",TYPE,"onMeasure",2,null,(o,a,r)->{
            ViewGroup view=(ViewGroup)o;int[] size=measure(view);
            if(size!=null&&measured!=null){StatusBarIconSpacingSpec.Insets edge=StatusBarGridHook.ownsIconLayout(view)?StatusBarIconSpacingSpec.ZERO:StatusBarIconLayoutHook.insets(view,"notifications");float density=view.getResources().getDisplayMetrics().density;
                measured.invoke(view,View.resolveSize(size[0]+(int)Math.ceil(edge.horizontal()*density),(Integer)a[0]),View.resolveSize(Math.max(view.getMeasuredHeight(),size[1]+(int)Math.ceil(edge.vertical()*density)),(Integer)a[1]));}return PASS;
        });
        try{
            Class<?> notification=Class.forName(TYPE,false,loader),declaration=notification;Method draw=null;
            while(declaration!=null&&draw==null){try{draw=declaration.getDeclaredMethod("dispatchDraw",Canvas.class);}catch(NoSuchMethodException inherited){declaration=declaration.getSuperclass();}}
            if(draw==null)throw new NoSuchMethodException(TYPE+".dispatchDraw");
            draw.setAccessible(true);module.deoptimize(draw);
            module.registerFeatureHook(module.prepareFeatureHook(draw,"systemui.notification_summary.dispatch",false).intercept(chain->{
                Object owner=chain.getThisObject();
                // RedMagic inherits dispatchDraw from ViewGroup. Filter the shared
                // declaration before touching unrelated containers, shelf or AOD.
                if(!notification.isInstance(owner))return chain.proceed();
                ViewGroup view=(ViewGroup)owner;int[] size=measure(view);if(size==null)return chain.proceed();
                try{state(view).draw((Canvas)chain.getArgs().get(0),size);return null;}
                catch(Throwable error){module.logFeatureError("SUMMARY_RENDER",error);return chain.proceed();}
            }));drawReady=true;count++;
        }catch(Throwable error){module.logFeatureError("SUMMARY_DRAW",error);}
        for(String method:new String[]{"onLayout","calculateIconXTranslations","applyIconStates"})count+=hookNamed(module,loader,"notification_summary",TYPE,method,-1,null,(o,a,r)->{if(o instanceof ViewGroup&&phone((ViewGroup)o))state((ViewGroup)o).update(false);return PASS;});
        return count;
    }
    private static boolean phone(ViewGroup owner){
        try{if(!"notificationIcons".equals(owner.getResources().getResourceEntryName(owner.getId())))return false;}catch(RuntimeException unknown){return false;}
        return phoneRoot(owner)!=null;
    }
    private static View phoneRoot(View view){
        for(View v=view;v!=null;v=v.getParent() instanceof View?(View)v.getParent():null)
            if(v.getClass().getName().equals("com.android.systemui.statusbar.phone.PhoneStatusBarView"))return v;
        return null;
    }
    private static View nativeClock(View root){
        if(root==null)return null;
        for(Class<?> type=root.getClass();type!=null;type=type.getSuperclass())if(CLOCK.equals(type.getName()))return root;
        if(root instanceof ViewGroup){ViewGroup group=(ViewGroup)root;for(int i=0;i<group.getChildCount();i++){View found=nativeClock(group.getChildAt(i));if(found!=null)return found;}}
        return null;
    }
    /** Shared native palette for real phone notification glyphs; no theme/text fallback. */
    static Integer nativeTintFor(View target){
        if(!phoneNotificationIcon(target))return null;
        View clock=nativeClock(phoneRoot(target));Palette palette=PALETTES.get(clock);
        if(palette==null||nativeTint==null)return null;
        try{Object color=nativeTint.invoke(null,palette.areas,target,palette.tint);
            return color instanceof Integer&&((Integer)color>>>24)!=0?(Integer)color:null;
        }catch(ReflectiveOperationException unavailable){return null;}
    }
    static boolean phoneNotificationIcon(View target){
        if(target==null||!target.getClass().getName().equals("com.android.systemui.statusbar.StatusBarIconView"))return false;
        if(!(target.getParent() instanceof ViewGroup))return false;
        ViewGroup parent=(ViewGroup)target.getParent();
        return parent.getClass().getName().equals(TYPE)&&phone(parent);
    }
    /** Actual ROM dark-area palette, independent of colorful notification artwork. */
    private static final class Palette {
        final ArrayList<Rect> areas=new ArrayList<>();final int tint;
        Palette(Collection<?> source,int color){for(Object item:source)if(item instanceof Rect)areas.add(new Rect((Rect)item));tint=color;}
    }
    private static State state(ViewGroup view){State s=STATES.get(view);if(s==null){s=new State(view);STATES.put(view,s);}return s;}
    static int[] measure(ViewGroup view){
        if(!drawReady||!phone(view))return null;State s=state(view);s.update(false);return s.size();
    }
    private static View eligible(ViewGroup owner){
        for(int i=0;i<owner.getChildCount();i++){View v=owner.getChildAt(i);
            if(v.getVisibility()!=View.VISIBLE||!v.getClass().getName().equals("com.android.systemui.statusbar.StatusBarIconView"))continue;
            try{if(!Boolean.TRUE.equals(call(v,"isIconVisible"))||Boolean.TRUE.equals(call(v,"isIconBlocked"))||Integer.valueOf(2).equals(call(v,"getVisibleState")))continue;
                Object states=field(owner,"mIconStates"),nativeState=states instanceof Map?((Map<?,?>)states).get(v):null;if(Boolean.TRUE.equals(field(nativeState,"hidden")))continue;
                if(call(v,"getNotification")!=null||field(v,"mBundleEntry")!=null)return v;
            }catch(ReflectiveOperationException ignored){}
        }return null;
    }
    private static boolean active(View view){
        if(!view.isAttachedToWindow()||!view.isShown())return false;
        Display display=view.getDisplay();if(display!=null&&display.getState()!=Display.STATE_ON)return false;
        for(View at=view;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)if(at.getAlpha()<=0)return false;
        return true;
    }
    private static final class State implements Drawable.Callback,ViewTreeObserver.OnPreDrawListener,View.OnAttachStateChangeListener {
        final ViewGroup view;final TextPaint paint=new TextPaint(Paint.ANTI_ALIAS_FLAG);final Runnable changed=()->update(true);
        ConfigSnapshot snapshot;Drawable art;String requested="";int generation,mode,sizeDp;boolean enabled,closed,loading;String text="";int px;View first;
        WeakReference<View> clockSource=new WeakReference<>(null);
        State(ViewGroup view){this.view=view;view.getViewTreeObserver().addOnPreDrawListener(this);view.addOnAttachStateChangeListener(this);FeatureSettings.addSnapshotListener(view.getContext(),changed);}
        void update(boolean layout){
            if(closed)return;ConfigSnapshot next=FeatureSettings.snapshot(view.getContext());
            if(next!=snapshot){snapshot=next;enabled="1".equals(next.get(ConfigSchema.SYSTEMUI_MASTER))&&"1".equals(next.get(NotificationSummaryOptions.ENABLED));
                mode=FeatureSettings.integer(view.getContext(),NotificationSummaryOptions.MODE,0,0,2);
                text=next.get(mode==0?NotificationSummaryOptions.SYMBOL:NotificationSummaryOptions.TEXT);
                sizeDp=FeatureSettings.integer(view.getContext(),NotificationSummaryOptions.SIZE,18,8,40);
                String hash=enabled&&mode==2?next.get(NotificationSummaryOptions.ASSET):"";
                if(!hash.equals(requested)){requested=hash;int serial=++generation;stop();art=null;loading=!hash.isEmpty();
                    if(loading)IMAGES.execute(()->{Drawable decoded=null;try(InputStream stream=view.getContext().getContentResolver().openInputStream(Uri.parse("content://ls.augment.com.config/statusbar-icon/"+hash))){byte[] bytes=StatusBarAssetStore.read(stream);if(!hash.equals(StatusBarAssetStore.hash(bytes)))throw new IOException("hash mismatch");decoded=StatusBarAssetStore.decode(bytes,256);}catch(Exception ignored){}
                        Drawable result=decoded;view.post(()->{if(closed||serial!=generation){if(result instanceof AnimatedImageDrawable)((AnimatedImageDrawable)result).stop();return;}art=result;loading=false;if(art!=null)art.setCallback(this);view.requestLayout();view.invalidate();FeatureSettings.diagnostic(view.getContext(),"ls_augment_notification_summary_asset",art==null?"unavailable;native_fallback":"ready");});});
                }layout=true;
            }
            int nextPx=Math.round(sizeDp*view.getResources().getDisplayMetrics().density);if(nextPx!=px){px=nextPx;layout=true;}
            first=enabled?eligible(view):null;if(first==null||!active(view))stop();
            if(layout){view.requestLayout();view.invalidate();}
        }
        int[] size(){
            if(!enabled||first==null||mode==2&&art==null||mode!=2&&text.isEmpty())return null;
            if(mode!=2&&foreground()==null)return null;
            int height=Math.min(px,Math.max(1,view.getHeight()>0?view.getHeight():px));
            int width;
            if(mode==2)width=Math.max(1,Math.round(height*Math.max(1,art.getIntrinsicWidth())/(float)Math.max(1,art.getIntrinsicHeight())));
            else{paint.setTextSize(height*.8f);width=(int)Math.ceil(paint.measureText(text))+2;}
            width=Math.min(width,Math.round(120*view.getResources().getDisplayMetrics().density));return new int[]{Math.max(1,width),height};
        }
        void draw(Canvas c,int[] bounds){
            int w=bounds[0],h=bounds[1];boolean grid=StatusBarGridHook.ownsIconLayout(view);
            StatusBarIconSpacingSpec.Insets edge=grid?StatusBarIconSpacingSpec.ZERO:StatusBarIconLayoutHook.insets(view,"notifications");float density=view.getResources().getDisplayMetrics().density;
            if(!grid){w=Math.min(w,Math.max(0,view.getWidth()-(int)Math.ceil(edge.horizontal()*density)));h=Math.min(h,Math.max(0,view.getHeight()-(int)Math.ceil(edge.vertical()*density)));}if(w<=0||h<=0){stop();return;}
            int save=c.save();if(!grid)c.translate(view.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?view.getWidth()-w-edge.start*density:edge.start*density,(view.getHeight()-h-edge.vertical()*density)/2f+edge.top*density);
            try{c.clipRect(0,0,w,h);
            if(mode==2&&art!=null){float ratio=Math.min(w/(float)Math.max(1,art.getIntrinsicWidth()),h/(float)Math.max(1,art.getIntrinsicHeight()));int aw=Math.round(art.getIntrinsicWidth()*ratio),ah=Math.round(art.getIntrinsicHeight()*ratio);art.setBounds((w-aw)/2,(h-ah)/2,(w+aw)/2,(h+ah)/2);art.draw(c);if(active(view)&&art instanceof AnimatedImageDrawable&&!((AnimatedImageDrawable)art).isRunning())((AnimatedImageDrawable)art).start();}
            else{Integer tint=foreground();if(tint==null)throw new IllegalStateException("native summary foreground unavailable");paint.setColor(tint);paint.setTextSize(h*.8f);String line=TextUtils.ellipsize(text,paint,w,TextUtils.TruncateAt.END).toString();Paint.FontMetrics fm=paint.getFontMetrics();c.drawText(line,0,h/2f-(fm.ascent+fm.descent)/2,paint);}
            }finally{c.restoreToCount(save);}
        }
        Integer foreground(){
            View root=phoneRoot(view),clock=clockSource.get();
            if(clock==null||phoneRoot(clock)!=root){clock=nativeClock(root);clockSource=new WeakReference<>(clock);}
            if(clock==null)return null;
            Palette palette=PALETTES.get(clock);
            if(palette!=null&&nativeTint!=null)try{
                // Resolve at the summary's current location, not the clock's or
                // first app icon's location. The native API handles split areas.
                Object color=nativeTint.invoke(null,palette.areas,view,palette.tint);
                if(color instanceof Integer&&((Integer)color>>>24)!=0)return (Integer)color;
            }catch(ReflectiveOperationException ignored){ }
            // Clock.onDarkChanged saves this before any OEM/custom text styling.
            Object color=field(clock,"mNonAdaptedColor");
            if(color instanceof Integer&&((Integer)color>>>24)!=0)return (Integer)color;
            try{color=call(clock,"getCurrentTextColor");if(color instanceof Integer&&((Integer)color>>>24)!=0)return (Integer)color;}
            catch(ReflectiveOperationException ignored){ }
            // No safe foreground source: keep native notifications instead of
            // guessing white/black from the app's theme or notification image.
            return null;
        }
        void stop(){if(art instanceof AnimatedImageDrawable)((AnimatedImageDrawable)art).stop();}
        void close(){closed=true;++generation;stop();if(art!=null)art.setCallback(null);FeatureSettings.removeSnapshotListener(changed);view.removeOnAttachStateChangeListener(this);if(view.getViewTreeObserver().isAlive())view.getViewTreeObserver().removeOnPreDrawListener(this);}
        @Override public boolean onPreDraw(){update(false);return true;}
        @Override public void onViewAttachedToWindow(View view){}
        @Override public void onViewDetachedFromWindow(View detached){if(STATES.get(view)==this)STATES.remove(view);close();}
        @Override public void invalidateDrawable(Drawable who){if(!closed&&enabled&&first!=null&&active(view))view.invalidate();else stop();}
        @Override public void scheduleDrawable(Drawable who,Runnable what,long when){if(!closed&&enabled&&first!=null&&active(view))view.postDelayed(what,Math.max(0,when-SystemClock.uptimeMillis()));}
        @Override public void unscheduleDrawable(Drawable who,Runnable what){view.removeCallbacks(what);}
    }
}
