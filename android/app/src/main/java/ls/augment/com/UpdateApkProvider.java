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

/** Non-exported, read-only installation grants for verified update APKs only. */
public final class UpdateApkProvider extends ContentProvider {
    private static final String PREFS = "update-apk-grants";
    private static final long GRANT_LIFETIME = 24L * 60 * 60 * 1000;

    static File directory(Context context) {
        return new File(context.getCacheDir(), "app-updates");
    }

    static Uri grant(Context context, File apk) throws FileNotFoundException {
        File safe = safeFile(context, apk.getName());
        try { if (!safe.getCanonicalPath().equals(apk.getCanonicalPath())) throw new FileNotFoundException(); }
        catch (java.io.IOException invalid) { throw new FileNotFoundException(); }
        String token = UUID.randomUUID().toString();
        if (!context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                .putString(token, apk.getName()).putLong(token + ":expires", System.currentTimeMillis() + GRANT_LIFETIME)
                .commit()) throw new FileNotFoundException();
        return new Uri.Builder().scheme("content").authority(context.getPackageName() + ".updates")
                .appendPath(token).appendPath(apk.getName()).build();
    }

    private static File safeFile(Context context, String name) throws FileNotFoundException {
        if (name == null || !name.matches("verified-[0-9a-f]{64}\\.apk")) throw new FileNotFoundException();
        File file = new File(directory(context), name);
        try {
            if (!file.isFile() || !file.getCanonicalFile().getParentFile().equals(directory(context).getCanonicalFile()))
                throw new FileNotFoundException();
        } catch (java.io.IOException invalid) { throw new FileNotFoundException(); }
        return file;
    }

    private File resolve(Uri uri) throws FileNotFoundException {
        List<String> parts = uri.getPathSegments();
        if (!"content".equals(uri.getScheme()) || !getContext().getPackageName().concat(".updates").equals(uri.getAuthority())
                || uri.getQuery() != null || uri.getFragment() != null || parts.size() != 2) throw new FileNotFoundException();
        android.content.SharedPreferences prefs = getContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        if (!parts.get(1).equals(prefs.getString(parts.get(0), ""))
                || prefs.getLong(parts.get(0) + ":expires", 0) < System.currentTimeMillis()) throw new FileNotFoundException();
        return safeFile(getContext(), parts.get(1));
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
