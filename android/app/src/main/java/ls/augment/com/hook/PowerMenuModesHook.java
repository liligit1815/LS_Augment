package ls.augment.com.hook;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.net.Uri;
import android.view.*;
import android.widget.*;
import java.lang.reflect.*;
import ls.augment.com.SystemUiOptions;
import ls.augment.com.PowerModePolicy;

/** Adds actions to the existing OEM dialog; no key interception or replacement shutdown path. */
final class PowerMenuModesHook {
    private static final java.util.Map<View,Float> NATIVE_ROW_Y=new java.util.WeakHashMap<>();
    private static final String TAG="lsa.reboot.modes";
    static final String[] LABELS={"Fastboot","Fastbootd","Recovery","9008"};
    static final String[] REASONS={"bootloader","fastboot","recovery","edl"};
    static void install(AugmentModule module,ClassLoader loader){
        try{
            Class<?> type=Class.forName("com.zte.feature.globalaction.MfvGlobalActionsDialog$MFVActionsDialog",false,loader);
            if(!Dialog.class.isAssignableFrom(type))throw new NoSuchMethodException("Not an OEM dialog");
            Method init=type.getDeclaredMethod("initView");
            Field content=type.getDeclaredField("mContentView");content.setAccessible(true);
            Field reset=type.getDeclaredField("mResetContent");reset.setAccessible(true);
            Field global=type.getDeclaredField("mGlobalAnim");global.setAccessible(true);
            Method visible=global.getType().getDeclaredMethod("startVisibleAnim",View.class,boolean.class);
            module.registerFeatureHook(module.prepareFeatureHook(init,"power.modes",false).intercept(chain->{
                Object result=chain.proceed();
                try{
                    Dialog dialog=(Dialog)chain.getThisObject();
                    ViewGroup root=(ViewGroup)content.get(dialog);
                    View anchor=(View)reset.get(dialog);
                    if(root!=null&&anchor!=null)bind(module,dialog,root,anchor);
                }catch(Throwable error){module.logFeatureError("POWER_MODES_BIND",error);}
                return result;
            }));
            // Follow OEM selection/cancel, including the first confirmation tap.
            for(String name:new String[]{"startSelectAnim","startActionAnim","startActionLoading",
                    "startUnVisiableAnim","startLockSelectAnim","startUnSelectedAnim","startVisiableAnim","onStop"}){
                for(Method method:type.getDeclaredMethods())if(method.getName().equals(name)){
                    boolean show=name.equals("startUnSelectedAnim")||name.equals("startVisiableAnim");
                    module.registerFeatureHook(module.prepareFeatureHook(method,"power.modes.lifecycle."+name,false).intercept(chain->{
                        // Run in the same UI dispatch as the OEM animation, after its
                        // animation setup; never reveal the extras during initView.
                        Object result=chain.proceed();
                        try{
                            ViewGroup root=(ViewGroup)content.get(chain.getThisObject());
                            View panel=root==null?null:root.findViewWithTag(TAG);
                            if(show&&root!=null&&panel==null&&reset.get(chain.getThisObject()) instanceof View){
                                bind(module,(Dialog)chain.getThisObject(),root,(View)reset.get(chain.getThisObject()));
                                panel=root.findViewWithTag(TAG);
                            }
                            if(panel instanceof ViewGroup){
                                ViewGroup group=(ViewGroup)panel;
                                Object animation=global.get(chain.getThisObject());
                                if(show&&animation!=null){
                                    group.setVisibility(View.VISIBLE);
                                    for(int i=0;i<group.getChildCount();i++){
                                        View action=group.getChildAt(i);action.clearAnimation();
                                        visible.invoke(animation,action,true);
                                    }
                                }else{
                                    group.setVisibility(View.INVISIBLE);
                                    for(int i=0;i<group.getChildCount();i++)group.getChildAt(i).clearAnimation();
                                }
                            }
                        }catch(Throwable error){module.logFeatureError("POWER_MODES_VISIBILITY",error);}
                        return result;
                    }));
                }
            }
        }catch(Throwable error){module.logFeatureError("POWER_MODES_UNAVAILABLE",error);}
    }
    private static void bind(AugmentModule module,Dialog dialog,ViewGroup root,View anchor){
        if(anchor.getParent() instanceof View){View row=(View)anchor.getParent();Float old=NATIVE_ROW_Y.remove(row);if(old!=null)row.setTranslationY(old);}
        View previous=root.findViewWithTag(TAG);
        if(previous!=null)root.removeView(previous);
        Context context=root.getContext();
        if(!FeatureSettings.enabled(context,SystemUiOptions.POWER_MODES))return;
        if(!(anchor instanceof ViewGroup))return;
        FrameLayout panel=new FrameLayout(context);panel.setTag(TAG);panel.setVisibility(View.INVISIBLE);
        float density=context.getResources().getDisplayMetrics().density;
        int gap=Math.round(16*density);
        ViewGroup[] actions=new ViewGroup[4];
        for(int index=0;index<4;index++){
            final int mode=index;
            ViewGroup button=NativePowerActionFactory.create(context,(ViewGroup)anchor,LABELS[index]);
            actions[index]=button;panel.addView(button,new FrameLayout.LayoutParams(-2,-2));
                button.setOnClickListener(v->{
                    if(!dialog.isShowing()||!FeatureSettings.enabled(context,SystemUiOptions.POWER_MODES))return;
                    for(View action:actions)action.setEnabled(false);
                    new Thread(()->{
                        try{
                            Bundle response=context.getContentResolver().call(
                                    Uri.parse("content://ls.augment.com.config"),PowerModePolicy.CALL,REASONS[mode],null);
                            if(response==null||!response.getBoolean("ok",false))
                                throw new IllegalStateException(response==null?"模块重启服务不可用":response.getString("message","模块未接受重启请求，请检查功能开关与作用域"));
                            // A returned call is not proof that the firmware entered the requested mode.
                            root.postDelayed(()->enable(panel),5000);
                        }catch(Throwable error){
                            module.logFeatureError("POWER_MODE_FAILED "+LABELS[mode],error);
                            root.post(()->{enable(panel);Toast.makeText(context,"无法重启到 "+LABELS[mode]+"："+error.getMessage(),Toast.LENGTH_LONG).show();});
                        }
                    },"LSA-reboot-mode").start();
                });
        }
        root.addView(panel,new ViewGroup.LayoutParams(-1,-2));
        root.addOnLayoutChangeListener(new View.OnLayoutChangeListener(){
            @Override public void onLayoutChange(View view,int l,int t,int r,int b,int ol,int ot,int or,int ob){
                if(panel.getParent()!=root){root.removeOnLayoutChangeListener(this);return;}
                position(root,anchor,panel,actions,gap);
            }
        });
        root.post(()->position(root,anchor,panel,actions,gap));
    }
    private static void enable(ViewGroup group){for(int i=0;i<group.getChildCount();i++){View child=group.getChildAt(i);child.setEnabled(true);if(child instanceof ViewGroup)enable((ViewGroup)child);}}
    private static void position(ViewGroup root,View anchor,View panel,ViewGroup[] actions,int gap){
        if(root.getWidth()<=0||anchor.getWidth()<=0||anchor.getHeight()<=0)return;
        int[] a=new int[2],b=new int[2];root.getLocationOnScreen(a);anchor.getLocationOnScreen(b);
        int cellWidth=anchor.getWidth(),cellHeight=anchor.getHeight();
        int columns=2;
        int width=cellWidth*columns,height=cellHeight*(4/columns)+gap*(4/columns-1);
        if(panel.getLayoutParams().width!=width||panel.getLayoutParams().height!=height){
            panel.getLayoutParams().width=width;panel.getLayoutParams().height=height;panel.requestLayout();
        }
        for(int i=0;i<4;i++){
            FrameLayout.LayoutParams lp=(FrameLayout.LayoutParams)actions[i].getLayoutParams();
            int x=(i%columns)*cellWidth,y=(i/columns)*(cellHeight+gap);
            if(lp.width!=cellWidth||lp.height!=cellHeight||lp.leftMargin!=x||lp.topMargin!=y){
                lp.width=cellWidth;lp.height=cellHeight;lp.leftMargin=x;lp.topMargin=y;actions[i].setLayoutParams(lp);
            }
        }
        // Keep the real shutdown/restart listeners and native subtree as the first row.
        // Move their shared row, then place the two extra rows below it as one centered group.
        if(!(anchor.getParent() instanceof View))return;
        View nativeRow=(View)anchor.getParent();
        NATIVE_ROW_Y.putIfAbsent(nativeRow,nativeRow.getTranslationY());
        int totalHeight=cellHeight*3+gap*2;
        float firstTop=Math.max(gap,(root.getHeight()-totalHeight)/2f);
        float delta=firstTop-(b[1]-a[1]);
        if(Math.abs(delta)>.5f)nativeRow.setTranslationY(nativeRow.getTranslationY()+delta);
        panel.setX((root.getWidth()-width)/2f);
        panel.setY(firstTop+cellHeight+gap);
    }
}
