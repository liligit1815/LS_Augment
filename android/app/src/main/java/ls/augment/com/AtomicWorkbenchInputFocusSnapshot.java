package ls.augment.com;

import java.io.IOException;
import java.io.InputStream;

/** Reads only fixed native dispatcher fields; never returns or records dump text. */
final class AtomicWorkbenchInputFocusSnapshot {
    static final int MAX_BYTES = 1024 * 1024;
    final boolean confirmed;
    final int displayId;

    private AtomicWorkbenchInputFocusSnapshot(boolean confirmed, int displayId) {
        this.confirmed = confirmed; this.displayId = displayId;
    }

    static AtomicWorkbenchInputFocusSnapshot read(InputStream input) throws IOException {
        int count = 0, headers = 0, displays = 0, enabled = 0, frozen = 0, display = -1;
        boolean section = false, valid = true, enabledValue = false, frozenValue = true, ended = false;
        StringBuilder line = new StringBuilder(128);
        for (int value; (value = input.read()) != -1;) {
            if (++count > MAX_BYTES) throw new IOException("input_snapshot_limit");
            if (value != '\n') { if (line.length() < 129) line.append((char) value); continue; }
            String current = line.toString(); line.setLength(0);
            if (current.endsWith("\r")) current = current.substring(0, current.length() - 1);
            if (current.equals("Input Dispatcher State:")) { headers++; section = true; continue; }
            if (current.startsWith("  FocusedDisplayId:")) {
                displays++;
                if (!section || ended || !current.matches("  FocusedDisplayId: [0-9]{1,10}")) valid = false;
                else try { display = Integer.parseInt(current.substring("  FocusedDisplayId: ".length())); }
                catch (NumberFormatException invalid) { valid = false; }
            }
            if (!section || ended) continue;
            if (current.equals("  FocusedApplications:")) { ended = true; section = false; continue; }
            if (current.startsWith("  DispatchEnabled:")) {
                enabled++; enabledValue = current.equals("  DispatchEnabled: true");
                if (!enabledValue && !current.equals("  DispatchEnabled: false")) valid = false;
            }
            if (current.startsWith("  DispatchFrozen:")) {
                frozen++; frozenValue = current.equals("  DispatchFrozen: true");
                if (!frozenValue && !current.equals("  DispatchFrozen: false")) valid = false;
            }
            if (current.length() > 128) valid = false;
        }
        // A truncated final field or a missing section terminator cannot certify focus.
        return new AtomicWorkbenchInputFocusSnapshot(valid && headers == 1 && displays == 1 && enabled == 1
                && frozen == 1 && enabledValue && !frozenValue && ended && display >= 0, display);
    }
}
