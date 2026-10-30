package ls.augment.com;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.provider.OpenableColumns;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;
import java.util.UUID;
import java.util.*;
import java.io.IOException;
import java.nio.file.Files;

/** Non-exported, read-only installation grants for verified update APKs only. */
public final class UpdateApkProvider extends ContentProvider {
    private static final String PREFS = "update-apk-grants";
    private static final long GRANT_LIFETIME = 24L * 60 * 60 * 1000;
    // Retention target for disposable APKs, not a limit on live installer grants.
    static final int MAX_GRANTS = 32, MAX_APKS = 2;
    static final long CACHE_BYTES = 4L * 1024 * 1024 * 1024;
    private static DownloadLease downloading;

    static final class DownloadLease implements AutoCloseable {
        final File temporary, cached;
        private DownloadLease(File temporary, File cached) {
            this.temporary=temporary;this.cached=cached;
        }
        @Override public void close() {
            synchronized(UpdateApkProvider.class) {
                if(downloading!=this)return;
                temporary.delete();downloading=null;
            }
        }
    }
    static synchronized DownloadLease beginDownload(Context context, String hash, long size) throws IOException {
        if(downloading!=null)throw new IOException("update_download_busy");
        if(!hash.matches("[0-9a-f]{64}")||size<=0||size>AppUpdatePolicy.MAX_APK_BYTES)throw new IOException("invalid_update");
        File root=directory(context);checkRoot(context);
        if(!root.isDirectory()&&!root.mkdirs())throw new IOException("update_cache_unavailable");
        File cached=new File(root,"verified-"+hash+".apk");
        if(Files.isSymbolicLink(cached.toPath())||(cached.exists()&&!cached.isFile()))throw new IOException("invalid_update_cache");
        // A valid cached APK is reused; an invalid one is deleted before streaming.
        maintain(context,cached.getName(),Math.max(0,size-cached.length()));
        downloading=new DownloadLease(new File(root,"download-"+UUID.randomUUID()+".part"),cached);
        return downloading;
    }
    static synchronized void clean(Context context) throws IOException { maintain(context,null,0); }
    private static Map<String,String> grants(Context context,long now) throws IOException {
        android.content.SharedPreferences prefs=context.getSharedPreferences(PREFS,Context.MODE_PRIVATE);
        Map<String,?> values=prefs.getAll();Map<String,String> valid=new HashMap<>();
        android.content.SharedPreferences.Editor edit=prefs.edit();boolean changed=false;
        for(Map.Entry<String,?> entry:values.entrySet()) {
            String token=entry.getKey();if(token.endsWith(":expires"))continue;
            Object expiration=values.get(token+":expires");
            boolean live=entry.getValue() instanceof String&&expiration instanceof Long
                    &&(Long)expiration>now&&(Long)expiration-now<=GRANT_LIFETIME;
            if(live)try{safeFile(context,(String)entry.getValue());}catch(FileNotFoundException invalid){live=false;}
            if(live)valid.put(token,(String)entry.getValue());
            else{edit.remove(token).remove(token+":expires");changed=true;}
        }
        for(String key:values.keySet())if(key.endsWith(":expires")&&!values.containsKey(key.substring(0,key.length()-8))){edit.remove(key);changed=true;}
        if(changed&&!edit.commit())throw new IOException("update_grant_cleanup_failed");
        return valid;
    }
    private static void maintain(Context context,String selected,long reserve) throws IOException {
        checkRoot(context);
        long now=System.currentTimeMillis();Set<String> pinned=new HashSet<>(grants(context,now).values());
        if(selected!=null)pinned.add(selected);
        if(downloading!=null){pinned.add(downloading.cached.getName());pinned.add(downloading.temporary.getName());}
        File root=directory(context);File[] entries=root.listFiles();
        if(entries==null){if(root.exists())throw new IOException("update_cache_unreadable");return;}
        Arrays.sort(entries,Comparator.comparingLong(File::lastModified).reversed());
        long bytes=reserve;int count=selected!=null&&!new File(root,selected).exists()?1:0;
        for(File file:entries)if(pinned.contains(file.getName())){
            bytes=Math.addExact(bytes,file.length());
            if(file.getName().equals(selected))count++;
        }
        for(File file:entries) {
            String name=file.getName();if(pinned.contains(name))continue;
            boolean apk=name.matches("verified-[0-9a-f]{64}\\.apk"),part=name.matches("download-[a-f0-9-]+\\.part");
            if(!apk&&!part)continue;
            boolean safe=!Files.isSymbolicLink(file.toPath())&&file.isFile()&&file.getCanonicalFile().getParentFile().equals(root.getCanonicalFile());
            if(apk&&safe&&file.lastModified()<=now&&now-file.lastModified()<GRANT_LIFETIME
                    &&count<MAX_APKS&&file.length()<=CACHE_BYTES-bytes){count++;bytes+=file.length();continue;}
            if(!file.delete())throw new IOException("update_cache_cleanup_failed");
        }
        // Existing, still-live installer grants are never revoked to make room.
        // Live grants remain bounded by MAX_GRANTS and the total byte budget. They
        // must not consume the two disposable cache slots and block the next update.
        if(selected!=null&&bytes>CACHE_BYTES)throw new IOException("update_cache_busy");
    }

    static File directory(Context context) {
        return new File(context.getCacheDir(), "app-updates");
    }
    private static void checkRoot(Context context) throws IOException {
        File root=directory(context);
        if(Files.isSymbolicLink(root.toPath())||!root.getCanonicalFile().getParentFile().equals(context.getCacheDir().getCanonicalFile()))
            throw new IOException("invalid_update_cache_root");
    }

    static synchronized Uri grant(Context context, File apk) throws FileNotFoundException {
        File safe = safeFile(context, apk.getName());
        try { if (!safe.getCanonicalPath().equals(apk.getCanonicalPath())) throw new FileNotFoundException(); }
        catch (java.io.IOException invalid) { throw new FileNotFoundException(); }
        Map<String,String> live;
        try{live=grants(context,System.currentTimeMillis());}catch(IOException error){throw new FileNotFoundException("Grant cleanup failed");}
        String token = null;
        for(Map.Entry<String,String> entry:live.entrySet())if(entry.getValue().equals(apk.getName())){token=entry.getKey();break;}
        if(token!=null){
            if(!context.getSharedPreferences(PREFS,Context.MODE_PRIVATE).edit()
                    .putLong(token+":expires",System.currentTimeMillis()+GRANT_LIFETIME).commit())throw new FileNotFoundException("Grant renewal failed");
            return grantUri(context,token,apk.getName());
        }
        if(live.size()>=MAX_GRANTS)throw new FileNotFoundException("Installer grants busy");
        token = UUID.randomUUID().toString();
        if (!context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                .putString(token, apk.getName()).putLong(token + ":expires", System.currentTimeMillis() + GRANT_LIFETIME)
                .commit()) throw new FileNotFoundException();
        return grantUri(context,token,apk.getName());
    }
    private static Uri grantUri(Context context,String token,String name){return new Uri.Builder().scheme("content")
            .authority(context.getPackageName()+".updates").appendPath("verified").appendPath(token).appendPath(name).build();}

    private static File safeFile(Context context, String name) throws FileNotFoundException {
        if (name == null || !name.matches("verified-[0-9a-f]{64}\\.apk")) throw new FileNotFoundException();
        File file = new File(directory(context), name);
        try {
            checkRoot(context);
            if (Files.isSymbolicLink(file.toPath()) || !file.isFile() || !file.getCanonicalFile().getParentFile().equals(directory(context).getCanonicalFile()))
                throw new FileNotFoundException();
        } catch (java.io.IOException invalid) { throw new FileNotFoundException(); }
        return file;
    }

    private File resolve(Uri uri) throws FileNotFoundException {
        List<String> parts = uri.getPathSegments();
        // New grants are restricted by the manifest to /verified/. A previously
        // issued, unexpired installer grant may still use the former two-part URI.
        int offset = parts.size() == 3 && "verified".equals(parts.get(0)) ? 1 : 0;
        if (!"content".equals(uri.getScheme()) || !getContext().getPackageName().concat(".updates").equals(uri.getAuthority())
                || uri.getQuery() != null || uri.getFragment() != null || parts.size() != 2 + offset) throw new FileNotFoundException();
        android.content.SharedPreferences prefs = getContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        if (!parts.get(1 + offset).equals(prefs.getString(parts.get(offset), ""))
                || prefs.getLong(parts.get(offset) + ":expires", 0) < System.currentTimeMillis()) throw new FileNotFoundException();
        return safeFile(getContext(), parts.get(1 + offset));
    }

    @Override public boolean onCreate() { return true; }
    @Override public String getType(Uri uri) {
        try { resolve(uri); return "application/vnd.android.package-archive"; }
        catch (FileNotFoundException invalid) { throw new IllegalArgumentException("Unknown update APK"); }
    }
    @Override public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
        if (!"r".equals(mode)) throw new FileNotFoundException("Read-only update APK");
        return ParcelFileDescriptor.open(resolve(uri), ParcelFileDescriptor.MODE_READ_ONLY);
    }
    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) {
        try {
            File file = resolve(uri);
            String[] columns = projection == null ? new String[]{OpenableColumns.DISPLAY_NAME, OpenableColumns.SIZE} : projection;
            MatrixCursor cursor = new MatrixCursor(columns, 1);
            Object[] values = new Object[columns.length];
            for (int i = 0; i < columns.length; i++) {
                if (OpenableColumns.DISPLAY_NAME.equals(columns[i])) values[i] = "RedMagicDuo-update.apk";
                if (OpenableColumns.SIZE.equals(columns[i])) values[i] = file.length();
            }
            cursor.addRow(values); return cursor;
        } catch (FileNotFoundException invalid) { throw new IllegalArgumentException("Unknown update APK"); }
    }
    @Override public Uri insert(Uri uri, ContentValues values) { throw new UnsupportedOperationException(); }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { throw new UnsupportedOperationException(); }
    @Override public int delete(Uri uri, String selection, String[] args) { throw new UnsupportedOperationException(); }
}
