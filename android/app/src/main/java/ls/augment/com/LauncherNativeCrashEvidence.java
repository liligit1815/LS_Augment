package ls.augment.com;

import android.os.Process;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import android.system.StructStat;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileDescriptor;
import java.io.StringReader;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/** Root-only, read-only export of the ROM launcher's own bounded crash summaries. */
public final class LauncherNativeCrashEvidence {
    static final String PACKAGE = "com.zte.mifavor.launcher";
    static final int MAX_BYTES = 128 * 1024;
    static final String[] STORES = {"com.android.launcher3.prefs", "com.android.launcher3.prefs.streamer",
            "com.android.launcher3.prefs.concise", "com.android.launcher3.prefs.ease", "com.android.launcher3.prefs.double"};

    private LauncherNativeCrashEvidence() { }


    // Root cross-user operation: these are validated target-package CE paths, not this module's own storage directory.
    //noinspection SdCardPath
    public static void main(String[] args) {
        try {
            if (Process.myUid() != 0) { System.out.println("status=DENIED;reason=root_required"); return; }
            if (args.length != 2) throw new IllegalArgumentException();
            int user = Integer.parseInt(args[0]), uid = Integer.parseInt(args[1]);
            if (user < 0 || uid < 10000 || uid / 100000 != user) throw new IllegalArgumentException();
            System.out.print(collect(new File("/data/user/" + user + "/" + PACKAGE), uid));
        } catch (Throwable failure) { System.out.println("status=UNAVAILABLE;error=" + failure.getClass().getSimpleName()); }
    }

    static String collect(File directory, int uid) {
        StringBuilder out = new StringBuilder("user=").append(uid / 100000).append(";uid=").append(uid)
                .append(";source=rom_crash_history;history_only=true;absence_not_no_crash=true\n");
        File preferences = new File(directory, "shared_prefs");
        for (String store : STORES) out.append("store=").append(store).append(';').append(read(preferences, store, uid)).append('\n');
        return out.toString();
    }

    private static String read(File directory, String store, int uid) {
        FileDescriptor fd = null;
        try {
            // Check the parent and descriptor, rather than following a caller's
            // symlink into another application's private data or exporting raw XML.
            StructStat parent = Os.lstat(directory.getAbsolutePath());
            if (!OsConstants.S_ISDIR(parent.st_mode) || parent.st_uid != uid) return "status=DENIED;reason=directory_identity";
            File file = new File(directory, store + ".xml");
            fd = Os.open(file.getAbsolutePath(), OsConstants.O_RDONLY | OsConstants.O_CLOEXEC
                    | OsConstants.O_NOFOLLOW | OsConstants.O_NONBLOCK, 0);
            StructStat stat = Os.fstat(fd);
            if (!OsConstants.S_ISREG(stat.st_mode) || stat.st_uid != uid || stat.st_nlink != 1)
                return "status=DENIED;reason=file_identity";
            if (stat.st_size < 0 || stat.st_size > MAX_BYTES) return "status=UNAVAILABLE;reason=size_limit";
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int count;
            while ((count = Os.read(fd, buffer, 0, buffer.length)) > 0) {
                if (bytes.size() + count > MAX_BYTES) return "status=UNAVAILABLE;reason=size_limit";
                bytes.write(buffer, 0, count);
            }
            return parse(bytes.toString(StandardCharsets.UTF_8.name()));
        } catch (ErrnoException error) {
            return error.errno == OsConstants.ENOENT ? "status=MISSING" : "status=UNAVAILABLE;error=ErrnoException";
        } catch (Exception | LinkageError error) { return "status=UNAVAILABLE;error=" + error.getClass().getSimpleName(); }
        finally { if (fd != null) try { Os.close(fd); } catch (Exception ignored) { } }
    }

    static String parse(String xml) throws Exception {
        if (xml.length() > MAX_BYTES || xml.contains("<!DOCTYPE") || xml.contains("<!ENTITY"))
            return "status=UNAVAILABLE;reason=unsafe_xml";
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(false); factory.setExpandEntityReferences(false);
        var builder = factory.newDocumentBuilder();
        builder.setEntityResolver((publicId, systemId) -> { throw new SAXException("external entity disabled"); });
        // Parser diagnostics must not print XML contents, filesystem paths or URLs.
        builder.setErrorHandler(new org.xml.sax.helpers.DefaultHandler() {
            @Override public void error(org.xml.sax.SAXParseException error) throws SAXException { throw error; }
            @Override public void fatalError(org.xml.sax.SAXParseException error) throws SAXException { throw error; }
        });
        Element map = builder.parse(new InputSource(new StringReader(xml))).getDocumentElement();
        if (!"map".equals(map.getTagName())) return "status=UNAVAILABLE;reason=unexpected_xml";
        NodeList nodes = map.getChildNodes();
        if (nodes.getLength() > 4096) return "status=UNAVAILABLE;reason=entry_limit";
        Map<String, String> values = new HashMap<>();
        for (int i = 0; i < nodes.getLength(); i++) {
            Node node = nodes.item(i);
            if (!(node instanceof Element)) continue;
            Element entry = (Element) node;
            String key = entry.getAttribute("name");
            boolean frame = key.matches("CRASH_EXCEPTION_[1-3]");
            boolean time = key.matches("CRASH_EXCEPTION_TIME_[1-3]");
            boolean state = "ACTIVITY_STATE".equals(key);
            if (!frame && !time && !state) continue;
            if (values.containsKey(key)) return "status=UNAVAILABLE;reason=duplicate_key";
            if (!entry.getTagName().equals(frame ? "string" : time ? "long" : "int"))
                return "status=UNAVAILABLE;reason=field_type";
            String value = frame ? entry.getTextContent() : entry.getAttribute("value");
            if (value.length() > 512) return "status=UNAVAILABLE;reason=field_limit";
            values.put(key, value);
        }
        StringBuilder result = new StringBuilder();
        int summaries = 0;
        for (int i = 1; i <= 3; i++) {
            String frame = values.get("CRASH_EXCEPTION_" + i), time = values.get("CRASH_EXCEPTION_TIME_" + i);
            if (frame == null || time == null) continue;
            String[] parts = frame.split("/", -1);
            if (parts.length != 4 || !parts[0].matches("[A-Za-z_$][A-Za-z0-9_$.]*")
                    || !parts[1].matches("[A-Za-z0-9_$.-]{1,160}|Unknown Source")
                    || !parts[2].matches("-?[0-9]{1,10}") || !parts[3].matches("[A-Za-z_$<>][A-Za-z0-9_$<>-]{0,160}"))
                return "status=UNAVAILABLE;reason=invalid_frame";
            if (!time.matches("[0-9]{1,19}") || Long.parseLong(time) <= 0)
                return "status=UNAVAILABLE;reason=invalid_time";
            result.append("\nsummary=").append(i).append(";wall=").append(time).append(";firstFrame=").append(frame);
            summaries++;
        }
        String state = values.get("ACTIVITY_STATE");
        return "status=" + (summaries == 0 ? "NO_RETAINED_SUMMARY" : "READ") + ";summaries=" + summaries
                + ";activity_state=" + ("0".equals(state) || "1".equals(state) ? state : "UNKNOWN") + result;
    }

    /** app_process/su stderr never inherits permission to export native XML or paths. */
    static String sanitizeOutput(String raw, int user, int uid) {
        if (raw == null || raw.length() > 16 * 1024) return invalidProtocol();
        String[] lines = raw.trim().split("\\r?\\n");
        if (lines.length == 1 && lines[0].matches("status=DENIED;reason=root_required|status=UNAVAILABLE;error=[A-Za-z_$]{1,80}(?:Exception|Error)"))
            return lines[0];
        String header = "user=" + user + ";uid=" + uid
                + ";source=rom_crash_history;history_only=true;absence_not_no_crash=true";
        if (lines.length < 6 || lines.length > 21 || !header.equals(lines[0])) return invalidProtocol();
        int stores = 0, expected = 0, received = 0;
        java.util.HashSet<Integer> indexes = new java.util.HashSet<>();
        for (int i = 1; i < lines.length; i++) {
            String line = lines[i];
            if (line.startsWith("store=")) {
                if (expected != received || stores >= STORES.length || !line.startsWith("store=" + STORES[stores] + ";")) return invalidProtocol();
                String state = line.substring(("store=" + STORES[stores++] + ";").length());
                if (state.matches("status=(?:READ|NO_RETAINED_SUMMARY);summaries=[0-3];activity_state=(?:0|1|UNKNOWN)")) {
                    expected = state.charAt(state.indexOf("summaries=") + 10) - '0';
                    if (state.startsWith("status=READ;") == (expected == 0)) return invalidProtocol();
                } else if (state.matches("status=MISSING|status=DENIED;reason=(?:directory_identity|file_identity)"
                        + "|status=UNAVAILABLE;reason=(?:size_limit|unsafe_xml|unexpected_xml|entry_limit|duplicate_key|field_type|field_limit|invalid_frame|invalid_time)"
                        + "|status=UNAVAILABLE;error=[A-Za-z_$]{1,80}(?:Exception|Error)")) expected = 0;
                else return invalidProtocol();
                received = 0; indexes.clear();
            } else {
                if (stores == 0 || received >= expected || !line.matches("summary=[1-3];wall=[0-9]{1,19};firstFrame=.+")) return invalidProtocol();
                int index = line.charAt(8) - '0';
                if (!indexes.add(index)) return invalidProtocol();
                int split = line.indexOf(";firstFrame=");
                try { if (Long.parseLong(line.substring(line.indexOf(";wall=") + 6, split)) <= 0) return invalidProtocol(); }
                catch (NumberFormatException malformed) { return invalidProtocol(); }
                String frame = line.substring(split + 12);
                if (!frame.matches("[A-Za-z_$][A-Za-z0-9_$.]*/(?:[A-Za-z0-9_$.-]{1,160}|Unknown Source)/-?[0-9]{1,10}/[A-Za-z_$<>][A-Za-z0-9_$<>-]{0,160}"))
                    return invalidProtocol();
                received++;
            }
        }
        return stores == STORES.length && expected == received ? String.join("\n", lines) : invalidProtocol();
    }

    private static String invalidProtocol() { return "status=UNAVAILABLE;reason=invalid_child_protocol;child_output_redacted=true"; }
}
