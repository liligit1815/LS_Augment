package ls.augment.com;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.charset.CodingErrorAction;
import java.nio.ByteBuffer;
import java.nio.file.AtomicMoveNotSupportedException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.EnumMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/** App-private atomic snapshot. Contains private history, never a diagnostic/export attachment. */
final class AtomicWorkbenchContentStore {
    private static final int MAGIC = 0x44554331, VERSION = 1, MAX_BYTES = 16 * 1024 * 1024;
    private final File directory, target;

    static final class Stored {
        final EnumMap<AtomicWorkbenchContentItem.Kind, List<AtomicWorkbenchContentItem>> items = new EnumMap<>(AtomicWorkbenchContentItem.Kind.class);
        final EnumMap<AtomicWorkbenchContentItem.Kind, Set<String>> hidden = new EnumMap<>(AtomicWorkbenchContentItem.Kind.class);
        final EnumMap<AtomicWorkbenchContentItem.Kind, Long> clearedThrough = new EnumMap<>(AtomicWorkbenchContentItem.Kind.class);
        Stored() {
            for (AtomicWorkbenchContentItem.Kind kind : AtomicWorkbenchContentItem.Kind.values()) {
                items.put(kind, List.of()); hidden.put(kind, Set.of()); clearedThrough.put(kind, -1L);
            }
        }
    }

    AtomicWorkbenchContentStore(File appPrivateDirectory) {
        directory = java.util.Objects.requireNonNull(appPrivateDirectory);
        target = new File(directory, "workbench-content-v1.bin");
    }

    Stored read() throws IOException {
        Stored result = new Stored();
        if (!target.exists()) return result;
        if (!target.isFile() || target.length() > MAX_BYTES) throw new IOException("Content history unavailable");
        try (DataInputStream input = new DataInputStream(new BufferedInputStream(new FileInputStream(target)))) {
            if (input.readInt() != MAGIC || input.readInt() != VERSION) throw new IOException("Content history unavailable");
            for (AtomicWorkbenchContentItem.Kind kind : AtomicWorkbenchContentItem.Kind.values()) {
                long cutoff = input.readLong(); if (cutoff < -1) throw new IOException("Content history unavailable");
                result.clearedThrough.put(kind, cutoff);
                int count = count(input, kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD
                        ? AtomicWorkbenchContentPolicy.CLIPBOARD_LIMIT : AtomicWorkbenchContentPolicy.SNAPSHOT_LIMIT);
                ArrayList<AtomicWorkbenchContentItem> items = new ArrayList<>();
                for (int index = 0; index < count; index++) {
                    int sourceValue = input.readInt();
                    if (sourceValue < 0 || sourceValue >= AtomicWorkbenchContentItem.Source.values().length)
                        throw new IOException("Content history unavailable");
                    AtomicWorkbenchContentItem.Source source = AtomicWorkbenchContentItem.Source.values()[sourceValue];
                    String uri = string(input, 32768), mime = string(input, 512), name = string(input, 1024);
                    long time = input.readLong(), size = input.readLong(), duration = input.readLong();
                    String text = string(input, AtomicWorkbenchContentPolicy.TEXT_LIMIT * 4);
                    AtomicWorkbenchContentItem item;
                    if (kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD) {
                        if (source != AtomicWorkbenchContentItem.Source.CLIPBOARD || !uri.isEmpty()) throw new IOException("Content history unavailable");
                        item = AtomicWorkbenchContentItem.clipboard(text, time);
                    } else {
                        if (!text.isEmpty()) throw new IOException("Content history unavailable");
                        item = AtomicWorkbenchContentItem.file(kind, source, uri, mime, name, time, size, duration);
                    }
                    items.add(item);
                }
                result.items.put(kind, List.copyOf(items));
                int hiddenCount = count(input, AtomicWorkbenchContentPolicy.MAX_HIDDEN);
                LinkedHashSet<String> hidden = new LinkedHashSet<>();
                for (int index = 0; index < hiddenCount; index++) {
                    String value = string(input, 256);
                    if (!value.matches("[0-9a-f]{64}:[0-9a-f]{64}")) throw new IOException("Content history unavailable");
                    hidden.add(value);
                }
                result.hidden.put(kind, Set.copyOf(hidden));
            }
            if (input.read() != -1) throw new IOException("Content history unavailable");
            return result;
        } catch (RuntimeException malformed) { throw new IOException("Content history unavailable"); }
    }

    void write(Stored value) throws IOException {
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("Cannot save content history");
        File temporary = File.createTempFile("workbench-content-", ".pending", directory);
        try {
            try (FileOutputStream file = new FileOutputStream(temporary);
                    DataOutputStream output = new DataOutputStream(new BufferedOutputStream(file))) {
                output.writeInt(MAGIC); output.writeInt(VERSION);
                for (AtomicWorkbenchContentItem.Kind kind : AtomicWorkbenchContentItem.Kind.values()) {
                    output.writeLong(value.clearedThrough.get(kind));
                    List<AtomicWorkbenchContentItem> items = value.items.get(kind);
                    int limit = kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD
                            ? AtomicWorkbenchContentPolicy.CLIPBOARD_LIMIT : AtomicWorkbenchContentPolicy.SNAPSHOT_LIMIT;
                    int count = Math.min(items.size(), limit); output.writeInt(count);
                    for (int index = 0; index < count; index++) {
                        AtomicWorkbenchContentItem item = items.get(index);
                        output.writeInt(item.source.ordinal());
                        string(output, item.uri); string(output, item.mime); string(output, item.name);
                        output.writeLong(item.modifiedMillis); output.writeLong(item.size); output.writeLong(item.durationMillis);
                        string(output, item.text());
                    }
                    Set<String> hidden = value.hidden.get(kind);
                    if (hidden.size() > AtomicWorkbenchContentPolicy.MAX_HIDDEN) throw new IOException("Content history capacity reached");
                    output.writeInt(hidden.size()); for (String key : hidden) string(output, key);
                }
                output.flush(); file.getFD().sync();
            }
            if (temporary.length() > MAX_BYTES) throw new IOException("Content history capacity reached");
            try { Files.move(temporary.toPath(), target.toPath(), StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.ATOMIC_MOVE); }
            catch (AtomicMoveNotSupportedException unavailable) {
                // Same private directory: the filesystem's replacement rename preserves the old file on failure.
                Files.move(temporary.toPath(), target.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }
        } finally { Files.deleteIfExists(temporary.toPath()); }
    }

    private static int count(DataInputStream input, int limit) throws IOException {
        int value = input.readInt();
        if (value < 0 || value > limit) throw new IOException("Content history unavailable");
        return value;
    }
    private static String string(DataInputStream input, int limit) throws IOException {
        int length = count(input, limit); byte[] bytes = new byte[length]; input.readFully(bytes);
        return StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
                .onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(bytes)).toString();
    }
    private static void string(DataOutputStream output, String value) throws IOException {
        byte[] bytes = value.getBytes(StandardCharsets.UTF_8); output.writeInt(bytes.length); output.write(bytes);
    }
}
