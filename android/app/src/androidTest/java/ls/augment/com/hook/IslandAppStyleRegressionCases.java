package ls.augment.com.hook;

import android.app.Instrumentation;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.view.View;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import ls.augment.com.BuildConfig;
import ls.augment.com.IslandActivityPolicy;
import org.json.JSONArray;
import org.json.JSONObject;

/** Draws the installed production Capsule on Android's UI thread, without attaching
 * a SystemUI window, registering hooks/listeners, or reading/writing configuration. */
public final class IslandAppStyleRegressionCases {
    private final Context context;
    private final File directory;
    private final JSONArray cases=new JSONArray(),images=new JSONArray();
    private int assertions;
    private Throwable failure;

    private IslandAppStyleRegressionCases(Context context){
        this.context=context;
        File external=context.getExternalFilesDir(null);
        if(external==null)throw new IllegalStateException("External evidence directory unavailable");
        directory=new File(external,"island-app-style-"+BuildConfig.VERSION_CODE);
    }

    public static JSONObject run(Instrumentation test)throws Exception{
        IslandAppStyleRegressionCases suite=new IslandAppStyleRegressionCases(test.getTargetContext());
        if(!suite.directory.isDirectory()&&!suite.directory.mkdirs())
            throw new IllegalStateException("Could not create island rendering evidence directory");
        test.runOnMainSync(()->{
            try{
                suite.inspectIcon(IslandActivityPolicy.MUSIC,"music");
                suite.inspectIcon(IslandActivityPolicy.NOTICE,"notification");
                suite.inspectCharging();
            }catch(Throwable error){suite.failure=error;}
        });
        JSONObject report=new JSONObject().put("success",suite.failure==null).put("assertions",suite.assertions)
                .put("cases",suite.cases).put("images",suite.images).put("evidenceDirectory",suite.directory.getAbsolutePath())
                .put("density",suite.context.getResources().getDisplayMetrics().density)
                .put("scope","Installed production Capsule rendered offscreen on Android UI thread; not a SystemUI overlay/window screenshot pass")
                .put("configurationWrites",0).put("failure",suite.failure==null?JSONObject.NULL:suite.failure.toString());
        Files.write(new File(suite.directory,"report.json").toPath(),report.toString(2).getBytes(StandardCharsets.UTF_8));
        if(suite.failure!=null)throw new AssertionError("Island app style rendering failed; inspect "+suite.directory,suite.failure);
        return report;
    }

    private void inspectIcon(int kind,String name)throws Exception{
        View capsule=newCapsule();ColorDrawable icon=new ColorDrawable(Color.RED);
        set(capsule,"icon",icon);set(capsule,"kind",kind);set(capsule,"playing",false);set(capsule,"transparent",true);
        Bitmap rounded=null,circle=null;
        JSONObject row=new JSONObject().put("case",name).put("heightDp",32).put("widthDp",120);cases.put(row);
        try{
            // Render the constructor's default before ever setting the new style flag.
            rounded=draw(capsule);Rect iconBounds=new Rect(icon.getBounds());
            save(rounded,name+"-rounded-square.png");
            check(iconBounds.width()>0&&iconBounds.height()>0,"Production drawable has visible bounds: "+name);
            int cx=iconBounds.centerX(),cy=iconBounds.centerY();
            check(isRed(rounded.getPixel(cx,cy)),"Default style retains the icon center: "+name);
            check(Color.alpha(rounded.getPixel(0,0))==0,"Transparent capsule has no background fill: "+name);

            set(capsule,"circularIcon",true);circle=draw(capsule);save(circle,name+"-circle.png");
            check(isRed(circle.getPixel(cx,cy)),"Circular style retains the icon center: "+name);
            check(Color.alpha(circle.getPixel(0,0))==0,"Circular style retains transparent capsule background: "+name);
            // Sample well inside the original square near all four diagonals. These
            // points distinguish a circular crop from the existing rounded square.
            int insetX=Math.max(1,iconBounds.width()/10),insetY=Math.max(1,iconBounds.height()/10);
            for(int x:new int[]{iconBounds.left+insetX,iconBounds.right-1-insetX})
                for(int y:new int[]{iconBounds.top+insetY,iconBounds.bottom-1-insetY}){
                    check(isRed(rounded.getPixel(x,y)),"Rounded square retains diagonal icon area: "+name+" at "+x+","+y);
                    check(Color.alpha(circle.getPixel(x,y))==0,"Circular crop removes diagonal icon area: "+name+" at "+x+","+y);
                }
            int roundedRed=countRed(rounded,iconBounds),circleRed=countRed(circle,iconBounds);
            check(circleRed>0&&roundedRed>circleRed,"Circle visibly crops corners without removing the whole icon: "+name);
            row.put("iconBoundsPx",bounds(iconBounds)).put("roundedRedPixels",roundedRed).put("circleRedPixels",circleRed);

            for(int step=0;step<6;step++){
                boolean circular=step%2!=0;set(capsule,"circularIcon",circular);Bitmap switched=draw(capsule);
                try{check(switched.sameAs(circular?circle:rounded),"Repeated style change restores identical rendering: "+name+" step "+step);}
                finally{switched.recycle();}
            }
            row.put("repeatSwitches",6).put("success",true);
        }finally{
            if(rounded!=null)rounded.recycle();if(circle!=null)circle.recycle();
        }
    }

    private void inspectCharging()throws Exception{
        View capsule=newCapsule();set(capsule,"kind",IslandActivityPolicy.CHARGING);set(capsule,"battery",63);
        set(capsule,"icon",null);set(capsule,"playing",false);set(capsule,"transparent",true);
        Bitmap rounded=null,circle=null;JSONObject row=new JSONObject().put("case","charging-without-icon");cases.put(row);
        try{
            rounded=draw(capsule);save(rounded,"charging-rounded-square.png");
            set(capsule,"circularIcon",true);circle=draw(capsule);save(circle,"charging-circle.png");
            check(nontransparentPixels(rounded)>0,"Charging fixture draws its actual bolt and battery text");
            check(rounded.sameAs(circle),"Icon style does not change charging bolt, text, or transparency");
            row.put("success",true);
        }finally{
            if(rounded!=null)rounded.recycle();if(circle!=null)circle.recycle();
        }
    }

    private View newCapsule()throws Exception{
        Class<?> type=Class.forName("ls.augment.com.hook.DynamicIslandHook$Capsule",true,context.getClassLoader());
        Constructor<?> constructor=type.getDeclaredConstructor(Context.class);constructor.setAccessible(true);
        return (View)constructor.newInstance(context);
    }
    private static void set(View view,String name,Object value)throws Exception{
        Field field=view.getClass().getDeclaredField(name);field.setAccessible(true);field.set(view,value);
    }
    private Bitmap draw(View view){
        int width=dp(120),height=dp(32);
        view.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(height,View.MeasureSpec.EXACTLY));
        view.layout(0,0,width,height);
        Bitmap image=Bitmap.createBitmap(width,height,Bitmap.Config.ARGB_8888);view.draw(new Canvas(image));return image;
    }
    private int dp(int value){return Math.round(value*context.getResources().getDisplayMetrics().density);}
    private void save(Bitmap image,String name)throws Exception{
        File file=new File(directory,name);
        try(FileOutputStream out=new FileOutputStream(file)){check(image.compress(Bitmap.CompressFormat.PNG,100,out),"Rendered image saved: "+name);}
        images.put(file.getAbsolutePath());
    }
    private void check(boolean condition,String message){assertions++;if(!condition)throw new AssertionError(message);}
    private static boolean isRed(int pixel){return Color.alpha(pixel)>200&&Color.red(pixel)>200&&Color.green(pixel)<20&&Color.blue(pixel)<20;}
    private static int countRed(Bitmap image,Rect region){
        int count=0;for(int y=region.top;y<region.bottom;y++)for(int x=region.left;x<region.right;x++)if(isRed(image.getPixel(x,y)))count++;return count;
    }
    private static int nontransparentPixels(Bitmap image){
        int count=0;for(int y=0;y<image.getHeight();y++)for(int x=0;x<image.getWidth();x++)if(Color.alpha(image.getPixel(x,y))>0)count++;return count;
    }
    private static JSONObject bounds(Rect rect)throws Exception{return new JSONObject().put("left",rect.left).put("top",rect.top).put("right",rect.right).put("bottom",rect.bottom);}
}
