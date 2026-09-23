package ls.augment.com;

import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

/** A fixed brand above a scrolling spacer; all fades are derived from scroll position. */
final class AboutHeaderMotion {
    private final UiKit ui;
    private final FrameLayout root;
    private final AboutScrollView scroll;
    private final LinearLayout page, hero, brand;
    private final TextView version, title;
    private final ImageView logo;
    private final View placeholder, hardware;
    private final LiquidGlassLayout navigation;
    private final ViewTreeObserver observer;
    private final DeviceInfoObserver deviceObserver;
    private final ViewTreeObserver.OnGlobalLayoutListener layoutListener = this::layout;
    private boolean disposed;
    private boolean restorePending=true;
    private final int initialScrollY;

    AboutHeaderMotion(UiKit ui, FrameLayout root, AboutScrollView scroll, LinearLayout page,
            LiquidGlassLayout navigation, View.OnClickListener onSystemVersionTap, int initialY) {
        this.ui=ui; this.root=root; this.scroll=scroll; this.page=page; this.navigation=navigation;
        initialScrollY=initialY;
        placeholder=new View(ui.activity); placeholder.setTag("about-motion-placeholder");
        placeholder.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        page.addView(placeholder,new LinearLayout.LayoutParams(-1,ui.dp(389)));
        hardware=ModuleAbout.appendCards(ui.activity,ui,page,onSystemVersionTap);
        // Touches pass to the ScrollView even when a drag begins on the fixed logo.
        hero=new LinearLayout(ui.activity) {
            @Override public boolean dispatchTouchEvent(MotionEvent event) { return false; }
        };
        hero.setTag("about-motion-hero"); hero.setOrientation(LinearLayout.VERTICAL);
        hero.setGravity(Gravity.CENTER_HORIZONTAL);
        brand=new LinearLayout(ui.activity); brand.setTag("about-motion-brand");
        brand.setOrientation(LinearLayout.VERTICAL); brand.setGravity(Gravity.CENTER_HORIZONTAL);
        logo=new ImageView(ui.activity); logo.setImageResource(R.drawable.ic_ls_augment_boat);
        logo.setScaleType(ImageView.ScaleType.FIT_CENTER);
        logo.setContentDescription("LS_Augment");
        logo.setFocusable(false); brand.addView(logo,new LinearLayout.LayoutParams(ui.dp(90),ui.dp(90)));
        TextView name=ui.text("LS_Augment",28,ui.text,true); name.setGravity(Gravity.CENTER);
        brand.addView(name,ui.margins(0,20,0,0)); hero.addView(brand,ui.wrap());
        version=ui.text(BuildConfig.VERSION_NAME+" | "+BuildConfig.BUILD_TYPE,12,ui.muted,false);
        version.setTag("about-motion-version"); version.setGravity(Gravity.CENTER);
        version.setSingleLine(true); version.setMinimumHeight(ui.dp(44));
        version.setFocusable(false);
        hero.addView(version,ui.margins(0,8,0,0));
        FrameLayout.LayoutParams hp=new FrameLayout.LayoutParams(-1,-2,Gravity.TOP|Gravity.CENTER_HORIZONTAL);
        hp.setMargins(ui.dp(20),ui.dp(95),ui.dp(20),0);
        root.addView(hero,root.indexOfChild(navigation),hp);
        title=ui.text("关于",17,ui.text,true); title.setTag("about-motion-title");
        title.setGravity(Gravity.CENTER);
        title.setBackground(new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,
                new int[]{ui.backgroundEnd,ui.backgroundEnd,ui.backgroundEnd&0x00ffffff}));
        root.addView(title,root.indexOfChild(navigation),new FrameLayout.LayoutParams(-1,ui.dp(56),Gravity.TOP));
        scroll.setAboutEnabled(true);
        scroll.setOnScrollChangeListener((v,x,y,oldX,oldY)->apply(y));
        scroll.setReboundListener(this::refreshGlass);
        scroll.setHeaderHitTest(null);
        scroll.setOnTouchListener(null);
        observer=root.getViewTreeObserver(); observer.addOnGlobalLayoutListener(layoutListener);
        deviceObserver=DeviceInfoObserver.watch(ui.activity,()-> {
            if(!disposed) { ModuleAbout.refreshDevice(ui.activity,hardware); refreshGlass(); }
        });
        apply(initialY);
    }

    private void layout() {
        if(disposed || scroll.getHeight()==0) return;
        boolean compact=scroll.getHeight()<ui.dp(600);
        int top=ui.dp(compact?28:95), logoSize=ui.dp(compact?64:90);
        FrameLayout.LayoutParams hp=(FrameLayout.LayoutParams)hero.getLayoutParams();
        if(hp.topMargin!=top) { hp.topMargin=top; hero.setLayoutParams(hp); }
        if(logo.getLayoutParams().height!=logoSize) {
            logo.setLayoutParams(new LinearLayout.LayoutParams(logoSize,logoSize));
        }
        int height=Math.max(top+hero.getMeasuredHeight()+ui.dp(32),
                scroll.getHeight()-page.getPaddingBottom()-page.getPaddingTop()-hardware.getMeasuredHeight()-ui.dp(12));
        if(!compact) height=Math.max(ui.dp(389),height);
        if(placeholder.getLayoutParams().height!=height) {
            placeholder.setLayoutParams(new LinearLayout.LayoutParams(-1,height));
        } else if(restorePending && placeholder.getHeight()==height && !page.isLayoutRequested()) {
            // Restore only after this adaptive spacer has its final measured height;
            // otherwise a saved bottom position is clamped to the temporary short list.
            // Use the normal layout callback, without holding up another Activity's draw.
            restorePending=false;
            scroll.scrollTo(0,initialScrollY);
            apply(scroll.getScrollY());
        }
    }

    void apply(int scrollY) {
        if(disposed) return;
        AboutMotionState state=AboutMotionState.at(scrollY,ui.activity.getResources().getDisplayMetrics().density);
        brand.setAlpha(state.brandAlpha); brand.setScaleX(state.brandScale); brand.setScaleY(state.brandScale);
        version.setAlpha(state.versionAlpha); version.setScaleX(state.versionScale); version.setScaleY(state.versionScale);
        title.setAlpha(state.titleVisible?1:0);
        // Before the ice background has faded, a solid toolbar would leave a seam
        // below the status bar. Its reading scrim is only needed as cards reach it.
        title.getBackground().setAlpha(state.backgroundAlpha<=.001f?255:0);
        title.setImportantForAccessibility(state.titleVisible?View.IMPORTANT_FOR_ACCESSIBILITY_YES:View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        brand.setImportantForAccessibility(state.brandAlpha>0?View.IMPORTANT_FOR_ACCESSIBILITY_AUTO:View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        setActionVisible(logo,state.brandAlpha>0);
        setActionVisible(version,state.versionAlpha>0);
        ui.appearance.setBackdropEmphasis(state.backgroundAlpha);
        refreshGlass();
    }
    private static void setActionVisible(View view,boolean visible) {
        view.setClickable(false); view.setFocusable(false);
        view.setImportantForAccessibility(visible?View.IMPORTANT_FOR_ACCESSIBILITY_YES:View.IMPORTANT_FOR_ACCESSIBILITY_NO);
    }
    private void refreshGlass() {
        if(disposed) return;
        for(int i=0;i<page.getChildCount();i++) {
            View child=page.getChildAt(i);
            if(child instanceof LiquidGlassLayout && child.getBottom()+page.getTranslationY()>scroll.getScrollY()
                    && child.getTop()+page.getTranslationY()<scroll.getScrollY()+scroll.getHeight()) {
                ((LiquidGlassLayout)child).refreshBackdrop();
            }
        }
        navigation.refreshBackdrop();
    }
    void dispose() {
        if(disposed) return; disposed=true;
        if(observer.isAlive()) observer.removeOnGlobalLayoutListener(layoutListener);
        deviceObserver.close();
        scroll.setOnScrollChangeListener(null); scroll.setOnTouchListener(null);
        scroll.setHeaderHitTest(null);
        scroll.setReboundListener(null); scroll.setAboutEnabled(false);
        root.removeView(hero); root.removeView(title); ui.appearance.setBackdropEmphasis(1);
    }
}
