package ls.augment.com;

import android.content.ContentProvider;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.ContextWrapper;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.ParcelFileDescriptor;
import android.os.Process;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

/** Test-only transport for the production module cache, confined to a disposable app directory. */
public final class ComboPrivateProviderFixture implements AutoCloseable {
    private static final String HOST="cn.nubia.gamehelpmodule";
    private final Context module,client;
    private final int hostUid;
    public ComboPrivateProviderFixture(Context context,File cache)throws Exception {
        hostUid=context.getPackageManager().getApplicationInfo(HOST,0).uid;
        module=new ContextWrapper(context){@Override public File getCacheDir(){return cache;}};
        ContentProvider provider=new ContentProvider(){
            @Override public boolean onCreate(){return true;}
            @Override public Bundle call(String method,String arg,Bundle extras){
                if(!ComboMotionPrivateCache.CALL.equals(method)||arg!=null)return new Bundle();
                Bundle delivered=new Bundle(extras);
                try {
                    // A local resolver skips Binder parceling. Give the receiver its own FD,
                    // just as the real provider transport does, so ownership is also tested.
                    ParcelFileDescriptor source=extras.getParcelable("source");
                    if(source!=null)delivered.putParcelable("source",ParcelFileDescriptor.dup(source.getFileDescriptor()));
                    return ComboMotionPrivateCache.prepare(module,hostUid,HOST,new String[]{HOST},delivered);
                }catch(IOException failure){throw new IllegalStateException(failure);}
            }
            @Override public ParcelFileDescriptor openFile(Uri uri,String mode)throws FileNotFoundException {
                return ComboMotionPrivateCache.open(module,hostUid,HOST,new String[]{HOST},uri,mode);
            }
            @Override public Cursor query(Uri uri,String[] projection,String selection,String[] args,String sort){throw new UnsupportedOperationException();}
            @Override public String getType(Uri uri){return null;}
            @Override public Uri insert(Uri uri,ContentValues values){throw new UnsupportedOperationException();}
            @Override public int delete(Uri uri,String selection,String[] args){throw new UnsupportedOperationException();}
            @Override public int update(Uri uri,ContentValues values,String selection,String[] args){throw new UnsupportedOperationException();}
        };
        ContentResolver resolver=ContentResolver.wrap(provider);
        client=new ContextWrapper(context){
            @Override public String getPackageName(){return HOST;}
            @Override public ContentResolver getContentResolver(){return resolver;}
        };
    }
    public Context client(){return client;}
    public boolean rejectsUntrustedCaller(){
        return !ComboMotionPrivateCache.prepare(module,Process.myUid(),"ls.augment.com",new String[]{"ls.augment.com"},new Bundle()).getBoolean("ok")
                &&!ComboMotionPrivateCache.allowed(module,hostUid+100000,HOST,new String[]{HOST});
    }
    /** Corruption injection is confined to the module's fixture; the host receives only FDs. */
    public File privateOutput(String identity)throws IOException {
        if(!identity.matches("[0-9a-f]{64}"))throw new IOException("invalid fixture identity");
        File root=module.getCacheDir().getCanonicalFile();
        File output=new File(root,"combo-motion-v1/ls_augment_combo/motion-v3-"+identity+".json").getCanonicalFile();
        if(!output.toPath().startsWith(root.toPath()))throw new IOException("fixture escaped");return output;
    }
    @Override public void close()throws IOException {if(!ComboMotionPrivateCache.clear(module))throw new IOException("private fixture cleanup");}
}
