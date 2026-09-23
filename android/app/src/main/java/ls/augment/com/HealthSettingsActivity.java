package ls.augment.com;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

/** Standalone destination using the same controller as the application page. */
public final class HealthSettingsActivity extends Activity {
    private HealthEditorController editor;
    @Override protected void onCreate(Bundle state){super.onCreate(state);editor=new HealthEditorController(this,"mi_health",false);editor.onCreate(state);}
    @Override protected void onResume(){super.onResume();if(editor!=null)editor.onResume();}
    @Override protected void onPause(){if(editor!=null)editor.onPause();super.onPause();}
    @Override protected void onDestroy(){if(editor!=null)editor.onDestroy();super.onDestroy();}
    @Override protected void onSaveInstanceState(Bundle state){if(editor!=null)editor.onSaveInstanceState(state);super.onSaveInstanceState(state);}
    @Override protected void onActivityResult(int request,int result,Intent data){super.onActivityResult(request,result,data);if(editor!=null)editor.onActivityResult(request,result,data);}
}
