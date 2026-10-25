package ls.augment.com;

import android.content.ClipData;
import android.content.ClipDescription;
import android.content.Intent;
import android.net.Uri;
import android.os.PersistableBundle;
import java.util.ArrayList;

/** Bounded native source payload. No URI coercion, paths, URLs or nested Intents. */
public final class AtomicWorkbenchSourceDragData {
    public static final String PROBE = "source_drag_probe", OFFER = "source_drag_offer";
    public static final String CALLBACK = "ls.augment.com.source_drag_result.v1";
    public final Intent input;
    public final ArrayList<Uri> uris;
    public final String label;
    public final PersistableBundle decoration;
    public final ClipData clip;

    private AtomicWorkbenchSourceDragData(Intent input, ArrayList<Uri> uris, String label, PersistableBundle decoration) {
        this.input = input; this.uris = uris; this.label = label; this.decoration = decoration;
        // Transport bounded plain values, never arbitrary app extras, spans or HTML.
        CharSequence text = input.getCharSequenceExtra(Intent.EXTRA_TEXT);
        ClipDescription description = new ClipDescription(label, uris.isEmpty() ? new String[]{"text/plain"}
                : text == null ? new String[]{"application/octet-stream"} : new String[]{"application/octet-stream", "text/plain"});
        description.setExtras(decoration);
        clip = new ClipData(description, new ClipData.Item(text, null, null, uris.isEmpty() ? null : uris.get(0)));
        for (int i = 1; i < uris.size(); i++) clip.addItem(new ClipData.Item(uris.get(i)));
    }

    public static AtomicWorkbenchSourceDragData read(ClipData clip) {
        if (clip == null || clip.getItemCount() < 1 || clip.getItemCount() > 17) throw new IllegalArgumentException("source_items");
        ArrayList<Uri> uris = new ArrayList<>(); StringBuilder text = new StringBuilder();
        for (int i = 0; i < clip.getItemCount(); i++) {
            ClipData.Item item = clip.getItemAt(i);
            if (item == null || item.getIntent() != null || item.getHtmlText() != null && item.getText() == null)
                throw new IllegalArgumentException("source_item");
            Uri uri = item.getUri();
            if (uri != null) {
                if (!"content".equals(uri.getScheme()) || uri.getAuthority() == null || uri.getAuthority().contains("@")
                        || uri.toString().length() > 8192 || uris.size() == 16 || uris.contains(uri))
                    throw new IllegalArgumentException("source_uri");
                uris.add(uri);
            }
            CharSequence value = item.getText();
            if (value != null && value.length() > 0) {
                if (value.length() > 32768 - text.length() - (text.length() == 0 ? 0 : 1)) throw new IllegalArgumentException("source_text");
                if (text.length() > 0) text.append('\n');
                text.append(value);
            }
        }
        if (uris.isEmpty() && text.length() == 0) throw new IllegalArgumentException("source_empty");
        Intent input = new Intent(uris.size() > 1 ? Intent.ACTION_SEND_MULTIPLE : Intent.ACTION_SEND);
        if (!uris.isEmpty()) {
            if (uris.size() == 1) input.putExtra(Intent.EXTRA_STREAM, uris.get(0));
            else input.putParcelableArrayListExtra(Intent.EXTRA_STREAM, uris);
        }
        if (text.length() > 0) input.putExtra(Intent.EXTRA_TEXT, text.toString());
        // Only OEM presentation hints survive. The host grants its own cache URI, never source identity.
        ClipDescription description = clip.getDescription();
        PersistableBundle hints = new PersistableBundle();
        PersistableBundle source = description == null ? null : description.getExtras();
        if (source != null) {
            if (Boolean.TRUE.equals(source.get("isFromGallery"))) hints.putBoolean("isFromGallery", true);
            if ("true".equals(source.get("third_app_drag_drop_flag"))) hints.putString("third_app_drag_drop_flag", "true");
        }
        String label = uris.isEmpty() ? "text drag" : "file drag";
        return new AtomicWorkbenchSourceDragData(input, uris, label, hints);
    }
}
