package ls.augment.com;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.ContextThemeWrapper;
import android.view.View;
import android.view.ViewGroup;

/** Reusable native content owned by one real Activity, with explicit lifecycle
 * and document-result forwarding. This is not an Activity or child window. */
abstract class NativeEditorController extends ContextThemeWrapper {
    interface Host { void launchEditorResult(NativeEditorController editor,Intent intent,int requestCode); }
    static final int RESULT_OK=Activity.RESULT_OK;
    final Activity owner;
    final boolean embedded;
    final String route;
    private View content;
    private boolean destroyed;
    NativeEditorController(Activity owner,String route,boolean embedded){
        super(owner,owner.getTheme());this.owner=owner;this.route=route;this.embedded=embedded;
    }
    UiKit editorUi(){
        UiKit ui=new UiKit(owner);
        if(embedded)ui.setContentReceiver(this::captureContent);
        return ui;
    }
    final void captureContent(View view){
        if(view.getParent() instanceof ViewGroup)((ViewGroup)view.getParent()).removeView(view);
        content=view;
    }
    final View view(){if(content==null)throw new IllegalStateException("Editor did not create content: "+route);return content;}
    final Intent getIntent(){return new Intent(owner.getIntent()).putExtra(FeatureActivity.EXTRA_MODULE,route);}
    final void runOnUiThread(Runnable runnable){owner.runOnUiThread(runnable);}
    final boolean isDestroyed(){return destroyed||owner.isDestroyed();}
    final boolean isFinishing(){return owner.isFinishing();}
    final void finish(){owner.finish();}
    final android.window.OnBackInvokedDispatcher getOnBackInvokedDispatcher(){return owner.getOnBackInvokedDispatcher();}
    final void startActivityForResult(Intent intent,int requestCode){
        if(owner instanceof Host)((Host)owner).launchEditorResult(this,intent,requestCode);
        else owner.startActivityForResult(intent,requestCode);
    }
    protected void onCreate(Bundle state) { }
    protected void onResume() { }
    protected void onPause() { }
    protected void onDestroy() { destroyed=true; }
    protected void onSaveInstanceState(Bundle state) { }
    protected void onActivityResult(int request,int result,Intent data) { }
    public void onBackPressed(){finish();}
}
