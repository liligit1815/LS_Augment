package ls.augment.com;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.provider.OpenableColumns;
import java.io.FileNotFoundException;
import java.io.IOException;

/** Non-exported, read-only cached-content provider; access requires a per-URI grant. */
public final class AtomicWorkbenchTransferProvider extends ContentProvider {
    @Override public boolean onCreate() { return true; }
    @Override public String getType(Uri uri) {
        try { return AtomicWorkbenchTransferStore.resolve(getContext(), uri).mime; }
        catch (IOException invalid) { return null; }
    }
    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) {
        try {
            AtomicWorkbenchTransferStore.Entry entry = AtomicWorkbenchTransferStore.resolve(getContext(), uri);
            String[] columns = projection == null ? new String[]{OpenableColumns.DISPLAY_NAME, OpenableColumns.SIZE} : projection;
            MatrixCursor cursor = new MatrixCursor(columns, 1); Object[] values = new Object[columns.length];
            for (int index = 0; index < columns.length; index++) {
                if (OpenableColumns.DISPLAY_NAME.equals(columns[index])) values[index] = entry.name;
                else if (OpenableColumns.SIZE.equals(columns[index])) values[index] = entry.file.length();
            }
            cursor.addRow(values); return cursor;
        } catch (IOException invalid) { throw new IllegalArgumentException("素材不存在或已过期"); }
    }
    @Override public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
        if (!"r".equals(mode)) throw new FileNotFoundException("Read-only transfer content");
        try { return ParcelFileDescriptor.open(AtomicWorkbenchTransferStore.resolve(getContext(), uri).file, ParcelFileDescriptor.MODE_READ_ONLY); }
        catch (IOException invalid) { throw new FileNotFoundException("素材不存在或已过期"); }
    }
    @Override public Uri insert(Uri uri, ContentValues values) { throw new UnsupportedOperationException(); }
    @Override public int delete(Uri uri, String selection, String[] args) { throw new UnsupportedOperationException(); }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { throw new UnsupportedOperationException(); }
}
