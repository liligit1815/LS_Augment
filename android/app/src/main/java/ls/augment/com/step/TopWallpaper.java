package ls.augment.com.step;

import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.util.AtomicFile;
import java.io.*;

/** User-selected image is kept on the phone; SystemUI gets read-only access. */
public final class TopWallpaper {
    public static final Uri URI=Uri.parse("content://ls.augment.com.step.preferences/wallpaper");
    static File path(Context c){return new File(c.getFilesDir(),"step-top-wallpaper.png");}
    public static synchronized boolean custom(Context c){return path(c).isFile();}
    public static synchronized void save(Context c,Bitmap image)throws IOException{
        AtomicFile file=new AtomicFile(path(c));FileOutputStream stream=null;
        try{stream=file.startWrite();if(!image.compress(Bitmap.CompressFormat.PNG,100,stream))throw new IOException("image encoding failed");file.finishWrite(stream);}
        catch(IOException|RuntimeException failure){if(stream!=null)file.failWrite(stream);throw failure;}
        changed(c);
    }
    public static synchronized void reset(Context c){new AtomicFile(path(c)).delete();changed(c);}
    static void changed(Context c){
        c.getContentResolver().notifyChange(URI,null);
        c.sendBroadcast(QuickPreferences.snapshot(c,new Intent(StepRuntime.ACTION).setPackage("com.android.systemui").putExtra("operation","quickPins")));
    }
    public static Bitmap load(Context c){
        try(InputStream input=c.getContentResolver().openInputStream(URI)){
            if(input!=null){Bitmap image=BitmapFactory.decodeStream(input);if(image!=null)return image;}
        }catch(IOException|RuntimeException ignored){}
        Bitmap current=StepMaterial.wallpaper(c,2048);if(current!=null)return current;
        // A factory wallpaper can be resource-backed with no wallpaper file.
        // Resolve it through the system manager instead of leaving a color-only page.
        try{
            android.app.WallpaperManager manager=c.getSystemService(android.app.WallpaperManager.class);
            if(manager.getWallpaperInfo()!=null)return null;
            android.graphics.drawable.Drawable art=manager.getDrawable();if(art==null)return null;
            int w=art.getIntrinsicWidth(),h=art.getIntrinsicHeight();if(w<1 || h<1)return null;
            float scale=Math.min(1f,2048f/Math.max(w,h));
            Bitmap image=Bitmap.createBitmap(Math.max(1,Math.round(w*scale)),Math.max(1,Math.round(h*scale)),Bitmap.Config.ARGB_8888);
            art.setBounds(0,0,image.getWidth(),image.getHeight());art.draw(new android.graphics.Canvas(image));return image;
        }catch(RuntimeException unavailable){return null;}
    }
}
