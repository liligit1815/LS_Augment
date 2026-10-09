package ls.augment.com;

import android.app.Activity;
import android.content.ComponentName;
import android.os.SystemClock;
import android.view.View;
import android.widget.Switch;
import android.widget.Toast;
import java.util.concurrent.ExecutorService;

/** The feature switch reflects actual QS membership, independently of dimming state. */
final class ExtraDimTilePreference {
    private final Activity activity;
    private final ExecutorService worker;
    private final Switch toggle;
    private final View row;
    private boolean rendering;

    ExtraDimTilePreference(Activity activity, UiKit ui, ExecutorService worker) {
        this.activity=activity;
        this.worker=worker;
        toggle=new Switch(activity);
        toggle.setTag("extra-dim-tile");
        toggle.setEnabled(false);
        row=ui.featureRow("极暗","开启后将极暗磁贴加入控制中心，关闭后移除磁贴。点击磁贴开关极暗，长按调节强度。",toggle);
        toggle.setOnCheckedChangeListener((button,enabled)->{
            if(rendering)return;
            toggle.setEnabled(false);
            worker.execute(()->{
                boolean ok=setPresent(activity,enabled);
                Boolean actual=isPresent(activity);
                activity.runOnUiThread(()->{
                    if(activity.isDestroyed())return;
                    show(actual);
                    if(!ok)Toast.makeText(activity,"极暗磁贴未更新，请检查 Root 授权后重试",Toast.LENGTH_LONG).show();
                });
            });
        });
    }

    View view(){return row;}

    void refresh(){
        toggle.setEnabled(false);
        worker.execute(()->{
            Boolean actual=isPresent(activity);
            activity.runOnUiThread(()->{
                if(activity.isDestroyed())return;
                show(actual);
                if(actual==null)Toast.makeText(activity,"暂时无法读取极暗磁贴，请检查 Root 授权后重新进入页面",Toast.LENGTH_LONG).show();
            });
        });
    }

    private void show(Boolean actual){
        rendering=true;
        toggle.setChecked(Boolean.TRUE.equals(actual));
        toggle.setEnabled(actual!=null);
        rendering=false;
    }

    static Boolean isPresent(android.content.Context context){
        int user=android.os.Process.myUid()/100000;
        RootShell.Result result=RootShell.run("settings --user "+user+" get secure sysui_qs_tiles",null,4,16384);
        if(!result.isSuccess())return null;
        String tiles=result.output.trim();
        if(tiles.isEmpty())return null;
        ComponentName component=new ComponentName(context,ExtraDimTileService.class);
        for(String spec:tiles.split(",")){
            spec=spec.trim();
            if(spec.startsWith("custom(")&&spec.endsWith(")")
                    &&component.equals(ComponentName.unflattenFromString(spec.substring(7,spec.length()-1))))return true;
        }
        return false;
    }

    static boolean setPresent(android.content.Context context,boolean enabled){
        int user=android.os.Process.myUid()/100000;
        String component=new ComponentName(context,ExtraDimTileService.class).flattenToShortString();
        // StatusBar commands act on the foreground user; never edit another user's tiles.
        RootShell.Result result=RootShell.run("[ \"$(am get-current-user)\" = \""+user+"\" ] && cmd statusbar "
                +(enabled?"add-tile ":"remove-tile ")+RootShell.quote(component),null,5,1024);
        if(!result.isSuccess())return false;
        long deadline=SystemClock.uptimeMillis()+2000;
        do{
            if(Boolean.valueOf(enabled).equals(isPresent(context)))return true;
            SystemClock.sleep(100);
        }while(SystemClock.uptimeMillis()<deadline);
        return false;
    }
}
