package ls.augment.com;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

/** Standalone destination using the same controller as the application page. */
public final class FeatureActivity extends Activity {
    static final String EXTRA_MODULE=FeatureEditorController.EXTRA_MODULE;
    static final String MODULE_SHOULDER=FeatureEditorController.MODULE_SHOULDER;
    static final String MODULE_AI_TRIGGER=FeatureEditorController.MODULE_AI_TRIGGER;
    static final String MODULE_COMBO_SPEED=FeatureEditorController.MODULE_COMBO_SPEED;
    static final String MODULE_FAN_CONTROL=FeatureEditorController.MODULE_FAN_CONTROL;
    static final String MODULE_FREEFORM=FeatureEditorController.MODULE_FREEFORM;
    static final String MODULE_AUDIO_GAIN=FeatureEditorController.MODULE_AUDIO_GAIN;
    static final String MODULE_SUPER_RESOLUTION=FeatureEditorController.MODULE_SUPER_RESOLUTION;
    static final String MODULE_DIABLO_COEXIST=FeatureEditorController.MODULE_DIABLO_COEXIST;
    static final String MODULE_STATUS_LAYOUT=FeatureEditorController.MODULE_STATUS_LAYOUT;
    static final String MODULE_STATUS_CLOCK=FeatureEditorController.MODULE_STATUS_CLOCK;
    static final String MODULE_STATUS_METRICS=FeatureEditorController.MODULE_STATUS_METRICS;
    static final String MODULE_DOUBLE_APP=FeatureEditorController.MODULE_DOUBLE_APP;
    static final String MODULE_BEAUTIFY=FeatureEditorController.MODULE_BEAUTIFY;
    static final String MODULE_SIGNATURE_INSTALL=FeatureEditorController.MODULE_SIGNATURE_INSTALL;
    static final String MODULE_AUTOMATION=FeatureEditorController.MODULE_AUTOMATION;
    static final String MODULE_TILE=FeatureEditorController.MODULE_TILE;
    static final String MODULE_LAUNCHER_ICON=FeatureEditorController.MODULE_LAUNCHER_ICON;
    static final String MODULE_DIAGNOSTICS=FeatureEditorController.MODULE_DIAGNOSTICS;
    static final String MODULE_DETAILED_DIAGNOSTICS=FeatureEditorController.MODULE_DETAILED_DIAGNOSTICS;
    private FeatureEditorController editor;
    @Override protected void onCreate(Bundle state){super.onCreate(state);if("battery".equals(getIntent().getStringExtra(EXTRA_MODULE))){finish();return;}editor=new FeatureEditorController(this,getIntent().getStringExtra(EXTRA_MODULE),false);editor.onCreate(state);}
    @Override protected void onResume(){super.onResume();if(editor!=null)editor.onResume();}
    @Override protected void onPause(){if(editor!=null)editor.onPause();super.onPause();}
    @Override protected void onDestroy(){if(editor!=null)editor.onDestroy();super.onDestroy();}
    @Override protected void onSaveInstanceState(Bundle state){if(editor!=null)editor.onSaveInstanceState(state);super.onSaveInstanceState(state);}
    @Override protected void onActivityResult(int request,int result,Intent data){super.onActivityResult(request,result,data);if(editor!=null)editor.onActivityResult(request,result,data);}
}
