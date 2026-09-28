package ls.augment.com.hook;

import android.graphics.Canvas;
import android.os.SystemClock;
import android.text.TextPaint;
import android.view.View;
import android.widget.TextView;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** OEM launcher collapse must not parse custom clock text or hide grid cooling icons. */
final class StatusBarRecentsHook {
    private static final String CLOCK = "com.zte.feature.statusbar.clock.StatusBarClockFeature";
    private static final String COOLING = "com.zte.feature.statusbar.RedMagicFunctionIconFeature";
    private static final String LAUNCHER = "com.zte.adapt.mifavor.navbar.LauncherProxyServiceAdapt";
    private static long clockHits, coolingHits, lastClockReport, lastCoolingReport;

    static int install(AugmentModule module, ClassLoader loader) {
        int installed=0;
        try {
            Method draw=Class.forName(CLOCK,false,loader).getDeclaredMethod("handleOnDraw",
                    TextView.class,Canvas.class,TextPaint.class);
            if(draw.getReturnType()!=boolean.class)throw new NoSuchMethodException("clock draw result");
            draw.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(draw,"systemui.recents.custom_clock_draw",true)
                    .intercept(chain->{
                        TextView clock=(TextView)chain.getArg(0);
                        if(!StatusBarGridHook.ownsRecentsContent(clock,true))return chain.proceed();
                        // false tells Clock.onDraw to use TextView.onDraw. Do not enter the
                        // OEM path: it translates the Canvas before returning false, and
                        // its time-part parser still uses the original format string.
                        record(clock,true);
                        return false;
                    }));
            installed++;
        } catch(Throwable error) {module.logFeatureError("STATUSBAR_RECENTS_CLOCK_UNAVAILABLE",error);}
        try {
            Class<?> owner=Class.forName(COOLING,false,loader);
            Method hide=owner.getDeclaredMethod("hideView",int.class,boolean.class);
            Field container=owner.getDeclaredField("mIconContainer");
            if(hide.getReturnType()!=void.class||!View.class.isAssignableFrom(container.getType()))
                throw new NoSuchMethodException("cooling container contract");
            hide.setAccessible(true);container.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(hide,"systemui.recents.cooling_visibility",true)
                    .intercept(chain->{
                        // Only the launcher's INVISIBLE request is suppressed. Heads-up,
                        // keyguard and real fan/liquid-cooling state updates remain native.
                        if(Integer.valueOf(View.INVISIBLE).equals(chain.getArg(0))
                                &&fromLauncher(Thread.currentThread().getStackTrace())){
                            View view=(View)container.get(chain.getThisObject());
                            if(StatusBarGridHook.ownsRecentsContent(view,false)){
                                record(view,false);
                                return null;
                            }
                        }
                        return chain.proceed();
                    }));
            installed++;
        } catch(Throwable error) {module.logFeatureError("STATUSBAR_RECENTS_COOLING_UNAVAILABLE",error);}
        module.logFeatureInfo("STATUSBAR_RECENTS_READY hooks="+installed+" build="+ls.augment.com.BuildConfig.VERSION_CODE);
        return installed;
    }

    static boolean fromLauncher(StackTraceElement[] stack) {
        for(StackTraceElement frame:stack){
            String name=frame.getClassName();
            if(name.equals(LAUNCHER)||name.startsWith(LAUNCHER+"$"))return true;
        }
        return false;
    }

    private static void record(View view,boolean clock) {
        long now=SystemClock.elapsedRealtime();
        if(clock){clockHits++;if(now-lastClockReport<5000)return;lastClockReport=now;}
        else {coolingHits++;if(now-lastCoolingReport<5000)return;lastCoolingReport=now;}
        FeatureSettings.diagnostic(view.getContext(),"ls_augment_statusbar_recents_"+(clock?"clock":"cooling"),
                "build="+ls.augment.com.BuildConfig.VERSION_CODE+";hits="+(clock?clockHits:coolingHits)
                        +";mode="+(clock?"native_textview":"preserve_launcher_visibility"));
    }
}
