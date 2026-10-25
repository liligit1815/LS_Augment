package ls.augment.com;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/** A fixed local document catalogue. Intent data never becomes an asset path. */
final class ModuleLicenseDocuments {
    static final int MAX_BYTES = 128 * 1024;
    interface Assets { InputStream open(String path) throws IOException; }
    static final class Entry {
        final String id, title, summary, asset, source;
        private Entry(String id, String title, String summary, String asset, String source) {
            this.id=id;this.title=title;this.summary=summary;this.asset=asset;this.source=source;
        }
    }
    private static final List<Entry> ENTRIES = Collections.unmodifiableList(Arrays.asList(
        new Entry("sources", "引用来源与待核定项", "实际引用、版本与记录范围",
                "licenses/duo-third-party-sources.txt", "https://github.com/liligit1815/LS_Augment"),
        new Entry("liftarc", "LiftArc · GPL 原文", "1.0.22 · 完整许可文本",
                "licenses/liftarc-GPL-3.0.txt", "https://github.com/miyupyxh/LiftArc"),
        new Entry("liftarc-sources", "LiftArc · 来源与改造记录", "移植提交、文件与保留声明",
                "licenses/liftarc-sources.txt", "https://github.com/miyupyxh/LiftArc"),
        new Entry("cppjieba", "cppjieba · MIT 与来源", "分词头文件、词库与本地改动",
                "workbench-text-dict/NOTICE", "https://github.com/yanyiwu/cppjieba"),
        new Entry("icons", "Lucide / Feather · ISC / MIT", "完整图标声明",
                "licenses/duo-ui-icons-LICENSE.txt", "https://lucide.dev/"),
        new Entry("apache", "运行库 · Apache 2.0 原文", "适用组件与版本见来源记录",
                "licenses/apache-2.0.txt", "https://github.com/libxposed/service")
    ));
    private ModuleLicenseDocuments() { }
    static List<Entry> entries() { return ENTRIES; }
    static Entry find(String id) {
        for (Entry entry:ENTRIES) if (entry.id.equals(id)) return entry;
        return null;
    }
    static String read(String id, Assets assets) throws IOException {
        Entry entry=find(id);
        if (entry==null) throw new IOException("Unknown document");
        ByteArrayOutputStream output=new ByteArrayOutputStream();
        try (InputStream input=assets.open(entry.asset)) {
            if (input==null) throw new IOException("Document unavailable");
            byte[] buffer=new byte[4096];
            int count;
            while ((count=input.read(buffer))!=-1) {
                if (output.size()+count>MAX_BYTES) throw new IOException("Document too large");
                output.write(buffer,0,count);
            }
        }
        if (output.size()==0) throw new IOException("Empty document");
        try {
            return StandardCharsets.UTF_8.newDecoder()
                    .onMalformedInput(CodingErrorAction.REPORT)
                    .onUnmappableCharacter(CodingErrorAction.REPORT)
                    .decode(ByteBuffer.wrap(output.toByteArray())).toString();
        } catch (CharacterCodingException error) {
            throw new IOException("Invalid document encoding",error);
        }
    }
}
