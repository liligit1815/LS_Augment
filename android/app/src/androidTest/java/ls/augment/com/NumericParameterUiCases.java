package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.app.Instrumentation;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Exercises the production controls against memory-only callbacks; never changes feature settings. */
final class NumericParameterUiCases {
    private final Instrumentation test;
    private Activity activity;
    private UiKit ui;
    private LinearLayout page;
    private ParameterSlider integer,decimal;
    private NumericParameterEditor steppedEditor;
    private SeekBar stepped;
    private final List<String> values=new ArrayList<>(),events=new ArrayList<>();
    private final JSONArray screenshots=new JSONArray();
    private int checks;
    private File directory;
    private final boolean landscape;
    private NumericParameterUiCases(Instrumentation test,boolean landscape){this.test=test;this.landscape=landscape;}
    static JSONObject run(Instrumentation test,boolean landscape)throws Exception{return new NumericParameterUiCases(test,landscape).run();}

    private JSONObject run()throws Exception{
        AppConfig config=new AppConfig(test.getTargetContext());Map<String,String> before=new LinkedHashMap<>(config.snapshot());
        directory=new File(test.getTargetContext().getExternalFilesDir(null),"numeric-parameter-tests");directory.mkdirs();
        try{
            if(landscape){require(test.getUiAutomation().setRotation(android.view.Surface.ROTATION_90),"Landscape rotation available");SystemClock.sleep(500);}
            activity=test.startActivitySync(new Intent(test.getTargetContext(),EnhancementSettingsActivity.class)
                    .putExtra("target",HookAppCatalog.LAUNCHER).putExtra(ModuleNavigation.EXTRA_ROUTE,"group/launcher/launcher_grid")
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));settle();
            onMain(()->{fixture();return null;});settle();checkNavigationGap();
            if(landscape){
                require(activity.getResources().getDisplayMetrics().widthPixels>activity.getResources().getDisplayMetrics().heightPixels,"Landscape dimensions active");
                open(editor(integer));capture("05-landscape-dialog.png");checkDialogBounds(editor(integer));
                // Some keyboards float above a landscape dialog; Done must still submit once.
                onMain(()->{EditText input=dialog(editor(integer)).getWindow().getDecorView().findViewWithTag("numeric-exact-input");
                    input.setText("203");input.onEditorAction(android.view.inputmethod.EditorInfo.IME_ACTION_DONE);return null;});
                settle();require(values.equals(java.util.Arrays.asList("203")),"Keyboard Done submits exactly once in landscape");
                require(onMain(()->dialog(editor(integer)))==null,"Keyboard Done closes the dialog");
                require(before.equals(config.snapshot()),"Landscape leaves configuration unchanged");
                return new JSONObject().put("success",true).put("checks",checks).put("landscape",true).put("settingsUnchanged",true).put("screenshots",screenshots);
            }
            capture("01-numeric-controls.png");
            onMain(()->{require(findInputs(page)==0,"No permanent numeric input fields");
                require(integer.bar.getHeight()==ui.dp(20),"Compact slider has a 20dp visual row");
                require(((ParameterSeekBar)integer.bar).expandedTouchBounds().height()>=ui.dp(48),"Slider expands its touch region into empty space");return null;});
            open(editor(integer));
            for(String bad:new String[]{"","1001","9","202.1","NaN"}){
                submit(editor(integer),bad);require(onMain(()->dialog(editor(integer))!=null&&dialog(editor(integer)).isShowing()),"Invalid input remains editable: "+bad);
                require(values.isEmpty(),"Invalid input does not save");
            }
            capture("02-invalid-input.png");onMain(()->{dialog(editor(integer)).cancel();return null;});settle();
            require(values.isEmpty(),"Cancel preserves current value");
            open(editor(integer));capture("03-exact-dialog.png");submit(editor(integer),"100");
            require(values.size()==1&&values.get(0).equals("100"),"Exact integer submits once");
            require(onMain(()->integer.bar.getProgress())==100,"Exact integer updates slider");
            open(editor(integer));submit(editor(integer),"100.0");require(values.size()==1,"Unchanged value is not re-saved");
            open(editor(integer));onMain(()->{integer.setValue("150");return null;});submit(editor(integer),"200");
            require(values.size()==1&&onMain(()->integer.getValue()).equals("150"),"An external update cannot be overwritten by an old dialog");
            onMain(()->{editor(integer).dismiss();return null;});
            open(editor(decimal));submit(editor(decimal),"-0.123");require(onMain(()->dialog(editor(decimal)).isShowing()),"Decimal step enforced");
            submit(editor(decimal),"-0.12");require(values.get(values.size()-1).equals("-0.12"),"Signed decimal preserved");
            require(onMain(()->decimal.bar.getProgress())==-12,"Signed decimal maps to native slider");
            open(steppedEditor);submit(steppedEditor,"117");require(events.isEmpty(),"Special step cannot be bypassed");
            submit(steppedEditor,"120");require(events.equals(java.util.Arrays.asList("start","value:4:true","stop")),"Input uses one existing slider transaction");
            events.clear();open(steppedEditor);onMain(()->{stepped.setMax(2);return null;});submit(steppedEditor,"120");
            require(events.stream().noneMatch(s->s.equals("stop")),"Range changes cannot write an old allowed value");
            onMain(()->{steppedEditor.dismiss();return null;});
            // A saved value outside the current phone range stays stored and visible until an explicit valid edit.
            onMain(()->{integer.setValue("900");integer.range(10,500,"本机范围已收窄");return null;});
            require(onMain(()->integer.getValue()).equals("900")&&onMain(()->integer.bar.getProgress())==500,"Saved and actual values remain distinct");
            open(editor(integer));submit(editor(integer),"900");require(onMain(()->dialog(editor(integer)).isShowing()),"Dialog uses current device range");
            onMain(()->{integer.unavailable("未取得接口");return null;});submit(editor(integer),"400");
            require(onMain(()->integer.getValue()).equals("900"),"Capability loss while open prevents commit");
            // A detach/rebuild must dismiss the old input and prevent its confirm action from changing settings.
            onMain(()->{integer.bar.setEnabled(true);integer.setValue("100");return null;});open(editor(integer));
            View oldConfirm=onMain(()->dialog(editor(integer)).getWindow().getDecorView().findViewWithTag("glass-dialog-confirm"));
            onMain(()->{page.removeAllViews();oldConfirm.performClick();return null;});require(values.size()==2,"Detached editor cannot submit");
            onMain(()->{fixture();return null;});settle();
            // Physical DOWN/MOVE/UP keeps the original release-only behavior.
            onMain(()->{events.clear();return null;});
            drag(stepped);require(events.contains("start")&&events.get(events.size()-1).equals("stop"),"Native drag still invokes the original listener");
            checkExpandedSliderTouches();
            java.util.List<String> colors=new java.util.ArrayList<>();
            Dialog color=onMain(()->ColorEditorDialog.show(activity,ui,"颜色参数","#FF2277AA",colors::add));settle();
            require(onMain(()->checkColorSliders(color.getWindow().getDecorView()))==2,"Color dialog shares both compact sliders");
            capture("06-compact-color-dialog.png");onMain(()->{color.cancel();return null;});
            require(colors.isEmpty(),"Inspecting and cancelling colors does not save");
            // Larger font uses the same dialog and real layout bounds.
            Configuration original=new Configuration(activity.getResources().getConfiguration());
            try{
                onMain(()->{Configuration large=new Configuration(original);large.fontScale=1.3f;
                    activity.getResources().updateConfiguration(large,activity.getResources().getDisplayMetrics());fixture();return null;});settle();
                open(editor(integer));capture("04-large-font-dialog.png");checkDialogBounds(editor(integer));
                onMain(()->{editor(integer).dismiss();return null;});
            }finally{onMain(()->{activity.getResources().updateConfiguration(original,activity.getResources().getDisplayMetrics());return null;});}
            require(before.equals(config.snapshot()),"Feature configuration unchanged");
            return new JSONObject().put("success",true).put("checks",checks).put("settingsUnchanged",true).put("screenshots",screenshots);
        }finally{try{if(activity!=null)onMain(()->{activity.finish();return null;});}finally{if(landscape)test.getUiAutomation().setRotation(android.app.UiAutomation.ROTATION_UNFREEZE);}}
    }

    private void fixture(){
        activity.getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        ui=new UiKit(activity);page=ui.detailPage("数值参数",null);ui.addDetailSectionTitle(page,"数值参数");
        View title=ui.featureTitle("遮罩大小（%）","点击标题或当前值精确输入");page.addView(title);
        integer=new ParameterSlider(ui,EnhancementOption.integer("numeric-test-integer","test","遮罩大小（%）","",100,10,1000),"202",values::add,true);
        integer.bindTitle(title);page.addView(integer);
        View decimalTitle=ui.featureTitle("字间距",null);page.addView(decimalTitle);
        decimal=new ParameterSlider(ui,EnhancementOption.decimal("numeric-test-decimal","test","字间距","",0,-.2,1),"0.25",values::add);
        decimal.bindTitle(decimalTitle);page.addView(decimal);
        android.widget.TextView label=ui.text("媒体上限：115%",12,ui.muted,false);page.addView(label);
        stepped=ui.slider();stepped.setMax(40);stepped.setProgress(3);page.addView(stepped);
        steppedEditor=NumericParameterEditor.linear(ui,stepped,"媒体上限",100,5,"%",label);
        stepped.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
            public void onStartTrackingTouch(SeekBar b){events.add("start");}
            public void onProgressChanged(SeekBar b,int p,boolean u){events.add("value:"+p+":"+u);}
            public void onStopTrackingTouch(SeekBar b){events.add("stop");}
        });
    }
    private void checkDialogBounds(NumericParameterEditor editor)throws Exception{
        onMain(()->{Dialog d=dialog(editor);View root=d.getWindow().getDecorView();View input=root.findViewWithTag("numeric-exact-input");
            View button=root.findViewWithTag("glass-dialog-confirm");android.graphics.Rect screen=new android.graphics.Rect();root.getWindowVisibleDisplayFrame(screen);
            for(View v:new View[]{input,button}){int[] p=new int[2];v.getLocationOnScreen(p);
                require(v.getHeight()>=ui.dp(48),"Input/button keeps 48 dp target");require(p[1]>=screen.top&&p[1]+v.getHeight()<=screen.bottom,"Editor remains above keyboard");}
            return null;});
    }
    private void checkNavigationGap()throws Exception{
        onMain(()->{View root=activity.getWindow().getDecorView();View path=root.findViewWithTag("page-path");View first=page.findViewWithTag("section-title:数值参数");
            int[] a=new int[2],b=new int[2];path.getLocationOnScreen(a);first.getLocationOnScreen(b);
            float gap=(b[1]-a[1]-path.getHeight())/activity.getResources().getDisplayMetrics().density;
            require(gap>=8&&gap<=12,"Navigation gap is 8–12 dp, actual "+gap);return null;});
    }
    private void drag(SeekBar bar)throws Exception{
        int[] bounds=onMain(()->{int[] p=new int[2];bar.getLocationOnScreen(p);return new int[]{p[0],p[1],bar.getWidth(),bar.getHeight()};});
        long down=SystemClock.uptimeMillis();
        for(int i=0;i<3;i++){MotionEvent e=MotionEvent.obtain(down,SystemClock.uptimeMillis(),i==0?MotionEvent.ACTION_DOWN:i==2?MotionEvent.ACTION_UP:MotionEvent.ACTION_MOVE,
                bounds[0]+bounds[2]*(i==0?.4f:.6f),bounds[1]+bounds[3]/2f,0);test.sendPointerSync(e);e.recycle();}
        settle();
    }
    private void checkExpandedSliderTouches()throws Exception{
        onMain(()->{events.clear();stepped.setMax(40);stepped.setProgress(3);return null;});
        // The final row has empty padding below it. Start outside the compact view,
        // preserve X during dragging, and keep title/help taps on their own controls.
        onMain(()->{page.setPadding(page.getPaddingLeft(),page.getPaddingTop(),page.getPaddingRight(),ui.dp(16));return null;});settle();
        int[] p=onMain(()->{int[] at=new int[2];stepped.getLocationOnScreen(at);return new int[]{at[0],at[1],stepped.getWidth(),stepped.getHeight()};});
        long down=SystemClock.uptimeMillis();
        for(int i=0;i<3;i++){MotionEvent e=MotionEvent.obtain(down,SystemClock.uptimeMillis(),i==0?MotionEvent.ACTION_DOWN:i==2?MotionEvent.ACTION_UP:MotionEvent.ACTION_MOVE,
                p[0]+p[2]*(i==0?.65f:.82f),p[1]+p[3]+ui.dp(6),0);test.sendPointerSync(e);e.recycle();}
        settle();require(events.contains("start")&&events.get(events.size()-1).equals("stop"),"Dragging from surrounding whitespace reaches native slider");
        require(onMain(()->stepped.getProgress())>28,"Delegation retains X instead of jumping to midpoint");
        onMain(()->{events.clear();stepped.setEnabled(false);return null;});
        down=SystemClock.uptimeMillis();for(int action:new int[]{MotionEvent.ACTION_DOWN,MotionEvent.ACTION_UP}){MotionEvent e=MotionEvent.obtain(down,SystemClock.uptimeMillis(),action,p[0]+p[2]*.8f,p[1]+p[3]+ui.dp(6),0);test.sendPointerSync(e);e.recycle();}
        settle();require(events.isEmpty(),"Disabled slider ignores extended touches");
        onMain(()->{stepped.setEnabled(true);return null;});
        View valueTarget=onMain(()->((java.util.List<View>)field(editor(integer),"targets")).get(0));
        tapNearBottom(valueTarget);
        require(onMain(()->dialog(editor(integer))!=null&&dialog(editor(integer)).isShowing()),"Existing value target wins where its bounds overlap the extension");
        onMain(()->{editor(integer).dismiss();return null;});settle();
        View help=onMain(()->{ViewGroup header=(ViewGroup)integer.getChildAt(0);return header.getChildAt(header.getChildCount()-1);});
        int[] helpClicks={0};onMain(()->{help.setOnClickListener(v->helpClicks[0]++);return null;});
        tapNearBottom(help);require(helpClicks[0]==1,"Help keeps its independent physical touch target");
    }
    private void tapNearBottom(View view)throws Exception{
        int[] p=onMain(()->{int[] at=new int[2];view.getLocationOnScreen(at);return new int[]{at[0]+view.getWidth()/2,at[1]+view.getHeight()-ui.dp(6)};});
        long down=SystemClock.uptimeMillis();for(int action:new int[]{MotionEvent.ACTION_DOWN,MotionEvent.ACTION_UP}){MotionEvent e=MotionEvent.obtain(down,SystemClock.uptimeMillis(),action,p[0],p[1],0);test.sendPointerSync(e);e.recycle();}settle();
    }
    private int checkColorSliders(View view){int count=0;if(view instanceof SeekBar){require(view.getHeight()==ui.dp(20),"Color slider visual height is 20dp");count++;}if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)count+=checkColorSliders(((ViewGroup)view).getChildAt(i));return count;}
    @SuppressWarnings("unchecked")
    private void open(NumericParameterEditor editor)throws Exception{onMain(()->{
        List<View> targets=(List<View>)field(editor,"targets");View target=targets.get(checks%targets.size());
        require(target.isEnabled()&&target.performClick(),"Title/current-value opens exact input");return null;
    });settle();require(onMain(()->dialog(editor)!=null&&dialog(editor).isShowing()),"Exact dialog opened");}
    private void submit(NumericParameterEditor editor,String value)throws Exception{onMain(()->{Dialog d=dialog(editor);require(d!=null,"Input dialog exists");View root=d.getWindow().getDecorView();((EditText)root.findViewWithTag("numeric-exact-input")).setText(value);root.findViewWithTag("glass-dialog-confirm").performClick();return null;});settle();}
    private NumericParameterEditor editor(ParameterSlider slider){return (NumericParameterEditor)field(slider,"editor");}
    private Dialog dialog(NumericParameterEditor editor){return (Dialog)field(editor,"dialog");}
    private Object field(Object owner,String name){try{Field f=owner.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(owner);}catch(Exception e){throw new AssertionError(e);}}
    private int findInputs(View v){int n=v instanceof EditText?1:0;if(v instanceof ViewGroup)for(int i=0;i<((ViewGroup)v).getChildCount();i++)n+=findInputs(((ViewGroup)v).getChildAt(i));return n;}
    private void capture(String name)throws Exception{settle();Bitmap bitmap=test.getUiAutomation().takeScreenshot();require(bitmap!=null,"Screenshot available");File file=new File(directory,name);try(FileOutputStream out=new FileOutputStream(file)){bitmap.compress(Bitmap.CompressFormat.PNG,100,out);}finally{bitmap.recycle();}screenshots.put(file.getAbsolutePath());}
    private void settle(){test.waitForIdleSync();SystemClock.sleep(220);}
    private void require(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    private interface Main<T>{T run()throws Exception;}
    private <T>T onMain(Main<T> operation)throws Exception{AtomicReference<T> result=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();test.runOnMainSync(()->{try{result.set(operation.run());}catch(Throwable e){error.set(e);}});if(error.get()!=null)throw new AssertionError(error.get());return result.get();}
}
