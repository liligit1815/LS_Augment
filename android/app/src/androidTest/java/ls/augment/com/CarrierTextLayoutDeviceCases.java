package ls.augment.com;

import android.app.Instrumentation;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.text.DynamicLayout;
import android.text.Editable;
import android.text.Layout;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.text.method.TransformationMethod;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import org.json.JSONArray;
import org.json.JSONObject;

/** Real Android TextView/DynamicLayout contract, using the installed production style method.
 * No settings writes, activity launch, hooks, shell, or SystemUI claim. Widgets are measured
 * offscreen on Android's UI thread and their actual Canvas output is saved for inspection.
 */
final class CarrierTextLayoutDeviceCases {
    private final Context context;
    private final JSONArray cases=new JSONArray();
    private final File directory;
    private int assertions;
    private Throwable failure;

    private CarrierTextLayoutDeviceCases(Context context){
        this.context=context;
        directory=new File(context.getExternalFilesDir(null),"carrier-text-layout-"+BuildConfig.VERSION_CODE);
    }
    static JSONObject run(Instrumentation test)throws Exception{
        CarrierTextLayoutDeviceCases suite=new CarrierTextLayoutDeviceCases(test.getTargetContext());
        if(!suite.directory.isDirectory()&&!suite.directory.mkdirs())throw new IllegalStateException("Could not create fixture evidence directory");
        test.runOnMainSync(()->{
            try{
                for(boolean rtl:new boolean[]{false,true})for(int size:new int[]{13,40})for(boolean chinese:new boolean[]{false,true})
                    suite.inspect(size,chinese,rtl);
            }catch(Throwable error){suite.failure=error;}
        });
        JSONObject report=new JSONObject().put("success",suite.failure==null).put("assertions",suite.assertions)
                .put("cases",suite.cases).put("evidenceDirectory",suite.directory.getAbsolutePath())
                .put("scope","Real Android offscreen TextView + installed production CarrierTextHook style method; not a SystemUI layout or phone screenshot pass")
                .put("configurationWrites",0).put("failure",suite.failure==null?JSONObject.NULL:suite.failure.toString());
        Files.write(new File(suite.directory,"report.json").toPath(),report.toString(2).getBytes(StandardCharsets.UTF_8));
        if(suite.failure!=null)throw new AssertionError("Carrier TextView layout contract failed; inspect "+suite.directory,suite.failure);
        return report;
    }
    private void check(boolean condition,String message){assertions++;if(!condition)throw new AssertionError(message);}
    private void inspect(int size,boolean chinese,boolean rtl)throws Exception{
        String label=(chinese?"chinese":"latin")+"-"+size+"sp-"+(rtl?"rtl":"ltr");
        String value=chinese?"锁屏长文字边界验证 红魔Duo 红魔Duo 红魔Duo 红魔Duo"
                :"DUO LOCK Carrier text width boundary verification repeated repeated repeated";
        int budget=Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP,140,context.getResources().getDisplayMetrics()));
        FrameLayout parent=new FrameLayout(context);parent.layout(0,0,budget+200,600);
        TextView text=new TextView(context);parent.addView(text,new FrameLayout.LayoutParams(-2,-2));
        text.setLayoutDirection(rtl?View.LAYOUT_DIRECTION_RTL:View.LAYOUT_DIRECTION_LTR);
        text.setGravity(Gravity.START|Gravity.CENTER_VERTICAL);text.setSingleLine(true);
        text.setIncludeFontPadding(false);text.setTextColor(Color.BLACK);text.setMaxWidth(budget);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP,size);text.setEllipsize(TextUtils.TruncateAt.END);
        // Reproduce the 20452 style on an otherwise native one-line TextView.
        text.setHorizontallyScrolling(false);
        TextWatcher watcher=new TextWatcher(){
            @Override public void beforeTextChanged(CharSequence s,int start,int count,int after){}
            @Override public void onTextChanged(CharSequence s,int start,int before,int count){}
            @Override public void afterTextChanged(Editable s){}
        };
        text.addTextChangedListener(watcher);text.setText(value);measure(text,budget);
        JSONObject row=new JSONObject().put("case",label).put("before",layout(text));cases.put(row);
        check(text.getText() instanceof Editable,"TextWatcher must exercise Android's Editable buffer path: "+label);
        check(text.getLayout() instanceof DynamicLayout,"Expected actual Android DynamicLayout: "+label);
        TransformationMethod transformation=text.getTransformationMethod();float nativeSize=text.getTextSize();
        // The private production state is exercised without attach()/FeatureSettings,
        // so this platform test never enables a feature or writes app configuration.
        Class<?> type=Class.forName("ls.augment.com.hook.CarrierTextHook$State",true,context.getClassLoader());
        Constructor<?> constructor=type.getDeclaredConstructor(TextView.class,View.class,String.class);constructor.setAccessible(true);
        Object state=constructor.newInstance(text,parent,"lock");
        Field requestedSize=type.getDeclaredField("size");requestedSize.setAccessible(true);requestedSize.setInt(state,size);
        Method apply=type.getDeclaredMethod("applyStyle",TextView.class);apply.setAccessible(true);apply.invoke(state,text);
        measure(text,budget);Layout result=text.getLayout();row.put("after",layout(text));
        check(result.getLineCount()==1,"Long text must not wrap into hidden extra lines: "+label);
        check(result.getEllipsisCount(0)>0,"Overflowing text must contain real END ellipsis: "+label);
        check(text.isHorizontallyScrollable(),"One-line layout must keep wide internal paragraph width: "+label);
        check(result.getEllipsizedWidth()==text.getWidth()-text.getCompoundPaddingLeft()-text.getCompoundPaddingRight(),"Ellipsis must use visible width, not the wide internal paragraph: "+label);
        check(Math.abs(text.getTextSize()-nativeSize)<.01f,"Ellipsis must retain requested sp size: "+label);
        check(text.getText().toString().equals(value),"Full text must remain in the native TextView buffer: "+label);
        check(text.getTransformationMethod()==transformation,"Native transformation/locale behavior must be retained: "+label);
        Bitmap bitmap=Bitmap.createBitmap(text.getWidth(),Math.max(1,text.getHeight()),Bitmap.Config.ARGB_8888);
        try(FileOutputStream output=new FileOutputStream(new File(directory,label+".png"))){
            Canvas canvas=new Canvas(bitmap);canvas.drawColor(Color.WHITE);text.draw(canvas);bitmap.compress(Bitmap.CompressFormat.PNG,100,output);
        }finally{bitmap.recycle();}
        Method restore=type.getDeclaredMethod("restoreStyle",TextView.class);restore.setAccessible(true);restore.invoke(state,text);
        check(!text.isHorizontallyScrollable()&&text.getEllipsize()==TextUtils.TruncateAt.END,"Disable must restore preexisting wrapping preference: "+label);
        check(text.getTransformationMethod()==transformation&&Math.abs(text.getTextSize()-nativeSize)<.01f,"Disable retains original transform and font: "+label);
        text.removeTextChangedListener(watcher);parent.removeView(text);row.put("success",true);
    }
    private static void measure(TextView text,int budget){
        text.measure(View.MeasureSpec.makeMeasureSpec(budget,View.MeasureSpec.AT_MOST),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
        text.layout(0,0,text.getMeasuredWidth(),text.getMeasuredHeight());
    }
    private static JSONObject layout(TextView text)throws Exception{
        Layout layout=text.getLayout();
        return new JSONObject().put("buffer",text.getText().getClass().getName())
                .put("layout",layout==null?JSONObject.NULL:layout.getClass().getName())
                .put("lineCount",layout==null?0:layout.getLineCount())
                .put("ellipsisCount",layout==null||layout.getLineCount()==0?0:layout.getEllipsisCount(0))
                .put("layoutWidth",layout==null?0:layout.getWidth()).put("ellipsisWidth",layout==null?0:layout.getEllipsizedWidth())
                .put("viewWidth",text.getWidth()).put("textSizePx",text.getTextSize()).put("horizontalScrolling",text.isHorizontallyScrollable());
    }
}
