package ls.augment.com;

import android.content.ClipData;
import android.content.Intent;
import android.net.Uri;
import java.io.IOException;
import java.util.LinkedHashSet;
import java.util.List;

/** Same-app handoff only: feed pickerResult to TransferStore.importIntent(context, result, true). */
final class AtomicWorkbenchContentSelection {
    private AtomicWorkbenchContentSelection() { }

    static Intent pickerResult(List<AtomicWorkbenchContentItem> items) throws IOException {
        if (items == null || items.isEmpty() || items.size() > AtomicWorkbenchContentPolicy.MAX_SELECTION)
            throw new IOException("请选择 1–16 个文件");
        LinkedHashSet<String> mimes = new LinkedHashSet<>();
        for (AtomicWorkbenchContentItem item : items) {
            if (item == null || item.kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD || !AtomicWorkbenchContentItem.contentUri(item.uri))
                throw new IOException("内容已变化，请重新选择");
            mimes.add(item.mime);
        }
        ClipData clip = new ClipData("工作台手机内容", mimes.toArray(new String[0]), new ClipData.Item(Uri.parse(items.get(0).uri)));
        for (int index = 1; index < items.size(); index++) clip.addItem(new ClipData.Item(Uri.parse(items.get(index).uri)));
        Intent result = new Intent().addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        result.setClipData(clip); return result;
    }

    static Intent textResult(AtomicWorkbenchContentItem item) throws IOException {
        if (item == null || item.kind != AtomicWorkbenchContentItem.Kind.CLIPBOARD) throw new IOException("请选择文字内容");
        return new Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_TEXT, item.text());
    }
}
