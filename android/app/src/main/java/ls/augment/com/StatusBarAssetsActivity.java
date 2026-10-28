package ls.augment.com;

/** Standalone legacy asset entry; the same controller is embedded in the workspace. */
public final class StatusBarAssetsActivity extends android.app.Activity implements NativeEditorController.Host,ModuleNavigation.AncestorHandler {
    private StatusBarAssetsController editor;
    @Override public void onCreate(android.os.Bundle state){super.onCreate(state);editor=new StatusBarAssetsController(this,false);editor.onCreate(state);}
    @Override protected void onResume(){super.onResume();if(editor!=null)editor.onResume();}
    @Override protected void onPause(){if(editor!=null)editor.onPause();super.onPause();}
    @Override protected void onDestroy(){if(editor!=null)editor.onDestroy();super.onDestroy();}
    @Override protected void onSaveInstanceState(android.os.Bundle out){super.onSaveInstanceState(out);if(editor!=null)editor.onSaveInstanceState(out);}
    @Override protected void onActivityResult(int request,int result,android.content.Intent data){super.onActivityResult(request,result,data);if(editor!=null)editor.onActivityResult(request,result,data);}
    @Override public void launchEditorResult(NativeEditorController source,android.content.Intent intent,int request){startActivityForResult(intent,request);}
    @Override public void navigateToAncestor(String route){editor.navigateToAncestor(route);}
}
