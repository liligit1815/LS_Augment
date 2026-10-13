package ls.augment.com;

import android.content.Context;
import android.system.Os;
import android.system.OsConstants;
import android.system.StructStat;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.StandardCopyOption;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Archives the retired KernelSU module's exact records. Never applies its old policy. */
final class LegacyRootStorageMigration {
    private static final List<String> NAMES=List.of("runtime/companion_install.state","runtime/summary.state",
            "runtime/state.tsv","app_metadata.tsv","targets.backup.conf","targets.conf","tile.conf");
    private static final String START="LSA_LEGACY_ROOT1\n", END="LSA_LEGACY_ROOT_END\n";
    private static final String COMPLETE="LSA_LEGACY_ROOT_COMPLETE1\n";
    private static final int FILE_LIMIT=1024*1024;
    private LegacyRootStorageMigration() { }

    static RootShell.Result run(Context context) {
        try {
            migrate(new File(context.getFilesDir().getCanonicalFile(),"legacy-root-v1"),android.os.Process.myUid()/100000==0);
            return new RootShell.Result(0,"旧版 Root 数据已私有归档",false);
        } catch(Exception failure) {
            // Root output can contain user records. Only a fixed status reaches diagnostics/UI.
            return new RootShell.Result(74,"旧版 Root 数据未通过安全核验，保留未确认数据及私有归档",false);
        }
    }

    static void requireResetSafe(Context context)throws IOException {
        try {requireResetSafe(new File(context.getFilesDir().getCanonicalFile(),"legacy-root-v1"));}
        catch(Exception failure){throw new IOException("旧版 Root 数据归档尚未确认完成，暂不能清除私有数据",failure);}
    }
    static void requireResetSafe(File base)throws Exception {
        if(!exists(base))return;
        directory(base);
        File complete=new File(base,".complete-v1");file(complete);
        if(!COMPLETE.equals(readText(complete)))throw new IOException("invalid_receipt");
        verifyArchive(base,readManifest(new File(base,"manifest-v1")));sync(base);
    }

    static void migrate(File supplied,boolean primaryUser)throws Exception {
        if(!primaryUser)return;
        File base=supplied.getAbsoluteFile();
        if(exists(base))directory(base);
        else if(!base.getCanonicalFile().equals(base))throw new IOException("private_link");
        File complete=new File(base,".complete-v1");
        if(exists(complete)) {
            file(complete);
            if(!COMPLETE.equals(readText(complete)))throw new IOException("invalid_receipt");
            verifyArchive(base,readManifest(new File(base,"manifest-v1")));
            sync(base);return;
        }
        RootShell.Result exported=RootShell.run(exportCommand(),null,60,11*1024*1024);
        if(!exported.isSuccess()||exported.capture==null||!exported.capture.reliable())throw new IOException("export_unavailable");
        String raw=exported.capture.text();
        if(!raw.startsWith(START)||!raw.endsWith(END))throw new IOException("incomplete_export");
        Map<String,Entry> incoming=new LinkedHashMap<>();
        for(String row:raw.substring(START.length(),raw.length()-END.length()).split("\n")) {
            if(row.isEmpty())continue;
            String[] fields=row.split("\\|",-1);
            Entry entry=parseRow(fields,true);
            if(incoming.put(entry.name,entry)!=null)throw new IOException("duplicate_record");
        }
        allNames(incoming);
        directory(base);
        File manifestFile=new File(base,"manifest-v1");
        Map<String,Entry> original=incoming;
        if(exists(manifestFile)) {
            original=readManifest(manifestFile);verifyArchive(base,original);
            for(Entry entry:incoming.values())if(entry.present()) {
                Entry saved=original.get(entry.name);
                if(!saved.present()||!entry.hash.equals(saved.hash))throw new IOException("archive_source_conflict");
            }
        }
        for(Entry entry:incoming.values())if(entry.present()) {
            File target=new File(base,"original/"+entry.name);directory(target.getParentFile());
            if(exists(target)) {
                file(target);
                if(!MessageDigest.isEqual(Files.readAllBytes(target.toPath()),entry.bytes))throw new IOException("archive_content_conflict");
            } else atomic(target,entry.bytes);
            file(target);
            if(!hex(Files.readAllBytes(target.toPath())).equals(entry.hash))throw new IOException("archive_readback_failed");
        }
        if(!exists(manifestFile))atomic(manifestFile,manifest(original).getBytes(StandardCharsets.UTF_8));
        verifyArchive(base,readManifest(manifestFile));
        // This is an app-UID child, rooted in private storage; no Root copy/chown fallback.
        sync(base);
        RootShell.Result cleaned=RootShell.run(cleanupCommand(),manifest(incoming),90,4096);
        if(!cleaned.isSuccess()||cleaned.capture==null||!cleaned.capture.reliable()
                ||!"LSA_LEGACY_ROOT_CLEAN".equals(cleaned.output))throw new IOException("cleanup_unconfirmed");
        atomic(complete,COMPLETE.getBytes(StandardCharsets.UTF_8));sync(base);
    }

    private static final class Entry {
        final String name,meta,hash;final byte[] bytes;
        Entry(String name,String meta,String hash,byte[] bytes){this.name=name;this.meta=meta;this.hash=hash;this.bytes=bytes;}
        boolean present(){return meta!=null;}
        String line(){return present()?"F|"+name+"|"+meta+"|"+hash:"A|"+name;}
    }
    private static Entry parseRow(String[] fields,boolean content)throws Exception {
        if(fields.length<2||!NAMES.contains(fields[1]))throw new IOException("unknown_record");
        if("A".equals(fields[0])&&fields.length==2)return new Entry(fields[1],null,null,null);
        if(!"F".equals(fields[0])||fields.length!=(content?5:4)
                ||!fields[2].matches("[0-9]+:[0-9]+:0:0:(600|666):1:[0-9]+:[0-9]+:[0-9]+")
                ||(!fields[1].equals("runtime/companion_install.state")&&fields[2].split(":")[4].equals("666"))
                ||!fields[3].matches("[a-f0-9]{64}"))throw new IOException("invalid_record");
        long size=Long.parseLong(fields[2].split(":")[6]);
        if(size>FILE_LIMIT)throw new IOException("record_too_large");
        byte[] bytes=content?Base64.getDecoder().decode(fields[4]):null;
        if(content) {
            if(bytes.length!=size||!hex(bytes).equals(fields[3]))throw new IOException("record_hash_mismatch");
            validateContent(fields[1],bytes);
        }
        return new Entry(fields[1],fields[2],fields[3],bytes);
    }
    private static void allNames(Map<String,Entry> entries)throws IOException {
        if(entries.size()!=NAMES.size()||!entries.keySet().containsAll(NAMES))throw new IOException("incomplete_manifest");
    }
    private static String manifest(Map<String,Entry> entries){
        StringBuilder value=new StringBuilder(START);
        for(String name:NAMES)value.append(entries.get(name).line()).append('\n');
        return value.append(END).toString();
    }
    private static Map<String,Entry> parseManifest(String raw)throws Exception {
        if(raw.length()>8192||!raw.startsWith(START)||!raw.endsWith(END))throw new IOException("invalid_manifest");
        Map<String,Entry> entries=new LinkedHashMap<>();
        for(String row:raw.substring(START.length(),raw.length()-END.length()).split("\n")) {
            Entry entry=parseRow(row.split("\\|",-1),false);
            if(entries.put(entry.name,entry)!=null)throw new IOException("duplicate_manifest");
        }
        allNames(entries);return entries;
    }
    private static Map<String,Entry> readManifest(File manifest)throws Exception {
        return parseManifest(readText(manifest));
    }
    private static String readText(File source)throws Exception {
        file(source);
        byte[] bytes=Files.readAllBytes(source.toPath());
        if(bytes.length>FILE_LIMIT)throw new IOException("private_file_too_large");
        return decode(bytes);
    }
    private static String decode(byte[] bytes)throws Exception {
        return StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
                .onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(bytes)).toString();
    }
    private static void verifyArchive(File base,Map<String,Entry> entries)throws Exception {
        for(Entry entry:entries.values())if(entry.present()) {
            File stored=new File(base,"original/"+entry.name);file(stored);
            byte[] bytes=Files.readAllBytes(stored.toPath());
            if(bytes.length>FILE_LIMIT||!hex(bytes).equals(entry.hash))throw new IOException("archive_verify_failed");
            validateContent(entry.name,bytes);
        }
    }
    /** Validate known historical shapes without interpreting labels, targets or policy as commands. */
    static void validateContent(String name,byte[] bytes)throws Exception {
        String text=decode(bytes);
        if(text.indexOf('\0')>=0)throw new IOException("unknown_content");
        String[] lines=text.split("\n",-1);Set<String> keys=new java.util.HashSet<>();int nonempty=0;
        for(String raw:lines) {
            String line=raw.endsWith("\r")?raw.substring(0,raw.length()-1):raw;
            if(line.isEmpty())continue;
            nonempty++;if(line.length()>8192)throw new IOException("unknown_content");
            boolean valid=false;
            switch(name) {
                case "targets.conf":case "targets.backup.conf":
                    line=line.split("#",2)[0].replaceAll("\\s","");valid=line.isEmpty()||line.matches("[0-9]+:[A-Za-z0-9_]+(?:\\.[A-Za-z0-9_]+)+");break;
                case "runtime/state.tsv":valid=line.matches("[0-9]+\\|[A-Za-z0-9_]+(?:\\.[A-Za-z0-9_]+)+\\|(visible|hidden|missing|error)");break;
                case "runtime/summary.state":valid=nonempty==1&&line.matches("(visible|hidden|mixed|empty|error)\\|[0-9]+\\|[0-9]+\\|[0-9]+\\|[0-9]+\\|[0-9]+");break;
                case "app_metadata.tsv": {
                    String[] f=line.split("\\|",-1);valid=f.length==4&&f[0].matches("[0-9]+")&&f[1].matches("[A-Za-z0-9_]+(?:\\.[A-Za-z0-9_]+)+")
                            &&f[2].length()<=4096&&f[2].matches("[A-Za-z0-9+/=]+")&&f[3].matches("[01]");
                    if(valid)Base64.getDecoder().decode(f[2]);break;
                }
                case "tile.conf": {
                    int at=line.indexOf('=');String key=at<0?"":line.substring(0,at);
                    valid=Set.of("label","description").contains(key)&&keys.add(key);break;
                }
                case "runtime/companion_install.state":
                    valid=nonempty==1&&line.matches("(?:COMPATIBLE|NEEDS_UPDATE|OK|FAIL)\\|[\\x20-\\x7e]+")
                            &&line.contains("=");break;
                default:throw new IOException("unknown_content");
            }
            if(!valid)throw new IOException("unknown_content");
        }
    }
    private static boolean exists(File file){return Files.exists(file.toPath(),LinkOption.NOFOLLOW_LINKS);}
    private static void directory(File dir)throws Exception {
        if(!dir.getCanonicalFile().equals(dir.getAbsoluteFile()))throw new IOException("private_link");
        if(!dir.isDirectory()&&!dir.mkdirs())throw new IOException("private_directory");
        StructStat stat=Os.lstat(dir.getPath());
        if(stat.st_uid!=android.os.Process.myUid()||!OsConstants.S_ISDIR(stat.st_mode))throw new IOException("private_owner");
        Os.chmod(dir.getPath(),0700);
    }
    private static void file(File file)throws Exception {
        if(!file.getCanonicalFile().equals(file.getAbsoluteFile()))throw new IOException("private_link");
        StructStat stat=Os.lstat(file.getPath());
        if(stat.st_uid!=android.os.Process.myUid()||!OsConstants.S_ISREG(stat.st_mode)||stat.st_nlink!=1
                ||stat.st_size>FILE_LIMIT)throw new IOException("private_file");
        Os.chmod(file.getPath(),0600);
    }
    private static void atomic(File destination,byte[] bytes)throws Exception {
        File temp=File.createTempFile(".archive-",".tmp",destination.getParentFile());
        try {
            file(temp);
            try(FileOutputStream out=new FileOutputStream(temp)){out.write(bytes);out.getFD().sync();}
            Files.move(temp.toPath(),destination.toPath(),StandardCopyOption.ATOMIC_MOVE);
        }finally{Files.deleteIfExists(temp.toPath());}
    }
    private static void sync(File base)throws IOException {
        RootShell.Result result=RootShell.runProcess(new ProcessBuilder("/system/bin/sh","-c",syncCommand(base))
                .directory(base).redirectErrorStream(true),null,15,4096,null);
        if(!result.isSuccess())throw new IOException("private_sync_failed");
    }
    static String syncCommand(File base){
        return "set -e\nset -o pipefail\nfind "+RootShell.quote(base.getPath())+" -depth -type d | while IFS= read -r d; do fsync \"$d\" || exit 74; done\nfsync "+RootShell.quote(base.getParent())+"\n";
    }
    private static String hex(byte[] bytes)throws Exception {
        byte[] digest=MessageDigest.getInstance("SHA-256").digest(bytes);StringBuilder value=new StringBuilder();
        for(byte b:digest)value.append(String.format(java.util.Locale.ROOT,"%02x",b&255));return value.toString();
    }

    private static final String PREFLIGHT="""
        set -e
        set -o pipefail
        export LC_ALL=C
        ROOT=/data/adb/ls_augment
        fail() { echo "legacy_root:$1" >&2; exit 74; }
        [ "$(id -u)" = 0 ] || fail root_required
        names() { printf '%s\\n' runtime/companion_install.state runtime/summary.state runtime/state.tsv app_metadata.tsv targets.backup.conf targets.conf tile.conf; }
        for dir in /data /data/adb "$ROOT" "$ROOT/runtime" "$ROOT/v2"; do
          [ ! -L "$dir" ] || fail linked_parent
          [ ! -e "$dir" ] || [ -d "$dir" ] || fail parent_type
        done
        for dir in "$ROOT" "$ROOT/runtime" "$ROOT/v2"; do
          [ -e "$dir" ] || continue
          case "$(stat -c '%u:%g:%a' "$dir")" in 0:0:700|0:0:750) ;; *) fail parent_owner ;; esac
        done
        inactive() {
          users=$(pm list users) || fail user_inventory
          user_ids=$(printf '%s\\n' "$users" | sed -n 's/.*UserInfo{\\([0-9][0-9]*\\):.*/\\1/p')
          printf '%s\\n' "$user_ids" | grep -Fxq 0 || fail user_inventory
          [ "$(printf '%s\\n' "$users" | grep -c 'UserInfo{')" = "$(printf '%s\\n' "$user_ids" | wc -l)" ] || fail user_inventory
          for user in $user_ids; do
            for package in io.github.lsf.augment io.github.lsf.frigoratile; do
              installed=$(pm list packages --user "$user" "$package") || fail companion_inventory
              if printf '%s\\n' "$installed" | grep -Fxq "package:$package"; then fail legacy_companion_installed; fi
              case "$installed" in ''|package:*) ;; *) fail companion_inventory ;; esac
            done
          done
          for path in /data/adb/modules/ls_augment /data/adb/modules_update/ls_augment "$ROOT/runtime/core.lock" "$ROOT/runtime/metadata.lock" "$ROOT/runtime/automation"; do
            [ ! -e "$path" ] && [ ! -L "$path" ] || fail legacy_writer_present
          done
          for dir in /data/adb/service.d /data/adb/post-fs-data.d; do
            [ ! -L "$dir" ] || fail linked_service_directory
            [ -d "$dir" ] || continue
            for entry in "$dir"/* "$dir"/.[!.]* "$dir"/..?*; do
              [ -e "$entry" ] || [ -L "$entry" ] || continue
              [ ! -L "$entry" ] && [ -f "$entry" ] && [ -r "$entry" ] || fail unknown_service_entry
              if grep -Eq '(/data/adb/ls_augment|/data/adb/modules/ls_augment|augmentctl|automation_daemon\\.sh)' "$entry"; then fail legacy_service_present; else [ "$?" = 1 ] || fail service_inspection; fi
            done
          done
          # Ignore only our actual parent chain, never processes matching a magic string.
          ignored=" $$ "; parent=$$
          while [ "$parent" -gt 1 ]; do
            parent=$(awk '/^PPid:/ {print $2}' "/proc/$parent/status") || fail process_ancestry
            case "$parent" in ''|*[!0-9]*) fail process_ancestry ;; esac
            ignored="$ignored$parent "
          done
          snapshot=$(ps -A -o PID,UID,ARGS) || fail process_inventory
          while read -r pid uid args; do
            case "$pid" in ''|*[!0-9]*) continue ;; esac
            case "$ignored" in *" $pid "*) continue ;; esac
            case "$args" in *'/data/adb/ls_augment'*|*'/data/adb/modules/ls_augment'*|*'augmentctl'*|*'automation_daemon.sh'*) fail legacy_process_present ;; esac
            case "$uid" in 0|root)
              [ -d "/proc/$pid" ] || continue
              if fds=$(ls -l "/proc/$pid/fd" 2>/dev/null); then
                case "$fds" in *' -> /data/adb/ls_augment/'*) fail legacy_file_open ;; esac
              else [ ! -d "/proc/$pid" ] || fail process_fds_unreadable; fi ;;
            esac
          done <<EOF
        $snapshot
        EOF
        }
        check() {
          case "$name" in runtime/companion_install.state|runtime/summary.state|runtime/state.tsv|app_metadata.tsv|targets.backup.conf|targets.conf|tile.conf) ;; *) fail unknown_name ;; esac
          path="$ROOT/$name"
          [ ! -L "$path" ] || fail linked_source
          if [ ! -e "$path" ]; then meta=absent; return; fi
          [ -f "$path" ] && [ -r "$path" ] && [ "$(readlink -f "$path")" = "$path" ] || fail source_type
          owner=$(stat -c '%u:%g:%a' "$path") || fail source_stat
          case "$owner" in 0:0:600) ;;
            0:0:666) [ "$name" = runtime/companion_install.state ] && [ "$(stat -c '%u:%g:%a' "$ROOT")" = 0:0:700 ] && [ "$(stat -c '%u:%g:%a' "$ROOT/runtime")" = 0:0:700 ] || fail source_owner ;;
            *) fail source_owner ;;
          esac
          [ "$(stat -c %h "$path")" = 1 ] || fail hardlinked_source
          [ "$(stat -c %s "$path")" -le 1048576 ] || fail source_too_large
          meta=$(stat -c '%d:%i:%u:%g:%a:%h:%s:%Y:%Z' "$path") || fail source_stat
        }
        inactive
        """;
    static String exportCommand(){return PREFLIGHT+"""
        echo LSA_LEGACY_ROOT1
        for name in $(names); do
          check
          if [ "$meta" = absent ]; then printf 'A|%s\\n' "$name"; continue; fi
          before=$meta; digest=$(sha256sum "$path"); digest=${digest%% *}
          encoded=$(base64 <"$path" | tr -d '\\n')
          actual=$(sha256sum "$path"); check
          [ "$before" = "$meta" ] && [ "$digest" = "${actual%% *}" ] || fail source_changed
          printf 'F|%s|%s|%s|%s\\n' "$name" "$meta" "$digest" "$encoded"
        done
        echo LSA_LEGACY_ROOT_END
        """;}
    static String cleanupCommand(){return PREFLIGHT+"""
        expected=$(cat)
        [ "$(printf '%s\\n' "$expected" | head -n 1)" = LSA_LEGACY_ROOT1 ] && [ "$(printf '%s\\n' "$expected" | tail -n 1)" = LSA_LEGACY_ROOT_END ] || fail manifest_frame
        [ "$(printf '%s\\n' "$expected" | wc -l)" = 9 ] || fail manifest_count
        verify() {
          row=$(printf '%s\\n' "$expected" | awk -F '|' -v key="$name" '$2==key {print}')
          check
          if [ "$meta" = absent ]; then [ "$row" = "A|$name" ] || fail source_changed; return; fi
          before=$meta
          actual=$(sha256sum "$path"); actual=${actual%% *}
          check
          [ "$before" = "$meta" ] || fail source_changed
          [ "$row" = "F|$name|$meta|$actual" ] || fail source_changed
        }
        for name in $(names); do verify; done
        inactive
        for name in $(names); do
          verify
          [ "$meta" != absent ] || continue
          rm -- "$path" || fail remove_failed
          [ ! -e "$path" ] && [ ! -L "$path" ] || fail removal_unconfirmed
          fsync "${path%/*}" || fail removal_sync_failed
        done
        # Unknown siblings remain. Only genuinely empty known directories may disappear.
        for dir in "$ROOT/runtime" "$ROOT/v2" "$ROOT"; do
          [ -d "$dir" ] || continue
          if rmdir "$dir" 2>/dev/null; then fsync "${dir%/*}" || fail directory_sync_failed;
          else remaining=$(find "$dir" -mindepth 1 -maxdepth 1 -print) || fail directory_inspection; [ -n "$remaining" ] || fail directory_cleanup; fi
        done
        echo LSA_LEGACY_ROOT_CLEAN
        """;}
}
