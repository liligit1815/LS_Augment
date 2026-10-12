package ls.augment.com.hook;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Passive section labels and stack edges reuse the firmware's native views and backgrounds. */
final class NotificationStackDecor {
    private NotificationStackDecor() { }
    static ViewGroup create(ViewGroup host,String label)throws ReflectiveOperationException {
        int layout=host.getResources().getIdentifier("status_bar_notification_section_header","layout","com.android.systemui");
        // Resolve through the same OEM adapter as SectionHeaderNodeControllerImpl, never pin a resource ID.
        try {
            Class<?> adapter=Class.forName("com.zte.adapt.mifavor.notification.SectionHeaderNodeControllerImplAdapt",false,host.getContext().getClassLoader());
            Object companion=adapter.getField("Companion").get(null);
            layout=((Number)call(companion,"getSectionHeaderLayoutResId",layout)).intValue();
        }catch(ClassNotFoundException|NoSuchFieldException absent) { }
        if(layout==0)throw new IllegalStateException("Native notification section layout unavailable");
        View raw=LayoutInflater.from(host.getContext()).inflate(layout,host,false);
        if(!"com.android.systemui.statusbar.notification.stack.SectionHeaderView".equals(raw.getClass().getName())||!(raw instanceof ViewGroup))
            throw new IllegalStateException("Native notification section contract changed");
        ViewGroup header=(ViewGroup)raw;
        if(!(field(header,"mLabelView") instanceof TextView)||!(field(header,"mClearAllButton") instanceof ImageView))
            throw new IllegalStateException("Native notification section controls unavailable");
        header.setId(View.generateViewId());
        header.setTag("redmagic-duo-notification-stack");
        header.setOnClickListener(null);
        call(header,"setOnHeaderClickListener",(Object)null);
        call(header,"setOnClearAllClickListener",(Object)null);
        call(header,"setClearSectionButtonEnabled",false);
        call(header,"setVisible",true,false);
        ViewGroup.LayoutParams lp=header.getLayoutParams();
        int minimum=Math.round(48*host.getResources().getDisplayMetrics().density);
        if(lp==null)lp=new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,minimum);
        else if(lp.height>=0)lp.height=Math.max(lp.height,minimum);
        header.setMinimumHeight(minimum);
        header.setLayoutParams(lp);
        bind(header,label);
        // A section label created during pre-draw still needs its native measured height.
        Object sidePadding=field(host,"mSidePaddings");int side=sidePadding instanceof Number?((Number)sidePadding).intValue():0;
        if(host.getWidth()<=2*side)throw new IllegalStateException("Native notification viewport has not been measured");
        int width=host.getWidth()-2*side;
        int heightSpec=lp.height>=0?View.MeasureSpec.makeMeasureSpec(lp.height,View.MeasureSpec.EXACTLY):View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED);
        header.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),heightSpec);
        int left=(host.getWidth()-header.getMeasuredWidth())/2;
        header.layout(left,0,left+header.getMeasuredWidth(),header.getMeasuredHeight());
        if(header.getHeight()<=0)throw new IllegalStateException("Native notification section height unavailable");
        return header;
    }
    static void bind(ViewGroup header,String label) {
        TextView text=(TextView)field(header,"mLabelView");ImageView button=(ImageView)field(header,"mClearAllButton");
        if(!label.contentEquals(text.getText()))text.setText(label);
        header.setContentDescription(null);text.setContentDescription(null);
        header.setClickable(false);header.setFocusable(false);text.setClickable(false);
        button.setVisibility(View.GONE);button.setEnabled(false);button.setImageDrawable(null);
    }
    static Drawable backplate(View row) {
        Object normal=field(row,"mBackgroundNormal");Object value=field(normal,"mBackground");
        if(!(value instanceof Drawable))value=row.getBackground();
        if(!(value instanceof Drawable)||((Drawable)value).getConstantState()==null)return null;
        return new Backplates(row,((Drawable)value).getConstantState(),row.getResources().getDisplayMetrics().density);
    }
    static void position(Drawable drawable,View row,int height) {
        if(drawable instanceof Backplates) {
            Backplates plates=(Backplates)drawable;plates.height=height;
            View parent=row.getParent() instanceof View?(View)row.getParent():row;
            plates.setBounds(0,0,parent.getWidth(),parent.getHeight());plates.invalidateSelf();
        }
    }
    private static final class Backplates extends Drawable {
        final WeakReference<View> front;final WeakReference<android.view.ViewParent> parent;final Drawable first,second;final float density;int height;
        Backplates(View row,Drawable.ConstantState state,float density) {
            front=new WeakReference<>(row);parent=new WeakReference<>(row.getParent());first=state.newDrawable(row.getResources()).mutate();second=state.newDrawable(row.getResources()).mutate();this.density=density;
        }
        @Override public void draw(Canvas canvas) {
            View row=front.get();if(row==null||row.getParent()!=parent.get()||row.getParent()==null||row.getVisibility()!=View.VISIBLE||row.getAlpha()<=0f||height<=0)return;
            float bottom=row.getTranslationY()+height;
            int save=canvas.save();canvas.clipRect(row.getLeft(),bottom,row.getRight(),bottom+16*density);
            // Only the exposed edges paint. Notification content and its hit area remain the real row.
            drawLayer(canvas,second,row,12,16);drawLayer(canvas,first,row,6,8);canvas.restoreToCount(save);
        }
        private void drawLayer(Canvas canvas,Drawable shape,View row,int inset,int step) {
            int x=Math.round(inset*density),y=Math.round(row.getTranslationY()+step*density);
            shape.setBounds(row.getLeft()+x,y,row.getRight()-x,y+height);shape.setAlpha(Math.round(row.getAlpha()*255));shape.draw(canvas);
        }
        @Override public void setAlpha(int alpha){ }
        @Override public void setColorFilter(ColorFilter filter){ }
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
}
