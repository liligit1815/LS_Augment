package ls.augment.com.step;

import android.content.*;
import android.content.pm.ApplicationInfo;
import android.database.Cursor;
import android.net.Uri;
import android.os.*;
import java.util.*;

/** SystemUI can read and commit the module's user-local configuration, including after a reboot. */
public final class WorkspacePrefsProvider extends ContentProvider {
    static final Uri URI=Uri.parse("content://ls.augment.com.step.preferences");
    public boolean onCreate(){return true;}
    void authorize(){
        Context c=getContext();
        int caller=Binder.getCallingUid();
        if(caller!=android.os.Process.myUid()) {
            try {
                ApplicationInfo ui=c.getPackageManager().getApplicationInfo("com.android.systemui",0);
                if(ui.uid!=caller || (ui.flags&(ApplicationInfo.FLAG_SYSTEM|ApplicationInfo.FLAG_UPDATED_SYSTEM_APP))==0)
                    throw new SecurityException("Caller is not this user's SystemUI");
            } catch(android.content.pm.PackageManager.NameNotFoundException e){throw new SecurityException(e);}
        }
    }
    @Override public ParcelFileDescriptor openFile(Uri uri,String mode)throws java.io.FileNotFoundException{
        authorize();
        if(!TopWallpaper.URI.equals(uri) || !"r".equals(mode))throw new java.io.FileNotFoundException("read-only top wallpaper");
        return ParcelFileDescriptor.open(TopWallpaper.path(getContext()),ParcelFileDescriptor.MODE_READ_ONLY);
    }
    @Override public synchronized Bundle call(String method,String arg,Bundle data) {
        authorize();Context c=getContext();long identity=Binder.clearCallingIdentity();
        try {
            boolean saved=false;
            if ("save".equals(method)) {
                if(data==null || data.getStringArrayList("keys")==null) throw new IllegalArgumentException("missing selection");
                LinkedHashSet<String> selected=new LinkedHashSet<>();
                for(String key:data.getStringArrayList("keys")) {
                    if(key==null || key.indexOf('\n')>=0 || ComponentName.unflattenFromString(key)==null)
                        throw new IllegalArgumentException("invalid launcher component");
                    selected.add(key);
                }
                saved=QuickPreferences.save(c,selected,data.getLong("revision",-1));
            } else if("sideCount".equals(method)){
                saved=data!=null && QuickPreferences.saveLayout(c,data.getInt("sideCount",-1),data.getBoolean("upperEnabled",QuickPreferences.upper(c)));

            } else if(!"read".equals(method)) throw new IllegalArgumentException("unknown preference action");
            Bundle result=QuickPreferences.snapshot(c,new Intent()).getExtras(); result.putBoolean("saved",saved);return result;
        } finally {Binder.restoreCallingIdentity(identity);}
    }
    public Cursor query(Uri a,String[] b,String c,String[] d,String e){throw new UnsupportedOperationException();}
    public Uri insert(Uri a,ContentValues v){throw new UnsupportedOperationException();}
    public int update(Uri a,ContentValues v,String s,String[] x){throw new UnsupportedOperationException();}
    public int delete(Uri a,String s,String[] x){throw new UnsupportedOperationException();}
    public String getType(Uri u){return null;}
}
