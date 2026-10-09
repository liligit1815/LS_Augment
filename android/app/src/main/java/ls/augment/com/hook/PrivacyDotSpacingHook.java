package ls.augment.com.hook;

import android.graphics.Insets;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.SystemClock;
import android.view.Display;
import android.view.DisplayCutout;
import android.view.Gravity;
import android.view.RoundedCorner;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.Executor;
import ls.augment.com.BuildConfig;
import ls.augment.com.ConfigSchema;
import ls.augment.com.PrivacyDotSpacingObservation;
import ls.augment.com.PrivacyDotSpacingPolicy;
import ls.augment.com.StatusBarIconSpacingSpec;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** NX809J's real privacy-dot controller; does not alter the ScreenDecorations window. */
final class PrivacyDotSpacingHook {
    private static final Map<Object,State> STATES=new WeakHashMap<>();
    private PrivacyDotSpacingHook(){}
    static int install(AugmentModule module,ClassLoader loader){
        final String type;
        try{type=SystemUiCompatibility.privacyController(loader).getName();}
        catch(ClassNotFoundException absent){return 0;}
        int count=hookNamed(module,loader,"privacy.spacing",type,"initialize",4,null,(o,a,r)->{state(o).bind();return PASS;});
        // Both writers reset padding/gravity/size. Restore owned child margins
        // before they run; the next traversal measures the new native box.
        for(String writer:new String[]{"setCornerSizes","updateRotations"})count+=hookNamed(module,loader,"privacy.spacing",type,writer,-1,
                (o,a,r)->{State s=STATES.get(o);if(s!=null)s.prepare();return PASS;},null);
        count+=hookNamed(module,loader,"privacy.spacing",type,"resolveState",1,null,(o,a,r)->{state(o).bind();return PASS;});
        count+=hookNamed(module,loader,"privacy.spacing",type,"stop",0,(o,a,r)->{State s=STATES.remove(o);if(s!=null)s.stop();return PASS;},null);
        return count;
    }
    private static State state(Object owner){State s=STATES.get(owner);if(s==null){s=new State(owner);STATES.put(owner,s);}return s;}
    private static Object invoke(Object target,String method,Object...args){try{return call(target,method,args);}catch(ReflectiveOperationException ignored){return null;}}
    private static int number(Object value,int fallback){return value instanceof Number?((Number)value).intValue():fallback;}
    private static View dot(View root){
        int id=root.getResources().getIdentifier("privacy_dot","id",root.getContext().getPackageName());return id==0?null:root.findViewById(id);
    }
    private static final class State implements ViewTreeObserver.OnPreDrawListener,View.OnAttachStateChangeListener {
        final WeakReference<Object> owner;
        final ArrayList<Corner> corners=new ArrayList<>();
        final ArrayList<ViewTreeObserver> trees=new ArrayList<>();
        final Runnable changed=()->schedule();
        boolean listening;volatile boolean stopped,pending;
        State(Object owner){this.owner=new WeakReference<>(owner);}
        void bind(){
            Object o=owner.get();if(o==null||stopped)return;
            for(String name:new String[]{"tl","tr","bl","br"}){
                Object value=field(o,name);if(!(value instanceof FrameLayout))continue;
                View root=(View)value;boolean known=false;for(Corner c:corners)if(c.root==root)known=true;
                if(!known){Corner c=new Corner(root);corners.add(c);root.addOnAttachStateChangeListener(this);if(root.isAttachedToWindow())watchTree(root);}
            }
            if(!listening&&!corners.isEmpty())listening=FeatureSettings.addSnapshotListener(corners.get(0).root.getContext(),changed);
            apply();
        }
        // Config callbacks are delivered on main; decorations can use their own looper.
        void schedule(){
            Object executor=invoke(owner.get(),"getUiExecutor");
            if(!(executor instanceof Executor)||pending||stopped)return;pending=true;
            try{((Executor)executor).execute(()->{pending=false;if(!stopped)apply();});}catch(RuntimeException ignored){pending=false;}
        }
        void prepare(){for(Corner c:corners){c.restore();c.signature="";c.publication="";}if(!corners.isEmpty())corners.get(0).unavailable("awaiting_layout");}
        void watchTree(View v){ViewTreeObserver tree=v.getViewTreeObserver();if(tree.isAlive()&&!trees.contains(tree)){trees.add(tree);tree.addOnPreDrawListener(this);}}
        void stop(){stopped=true;prepare();FeatureSettings.removeSnapshotListener(changed);for(Corner c:corners)c.root.removeOnAttachStateChangeListener(this);for(ViewTreeObserver tree:trees)if(tree.isAlive())tree.removeOnPreDrawListener(this);trees.clear();corners.clear();}
        boolean apply(){
            Object o=owner.get(),viewState=invoke(o,"getCurrentViewState");
            View designated=field(viewState,"designatedCorner") instanceof View?(View)field(viewState,"designatedCorner"):null;
            boolean nativeShow=Boolean.TRUE.equals(invoke(viewState,"shouldShowDot"));
            boolean rtl=Boolean.TRUE.equals(field(viewState,"layoutRtl"));
            int rotation=number(field(viewState,"rotation"),-1);
            int status=number(invoke(field(o,"stateController"),"getState"),-1);
            String surface=status==1?"lock":status==0?"main":"";
            boolean changed=false;
            for(Corner c:corners){
                if(c.root!=designated||!nativeShow||c.root.getVisibility()!=View.VISIBLE||!c.root.isAttachedToWindow()){changed|=c.restore();continue;}
                changed|=c.apply(rtl,rotation,surface);
            }
            return changed;
        }
        @Override public boolean onPreDraw(){return !apply();}
        @Override public void onViewAttachedToWindow(View v){watchTree(v);schedule();}
        @Override public void onViewDetachedFromWindow(View v){
            for(Corner c:corners)if(c.root==v){c.restore();c.signature="";}
            ViewTreeObserver tree=v.getViewTreeObserver();boolean needed=false;
            for(Corner c:corners)if(c.root!=v&&c.root.isAttachedToWindow()&&c.root.getViewTreeObserver()==tree)needed=true;
            if(!needed){if(tree.isAlive())tree.removeOnPreDrawListener(this);trees.remove(tree);}
        }
    }
    private static final class Corner {
        final View root;
        final Rect visible=new Rect();final int[] location=new int[2],windowLocation=new int[2];final Point screen=new Point();
        View child;Margins margins;String signature="",publication="";long publishedAt;
        PrivacyDotSpacingPolicy policy;PrivacyDotSpacingPolicy.Limits limits;
        Corner(View root){this.root=root;}
        boolean restore(){return margins!=null&&child!=null&&margins.restore(child);}
        void unavailable(String reason){Display display=root.getDisplay();if(display!=null)publish(display,display.getRotation(),root.getResources().getConfiguration().getLayoutDirection()==View.LAYOUT_DIRECTION_RTL,reason);}
        boolean apply(boolean rtl,int rotation,String surface){
            View found=dot(root);if(found!=child){restore();child=found;margins=null;signature="";}
            if(child==null||child.getParent()!=root||!(child.getLayoutParams() instanceof FrameLayout.LayoutParams))return restore();
            FrameLayout.LayoutParams params=(FrameLayout.LayoutParams)child.getLayoutParams();
            if(margins==null||margins.params!=params){restore();margins=new Margins(params);signature="";}
            margins.reconcile(child);
            // Transitions remain wholly native. Do not chase their moving window.
            if(root.getTranslationX()!=0||root.getTranslationY()!=0||child.getTranslationX()!=0||child.getTranslationY()!=0||child.getScaleX()!=1||child.getScaleY()!=1||child.getRotation()!=0)return restore();
            Display display=root.getDisplay();WindowInsets insets=root.getRootWindowInsets();
            if(display==null||rotation!=display.getRotation()||insets==null){unavailable("awaiting_geometry");return restore();}
            if(root.isLayoutRequested()||child.isLayoutRequested())return false;
            if(child.getWidth()<=0||child.getHeight()<=0||!root.getLocalVisibleRect(visible))return restore();
            root.getLocationOnScreen(location);root.getRootView().getLocationOnScreen(windowLocation);display.getRealSize(screen);
            float density=root.getResources().getDisplayMetrics().density;
            int direction=rtl?View.LAYOUT_DIRECTION_RTL:View.LAYOUT_DIRECTION_LTR;
            if(root.getLayoutDirection()!=direction||child.getLayoutDirection()!=direction){unavailable("awaiting_layout");return restore();}
            int gravity=Gravity.getAbsoluteGravity(params.gravity<0?Gravity.TOP|Gravity.START:params.gravity,direction);
            String next=rotation+"|"+rtl+"|"+density+"|"+root.getResources().getConfiguration().fontScale+"|"+root.getWidth()+"|"+root.getHeight()+"|"+child.getWidth()+"|"+child.getHeight()+"|"+root.getPaddingLeft()+"|"+root.getPaddingTop()+"|"+root.getPaddingRight()+"|"+root.getPaddingBottom()+"|"+margins.key()+"|"+gravity+"|"+location[0]+"|"+location[1]+"|"+windowLocation[0]+"|"+windowLocation[1]+"|"+root.getRootView().getWidth()+"|"+root.getRootView().getHeight()+"|"+visible+"|"+insets+"|"+screen;
            if(!next.equals(signature)){
                signature=next;
                PrivacyDotSpacingPolicy.Box content=new PrivacyDotSpacingPolicy.Box(location[0]+root.getPaddingLeft(),location[1]+root.getPaddingTop(),location[0]+root.getWidth()-root.getPaddingRight(),location[1]+root.getHeight()-root.getPaddingBottom());
                // RootWindowInsets uses window-local coordinates, including the
                // narrow legacy ScreenDecorOverlay and future per-corner roots.
                DisplayCutout cutout=insets.getDisplayCutout();Insets waterfall=cutout==null?Insets.NONE:cutout.getWaterfallInsets();
                int windowRight=windowLocation[0]+root.getRootView().getWidth(),windowBottom=windowLocation[1]+root.getRootView().getHeight();
                PrivacyDotSpacingPolicy.Box screenClip=new PrivacyDotSpacingPolicy.Box(Math.max(Math.max(0,windowLocation[0]+waterfall.left),location[0]+visible.left),Math.max(Math.max(0,windowLocation[1]+waterfall.top),location[1]+visible.top),Math.min(Math.min(screen.x,windowRight-waterfall.right),location[0]+visible.right),Math.min(Math.min(screen.y,windowBottom-waterfall.bottom),location[1]+visible.bottom));
                ArrayList<PrivacyDotSpacingPolicy.Box> cuts=new ArrayList<>();if(cutout!=null)for(Rect rect:cutout.getBoundingRects())cuts.add(new PrivacyDotSpacingPolicy.Box(windowLocation[0]+rect.left,windowLocation[1]+rect.top,windowLocation[0]+rect.right,windowLocation[1]+rect.bottom));
                ArrayList<PrivacyDotSpacingPolicy.RoundCorner> rounds=new ArrayList<>();for(int pos=0;pos<4;pos++){RoundedCorner corner=insets.getRoundedCorner(pos);if(corner!=null){Point centre=corner.getCenter();rounds.add(new PrivacyDotSpacingPolicy.RoundCorner(windowLocation[0]+centre.x,windowLocation[1]+centre.y,corner.getRadius(),pos));}}
                PrivacyDotSpacingPolicy.SafeArea safe=new PrivacyDotSpacingPolicy.SafeArea(screenClip,cuts.toArray(new PrivacyDotSpacingPolicy.Box[0]),rounds.toArray(new PrivacyDotSpacingPolicy.RoundCorner[0]));
                int horizontal=gravity&Gravity.HORIZONTAL_GRAVITY_MASK,vertical=gravity&Gravity.VERTICAL_GRAVITY_MASK;
                policy=new PrivacyDotSpacingPolicy(content,child.getWidth(),child.getHeight(),margins.left(child),margins.top,margins.right(child),margins.bottom,
                        horizontal==Gravity.RIGHT?1:horizontal==Gravity.CENTER_HORIZONTAL?0:-1,vertical==Gravity.BOTTOM?1:vertical==Gravity.CENTER_VERTICAL?0:-1,density,safe);
                limits=policy.limits();
            }
            StatusBarIconSpacingSpec spec=StatusBarIconSpacingSpec.parse(FeatureSettings.snapshot(root.getContext()).get(StatusBarIconSpacingSpec.KEY));
            StatusBarIconSpacingSpec.Insets edge=spec==null?StatusBarIconSpacingSpec.ZERO:spec.resolve(surface,"privacy.dot");
            boolean enabled=FeatureSettings.enabled(root.getContext(),ConfigSchema.SYSTEMUI_MASTER)&&!surface.isEmpty();
            boolean fits=limits!=null&&policy.fits(edge,rtl,limits);
            String state=limits==null||!limits.available?"unsafe_geometry":enabled&&!edge.isZero()&&!fits?"outside_capacity":enabled&&!edge.isZero()?"applied":"native";
            boolean changed=enabled&&!edge.isZero()&&fits?margins.apply(child,edge,density):restore();
            publish(display,rotation,rtl,state);
            return changed;
        }
        void publish(Display display,int rotation,boolean rtl,String status){
            long now=SystemClock.elapsedRealtime();int h=limits==null?0:limits.horizontal,v=limits==null?0:limits.vertical;
            String key=signature+"|"+status+"|"+h+"|"+v;if(key.equals(publication)&&now-publishedAt<30_000)return;
            publication=key;publishedAt=now;
            PrivacyDotSpacingObservation observation=new PrivacyDotSpacingObservation(System.currentTimeMillis()-now,now,BuildConfig.VERSION_CODE,display.getDisplayId(),rotation,
                    Math.round(root.getResources().getDisplayMetrics().density*1000),Math.round(root.getResources().getConfiguration().fontScale*1000),rtl?1:0,h,v,status);
            FeatureSettings.diagnostic(root.getContext(),PrivacyDotSpacingObservation.KEY+rotation,observation.serialize());
        }
    }
    /** Per-edge ownership preserves an OEM update to one margin during restoration. */
    private static final class Margins {
        final FrameLayout.LayoutParams params;int start,end,top,bottom,nativeLeft,nativeRight;boolean relative,applied;
        int appliedStart,appliedEnd,appliedTop,appliedBottom;
        Margins(FrameLayout.LayoutParams p){params=p;capture();}
        void capture(){start=params.getMarginStart();end=params.getMarginEnd();top=params.topMargin;bottom=params.bottomMargin;nativeLeft=params.leftMargin;nativeRight=params.rightMargin;relative=params.isMarginRelative();}
        void reconcile(View child){
            if(!applied){capture();return;}
            if(params.getMarginStart()!=appliedStart){start=params.getMarginStart();if(!relative){if(child.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL)nativeRight=start;else nativeLeft=start;}}
            if(params.getMarginEnd()!=appliedEnd){end=params.getMarginEnd();if(!relative){if(child.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL)nativeLeft=end;else nativeRight=end;}}
            if(params.topMargin!=appliedTop)top=params.topMargin;if(params.bottomMargin!=appliedBottom)bottom=params.bottomMargin;
        }
        int left(View child){return relative?(child.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?end:start):nativeLeft;}
        int right(View child){return relative?(child.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?start:end):nativeRight;}
        String key(){return start+","+end+","+top+","+bottom+","+nativeLeft+","+nativeRight+","+relative;}
        boolean apply(View child,StatusBarIconSpacingSpec.Insets edge,float density){
            boolean rtl=child.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL;
            int s=(relative?start:rtl?nativeRight:nativeLeft)+Math.round(edge.start*density),e=(relative?end:rtl?nativeLeft:nativeRight)+Math.round(edge.end*density),t=top+Math.round(edge.top*density),b=bottom+Math.round(edge.bottom*density);
            boolean changed=params.getMarginStart()!=s||params.getMarginEnd()!=e||params.topMargin!=t||params.bottomMargin!=b;
            if(changed){params.setMarginStart(s);params.setMarginEnd(e);params.topMargin=t;params.bottomMargin=b;params.resolveLayoutDirection(child.getLayoutDirection());child.requestLayout();}
            appliedStart=s;appliedEnd=e;appliedTop=t;appliedBottom=b;applied=true;return changed;
        }
        boolean restore(View child){
            if(!applied||child.getLayoutParams()!=params)return false;
            boolean ownStart=params.getMarginStart()==appliedStart,ownEnd=params.getMarginEnd()==appliedEnd;
            if(ownStart&&ownEnd&&!relative){params.setMarginStart(Integer.MIN_VALUE);params.setMarginEnd(Integer.MIN_VALUE);params.leftMargin=nativeLeft;params.rightMargin=nativeRight;}
            else{if(ownStart)params.setMarginStart(start);if(ownEnd)params.setMarginEnd(end);}
            if(params.topMargin==appliedTop)params.topMargin=top;if(params.bottomMargin==appliedBottom)params.bottomMargin=bottom;
            params.resolveLayoutDirection(child.getLayoutDirection());applied=false;child.requestLayout();return true;
        }
    }
}
