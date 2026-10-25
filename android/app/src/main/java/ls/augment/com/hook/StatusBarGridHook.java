package ls.augment.com.hook;

import android.content.Context;
import android.database.ContentObserver;
import android.graphics.Rect;
import android.graphics.Matrix;
import android.net.TrafficStats;
import android.net.Uri;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.lang.reflect.Method;
import java.util.*;
import ls.augment.com.ConfigSchema;
import ls.augment.com.StatusBarGridSpec;
import ls.augment.com.StatusBarGridLayout;
import ls.augment.com.StatusBarAdaptiveLayout;

/** Places native icon views into measured rows without taking over their lifecycle. */
final class StatusBarGridHook {
    private static final Map<ViewGroup, State> STATES = new WeakHashMap<>();
    private static final String ROOT = "com.android.systemui.statusbar.phone.PhoneStatusBarView";
    private static final String KEYGUARD = "com.android.systemui.statusbar.phone.KeyguardStatusBarView";
    static boolean isBarRoot(View view) {
        for (Class<?> type=view.getClass(); type!=null; type=type.getSuperclass())
            if (ROOT.equals(type.getName()) || KEYGUARD.equals(type.getName())) return true;
        return false;
    }
    private static boolean isKeyguard(View view) {
        for(Class<?> type=view.getClass();type!=null;type=type.getSuperclass())
            if(KEYGUARD.equals(type.getName()))return true;
        return false;
    }
    /** Root overlays must follow the native icon region, which OEMs hide without hiding the root. */
    private static float overlayAlpha(View root,View anchor) {
        if(anchor==null||!(anchor.getParent() instanceof View))return 0;
        float alpha=1;
        // Ignore the battery's own alpha: the three-in-one replacement deliberately sets it to zero.
        // Root/outer-window alpha already applies to both children and must not be multiplied twice.
        for(View parent=(View)anchor.getParent();parent!=root;){
            if(parent.getVisibility()!=View.VISIBLE)return 0;
            alpha*=parent.getAlpha()*parent.getTransitionAlpha();
            if(!(parent.getParent() instanceof View))return 0;
            parent=(View)parent.getParent();
        }
        return Math.max(0,Math.min(1,alpha));
    }
    static boolean inBar(View view) {
        for (View current=view; current!=null;
                current=current.getParent() instanceof View?(View)current.getParent():null)
            if (isBarRoot(current)) return true;
        return false;
    }
    static String hiddenReason(View view){
        State state=stateFor(view);if(state==null||!state.active||state.packingSuspended)return "";
        for(View at=view;at!=null&&at!=state.root;at=at.getParent() instanceof View?(View)at.getParent():null){
            if(RedMagicSystemUiHook.isCollapsedSignal(at))return "已由双排信号替代";
            if(state.connectivityPlaced()&&state.isConnectivity(at))return "已由三合一图标替代";
            Geometry geometry=state.geometry.get(at);
            if(geometry!=null&&geometry.applied&&geometry.lastAlpha==0&&geometry.alpha>0)return "模块布局隐藏";
        }return "";
    }
    static boolean ownsIconLayout(View view) {
        State state=stateFor(view);
        return state!=null&&state.active&&!state.packingSuspended&&!state.positionOnly();
    }
    static boolean configuredIconLayout(View view){State state=stateFor(view);return state!=null&&state.active&&!state.positionOnly();}
    static void invalidateLayout(View view){State state=stateFor(view);if(state!=null)state.layoutDirty=true;}
    static boolean ownsConnectivityReplacement(View view){State state=stateFor(view);return state!=null&&state.active&&!state.packingSuspended&&state.connectivityPlaced();}
    private static State stateFor(View view) {
        for(View current=view;current!=null;current=current.getParent() instanceof View?(View)current.getParent():null)
            if(isBarRoot(current))return STATES.get(current);
        return null;
    }
    static void prepareNativeIcons(ViewGroup container) {
        State state=stateFor(container);
        if(state==null||!state.active)return;
        state.layoutDirty=true;
        // resetViewStates reads the live View into the OEM animation model. Never
        // let yesterday's grid translation/scale become tomorrow's native baseline.
        for(int i=0;i<container.getChildCount();i++){
            View child=container.getChildAt(i);Geometry g=state.geometry.get(child);
            if(g!=null)g.restore(child);
        }
    }
    static boolean hasGridTransform(View view) {
        State state=stateFor(view);
        if(state==null||!state.active||state.packingSuspended)return false;
        for(View current=view;current!=null&&current!=state.root;
                current=current.getParent() instanceof View?(View)current.getParent():null){
            Geometry g=state.geometry.get(current);if(g!=null&&g.applied)return true;
        }
        return false;
    }
    /** Untransformed OEM allocation for the independent carrier's width budget. */
    static void carrierNativeFrame(View view,Rect out){
        State state=stateFor(view);Geometry geometry=state==null?null:state.geometry.get(view);
        if(geometry!=null){geometry.observeMeasuredLayout(view);if(geometry.measuredLayout){out.set(geometry.left,geometry.top,geometry.right,geometry.bottom);return;}}
        out.set(view.getLeft(),view.getTop(),view.getRight(),view.getBottom());
    }
    static boolean isCarrierGridOverlay(View view){State state=stateFor(view);return state!=null&&(view==state.overlay||view==state.connectivityIcon);}
    /** Only a live phone grid may bypass OEM collapsing of the content it owns. */
    static boolean ownsRecentsContent(View view, boolean customClock) {
        for(View current=view;current!=null;
                current=current.getParent() instanceof View?(View)current.getParent():null){
            if(!isBarRoot(current))continue;
            State state=STATES.get(current);
            return state!=null&&state.active&&!state.packingSuspended&&!isKeyguard(current)&&!state.positionOnly()
                    &&FeatureSettings.enabled(state.context,FeatureSettings.SYSTEMUI_MASTER)
                    &&(!customClock||FeatureSettings.enabled(state.context,FeatureSettings.STATUSBAR_CLOCK_CUSTOM));
        }
        return false;
    }

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    static int install(AugmentModule module, ClassLoader loader) {
        int count=0;
        for (String rootClass : new String[]{ROOT, KEYGUARD}) try {
            Class<?> type=Class.forName(rootClass,false,loader);
            Method updateHeight=find(type,"updateStatusBarHeight");
            if(updateHeight!=null){
                module.registerFeatureHook(module.prepareFeatureHook(updateHeight,"systemui.grid.native_height",false).intercept(chain->{
                    Object result=chain.proceed();State state=STATES.get(chain.getThisObject());
                    if(state!=null)state.applyHeight(state.active?FeatureSettings.integer(state.context,ConfigSchema.STATUSBAR_HEIGHT_DP,0,ConfigSchema.STATUSBAR_HEIGHT_MIN_DP,ConfigSchema.STATUSBAR_HEIGHT_MAX_DP):0);
                    return result;
                }));count++;
            }
            for (String name : new String[]{"onFinishInflate", "onAttachedToWindow", "onDetachedFromWindow"}) {
                Method method=find(type,name); if (method==null) continue;
                method.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(method,"systemui.grid."+name,false).intercept(chain -> {
                    Object result=chain.proceed(); Object owner=chain.getThisObject();
                    if (type.isInstance(owner) && owner instanceof ViewGroup) {
                        ViewGroup root=(ViewGroup)owner;
                        if (name.equals("onDetachedFromWindow")) { State s=STATES.remove(root); if(s!=null)s.detach(); }
                        else { State s=STATES.get(root); if(s==null){s=new State(root);STATES.put(root,s);} s.attach(); }
                    }
                    return result;
                })); count++;
            }
        } catch(Throwable e) { FeatureSettings.diagnostic(FeatureSettings.from(null),FeatureSettings.SYSTEMUI_LAST_ERROR,"grid_install:"+e); }
        try{
            Class<?> container=Class.forName("com.android.systemui.statusbar.phone.NotificationIconContainer",false,loader);
            NotificationCapacity capacity=new NotificationCapacity(container);
            module.registerFeatureHook(module.prepareFeatureHook(capacity.calculate,"systemui.grid.notification_capacity",true).intercept(chain->{
                ViewGroup view=(ViewGroup)chain.getThisObject();boolean phone=false;
                phone=inBar(view);
                boolean unlimited=FeatureSettings.enabled(view.getContext(),ConfigSchema.STATUSBAR_NOTIFICATION_UNLIMITED);
                int limit=unlimited?Math.max(1,view.getChildCount()):FeatureSettings.integer(view.getContext(),ConfigSchema.STATUSBAR_NOTIFICATION_MAX,0,0,20);
                if(!phone||limit==0||!FeatureSettings.enabled(view.getContext(),ConfigSchema.SYSTEMUI_MASTER)
                        ||FeatureSettings.enabled(view.getContext(),ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY))return chain.proceed();
                int[] saved=capacity.snapshot(view);
                int room=view.getWidth();for(int i=0;i<view.getChildCount();i++)room+=view.getChildAt(i).getWidth();
                try{capacity.apply(view,limit,room);return chain.proceed();}finally{capacity.restore(view,saved);}
            }));count++;
        }catch(Throwable e){module.logFeatureError("STATUSBAR_NOTIFICATION_CAPACITY",e);}
        count+=StatusBarNativeIconHook.install(module,loader);
        count+=StatusBarTintHook.install(module,loader);
        return count;
    }
    /** Select complete legacy/new overflow contracts; unknown layouts stay native. */
    private static final class NotificationCapacity {
        final Method calculate;
        final java.lang.reflect.Field maximum,width,speedBump;
        NotificationCapacity(Class<?> type)throws ReflectiveOperationException {
            calculate=find(type,"calculateIconXTranslations");
            if(calculate==null||calculate.getReturnType()!=void.class||java.lang.reflect.Modifier.isStatic(calculate.getModifiers()))
                throw new NoSuchMethodException("NotificationIconContainer.calculateIconXTranslations():void");
            calculate.setAccessible(true);
            maximum=integerField(type,"mMaxIcons");width=integerField(type,"mActualLayoutWidth");
            java.lang.reflect.Field bump;
            try{bump=integerField(type,"mSpeedBumpIndex");}catch(NoSuchFieldException absent){
                // The newer OEM algorithm implements overflow through this exact method.
                Method overflow=null;
                for(Class<?> cursor=type;cursor!=null;cursor=cursor.getSuperclass())try{
                    overflow=cursor.getDeclaredMethod("shouldForceOverflow",int.class,float.class,int.class);break;
                }catch(NoSuchMethodException ignored){}
                if(overflow==null||overflow.getReturnType()!=boolean.class||java.lang.reflect.Modifier.isStatic(overflow.getModifiers()))
                    throw new NoSuchMethodException("Notification overflow contract: mSpeedBumpIndex or shouldForceOverflow(int,float,int):boolean");
                bump=null;
            }
            speedBump=bump;
        }
        private static java.lang.reflect.Field integerField(Class<?> type,String name)throws ReflectiveOperationException {
            for(Class<?> cursor=type;cursor!=null;cursor=cursor.getSuperclass())try{
                java.lang.reflect.Field field=cursor.getDeclaredField(name);
                if(field.getType()!=int.class||java.lang.reflect.Modifier.isStatic(field.getModifiers()))
                    throw new IllegalAccessException(name+" must be an instance int field");
                field.setAccessible(true);return field;
            }catch(NoSuchFieldException ignored){}
            throw new NoSuchFieldException(name);
        }
        int[] snapshot(Object target)throws IllegalAccessException{return new int[]{maximum.getInt(target),width.getInt(target),speedBump==null?0:speedBump.getInt(target)};}
        void apply(Object target,int limit,int room)throws IllegalAccessException{maximum.setInt(target,limit);width.setInt(target,room);if(speedBump!=null)speedBump.setInt(target,-1);}
        void restore(Object target,int[] saved)throws IllegalAccessException{maximum.setInt(target,saved[0]);width.setInt(target,saved[1]);if(speedBump!=null)speedBump.setInt(target,saved[2]);}
    }
    private static Method find(Class<?> type,String name) {
        for(Class<?> c=type;c!=null;c=c.getSuperclass()) try{return c.getDeclaredMethod(name);}catch(NoSuchMethodException ignored){}
        return null;
    }
    private static String name(View v) { if(v.getId()==View.NO_ID||v.getId()==0)return "";try{return v.getResources().getResourceEntryName(v.getId());}catch(Exception e){return "";} }
    private static boolean colorOnlySetting(String key) {
        return key.equals(ConfigSchema.STATUSBAR_CONNECTIVITY_COLORS)
                ||key.equals(ConfigSchema.STATUSBAR_CONNECTIVITY_PLUG_COLOR)
                ||key.equals("ls_augment_rm_battery_colors")
                ||key.startsWith("ls_augment_rm_battery_color_")
                ||key.equals("ls_augment_rm_battery_charging_color")
                ||key.equals("ls_augment_rm_battery_text_colors")
                ||key.startsWith("ls_augment_rm_battery_text_color_")
                ||key.equals("ls_augment_rm_battery_text_charging_color");
    }
    private static boolean iconStyleSetting(String key) {
        return key.equals(ConfigSchema.STATUSBAR_BLUETOOTH_STYLE)
                ||key.equals(ConfigSchema.STATUSBAR_VPN_STYLE);
    }
    private static View findView(View root,String... names) {
        if(Arrays.asList(names).contains(name(root)))return root;
        if(root instanceof ViewGroup) for(int i=0;i<((ViewGroup)root).getChildCount();i++) {
            View found=findView(((ViewGroup)root).getChildAt(i),names);if(found!=null)return found;
        }
        return null;
    }
    private static View findClass(View root,String suffix) {
        if(root.getClass().getSimpleName().equals(suffix))return root;
        if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++){
            View result=findClass(((ViewGroup)root).getChildAt(i),suffix);if(result!=null)return result;
        }return null;
    }
    private static boolean visibleFrame(View view){
        if(!view.isAttachedToWindow()||view.getWindowVisibility()!=View.VISIBLE)return false;
        for(View at=view;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)
            if(at.getVisibility()!=View.VISIBLE||at.getAlpha()*at.getTransitionAlpha()<=.01f)return false;
        return true;
    }
    /** Cheap view reads detect OEM changes even when no layout callback was emitted. */
    private static final class FrameWitness {
        final View view;final ViewParent parent;final ViewGroup.LayoutParams params;
        final int left,top,right,bottom,measuredWidth,measuredHeight,visibility,direction;
        final int paddingLeft,paddingTop,paddingRight,paddingBottom,scrollX,scrollY,children,paramWidth,paramHeight;
        final float x,y,sx,sy,pivotX,pivotY,rotation,rotationX,rotationY,alpha;
        final boolean ownAlpha;
        final boolean zeroOpacity;
        final boolean visibleHierarchy;
        final Rect clipBounds;final Rect clipProbe=new Rect();
        final boolean clipToOutline,clipChildren,clipToPadding;
        final String text;final android.graphics.Typeface typeface;final float textSize,letterSpacing;final int textColor;
        final android.graphics.drawable.Drawable image;final int imageWidth,imageHeight,imageLevel,imageLeft,imageTop,imageRight,imageBottom;
        final Matrix imageMatrix;final ImageView.ScaleType imageScaleType;
        final boolean nativeBattery;final Object batteryLevel,batteryCharging,batteryMode,batteryHollow;
        FrameWitness(View view,boolean owned){
            this.view=view;parent=view.getParent();params=view.getLayoutParams();paramWidth=params==null?0:params.width;paramHeight=params==null?0:params.height;
            left=view.getLeft();top=view.getTop();right=view.getRight();bottom=view.getBottom();measuredWidth=view.getMeasuredWidth();measuredHeight=view.getMeasuredHeight();
            visibility=view.getVisibility();direction=view.getLayoutDirection();paddingLeft=view.getPaddingLeft();paddingTop=view.getPaddingTop();paddingRight=view.getPaddingRight();paddingBottom=view.getPaddingBottom();
            scrollX=view.getScrollX();scrollY=view.getScrollY();children=view instanceof ViewGroup?((ViewGroup)view).getChildCount():0;
            x=view.getTranslationX();y=view.getTranslationY();sx=view.getScaleX();sy=view.getScaleY();pivotX=view.getPivotX();pivotY=view.getPivotY();
            rotation=view.getRotation();rotationX=view.getRotationX();rotationY=view.getRotationY();alpha=view.getAlpha();
            // Ancestor alpha is an animation input, not a packing input. The
            // replacement overlays follow it separately on every visible frame.
            ownAlpha=owned&&!(view instanceof ViewGroup);
            zeroOpacity=alpha==0||view.getTransitionAlpha()==0;
            boolean visible=true;
            for(View at=view;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)
                if(at.getVisibility()!=View.VISIBLE){visible=false;break;}
            visibleHierarchy=visible;
            clipBounds=view.getClipBounds(clipProbe)?new Rect(clipProbe):null;
            clipToOutline=view.getClipToOutline();
            clipChildren=view instanceof ViewGroup&&((ViewGroup)view).getClipChildren();
            clipToPadding=view instanceof ViewGroup&&((ViewGroup)view).getClipToPadding();
            nativeBattery=view.getClass().getSimpleName().equals("MFVBatteryViewLayout");
            batteryLevel=nativeBattery?SystemUiAdapter.field(view,"mBateryLevel"):null;batteryCharging=nativeBattery?SystemUiAdapter.field(view,"mIsCharing"):null;
            batteryMode=nativeBattery?SystemUiAdapter.field(view,"mShowMode"):null;batteryHollow=nativeBattery?SystemUiAdapter.field(view,"mTextHollowEffectAvailable"):null;
            if(view instanceof TextView){TextView label=(TextView)view;text=label.getText().toString();typeface=label.getTypeface();textSize=label.getTextSize();letterSpacing=label.getLetterSpacing();textColor=label.getCurrentTextColor();}
            else{text=null;typeface=null;textSize=letterSpacing=0;textColor=0;}
            image=view instanceof ImageView?((ImageView)view).getDrawable():null;
            imageMatrix=view instanceof ImageView?new Matrix(((ImageView)view).getImageMatrix()):null;
            imageScaleType=view instanceof ImageView?((ImageView)view).getScaleType():null;
            if(image!=null){imageWidth=image.getIntrinsicWidth();imageHeight=image.getIntrinsicHeight();imageLevel=image.getLevel();Rect box=image.getBounds();imageLeft=box.left;imageTop=box.top;imageRight=box.right;imageBottom=box.bottom;}
            else{imageWidth=imageHeight=imageLevel=imageLeft=imageTop=imageRight=imageBottom=0;}
        }
        boolean matches(){
            if(view.getParent()!=parent||view.getLayoutParams()!=params||(params!=null&&(params.width!=paramWidth||params.height!=paramHeight))
                    ||view.getVisibility()!=visibility||view instanceof ViewGroup&&((ViewGroup)view).getChildCount()!=children)return false;
            // GONE descendants can retain PFLAG_FORCE_LAYOUT indefinitely because
            // Android skips measuring them. They cannot affect the visible pack.
            // Every ancestor is also witnessed, so becoming visible repacks with
            // the latest geometry/content before this shortcut is considered again.
            if(!visibleHierarchy)return true;
            // App/launcher transitions can change RenderNode clipping without a
            // layout request. Repack before drawing to release the new native
            // clip; witnesses are captured after release, so stable frames reuse
            // their geometry. Reuse the probe instead of allocating per frame.
            if((view.getClipBounds(clipProbe)?clipBounds==null||!clipBounds.equals(clipProbe):clipBounds!=null)
                    ||view.getClipToOutline()!=clipToOutline
                    ||view instanceof ViewGroup&&(((ViewGroup)view).getClipChildren()!=clipChildren
                    ||((ViewGroup)view).getClipToPadding()!=clipToPadding))return false;
            if(view.isLayoutRequested()||view.getLeft()!=left||view.getTop()!=top||view.getRight()!=right||view.getBottom()!=bottom
                    ||view.getMeasuredWidth()!=measuredWidth||view.getMeasuredHeight()!=measuredHeight||view.getLayoutDirection()!=direction
                    ||view.getPaddingLeft()!=paddingLeft||view.getPaddingTop()!=paddingTop||view.getPaddingRight()!=paddingRight||view.getPaddingBottom()!=paddingBottom
                    ||view.getScrollX()!=scrollX||view.getScrollY()!=scrollY||view.getTranslationX()!=x||view.getTranslationY()!=y||view.getScaleX()!=sx||view.getScaleY()!=sy
                    ||view.getPivotX()!=pivotX||view.getPivotY()!=pivotY||view.getRotation()!=rotation||view.getRotationX()!=rotationX||view.getRotationY()!=rotationY
                    ||ownAlpha&&view.getAlpha()!=alpha||(view.getAlpha()==0||view.getTransitionAlpha()==0)!=zeroOpacity)return false;
            if(view instanceof TextView){TextView label=(TextView)view;if(!text.contentEquals(label.getText())||label.getTypeface()!=typeface
                    ||label.getTextSize()!=textSize||label.getLetterSpacing()!=letterSpacing||label.getCurrentTextColor()!=textColor)return false;}
            if(nativeBattery&&(!Objects.equals(batteryLevel,SystemUiAdapter.field(view,"mBateryLevel"))||!Objects.equals(batteryCharging,SystemUiAdapter.field(view,"mIsCharing"))
                    ||!Objects.equals(batteryMode,SystemUiAdapter.field(view,"mShowMode"))||!Objects.equals(batteryHollow,SystemUiAdapter.field(view,"mTextHollowEffectAvailable"))))return false;
            if(view instanceof ImageView){ImageView owner=(ImageView)view;android.graphics.drawable.Drawable current=owner.getDrawable();
                if(current!=image||owner.getScaleType()!=imageScaleType||!imageMatrix.equals(owner.getImageMatrix()))return false;
                if(current!=null){Rect box=current.getBounds();if(current.getIntrinsicWidth()!=imageWidth||current.getIntrinsicHeight()!=imageHeight||current.getLevel()!=imageLevel
                        ||box.left!=imageLeft||box.top!=imageTop||box.right!=imageRight||box.bottom!=imageBottom)return false;}}
            return true;
        }
    }
    private static final class Geometry {
        float x,y,sx,sy,alpha,lastX,lastY,lastSx,lastSy,lastAlpha; boolean applied;
        int left,top,right,bottom,measuredWidth,measuredHeight;
        int lastLeft,lastTop,lastRight,lastBottom,lastMeasuredWidth,lastMeasuredHeight;
        boolean measuredLayout;
        Geometry(View v){capture(v);}
        void capture(View v){x=v.getTranslationX();y=v.getTranslationY();sx=v.getScaleX();sy=v.getScaleY();alpha=v.getAlpha();}
        void observe(View v){observeMeasuredLayout(v);if(!applied){capture(v);return;}
            if(v.getTranslationX()!=lastX)x=v.getTranslationX(); if(v.getTranslationY()!=lastY)y=v.getTranslationY();
            if(v.getScaleX()!=lastSx)sx=v.getScaleX();if(v.getScaleY()!=lastSy)sy=v.getScaleY();if(v.getAlpha()!=lastAlpha)alpha=v.getAlpha();}
        void mark(View v){lastX=v.getTranslationX();lastY=v.getTranslationY();lastSx=v.getScaleX();lastSy=v.getScaleY();lastAlpha=v.getAlpha();applied=true;}
        void observeMeasuredLayout(View v){if(!measuredLayout)return;
            // A native layout/measure pass supersedes our last override. Never
            // restore a stale frame after rotation or an OEM status-bar update.
            if(v.getLeft()!=lastLeft||v.getTop()!=lastTop||v.getRight()!=lastRight||v.getBottom()!=lastBottom){
                left=v.getLeft();top=v.getTop();right=v.getRight();bottom=v.getBottom();}
            if(v.getMeasuredWidth()!=lastMeasuredWidth||v.getMeasuredHeight()!=lastMeasuredHeight){
                measuredWidth=v.getMeasuredWidth();measuredHeight=v.getMeasuredHeight();}
        }
        void beginMeasuredLayout(View v){observeMeasuredLayout(v);if(!measuredLayout){
            left=v.getLeft();top=v.getTop();right=v.getRight();bottom=v.getBottom();
            measuredWidth=v.getMeasuredWidth();measuredHeight=v.getMeasuredHeight();}}
        void endMeasuredLayout(View v){measuredLayout=true;
            lastLeft=v.getLeft();lastTop=v.getTop();lastRight=v.getRight();lastBottom=v.getBottom();
            lastMeasuredWidth=v.getMeasuredWidth();lastMeasuredHeight=v.getMeasuredHeight();}
        void restore(View v){observe(v);
            if(measuredLayout){
                if(v.getMeasuredWidth()!=measuredWidth||v.getMeasuredHeight()!=measuredHeight)
                    v.measure(View.MeasureSpec.makeMeasureSpec(measuredWidth,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(measuredHeight,View.MeasureSpec.EXACTLY));
                if(v.getLeft()!=left||v.getTop()!=top||v.getRight()!=right||v.getBottom()!=bottom)v.layout(left,top,right,bottom);
                measuredLayout=false;
            }
            v.setTranslationX(x);v.setTranslationY(y);v.setScaleX(sx);v.setScaleY(sy);v.setAlpha(alpha);applied=false;}
    }
    static final class State {
        final ViewGroup root; final Context context; final Handler main=new Handler(Looper.getMainLooper());
        final Map<View,Geometry> geometry=new IdentityHashMap<>();
        final Map<ViewGroup,boolean[]> clips=new IdentityHashMap<>();
        final StatusBarClipping explicitClips=new StatusBarClipping();
        final Map<String,TextView> metrics=new LinkedHashMap<>();
        final TextView[] clockLines=new TextView[2];
        final Map<String,String> metricValues=new LinkedHashMap<>();
        final Map<View,Rect> contentBounds=new IdentityHashMap<>();
        android.graphics.Bitmap batteryBitmap;int[] batteryPixels;Rect batteryInk;long batteryInkAt;View batteryInkView;String batteryInkInputs="";
        final Runnable snapshotListener=this::refresh;
        final ViewTreeObserver.OnPreDrawListener draw=this::beforeDraw;
        final ViewTreeObserver.OnGlobalLayoutListener nativeLayout=()->layoutDirty=true;
        final List<FrameWitness> frameWitnesses=new ArrayList<>();
        boolean layoutDirty=true;
        View alphaAnchor;
        View nativeCapacityContainer; Boolean nativeCapacityOwner; PackingCapacityBlock packingCapacityBlock;
        HandlerThread thread; volatile Handler worker; volatile long metricsGeneration;
        FrameLayout overlay; TextView keyguardClock; boolean attached,active,applying,layoutFailed;
        ConnectivityIconView connectivityIcon;
        final List<View> circleNative=new ArrayList<>();
        String circleBudgetKey="";int[] circleBudget={0,0};
        boolean circleTrial;
        boolean packingSuspended;
        String trialClockCapacity;
        String packingIssue="";
        StatusBarGridSpec spec=StatusBarGridSpec.defaults(); int nativeHeight=Integer.MIN_VALUE;
        long previousRx=-1,previousTx=-1,previousTime,lastWitness,layoutFrames,positionWrites;
        String lastRaw="",lastConfig="",lastLayoutConfig="",lastStructureConfig="";
        State(ViewGroup root){this.root=root;context=root.getContext();}
        boolean beforeDraw(){
            // The status-bar window keeps drawing during shade transitions, including
            // a hidden keyguard tree. No font measurement or packing is needed there.
            if(!active||!visibleFrame(root)){layoutDirty=true;return true;}
            syncOverlayAlpha();
            boolean batteryDue=batteryInk!=null&&SystemClock.elapsedRealtime()-batteryInkAt>=1000;
            if(!layoutDirty&&!packingSuspended&&packingCapacityBlock==null&&!batteryDue&&unchangedFrame()){
                StatusBarTintHook.refreshDirty(root);return true;
            }
            layoutDirty=false;
            layout();
            boolean ready=syncNativeIconCapacity();
            if(!ready)layoutDirty=true;
            frameWitnesses.clear();
            if(active&&!packingSuspended)captureFrame(root);
            return ready;
        }
        boolean unchangedFrame(){
            if(frameWitnesses.isEmpty())return false;
            for(FrameWitness witness:frameWitnesses)if(!witness.matches())return false;
            return true;
        }
        void captureFrame(View view){
            frameWitnesses.add(new FrameWitness(view,geometry.containsKey(view)));
            if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)captureFrame(((ViewGroup)view).getChildAt(i));
        }
        void syncOverlayAlpha(){
            // Rejected packing retains these views for a later retry. Ancestor
            // fades must never reveal their restored/old positions meanwhile.
            float regionAlpha=active&&!packingSuspended?overlayAlpha(root,alphaAnchor):0;
            if(connectivityIcon!=null)connectivityIcon.setAlpha(connectivityPlaced()?regionAlpha:0);
            if(overlay!=null)overlay.setAlpha(regionAlpha);
        }
        void clearRejectedCapacity(){if(packingCapacityBlock!=null){packingCapacityBlock.close();packingCapacityBlock=null;}}
        boolean holdRejectedCapacity(){
            if(packingCapacityBlock==null)return false;
            if(packingCapacityBlock.matches())return true;
            clearRejectedCapacity();return false;
        }
        /** A native overflow may hide child content. It must not make the same failed grid appear to fit. */
        final class PackingCapacityBlock {
            final String inputs=nativeCapacityInputs(trialClockCapacity);final ViewTreeObserver observer=root.getViewTreeObserver();
            String restoredShape;long layoutEpoch;boolean nativePassRequested;
            final ViewTreeObserver.OnGlobalLayoutListener nativeLayout=()->layoutEpoch++;
            PackingCapacityBlock(){observer.addOnGlobalLayoutListener(nativeLayout);}
            boolean matches(){
                if(!inputs.equals(nativeCapacityInputs()))return false;
                if(restoredShape==null){
                    // WRAP_CONTENT may still contain our old allocation until an actual native traversal.
                    if(layoutEpoch==0||nativeLayoutPending(root))return true;
                    restoredShape=nativeCapacityShape();close();return true;
                }
                return restoredShape.equals(nativeCapacityShape());
            }
            void close(){if(observer.isAlive())observer.removeOnGlobalLayoutListener(nativeLayout);}
        }
        boolean capacityOverlay(View view){return view==overlay||view==connectivityIcon||view==keyguardClock;}
        boolean nativeLayoutPending(View view){
            if(capacityOverlay(view))return false;
            if(view.getVisibility()==View.GONE)return false;
            if(view.isLayoutRequested())return true;
            if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)if(nativeLayoutPending(((ViewGroup)view).getChildAt(i)))return true;
            return false;
        }
        String nativeCapacityInputs(){return nativeCapacityInputs(null);}
        String nativeCapacityInputs(String failedClockCapacity){
            StringBuilder out=new StringBuilder(lastLayoutConfig).append('|').append(root.getWidth()).append('x').append(root.getHeight())
                    .append('|').append(root.getResources().getConfiguration()).append('|').append(root.getLayoutDirection());
            if(root.getDisplay()!=null)out.append('|').append(root.getDisplay().getRotation());
            WindowInsets insets=root.getRootWindowInsets();if(insets!=null)out.append('|').append(insets.getDisplayCutout());
            // A pending source or asynchronous artwork/font completion can make
            // the same native fallback eligible without a configuration change.
            out.append("|circle:");
            if(connectivityIcon==null)out.append("missing");
            else out.append(connectivityIcon.ready()).append('/').append(connectivityIcon.inputKey());
            appendNativeEligibility(root,out);appendMetricCapacity(out);
            if(failedClockCapacity==null)appendClockCapacity(out);else out.append(failedClockCapacity);
            return out.toString();
        }
        void appendClockCapacity(StringBuilder out){out.append(clockCapacityInput(SystemUiHook.wantedGridClock(root)));}
        String clockCapacityInput(TextView wanted){
            if(wanted==null)return "";
            StringBuilder out=new StringBuilder("|wantedClock:");
            if(!splitClock()){appendTextCapacity(wanted,out);return out.toString();}
            String[] lines=wanted.getText().toString().split("\n",-1);
            int width=px(FeatureSettings.integer(context,ConfigSchema.STATUSBAR_CLOCK_WIDTH_DP,0,0,240));
            for(String line:lines)width=Math.max(width,(int)Math.ceil(android.text.Layout.getDesiredWidth(line,wanted.getPaint())));
            out.append(wanted.getTypeface()).append(':').append(wanted.getTextSize()).append(':').append(wanted.getLetterSpacing()).append(':').append(width);
            for(int row=0;row<2;row++){
                String line=row<lines.length?lines[row]:"";Rect ink=new Rect();
                wanted.getPaint().getTextBounds(line,0,line.length(),ink);
                out.append('|').append(!line.isEmpty()).append(':').append(Math.min(0,ink.left)).append(',').append(ink.top)
                        .append(',').append(Math.max(width,ink.right)).append(',').append(ink.bottom);
            }
            return out.toString();
        }
        void appendMetricCapacity(StringBuilder out){
            for(Map.Entry<String,TextView> entry:metrics.entrySet()){
                if(!spec.get(baseId(entry.getKey())).visible)continue;
                out.append("|metric:").append(entry.getKey());appendTextCapacity(entry.getValue(),out);
            }
        }
        void appendTextCapacity(TextView text,StringBuilder out){
            String[] lines=text.getText().toString().split("\n",-1);float width=0;
            for(String line:lines)width=Math.max(width,text.getPaint().measureText(line));
            android.graphics.Paint.FontMetricsInt fm=text.getPaint().getFontMetricsInt();
            out.append(':').append((int)Math.ceil(width)).append('x').append((fm.descent-fm.ascent)*lines.length)
                    .append(':').append(text.getTextSize()).append(':').append(text.getTypeface());
            if(lines.length==1&&!lines[0].isEmpty()){
                Rect ink=new Rect();text.getPaint().getTextBounds(lines[0],0,lines[0].length(),ink);
                ViewGroup.LayoutParams p=text.getLayoutParams();int reserved=p!=null&&p.width>0?p.width:0;
                int measured=Math.max(reserved,(int)Math.ceil(width)+text.getCompoundPaddingLeft()+text.getCompoundPaddingRight());
                // Match add(): glyph overhang, ink height and baseline affect packing,
                // while different strokes inside the same reserved bounds do not.
                out.append(":ink=").append(Math.min(0,ink.left)).append(',').append(ink.top).append(',')
                        .append(Math.max(measured,ink.right)).append(',').append(ink.bottom);
            }
        }
        void appendNativeEligibility(View view,StringBuilder out){
            if(capacityOverlay(view))return;
            out.append('|').append(System.identityHashCode(view));
            if(view.getClass().getSimpleName().equals("StatusIconContainer")){
                try{out.append(':').append(TargetReflection.field(view,"mIgnoredSlots"));}catch(ReflectiveOperationException ignored){}
            }
            if(view.getParent() instanceof View&&((View)view.getParent()).getClass().getSimpleName().equals("StatusIconContainer")){
                out.append(':').append(view.getVisibility());
                for(String method:new String[]{"getSlot","isIconVisible","isIconBlocked"})try{out.append(':').append(TargetReflection.call(view,method));}catch(ReflectiveOperationException ignored){}
            }
            if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)appendNativeEligibility(((ViewGroup)view).getChildAt(i),out);
        }
        String nativeCapacityShape(){StringBuilder out=new StringBuilder();appendNativeShape(root,out);return out.toString();}
        void appendNativeShape(View view,StringBuilder out){
            if(capacityOverlay(view))return;
            ViewGroup.LayoutParams p=view.getLayoutParams();
            out.append('|').append(System.identityHashCode(view)).append(':').append(view.getVisibility()).append(':').append(view.getMeasuredWidth()).append('x').append(view.getMeasuredHeight());
            out.append(':').append(view.getPaddingLeft()).append(',').append(view.getPaddingTop()).append(',').append(view.getPaddingRight()).append(',').append(view.getPaddingBottom());
            if(p instanceof ViewGroup.MarginLayoutParams){ViewGroup.MarginLayoutParams m=(ViewGroup.MarginLayoutParams)p;out.append(':').append(m.getMarginStart()).append(',').append(m.topMargin).append(',').append(m.getMarginEnd()).append(',').append(m.bottomMargin);}
            if(p instanceof FrameLayout.LayoutParams)out.append(':').append(((FrameLayout.LayoutParams)p).gravity);
            if(view instanceof ImageView){ImageView image=(ImageView)view;android.graphics.drawable.Drawable d=image.getDrawable();if(d!=null)out.append(':').append(d.getIntrinsicWidth()).append('x').append(d.getIntrinsicHeight()).append(':').append(d.getBounds());out.append(':').append(image.getImageMatrix());}
            if(view instanceof TextView){TextView text=(TextView)view;appendTextCapacity(text,out);android.text.Layout layout=text.getLayout();if(layout!=null){out.append(':').append(layout.getHeight());for(int i=0;i<layout.getLineCount();i++)out.append(',').append(layout.getLineWidth(i));}}
            if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)appendNativeShape(((ViewGroup)view).getChildAt(i),out);
        }
        void resetNativeIconCapacity(){nativeCapacityContainer=null;nativeCapacityOwner=null;}
        boolean syncNativeIconCapacity(){
            View container=findClass(root,"StatusIconContainer");
            boolean retryPass=packingCapacityBlock!=null&&!packingCapacityBlock.nativePassRequested;
            if(container==null){resetNativeIconCapacity();if(retryPass){packingCapacityBlock.nativePassRequested=true;root.requestLayout();}return true;}
            boolean owned=ownsIconLayout(container);
            if(nativeCapacityContainer==container&&nativeCapacityOwner!=null&&nativeCapacityOwner==owned&&!retryPass)return true;
            nativeCapacityContainer=container;nativeCapacityOwner=owned;
            if(retryPass)packingCapacityBlock.nativePassRequested=true;
            // Ownership changes must reach this child's OEM onLayout even if its
            // bounds did not change. Draw after that normal traversal, not before.
            container.requestLayout();return false;
        }
        void attach(){if(attached)return;attached=true;resetNativeIconCapacity();
            if(root.getLayoutParams()!=null)nativeHeight=root.getLayoutParams().height;
            root.getViewTreeObserver().addOnPreDrawListener(draw);
            root.getViewTreeObserver().addOnGlobalLayoutListener(nativeLayout);
            FeatureSettings.addSnapshotListener(context,snapshotListener);
            main.post(this::refresh);
        }
        void refresh(){if(!attached)return;
            // The background reader can publish between any two calls. Use one immutable
            // snapshot for both rendered values and the deduplication signature.
            ls.augment.com.ConfigSnapshot snapshot=FeatureSettings.snapshot(context);
            boolean enabled=ConfigSchema.truthy(snapshot.get(ConfigSchema.SYSTEMUI_MASTER));
            String raw=snapshot.get(ConfigSchema.STATUSBAR_GRID);
            StatusBarGridSpec parsed=StatusBarGridSpec.parse(raw);if(parsed==null)return;
            StringBuilder config=new StringBuilder().append(enabled);
            StringBuilder layoutConfig=new StringBuilder().append(enabled);
            StringBuilder structureConfig=new StringBuilder().append(enabled);
            for(String key:ConfigSchema.keys())if(key.startsWith("ls_augment_statusbar_")
                    ||key.startsWith("ls_augment_rm_battery_")){
                String value=snapshot.get(key);
                config.append('|').append(key).append('=').append(value);
                if(!colorOnlySetting(key)){
                    layoutConfig.append('|').append(key).append('=').append(value);
                    if(!iconStyleSetting(key))structureConfig.append('|').append(key).append('=').append(value);
                }
            }
            if(lastConfig.equals(config.toString()))return;
            lastConfig=config.toString();
            if(enabled&&active&&lastLayoutConfig.equals(layoutConfig.toString())){
                // Palette changes only affect drawing. Preserve the view, radio
                // callbacks, cached signal state and the running metrics worker.
                // onDraw reads the published palette; no restore/requestLayout.
                if(connectivityIcon!=null)connectivityIcon.invalidate();
                root.invalidate();
                String surface=isKeyguard(root)?"keyguard":"phone";
                FeatureSettings.diagnostic(context,"ls_augment_statusbar_"+surface+"_color_refresh",
                        "build="+ls.augment.com.BuildConfig.VERSION_CODE+";mode=redraw;icon="
                        +(connectivityIcon==null?"native":System.identityHashCode(connectivityIcon))
                        +";source="+(connectivityIcon==null?"native":System.identityHashCode(connectivityIcon.source)));
                return;
            }
            if(lastStructureConfig.equals(structureConfig.toString())&&(!enabled||active)){
                // Styles can change painted bounds and Bluetooth's width, but do
                // not replace the bar or its live connectivity source. Repack
                // existing views at pre-draw, without exposing the native layout.
                boolean changedBounds=!lastLayoutConfig.equals(layoutConfig.toString());
                lastLayoutConfig=layoutConfig.toString();
                if(!changedBounds)return;
                if(enabled&&active){
                    clearRejectedCapacity();layoutDirty=true;root.invalidate();
                }
                String surface=isKeyguard(root)?"keyguard":"phone";
                FeatureSettings.diagnostic(context,"ls_augment_statusbar_"+surface+"_icon_style_refresh",
                        "build="+ls.augment.com.BuildConfig.VERSION_CODE+";mode="+(enabled&&active?"repack":"native")
                        +";icon="+(connectivityIcon==null?"native":System.identityHashCode(connectivityIcon))
                        +";source="+(connectivityIcon==null?"native":System.identityHashCode(connectivityIcon.source))
                        +";bluetooth="+snapshot.get(ConfigSchema.STATUSBAR_BLUETOOTH_STYLE)
                        +";vpn="+snapshot.get(ConfigSchema.STATUSBAR_VPN_STYLE));
                return;
            }
            lastStructureConfig=structureConfig.toString();
            lastLayoutConfig=layoutConfig.toString();
            layoutDirty=true;
            restore(); spec=parsed;lastRaw=raw;active=enabled;
            StatusBarIconLayoutHook.gridModeChanged(root);
            if(!enabled){stopMetrics();
                // Recompute OEM content padding as well as the root height. Its
                // top inset may have been calculated during a previous layout.
                try{TargetReflection.call(root,"updateResources");}catch(Exception ignored){}
                applyHeight(0);SystemUiHook.refreshGridClock(root);
                FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_ACTIVE,"0");
                FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_LAYOUT_STATE,"grid_v2;restored_native=1");
                root.requestLayout(); return;}
            applyHeight(Integer.parseInt(snapshot.get(ConfigSchema.STATUSBAR_HEIGHT_DP)));
            SystemUiHook.refreshGridClock(root); startMetrics();root.requestLayout();root.invalidate();
        }

        // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
        //noinspection DiscouragedApi
        void applyHeight(int dp){ViewGroup.LayoutParams p=root.getLayoutParams();if(p==null)return;
            // A view inflated during an enabled boot/rotation can already have our
            // enlarged height. Query the unmodified dimension instead of restoring it.
            int original=StatusBarWindowSizingHook.nativeHeight(context);
            if(isKeyguard(root)){
                int resource=context.getResources().getIdentifier("status_bar_header_height_keyguard","dimen",context.getPackageName());
                original=resource!=0?context.getResources().getDimensionPixelSize(resource):nativeHeight>0?nativeHeight:original;
            }
            int target=ConfigSchema.statusBarHeightPx(original>0?original:nativeHeight,dp,context.getResources().getDisplayMetrics().density);
            if(target!=Integer.MIN_VALUE){
                if(!isKeyguard(root))try{
                    // OEM call/ongoing indicators also read this cached height.
                    // Changing only LayoutParams leaves their native geometry
                    // at the pre-adjustment status-bar height.
                    java.lang.reflect.Field height=root.getClass().getDeclaredField("mStatusBarHeight");
                    height.setAccessible(true);height.setInt(root,target);
                }catch(NoSuchFieldException ignored){}catch(IllegalAccessException error){
                    FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_LAST_ERROR,"grid_height_cache:"+error.getClass().getSimpleName());
                }
                if(p.height!=target){p.height=target;root.setLayoutParams(p);}
            }}
        int px(float dp){return Math.round(dp*context.getResources().getDisplayMetrics().density);}
        boolean positionOnly(){return FeatureSettings.enabled(context,ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY);}
        boolean connectivityGroup(){return !positionOnly()&&FeatureSettings.enabled(context,ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP);}
        boolean usingConnectivityIcon(){return circleTrial&&connectivityGroup()&&connectivityIcon!=null&&connectivityIcon.ready()&&connectivityIcon.usable();}
        // Readiness is a measurement input. Other hooks may cede native content
        // only after the replacement has a committed placement in this root.
        boolean connectivityPlaced(){Geometry g=geometry.get(connectivityIcon);return connectivityGroup()&&connectivityIcon!=null&&connectivityIcon.placed()&&g!=null&&g.applied;}
        boolean two(String id){return !positionOnly()&&FeatureSettings.enabled(context,id.equals("notifications")?ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS:ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS,true);}
        boolean itemEnabled(String id){return spec.get(id).visible;}
        int itemSize(String id){return spec.get(id).size;}
        boolean showItem(String id){return positionOnly()||itemEnabled(id) && (!id.equals("notifications")
                || !FeatureSettings.enabled(context,ConfigSchema.STATUSBAR_NOTIFICATION_HIDE));}
        void layout(){if(!active||applying||root.getWidth()==0||root.getHeight()==0)return;applying=true;
            try {
                if(holdRejectedCapacity())return;
                applyHeight(FeatureSettings.integer(context,ConfigSchema.STATUSBAR_HEIGHT_DP,0,ConfigSchema.STATUSBAR_HEIGHT_MIN_DP,ConfigSchema.STATUSBAR_HEIGHT_MAX_DP));
                layoutFrames++;
                circleTrial=false;circleNative.clear();
                for(Map.Entry<View,Geometry> e:geometry.entrySet())if(isDescendant(e.getKey(),root))e.getValue().observe(e.getKey());
                Map<String,View> views=new LinkedHashMap<>();contentBounds.clear();groups.clear();iconHeights.clear();nodeInsets.clear();
                if(connectivityGroup()&&connectivityIcon==null){connectivityIcon=new ConnectivityIconView(context);
                    root.addView(connectivityIcon,new ViewGroup.LayoutParams(px(26),px(26)));
                    connectivityIcon.onInvalidated(()->{layoutDirty=true;root.requestLayout();root.invalidate();});}
                View clock=keyguardClock!=null?keyguardClock:findView(root,"clock","status_bar_clock");
                // A legitimate retry measures the complete custom presentation,
                // never the shorter native text currently shown during fallback.
                // Freeze the exact rendered trial geometry, not a later time's
                // wanted text that has never been tested by this pack attempt.
                trialClockCapacity=clockCapacityInput(SystemUiHook.prepareGridClock(clock));
                View notifications=findClass(root,"NotificationIconContainer");
                View systems=findClass(root,"StatusIconContainer");
                if(systems==null)systems=findView(root,"statusIcons","status_icons");
                View battery=findView(root,"battery","battery_view");
                alphaAnchor=battery!=null?battery:systems;
                float regionAlpha=overlayAlpha(root,battery!=null?battery:systems);
                if(connectivityGroup()&&connectivityIcon!=null&&connectivityIcon.ready()){
                    circleTrial=true;
                    int diameter=px(FeatureSettings.integer(context,ConfigSchema.STATUSBAR_CONNECTIVITY_SIZE,26,18,40));
                    if(!connectivityIcon.prepare(diameter,root.getWidth(),root.getHeight())){
                        suspendPacking("三合一子图标边距未应用："+connectivityIcon.reason());return;
                    }
                }
                if(connectivityIcon!=null)connectivityIcon.setAlpha(connectivityPlaced()?regionAlpha:0);
                if(overlay!=null)overlay.setAlpha(regionAlpha);
                ArrayList<StatusBarGridLayout.Node> nodes=new ArrayList<>();
                if(!addClockRows(nodes,views,clock))add(nodes,views,"clock",clock);
                boolean notificationSummary=addNotificationSummary(nodes,views,notifications);
                if(positionOnly()){
                    applyNativeNetworkSize(systems);
                    if(!notificationSummary)addCompanion(nodes,views,"notifications","notifications",notifications,0,false);
                    addCompanion(nodes,views,"system_icons","system_icons",systems,0,false);
                    View vendor=findView(root,"red_magic_function_icon_container");
                    if(vendor!=null&&!isDescendant(vendor,systems))addCompanion(nodes,views,"system_icons.vendor","system_icons",vendor,1,false);
                }else{
                if(!notificationSummary)addGroup(nodes,views,"notifications",notifications);
                // RedMagic's fan/refresh-rate/cooling icons live outside StatusIconContainer.
                // Pack their native children alongside system icons so notifications cannot cover them.
                addGroup(nodes,views,"system_icons",systems,findView(root,"red_magic_function_icon_container"));
                }
                if(usingConnectivityIcon()){
                    if(clock instanceof TextView)connectivityIcon.tint(((TextView)clock).getCurrentTextColor());
                    addConnectivity(nodes,views,battery);
                }else add(nodes,views,"battery",battery);
                // These native indicators are siblings of the ordinary icon lists, not their children.
                // Keep compound chips intact (icon + text + click target) and reserve a complete box.
                addCompanion(nodes,views,"clock.operator","clock",findView(root,"operator_name_frame"),-10,false);
                addCompanion(nodes,views,"notifications.ongoing_primary","notifications",findView(root,"ongoing_activity_chip_primary"),-9,false);
                addCompanion(nodes,views,"notifications.ongoing_secondary","notifications",findView(root,"ongoing_activity_chip_secondary"),-8,false);
                View legacyCall=findView(root,"ongoing_call_chip");
                if(legacyCall!=null&&!isDescendant(legacyCall,views.get("notifications.ongoing_primary"))
                        &&!isDescendant(legacyCall,views.get("notifications.ongoing_secondary")))
                    addCompanion(nodes,views,"notifications.ongoing_call","notifications",legacyCall,-6,false);
                addCompanion(nodes,views,"notifications.heads_up","notifications",findView(root,"heads_up_status_bar_view"),-7,false);
                addCompanion(nodes,views,"notifications.join","notifications",findView(root,"ll_notification_icon_join"),-1,true);
                View userSwitcher=findView(root,"user_switcher_container"),avatar=findView(root,"multi_user_avatar");
                addCompanion(nodes,views,"system_icons.user","system_icons",userSwitcher,10,false);
                if(userSwitcher==null||!isDescendant(avatar,userSwitcher))addCompanion(nodes,views,"system_icons.avatar","system_icons",avatar,11,false);
                View carrier=findView(root,"keyguard_carrier_text");
                updateKeyguardCarrier(carrier);
                if(!replaceKeyguardCarrier())addCompanion(nodes,views,"clock.carrier","clock",carrier,-11,false);
                for(Map.Entry<String,TextView> e:metrics.entrySet()){
                    if(clock instanceof TextView)e.getValue().setTextColor(((TextView)clock).getTextColors());
                    add(nodes,views,e.getKey(),e.getValue());
                }
                if(keyguardClock!=null){
                    if(carrier instanceof TextView)keyguardClock.setTextColor(((TextView)carrier).getTextColors());}
                float cutLeft=0,cutRight=0;
                WindowInsets insets=root.getRootWindowInsets();
                if(insets!=null&&insets.getDisplayCutout()!=null){int[] rp=new int[2];root.getLocationOnScreen(rp);
                    for(Rect r:insets.getDisplayCutout().getBoundingRects())if(r.top<rp[1]+root.getHeight()&&r.bottom>rp[1]){cutLeft=r.left-rp[0]-px(2);cutRight=r.right-rp[0]+px(2);}}
                float insetLeft=px(4+FeatureSettings.integer(context,ConfigSchema.STATUSBAR_LEFT_MARGIN_DP,0,0,40)),
                        insetRight=px(4+FeatureSettings.integer(context,ConfigSchema.STATUSBAR_RIGHT_MARGIN_DP,0,0,40)),
                        insetTop=px(FeatureSettings.integer(context,ConfigSchema.STATUSBAR_TOP_MARGIN_DP,0,0,12)),
                        insetBottom=px(FeatureSettings.integer(context,ConfigSchema.STATUSBAR_BOTTOM_MARGIN_DP,0,0,12)),
                        rowGap=px(FeatureSettings.integer(context,ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP,0,-8,64));
                if(carrier instanceof TextView&&CarrierTextHook.ownsLockText(carrier)){
                    StatusBarGridLayout.Node carrierNode=null;for(StatusBarGridLayout.Node node:nodes)if(node.id.equals("clock.carrier")){carrierNode=node;break;}
                    if(carrierNode==null&&!((TextView)carrier).getText().toString().trim().isEmpty()){
                        CarrierTextHook.gridResult(carrier,"native_fallback:no_readable_glyph_space");suspendPacking("锁屏运营商文字没有足够的可用空间");return;
                    }
                    if(carrierNode!=null){
                        TextView text=(TextView)carrier;String value=text.getText().toString().trim();
                        String first=value.isEmpty()?"":value.substring(0,Character.charCount(value.codePointAt(0)));
                        int minimum=(int)Math.ceil(text.getPaint().measureText(first+"…"));
                        int width=CarrierTextHook.fitGridWidth(nodes,carrierNode,minimum,root.getWidth(),root.getHeight(),insetLeft,insetRight,insetTop,insetBottom,rowGap,cutLeft,cutRight);
                        if(width<0){CarrierTextHook.gridResult(text,"native_fallback:space_insufficient;ink="+carrierNode.width+"x"+carrierNode.height+";header="+root.getWidth()+"x"+root.getHeight()+";text_px="+text.getTextSize());suspendPacking("锁屏运营商文字按当前字号放不下，请缩短文字、调整位置或增加状态栏高度");return;}
                        // Re-measure only the final budget. Measuring full width,
                        // shrinking, then expanding next pre-draw would invalidate
                        // the view on every frame even with unchanged settings.
                        nodes.remove(carrierNode);addIndependentCarrier(nodes,views,text,spec.get("clock"),-11,width+text.getTotalPaddingLeft()+text.getTotalPaddingRight());
                    }
                }
                if(!wifiAssetBudgets(nodes,insetLeft,insetRight,insetTop,insetBottom,rowGap,cutLeft,cutRight)){
                    suspendPacking("Wi-Fi 素材与所设边距超过当前完整排列空间，保留原厂显示");return;
                }
                stackedSignalBudgets(nodes,views,insetLeft,insetRight,insetTop,insetBottom,rowGap,cutLeft,cutRight);
                StatusBarAdaptiveLayout.Result packed=StatusBarAdaptiveLayout.pack(nodes,root.getWidth(),root.getHeight(),insetLeft,insetRight,insetTop,insetBottom,rowGap,cutLeft,cutRight);
                if(usingConnectivityIcon())circleBudget(nodes,insetLeft,insetRight,insetTop,insetBottom,rowGap,cutLeft,cutRight);
                if(!packed.valid){suspendPacking(packed.reason);return;}
                Map<String,StatusBarGridLayout.Box> boxes=packed.boxes;
                if(!circleFits(packed)){suspendPacking("三合一子图标与边距超过完整排列空间，保留原厂显示");return;}
                if(!stackedSignalsFit(views,packed)){suspendPacking("双排信号与子图标边距超过当前排列空间，保留原厂显示");return;}
                if(carrier instanceof TextView&&CarrierTextHook.ownsLockText(carrier)){
                    StatusBarGridLayout.Box box=boxes.get("clock.carrier");
                    if(box!=null&&box.scale<.9999f){CarrierTextHook.gridResult(carrier,"native_fallback:height_insufficient");suspendPacking("锁屏运营商字号超过当前状态栏高度");return;}
                    if(box!=null)CarrierTextHook.gridResult(carrier,"independent_font;scale=1;text_px="+((TextView)carrier).getTextSize()+";box="+box.width+"x"+box.height);
                }
                for(Map.Entry<String,StatusBarGridLayout.Box> e:boxes.entrySet())place(e.getKey(),views.get(e.getKey()),e.getValue());
                commitCircle(regionAlpha);
                publishCirclePlacement(regionAlpha);
                resumePacking();
                StatusBarTintHook.refresh(root);
                long now=SystemClock.elapsedRealtime();
                if(lastWitness==0||now-lastWitness>5000){lastWitness=now;
                    layoutFailed=false;
                    String errorKey="ls_augment_statusbar_"+(isKeyguard(root)?"keyguard":"phone")+"_last_error";
                    FeatureSettings.diagnostic(context,errorKey,"");
                    String previousError=FeatureSettings.diagnosticValue(context,FeatureSettings.SYSTEMUI_LAST_ERROR);
                    if(previousError.startsWith("grid_layout:")&&STATES.values().stream().noneMatch(s->s.layoutFailed))
                        FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_LAST_ERROR,"");
                    FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_ACTIVE,"1");
                    String surface=isKeyguard(root)?"keyguard":"phone";
                    String evidence="grid_v2;build="+ls.augment.com.BuildConfig.VERSION_CODE+";surface="+surface+";patch=20260908r1;frames="+layoutFrames+";position_writes="+positionWrites+";clock="+(clock!=null)+";notifications="+(notifications!=null)+";system_icons="+(systems!=null)+";carrier_replaced="+replaceKeyguardCarrier()+";items="+boxes.size()+";size="+root.getWidth()+"x"+root.getHeight();
                    FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_LAYOUT_STATE,evidence);
                    FeatureSettings.diagnostic(context,"ls_augment_statusbar_"+surface+"_layout_state",evidence);
                    if(connectivityIcon!=null)FeatureSettings.diagnostic(context,"ls_augment_statusbar_connectivity_"+surface,
                            "circle;ready="+connectivityIcon.ready()+";alpha="+connectivityIcon.getAlpha()+";"+connectivityIcon.sourceState().description()+";error="+connectivityIcon.source.error);
                    StringBuilder detail=new StringBuilder();
                    for(int row=0;row<2;row++){String id="clock#"+row;StatusBarGridLayout.Box b=boxes.get(id);TextView line=clockLines[row];
                        if(b!=null&&line!=null){Rect ink=contentBounds.get(line);detail.append(id).append("=baseline:").append(b.y+(line.getBaseline()-ink.top)*line.getScaleY()).append("@").append(b.x).append(',').append(b.y).append(';');}}
                    if(clock instanceof TextView){StatusBarGridLayout.Box box=boxes.get("clock");
                        int[] cp=new int[2];clock.getLocationOnScreen(cp);TextView ct=(TextView)clock;
                        detail.append("clockText=").append(((TextView)clock).getText()).append("/alpha=").append(clock.getAlpha()).append("/view=").append(clock.getWidth()).append('x').append(clock.getHeight());
                        detail.append("/at=").append(cp[0]).append(',').append(cp[1]).append("/baseline=").append(ct.getBaseline()).append("/scroll=").append(ct.getScrollX()).append(',').append(ct.getScrollY()).append("/padding=").append(ct.getTotalPaddingTop()).append(',').append(ct.getTotalPaddingBottom()).append("/layout=").append(ct.getLayout()==null?"null":ct.getLayout().getHeight()).append("/shown=").append(ct.isShown());
                        if(box!=null)detail.append("/box=").append(box.x).append(',').append(box.y).append(',').append(box.width).append(',').append(box.height);
                        detail.append(';');}
                    StatusBarGridLayout.Box notificationTop=boxes.get("notifications#0"),notificationBottom=boxes.get("notifications#1");
                    if(notificationTop!=null&&notificationBottom!=null)detail.append("notifications_x=").append(notificationTop.x).append(',').append(notificationBottom.x).append(';');
                    for(Map.Entry<String,TextView> metric:metrics.entrySet()){
                        StatusBarGridLayout.Box box=boxes.get(metric.getKey());if(box==null)continue;
                        int[] point=new int[2];metric.getValue().getLocationInWindow(point);
                        detail.append(metric.getKey()).append('=').append(metric.getValue().getText()).append('@').append(point[0]).append(',').append(point[1])
                                .append('/').append(Math.round(box.width)).append('x').append(Math.round(box.height));
                        Rect ink=contentBounds.get(metric.getValue());if(ink!=null)detail.append("/baseline:").append(box.y+(metric.getValue().getBaseline()-ink.top)*metric.getValue().getScaleY());detail.append(';');
                    }
                    if(battery!=null){detail.append("battery=").append(battery.getClass().getSimpleName()).append('/').append(battery.getWidth()).append('x').append(battery.getHeight()).append('/').append(contentBounds.get(battery));
                        if(battery instanceof ViewGroup)for(int i=0;i<((ViewGroup)battery).getChildCount();i++){View child=((ViewGroup)battery).getChildAt(i);detail.append('/').append(name(child)).append(':').append(child.getWidth()).append('x').append(child.getHeight());}}
                    FeatureSettings.diagnostic(context,"ls_augment_statusbar_metrics_state",detail.toString());
                    // Hidden keyguard and phone roots can both relayout. Retain
                    // separate witnesses so a hidden empty root cannot erase
                    // the visible surface's metrics during diagnostics.
                    FeatureSettings.diagnostic(context,"ls_augment_statusbar_"+surface+"_metrics_state",detail.toString());
                    StringBuilder rows=new StringBuilder();
                    for(Map.Entry<String,StatusBarGridLayout.Box> e:boxes.entrySet()){
                        StatusBarGridLayout.Box b=e.getValue();rows.append(e.getKey()).append('@').append(b.y).append('+').append(b.height).append(';');
                    }
                    FeatureSettings.diagnostic(context,"ls_augment_statusbar_rows_state",rows.toString());
                    StringBuilder icons=new StringBuilder();for(Map.Entry<String,List<View>> group:groups.entrySet()){
                        if(!group.getKey().startsWith("system_icons"))continue;
                        icons.append(group.getKey()).append('=');for(View child:group.getValue())icons.append(name(child).isEmpty()?SystemUiHook.slotOf(child):name(child)).append(',');icons.append(';');}
                    FeatureSettings.diagnostic(context,"ls_augment_statusbar_system_items",icons.toString());
                    StringBuilder edges=new StringBuilder("grid;surface=").append(surface).append(";rtl=").append(root.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL);
                    Set<View> spaced=Collections.newSetFromMap(new IdentityHashMap<>());for(List<View> group:groups.values())spaced.addAll(group);for(String id:nodeInsets.keySet()){View item=views.get(id);if(item!=null)spaced.add(item);}
                    for(View item:spaced){ls.augment.com.StatusBarIconSpacingSpec.Insets edge=StatusBarIconLayoutHook.insets(item);if(!edge.isZero())edges.append(';').append(StatusBarIconLayoutHook.semanticId(item)).append('=').append(edge.start).append(',').append(edge.top).append(',').append(edge.end).append(',').append(edge.bottom);}
                    FeatureSettings.diagnostic(context,"ls_augment_statusbar_"+surface+"_icon_spacing_runtime",edges.toString());
                    StringBuilder visibility=new StringBuilder();
                    appendVisibility(visibility,"clock",clock);
                    appendVisibility(visibility,"wifi",findView(root,"wifi_combo"));
                    View vendor=findView(root,"red_magic_function_icon_container");
                    appendVisibility(visibility,"cooling",vendor);
                    if(vendor instanceof ViewGroup)for(int i=0;i<Math.min(6,((ViewGroup)vendor).getChildCount());i++)
                        appendVisibility(visibility,"cooling#"+i,((ViewGroup)vendor).getChildAt(i));
                    FeatureSettings.diagnostic(context,"ls_augment_statusbar_"+surface+"_visibility_state",
                            "build="+ls.augment.com.BuildConfig.VERSION_CODE+";time="+System.currentTimeMillis()
                                    +";clipFix="+explicitClips.summary()+";"+visibility);
                    StringBuilder notificationVisibility=new StringBuilder("build=").append(ls.augment.com.BuildConfig.VERSION_CODE)
                            .append(";time=").append(System.currentTimeMillis()).append(";clipFix=").append(explicitClips.summary()).append(';');
                    appendNotificationVisibility(notificationVisibility,notifications);
                    FeatureSettings.diagnostic(context,"ls_augment_statusbar_"+surface+"_notifications_visibility_state",notificationVisibility.toString());}
            }catch(Throwable e){failLayout(e);}
            finally{applying=false;}
        }
        void failLayout(Throwable error){
            // Remove replacement content before restoring native alpha/transforms. Restoring
            // the overlay's children in place would pile every label at its original (0,0).
            // Stopping the worker also invalidates samples already queued on the main thread.
            active=false;layoutFailed=true;stopMetrics();restore();
            String surface=isKeyguard(root)?"keyguard":"phone";
            String evidence="grid_v2;build="+ls.augment.com.BuildConfig.VERSION_CODE+";surface="+surface
                    +";fallback_native=1;size="+root.getWidth()+"x"+root.getHeight();
            FeatureSettings.diagnosticError(context,"ls_augment_statusbar_"+surface+"_last_error","grid_layout",error);
            FeatureSettings.diagnosticError(context,FeatureSettings.SYSTEMUI_LAST_ERROR,"grid_layout",error);
            FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_ACTIVE,"0");
            FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_LAYOUT_STATE,evidence);
            FeatureSettings.diagnostic(context,"ls_augment_statusbar_"+surface+"_layout_state",evidence);
        }
        /** Temporary crowding is recoverable on the next system state/size change. */
        void suspendPacking(String reason){
            StatusBarWifiAssetSpacingHook.gridRejected(root);
            packingSuspended=true;
            restorePlacement();
            SystemUiHook.suspendGridClock(root);
            RedMagicSystemUiHook.stackedGridRejected(root);
            if(overlay!=null)overlay.setAlpha(0);
            if(connectivityIcon!=null){connectivityIcon.uncommit();connectivityIcon.setAlpha(0);
                String circleReason=connectivityIcon.reason();connectivityIcon.publish(circleReason.equals("ok")||circleReason.equals("legacy_zero")||circleReason.equals("whole_covered")?"capacity":circleReason.startsWith("unmeasured")?"awaiting_layout":circleReason,0,0);}
            // Capture the single rejection input only after all replacement
            // ownership and native placement have been restored.
            if(packingCapacityBlock==null)packingCapacityBlock=new PackingCapacityBlock();
            trialClockCapacity=null;
            if(!reason.equals(packingIssue)){
                packingIssue=reason;
                String surface=isKeyguard(root)?"keyguard":"phone";
                FeatureSettings.diagnostic(context,"ls_augment_statusbar_"+surface+"_last_error",reason);
                String evidence="components;surface="+surface+";fallback_native=1;reason="+reason;
                FeatureSettings.diagnostic(context,"ls_augment_statusbar_"+surface+"_layout_state",evidence);
                FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_LAYOUT_STATE,evidence);
                FeatureSettings.diagnostic(context,FeatureSettings.SYSTEMUI_ACTIVE,"0");
            }
        }
        void resumePacking(){trialClockCapacity=null;clearRejectedCapacity();if(packingSuspended){packingSuspended=false;packingIssue="";lastWitness=0;}
            // beforeDraw synchronized alpha while this candidate was still
            // suspended; expose it only after every placement has committed.
            syncOverlayAlpha();}
        Geometry own(View view){Geometry g=geometry.get(view);if(g==null){
            // OEM reparents icons between keyguard and the unlocked bar. Transfer
            // ownership before capturing, otherwise the previous grid becomes the baseline.
            for(State other:STATES.values())if(other!=this){Geometry old=other.geometry.remove(view);if(old!=null)old.restore(view);}
            g=new Geometry(view);geometry.put(view,g);}return g;}
        void appendVisibility(StringBuilder out,String label,View view){
            out.append(label).append('=');
            if(view==null){out.append("missing;");return;}
            Rect visible=new Rect();boolean shown=view.getGlobalVisibleRect(visible);
            out.append(shown).append('/').append(visible);
            for(View current=view;current!=null;){
                out.append('|').append(name(current)).append(':').append(current.getWidth()).append('x').append(current.getHeight())
                        .append(",v=").append(current.getVisibility()).append(",a=").append(current.getAlpha())
                        .append(",ta=").append(current.getTransitionAlpha()).append(",layer=").append(current.getLayerType())
                        .append(",clip=").append(current.getClipBounds()).append(",outline=").append(current.getClipToOutline());
                if(current instanceof ViewGroup)out.append(",childrenClip=").append(((ViewGroup)current).getClipChildren())
                        .append(",paddingClip=").append(((ViewGroup)current).getClipToPadding());
                if(current==root)break;
                current=current.getParent() instanceof View?(View)current.getParent():null;
            }
            out.append(';');
        }
        void appendNotificationVisibility(StringBuilder out,View view){
            appendVisibility(out,"notifications",view);
            if(!(view instanceof ViewGroup))return;
            ViewGroup container=(ViewGroup)view;
            Object states=SystemUiAdapter.field(container,"mIconStates");
            out.append("children=").append(container.getChildCount()).append(";sampled=").append(Math.min(6,container.getChildCount())).append(';');
            for(int i=0;i<Math.min(6,container.getChildCount());i++){
                View child=container.getChildAt(i);appendVisibility(out,"notification#"+i,child);
                Object nativeState=states instanceof Map?((Map<?,?>)states).get(child):null;
                out.append("native#").append(i).append("/hidden=").append(SystemUiAdapter.field(nativeState,"hidden"));
                try{out.append("/visibleState=").append(SystemUiAdapter.callIfPresent(child,"getVisibleState"))
                        .append("/iconVisible=").append(SystemUiAdapter.callIfPresent(child,"isIconVisible"))
                        .append("/blocked=").append(SystemUiAdapter.callIfPresent(child,"isIconBlocked"));
                }catch(ReflectiveOperationException unavailable){out.append("/read=unavailable");}
                out.append(';');
            }
        }
        boolean replaceKeyguardCarrier(){return isKeyguard(root)&&!positionOnly()&&keyguardClock!=null&&!FeatureSettings.enabled(context,ls.augment.com.CarrierTextOptions.key("lock","enabled"));}
        void updateKeyguardCarrier(View carrier){
            if(carrier==null)return;
            // The injected clock replaces the OEM carrier in the configured clock slot.
            // An extra, unconfigured carrier must not push the clock/metrics to the right,
            // including when the user hides the clock. Geometry restores native alpha
            // when the grid is disabled, detached, or falls back after a layout failure.
            Geometry original=own(carrier);
            carrier.setAlpha(replaceKeyguardCarrier()?0:original.alpha);original.mark(carrier);
        }
        boolean splitClock(){return !positionOnly()&&FeatureSettings.enabled(context,ConfigSchema.STATUSBAR_CLOCK_CUSTOM)
                &&FeatureSettings.integer(context,ConfigSchema.STATUSBAR_CLOCK_ROWS,2,1,2)==2;}
        boolean addClockRows(List<StatusBarGridLayout.Node> nodes,Map<String,View> views,View source){
            if(!splitClock()||overlay==null||!(source instanceof TextView))return false;
            TextView clock=(TextView)source;Geometry original=own(clock);clock.setAlpha(0);original.mark(clock);
            String[] lines=clock.getText().toString().split("\n",-1);
            int width=px(FeatureSettings.integer(context,ConfigSchema.STATUSBAR_CLOCK_WIDTH_DP,0,0,240));
            for(String line:lines)width=Math.max(width,(int)Math.ceil(android.text.Layout.getDesiredWidth(line,clock.getPaint())));
            for(int row=0;row<2;row++){
                TextView line=clockLines[row];if(line==null){line=new TextView(context);line.setTag("ls_augment_clock_line");line.setIncludeFontPadding(false);line.setSingleLine(true);line.setEllipsize(null);
                    overlay.addView(line,new FrameLayout.LayoutParams(-2,-2));clockLines[row]=line;}
                String value=row<lines.length?lines[row]:"";
                if(!value.contentEquals(line.getText()))line.setText(value);
                if(line.getTypeface()!=clock.getTypeface())line.setTypeface(clock.getTypeface());
                if(line.getTextSize()!=clock.getTextSize())line.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX,clock.getTextSize());
                if(line.getLetterSpacing()!=clock.getLetterSpacing())line.setLetterSpacing(clock.getLetterSpacing());
                if(line.getGravity()!=clock.getGravity())line.setGravity(clock.getGravity());
                if(line.getMinWidth()!=width)line.setMinWidth(width);
                if(line.getCurrentTextColor()!=clock.getCurrentTextColor())line.setTextColor(clock.getTextColors());
                boolean visible=visibleInRoot(clock)&&showItem("clock")&&!value.isEmpty();line.setVisibility(visible?View.VISIBLE:View.GONE);
                if(visible){add(nodes,views,"clock#"+row,line);line.setAlpha(original.alpha*overlayAlpha(root,clock));own(line).mark(line);}
            }
            return true;
        }
        void add(List<StatusBarGridLayout.Node> nodes,Map<String,View> views,String id,View view){
            StatusBarGridSpec.Item item=spec.get(baseId(id));if(view==null||item==null||!visibleInRoot(view))return;
            if(id.equals("battery")&&!positionOnly()&&!connectivityGroup()
                    &&!FeatureSettings.enabled(context,ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED,true))item=StatusBarGridSpec.DEFAULT_BATTERY;
            Geometry state=own(view);if(!positionOnly()&&!item.visible){view.setAlpha(0);state.mark(view);return;}view.setAlpha(state.alpha);
            if(view instanceof TextView&&(metrics.containsKey(id)||baseId(id).equals("clock"))){
                TextView text=(TextView)view;
                // setMaxLines requests layout even when unchanged. Styling inside
                // OnPreDraw was scheduling another layout on every rendered frame.
                if(id.equals("clock")||text.isLayoutRequested()||text.getWidth()==0||text.getHeight()==0){
                    if(id.equals("clock"))state.beginMeasuredLayout(text);
                    try{
                    // The OEM clock is measured inside its original single-row
                    // parent. Measure the full custom text before grid scaling,
                    // otherwise extra line spacing clips the second row.
                    ViewGroup.LayoutParams params=text.getLayoutParams();
                    int fixedWidth=params==null?0:params.width;
                    // Treat a requested width as reserved space, never as a crop
                    // of the hour when an app changes the OEM clock allocation.
                    text.measure(View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
                    if(fixedWidth>text.getMeasuredWidth())text.measure(View.MeasureSpec.makeMeasureSpec(fixedWidth,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
                    // onPreDraw follows the parent's layout pass, so the clock
                    // can already report no pending layout despite being clipped.
                    // Repeated measure calls with identical specs are cached by View.
                    if(text.isLayoutRequested()||text.getWidth()!=text.getMeasuredWidth()||text.getHeight()!=text.getMeasuredHeight()){
                        text.layout(0,0,text.getMeasuredWidth(),text.getMeasuredHeight());
                        // This correction runs after the native layout pass.
                        // Refresh its display list as well: otherwise switching
                        // from two lines can leave a clipped clock until its next tick.
                        text.invalidate();
                    }
                    if(id.equals("clock"))text.scrollTo(0,0);
                    }finally{if(id.equals("clock"))state.endMeasuredLayout(text);}
                }
            }
            float h=view.getHeight(),w=view.getWidth();if(h<=0||w<=0)return;
            float baseline=-1;
            if(!positionOnly()&&view instanceof TextView&&(metrics.containsKey(id)||baseId(id).equals("clock"))){
                TextView text=(TextView)view;String value=text.getText().toString();
                if(!value.isEmpty()&&!value.contains("\n")){
                    Rect ink=new Rect();text.getPaint().getTextBounds(value,0,value.length(),ink);
                    if(!ink.isEmpty()){ink.set(Math.min(0,ink.left),text.getBaseline()+ink.top,Math.max(view.getWidth(),ink.right),text.getBaseline()+ink.bottom);
                        contentBounds.put(view,ink);w=ink.width();h=ink.height();baseline=text.getBaseline()-ink.top;}
                }
            }
            if(id.equals("battery")&&view instanceof ViewGroup){Rect bounds=new Rect(batteryBounds(view));
                if(!bounds.isEmpty()){contentBounds.put(view,bounds);h=bounds.height();w=bounds.width();}}
            float scale=px(item.size)/h;
            if(view instanceof TextView){TextView t=(TextView)view;
                float targetSize=px(item.size);
                if(baseId(id).equals("clock")&&!positionOnly()&&FeatureSettings.enabled(context,FeatureSettings.STATUSBAR_CLOCK_CUSTOM)){
                    float customSize=FeatureSettings.decimal(context,FeatureSettings.STATUSBAR_CLOCK_SIZE_SP,0,0,40);
                    if(customSize>0)targetSize=android.util.TypedValue.applyDimension(android.util.TypedValue.COMPLEX_UNIT_SP,
                            customSize,context.getResources().getDisplayMetrics());
                }
                float lineHeight=t.getTextSize();if(lineHeight>0)scale=targetSize/lineHeight;
            }
            if(id.equals("battery")&&contentBounds.containsKey(view)){
                int fixed=!positionOnly()&&FeatureSettings.enabled(context,ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED,true)
                        ?FeatureSettings.integer(context,"ls_augment_rm_battery_width_dp",0,0,120):0;
                if(fixed>0){
                    float reserved=px(fixed);scale=Math.min(scale,reserved/w);
                    Rect bounds=contentBounds.get(view);
                    bounds.right=bounds.left+(int)Math.ceil(reserved/scale);
                    w=bounds.width();
                }
            }
            String zone=positionOnly()?item.zone.substring(0,1)+"S":id.contains("#")?item.zone.substring(0,1)+(id.endsWith("#0")?"1":"2"):item.zone;
            // A multiline native clock is one view. Reserve both rows just as
            // the editor does, even when an old layout stores a single-row zone.
            if(id.equals("clock")&&!positionOnly()&&FeatureSettings.integer(context,ConfigSchema.STATUSBAR_CLOCK_ROWS,2,1,2)==2)
                zone=item.zone.substring(0,1)+"S";
            addInsetNode(nodes,id,zone,item.order*100,w*scale,h*scale,baseline<0?-1:baseline*scale,view);views.put(id,view);
        }
        boolean addNotificationSummary(List<StatusBarGridLayout.Node> nodes,Map<String,View> views,View parent){
            if(!(parent instanceof ViewGroup)||!visibleInRoot(parent))return false;
            int[] size=StatusBarNotificationSummaryHook.measure((ViewGroup)parent);
            if(size==null||size.length<2||size[0]<=0||size[1]<=0)return false;
            Geometry nativeGeometry=own(parent);if(!showItem("notifications")){parent.setAlpha(0);nativeGeometry.mark(parent);return true;}
            parent.setAlpha(nativeGeometry.alpha);if(nativeGeometry.alpha==0)return true;
            StatusBarGridSpec.Item item=spec.get("notifications");String id="notifications.summary";
            // The renderer supplies the exact local drawing rectangle from (0,0).
            // Keep the original container and callbacks; pack one measured summary.
            contentBounds.put(parent,new Rect(0,0,size[0],size[1]));
            addInsetNode(nodes,id,item.zone,item.order*100,size[0],size[1],-1,parent);views.put(id,parent);return true;
        }
        void addGroup(List<StatusBarGridLayout.Node> nodes,Map<String,View> views,String id,View parent,View... additionalParents){
            ArrayList<ViewGroup> sources=new ArrayList<>();
            if(parent instanceof ViewGroup&&visibleInRoot(parent))sources.add((ViewGroup)parent);
            for(View extra:additionalParents)if(extra instanceof ViewGroup&&visibleInRoot(extra)&&extra!=parent){
                // Some ROMs nest the vendor container inside statusIcons. Its
                // descendants must not be moved once as a group and again individually.
                boolean covered=false;
                for(ViewGroup source:sources)if(isDescendant(extra,source))covered=true;
                if(!covered)sources.add((ViewGroup)extra);
            }
            if(sources.isEmpty())return;
            if(parent==null)parent=sources.get(0);
            StatusBarGridSpec.Item item=spec.get(id);int n=0;
            Set<View> retainedHints=null;
            if(id.equals("system_icons")&&FeatureSettings.enabled(context,ls.augment.com.StatusBarIconOrderPolicy.ENABLED)){
                List<View> candidates=new ArrayList<>();
                for(ViewGroup source:sources)for(int i=0;i<source.getChildCount();i++){
                    View child=source.getChildAt(i);
                    if(child.getVisibility()==View.VISIBLE&&!StatusBarAssetsHook.hiddenByPolicy(child)
                            &&!StatusBarAssetsHook.isHidden(child,StatusBarIconLayoutHook.semanticId(child))
                            &&(!source.getClass().getSimpleName().equals("StatusIconContainer")||StatusBarIconLayoutHook.eligible(source,child))
                            &&own(child).alpha>0&&!iconBounds(child).isEmpty())candidates.add(child);
                }
                retainedHints=Collections.newSetFromMap(new IdentityHashMap<>());
                retainedHints.addAll(ls.augment.com.StatusBarIconOrderPolicy.retain(candidates,StatusBarIconLayoutHook::semanticId,
                        FeatureSettings.snapshot(context).get(ls.augment.com.StatusBarIconOrderPolicy.ORDER),
                        FeatureSettings.integer(context,ls.augment.com.StatusBarIconOrderPolicy.LIMIT,0,0,20)));
            }
            int max=id.equals("notifications")&&!FeatureSettings.enabled(context,ConfigSchema.STATUSBAR_NOTIFICATION_UNLIMITED)
                    ?FeatureSettings.integer(context,ConfigSchema.STATUSBAR_NOTIFICATION_MAX,0,0,20):0;
            float size=px(item.size), width=0;ArrayList<View> children=new ArrayList<>();
            for(ViewGroup group:sources)for(int i=0;i<group.getChildCount();i++){
                View child=group.getChildAt(i);if(child.getVisibility()!=View.VISIBLE||StatusBarAssetsHook.hiddenByPolicy(child))continue;
                if(id.equals("system_icons")&&usingConnectivityIcon()&&isConnectivity(child)){
                    // A native dual-SIM adapter may still own a zero-width second
                    // slot until it sees this frame's successful replacement.
                    // Hide it now so releasing that adapter cannot expose it.
                    circleNative.add(child);continue;
                }
                // Native hidden icons can retain alpha and drawable bounds after a rebuild.
                // Match the priority pass's semantic eligibility without affecting vendor containers.
                if(id.equals("system_icons")&&group.getClass().getSimpleName().equals("StatusIconContainer")
                        &&!StatusBarIconLayoutHook.eligible(group,child))continue;
                if(child.getHeight()==0||child.getWidth()==0||RedMagicSystemUiHook.isCollapsedSignal(child))continue;
                Geometry g=own(child);
                if(retainedHints!=null&&!retainedHints.contains(child)){child.setAlpha(0);g.mark(child);continue;}
                if (spec.get("network").visible && isNativeNetwork(child)) {
                    child.setAlpha(0); g.mark(child); continue;
                }
                // A native dot/hidden state must not be turned back into an icon.
                if(g.alpha==0)continue;
                child.setAlpha(g.alpha);
                float wifiReference=StatusBarContentBounds.wifiSignalHeight(child);
                if(wifiReference>0)StatusBarWifiAssetSpacingHook.prepareGrid(child,size/wifiReference);
                float signalReference=RedMagicSystemUiHook.stackedSignalRowHeight(child);
                if(signalReference>0)RedMagicSystemUiHook.prepareStackedGrid(child,size/signalReference);
                Rect ink=iconBounds(child);if(ink.isEmpty())continue;contentBounds.put(child,ink);n++;
                if(!showItem(id)||(max>0&&n>max)){child.setAlpha(0);g.mark(child);continue;}
                float height=desiredIconHeight(child,size);iconHeights.put(child,height);
                if(addStackedSignalNode(nodes,views,id,item,child,n,height))continue;
                children.add(child);
            }
            boolean rows=two(id);
            for(int row=0;row<(rows?2:1);row++){
                ArrayList<View> members=new ArrayList<>();width=0;float rowHeight=0;
                for(int i=row;i<children.size();i+=rows?2:1){View child=children.get(i);members.add(child);Rect bounds=contentBounds.get(child);float height=iconHeights.get(child);ls.augment.com.StatusBarIconSpacingSpec.Insets edge=StatusBarIconLayoutHook.insets(child);width+=bounds.width()*height/bounds.height()+spacingPx(edge.horizontal())+px(1);rowHeight=Math.max(rowHeight,height+spacingPx(edge.vertical()));}
                if(members.isEmpty())continue;
                String part=rows?id+"#"+row:id;
                String zone=rows?item.zone.substring(0,1)+(row+1):item.zone;
                nodes.add(new StatusBarGridLayout.Node(part,zone,item.order*100,Math.max(1,width-px(1)),rowHeight));
                views.put(part,parent);groups.put(part,members);
            }
        }
        boolean addStackedSignalNode(List<StatusBarGridLayout.Node> nodes,Map<String,View> views,String id,StatusBarGridSpec.Item item,View child,int index,float height){
            if(RedMagicSystemUiHook.stackedSignalBounds(child)==null)return false;
            String part=id+".dual"+index;Rect bounds=contentBounds.get(child);
            addInsetNode(nodes,part,item.zone.substring(0,1)+"S",item.order*100+index,bounds.width()*height/bounds.height(),height,-1,child);
            views.put(part,child);return true;
        }
        boolean stackedSignalsFit(Map<String,View> views,StatusBarAdaptiveLayout.Result packed){
            for(Map.Entry<String,View> entry:views.entrySet())if(RedMagicSystemUiHook.spacedStack(entry.getValue())){
                StatusBarGridLayout.Box box=packed.boxes.get(entry.getKey());
                if(box==null||box.scale<.9999f)return false;
            }
            return true;
        }
        void stackedSignalBudgets(List<StatusBarGridLayout.Node> nodes,Map<String,View> views,float left,float right,float top,float bottom,float gap,float cutLeft,float cutRight){
            long shape=root.getWidth()*31L+root.getHeight();for(float edge:new float[]{left,right,top,bottom,gap,cutLeft,cutRight})shape=shape*31+Float.floatToIntBits(edge);
            for(StatusBarGridLayout.Node n:nodes){shape=shape*31+n.id.hashCode();shape=shape*31+n.zone.hashCode();shape=shape*31+n.order;shape=shape*31+Float.floatToIntBits(n.width);shape=shape*31+Float.floatToIntBits(n.height);}
            for(StatusBarGridLayout.Node node:nodes){View child=views.get(node.id);if(child==null||RedMagicSystemUiHook.stackedSignalRowHeight(child)<=0)continue;
                Rect bounds=contentBounds.get(child);Float measured=iconHeights.get(child);if(bounds==null||measured==null||bounds.height()<=0)continue;
                float scale=measured/bounds.height();long signature=shape*31+Float.floatToIntBits(scale);
                RedMagicSystemUiHook.stackedGridBudget(child,signature,(w,h)->{
                    ArrayList<StatusBarGridLayout.Node> trial=new ArrayList<>(nodes);int index=trial.indexOf(node);
                    trial.set(index,new StatusBarGridLayout.Node(node.id,node.zone,node.order,node.width+(w-bounds.width())*scale,node.height+(h-bounds.height())*scale,node.baseline));
                    StatusBarAdaptiveLayout.Result packed=StatusBarAdaptiveLayout.pack(trial,root.getWidth(),root.getHeight(),left,right,top,bottom,gap,cutLeft,cutRight);
                    StatusBarGridLayout.Box box=packed.boxes.get(node.id);return packed.valid&&box!=null&&box.scale>=.9999f;
                });
            }
        }
        boolean wifiAssetBudgets(List<StatusBarGridLayout.Node> nodes,float left,float right,float top,float bottom,float gap,float cutLeft,float cutRight){
            boolean accepted=true;
            long shape=root.getWidth()*31L+root.getHeight();for(float edge:new float[]{left,right,top,bottom,gap,cutLeft,cutRight})shape=shape*31+Float.floatToIntBits(edge);
            for(StatusBarGridLayout.Node n:nodes){shape=shape*31+n.id.hashCode();shape=shape*31+n.zone.hashCode();shape=shape*31+n.order;shape=shape*31+Float.floatToIntBits(n.width);shape=shape*31+Float.floatToIntBits(n.height);shape=shape*31+Float.floatToIntBits(n.baseline);}
            for(StatusBarGridLayout.Node node:nodes){List<View> members=groups.get(node.id);if(members==null)continue;
                for(View child:members){StatusBarWifiAssetSpacingHook.Pair pair=StatusBarWifiAssetSpacingHook.pair(child);if(pair==null||pair.plan==null)continue;
                    Rect bounds=contentBounds.get(child);Float measured=iconHeights.get(child);if(bounds==null||measured==null||bounds.height()<=0){accepted=false;continue;}
                    final float scale=measured/bounds.height(),currentWidth=pair.plan.width,currentHeight=pair.plan.height;
                    float others=0;for(View sibling:members)if(sibling!=child){Float h=iconHeights.get(sibling);if(h!=null)others=Math.max(others,h+spacingPx(StatusBarIconLayoutHook.insets(sibling).vertical()));}
                    final float otherHeight=others,ownHeight=measured+spacingPx(StatusBarIconLayoutHook.insets(child).vertical());
                    long signature=shape*31+pair.generation;signature=signature*31+Float.floatToIntBits(scale);signature=signature*31+pair.plan.width;signature=signature*31+pair.plan.height;
                    StatusBarWifiAssetSpacingHook.gridBudget(pair,signature,(w,h)->{
                        ArrayList<StatusBarGridLayout.Node> trial=new ArrayList<>(nodes);
                        int index=trial.indexOf(node);trial.set(index,new StatusBarGridLayout.Node(node.id,node.zone,node.order,node.width+(w-currentWidth)*scale,Math.max(otherHeight,ownHeight+(h-currentHeight)*scale),node.baseline));
                        StatusBarAdaptiveLayout.Result result=StatusBarAdaptiveLayout.pack(trial,root.getWidth(),root.getHeight(),left,right,top,bottom,gap,cutLeft,cutRight);
                        StatusBarGridLayout.Box box=result.boxes.get(node.id);
                        return result.valid&&box!=null&&box.scale>=.9999f;
                    });
                    StatusBarIconLayoutHook.refreshComposite(child);if(!pair.active)accepted=false;
                }
            }
            return accepted;
        }
        boolean isDescendant(View view,View ancestor){
            for(View current=view;current!=null;current=current.getParent() instanceof View?(View)current.getParent():null)
                if(current==ancestor)return true;
            return false;
        }
        Rect iconBounds(View view){return StatusBarContentBounds.of(view);}
        boolean visibleInRoot(View view){
            for(View current=view;current!=null;){
                if(current.getVisibility()!=View.VISIBLE)return false;
                if(current==root)return true;
                current=current.getParent() instanceof View?(View)current.getParent():null;
            }return false;
        }
        void addCompanion(List<StatusBarGridLayout.Node> nodes,Map<String,View> views,String id,String style,View view,int offset,boolean followsVisibility){
            if(view==null||!visibleInRoot(view)||view.getWidth()<=0||view.getHeight()<=0)return;
            StatusBarGridSpec.Item item=spec.get(style);Geometry nativeGeometry=own(view);
            if(followsVisibility&&!showItem(style)){view.setAlpha(0);nativeGeometry.mark(view);return;}
            view.setAlpha(nativeGeometry.alpha);if(nativeGeometry.alpha==0)return;
            if(id.equals("clock.carrier")&&view instanceof TextView&&CarrierTextHook.ownsLockText(view)){
                TextView text=(TextView)view;Rect desired=CarrierTextHook.gridDesired(text,CarrierTextHook.gridWidth(text));
                if(!desired.isEmpty()){
                    nodes.add(new StatusBarGridLayout.Node(id,item.zone.substring(0,1)+"S",item.order*100+offset,desired.width(),desired.height()));
                    views.put(id,view);
                }
                return;
            }
            Rect bounds=iconBounds(view);
            if(bounds.isEmpty())return;
            // CarrierText fills the remaining keyguard width. Reserve the text
            // actually displayed, not that empty layout allocation.
            if(view instanceof TextView){TextView text=(TextView)view;android.text.Layout layout=text.getLayout();
                if(layout!=null&&layout.getLineCount()>0){float right=0;for(int i=0;i<layout.getLineCount();i++)right=Math.max(right,layout.getLineRight(i));
                    int left=text.getTotalPaddingLeft(),top=text.getTotalPaddingTop();
                    if(right>0)bounds.set(left,top,left+Math.min(view.getWidth(),(int)Math.ceil(right)),top+layout.getHeight());}}
            contentBounds.put(view,bounds);
            float height=px(item.size);
            float reference=StatusBarContentBounds.wifiSignalHeight(view);
            if(!positionOnly()&&reference>0)height*=bounds.height()/reference;
            if(positionOnly()&&(id.equals("system_icons")||id.equals("notifications")))height*=bounds.height()/nativeIconHeight(view,px(item.size));
            float width=bounds.width()*height/Math.max(1,bounds.height());
            if(positionOnly())nodes.add(new StatusBarGridLayout.Node(id,item.zone.substring(0,1)+"S",item.order*100+offset,width,height));
            else addInsetNode(nodes,id,item.zone,item.order*100+offset,width,height,-1,view);
            views.put(id,view);
        }
        void addIndependentCarrier(List<StatusBarGridLayout.Node> nodes,Map<String,View> views,TextView text,StatusBarGridSpec.Item item,int offset,int width){
            if(width<=0){CarrierTextHook.gridResult(text,"native_fallback:no_horizontal_space");return;}
            Geometry original=own(text);original.beginMeasuredLayout(text);
            try{
                // MATCH_PARENT in the OEM RelativeLayout ignores TextView.maxWidth.
                // Measure a real ellipsized line before deciding its grid box.
                text.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.AT_MOST),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
                if(text.getWidth()!=text.getMeasuredWidth()||text.getHeight()!=text.getMeasuredHeight()||text.isLayoutRequested()){
                    text.layout(original.left,original.top,original.left+text.getMeasuredWidth(),original.top+text.getMeasuredHeight());text.invalidate();
                }
                text.scrollTo(0,0);
            }finally{original.endMeasuredLayout(text);}
            Rect bounds=CarrierTextHook.gridInk(text);if(bounds.isEmpty())return;
            contentBounds.put(text,bounds);
            // Independent carrier text spans the available header height. It
            // does not inherit the clock item's icon-height or row font size.
            nodes.add(new StatusBarGridLayout.Node("clock.carrier",item.zone.substring(0,1)+"S",item.order*100+offset,bounds.width(),bounds.height()));
            views.put("clock.carrier",text);
        }
        final Map<String,List<View>> groups=new HashMap<>();
        final Map<View,Float> iconHeights=new IdentityHashMap<>();
        final Map<String,ls.augment.com.StatusBarIconSpacingSpec.Insets> nodeInsets=new HashMap<>();
        float spacingPx(int dp){return dp*context.getResources().getDisplayMetrics().density;}
        void addInsetNode(List<StatusBarGridLayout.Node> nodes,String id,String zone,int order,float width,float height,float baseline,View view){
            ls.augment.com.StatusBarIconSpacingSpec.Insets edge=StatusBarIconLayoutHook.insets(view);
            if(!edge.isZero())nodeInsets.put(id,edge);
            nodes.add(new StatusBarGridLayout.Node(id,zone,order,width+spacingPx(edge.horizontal()),height+spacingPx(edge.vertical()),baseline<0?-1:baseline+spacingPx(edge.top)));
        }
        boolean isNativeNetwork(View view){String slot=SystemUiHook.slotOf(view),type=view.getClass().getSimpleName().toLowerCase(Locale.ROOT);
            return "NET_SPEED".equalsIgnoreCase(slot)||type.contains("netspeed")||type.contains("networkspeed");}
        boolean isConnectivity(View view){String slot=SystemUiHook.slotOf(view),type=view.getClass().getSimpleName().toLowerCase(Locale.ROOT);
            // Vendor containers and icons being rebound can legitimately have no slot.
            return "wifi".equalsIgnoreCase(slot)||"mobile".equalsIgnoreCase(slot)||type.contains("statusbarwifi")||type.contains("statusbarmobile");}
        TextView firstText(View view){if(view instanceof TextView)return (TextView)view;
            if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){TextView found=firstText(((ViewGroup)view).getChildAt(i));if(found!=null)return found;}return null;}
        float desiredIconHeight(View view,float size){Rect bounds=contentBounds.get(view);
            float row=RedMagicSystemUiHook.stackedSignalRowHeight(view);
            if(row>0)return (float)Math.min(Float.MAX_VALUE,(double)size*bounds.height()/row);
            // Traffic arrows, independent child boundaries and the native overflow dot
            // change the union bounds. Size the stable signal glyph, not that union.
            float wifi=StatusBarContentBounds.wifiSignalHeight(view);
            if(wifi>0)return (float)Math.min(Float.MAX_VALUE,(double)size*bounds.height()/wifi);
            int sp=FeatureSettings.integer(context,ConfigSchema.STATUSBAR_NATIVE_NETWORK_SIZE_SP,0,0,32);
            TextView text=isNativeNetwork(view)?firstText(view):null;
            if(sp>0&&text!=null&&text.getTextSize()>0)return bounds.height()*android.util.TypedValue.applyDimension(android.util.TypedValue.COMPLEX_UNIT_SP,sp,context.getResources().getDisplayMetrics())/text.getTextSize();
            return size;}
        float nativeIconHeight(View view,float fallback){float height=0;
            if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){View child=((ViewGroup)view).getChildAt(i);
                if(child.getVisibility()==View.VISIBLE&&child.getAlpha()>0&&!isNativeNetwork(child))height=Math.max(height,iconBounds(child).height());}
            return height>0?height:Math.max(1,fallback);}
        void applyNativeNetworkSize(View parent){if(!(parent instanceof ViewGroup))return;
            int sp=FeatureSettings.integer(context,ConfigSchema.STATUSBAR_NATIVE_NETWORK_SIZE_SP,0,0,32);if(sp==0)return;
            ViewGroup group=(ViewGroup)parent;
            float groupScale=px(spec.get("system_icons").size)/nativeIconHeight(parent,px(spec.get("system_icons").size));
            // Preserve native order and row membership while reserving any
            // extra width. Compensate for the later whole-group transform.
            Map<View,Float> expansions=new IdentityHashMap<>();
            for(int i=0;i<group.getChildCount();i++){View child=group.getChildAt(i);Geometry g=own(child);
                child.setTranslationX(g.x);child.setScaleX(g.sx);child.setScaleY(g.sy);
                if(!isNativeNetwork(child)||child.getVisibility()!=View.VISIBLE||g.alpha==0||child.getTransitionAlpha()==0)continue;
                TextView text=firstText(child);if(text==null||text.getTextSize()<=0)continue;
                Rect bounds=iconBounds(child);if(bounds.isEmpty())continue;
                float ratio=android.util.TypedValue.applyDimension(android.util.TypedValue.COMPLEX_UNIT_SP,sp,context.getResources().getDisplayMetrics())/text.getTextSize()/groupScale;
                child.setScaleX(ratio);child.setScaleY(ratio);
                child.setTranslationX(g.x+(bounds.left-child.getPivotX())*(g.sx-ratio));
                expansions.put(child,Math.max(0,bounds.width()*(ratio-g.sx)));
            }
            for(int i=0;i<group.getChildCount();i++){View child=group.getChildAt(i);float shift=0;
                Geometry childNative=geometry.get(child);
                Rect childInk=iconBounds(child);
                float childLeft=child.getLeft()+childNative.x+child.getPivotX()
                        +(childInk.left-child.getPivotX())*childNative.sx;
                for(Map.Entry<View,Float> entry:expansions.entrySet()){
                    View network=entry.getKey();Geometry networkNative=geometry.get(network);
                    float networkRight=network.getLeft()+networkNative.x+network.getPivotX()
                            +(iconBounds(network).right-network.getPivotX())*networkNative.sx;
                    if(child!=network&&childLeft>=networkRight-.001f)shift+=entry.getValue();
                }
                child.setTranslationX(child.getTranslationX()+shift);geometry.get(child).mark(child);
            }}
        void circleBudget(List<StatusBarGridLayout.Node> nodes,float left,float right,float top,float bottom,float gap,float cutLeft,float cutRight){
            if(!usingConnectivityIcon()||connectivityIcon.plan().measured==null){circleBudget=new int[]{0,0};return;}
            StringBuilder key=new StringBuilder(circleKey()).append('/').append(left).append(',').append(right).append(',').append(top).append(',').append(bottom).append(',').append(gap).append(',').append(cutLeft).append(',').append(cutRight);
            StatusBarGridLayout.Node candidate=null;for(StatusBarGridLayout.Node node:nodes){key.append(';').append(node.id).append(':').append(node.zone).append(':').append(node.order).append(':').append(node.width).append(':').append(node.height).append(':').append(node.baseline);if(node.id.equals("battery.connectivity"))candidate=node;}
            if(circleBudgetKey.equals(key.toString()))return;circleBudgetKey=key.toString();
            if(candidate==null){circleBudget=new int[]{0,0};return;}
            final StatusBarGridLayout.Node target=candidate;
            final float edgeWidth=target.width-connectivityIcon.outerWidth(),edgeHeight=target.height-connectivityIcon.outerHeight();
            ls.augment.com.CircleConnectivityPlan zero=connectivityIcon.plan().measured.solve(id->ls.augment.com.StatusBarIconSpacingSpec.ZERO,root.getWidth(),root.getHeight());
            circleBudget=ls.augment.com.DualSignalSpacingObservation.envelope((int)Math.ceil(zero.width),(int)Math.ceil(zero.height),root.getWidth(),root.getHeight(),(width,height)->{
                ArrayList<StatusBarGridLayout.Node> trial=new ArrayList<>();for(StatusBarGridLayout.Node n:nodes)trial.add(n==target?new StatusBarGridLayout.Node(n.id,n.zone,n.order,width+edgeWidth,height+edgeHeight,n.baseline):n);
                StatusBarAdaptiveLayout.Result p=StatusBarAdaptiveLayout.pack(trial,root.getWidth(),root.getHeight(),left,right,top,bottom,gap,cutLeft,cutRight);
                StatusBarGridLayout.Box box=p.boxes.get(target.id);return p.valid&&box!=null&&box.scale>=.9999f;
            });
        }
        boolean circleFits(StatusBarAdaptiveLayout.Result packed){
            if(!usingConnectivityIcon())return true;
            StatusBarGridLayout.Box box=packed.boxes.get("battery.connectivity");
            return packed.valid&&box!=null&&(!connectivityIcon.hasSpacing()||box.scale>=.9999f);
        }
        void commitCircle(float alpha){if(!usingConnectivityIcon())return;
            // Native disappearance and replacement ownership are committed together.
            for(View v:circleNative){Geometry g=own(v);v.setAlpha(0);g.mark(v);}
            connectivityIcon.commit();connectivityIcon.setAlpha(alpha);
        }
        void publishCirclePlacement(float alpha){if(connectivityIcon==null)return;
            // A successful native pack can follow a source becoming unavailable.
            // Withdraw the previous usable budget even when no circle was tried.
            if(!usingConnectivityIcon()||!connectivityIcon.placed()){connectivityIcon.publish("awaiting_layout",0,0);return;}
            connectivityIcon.publish(alpha<=0?"native_hidden":connectivityIcon.wholeCovered()?"whole_covered":"ok",circleBudget[0],circleBudget[1]);
        }
        String circleKey(){StringBuilder metricGeometry=new StringBuilder();
            appendMetricCapacity(metricGeometry);
            return root.getWidth()+"x"+root.getHeight()+"/"+metricGeometry+"/"+(connectivityIcon==null?"missing":connectivityIcon.inputKey());}
        void addConnectivity(List<StatusBarGridLayout.Node> nodes,Map<String,View> views,View battery){
            if(battery!=null)circleNative.add(battery);
            int width=connectivityIcon.outerWidth(),height=connectivityIcon.outerHeight();
            if(connectivityIcon.getWidth()!=width||connectivityIcon.getHeight()!=height){
                connectivityIcon.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(height,View.MeasureSpec.EXACTLY));
                connectivityIcon.layout(0,0,width,height);}
            StatusBarGridSpec.Item item=spec.get("battery");String id="battery.connectivity";
            addInsetNode(nodes,id,item.zone.substring(0,1)+"S",item.order*100,width,height,-1,connectivityIcon);
            contentBounds.put(connectivityIcon,new Rect(0,0,width,height));views.put(id,connectivityIcon);}
        Rect batteryBounds(View view){
            long now=SystemClock.elapsedRealtime();int w=view.getWidth(),h=view.getHeight();
            View owner=findClass(view,"MFVBatteryViewLayout"),container=null;
            if(owner!=null)try{Object value=TargetReflection.field(owner,"mBatteryContainer");if(value instanceof View)container=(View)value;}catch(ReflectiveOperationException ignored){}
            StringBuilder inputs=new StringBuilder();appendNativeShape(view,inputs);appendBatteryInputs(view,view,container,inputs);
            if(owner!=null)for(String field:new String[]{"mBateryLevel","mIsCharing","mShowMode","mTextHollowEffectAvailable"})
                try{inputs.append('|').append(field).append('=').append(TargetReflection.field(owner,field));}catch(ReflectiveOperationException ignored){}
            String key=inputs.toString();
            // The time bound remains a fallback for mutable/animated vendor drawables.
            // Text, native state and child geometry changes must not wait for it.
            if(batteryInk!=null&&batteryInkView==view&&batteryInkInputs.equals(key)&&now-batteryInkAt<1000)return batteryInk;
            int padding=px(12),bw=w+padding*2,bh=h+padding*2;
            Rect result=new Rect(0,0,w,h);
            if(bw>0&&bh>0&&bw<=768&&bh<=768)try{
                if(batteryBitmap==null||batteryBitmap.getWidth()!=bw||batteryBitmap.getHeight()!=bh){
                    if(batteryBitmap!=null)batteryBitmap.recycle();
                    batteryBitmap=android.graphics.Bitmap.createBitmap(bw,bh,android.graphics.Bitmap.Config.ARGB_8888);batteryPixels=new int[bw*bh];}
                batteryBitmap.eraseColor(android.graphics.Color.TRANSPARENT);
                android.graphics.Canvas canvas=new android.graphics.Canvas(batteryBitmap);canvas.translate(padding,padding);
                // Native percentage labels and vectors contain large transparent padding.
                // Measure their actual drawing, without changing any native child layout.
                view.draw(canvas);Rect ink=batteryPixelsBounds(bw,bh,padding);
                // View.draw does not apply that View's own alpha. Draw the actual
                // battery container separately so its user opacity cannot change
                // icon/number scale. No live View property is changed for sampling.
                if(container!=null&&drawBatteryContainer(view,container,padding))ink.union(batteryPixelsBounds(bw,bh,padding));
                if(!ink.isEmpty())result.set(ink);
            }catch(RuntimeException ignored){ }
            batteryInk=result;batteryInkAt=now;batteryInkView=view;batteryInkInputs=key;return result;
        }
        void appendBatteryInputs(View view,View measured,View container,StringBuilder out){
            out.append('|').append(System.identityHashCode(view)).append(':').append(view.getWidth()).append('x').append(view.getHeight())
                    .append(':').append(view.getScrollX()).append(',').append(view.getScrollY()).append(':').append(view.getTransitionAlpha());
            // Grid changes only the measured root's transform; including it would
            // invalidate this cache with our own previous placement every frame.
            if(view!=measured)out.append(':').append(view.getLeft()).append(',').append(view.getTop()).append(':').append(view.getMatrix());
            if(view!=measured&&view!=container)out.append(':').append(view.getAlpha());
            if(view instanceof ViewGroup)out.append(':').append(((ViewGroup)view).getClipChildren()).append(':').append(((ViewGroup)view).getClipToPadding());
            StatusBarAssetsHook.LayoutRendering art=StatusBarAssetsHook.layoutRendering(view);
            out.append(":art=").append(art.generation).append('/').append(art.current).append('/').append(art.series)
                    .append('/').append(StatusBarAssetsHook.hiddenByPolicy(view));
            appendBatteryDrawable(view.getBackground(),out);
            if(view instanceof ImageView)appendBatteryDrawable(((ImageView)view).getDrawable(),out);
            if(view instanceof TextView){TextView text=(TextView)view;out.append(':').append(text.getText()).append(':').append(text.getCurrentTextColor())
                    .append(':').append(text.getBaseline()).append(':').append(text.getGravity()).append(':').append(text.getLetterSpacing()).append(':').append(text.getTextScaleX());}
            if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)appendBatteryInputs(((ViewGroup)view).getChildAt(i),measured,container,out);
        }
        void appendBatteryDrawable(android.graphics.drawable.Drawable drawable,StringBuilder out){
            if(drawable!=null)out.append(":drawable=").append(System.identityHashCode(drawable)).append(':').append(drawable.getBounds())
                    .append(':').append(drawable.getLevel()).append(':').append(drawable.getAlpha()).append(':').append(Arrays.toString(drawable.getState()));
        }
        Rect batteryPixelsBounds(int width,int height,int padding){
            batteryBitmap.getPixels(batteryPixels,0,width,0,0,width,height);int left=width,top=height,right=0,bottom=0;
            for(int y=0;y<height;y++)for(int x=0;x<width;x++)if((batteryPixels[y*width+x]>>>24)>16){
                left=Math.min(left,x);top=Math.min(top,y);right=Math.max(right,x+1);bottom=Math.max(bottom,y+1);}
            return right>left&&bottom>top?new Rect(left-padding,top-padding,right-padding,bottom-padding):new Rect();
        }
        boolean drawBatteryContainer(View measured,View container,int padding){
            ArrayList<View> path=new ArrayList<>();float alpha=1;
            for(View at=container;at!=measured;){
                if(at.getVisibility()!=View.VISIBLE||StatusBarAssetsHook.hiddenByPolicy(at)||!(at.getParent() instanceof View))return false;
                alpha*=at.getTransitionAlpha();if(at!=container)alpha*=at.getAlpha();path.add(at);at=(View)at.getParent();
            }
            if(alpha<=0)return false;
            // Match the asset renderer's existing ancestor-whole suppression;
            // a replaced native child must not enlarge the replacement's box.
            try{if(Boolean.TRUE.equals(TargetReflection.call(StatusBarAssetsHook.class,"parentReplaced",container)))return false;}
            catch(ReflectiveOperationException unavailable){return false;}
            batteryBitmap.eraseColor(android.graphics.Color.TRANSPARENT);
            android.graphics.Canvas canvas=new android.graphics.Canvas(batteryBitmap);canvas.translate(padding,padding);
            if(alpha<1)canvas.saveLayerAlpha(null,Math.round(255*alpha));
            for(int i=path.size()-1;i>=0;i--){View child=path.get(i);ViewGroup parent=(ViewGroup)child.getParent();
                if(parent.getClipChildren())canvas.clipRect(0,0,parent.getWidth(),parent.getHeight());
                if(parent.getClipToPadding())canvas.clipRect(parent.getPaddingLeft(),parent.getPaddingTop(),parent.getWidth()-parent.getPaddingRight(),parent.getHeight()-parent.getPaddingBottom());
                canvas.translate(child.getLeft()-parent.getScrollX(),child.getTop()-parent.getScrollY());canvas.concat(child.getMatrix());
            }
            container.draw(canvas);if(alpha<1)canvas.restore();return true;
        }
        void place(String id,View view,StatusBarGridLayout.Box box){if(view==null)return;
            List<View> children=groups.get(id);
            if(children!=null){boolean rtl=view.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL;float x=rtl?box.x+box.width:box.x,gap=px(1)*box.scale;
                for(View child:children){Rect bounds=contentBounds.get(child);float h=iconHeights.get(child)*box.scale,w=bounds.width()*h/Math.max(1,bounds.height());
                    ls.augment.com.StatusBarIconSpacingSpec.Insets edge=StatusBarIconLayoutHook.insets(child);float unit=spacingPx(1)*box.scale;
                    float cellWidth=w+edge.horizontal()*unit,cellX=rtl?x-cellWidth:x;
                    move(child,cellX+edge.left(child.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL)*unit,box.y+(box.height-h-edge.vertical()*unit)/2+edge.top*unit,w,h);x+=(rtl?-1:1)*(cellWidth+gap);}return;
            }
            ls.augment.com.StatusBarIconSpacingSpec.Insets edge=nodeInsets.get(id);
            if(edge==null)move(view,box.x,box.y,box.width,box.height);
            else {float unit=spacingPx(1)*box.scale;move(view,box.x+edge.left(view.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL)*unit,box.y+edge.top*unit,Math.max(1,box.width-edge.horizontal()*unit),Math.max(1,box.height-edge.vertical()*unit));}
        }
        void move(View v,float x,float y,float width,float height){Geometry g=own(v);
            Rect bounds=contentBounds.get(v);
            // Keep subpixel precision. Integer window coordinates fed their
            // rounding error back into translation and made static text oscillate.
            Matrix parentToRoot=new Matrix();View child=v;
            while(child!=root&&child.getParent() instanceof View){
                View parent=(View)child.getParent();
                parentToRoot.postTranslate(child.getLeft()-parent.getScrollX(),child.getTop()-parent.getScrollY());
                if(parent==root)break;
                parentToRoot.postConcat(parent.getMatrix());child=parent;
            }
            Matrix rootToParent=new Matrix();
            if(parentToRoot.invert(rootToParent)){
                float[] axes={1,0,0,1};parentToRoot.mapVectors(axes);
                float parentSx=(float)Math.hypot(axes[0],axes[1]),parentSy=(float)Math.hypot(axes[2],axes[3]);
                if(parentSx<.001f||parentSy<.001f)return;
                float sx=ls.augment.com.StatusBarTransform.scale(width,bounds==null?v.getWidth():bounds.width(),parentSx);
                float sy=ls.augment.com.StatusBarTransform.scale(height,bounds==null?v.getHeight():bounds.height(),parentSy);
                v.setScaleX(sx);v.setScaleY(sy);
                float[] target={x,y};rootToParent.mapPoints(target);
                float tx=ls.augment.com.StatusBarTransform.translation(target[0],bounds==null?0:bounds.left,v.getPivotX(),sx);
                float ty=ls.augment.com.StatusBarTransform.translation(target[1],bounds==null?0:bounds.top,v.getPivotY(),sy);
                if(v.getRotation()!=0||v.getRotationX()!=0||v.getRotationY()!=0){
                    // Animated vendor icons can rotate independently of their
                    // container. Keep that native transform when aligning the origin.
                    float[] origin={bounds==null?0:bounds.left,bounds==null?0:bounds.top};v.getMatrix().mapPoints(origin);
                    tx=ls.augment.com.StatusBarTransform.finite((double)target[0]-((double)origin[0]-v.getTranslationX()));ty=ls.augment.com.StatusBarTransform.finite((double)target[1]-((double)origin[1]-v.getTranslationY()));
                }
                if(Math.abs(tx-v.getTranslationX())>.001f){v.setTranslationX(tx);positionWrites++;}
                if(Math.abs(ty-v.getTranslationY())>.001f){v.setTranslationY(ty);positionWrites++;}
            }
            g.mark(v);explicitClips.release(v);ViewParent parent=v.getParent();while(parent instanceof ViewGroup){ViewGroup p=(ViewGroup)parent;
                explicitClips.release(p);
                if(!clips.containsKey(p))clips.put(p,new boolean[]{p.getClipChildren(),p.getClipToPadding()});p.setClipChildren(false);p.setClipToPadding(false);if(p==root)break;parent=p.getParent();}
        }
        void startMetrics(){stopMetrics();if(positionOnly())return;boolean needsClock=isKeyguard(root)&&findView(root,"clock","status_bar_clock")==null;
            boolean needed=false;for(int i=4;i<StatusBarGridSpec.IDS.length;i++)if(itemEnabled(StatusBarGridSpec.IDS[i]))needed=true;
            if(!needed&&!needsClock&&!splitClock())return;overlay=new FrameLayout(context);overlay.setClipChildren(false);overlay.setClickable(false);
            overlay.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
            root.addView(overlay,new ViewGroup.LayoutParams(-1,-1));
            if(needsClock){keyguardClock=new TextView(context);keyguardClock.setTag(SystemUiHook.GRID_CLOCK_TAG);
                keyguardClock.setTextSize(14);keyguardClock.setTextColor(android.graphics.Color.WHITE);
                overlay.addView(keyguardClock,new FrameLayout.LayoutParams(-2,-2));SystemUiHook.refreshGridClock(root);}
            if(!needed)return;
            for(int i=4;i<StatusBarGridSpec.IDS.length;i++){String id=StatusBarGridSpec.IDS[i];if(!itemEnabled(id))continue;
                int rows=id.equals("network")&&networkMode()==4?2:1;
                for(int row=0;row<rows;row++){
                    TextView view=new TextView(context);view.setIncludeFontPadding(false);view.setGravity(Gravity.CENTER);view.setText("—");
                    view.setTag(id.equals("network")?"ls_augment_network":"ls_augment_metrics_"+id);
                    view.setTextSize(itemSize(id));view.setSingleLine(true);view.setEllipsize(null);
                    overlay.addView(view,new FrameLayout.LayoutParams(-2,-2));metrics.put(rows==2?id+"#"+row:id,view);
                }}
            previousRx=previousTx=-1;previousTime=0;
            thread=new HandlerThread("LS-status-metrics",android.os.Process.THREAD_PRIORITY_BACKGROUND);thread.start();
            final Handler sessionWorker=new Handler(thread.getLooper());worker=sessionWorker;
            final long generation=metricsGeneration;
            sessionWorker.post(new Runnable(){
            long previousRx=-1,previousTx=-1,previousTime;
            public void run(){
            if(worker!=sessionWorker||metricsGeneration!=generation)return;Map<String,String> values=new LinkedHashMap<>();
            PowerManager powerManager=(PowerManager)context.getSystemService(Context.POWER_SERVICE);
            if(powerManager!=null&&!powerManager.isInteractive()){sessionWorker.postDelayed(this,2000);return;}
            if(itemEnabled("cpu")||itemEnabled("gpu")){
                Bundle sample=null;
                try{sample=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"hardware_telemetry",null,null);}catch(Exception ignored){}
                for(String kind:new String[]{"cpu","gpu"}){
                    if(!itemEnabled(kind))continue;
                    double degrees=sample==null?Double.NaN:sample.getDouble(kind,Double.NaN);
                    values.put(kind,Double.isFinite(degrees)?temperatureLabel(kind)+metricNumber(kind,degrees)+"°":temperature(kind));
                }
            }
            if(itemEnabled("battery_temp")){
                Long temp=readLong("/sys/class/power_supply/battery/temp");values.put("battery_temp",temp==null?"B:—":"B:"+metricNumber("battery_temp",temp/10d)+"°");
            }
            boolean needsCurrent=itemEnabled("current"),needsPower=itemEnabled("power");
            if(needsCurrent||needsPower){
                Long current=readLong("/sys/class/power_supply/battery/current_now");
                if(needsCurrent)values.put("current",current==null?"I:—":"I:"+metricNumber("current",current/1000d)+"mA");
                if(needsPower){
                    Long voltage=readLong("/sys/class/power_supply/battery/voltage_now");
                    values.put("power",current==null||voltage==null?"P:—":"P:"+metricNumber("power",Math.abs(current.doubleValue()*voltage/1e12))+"W");
                }
            }
            if(FeatureSettings.enabled(context,"ls_augment_rm_metrics_custom")) {
                boolean units=FeatureSettings.enabled(context,"ls_augment_rm_metrics_hide_units");
                boolean chargingOnly=FeatureSettings.enabled(context,"ls_augment_rm_metrics_charging_only");
                String batteryStatus=chargingOnly&&(needsCurrent||needsPower)?read("/sys/class/power_supply/battery/status"):"";
                boolean charging=batteryStatus.equalsIgnoreCase("Charging")||batteryStatus.equalsIgnoreCase("Full");
                for(String kind:new String[]{"cpu","gpu","battery_temp","current","power"}) {
                    String value=values.get(kind);if(value==null)continue;
                    int colon=value.indexOf(':');String fallback=colon>=0?value.substring(0,colon+1):"";
                    String numeric=colon>=0?value.substring(colon+1):value;
                    if(units)numeric=numeric.replace("mA","").replace("W","").replace("°","");
                    String prefix=FeatureSettings.text(context,"ls_augment_rm_metric_prefix_"+kind,fallback);
                    values.put(kind,chargingOnly&&!charging&&(kind.equals("current")||kind.equals("power"))?"":prefix+numeric);
                }
            }
            if(itemEnabled("network")){
            long rx=TrafficStats.getTotalRxBytes(),tx=TrafficStats.getTotalTxBytes(),now=SystemClock.elapsedRealtime();
            long down=previousRx<0||rx<previousRx||now<=previousTime?0:(rx-previousRx)*1000/(now-previousTime);
            long up=previousTx<0||tx<previousTx||now<=previousTime?0:(tx-previousTx)*1000/(now-previousTime);
            previousRx=rx;previousTx=tx;previousTime=now;
            String uploadMark=FeatureSettings.text(context,ConfigSchema.STATUSBAR_NETWORK_UPLOAD_MARK,"↑");
            String downloadMark=FeatureSettings.text(context,ConfigSchema.STATUSBAR_NETWORK_DOWNLOAD_MARK,"↓");
            values.put("network",ls.augment.com.StatusBarNetworkDisplay.format(networkMode(),rate(up),rate(down),uploadMark,downloadMark));
            if(FeatureSettings.enabled(context,"ls_augment_rm_network_custom")) {
                int threshold=FeatureSettings.integer(context,"ls_augment_rm_network_hide_below_kb",0,0,10240);
                int digits=FeatureSettings.integer(context,"ls_augment_rm_network_digits",3,1,5);
                int unit=FeatureSettings.integer(context,"ls_augment_rm_network_unit",0,0,2);
                boolean suffix=FeatureSettings.enabled(context,"ls_augment_rm_network_per_second");
                values.put("network",ls.augment.com.SystemUiPolicy.hideNetwork(up,down,threshold)?"":
                    ls.augment.com.StatusBarNetworkDisplay.format(networkMode(),ls.augment.com.SystemUiPolicy.networkRate(up,digits,unit,suffix),ls.augment.com.SystemUiPolicy.networkRate(down,digits,unit,suffix),uploadMark,downloadMark));
            }
            }
            main.post(()->{if(!active||metricsGeneration!=generation)return;for(Map.Entry<String,TextView> e:metrics.entrySet()){
                String value=values.get(baseId(e.getKey()));
                if(value!=null&&e.getKey().contains("#")){String[] lines=value.split("\n",-1);int row=e.getKey().endsWith("#0")?0:1;value=row<lines.length?lines[row]:"";}
                if(value!=null&&!value.contentEquals(e.getValue().getText()))e.getValue().setText(value);
                String kind=baseId(e.getKey());
                boolean custom=FeatureSettings.enabled(context,"ls_augment_rm_"+(kind.equals("network")?"network_custom":"metrics_custom"));
                int width=custom?FeatureSettings.integer(context,kind.equals("network")?"ls_augment_rm_network_width_dp":"ls_augment_rm_metric_width_"+kind,0,0,180):0;
                int desired=width>0?px(width):ViewGroup.LayoutParams.WRAP_CONTENT;
                ViewGroup.LayoutParams params=e.getValue().getLayoutParams();
                if(params!=null&&params.width!=desired){params.width=desired;e.getValue().setLayoutParams(params);}
            }});
            if(worker==sessionWorker&&metricsGeneration==generation)sessionWorker.postDelayed(this,1000);
        }});
        }
        final Map<String,String> thermalPaths=new HashMap<>();
        final Map<String,Long> thermalScanAfter=new HashMap<>();
        String temperature(String kind){String path=thermalPaths.get(kind);long now=SystemClock.elapsedRealtime();
            if(path==null&&now>=thermalScanAfter.getOrDefault(kind,0L)){
                thermalScanAfter.put(kind,now+30_000L);
                File[] zones=new File("/sys/class/thermal").listFiles();if(zones!=null)for(File zone:zones){String type=read(new File(zone,"type").getPath());
                    if(ls.augment.com.ThermalTelemetry.matchesSensor(type,kind)){path=new File(zone,"temp").getPath();thermalPaths.put(kind,path);break;}}
            }
            Long value=path==null?null:readLong(path);double c=value==null?Double.NaN:Math.abs(value)>300?value/1000d:value;
            if(path!=null&&value==null)thermalPaths.remove(kind);
            return temperatureLabel(kind)+ (Double.isFinite(c)&&c>-20&&c<150?metricNumber(kind,c)+"°":"—");}
        String metricNumber(String kind,double value){int fallback=kind.equals("battery_temp")||kind.equals("power")?1:0;
            return StatusBarMetricsFormatter.number(value,FeatureSettings.integer(context,"ls_augment_statusbar_"+kind+"_decimals",fallback,0,3));}
        int networkMode(){return ls.augment.com.StatusBarNetworkDisplay.resolve(FeatureSettings.text(context,ConfigSchema.STATUSBAR_NETWORK_DISPLAY,"0"),FeatureSettings.enabled(context,ConfigSchema.STATUSBAR_NETWORK_TWO_ROWS,true));}
        String temperatureLabel(String kind){return "gpu".equals(kind)?"G:":"C:";}
        String rate(long value){return value>=1024*1024?String.format(Locale.ROOT,"%.1fM",value/1048576d):String.format(Locale.ROOT,"%.0fK",value/1024d);}
        void stopMetrics(){metricsGeneration++;Handler h=worker;worker=null;if(h!=null)h.removeCallbacksAndMessages(null);if(thread!=null){thread.quitSafely();thread=null;}
            if(keyguardClock!=null){SystemUiHook.releaseGridClock(keyguardClock);keyguardClock=null;}
            if(overlay!=null){root.removeView(overlay);overlay=null;}metrics.clear();Arrays.fill(clockLines,null);}
        void restore(){batteryInk=null;batteryInkView=null;batteryInkInputs="";trialClockCapacity=null;clearRejectedCapacity();circleTrial=false;circleNative.clear();packingSuspended=false;packingIssue="";lastWitness=0;
            for(Map.Entry<View,Geometry> e:geometry.entrySet())e.getValue().restore(e.getKey());geometry.clear();groups.clear();
            SystemUiHook.resetGridClock(root);
            explicitClips.restore();
            if(connectivityIcon!=null){connectivityIcon.publish("awaiting_layout",0,0);connectivityIcon.close();root.removeView(connectivityIcon);connectivityIcon=null;}
            for(Map.Entry<ViewGroup,boolean[]> e:clips.entrySet()){e.getKey().setClipChildren(e.getValue()[0]);e.getKey().setClipToPadding(e.getValue()[1]);}clips.clear();}
        void restorePlacement(){for(Map.Entry<View,Geometry> e:geometry.entrySet())e.getValue().restore(e.getKey());geometry.clear();
            explicitClips.restore();for(Map.Entry<ViewGroup,boolean[]> e:clips.entrySet()){e.getKey().setClipChildren(e.getValue()[0]);e.getKey().setClipToPadding(e.getValue()[1]);}clips.clear();}
        void detach(){attached=false;active=false;resetNativeIconCapacity();main.removeCallbacksAndMessages(null);stopMetrics();restore();
            StatusBarIconLayoutHook.gridModeChanged(root);
            if(batteryBitmap!=null){batteryBitmap.recycle();batteryBitmap=null;batteryPixels=null;}batteryInk=null;
            frameWitnesses.clear();alphaAnchor=null;
            if(root.getViewTreeObserver().isAlive()){
                root.getViewTreeObserver().removeOnPreDrawListener(draw);
                root.getViewTreeObserver().removeOnGlobalLayoutListener(nativeLayout);
            }
            FeatureSettings.removeSnapshotListener(snapshotListener);
        }
    }
    private static String read(String path){try(BufferedReader r=new BufferedReader(new FileReader(path))){String s=r.readLine();return s==null?"":s.trim();}catch(Exception e){return "";}}
    private static String baseId(String id){int split=id.indexOf('#');return split<0?id:id.substring(0,split);}
    private static Long readLong(String path){try{return Long.parseLong(read(path));}catch(Exception e){return null;}}
}
