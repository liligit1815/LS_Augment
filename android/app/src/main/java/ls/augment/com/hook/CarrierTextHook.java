package ls.augment.com.hook;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Rect;
import android.os.Build;
import android.os.PowerManager;
import android.text.Editable;
import android.text.Layout;
import android.text.Spanned;
import android.text.SpannedString;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.WeakHashMap;
import ls.augment.com.CarrierTextOptions;
import ls.augment.com.ConfigSnapshot;
import ls.augment.com.StatusBarAdaptiveLayout;
import ls.augment.com.StatusBarGridLayout;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Decorates the OEM carrier TextView without replacing its controller or click target. */
final class CarrierTextHook {
    private static final String HEADER="com.zte.controlcenter.widget.CCHeaderView";
    private static final String LOCK="com.android.systemui.statusbar.phone.KeyguardStatusBarView";
    private static final Map<TextView,State> STATES=new WeakHashMap<>();
    private CarrierTextHook(){ }

    static int install(AugmentModule module,ClassLoader loader){
        int count=0;
        for(String type:new String[]{HEADER,LOCK}){
            count+=hookNamed(module,loader,"carrier.text",type,"onFinishInflate",0,null,(o,a,r)->{bind(o);return PASS;});
            count+=hookNamed(module,loader,"carrier.text",type,"onAttachedToWindow",0,null,(o,a,r)->{bind(o);return PASS;});
        }
        // Restore our owned style before a density/font/theme update, then read
        // the new OEM style. A new configuration must never become our baseline.
        for(String[] endpoint:new String[][]{{HEADER,"updateHeaderResources"},{LOCK,"onConfigurationChanged"}}){
            count+=hookNamed(module,loader,"carrier.text",endpoint[0],endpoint[1],-1,
                    (o,a,r)->{prepareResources(o);return PASS;},(o,a,r)->{bind(o);return PASS;});
        }
        return count;
    }

    /** Used by the existing legacy visibility hook, avoiding competing interceptors. */
    static boolean headerEnabled(Object owner){
        String panel=headerPanel(owner);
        return owner instanceof View&&panel!=null&&FeatureSettings.enabled(((View)owner).getContext(),CarrierTextOptions.key(panel,"enabled"));
    }

    static String headerPanel(Object owner){
        Object value=field(owner,"panelType");
        if(!(value instanceof Number))return null;
        int type=((Number)value).intValue();
        Object control=field(owner,"QS_CENTER_TYPE"),notification=field(owner,"NOTIFICATION_CENTER_TYPE"),merged=field(owner,"PRIMITIVE_CENTER_TYPE");
        // Values confirmed in the NX809J ROM. Prefer fields on another firmware.
        if(type==number(control,1))return "control";
        if(type==number(notification,2)||type==number(merged,3))return "notification";
        return null;
    }
    private static int number(Object value,int fallback){return value instanceof Number?((Number)value).intValue():fallback;}

    /** Also called after ControlCenterHeaderHook lazily inflates its native stub. */
    static void bindHeader(Object owner){bind(owner);}
    static boolean ownsLockText(View view){
        State state=STATES.get(view);
        return state!=null&&state.attached&&state.enabled&&"lock".equals(state.panel);
    }
    /** The grid supplies placement only. Its clock size never replaces this text's sp size. */
    static int gridWidth(TextView view){
        State state=STATES.get(view);if(state==null)return 0;
        state.applyStyle(view);return state.availableWidth(view);
    }
    static void gridResult(View view,String result){
        State state=STATES.get(view);if(state==null||result.equals(state.gridReport))return;
        state.gridReport=result;
        FeatureSettings.diagnostic(view.getContext(),CarrierTextOptions.key("lock","layout"),result);
    }
    /** A provisional box from text/paint, not from last frame's transformed view. */
    static Rect gridDesired(TextView view,int maximum){
        int width=Math.max(0,maximum-view.getTotalPaddingLeft()-view.getTotalPaddingRight());
        String value=view.getText().toString();
        String visible=TextUtils.ellipsize(value,view.getPaint(),width,TextUtils.TruncateAt.END).toString();
        Rect ink=new Rect();view.getPaint().getTextBounds(value,0,value.length(),ink);
        if(ink.isEmpty()||visible.isEmpty())return new Rect();
        return new Rect(0,0,Math.max(1,Math.min(width,(int)Math.ceil(view.getPaint().measureText(visible)))),ink.height());
    }
    /** Visible single-line ink, excluding font padding and text discarded by END ellipsis. */
    static Rect gridInk(TextView view){
        Layout layout=view.getLayout();if(layout==null||layout.getLineCount()==0)return new Rect();
        int width=Math.max(0,view.getWidth()-view.getTotalPaddingLeft()-view.getTotalPaddingRight());
        String visible=TextUtils.ellipsize(view.getText(),view.getPaint(),width,TextUtils.TruncateAt.END).toString();
        Rect ink=new Rect();view.getPaint().getTextBounds(visible,0,visible.length(),ink);
        if(ink.isEmpty())return ink;
        int left=view.getTotalPaddingLeft()+(int)Math.floor(Math.max(0,layout.getLineLeft(0)))-view.getScrollX();
        int right=view.getTotalPaddingLeft()+(int)Math.ceil(Math.min(width,layout.getLineRight(0)))-view.getScrollX();
        ink.set(left,view.getBaseline()+ink.top-view.getScrollY(),Math.max(left+1,right),view.getBaseline()+ink.bottom-view.getScrollY());
        return ink;
    }
    /** Find room for text by ellipsizing its width; never change its font scale. */
    static int fitGridWidth(List<StatusBarGridLayout.Node> nodes,StatusBarGridLayout.Node carrier,int minimum,
            float width,float height,float left,float right,float top,float bottom,float gap,float cutLeft,float cutRight){
        int high=(int)Math.floor(carrier.width);
        if(carrierFits(nodes,carrier,high,width,height,left,right,top,bottom,gap,cutLeft,cutRight))return high;
        int low=Math.max(1,minimum);
        if(low>high||!carrierFits(nodes,carrier,low,width,height,left,right,top,bottom,gap,cutLeft,cutRight))return -1;
        while(low<high){int middle=low+(high-low+1)/2;
            if(carrierFits(nodes,carrier,middle,width,height,left,right,top,bottom,gap,cutLeft,cutRight))low=middle;else high=middle-1;}
        return low;
    }
    private static boolean carrierFits(List<StatusBarGridLayout.Node> nodes,StatusBarGridLayout.Node carrier,int carrierWidth,
            float width,float height,float left,float right,float top,float bottom,float gap,float cutLeft,float cutRight){
        List<StatusBarGridLayout.Node> candidate=new ArrayList<>(nodes.size());
        for(StatusBarGridLayout.Node node:nodes)candidate.add(node==carrier?new StatusBarGridLayout.Node(node.id,node.zone,node.order,carrierWidth,node.height,node.baseline):node);
        StatusBarAdaptiveLayout.Result packed=StatusBarAdaptiveLayout.pack(candidate,width,height,left,right,top,bottom,gap,cutLeft,cutRight);
        StatusBarGridLayout.Box box=packed.boxes.get(carrier.id);
        return packed.valid&&box!=null&&box.scale>=.9999f;
    }
    private static void bind(Object owner){
        if(!(owner instanceof View))return;
        Object value=field(owner,"mCarrierLabel");
        String panel="lock";
        if(!(value instanceof TextView)){value=field(owner,"carrierText");panel=headerPanel(owner);}
        if(!(value instanceof TextView)||panel==null)return;
        TextView view=(TextView)value;
        State state=STATES.get(view);
        if(state==null){state=new State(view,(View)owner,panel);STATES.put(view,state);view.addOnAttachStateChangeListener(state);}
        else if(!state.panel.equals(panel)){state.panel=panel;state.snapshot=null;}
        if(view.isAttachedToWindow())state.attach();
        state.refresh();
    }
    private static void prepareResources(Object owner){
        Object value=field(owner,"mCarrierLabel","carrierText");
        State state=STATES.get(value);
        if(state!=null)state.prepareResources();
    }

    private static CharSequence copy(CharSequence value){
        return value instanceof Spanned?new SpannedString(value):value==null?"":value.toString();
    }

    private static final class State implements TextWatcher,View.OnAttachStateChangeListener,ViewTreeObserver.OnPreDrawListener {
        final WeakReference<TextView> reference;
        final WeakReference<View> boundary;
        final Runnable configuration=this::refresh;
        final Runnable pendingText=this::render;
        final Runnable tick=()->{tickPending=false;render();schedule();};
        final BroadcastReceiver receiver=new BroadcastReceiver(){
            @Override public void onReceive(Context context,Intent intent){formattedAt=Long.MIN_VALUE;formatter=null;render();schedule();}
        };
        String panel;
        boolean attached,writing,enabled,styleOwned,textOwned,tickPending,receiverRegistered,visible;
        Context receiverContext;
        ConfigSnapshot snapshot;
        CharSequence nativeText;
        float nativeSize,appliedSize;
        int nativeLines,appliedLines,nativeWidth,appliedWidth,nativeHeight,nativeEms;
        TextUtils.TruncateAt nativeEllipsize,appliedEllipsize;
        boolean nativeHorizontal,appliedHorizontal;
        int mode=1,size;
        String custom="红魔Duo",pattern="HH:mm",formatSignature="",formatted="",gridReport="";
        long period=60_000L,formattedAt=Long.MIN_VALUE;
        SimpleDateFormat formatter;
        final Rect nativeFrame=new Rect(),siblingFrame=new Rect();
        final Rect visibleBounds=new Rect();

        State(TextView view,View owner,String panel){
            reference=new WeakReference<>(view);boundary=new WeakReference<>(owner);this.panel=panel;
            nativeText=copy(view.getText());rememberStyle(view);
        }
        void attach(){
            TextView view=reference.get();if(view==null||attached)return;
            attached=true;nativeText=copy(view.getText());rememberStyle(view);snapshot=null;
            view.addTextChangedListener(this);view.getViewTreeObserver().addOnPreDrawListener(this);
            FeatureSettings.addSnapshotListener(view.getContext(),configuration);
            Context context=view.getContext().getApplicationContext();if(context==null)context=view.getContext();
            IntentFilter filter=new IntentFilter();
            for(String action:new String[]{Intent.ACTION_TIME_TICK,Intent.ACTION_TIME_CHANGED,Intent.ACTION_TIMEZONE_CHANGED,Intent.ACTION_LOCALE_CHANGED,Intent.ACTION_SCREEN_ON,Intent.ACTION_SCREEN_OFF})filter.addAction(action);
            try{
                if(Build.VERSION.SDK_INT>=33)context.registerReceiver(receiver,filter,Context.RECEIVER_NOT_EXPORTED);
                else context.registerReceiver(receiver,filter);
                receiverContext=context;receiverRegistered=true;
            }catch(RuntimeException error){FeatureSettings.diagnostic(view.getContext(),CarrierTextOptions.key(panel,"receiver"),error.toString());}
            refresh();
        }
        void rememberStyle(TextView view){
            nativeSize=view.getTextSize();nativeLines=view.getMaxLines();nativeHeight=view.getMaxHeight();nativeWidth=view.getMaxWidth();nativeEms=view.getMaxEms();
            nativeEllipsize=view.getEllipsize();nativeHorizontal=view.isHorizontallyScrollable();
        }
        void rememberNativeChanges(TextView view){
            if(!styleOwned){rememberStyle(view);return;}
            if(Math.abs(view.getTextSize()-appliedSize)>.01f)nativeSize=view.getTextSize();
            if(view.getMaxLines()!=appliedLines){nativeLines=view.getMaxLines();nativeHeight=view.getMaxHeight();}
            if(view.getMaxWidth()!=appliedWidth){nativeWidth=view.getMaxWidth();nativeEms=view.getMaxEms();}
            if(view.getEllipsize()!=appliedEllipsize)nativeEllipsize=view.getEllipsize();
            if(view.isHorizontallyScrollable()!=appliedHorizontal)nativeHorizontal=view.isHorizontallyScrollable();
        }
        void prepareResources(){
            TextView view=reference.get();if(view==null)return;
            restoreStyle(view);snapshot=null;
        }
        void refresh(){
            TextView view=reference.get();if(view==null||!attached)return;
            ConfigSnapshot next=FeatureSettings.snapshot(view.getContext());
            if(next==snapshot)return;
            if(next!=snapshot){
                view.removeCallbacks(tick);tickPending=false;
                snapshot=next;enabled=FeatureSettings.enabled(view.getContext(),CarrierTextOptions.key(panel,"enabled"));
                mode=FeatureSettings.integer(view.getContext(),CarrierTextOptions.key(panel,"mode"),1,0,2);
                size=FeatureSettings.integer(view.getContext(),CarrierTextOptions.key(panel,"size"),0,0,40);
                custom=value(next,"text","红魔Duo").replace('\n',' ').replace('\r',' ');
                pattern=value(next,"pattern","HH:mm");
                if(pattern.length()>80||pattern.trim().isEmpty())pattern="HH:mm";
                period=hasSeconds(pattern)?1_000L:60_000L;formattedAt=Long.MIN_VALUE;
                FeatureSettings.diagnostic(view.getContext(),CarrierTextOptions.key(panel,"runtime"),"enabled="+enabled+";mode="+mode+";size="+size+";view="+view.getClass().getName());
            }
            if(!enabled){restore(view);schedule();return;}
            render();applyStyle(view);schedule();
        }
        String value(ConfigSnapshot config,String suffix,String fallback){String value=config.get(CarrierTextOptions.key(panel,suffix));return value==null?fallback:value;}
        void render(){
            TextView view=reference.get();if(view==null||!attached||writing)return;
            if(!enabled){restore(view);return;}
            // A hidden carrier should neither run a clock nor be forced visible.
            CharSequence text=mode==0?nativeText:mode==1?custom:isVisible(view)?time(view):null;
            if(text==null)return;
            textOwned=mode!=0;
            if(!TextUtils.equals(view.getText(),text))write(view,text);
        }
        String time(TextView view){
            long now=System.currentTimeMillis();Locale locale=view.getResources().getConfiguration().getLocales().get(0);TimeZone zone=TimeZone.getDefault();
            String signature=pattern+'|'+locale.toLanguageTag()+'|'+zone.getID();
            if(formatter==null||!signature.equals(formatSignature)){
                try{formatter=new SimpleDateFormat(pattern,locale);}catch(IllegalArgumentException invalid){formatter=new SimpleDateFormat("HH:mm",locale);}
                formatter.setTimeZone(zone);formatSignature=signature;formattedAt=Long.MIN_VALUE;
            }
            long bucket=Math.floorDiv(now,period);
            if(bucket!=formattedAt){formatted=formatter.format(new Date(now));formattedAt=bucket;}
            return formatted;
        }
        void write(TextView view,CharSequence text){writing=true;try{view.setText(text);}finally{writing=false;}}
        boolean applyStyle(TextView view){
            rememberNativeChanges(view);
            float desired=size==0?nativeSize:TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP,size,view.getResources().getDisplayMetrics());
            int width=availableWidth(view);
            boolean changed=Math.abs(view.getTextSize()-desired)>.01f||view.getMaxLines()!=1||view.getEllipsize()!=TextUtils.TruncateAt.END||!view.isHorizontallyScrollable()||view.getMaxWidth()!=width;
            if(Math.abs(view.getTextSize()-desired)>.01f)view.setTextSize(TypedValue.COMPLEX_UNIT_PX,desired);
            if(view.getMaxLines()!=1)view.setMaxLines(1);
            if(view.getEllipsize()!=TextUtils.TruncateAt.END)view.setEllipsize(TextUtils.TruncateAt.END);
            // TextWatcher makes TextView use Editable/DynamicLayout. The
            // one-line contract is a wide internal layout plus a bounded
            // ellipsized width; wrapping it first merely clips the first line.
            // Preserve CarrierText's native transformation instead of replacing
            // it with setSingleLine(), which would discard its locale handling.
            if(!view.isHorizontallyScrollable())view.setHorizontallyScrolling(true);
            if(view.getMaxWidth()!=width)view.setMaxWidth(width);
            appliedSize=view.getTextSize();appliedLines=view.getMaxLines();appliedEllipsize=view.getEllipsize();appliedHorizontal=view.isHorizontallyScrollable();appliedWidth=view.getMaxWidth();styleOwned=true;
            return changed;
        }
        int availableWidth(TextView view){
            int nativeLimit=nativeWidth<0?Math.max(0,(int)Math.ceil(nativeEms*view.getPaint().measureText("M"))):nativeWidth;
            if(!view.isLaidOut())return nativeLimit;
            // Window coordinates include the grid's scale/translation. Feeding
            // those positions back into maxWidth made a long carrier shrink on
            // every frame, and poisoned subsequent short-text configurations.
            StatusBarGridHook.carrierNativeFrame(view,nativeFrame);
            int left=nativeFrame.left,right=nativeFrame.right,top=nativeFrame.top,bottom=nativeFrame.bottom;
            boolean rtl=view.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL;
            int limit=nativeLimit;
            View child=view,owner=boundary.get();
            while(child.getParent() instanceof ViewGroup){
                ViewGroup parent=(ViewGroup)child.getParent();
                StatusBarGridHook.carrierNativeFrame(parent,nativeFrame);
                int edge=rtl?parent.getPaddingLeft():nativeFrame.width()-parent.getPaddingRight();
                limit=Math.min(limit,Math.max(0,rtl?right-edge:edge-left));
                for(int i=0;i<parent.getChildCount();i++){
                    View sibling=parent.getChildAt(i);if(sibling==child||StatusBarGridHook.isCarrierGridOverlay(sibling)||sibling.getVisibility()!=View.VISIBLE||sibling.getAlpha()==0||sibling.getWidth()<=0||sibling.getHeight()<=0)continue;
                    StatusBarGridHook.carrierNativeFrame(sibling,siblingFrame);int sl=siblingFrame.left,sr=siblingFrame.right,st=siblingFrame.top,sb=siblingFrame.bottom;
                    if(sb<=top||st>=bottom)continue;
                    // Only the forward edge can grow; keep the native anchor,
                    // margins and RelativeLayout rules intact (including RTL).
                    if(!rtl&&sl>=left)limit=Math.min(limit,Math.max(0,sl-left));
                    else if(rtl&&sr<=right)limit=Math.min(limit,Math.max(0,right-sr));
                }
                if(parent==owner)break;
                left+=nativeFrame.left-parent.getScrollX();right+=nativeFrame.left-parent.getScrollX();
                top+=nativeFrame.top-parent.getScrollY();bottom+=nativeFrame.top-parent.getScrollY();child=parent;
            }
            return Math.max(0,limit);
        }
        void restoreStyle(TextView view){
            if(!styleOwned)return;
            rememberNativeChanges(view);
            if(Math.abs(view.getTextSize()-appliedSize)<.01f)view.setTextSize(TypedValue.COMPLEX_UNIT_PX,nativeSize);
            if(view.getMaxLines()==appliedLines){if(nativeLines<0)view.setMaxHeight(nativeHeight);else view.setMaxLines(nativeLines);}
            if(view.getEllipsize()==appliedEllipsize)view.setEllipsize(nativeEllipsize);
            if(view.isHorizontallyScrollable()==appliedHorizontal)view.setHorizontallyScrolling(nativeHorizontal);
            if(view.getMaxWidth()==appliedWidth){if(nativeWidth<0)view.setMaxEms(nativeEms);else view.setMaxWidth(nativeWidth);}
            styleOwned=false;
        }
        void restore(TextView view){
            if(textOwned){write(view,nativeText);textOwned=false;}
            restoreStyle(view);
        }
        boolean isVisible(TextView view){
            if(!view.isShown()||view.getWindowVisibility()!=View.VISIBLE||!view.getGlobalVisibleRect(visibleBounds))return false;
            for(View node=view;node!=null;node=node.getParent() instanceof View?(View)node.getParent():null)if(node.getAlpha()==0)return false;
            PowerManager power=(PowerManager)view.getContext().getSystemService(Context.POWER_SERVICE);
            return power==null||power.isInteractive();
        }
        void schedule(){
            TextView view=reference.get();if(view==null)return;
            boolean ticking=attached&&enabled&&mode==2&&isVisible(view);
            if(!ticking){view.removeCallbacks(tick);tickPending=false;return;}
            if(!tickPending){tickPending=true;view.postDelayed(tick,period-Math.floorMod(System.currentTimeMillis(),period));}
        }
        @Override public boolean onPreDraw(){
            TextView view=reference.get();if(view==null||!attached)return true;
            refresh();boolean nowVisible=isVisible(view);
            if(nowVisible&&!visible){formattedAt=Long.MIN_VALUE;render();}visible=nowVisible;schedule();
            return !enabled||!applyStyle(view);
        }
        @Override public void beforeTextChanged(CharSequence s,int start,int count,int after){ }
        @Override public void onTextChanged(CharSequence s,int start,int before,int count){ }
        @Override public void afterTextChanged(Editable text){
            if(writing)return;
            nativeText=copy(text);
            TextView view=reference.get();if(view!=null&&attached&&enabled&&mode!=0){view.removeCallbacks(pendingText);view.post(pendingText);}
        }
        @Override public void onViewAttachedToWindow(View view){attach();}
        @Override public void onViewDetachedFromWindow(View ignored){
            TextView view=reference.get();if(view==null)return;
            attached=false;view.removeCallbacks(tick);view.removeCallbacks(pendingText);tickPending=false;
            FeatureSettings.removeSnapshotListener(configuration);view.getViewTreeObserver().removeOnPreDrawListener(this);
            restore(view);view.removeTextChangedListener(this);
            if(receiverRegistered&&receiverContext!=null)try{receiverContext.unregisterReceiver(receiver);}catch(RuntimeException ignoredReceiver){ }
            receiverRegistered=false;receiverContext=null;snapshot=null;
        }
    }
    /** Quoted pattern literals must not turn a minute-only clock into a 1 Hz timer. */
    static boolean hasSeconds(String pattern){
        boolean quote=false;
        for(int i=0;i<pattern.length();i++){
            char c=pattern.charAt(i);
            if(c=='\''){if(i+1<pattern.length()&&pattern.charAt(i+1)=='\''){i++;continue;}quote=!quote;}
            else if(!quote&&(c=='s'||c=='S'))return true;
        }
        return false;
    }
}
