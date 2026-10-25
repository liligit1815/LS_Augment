package ls.augment.com.hook;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.SeekBar;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.SystemUiOptions;
import ls.augment.com.AudioGainState;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Adds text to the upright native slider frame without changing its children or touch handling. */
final class ControlCenterSliderPercentHook {
    private static final String BRIGHTNESS = "com.zte.controlcenter.view.CCToggleSliderView";
    private static final String HORIZONTAL_BRIGHTNESS = "com.zte.controlcenter.view.ToggleSliderView";
    private static final String VOLUME = "com.zte.controlcenter.view.CCVolumeSliderView";
    private static final Map<View, State> STATES = new WeakHashMap<>();

    private ControlCenterSliderPercentHook() { }

    static int install(AugmentModule module, ClassLoader loader) {
        int count = hook(module, loader, BRIGHTNESS, "onFinishInflate", 0, null,
                (owner, args, result) -> { watch(owner, false); return PASS; });
        count += hook(module, loader, VOLUME, "onAttachedToWindow", 0, null,
                (owner, args, result) -> { watch(owner, true); return PASS; });
        count += hook(module, loader, HORIZONTAL_BRIGHTNESS, "onAttachedToWindow", 0, null,
                (owner, args, result) -> { watch(owner, false); return PASS; });
        return count;
    }

    private static void watch(Object owner, boolean volume) {
        if (!(owner instanceof View)) return;
        View view = (View) owner;
        State state = STATES.get(view);
        if (state == null) {
            state = new State(view, volume);
            STATES.put(view, state);
            view.addOnAttachStateChangeListener(state);
        }
        if (view.isAttachedToWindow()) state.attach();
    }


    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi
    private static View child(View view, String name) {
        int id = view.getResources().getIdentifier(name, "id", "com.android.systemui");
        return id == 0 ? null : view.findViewById(id);
    }


    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi
    private static boolean named(View view, String name) {
        int id = view.getResources().getIdentifier(name, "id", "com.android.systemui");
        return id != 0 && view.getId() == id;
    }

    private static final class State implements View.OnAttachStateChangeListener,
            ViewTreeObserver.OnPreDrawListener {
        final WeakReference<View> source;
        final boolean volume;
        final boolean horizontal;
        final String key;
        final Runnable settingsChanged = this::refreshSafely;
        WeakReference<ViewGroup> frame = new WeakReference<>(null);
        WeakReference<SeekBar> slider = new WeakReference<>(null);
        WeakReference<View> icon = new WeakReference<>(null);
        ViewTreeObserver observer;
        PercentLabel label;
        boolean attached, added;
        AudioGainStateClient.Watch gainWatch;
        String attemptedRange="",issuedNative="",presentationNative="";
        long issuedRequest,consumedRequest,presentedRequest;
        boolean gainSession,releasing;
        String nativeIdentity(){View v=source.get();return liveStream()+":"+field(v,"mMax")+":"+field(v,"mCurrentStreamLevel")+":"+field(v,"mTracking");}
        String nativeFence(){SeekBar s=slider.get();return nativeIdentity()+":"+(s==null?-1:s.getProgress());}
        void captureRequest(long request){issuedRequest=request;issuedNative=nativeFence();}
        void readDiagnostic(String stage,String value){View view=source.get();if(volume&&view!=null)try{FeatureSettings.diagnostic(view.getContext(),"ls_augment_audio_gain_read_cc_"+stage,value);}catch(RuntimeException ignored){}}
        int liveStream(){Object value=field(source.get(),"mCurStream");return value instanceof Integer?(Integer)value:-1;}
        void gainArrived(){
            View view=source.get();SeekBar seek=slider.get();AudioGainState state=gainWatch==null?null:gainWatch.state();
            if(state==null)readDiagnostic("packet","state_unavailable");
            if(attached&&view!=null&&seek!=null&&state!=null&&state.request==issuedRequest&&state.request>consumedRequest){
                readDiagnostic("packet","issued="+(state.request==issuedRequest)+";fence="+issuedNative.equals(nativeFence())+";native="+nativeIdentity()+";total="+state.total);
                consumedRequest=state.request;presentedRequest=0;
                // A new OEM event/gesture after request start owns the control. Never replay an older packet over it.
                if(state.stream==liveStream()&&issuedNative.equals(nativeFence())){
                    Object maximum=field(view,"mMax"),minimum=field(view,"mMin"),mode=field(view,"mAudioMode"),scale=field(view,"MAX_VALUE");
                    if(!Boolean.TRUE.equals(field(view,"mTracking"))&&maximum instanceof Integer&&minimum instanceof Integer&&(Integer)minimum==0&&mode instanceof Integer
                            &&scale instanceof Integer&&(Integer)scale==seek.getMax()&&seek.getMin()==0){
                        try{
                            String key=state.configuration+":"+state.device+":"+state.total;
                            if((Integer)maximum!=state.total&&!attemptedRange.equals(key)){attemptedRange=key;set(view,"mMax",state.total);maximum=field(view,"mMax");}
                            if((state.extended()||releasing)&&maximum instanceof Integer&&(Integer)maximum==state.total){
                                Object progress=call(view,"getCurrentProgress",state.current,state.total);
                                if(progress instanceof Integer&&(Integer)progress>=0&&(Integer)progress<=seek.getMax()){
                                    set(view,"mCurrentStreamLevel",state.current);
                                    call(view,"updateVolumeIcon",state.current);
                                    if(seek.getProgress()!=(Integer)progress)call(view,"updateVolumeProgress",progress,"module gain readback");
                                    gainSession=state.extended();if(releasing&&!state.extended())releasing=false;
                                }
                            }
                        }catch(ReflectiveOperationException ignored){}
                    }
                    presentedRequest=state.request;presentationNative=nativeIdentity();
                }
            }
            refreshSafely();
        }

        State(View view, boolean volume) {
            source = new WeakReference<>(view);
            this.volume = volume;
            horizontal = !volume && view.getClass().getName().equals(HORIZONTAL_BRIGHTNESS);
            key = volume ? SystemUiOptions.QS_VOLUME_PERCENT : SystemUiOptions.QS_BRIGHTNESS_PERCENT;
        }

        void attach() {
            if (attached) return;
            View view = source.get();
            if (view == null) return;
            // The native SeekBars are rotated 270 degrees. Draw in their upright
            // FrameLayout, not on the SeekBar where text would rotate as well.
            View holder = horizontal ? view : volume && view.getParent() instanceof View
                    ? (View) view.getParent() : child(view, "slider_frame");
            View seek = volume ? view : child(view, "slider");
            if (!(holder instanceof ViewGroup) || !(seek instanceof SeekBar)) return;
            // Only the two top-panel controls; expanded volume dialogs keep their own UI.
            if (volume ? !named(holder, "volume_slider") : !named(view, "brightness_slider")) return;
            View symbol = child(holder, volume ? "volume_icon" : "toggle");
            if (!horizontal && symbol == null) return;
            // The unified notification panel uses an unrotated native slider,
            // with its automatic-brightness button beside the track.
            if (horizontal && seek.getParent() != holder) return;
            frame = new WeakReference<>((ViewGroup) holder);
            slider = new WeakReference<>((SeekBar) seek);
            icon = new WeakReference<>(symbol);
            label = new PercentLabel();
            attached = true;
            observer = holder.getViewTreeObserver();
            observer.addOnPreDrawListener(this);
            FeatureSettings.addSnapshotListener(view.getContext(), settingsChanged);
            if(volume)gainWatch=new AudioGainStateClient.Watch(view,this::gainArrived,this::captureRequest);
            refreshSafely();
            if (!volume) FeatureSettings.diagnostic(view.getContext(),
                    "ls_augment_rm_qs_brightness_percent_runtime", "bound;adapter="
                            + view.getClass().getSimpleName() + ";orientation="
                            + (horizontal ? "horizontal" : "vertical"));
        }

        void refreshSafely() {
            try { refresh(); }
            catch (Throwable error) {
                // Listener callbacks run outside the hook interceptor: fail closed
                // here too so an incompatible layout cannot crash SystemUI.
                hide();
                View view = source.get();
                if (view != null) FeatureSettings.diagnostic(view.getContext(),
                        "ls_augment_rm_qs_percent_error", error.toString());
            }
        }

        void refresh() {
            ViewGroup holder = frame.get();
            SeekBar seek = slider.get();
            View symbol = icon.get();
            if (!attached || holder == null || seek == null || !horizontal && symbol == null) return;
            String fullBrightness = volume ? null : FullBrightnessHook.label(seek);
            boolean percentEnabled=FeatureSettings.enabled(holder.getContext(),key);
            int stream=volume?liveStream():-1;
            boolean supported=!ls.augment.com.AudioGainPolicy.stream(stream).isEmpty();
            boolean liveWanted=volume&&AudioGainState.wanted(FeatureSettings.snapshot(holder.getContext()),stream);
            if(volume&&gainWatch!=null){
                if(!supported){gainSession=false;releasing=false;}
                else if(gainSession&&!liveWanted)releasing=true;
                if(liveWanted)releasing=false;
                // One live off read restores a range previously synchronized from actual extension.
                gainWatch.bind(supported&&(liveWanted&&percentEnabled||releasing)?stream:-1);
            }
            if (fullBrightness == null && !percentEnabled) { hide(); return; }
            if(releasing){hide();return;}
            int percent = ControlCenterPercent.of(seek.getProgress(), seek.getMin(), seek.getMax());
            if (percent < 0 || holder.getWidth() <= 0 || holder.getHeight() <= 0) { hide(); return; }
            float density = holder.getResources().getDisplayMetrics().density;
            // Keep text above the sun/speaker, including when native resources
            // resize the first row on rotation. Leave enough room for 100%.
            // Some native configurations hide the automatic-brightness icon.
            // A GONE icon has no laid-out position; keep its percentage visible.
            float bottom = horizontal ? seek.getY() + seek.getHeight() / 2f
                    : symbol.getVisibility() != View.GONE && symbol.getHeight() > 0
                    ? symbol.getY() - 6f * density : holder.getHeight() / 2f + 7f * density;
            float available = horizontal ? seek.getHeight() - 8f * density : bottom - 6f * density;
            float size = Math.min(14f * holder.getResources().getDisplayMetrics().scaledDensity,
                    Math.min(available / 1.4f, (horizontal ? seek.getWidth() : holder.getWidth()) / 3.4f));
            if (size < 8f * density) { hide(); return; }
            String text = fullBrightness == null ? percent + "%" : fullBrightness;
            if(liveWanted){
                AudioGainState live=gainWatch==null?null:gainWatch.state();Object maximum=field(source.get(),"mMax"),minimum=field(source.get(),"mMin"),scale=field(source.get(),"MAX_VALUE");
                if(live==null||live.request!=presentedRequest||!presentationNative.equals(nativeIdentity())||!(maximum instanceof Integer)||(Integer)maximum!=live.total||!(minimum instanceof Integer)||(Integer)minimum!=0||!(scale instanceof Integer)||(Integer)scale!=seek.getMax()||seek.getMin()!=0){
                    readDiagnostic("present",live==null?"state_unavailable":"reject;request="+(live.request==presentedRequest)+";native="+presentationNative.equals(nativeIdentity())+";max="+maximum+";total="+live.total+";scale="+scale+";seek="+seek.getMin()+"/"+seek.getMax());hide();return;}
                readDiagnostic("present","ready;current="+live.current+";total="+live.total+";native="+nativeIdentity());
                if(live.extended())text=live.percent()+"%";
            }
            if (text.length() > 5) size = Math.min(size,holder.getWidth()/(text.length()*0.65f));
            float center = horizontal ? seek.getX() + seek.getWidth() / 2f : holder.getWidth() / 2f;
            label.update(text, holder.getWidth(), holder.getHeight(), center, bottom, size, density, horizontal);
            if (!added) { holder.getOverlay().add(label); added = true; }
        }

        void hide() {
            ViewGroup holder = frame.get();
            if (added && holder != null && label != null) holder.getOverlay().remove(label);
            added = false;
        }

        void detach() {
            attached = false;
            if(gainWatch!=null)gainWatch.close();gainWatch=null;attemptedRange="";issuedRequest=consumedRequest=presentedRequest=0;gainSession=releasing=false;
            FeatureSettings.removeSnapshotListener(settingsChanged);
            if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
            observer = null;
            hide();
            label = null;
            frame.clear(); slider.clear(); icon.clear();
        }

        @Override public boolean onPreDraw() { refreshSafely(); return true; }
        @Override public void onViewAttachedToWindow(View view) {
            try { attach(); }
            catch (Throwable error) {
                detach();
                FeatureSettings.diagnostic(view.getContext(), "ls_augment_rm_qs_percent_error", error.toString());
            }
        }
        @Override public void onViewDetachedFromWindow(View view) { detach(); }
    }

    private static final class PercentLabel extends Drawable {
        final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        final Paint outline = new Paint(Paint.ANTI_ALIAS_FLAG);
        String text = "";
        float x, baseline, bottom, textSize, density;

        PercentLabel() {
            paint.setTextAlign(Paint.Align.CENTER);
            paint.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        }

        void update(String next, int width, int height, float center, float bottom, float size, float density,
                boolean verticallyCentered) {
            if (next.equals(text) && getBounds().width() == width && getBounds().height() == height
                    && x == center && this.bottom == bottom && textSize == size && this.density == density) return;
            text = next; this.bottom = bottom; textSize = size; this.density = density;
            paint.setTextSize(size);
            // The native fill stays white in night mode too. Match its dark
            // icons; a light outline also keeps the unfilled portion readable.
            paint.setColor(0xff30343a);
            outline.set(paint);
            outline.setStyle(Paint.Style.STROKE);
            outline.setStrokeWidth(1.5f * density);
            outline.setColor(0xb0ffffff);
            x = center;
            Paint.FontMetrics metrics = paint.getFontMetrics();
            baseline = verticallyCentered ? bottom - (metrics.ascent + metrics.descent) / 2f
                    : bottom - metrics.descent;
            setBounds(0, 0, width, height);
            invalidateSelf();
        }

        @Override public void draw(Canvas canvas) {
            canvas.drawText(text, x, baseline, outline);
            canvas.drawText(text, x, baseline, paint);
        }
        @Override public void setAlpha(int alpha) {
            paint.setAlpha(alpha); outline.setAlpha(alpha * 176 / 255); invalidateSelf();
        }
        @Override public void setColorFilter(ColorFilter filter) {
            paint.setColorFilter(filter); outline.setColorFilter(filter); invalidateSelf();
        }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
