package ls.augment.com;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Instrumentation;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;
import org.json.JSONObject;

/** Exercises native listener contracts after glass reparenting; never runs real configuration actions. */
final class DialogUiDeviceCases {
    static JSONObject run(Instrumentation test) throws Exception {
        Activity activity=test.startActivitySync(new Intent(test.getTargetContext(),ConfigTransferActivity.class)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        Map<String,String> before=new AppConfig(activity).snapshot();
        AlertDialog[] active=new AlertDialog[1];
        int[] callbacks=new int[4];
        try {
            test.runOnMainSync(()->{
                active[0]=AppDialogs.builder(activity).setTitle("长内容与按钮检查")
                        .setMessage("这是一段用于检查滚动、文字换行和底部操作按钮的说明。\n\n".repeat(50))
                        .setNegativeButton("取消",null).setPositiveButton("确认",(d,w)->callbacks[0]++)
                        .setOnCancelListener(d->callbacks[1]++).create();
                active[0].setOnShowListener(d->callbacks[2]++);
                active[0].setOnDismissListener(d->callbacks[3]++);
                active[0].show();
            });
            settle(test); check(test,active[0]); capture(test,activity,"long-content");
            test.runOnMainSync(()->{
                require(callbacks[2]==1,"Caller OnShow was lost");
                active[0].setMessage("完成后的消息仍可更新，按钮状态仍可修改。");
                Button confirm=active[0].getButton(AlertDialog.BUTTON_POSITIVE);
                confirm.setEnabled(false); require(!confirm.isEnabled(),"Disabled action changed");
                active[0].cancel();
            });
            settle(test);
            require(callbacks[0]==0&&callbacks[1]==1&&callbacks[3]==1,"Cancel/dismiss contract changed");
            test.runOnMainSync(()->{
                active[0]=AppDialogs.builder(activity).setTitle("选择当前空间")
                        .setSingleChoiceItems(new String[]{"系统空间","应用分身空间"},-1,(d,w)->
                                ((AlertDialog)d).getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(true))
                        .setNegativeButton("取消",null).setPositiveButton("查询",(d,w)->callbacks[0]++).show();
                active[0].getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(false);
            });
            settle(test);check(test,active[0]);
            test.runOnMainSync(()->{
                ListView list=active[0].getListView();
                list.setItemChecked(1,true);list.performItemClick(list.getChildAt(1),1,1);
                require(active[0].getButton(AlertDialog.BUTTON_POSITIVE).isEnabled(),"Single-choice action did not unlock");
            });
            capture(test,activity,"single-choice");
            test.runOnMainSync(()->active[0].getButton(AlertDialog.BUTTON_POSITIVE).performClick());settle(test);
            require(callbacks[0]==1&&!active[0].isShowing(),"Positive action contract changed");
            test.runOnMainSync(()->active[0]=AppSelectionDialog.show(activity,new UiKit(activity),
                    "选择应用",activity.getPackageName(),value->callbacks[0]++));
            for(int i=0;i<30;i++){
                settle(test);
                int[] count={0};test.runOnMainSync(()->count[0]=find(active[0].getWindow().getDecorView(),ListView.class).getCount());
                if(count[0]>0)break;
                if(i==29)throw new AssertionError("Application enumeration timed out");
            }
            check(test,active[0]);capture(test,activity,"app-multiselect");
            test.runOnMainSync(()->{
                active[0].getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
                require(active[0].isShowing(),"Clear selection dismissed the dialog");
                ListView list=find(active[0].getWindow().getDecorView(),ListView.class);
                require(list.getCheckedItemCount()==0,"Clear selection did not clear choices");
                find(active[0].getWindow().getDecorView(),EditText.class).setText(activity.getPackageName());
            });
            settle(test);
            test.runOnMainSync(()->{
                ListView list=find(active[0].getWindow().getDecorView(),ListView.class);
                require(list.getCount()>=1,"Search did not retain matching application");
            });
            capture(test,activity,"app-search");
            test.runOnMainSync(()->{
                EditText search=find(active[0].getWindow().getDecorView(),EditText.class);
                search.requestFocus();
                activity.getSystemService(android.view.inputmethod.InputMethodManager.class)
                        .showSoftInput(search,android.view.inputmethod.InputMethodManager.SHOW_IMPLICIT);
            });
            SystemClock.sleep(900);settle(test);check(test,active[0]);capture(test,activity,"app-keyboard");
            test.runOnMainSync(()->active[0].cancel());settle(test);
            require(callbacks[0]==1,"Cancelling app selection saved changes");
            test.runOnMainSync(()->ModuleLegal.showTerms(activity,new UiKit(activity)));
            settle(test);capture(test,activity,"terms");
            test.sendKeyDownUpSync(android.view.KeyEvent.KEYCODE_BACK);settle(test);
            timePicker(test);
            require(before.equals(new AppConfig(activity).snapshot()),"Dialog checks changed configuration");
            return new JSONObject().put("success",true).put("longContentButtonsVisible",true)
                    .put("buttonGapDp",8).put("listenerContractsPreserved",true)
                    .put("singleChoicePassed",true).put("searchAndMultiSelectPassed",true)
                    .put("timeWheelsVisibleAndCancelSafe",true)
                    .put("configurationUnchanged",true);
        } finally {test.runOnMainSync(()->{if(active[0]!=null)active[0].dismiss();activity.finish();});}
    }
    private static void timePicker(Instrumentation test)throws Exception{
        Activity health=test.startActivitySync(new Intent(test.getTargetContext(),HealthSettingsActivity.class)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        android.app.Dialog[] dialog=new android.app.Dialog[1];
        try{
            java.lang.reflect.Field field=HealthSettingsActivity.class.getDeclaredField("editor");field.setAccessible(true);
            Object editor=field.get(health);
            java.lang.reflect.Method method=HealthEditorController.class.getDeclaredMethod("pickTime",boolean.class);method.setAccessible(true);
            test.runOnMainSync(()->{try{dialog[0]=(android.app.Dialog)method.invoke(editor,true);}catch(Exception e){throw new AssertionError(e);}});
            settle(test);
            test.runOnMainSync(()->{
                View root=dialog[0].getWindow().getDecorView();
                android.widget.NumberPicker hour=find(root,android.widget.NumberPicker.class);
                require(hour!=null&&hour.getWidth()>80*root.getResources().getDisplayMetrics().density,"Hour wheel has no usable width");
                ViewGroup row=(ViewGroup)hour.getParent();
                android.widget.NumberPicker minute=(android.widget.NumberPicker)row.getChildAt(2);
                require(minute.getWidth()>80*root.getResources().getDisplayMetrics().density,"Minute wheel has no usable width");
                hour.setValue((hour.getValue()+1)%24);
            });
            capture(test,health,"time-picker");
            test.runOnMainSync(()->dialog[0].cancel());
        }finally{test.runOnMainSync(()->{if(dialog[0]!=null)dialog[0].dismiss();health.finish();});}
    }
    private static void check(Instrumentation test,AlertDialog dialog){
        test.runOnMainSync(()->{
            View decor=dialog.getWindow().getDecorView();
            LiquidGlassLayout glass=decor.findViewWithTag("liquid-glass-dialog");
            require(glass!=null&&glass.opticalEffectActive(),"Dialog glass is not active");
            Rect bounds=new Rect();decor.getGlobalVisibleRect(bounds);
            Rect available=new Rect();decor.getWindowVisibleDisplayFrame(available);
            Button previous=null;
            for(int which:new int[]{AlertDialog.BUTTON_NEGATIVE,AlertDialog.BUTTON_NEUTRAL,AlertDialog.BUTTON_POSITIVE}){
                Button button=dialog.getButton(which);
                if(button==null||button.getVisibility()!=View.VISIBLE)continue;
                Rect rect=new Rect();require(button.getGlobalVisibleRect(rect),"Action is not visible");
                require(rect.height()>=Math.round(48*decor.getResources().getDisplayMetrics().density),"Action clipped vertically");
                require(bounds.contains(rect),"Action outside window");
                require(available.contains(rect),"Action covered by keyboard or system bars");
                if(previous!=null){Rect last=new Rect();previous.getGlobalVisibleRect(last);
                    require(rect.left-last.right>=Math.round(8*decor.getResources().getDisplayMetrics().density),"Action gap too small");}
                previous=button;
            }
        });
    }
    private static <T extends View>T find(View root,Class<T> type){
        if(type.isInstance(root))return type.cast(root);
        if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++){
            T value=find(((ViewGroup)root).getChildAt(i),type);if(value!=null)return value;}
        return null;
    }
    private static void settle(Instrumentation test){SystemClock.sleep(350);test.waitForIdleSync();}
    private static void capture(Instrumentation test,Activity activity,String name)throws Exception{
        File file=new File(activity.getFilesDir(),"device-regression-results/dialogs-20316/"+name+".png");
        file.getParentFile().mkdirs();Bitmap bitmap=test.getUiAutomation().takeScreenshot();
        require(bitmap!=null,"Screenshot unavailable");
        try(FileOutputStream output=new FileOutputStream(file)){bitmap.compress(Bitmap.CompressFormat.PNG,100,output);}finally{bitmap.recycle();}
    }
    private static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
}
