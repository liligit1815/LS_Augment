package ls.augment.com;

import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.Context;
import android.database.Cursor;
import android.media.RingtoneManager;
import android.net.Uri;
import android.provider.MediaStore;
import java.net.URI;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/** Explicit total-reset cleanup for module-owned state outside its sandbox. */
final class ModuleExternalReset {
    private static final String PACKAGE = "ls.augment.com";
    static final String[] AUDIO_PATHS = { "Ringtones/红魔Duo/", "Notifications/红魔Duo/", "Alarms/红魔Duo/",
            "Ringtones/LS_Augment/", "Notifications/LS_Augment/", "Alarms/LS_Augment/" };
    private ModuleExternalReset() { }
    static synchronized Result restore(Context context) {
        return new Engine(new Platform(context.getApplicationContext()), android.os.Process.myUid() / 100000).restore();
    }

    interface Access {
        String tiles() throws Exception;
        boolean replaceTiles(String expected, String replacement) throws Exception;
        Phase cleanLegacy() throws Exception;
        List<Audio> audio() throws Exception;
        Set<String> selectedAudio() throws Exception;
        boolean delete(Audio audio) throws Exception;
    }
    static final class Audio {
        final String uri, path, owner, name;
        Audio(String uri, String path, String owner, String name) { this.uri = uri; this.path = path; this.owner = owner; this.name = name; }
    }
    static final class Phase {
        final boolean success; final int count; final String message;
        Phase(boolean success, int count, String message) { this.success = success; this.count = count; this.message = message; }
    }
    static final class Result {
        final boolean success, reviewRequired; final int count; final String message;
        Result(boolean success, boolean reviewRequired, int count, String message) {
            this.success = success; this.reviewRequired = reviewRequired; this.count = count; this.message = message;
        }
    }

    static final class Engine {
        final Access access; final int ownerUser;
        Engine(Access access, int ownerUser) { this.access = access; this.ownerUser = ownerUser; }
        Result restore() {
            int count = 0; boolean failed = false, review = false;
            ArrayList<String> issues = new ArrayList<>();
            try {
                String before = access.tiles();
                if (before != null) {
                    String after = withoutModuleTiles(before);
                    if (!after.equals(before)) {
                        if (access.replaceTiles(before, after)) count += moduleTileCount(before);
                        else { failed = true; issues.add("模块磁贴未移除，控制中心布局已变更或写入未通过校验"); }
                    }
                }
            } catch (Exception unavailable) { failed = true; issues.add("无法读取或移除模块磁贴"); }
            try {
                Phase legacy = access.cleanLegacy(); count += legacy.count;
                if (!legacy.success) { failed = true; issues.add(legacy.message); }
            } catch (Exception unavailable) { failed = true; issues.add("旧模块系统配置未能清理"); }
            try {
                List<Audio> candidates = access.audio();
                Set<String> selected = access.selectedAudio();
                for (Audio audio : candidates) {
                    if (!ownedAudio(audio)) continue;
                    if (isSelected(audio.uri, selected, ownerUser)) {
                        review = true; issues.add("联名音频正在作为系统声音使用，缺少原声音记录，已保留副本"); continue;
                    }
                    // Recheck immediately before each delete; a user may choose a sound during cleanup.
                    if (isSelected(audio.uri, access.selectedAudio(), ownerUser)) {
                        review = true; issues.add("联名音频正在作为系统声音使用，缺少原声音记录，已保留副本"); continue;
                    }
                    if (access.delete(audio)) count++;
                    else { failed = true; issues.add("联名音频副本删除未通过校验"); }
                }
            } catch (Exception unavailable) { failed = true; issues.add("无法核验系统声音或清理联名音频副本，未继续删除"); }
            String detail = String.join("；", new LinkedHashSet<>(issues));
            return new Result(!failed && !review, review, count,
                    "已清理 " + count + " 项模块外部记录" + (detail.isEmpty() ? "。" : "；" + detail + "。"));
        }
    }

    static String withoutModuleTiles(String tiles) {
        ArrayList<String> kept = new ArrayList<>();
        for (String tile : tiles.split(",", -1)) if (!moduleTile(tile)) kept.add(tile);
        return String.join(",", kept);
    }
    static int moduleTileCount(String tiles) {
        int count = 0; for (String tile : tiles.split(",", -1)) if (moduleTile(tile)) count++; return count;
    }
    private static boolean moduleTile(String raw) {
        String tile = raw.trim();
        if (!tile.startsWith("custom(" + PACKAGE + "/") || !tile.endsWith(")")) return false;
        String type = tile.substring(("custom(" + PACKAGE + "/").length(), tile.length() - 1);
        if (type.startsWith(".")) type = PACKAGE + type;
        return type.equals(PACKAGE + ".AugmentTileService") || type.equals(PACKAGE + ".ExtraDimTileService");
    }
    static boolean ownedAudio(Audio audio) {
        if (audio == null || !PACKAGE.equals(audio.owner) || audio.path == null || audio.name == null) return false;
        boolean path = false; for (String candidate : AUDIO_PATHS) if (candidate.equals(audio.path)) path = true;
        return path && audio.name.endsWith(".ogg") && !audio.name.contains("..")
                && (audio.name.startsWith("红魔Duo_IP_") || audio.name.startsWith("LS_IP_"));
    }
    static boolean isSelected(String candidate, Set<String> selected, int user) {
        String identity = mediaIdentity(candidate, user);
        for (String value : selected) if (candidate.equals(value)
                || identity != null && identity.equals(mediaIdentity(value, user))) return true;
        return false;
    }
    private static String mediaIdentity(String value, int user) {
        try {
            URI uri = new URI(value);
            if (!"content".equals(uri.getScheme()) || uri.getQuery() != null || uri.getFragment() != null) return null;
            String authority = uri.getAuthority(); int actualUser = user;
            if (authority == null) return null;
            if (authority.contains("@")) {
                String[] parts = authority.split("@", -1);
                if (parts.length != 2 || !parts[0].matches("[0-9]{1,5}")) return null;
                actualUser = Integer.parseInt(parts[0]); authority = parts[1];
            }
            String path = uri.getPath();
            if (!authority.equals("media") || path == null || !path.matches("/(?:external|external_primary)/audio/media/[0-9]+")) return null;
            return actualUser + ":" + Long.parseLong(path.substring(path.lastIndexOf('/') + 1));
        } catch (Exception invalid) { return null; }
    }

    private static final class Platform implements Access {
        final Context context; final int user; final ContentResolver resolver;
        Platform(Context context) { this.context = context; user = android.os.Process.myUid() / 100000; resolver = context.getContentResolver(); }
        public String tiles() throws Exception {
            return setting("secure", "sysui_qs_tiles");
        }
        private String setting(String namespace, String key) throws Exception {
            String value = null; boolean found = false;
            for (String line : settingList(namespace).split("\\r?\\n")) if (line.startsWith(key + "=")) {
                if (found) throw new IllegalStateException("ambiguous setting");
                found = true; value = line.substring(key.length() + 1);
            }
            return value;
        }
        private String settingList(String namespace) throws Exception {
            RootShell.Result read = RootShell.run("settings --user " + user + " list " + namespace, null, 5, 256 * 1024);
            if (!read.isSuccess() || read.capture == null || !read.capture.reliable()) throw new IllegalStateException("setting read unavailable");
            return read.capture.text();
        }
        public boolean replaceTiles(String expected, String replacement) throws Exception {
            String base = "settings --user " + user;
            // A stale snapshot must not overwrite a concurrent edit to the user's QS layout.
            RootShell.Result write = RootShell.run("before=$(" + base + " get secure sysui_qs_tiles) || exit 71; "
                    + "[ \"$before\" = " + RootShell.quote(expected) + " ] || exit 72; " + base
                    + " put secure sysui_qs_tiles " + RootShell.quote(replacement), null, 5, 1024);
            return write.isSuccess() && replacement.equals(tiles());
        }
        public Phase cleanLegacy() {
            RootShell.Result result = RootShell.run("nsenter -t 1 -m -- sh -c "+RootShell.quote(legacyCommand()), null, 30, 32768);
            int count = 0;
            for (String line : result.output.split("\\r?\\n")) if (line.matches("LSA_RESET_REMOVED:[A-Za-z0-9_./-]+")) count++;
            return new Phase(result.isSuccess() && result.capture != null && result.capture.reliable()
                    && result.output.endsWith("LSA_EXTERNAL_LEGACY_END"), count,
                    "旧模块系统配置未清理完整："+result.publicError());
        }
        public List<Audio> audio() throws Exception {
            Uri collection = MediaStore.Audio.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY);
            String selection = MediaStore.MediaColumns.OWNER_PACKAGE_NAME + "=? AND " + MediaStore.MediaColumns.RELATIVE_PATH + " IN (?,?,?,?,?,?)";
            String[] arguments = new String[AUDIO_PATHS.length + 1]; arguments[0] = PACKAGE;
            System.arraycopy(AUDIO_PATHS, 0, arguments, 1, AUDIO_PATHS.length);
            ArrayList<Audio> audio = new ArrayList<>();
            try (Cursor cursor = resolver.query(collection, new String[]{ MediaStore.MediaColumns._ID, MediaStore.MediaColumns.RELATIVE_PATH,
                    MediaStore.MediaColumns.OWNER_PACKAGE_NAME, MediaStore.MediaColumns.DISPLAY_NAME }, selection, arguments, null)) {
                if (cursor == null) throw new IllegalStateException("media query unavailable");
                while (cursor.moveToNext()) audio.add(new Audio(ContentUris.withAppendedId(collection, cursor.getLong(0)).toString(),
                        cursor.getString(1), cursor.getString(2), cursor.getString(3)));
            }
            return audio;
        }
        public Set<String> selectedAudio() throws Exception {
            LinkedHashSet<String> selected = new LinkedHashSet<>();
            for (int type : new int[]{ RingtoneManager.TYPE_RINGTONE, RingtoneManager.TYPE_NOTIFICATION, RingtoneManager.TYPE_ALARM }) {
                Uri uri = RingtoneManager.getActualDefaultRingtoneUri(context, type);
                if (uri != null) selected.add(uri.toString());
            }
            // Includes OEM SIM-specific sound keys. Retain any imported file referenced by a system setting.
            for (String line : settingList("system").split("\\r?\\n")) {
                int equals = line.indexOf('='); if (equals >= 0) selected.add(line.substring(equals + 1));
            }
            return selected;
        }
        public boolean delete(Audio audio) throws Exception {
            if (!ownedAudio(audio)) return false;
            String selection = MediaStore.MediaColumns.OWNER_PACKAGE_NAME + "=? AND " + MediaStore.MediaColumns.RELATIVE_PATH + "=?";
            Uri uri = Uri.parse(audio.uri);
            if (resolver.delete(uri, selection, new String[]{ PACKAGE, audio.path }) != 1) return false;
            try (Cursor remains = resolver.query(uri, new String[]{ MediaStore.MediaColumns._ID }, null, null, null)) {
                if (remains == null) throw new IllegalStateException("media verification unavailable");
                return !remains.moveToFirst();
            }
        }
    }

    static String legacyCommand() {
        return "set -e; entries=$(settings list global) || exit 71; "
                + "printf '%s\\n' \"$entries\" | while IFS= read -r entry; do case \"$entry\" in ls_augment_*=*) "
                + "key=${entry%%=*}; case \"$key\" in *[!a-zA-Z0-9_.]*) exit 72;; esac; "
                + "settings delete global \"$key\" >/dev/null || exit 73; printf 'LSA_RESET_REMOVED:%s\\n' \"$key\";; esac; done; "
                + "for parent in /data /data/system /data/system/ls_augment; do [ ! -L \"$parent\" ] || exit 74; "
                + "[ ! -e \"$parent\" ] || [ -d \"$parent\" ] || exit 75; done; "
                + "for file in /data/system/ls_augment/boot-config-v1 /data/system/ls_augment/boot-config-v1.tmp; do "
                + "[ ! -L \"$file\" ] || exit 76; if [ -e \"$file\" ]; then [ -f \"$file\" ] || exit 77; "
                + "rm -f \"$file\" || exit 78; [ ! -e \"$file\" ] && [ ! -L \"$file\" ] || exit 79; "
                + "printf 'LSA_RESET_REMOVED:%s\\n' \"$file\"; fi; done; "
                + "remaining=$(settings list global) || exit 80; printf '%s\\n' \"$remaining\" | while IFS= read -r entry; do "
                + "case \"$entry\" in ls_augment_*=*) exit 81;; esac; done; printf 'LSA_EXTERNAL_LEGACY_END\\n'";
    }
}
