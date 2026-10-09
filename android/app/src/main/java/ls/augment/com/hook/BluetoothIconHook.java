package ls.augment.com.hook;

import android.graphics.Canvas;
import android.graphics.RectF;
import android.content.res.ColorStateList;
import android.widget.ImageView;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import java.util.Collections;
import java.util.Set;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.BluetoothIconPainter;
import ls.augment.com.ConfigSchema;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Uses the OEM's selected device and percentage; never performs Bluetooth IPC in draw. */
final class BluetoothIconHook {
    private static final String ICON="com.android.systemui.statusbar.StatusBarIconView";
    private static final String OEM="com.zte.feature.bluetooth.BluetoothPolicyFeature";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final Set<View> VIEWS=Collections.newSetFromMap(new WeakHashMap<>());
    private static final Map<View,Integer> NATIVE_WIDTHS=new WeakHashMap<>();
    private static final Map<View,Integer> REFRESH_KEYS=new WeakHashMap<>();
    private static final BluetoothIconPainter PAINTER=new BluetoothIconPainter();
    private static volatile int battery=-1;
    private static int renderedStyle=-1,renderedBattery=-2,renderedColor;
    private static boolean observing;

    static int install(AugmentModule module,ClassLoader loader){
        int count=hookNamed(module,loader,"bluetooth",OEM,"updateBluetoothWithLevelInner",1,null,(o,a,r)->{
            int value=(Integer)a[0];battery=value>=0&&value<=100?value:-1;
            StatusBarAssetsHook.bluetoothBattery(battery);
            FeatureSettings.diagnostic(context(o),"ls_augment_bluetooth_battery","level="+battery+";source=oem_selected_device");
            MAIN.post(BluetoothIconHook::refresh);return PASS;
        });
        count+=hookNamed(module,loader,"bluetooth",OEM,"handleBluetoothStateChanged",1,null,(o,a,r)->{
            if(Boolean.FALSE.equals(a[0])){battery=-1;StatusBarAssetsHook.bluetoothBattery(-1);MAIN.post(BluetoothIconHook::refresh);}return PASS;
        });
        count+=hookNamed(module,loader,"bluetooth",ICON,"set",1,null,(o,a,r)->{
            if(o instanceof View&&isBluetooth(o))remember(o);
            return PASS;
        });
        count+=hookNamed(module,loader,"bluetooth",ICON,"onMeasure",2,(o,a,r)->{
            if(!(o instanceof View)||!isBluetooth(o))return PASS;
            View view=(View)o;remember(o);updateWidth(view);
            if(style(view)!=0&&battery>=0&&view.getLayoutParams()!=null){
                int width=view.getLayoutParams().width;
                if(width>0)a[0]=View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY);
            }
            return PASS;
        },(o,a,r)->{
            if(o instanceof View&&isBluetooth(o)&&style((View)o)!=0&&battery>=0){
                View view=(View)o;
                // OEM onMeasure multiplies system-icon width by its bitmap scale;
                // our vector viewport already includes its visual size.
                call(view,"setMeasuredDimension",View.MeasureSpec.getSize((Integer)a[0]),view.getMeasuredHeight());
            }
            return PASS;
        });
        count+=hookNamed(module,loader,"bluetooth",ICON,"onDraw",1,(o,a,r)->{
            if(!(o instanceof View)||!isBluetooth(o))return PASS;
            View view=(View)o;int style=style(view);if(style==0)return PASS;
            // Let the OEM draw its overflow dot and animate transitions normally.
            Object amount=field(o,"mIconAppearAmount"),state=field(o,"mVisibleState");
            if(!(amount instanceof Number)||((Number)amount).floatValue()!=1f
                    ||!(state instanceof Number)||((Number)state).intValue()!=0)return PASS;
            // ICON uses dotAppearAmount=2 on this ROM (DOT=1, HIDDEN=0).
            // Testing it against zero rendered a stretched native bitmap instead.
            int color=iconColor(view);
            float density=view.getResources().getDisplayMetrics().density;
            float h=Math.min(view.getHeight(),18*density);
            PAINTER.setTypeface(StatusBarAssetsHook.typeface(view,"bluetooth",null));
            PAINTER.setArtwork((canvas,id,layer,l,t,right,b,tint)->StatusBarAssetsHook.drawLayer(view,canvas,id,layer,l,t,right,b,tint));
            try{PAINTER.draw((Canvas)a[0],view.getPaddingLeft(),(view.getHeight()-h)/2,
                    view.getWidth()-view.getPaddingLeft()-view.getPaddingRight(),h,style,battery,color);}
            finally{PAINTER.setArtwork(null);}
            if(renderedStyle!=style||renderedBattery!=battery||renderedColor!=color){
                renderedStyle=style;renderedBattery=battery;renderedColor=color;
                FeatureSettings.diagnostic(view.getContext(),"ls_augment_bluetooth_rendered",
                        "art=reference-v3;style="+style+";level="+battery+";color="+Integer.toHexString(color));
            }
            return null;
        },null);
        return count;
    }
    private static boolean isBluetooth(Object view){return "bluetooth".equals(field(view,"mSlot"));}
    private static int iconColor(View view){
        Object current=field(view,"mCurrentSetColor");
        if(current instanceof Integer&&(Integer)current!=0)return (Integer)current;
        // Phone icons receive their native palette through ImageView tint;
        // mCurrentSetColor stays zero there. QS uses the explicit drawable color.
        if(view instanceof ImageView){
            ColorStateList tint=((ImageView)view).getImageTintList();
            if(tint!=null)return tint.getColorForState(view.getDrawableState(),tint.getDefaultColor());
        }
        for(String name:new String[]{"mDrawableColor","mDecorColor"}){
            Object tint=field(view,name);if(tint instanceof Integer&&(Integer)tint!=0)return (Integer)tint;
        }
        return 0xffffffff;
    }
    private static int style(View view){
        if(RedMagicLegacyUiHook.positionSizeOnly(view.getContext()))return 0;
        return FeatureSettings.integer(view.getContext(),ConfigSchema.STATUSBAR_BLUETOOTH_STYLE,0,0,2);
    }
    static android.graphics.Rect contentBounds(View view){
        if(!isBluetooth(view)||style(view)==0)return null;
        float density=view.getResources().getDisplayMetrics().density;
        float h=Math.min(view.getHeight(),18*density);
        int width=view.getWidth()-view.getPaddingLeft()-view.getPaddingRight();
        int selected=style(view);
        float viewport=BluetoothIconPainter.viewportWidth(selected,battery);
        float scale=Math.min(width/viewport,h/18);
        float left=view.getPaddingLeft()+(width-viewport*scale)/2;
        float top=(view.getHeight()-18*scale)/2;
        RectF ink=new RectF();BluetoothIconPainter.inkBounds(ink,selected,battery);
        return new android.graphics.Rect((int)Math.floor(left+ink.left*scale),(int)Math.floor(top+ink.top*scale),
                (int)Math.ceil(left+ink.right*scale),(int)Math.ceil(top+ink.bottom*scale));
    }
    private static void remember(Object owner){
        if(!(owner instanceof View)||!isBluetooth(owner))return;
        View view=(View)owner;
        if(VIEWS.add(view))REFRESH_KEYS.put(view,refreshKey(view));
        if(!observing)observing=FeatureSettings.addSnapshotListener(view.getContext(),()->MAIN.post(BluetoothIconHook::refresh));
    }
    private static void refresh(){
        for(View view:VIEWS){
            int key=refreshKey(view);Integer previous=REFRESH_KEYS.put(view,key);
            if(previous!=null&&previous==key)continue;
            boolean widthChanged=updateWidth(view);
            // OEM bitmap scaling is bypassed only while a known battery uses
            // our custom viewport. A sufficient native allocation can keep the
            // same LayoutParams width while this measurement mode changes.
            if(!widthChanged&&previous!=null&&customMeasure(previous)!=customMeasure(key))view.requestLayout();
            // Percentage updates redraw the same viewport. Only a style or
            // battery availability change affects the grid's painted bounds.
            if(previous==null||(previous>>8)!=(key>>8)
                    ||((previous&255)>0)!=((key&255)>0))StatusBarGridHook.invalidateLayout(view);
            view.invalidate();
        }
    }
    private static int refreshKey(View view){int selected=style(view);return (selected<<8)|(selected==0?0:battery+1);}
    private static boolean customMeasure(int key){return (key>>8)!=0&&(key&255)>0;}
    private static boolean updateWidth(View view){
        android.view.ViewGroup.LayoutParams params=view.getLayoutParams();if(params==null)return false;
        int style=style(view);Integer original=NATIVE_WIDTHS.get(view);
        if(style==0||battery<0){
            if(original!=null){NATIVE_WIDTHS.remove(view);if(params.width!=original){params.width=original;view.setLayoutParams(params);return true;}}return false;
        }
        if(original==null){original=params.width;NATIVE_WIDTHS.put(view,original);}
        int desired=Math.max(original,Math.round((style==2?48:36)*view.getResources().getDisplayMetrics().density));
        if(params.width!=desired){params.width=desired;view.setLayoutParams(params);return true;}
        return false;
    }
}
