package ls.augment.com.hook;

import android.content.Context;
import android.media.AudioManager;
import android.widget.SeekBar;
import android.widget.TextView;
import android.view.View;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
import java.lang.reflect.*;
import ls.augment.com.AudioGainPolicy;
import ls.augment.com.AudioGainState;
import ls.augment.com.ConfigSchema;
import ls.augment.com.SystemUiOptions;

/** Keeps the existing volume panel's range in sync with the real extension. */
final class AudioGainUiHook {
    private static final WeakHashMap<View,GainBadge> BADGES=new WeakHashMap<>();
    private static final WeakHashMap<View,RowLabel> LABELS=new WeakHashMap<>();
    private static final WeakHashMap<View,LiveRow> LIVE_ROWS=new WeakHashMap<>();
    private static boolean settingsInstalled;
    private static final class LiveRow {
        final WeakReference<Object> row;final WeakReference<View> root;final int stream;final AudioGainStateClient.Watch watch;
        LiveRow(Object row,View root,int stream){this.row=new WeakReference<>(row);this.root=new WeakReference<>(root);this.stream=stream;
            watch=new AudioGainStateClient.Watch(root,()->{View view=this.root.get();Object owner=this.row.get();
                if(view!=null&&owner!=null&&LIVE_ROWS.get(view)==this)try{
                    if(field(owner,"view")!=view){stopLive(view);removeLabel(view);return;}
                    Object actualStream=field(owner,"stream");if(!(actualStream instanceof Integer)||(Integer)actualStream!=stream){stopLive(view);updateRow(view.getContext(),owner);return;}
                    updateVolumeLabel(view.getContext(),owner,view,stream);
                }catch(ReflectiveOperationException ignored){removeLabel(view);}});}
    }
    private static void stopLive(View root){LiveRow old=LIVE_ROWS.remove(root);if(old!=null)old.watch.close();}
    private static String livePercent(Context context,Object row,View root,int stream,int current,int total){
        LiveRow live=LIVE_ROWS.get(root);if(live==null||live.row.get()!=row||live.stream!=stream){stopLive(root);live=new LiveRow(row,root,stream);LIVE_ROWS.put(root,live);}
        live.watch.bind(stream);AudioGainState state=live.watch.state();
        volumeDiagnostic(context,"live_"+diagnosticStream(stream),state==null?"state_unavailable":"current_match="+(state.current==current)+";total_match="+(state.total==total)+";native="+current+"/"+total+";packet="+state.current+"/"+state.total);
        if(state==null||state.current!=current||state.total!=total)return "";
        return state.extended()||FeatureSettings.enabled(context,SystemUiOptions.QS_VOLUME_PERCENT)?state.percent()+"%":"";
    }
    private static String stepsKey(int stream){
        String name=stream==AudioManager.STREAM_VOICE_CALL?"call":stream==AudioManager.STREAM_RING?"ring"
                :stream==AudioManager.STREAM_MUSIC?"media":stream==AudioManager.STREAM_ALARM?"alarm"
                :stream==AudioManager.STREAM_NOTIFICATION?"notification":"";
        return name.isEmpty()?"":"ls_augment_rm_audio_steps_"+name+"_enabled";
    }
    private static boolean customSteps(Context context,int stream){
        String key=stepsKey(stream);return !key.isEmpty()&&FeatureSettings.enabled(context,key);
    }
    static synchronized void installSettings(AugmentModule module,ClassLoader loader){
        if(settingsInstalled)return;
        try{
            Class<?> preference=Class.forName("com.android.settings.notification.VolumeSeekBarPreference",false,loader);
            Class<?> holder=Class.forName("androidx.preference.PreferenceViewHolder",false,loader);
            Method bind=preference.getDeclaredMethod("onBindViewHolder",holder);bind.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(bind,"audio.steps.settings.range",false).intercept(chain->{
                Object result=chain.proceed();
                try{syncSettingsRange(chain.getThisObject());}catch(ReflectiveOperationException|RuntimeException ignored){}
                return result;
            }));
            module.deoptimize(bind);
            settingsInstalled=true;
        }catch(Throwable error){module.logFeatureError("AUDIO_STEPS_SETTINGS_RANGE_INSTALL",error);}
    }
    private static void syncSettingsRange(Object preference)throws ReflectiveOperationException{
        Object streamValue=field(preference,"mStream"),sliderValue=field(preference,"mSeekBar");
        Object managerValue=field(preference,"mAudioManager"),volumizer=field(preference,"mVolumizer");
        if(!(streamValue instanceof Integer)||!(sliderValue instanceof SeekBar)||!(managerValue instanceof AudioManager)||volumizer==null)return;
        int stream=(Integer)streamValue;
        if(stepsKey(stream).isEmpty())return;
        SeekBar slider=(SeekBar)sliderValue;
        if(!"com.zte.mifavor.widget.ColorSeekBarZTE".equals(slider.getClass().getName()))return;
        Object multipleValue=field(volumizer,"mMultiple"),boundMaximum=field(volumizer,"mMaxStreamVolume");
        Object minimumValue=field(slider,"mMin"),maximumValue=field(slider,"mMax");
        if(!(multipleValue instanceof Integer)||!(boundMaximum instanceof Integer)||!(minimumValue instanceof Float)||!(maximumValue instanceof Float))return;
        int multiple=(Integer)multipleValue,actualMaximum=((AudioManager)managerValue).getStreamMaxVolume(stream);
        if(multiple<=0||actualMaximum<=0||(Integer)boundMaximum!=actualMaximum)return;
        float minimum=(Float)minimumValue,maximum=actualMaximum*(float)multiple;
        if(slider.getMax()!=maximum||minimum>=maximum||Float.compare((Float)maximumValue,maximum)==0)return;
        // OEM binding fixes the integer max but leaves drawing/touch on a
        // hardcoded float range. Use the applied stream, even before an OFF
        // setting's required reboot, and preserve its native minimum/callback.
        slider.getClass().getMethod("setRange",float.class,float.class).invoke(slider,minimum,maximum);
        invoke(volumizer,"updateSeekBar");
    }
    static void install(AugmentModule module, ClassLoader loader) {
        try {
            Class<?> controller=Class.forName("com.android.systemui.volume.VolumeDialogControllerImpl",false,loader);
            Method update=controller.getDeclaredMethod("updateStreamLevelW",int.class,int.class);
            update.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(update,"audio.gain.panel.range",false).intercept(chain->{
                Object owner=chain.getThisObject();int stream=(Integer)chain.getArg(0);
                Object result=chain.proceed();
                if(AudioGainPolicy.stream(stream).isEmpty()&&!customSteps(FeatureSettings.from(owner),stream))return result;
                try {
                    Object state=invoke(owner,"streamStateW",stream);
                    Field max=state.getClass().getDeclaredField("levelMax");max.setAccessible(true);
                    int old=max.getInt(state), next=(Integer)invoke(owner,"getAudioManagerStreamMaxVolume",stream);
                    max.setInt(state,next);
                    return Boolean.TRUE.equals(result)||old!=next;
                }catch(Throwable ignored){return result;}
            }));
        }catch(Throwable e){module.logFeatureError("AUDIO_GAIN_PANEL_RANGE_INSTALL",e);}
        // Range adaptation must not prevent the independent percentage feature
        // from installing when a ROM changes its controller implementation.
        for(String name:new String[]{"com.android.systemui.volume.VolumeDialogImpl","com.zte.feature.volume.MfvVolumeDialogImpl","com.zte.feature.volume.VertuVolumeDialogImpl"})try {
            Class<?> dialog=Class.forName(name,false,loader);
            for(Method m:dialog.getDeclaredMethods())if((m.getName().equals("updateVolumeRowH")&&m.getParameterCount()==1)
                    ||m.getName().equals("showH")||m.getName().equals("updateRowsH")||m.getName().equals("updateExpandedH")){
                m.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(m,"audio.gain.panel.percent."+dialog.getSimpleName()+"."+m.getName()+"."+m.getParameterCount(),false).intercept(chain->{
                    Object result=chain.proceed();
                    try {
                        Context context=(Context)field(chain.getThisObject(),"mContext");
                        if(m.getName().equals("updateVolumeRowH"))updateRow(context,chain.getArg(0));
                        else{
                            Object rows=field(chain.getThisObject(),"mRows");
                            if(rows instanceof Iterable<?>)for(Object row:(Iterable<?>)rows)updateRow(context,row);
                        }
                    }catch(Throwable error){volumeDiagnostic(FeatureSettings.from(chain.getThisObject()),"error",m.getDeclaringClass().getSimpleName()+"."+m.getName()+":"+error.getClass().getSimpleName());}
                    return result;
                }));
                module.deoptimize(m);
            }
        }catch(ClassNotFoundException optional){}
        catch(Throwable e){module.logFeatureError("AUDIO_GAIN_PANEL_INSTALL",e);}
    }
    private static void updateRow(Context context,Object row)throws ReflectiveOperationException{
        Object stream=field(row,"stream"),view=field(row,"view");
        if(stream instanceof Integer&&view instanceof View)updateVolumeLabel(context,row,(View)view,(Integer)stream);
        else volumeDiagnostic(context,"error","row_contract:stream="+(stream!=null)+";view="+(view instanceof View));
    }
    private static void updateVolumeLabel(Context context,Object row,View root,int stream) throws ReflectiveOperationException {
        if(root==null)return;
        Object header=field(row,"header");
        TextView title=header instanceof TextView?(TextView)header:null;
        String label=title==null?"":title.getText().toString().replaceFirst("(?: · [0-9]+ / [0-9]+ 档)?(?: · [0-9]+%)?$","");
        Object state=field(row,"ss"),level=field(state,"level"),maximum=field(state,"levelMax");
        if(!(level instanceof Integer)||!(maximum instanceof Integer)||(Integer)maximum<=0){
            volumeDiagnostic(context,"row_"+diagnosticStream(stream),"invalid_state;state="+(state!=null)+";level="+level+";max="+maximum);
            stopLive(root);removeLabel(root);
            if(title!=null&&!label.contentEquals(title.getText()))title.setText(label);
            return;
        }
        // All five custom streams use the actual maximum, including any active
        // gain extension. Never substitute a requested, not-yet-applied setting.
        int total=(Integer)maximum;
        int current=Boolean.TRUE.equals(field(state,"muted"))?0:Math.max(0,Math.min(total,(Integer)level));
        String steps=customSteps(context,stream)?current+" / "+total:"";
        boolean liveWanted=AudioGainState.wanted(FeatureSettings.snapshot(context),stream);
        String percent=liveWanted?livePercent(context,row,root,stream,current,total):"";
        if(!liveWanted)stopLive(root);
        if(!liveWanted&&FeatureSettings.enabled(context,SystemUiOptions.QS_VOLUME_PERCENT))
            percent=Math.round(current*100f/total)+"%";
        String text=percent.isEmpty()?steps:percent;
        Object number=field(row,"number");
        volumeDiagnostic(context,"row_"+diagnosticStream(stream),"level="+current+"/"+total+";text="+text+";number="+(number instanceof TextView)
                +";attached="+root.isAttachedToWindow()+";size="+root.getWidth()+"x"+root.getHeight()+";root="+root.getClass().getSimpleName());
        // Visibility can change after the state update: OEM expand/collapse
        // animations hide containers and relayout rows without changing volume.
        if(text.isEmpty())removeLabel(root);
        else{
            RowLabel owned=LABELS.get(root);
            if(owned==null){owned=new RowLabel(root);LABELS.put(root,owned);}
            Object slider=field(row,"slider"),footer=field(row,"icon");
            owned.update(slider instanceof View?(View)slider:null,number instanceof TextView?(TextView)number:null,
                    footer instanceof View?(View)footer:null,text);
        }
        String heading=label+(steps.isEmpty()?"":" · "+steps+" 档");
        if(title!=null&&!heading.contentEquals(title.getText()))title.setText(heading);
    }
    private static void showBadge(View root,View slider,View footer,String text){
        GainBadge badge=BADGES.get(root);
        if(badge!=null&&(badge.slider.get()!=slider||badge.footer.get()!=footer)){removeBadge(root);badge=null;}
        boolean created=badge==null;
        if(created){
            badge=new GainBadge(root,slider,footer);BADGES.put(root,badge);
            root.addOnLayoutChangeListener(badge);root.getOverlay().add(badge);
        }
        // Pre-draw checks must not schedule another frame when nothing changed.
        if(created||!text.equals(badge.text)){badge.text=text;badge.resize();badge.invalidateSelf();}
        badge.updateGeometry();
    }
    private static void removeBadge(View root){
        GainBadge badge=BADGES.remove(root);
        if(badge!=null){root.removeOnLayoutChangeListener(badge);root.getOverlay().remove(badge);}
    }
    private static void removeLabel(View root){RowLabel label=LABELS.remove(root);if(label!=null)label.close();else removeBadge(root);}
    private static String diagnosticStream(int stream){return stream>=0&&stream<=10?Integer.toString(stream):"remote";}
    private static void volumeDiagnostic(Context context,String suffix,String value){
        try{FeatureSettings.diagnostic(context,"ls_augment_volume_percent_"+suffix,value);}catch(RuntimeException ignored){}
    }
    /** No configuration reads or reflection in pre-draw; only cached presentation state. */
    private static final class RowLabel implements ViewTreeObserver.OnPreDrawListener,View.OnAttachStateChangeListener{
        final WeakReference<View> root;
        WeakReference<View> slider=new WeakReference<>(null);
        WeakReference<View> footer=new WeakReference<>(null);
        WeakReference<TextView> number=new WeakReference<>(null);
        WeakReference<ViewTreeObserver> observer=new WeakReference<>(null);
        String text="",applied="";CharSequence nativeText;
        RowLabel(View root){this.root=new WeakReference<>(root);root.addOnAttachStateChangeListener(this);observe(root);}
        void update(View slider,TextView number,View footer,String text){
            if(this.number.get()!=number){restoreNumber();this.number=new WeakReference<>(number);nativeText=null;applied="";}
            this.slider=new WeakReference<>(slider);this.footer=new WeakReference<>(footer);this.text=text;sync();
        }
        void observe(View view){
            stopObserving();if(!view.isAttachedToWindow())return;
            ViewTreeObserver tree=view.getViewTreeObserver();if(tree.isAlive()){tree.addOnPreDrawListener(this);observer=new WeakReference<>(tree);}
        }
        void stopObserving(){ViewTreeObserver tree=observer.get();if(tree!=null&&tree.isAlive())tree.removeOnPreDrawListener(this);observer.clear();}
        void sync(){
            View view=root.get();if(view==null||text.isEmpty())return;
            TextView target=number.get();
            if(visibleNumber(target)){
                removeBadge(view);CharSequence current=target.getText();
                if(!applied.contentEquals(current)){nativeText=current;}
                if(!text.contentEquals(current))target.setText(text);applied=text;
            }else if(view.isAttachedToWindow())showBadge(view,slider.get(),footer.get(),text);
        }
        boolean visibleNumber(TextView target){
            if(target==null||!target.isShown()||target.getWidth()<=0||target.getHeight()<=0)return false;
            for(View view=target;view!=null;){
                if(view.getAlpha()<=0)return false;
                ViewParent parent=view.getParent();view=parent instanceof View?(View)parent:null;
            }
            Rect bounds=new Rect();return target.getGlobalVisibleRect(bounds)&&bounds.width()>0&&bounds.height()>0;
        }
        void restoreNumber(){TextView target=number.get();if(target!=null&&nativeText!=null&&applied.contentEquals(target.getText()))target.setText(nativeText);}
        @Override public boolean onPreDraw(){try{sync();}catch(RuntimeException ignored){}return true;}
        @Override public void onViewAttachedToWindow(View view){observe(view);onPreDraw();}
        @Override public void onViewDetachedFromWindow(View view){stopObserving();removeBadge(view);}
        void close(){stopObserving();restoreNumber();View view=root.get();if(view!=null){view.removeOnAttachStateChangeListener(this);removeBadge(view);}}
    }
    private static final class GainBadge extends Drawable implements View.OnLayoutChangeListener {
        final WeakReference<View> root,slider,footer;final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);String text="",lastDraw="";int drawReports;
        final Rect lastRow=new Rect(),lastSlider=new Rect(),nextRow=new Rect(),nextSlider=new Rect(),lastFooter=new Rect(),nextFooter=new Rect();
        final Point lastOrigin=new Point(),nextOrigin=new Point();
        boolean geometryKnown,lastRowVisible,lastSliderVisible,lastFooterVisible;
        GainBadge(View root,View slider,View footer){this.root=new WeakReference<>(root);this.slider=new WeakReference<>(slider);this.footer=new WeakReference<>(footer);paint.setTextAlign(Paint.Align.CENTER);paint.setTypeface(Typeface.create("sans-serif-medium",Typeface.NORMAL));}
        void resize(){View r=root.get();if(r!=null)setBounds(0,0,Math.max(1,r.getWidth()),Math.max(1,r.getHeight()));}
        @Override public void onLayoutChange(View view,int left,int top,int right,int bottom,int oldLeft,int oldTop,int oldRight,int oldBottom){resize();invalidateSelf();}
        void updateGeometry(){
            View r=root.get(),i=slider.get(),f=footer.get();if(r==null||i==null)return;
            nextRow.set(0,0,0,0);nextSlider.set(0,0,0,0);nextFooter.set(0,0,0,0);nextOrigin.x=nextOrigin.y=0;
            boolean rowVisible=r.getGlobalVisibleRect(nextRow,nextOrigin),sliderVisible=i.getGlobalVisibleRect(nextSlider);
            boolean footerVisible=f!=null&&f.getGlobalVisibleRect(nextFooter);
            // OEM expansion animates ancestors, not the individual row. If the
            // first recording was clipped, that empty RenderNode otherwise
            // survives the animation. Re-record only when geometry changes.
            boolean changed=!geometryKnown||rowVisible!=lastRowVisible||sliderVisible!=lastSliderVisible||footerVisible!=lastFooterVisible
                    ||!sameRect(lastRow,nextRow)||!sameRect(lastSlider,nextSlider)||!sameRect(lastFooter,nextFooter)
                    ||lastOrigin.x!=nextOrigin.x||lastOrigin.y!=nextOrigin.y;
            geometryKnown=true;lastRowVisible=rowVisible;lastSliderVisible=sliderVisible;lastFooterVisible=footerVisible;
            lastRow.set(nextRow.left,nextRow.top,nextRow.right,nextRow.bottom);
            lastSlider.set(nextSlider.left,nextSlider.top,nextSlider.right,nextSlider.bottom);
            lastFooter.set(nextFooter.left,nextFooter.top,nextFooter.right,nextFooter.bottom);
            lastOrigin.x=nextOrigin.x;lastOrigin.y=nextOrigin.y;
            if(changed)invalidateSelf();
        }
        boolean sameRect(Rect a,Rect b){return a.left==b.left&&a.top==b.top&&a.right==b.right&&a.bottom==b.bottom;}
        void reportDraw(View view,String state){
            if(view==null||drawReports>=6||lastDraw.equals(state))return;lastDraw=state;drawReports++;
            volumeDiagnostic(view.getContext(),"draw_"+diagnosticStream(view.getId()),state);
        }
        @Override public void draw(Canvas canvas){View r=root.get(),i=slider.get();if(r==null||i==null||text.isEmpty()){reportDraw(r,"missing_slider_or_text");return;}
            float d=r.getResources().getDisplayMetrics().density;
            // Both rectangles must use the root view's coordinates. The OEM
            // dialog is a floating window, so getLocationOnScreen also includes
            // the window offset and would move the slider outside its row.
            // globalOffset preserves the local origin even if the row is clipped.
            Rect bounds=new Rect(),rowVisible=new Rect();Point origin=new Point();
            if(!r.getGlobalVisibleRect(rowVisible,origin)){reportDraw(r,"row_not_visible");return;}
            if(!i.getGlobalVisibleRect(bounds)){reportDraw(r,"slider_not_visible;root="+r.getWidth()+"x"+r.getHeight());return;}
            bounds.offset(-origin.x,-origin.y);
            if(!bounds.intersect(0,0,r.getWidth(),r.getHeight())){reportDraw(r,"outside_row;root="+r.getWidth()+"x"+r.getHeight()+";slider="+bounds.toShortString());return;}
            // Mfv's rotated ColorSeekBar has a 20dp track inside a 56dp row.
            // Fitting text to the track made it <6dp and skipped every draw.
            // Use the row's space around the track center, while keeping the
            // native slider as the vertical anchor and clear of the speaker.
            float center=bounds.exactCenterX(),available=2*Math.min(center-4*d,r.getWidth()-4*d-center);
            if(available<=0){reportDraw(r,"no_room;root="+r.getWidth()+"x"+r.getHeight()+";slider="+bounds.toShortString());return;}
            paint.setTextSize(11*r.getResources().getDisplayMetrics().scaledDensity);
            float textWidth=paint.measureText(text);
            if(textWidth>available)paint.setTextSize(paint.getTextSize()*available/textWidth);
            paint.setColor(0xff20242a);paint.setShadowLayer(d,0,0,0xe6ffffff);
            float baseline=Math.max(bounds.top-paint.ascent(),bounds.bottom-8*d-paint.descent());
            // Keep the label outside the thumb's complete travel range. In the
            // OEM panel the footer icon leaves a small gap below the track.
            // Fit the glyph height there, including space for its shadow.
            View f=footer.get();Rect footerBounds=new Rect();boolean inFooterGap=false;
            if(f!=null){
                if(!f.getGlobalVisibleRect(footerBounds)){reportDraw(r,"footer_not_visible");return;}
                footerBounds.offset(-origin.x,-origin.y);
                float gapTop=bounds.bottom+d,gapBottom=Math.min(r.getHeight(),footerBounds.top)-d;
                if(gapBottom<=gapTop){reportDraw(r,"footer_gap_clipped");return;}
                float glyphHeight=paint.descent()-paint.ascent();
                if(glyphHeight>gapBottom-gapTop)paint.setTextSize(paint.getTextSize()*(gapBottom-gapTop)/glyphHeight);
                baseline=(gapTop+gapBottom-paint.ascent()-paint.descent())/2;
                inFooterGap=true;
            }
            canvas.drawText(text,center,baseline,paint);
            reportDraw(r,"drawn;root="+r.getWidth()+"x"+r.getHeight()+";slider="+bounds.toShortString()+";textSize="+paint.getTextSize()+";text="+text+";footerGap="+inFooterGap+";baseline="+baseline);
        }
        @Override public void setAlpha(int alpha){paint.setAlpha(alpha);}
        @Override public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);}
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
    private static Object field(Object owner,String name) throws ReflectiveOperationException {
        if(owner==null)return null;
        for(Class<?> c=owner.getClass();c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f.get(owner);}catch(NoSuchFieldException ignored){}
        return null;
    }
    private static Object invoke(Object owner,String name,Object...args) throws ReflectiveOperationException {
        for(Class<?> c=owner.getClass();c!=null;c=c.getSuperclass())for(Method m:c.getDeclaredMethods())if(m.getName().equals(name)&&m.getParameterCount()==args.length){m.setAccessible(true);return m.invoke(owner,args);}
        throw new NoSuchMethodException(name);
    }
}
