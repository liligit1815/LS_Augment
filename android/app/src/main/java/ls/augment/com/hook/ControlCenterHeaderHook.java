package ls.augment.com.hook;

import android.text.Layout;
import android.text.TextPaint;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewStub;
import android.view.ViewTreeObserver;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.ConfigSnapshot;
import ls.augment.com.SystemUiPolicy;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Keeps header options live, reversible and within the native header's space. */
final class ControlCenterHeaderHook {
    static volatile String clockDebug="waiting_for_header";
    private static final String TYPE="com.zte.controlcenter.widget.CCHeaderView";
    private static final String P="ls_augment_rm_qs_";
    private static final Map<View,State> STATES=new WeakHashMap<>();
    private ControlCenterHeaderHook(){ }

    static int install(AugmentModule module,ClassLoader loader){
        int count=hookNamed(module,loader,"qs.header",TYPE,"onFinishInflate",0,null,(owner,args,result)->{
            state(owner);return PASS;
        });
        count+=hookNamed(module,loader,"qs.header",TYPE,"onAttachedToWindow",0,null,(owner,args,result)->{
            State state=state(owner);if(state!=null)state.attach();return PASS;
        });
        count+=hookNamed(module,loader,"qs.header",TYPE,"onDetachedFromWindow",0,null,(owner,args,result)->{
            State state=STATES.remove(owner);if(state!=null)state.detach();return PASS;
        });
        count+=hookNamed(module,loader,"qs.header",TYPE,"updateHeaderResources",0,null,(owner,args,result)->{
            State state=state(owner);if(state!=null)state.resources();return PASS;
        });
        return count;
    }
    private static State state(Object owner){
        if(!(owner instanceof ViewGroup))return null;
        State state=STATES.get(owner);
        if(state==null){state=new State((ViewGroup)owner);STATES.put((View)owner,state);}
        return state;
    }
    private static View child(View view,String id){
        int resource=view.getResources().getIdentifier(id,"id","com.android.systemui");
        return resource==0?null:view.findViewById(resource);
    }
    /** Native Clock updates can reset the seconds flag after the header was configured. */
    static boolean renderClock(TextView clock){
        for(View view=clock;view!=null;view=view.getParent() instanceof View?(View)view.getParent():null){
            State state=STATES.get(view);
            if(state!=null&&state.clock()==clock)return state.renderClock();
        }
        return false;
    }

    private static final class State implements ViewTreeObserver.OnPreDrawListener {
        final WeakReference<ViewGroup> reference;
        final Runnable listener=this::refresh;
        TextPaint paint=new TextPaint();
        boolean attached,refreshing,showCarrier,customClock,carrierManaged,logoManaged;
        WeakReference<View> wiredSearch=new WeakReference<>(null);
        boolean searchClickable;
        Boolean nativeSeconds;
        boolean secondsTicker;
        final Runnable secondTick=this::tickSeconds;
        Float nativeSize;
        ConfigSnapshot lastSnapshot;
        String signature="";
        SimpleDateFormat secondsFormat;
        String formatSignature="",lastTimeText="";
        long formattedSecond=Long.MIN_VALUE,lastClockDiagnostic;

        State(ViewGroup view){reference=new WeakReference<>(view);rememberClock();}
        TextView clock(){Object value=field(reference.get(),"mClockView");return value instanceof TextView?(TextView)value:null;}
        void rememberClock(){
            TextView clock=clock();if(clock==null)return;
            if(nativeSize==null)nativeSize=clock.getTextSize();
            Object seconds=field(clock,"mShowSeconds");if(nativeSeconds==null&&seconds instanceof Boolean)nativeSeconds=(Boolean)seconds;
        }
        void resources(){
            // updateHeaderResources resets the native text size for this density.
            TextView clock=clock();if(clock!=null)nativeSize=clock.getTextSize();
            lastSnapshot=null;signature="";refresh();
        }
        void attach(){
            ViewGroup view=reference.get();if(view==null||attached)return;
            attached=true;view.getViewTreeObserver().addOnPreDrawListener(this);
            clockDebug="attached;clock="+(clock()==null?"missing":clock().getClass().getName());
            FeatureSettings.addSnapshotListener(view.getContext(),listener);view.post(listener);
        }
        void refresh(){
            ViewGroup view=reference.get();if(view==null||!attached||refreshing)return;
            // Inflation can publish the header before its clock field is bound.
            // Do not cache an unapplied settings signature in that case.
            if(clock()==null)return;
            ConfigSnapshot snapshot=FeatureSettings.snapshot(view.getContext());if(snapshot==lastSnapshot)return;
            lastSnapshot=snapshot;
            clockDebug="attached;revision="+snapshot.revision+";seconds="+snapshot.get(P+"clock_seconds")+";clock="+clock().getClass().getName();
            FeatureSettings.diagnostic(view.getContext(),P+"clock_config",clockDebug);
            String next=snapshot.get(P+"clock_seconds")+'|'+snapshot.get(P+"clock_period")+'|'+snapshot.get(P+"carrier")+'|'+snapshot.get(P+"search")+'|'+snapshot.get(P+"browser");
            if(next.equals(signature))return;signature=next;refreshing=true;
            try{
                rememberClock();TextView clock=clock();
                boolean seconds="1".equals(snapshot.get(P+"clock_seconds"));
                customClock=seconds||"1".equals(snapshot.get(P+"clock_period"));
                if(clock!=null){
                    setSecondsTicker(clock,seconds);
                    boolean desired=seconds||Boolean.TRUE.equals(nativeSeconds);
                    if(!Boolean.valueOf(desired).equals(field(clock,"mShowSeconds"))){set(clock,"mShowSeconds",desired);call(clock,"updateShowSeconds");}
                    call(clock,"updateClock");
                    renderClock();
                }
                boolean show=Boolean.TRUE.equals(call(view,"shouldQsCarrierVisible"));
                Object carrier=field(view,"carrierText");boolean created=false;
                if(show&&carrier==null){
                    View stub=child(view,"qs_carrier_stub");
                    if(stub instanceof ViewStub){carrier=((ViewStub)stub).inflate();set(view,"carrierText",carrier);created=true;}
                    Object feature=field(view,"CARRIER_HOTSPOT_FEATURE");
                    if(carrier instanceof View&&view instanceof View.OnClickListener&&Boolean.TRUE.equals(call(feature,"enabled")))
                        ((View)carrier).setOnClickListener((View.OnClickListener)view);
                    if(carrier instanceof TextView&&clock!=null)((TextView)carrier).setTextColor(clock.getCurrentTextColor());
                }
                // Initial native attachment already owns its listener. Later
                // transitions must start/stop it too, including lazy inflation.
                if(created||lastCarrier!=null&&show!=lastCarrier){
                    listenCarrier(show);carrierManaged=true;
                }
                lastCarrier=show;showCarrier=show;
                carrierVisibility();call(view,"updateVisibilities");
                boolean search=!"2".equals(snapshot.get(P+"search"))&&("1".equals(snapshot.get(P+"search"))||!snapshot.get(P+"browser").isEmpty());
                wireSearch(view,search);view.requestLayout();fitClock();
            }catch(ReflectiveOperationException error){FeatureSettings.diagnostic(view.getContext(),"ls_augment_rm_qs_header_error",error.toString());}
            finally{refreshing=false;}
        }
        Boolean lastCarrier;
        void setSecondsTicker(TextView clock,boolean enabled){
            clock.removeCallbacks(secondTick);secondsTicker=enabled;
            if(enabled)clock.postDelayed(secondTick,1000L);
        }
        void tickSeconds(){
            TextView clock=clock();
            if(!attached||!secondsTicker||clock==null||!clock.isAttachedToWindow())return;
            if(clock.isShown()){
                try{call(clock,"updateClock");}catch(ReflectiveOperationException ignored){}
                renderClock();fitClock();
            }
            clock.postDelayed(secondTick,1000L-Math.floorMod(System.currentTimeMillis(),1000L));
        }
        boolean renderClock(){
            TextView clock=clock();
            if(!attached||!secondsTicker||clock==null||Boolean.TRUE.equals(field(clock,"mDemoMode")))return false;
            long now=System.currentTimeMillis(),second=now/1000L;
            if(second!=formattedSecond||secondsFormat==null){
                Locale locale=clock.getResources().getConfiguration().getLocales().get(0);
                boolean hour24=android.text.format.DateFormat.is24HourFormat(clock.getContext());
                TimeZone zone=TimeZone.getDefault();
                String next=locale.toLanguageTag()+"|"+hour24+"|"+zone.getID();
                if(!next.equals(formatSignature)||secondsFormat==null){
                    secondsFormat=new SimpleDateFormat(hour24?"HH:mm:ss":"h:mm:ss",locale);
                    secondsFormat.setTimeZone(zone);formatSignature=next;
                }
                lastTimeText=secondsFormat.format(new Date(now));formattedSecond=second;
            }
            android.text.SpannableStringBuilder text=new android.text.SpannableStringBuilder(lastTimeText);
            if(FeatureSettings.enabled(clock.getContext(),P+"clock_period")){
                text.append(" ");int start=text.length();
                java.util.Calendar time=java.util.Calendar.getInstance();time.setTimeInMillis(now);
                text.append(SystemUiPolicy.period(time.get(java.util.Calendar.HOUR_OF_DAY)));
                text.setSpan(new android.text.style.RelativeSizeSpan(.35f),start,text.length(),android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            }
            if(!text.toString().contentEquals(clock.getText()))clock.setText(text);
            clock.setContentDescription(text.toString());
            clockDebug="rendered;text="+text+";time="+now;
            if(clock.isShown()&&now-lastClockDiagnostic>=10_000L){
                lastClockDiagnostic=now;
                FeatureSettings.diagnostic(clock.getContext(),"ls_augment_rm_qs_clock_runtime",
                        "seconds=true;text="+text+";nativeSeconds="+field(clock,"mShowSeconds")+";time="+now);
            }
            return true;
        }
        void wireSearch(ViewGroup header,boolean enabled){
            View search=child(header,"search_button");
            // The native independent-center branch never installs this listener,
            // even though the layout marks the normally-hidden button clickable.
            if(enabled&&search!=null&&!search.hasOnClickListeners()&&header instanceof View.OnClickListener){
                searchClickable=search.isClickable();wiredSearch=new WeakReference<>(search);
                search.setOnClickListener((View.OnClickListener)header);
            }else if(!enabled)restoreSearch();
        }
        void restoreSearch(){
            View search=wiredSearch.get();if(search!=null){search.setOnClickListener(null);search.setClickable(searchClickable);}
            wiredSearch=new WeakReference<>(null);
        }
        void listenCarrier(boolean show) throws ReflectiveOperationException {
            Object controller=field(reference.get(),"mController"),manager=field(controller,"carrierTextManager"),callback=field(controller,"mCarrierTextCallback");
            if(manager==null)return;
            call(manager,"setListening",show?callback:null);
            Object feature=field(controller,"CARRIER_HOTSPOT_FEATURE");
            if(show&&Boolean.TRUE.equals(call(feature,"enabled"))){call(manager,"registerLogoBroadcast");logoManaged=true;}
            else if(logoManaged){call(manager,"unregisterLogoBroadcast");logoManaged=false;}
        }
        void carrierVisibility(){Object view=field(reference.get(),"carrierText");if(view instanceof View)((View)view).setVisibility(showCarrier?View.VISIBLE:View.GONE);}
        void fitClock(){
            ViewGroup view=reference.get();TextView clock=clock();
            if(view==null||clock==null||nativeSize==null||view.getWidth()<=0)return;
            float size=nativeSize;
            if(customClock){
                paint.set(clock.getPaint());paint.setTextSize(nativeSize);
                float width=Layout.getDesiredWidth(clock.getText(),paint);
                // The other half holds native status icons and up to three
                // footer actions. Keep the original size when the text fits.
                float available=view.getWidth()*.5f-clock.getPaddingLeft()-clock.getPaddingRight();
                if(width>available&&available>0)size*=available/width;
            }
            if(Math.abs(clock.getTextSize()-size)>.25f)clock.setTextSize(TypedValue.COMPLEX_UNIT_PX,size);
        }
        @Override public boolean onPreDraw(){refresh();renderClock();carrierVisibility();fitClock();return true;}
        void detach(){
            attached=false;FeatureSettings.removeSnapshotListener(listener);
            TextView clock=clock();if(clock!=null)clock.removeCallbacks(secondTick);secondsTicker=false;
            restoreSearch();
            View view=reference.get();if(view!=null)view.getViewTreeObserver().removeOnPreDrawListener(this);
            if(carrierManaged)try{listenCarrier(false);}catch(ReflectiveOperationException ignored){}
        }
    }
}
