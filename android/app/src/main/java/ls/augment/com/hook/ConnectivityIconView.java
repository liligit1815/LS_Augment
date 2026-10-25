package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.view.View;
import java.util.*;
import ls.augment.com.*;

/** Stable reference diameter plus an independently measured outer cell. */
final class ConnectivityIconView extends View {
    private final ConnectivityIconPainter painter=new ConnectivityIconPainter();
    final ConnectivityIconSource source;
    private int tint=0xffffffff;
    private Frame frame;
    private boolean preparing,committed;
    private Runnable invalidated;
    private String problem="awaiting_source";
    private CircleConnectivitySpacingObservation lastObservation;
    private long generation,committedGeneration=-1,publishedAt;private String published="",environmentChecksum="",environment="";
    ConnectivityIconView(Context context){super(context);setTag("ls_augment_connectivity_circle");
        setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
        source=new ConnectivityIconSource(context,()->post(()->{setContentDescription(sourceState().description());dirty();}));}
    ConnectivityIconState sourceState(){return source==null?ConnectivityIconState.unknown():source.state;}
    boolean ready(){
        if(source==null||!source.ready)return false;
        ConnectivityIconState state=sourceState();
        if(state.wifiConnected&&state.wifiInternet==ConnectivityIconState.WifiInternet.UNKNOWN
                &&!hidden("wifi")&&!hidden("wifi.signal")){
            ConfigSnapshot snapshot=FeatureSettings.snapshot(getContext());
            for(String key:ConfigSchema.CONNECTIVITY_CONTENT_KEYS)if("wifi".equals(snapshot.get(key)))return false;
        }
        return true;
    }
    void onInvalidated(Runnable listener){invalidated=listener;}
    void tint(int color){if(tint!=color){tint=color;invalidate();}}
    String reason(){return problem;}
    CircleConnectivityPlan plan(){return frame==null?null:frame.plan;}
    boolean usable(){return frame!=null&&(frame.plan.accepted||frame.plan.wholeCovered);}
    boolean hasSpacing(){return frame!=null&&frame.plan.hasSpacing;}
    int outerWidth(){return frame==null?0:(int)Math.ceil(frame.plan.width);}
    int outerHeight(){return frame==null?0:(int)Math.ceil(frame.plan.height);}
    void commit(){boolean next=usable(),repaint=next&&(!committed||committedGeneration!=generation);
        committed=next;committedGeneration=generation;if(repaint)invalidate();}
    void uncommit(){committed=false;}
    boolean placed(){return committed&&usable();}
    boolean wholeCovered(){return frame!=null&&frame.layers.whole;}
    Rect artworkRect(){if(frame==null)return new Rect();CircleConnectivityPlan p=frame.plan;
        return new Rect((int)Math.floor(p.originX),(int)Math.floor(p.originY),
                (int)Math.ceil(p.originX+p.diameterPx),(int)Math.ceil(p.originY+p.diameterPx));}
    /** Grid rejection identity never derives D from this View's expanded size. */
    String inputKey(){ConfigSnapshot s=FeatureSettings.snapshot(getContext());ConnectivityIconState state=sourceState();
        StringBuilder b=new StringBuilder(s.checksum).append('/').append(getLayoutDirection()).append('/').append(getResources().getDisplayMetrics().density)
                .append('/').append(getResources().getConfiguration().fontScale).append('/').append(Objects.hashCode(StatusBarAssetsHook.typeface(this,"battery",null)))
                .append('/').append(StatusBarAssetsHook.circleLayers(this).token).append('/').append(state.battery).append('/').append(state.charging).append('/').append(state.bypassCharging)
                .append('/').append(state.wifiKnown).append('/').append(state.wifiConnected).append('/').append(state.wifiInternet)
                .append('/').append(state.activeDataSubscription).append('/').append(state.defaultDataSubscription);
        for(ConnectivityIconState.Sim sim:state.sims)b.append('/').append(sim.subscriptionId).append(':').append(sim.slot).append(':').append(sim.bars);
        return b.toString();}
    boolean prepare(float diameter,int maxWidth,int maxHeight){preparing=true;
        try{
            ConfigSnapshot s=FeatureSettings.snapshot(getContext());ConnectivityIconState nativeState=sourceState();
            Typeface font=StatusBarAssetsHook.typeface(this,"battery",null);
            if(frame!=null&&frame.nativeState==nativeState&&frame.snapshot.checksum.equals(s.checksum)
                    &&Objects.equals(frame.font,font)&&frame.plan.diameterPx==diameter&&frame.maxWidth==maxWidth&&frame.maxHeight==maxHeight
                    &&frame.plan.density==getResources().getDisplayMetrics().density&&frame.rtl==getLayoutDirection()
                    &&frame.layers.token.equals(StatusBarAssetsHook.circleLayers(this).token))return usable();
            painter.setTypeface(font);
            StatusBarAssetsHook.CircleLayers layers=StatusBarAssetsHook.prepareCircle(this);
            painter.setWifiContrast(!layers.readyParts.contains("wifi.signal"));
            String[] contents=new String[3];int[] scales=new int[3];
            for(int i=0;i<3;i++){contents[i]=s.get(ConfigSchema.CONNECTIVITY_CONTENT_KEYS[i]);scales[i]=integer(s,ConfigSchema.CONNECTIVITY_SCALE_KEYS[i]);}
            List<ConnectivityIconState.Sim> sims=new ArrayList<>();
            sims.addAll(nativeState.sims);
            boolean wifi=nativeState.wifiKnown;
            ConnectivityIconState current=new ConnectivityIconState(nativeState.battery,
                    nativeState.bypassCharging?ConnectivityIconState.PowerState.BYPASS:nativeState.charging?ConnectivityIconState.PowerState.CHARGING:ConnectivityIconState.PowerState.NONE,
                    wifi,nativeState.wifiConnected,nativeState.wifiLevel,nativeState.wifiBars,nativeState.airplane,nativeState.activeDataSubscription,nativeState.defaultDataSubscription,sims,nativeState.wifiInternet);
            for(int i=0;i<contents.length;i++)if("battery".equals(contents[i])&&hidden("battery")||"wifi".equals(contents[i])&&hidden("wifi"))contents[i]="none";
            ConnectivityIconLayout layout=ConnectivityIconLayout.read(s::get);
            StatusBarIconSpacingSpec rules=StatusBarIconSpacingSpec.parse(s.get(StatusBarIconSpacingSpec.KEY));
            if(rules==null)throw new IllegalArgumentException("Invalid IS1");String surface=StatusBarAssetsHook.surfaceFor(this);
            CircleConnectivityPlan p=painter.plan(diameter,getResources().getDisplayMetrics().density,current,contents,scales,
                    integer(s,ConfigSchema.STATUSBAR_CONNECTIVITY_STROKE),layout,id->rules.resolve(surface,id),getLayoutDirection()==View.LAYOUT_DIRECTION_RTL,
                    // Artwork is clipped to its old target; use the full target as a
                    // conservative canvas bound, stable across all animation frames.
                    (region,id,glyph)->{
                        if(!id.startsWith("mobile")||!layers.readyParts.contains(id))return glyph;
                        float u=diameter/100f,x=layout.x[region],y=layout.y[region];
                        return new CircleConnectivityPlan.Box(((int)(glyph.left/u-x)+x)*u,((int)(glyph.top/u-y)+y)*u,
                                ((float)Math.ceil(glyph.right/u-x)+x)*u,((float)Math.ceil(glyph.bottom/u-y)+y)*u);
                    },maxWidth,maxHeight,layers.ring,layers.whole,id->!hidden(id));
            frame=new Frame(s,nativeState,current,font,layers,p,contents,scales,layout,maxWidth,maxHeight,getLayoutDirection());generation++;problem=p.reason;
            return p.accepted||p.wholeCovered;
        }catch(IllegalArgumentException|IllegalStateException unavailable){frame=null;problem="unmeasured:"+unavailable.getMessage();return false;}
        finally{preparing=false;}
    }
    private boolean hidden(String id){return StatusBarAssetsHook.isHidden(this,id);}
    private static int integer(ConfigSnapshot s,String key){return Integer.parseInt(s.get(key));}
    private void dirty(){boolean wasCommitted=committed;committed=false;
        // A rejected alpha-zero view can receive an explicit diagnostic draw.
        // Only a new invalidation needs another Grid pass; repeated draws do not.
        if(wasCommitted||!isLayoutRequested()){requestLayout();invalidate();if(invalidated!=null)invalidated.run();}}
    void drawFailed(){frame=null;problem="artwork_changed";dirty();}
    void artworkChanged(){if(preparing)return;if(frame==null||!frame.layers.token.equals(StatusBarAssetsHook.circleLayers(this).token)
            ||!Objects.equals(frame.font,StatusBarAssetsHook.typeface(this,"battery",null)))dirty();}
    /** Physical whole and default Painter must pass this same generation. */
    boolean frameCurrent(){
        // A rejected/pending view can still be drawn explicitly by artwork or
        // diagnostics. Grid or the next real input owns its retry. Scheduling
        // from that draw would restart layout after every completed traversal.
        if(!committed)return false;
        if(frame!=null&&frame.nativeState==sourceState()
                &&frame.snapshot.checksum.equals(FeatureSettings.snapshot(getContext()).checksum)
                &&Objects.equals(frame.font,StatusBarAssetsHook.typeface(this,"battery",null))
                &&frame.layers.token.equals(StatusBarAssetsHook.circleLayers(this).token))return true;
        dirty();return false;}
    @Override protected void onDraw(Canvas canvas){super.onDraw(canvas);if(!frameCurrent()||frame.layers.whole)return;
        painter.setArtwork((target,id,layer,l,t,r,b,color)->hidden(id)||StatusBarAssetsHook.drawLayer(this,target,id,layer,l,t,r,b,color));
        Frame f=frame;
        painter.setWifiContrast(!f.layers.readyParts.contains("wifi.signal"));
        if(!painter.drawPlanned(canvas,0,0,f.plan,f.current,tint,integer(f.snapshot,ConfigSchema.STATUSBAR_CONNECTIVITY_STROKE),
                integer(f.snapshot,ConfigSchema.STATUSBAR_CONNECTIVITY_INACTIVE),ConfigSchema.truthy(f.snapshot.get(ConfigSchema.STATUSBAR_CONNECTIVITY_COLORS)),
                f.contents,f.scales,palette(f.snapshot,false),palette(f.snapshot,true),Color.parseColor(f.snapshot.get(ConfigSchema.STATUSBAR_CONNECTIVITY_PLUG_COLOR)),f.layout))dirty();
    }
    private static int[] palette(ConfigSnapshot snapshot,boolean text){String base=SystemUiOptions.PREFIX+(text?"battery_text_":"battery_");
        if(!ConfigSchema.truthy(snapshot.get(base+"colors")))return null;int[] colors=new int[5];
        for(int i=0;i<5;i++)colors[i]=Color.parseColor(snapshot.get(base+(i==4?"charging_color":"color_"+i)));return colors;}
    void publish(String reason,int width,int height){
        android.view.Display display=getDisplay();String surface=StatusBarAssetsHook.surfaceFor(this);
        if(display==null||!StatusBarSurfaceSpec.valid(surface)){
            if(lastObservation==null)return;surface=lastObservation.surface;
            if(!reason.equals("disabled"))reason="awaiting_layout";
        }
        ConfigSnapshot snapshot=FeatureSettings.snapshot(getContext());
        Frame observedFrame=frame;
        // Diagnostics bind a single measured generation to the snapshot whose
        // environment they advertise. This also applies to rejected plans.
        // Do not call frameCurrent(): publication must not schedule more layouts.
        boolean currentFrame=observedFrame!=null&&ready()&&observedFrame.nativeState==sourceState()
                &&observedFrame.snapshot.checksum.equals(snapshot.checksum)
                &&Objects.equals(observedFrame.font,StatusBarAssetsHook.typeface(this,"battery",null))
                &&observedFrame.layers.token.equals(StatusBarAssetsHook.circleLayers(this).token)
                &&observedFrame.plan.density==getResources().getDisplayMetrics().density&&observedFrame.rtl==getLayoutDirection();
        if(!currentFrame||((reason.equals("ok")||reason.equals("whole_covered"))&&!committed)){
            observedFrame=null;reason="awaiting_layout";width=0;height=0;
        }
        if(!snapshot.checksum.equals(environmentChecksum)){environmentChecksum=snapshot.checksum;environment=CircleConnectivitySpacingObservation.environment(snapshot.values());}
        if(!ConfigSchema.truthy(snapshot.get(ConfigSchema.SYSTEMUI_MASTER))||!ConfigSchema.truthy(snapshot.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP))
                ||ConfigSchema.truthy(snapshot.get(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY)))reason="disabled";
        else if(hidden("connectivity"))reason="native_hidden";
        else if(observedFrame==null)reason="awaiting_layout";
        long now=android.os.SystemClock.elapsedRealtime();
        StatusBarHeaderSpacingObservation profile=new StatusBarHeaderSpacingObservation(System.currentTimeMillis()-now,now,BuildConfig.VERSION_CODE,display==null?lastObservation.profile.display:display.getDisplayId(),display==null?lastObservation.profile.rotation:display.getRotation(),
                Math.round(getResources().getDisplayMetrics().density*1000),Math.round(getResources().getConfiguration().fontScale*1000),getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?1:0,0);
        CircleConnectivitySpacingObservation observation=new CircleConnectivitySpacingObservation(profile,surface,environment,reason,generation,observedFrame==null?null:observedFrame.plan.measured,width,height);
        lastObservation=observation;String raw=observation.serialize(),stable=raw.substring(0,raw.lastIndexOf(';'))+"/"+profile.build+":"+profile.display+":"+profile.rotation+":"+profile.densityMilli+":"+profile.fontMilli+":"+profile.rtl;
        if(stable.equals(published)&&now-publishedAt<30000)return;published=stable;publishedAt=now;
        FeatureSettings.diagnostic(getContext(),CircleConnectivitySpacingObservation.key(surface,profile.rotation),raw);
    }
    void close(){committed=false;frame=null;invalidated=null;source.close();}
    static final class Frame {
        final ConfigSnapshot snapshot;final ConnectivityIconState nativeState,current;final Typeface font;
        final int maxWidth,maxHeight,rtl;
        final StatusBarAssetsHook.CircleLayers layers;final CircleConnectivityPlan plan;final String[] contents;final int[] scales;final ConnectivityIconLayout layout;
        Frame(ConfigSnapshot s,ConnectivityIconState n,ConnectivityIconState c,Typeface f,StatusBarAssetsHook.CircleLayers a,CircleConnectivityPlan p,String[] text,int[] size,ConnectivityIconLayout l,int w,int h,int r){
            snapshot=s;nativeState=n;current=c;font=f;layers=a;plan=p;contents=text;scales=size;layout=l;maxWidth=w;maxHeight=h;rtl=r;}
    }
}
