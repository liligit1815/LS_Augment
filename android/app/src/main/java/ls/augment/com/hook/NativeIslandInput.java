package ls.augment.com.hook;

import android.view.ViewGroup;
import android.view.WindowManager;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Retire the input surface of an empty ordinary host, including completion-OFF startup. */
final class NativeIslandInput {
    static void releaseEmpty(Object permanent) throws Exception {
        if (!NativeIslandPanelCompat.ordinary(permanent)) return;
        Object persistent=field(permanent,"mDynamicPermanentContainer");
        Object transientViews=field(permanent,"mDynamicDisposableContainer");
        Object params=field(permanent,"mParams");
        if (!(persistent instanceof ViewGroup) || !(transientViews instanceof ViewGroup)
                || !(params instanceof WindowManager.LayoutParams)) return;
        if (((ViewGroup)persistent).getChildCount()!=0 || ((ViewGroup)transientViews).getChildCount()!=0
                || !Boolean.FALSE.equals(field(permanent,"mDynamicPanelShowing"))
                || Boolean.TRUE.equals(field(permanent,"mDynamicPanelClosing"))) return;
        if ((((WindowManager.LayoutParams)params).flags & WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE)==0)
            call(permanent,"updateWindowFlags",false);
    }
    private NativeIslandInput() { }
}
