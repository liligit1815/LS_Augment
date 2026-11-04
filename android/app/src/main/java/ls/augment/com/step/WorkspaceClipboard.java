package ls.augment.com.step;
import android.content.*;
import android.os.*;
import java.util.function.Consumer;

final class WorkspaceClipboard {
    static final TextClips history=new TextClips();
    static ClipboardManager manager;
    static Context ctx;
    static Consumer<Boolean> changed;
    static boolean available(){return manager!=null;}
    static boolean readable(){return StepRuntime.enabled && ctx!=null && StepRuntime.interactive(ctx) && ctx.getSystemService(UserManager.class).isUserForeground();}
    static void install(Context system){
        if(manager!=null || system.checkSelfPermission("android.permission.READ_CLIPBOARD_IN_BACKGROUND")!=android.content.pm.PackageManager.PERMISSION_GRANTED)return;
        try{
            ctx=system;ClipboardManager cm=system.getSystemService(ClipboardManager.class);
            if(cm==null)return;
            cm.addPrimaryClipChangedListener(WorkspaceClipboard::read);manager=cm;
        }catch(RuntimeException unavailable){manager=null;ctx=null;}
    }
    static void read(){
        try{
            if(!readable() || manager==null)return;
            ClipDescription desc=manager.getPrimaryClipDescription();
            if(desc==null || desc.getExtras()!=null && desc.getExtras().getBoolean(ClipDescription.EXTRA_IS_SENSITIVE))return;
            ClipData data=manager.getPrimaryClip();
            if(data==null || data.getItemCount()!=1 || data.getDescription()==null || !readable())return;
            desc=data.getDescription();boolean sensitive=desc.getExtras()!=null && desc.getExtras().getBoolean(ClipDescription.EXTRA_IS_SENSITIVE);
            CharSequence value=sensitive?null:data.getItemAt(0).getText();
            if(value!=null && value.length()>8192)return;
            history.observe(desc.getTimestamp(),value==null?null:value.toString(),sensitive);
            if(changed!=null)changed.accept(false);
        }catch(RuntimeException ignored){}
    }
    static boolean copy(String value){
        if(!readable() || manager==null || !history.list().contains(value))return false;
        try{manager.setPrimaryClip(ClipData.newPlainText("红魔 Step",value));return true;}catch(RuntimeException denied){return false;}
    }
    static void systemEvent(String action){
        if("android.intent.action.USER_SWITCHED".equals(action)){history.reset();PlayerCard.forget();}
        if(changed!=null)changed.accept(true);
    }
}
