package ls.augment.com.step;

import android.app.Activity;
import android.os.Bundle;
import android.os.Process;
import android.graphics.Bitmap;
import java.util.*;

/** Settings launcher for the same floating picker used by the workspace. */
public final class QuickPinsActivity extends Activity {
    QuickPicker picker;
    long revision;
    @Override public void onCreate(Bundle state){
        super.onCreate(state);
        revision=state==null?QuickPreferences.prefs(this).getLong("revision",0):state.getLong("revision");
        new Thread(()->{
            try{
                List<QuickCatalog.App> catalog=QuickCatalog.load(this,Process.myUserHandle(),false);
                Bitmap wall=StepMaterial.wallpaper(this);
                runOnUiThread(()->{
                    if(isFinishing()||isDestroyed())return;
                    List<String> draft=state==null?null:state.getStringArrayList("draft");
                    picker=new QuickPicker(this,false,catalog,draft==null?QuickPreferences.pins(this):draft,wall,
                        keys->QuickPreferences.save(this,keys,revision),this::finish);
                    if(state!=null)picker.search.setText(state.getString("search",""));
                    picker.show();
                });
            }catch(RuntimeException|LinkageError error){runOnUiThread(()->{android.widget.Toast.makeText(this,"当前用户的应用目录不可用",android.widget.Toast.LENGTH_SHORT).show();finish();});}
        },"DuoStepQuickPicker").start();
    }
    @Override protected void onSaveInstanceState(Bundle out){
        super.onSaveInstanceState(out);out.putLong("revision",revision);if(picker!=null)out.putAll(picker.draft());
    }
    @Override protected void onDestroy(){if(picker!=null){picker.dialog.setOnDismissListener(null);picker.close();}super.onDestroy();}
}
