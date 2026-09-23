package ls.augment.com;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Objects;

/** Root-owned append-only transaction slots. Observing a claim never recreates sending authority. */
final class HideRootPendingStore {
    static final int MAX_SLOTS=8192;
    interface Io { RootShell.Result run(Operation operation); }
    enum Mode { READ, CLAIM, FINISH }
    private final Io io;
    HideRootPendingStore(){this(operation->RootShell.run(operation.command(),null,30,8192));}
    HideRootPendingStore(Io io){this.io=Objects.requireNonNull(io);}

    static final class Snapshot {
        final int userId,nextSlot;final long serial;final String packageName,key,previous,error;
        final Record pending;
        private Snapshot(int user,long serial,String pkg,String key,int next,String previous,Record pending,String error){
            userId=user;this.serial=serial;packageName=pkg;this.key=key;nextSlot=next;this.previous=previous;this.pending=pending;this.error=error;
        }
        boolean available(){return error.isEmpty()&&pending==null&&nextSlot<MAX_SLOTS;}
    }
    static final class Record {
        final int slot;final String key,previous,encoded;final HideRecoveryJournal.Entry entry;
        private Record(int slot,String key,String previous,HideRecoveryJournal.Entry entry){
            if(slot<0||slot>=MAX_SLOTS||entry==null||entry.stage!=HideRecoveryJournal.Stage.PREPARED&&entry.stage!=HideRecoveryJournal.Stage.RESTORE_PREPARED
                    ||entry.recoveryProof!=null
                    ||HideRecoveryJournal.parse(entry.encode())==null||!key.equals(key(entry.userId,entry.userSerial,entry.packageName))
                    ||(slot==0?!"-".equals(previous):previous==null||!previous.matches("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}"))
                    ||previous.equals(entry.operationId))throw new IllegalArgumentException("Invalid transaction slot");
            this.slot=slot;this.key=key;this.previous=previous;this.entry=entry;
            encoded=(restoring()?"LSARTX2|":"LSARTX1|")+slot+"|"+previous+"|"+entry.encode();
        }
        boolean restoring(){return entry.stage==HideRecoveryJournal.Stage.RESTORE_PREPARED;}
    }
    static final class Claim {
        private final HideRootPendingStore owner;final Record record;final boolean acknowledged;final String error;
        private boolean dispatched,closedUnsent;
        private Claim(HideRootPendingStore owner,Record record,boolean acknowledged,String error){this.owner=owner;this.record=record;this.acknowledged=acknowledged;this.error=error;}
        synchronized void markDispatched(){if(!acknowledged||dispatched||closedUnsent)throw new IllegalStateException("Claim cannot dispatch again");dispatched=true;}
    }

    Snapshot read(int user,long serial,String pkg){
        String key;
        try{new HideRootProtocol.Request(HideRootProtocol.Verb.PREPARE,user,serial,pkg,null);key=key(user,serial,pkg);}
        catch(RuntimeException invalid){return failed(user,serial,pkg,"","事务目标无效");}
        try{
            String value=body(io.run(new Operation(Mode.READ,key,-1,"","")));
            if("EMPTY".equals(value))return new Snapshot(user,serial,pkg,key,0,"-",null,"");
            String[] lines=value==null?new String[0]:value.split("\n",-1);
            if(lines.length!=2||!lines[0].startsWith("RECORD|")||!lines[1].startsWith("TERMINAL|"))throw new IllegalStateException();
            Record record=parse(lines[0].substring(7),key,user,serial,pkg);
            String terminal=lines[1].substring(9);
            if("-".equals(terminal))return new Snapshot(user,serial,pkg,key,record.slot,record.previous,record,"");
            if(!terminal(terminal)||record.restoring()&&("CHANGED".equals(terminal)||"NOOP".equals(terminal))
                    ||!record.restoring()&&"RESTORED".equals(terminal))throw new IllegalStateException();
            // A full, valid history remains readable. Only allocation of a new legacy slot stops.
            return new Snapshot(user,serial,pkg,key,record.slot+1,record.entry.operationId,null,"");
        }catch(RuntimeException invalid){return failed(user,serial,pkg,key,"未决事务记录读取或校验未确认，未发送新操作");}
    }

    Claim claim(Snapshot snapshot,HideRecoveryJournal.Entry entry){
        if(snapshot==null||entry==null||!snapshot.available()||entry.userId!=snapshot.userId||entry.userSerial!=snapshot.serial
                ||!entry.packageName.equals(snapshot.packageName))throw new IllegalArgumentException("Different claim target");
        Record record=new Record(snapshot.nextSlot,snapshot.key,snapshot.previous,entry);
        try{
            String reply=body(io.run(new Operation(Mode.CLAIM,record.key,record.slot,record.encoded,"")));
            boolean confirmed=("CLAIMED|"+record.encoded).equals(reply);
            return new Claim(this,record,confirmed,confirmed?"":"事务抢占或持久确认失败，未发送隐藏");
        }catch(RuntimeException failure){return new Claim(this,record,false,"事务抢占结果未确认，未发送隐藏");}
    }

    /** Only a live client's exact claim, before its first dispatch, may certify this local fact. */
    boolean finishNotSent(Claim claim){
        if(claim==null||claim.owner!=this)return false;
        synchronized(claim){if(!claim.acknowledged||claim.dispatched)return false;claim.closedUnsent=true;return finish(claim.record,"LOCAL_NOT_SENT");}
    }
    boolean finishReply(Record record,HideRootProtocol.Reply reply){
        if(record==null||reply==null||reply.request==null
                ||(record.restoring() ? reply.request.verb!=HideRootProtocol.Verb.RESTORE&&reply.request.verb!=HideRootProtocol.Verb.RESTORE_STATUS
                    : reply.request.verb!=HideRootProtocol.Verb.HIDE&&reply.request.verb!=HideRootProtocol.Verb.STATUS)
                ||!Objects.equals(record.entry.sourceHideNonce,reply.request.sourceHideNonce)
                ||reply.request.userId!=record.entry.userId||reply.request.serial!=record.entry.userSerial
                ||!reply.request.packageName.equals(record.entry.packageName)||!reply.nonce.equals(record.entry.operationId)
                ||!reply.request.nonce.equals(record.entry.operationId))return false;
        switch(reply.outcome){
            case RESTORED:return record.restoring()&&finish(record,reply.outcome.name());
            case CHANGED:case NOOP:return !record.restoring()&&finish(record,reply.outcome.name());
            case REJECTED_BEFORE_WRITE:case NOT_READY:return finish(record,reply.outcome.name());
            default:return false;
        }
    }
    private boolean finish(Record record,String terminal){
        try{return ("FINISHED|"+record.encoded+"|"+terminal).equals(body(io.run(
            new Operation(Mode.FINISH,record.key,record.slot,record.encoded,terminal))));}
        catch(RuntimeException failure){return false;}
    }
    static boolean terminal(String value){return "RESTORED".equals(value)||"CHANGED".equals(value)||"NOOP".equals(value)
        ||"REJECTED_BEFORE_WRITE".equals(value)||"NOT_READY".equals(value)||"LOCAL_NOT_SENT".equals(value);}
    private static Snapshot failed(int user,long serial,String pkg,String key,String error){return new Snapshot(user,serial,pkg,key,-1,"-",null,error);}
    private static Record parse(String text,String key,int user,long serial,String pkg){
        String[] fields=text.split("\\|",4);
        if(fields.length!=4||!"LSARTX1".equals(fields[0])&&!"LSARTX2".equals(fields[0]))throw new IllegalArgumentException();
        HideRecoveryJournal.Entry entry=HideRecoveryJournal.parse(fields[3]);
        if(entry==null||entry.userId!=user||entry.userSerial!=serial||!entry.packageName.equals(pkg))throw new IllegalArgumentException();
        Record value=new Record(Integer.parseInt(fields[1]),key,fields[2],entry);
        if(!value.encoded.equals(text))throw new IllegalArgumentException();return value;
    }
    static String key(int user,long serial,String pkg){
        try{byte[] digest=MessageDigest.getInstance("SHA-256").digest((user+"|"+serial+"|"+pkg).getBytes(StandardCharsets.US_ASCII));
            StringBuilder out=new StringBuilder(64);for(byte value:digest)out.append(String.format(java.util.Locale.ROOT,"%02x",value&255));return out.toString();
        }catch(java.security.NoSuchAlgorithmException impossible){throw new IllegalStateException(impossible);}
    }
    private static String body(RootShell.Result result){
        if(result==null||!result.isSuccess()||result.capture==null||!result.capture.reliable())return null;
        byte[] bytes=result.capture.bytes();if(bytes.length==0||bytes.length>8192)return null;
        for(byte b:bytes)if(b!='\n'&&(b<33||b>126))return null;
        String value=new String(bytes,StandardCharsets.US_ASCII);
        String first="LSARTS1\n",last="\nLSARTS_END\n";
        return value.startsWith(first)&&value.endsWith(last)?value.substring(first.length(),value.length()-last.length()):null;
    }

    /** Fixed validated operation; the production transport never evaluates caller-provided script text. */
    static final class Operation {
        final Mode mode;final String key,record,terminal;final int slot;
        private Operation(Mode mode,String key,int slot,String record,String terminal){this.mode=mode;this.key=key;this.slot=slot;this.record=record;this.terminal=terminal;}
        String command(){
            return "MODE="+RootShell.quote(mode.name())+"\nKEY="+RootShell.quote(key)+"\nSLOT="+slot
                +"\nRECORD="+RootShell.quote(record)+"\nTERMINAL="+RootShell.quote(terminal)+"\n"+SCRIPT;
        }
    }
    private static final String SCRIPT="""
        umask 077
        export LC_ALL=C
        ROOT='/data/adb/ls_augment/v2/root-transactions-v1'
        DIR="$ROOT/$KEY"
        TMP=''
        fail() { printf '%s\\n' "root_pending:$1" >&2; exit 74; }
        trap '[ -z "$TMP" ] || rm -f "$TMP"' EXIT
        trap 'exit 74' HUP INT TERM
        command -v fsync >/dev/null 2>&1 || fail fsync_unavailable
        parent="$DIR"
        while [ "$parent" != / ]; do
          [ ! -L "$parent" ] || fail symlink_parent
          parent=${parent%/*}; [ -n "$parent" ] || parent=/
        done
        [ -d /data/adb ] || fail root_storage_unavailable
        mkdir -p "$DIR" || fail directory_create
        chmod 0700 "$ROOT" "$DIR" || fail directory_permissions
        [ -d "$DIR" ] && [ ! -L "$DIR" ] || fail invalid_directory
        checkfile() { [ -f "$1" ] && [ ! -L "$1" ] && [ -r "$1" ] || fail invalid_record; }
        slotpath() { printf '%s/%08d.claim' "$DIR" "$1"; }
        syncdirs() { fsync "$DIR" "$ROOT" /data/adb/ls_augment/v2 /data/adb/ls_augment /data/adb || fail directory_sync; }
        emit() { printf 'LSARTS1\\n%s\\nLSARTS_END\\n' "$1" || fail output; }
        readrecord() {
          checkfile "$1"
          size=$(wc -c <"$1") || fail record_size
          [ "$size" -gt 0 ] && [ "$size" -lt 4096 ] || fail record_size
          value=$(cat "$1") || fail record_read
          TMP=$(mktemp "$ROOT/.read.XXXXXXXX") || fail temp_create
          printf '%s\\n' "$value" >"$TMP" || fail normalize_write
          cmp -s "$TMP" "$1" || fail record_noncanonical
          rm -f "$TMP" || fail temp_remove; TMP=''
        }
        if [ "$MODE" = READ ]; then
          count=0
          for item in "$DIR"/*; do
            [ -e "$item" ] || { [ ! -L "$item" ] || fail dangling_record; continue; }
            checkfile "$item"
            name=${item##*/}
            case "$name" in
              [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9].claim|[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9].done) ;;
              *) fail unknown_file ;;
            esac
            count=$((count+1)); [ "$count" -le 16384 ] || fail history_capacity
          done
          index=0
          previous_path=''
          while [ "$index" -lt 8192 ]; do
            ordinal="00000000$index"
            ordinal=${ordinal#${ordinal%????????}}
            path="$DIR/$ordinal.claim"
            [ -e "$path" ] || break
            checkfile "$path"
            if [ "$index" -gt 0 ]; then
              checkfile "${previous_path%.claim}.done"
            fi
            previous_path=$path
            index=$((index+1))
          done
          if [ "$index" -eq 0 ]; then
            [ "$count" -eq 0 ] || fail history_gap
            emit EMPTY; exit 0
          fi
          path=$previous_path
          readrecord "$path"; latest="$value"
          donepath="${path%.claim}.done"
          if [ -e "$donepath" ]; then
            [ "$count" -eq "$((index*2))" ] || fail history_gap
            readrecord "$donepath"
            case "$value" in "$latest"'|'*) result=${value#"$latest|"} ;; *) fail terminal_identity ;; esac
          else
            [ "$count" -eq "$((index*2-1))" ] || fail history_gap
            result='-'
          fi
          emit "RECORD|$latest
        TERMINAL|$result"
          exit 0
        fi
        [ "$SLOT" -ge 0 ] && [ "$SLOT" -lt 8192 ] || fail invalid_slot
        path=$(slotpath "$SLOT")
        TMP=$(mktemp "$ROOT/.write.XXXXXXXX") || fail temp_create
        chmod 0600 "$TMP" || fail file_permissions
        printf '%s\\n' "$RECORD" >"$TMP" || fail record_write
        if [ "$MODE" = CLAIM ]; then
          if [ "$SLOT" -gt 0 ]; then
            prior=$(slotpath "$((SLOT-1))"); checkfile "$prior"; checkfile "${prior%.claim}.done"
            previous=$(cat "$prior") || fail previous_read
            completion=$(cat "${prior%.claim}.done") || fail previous_terminal_read
            IFS='|' read -r magic ordinal predecessor journal nonce rest <<EOF
        $previous
        EOF
            expected=$(printf '%s' "$RECORD" | cut -d '|' -f 3) || fail predecessor_read
            case "$magic" in LSARTX1|LSARTX2) ;; *) fail predecessor_schema ;; esac
            [ "$ordinal" = "$((SLOT-1))" ] && [ "$nonce" = "$expected" ] || fail predecessor_identity
            case "$completion" in
              "$previous|CHANGED"|"$previous|NOOP") [ "$magic" = LSARTX1 ] || fail predecessor_kind ;;
              "$previous|RESTORED") [ "$magic" = LSARTX2 ] || fail predecessor_kind ;;
              "$previous|REJECTED_BEFORE_WRITE"|"$previous|NOT_READY"|"$previous|LOCAL_NOT_SENT") ;;
              *) fail predecessor_not_terminal ;;
            esac
            fsync "$prior" "${prior%.claim}.done" || fail predecessor_sync
          fi
          fsync "$TMP" || fail claim_sync
          # An existing identical claim never grants another client's sending permission.
          ln "$TMP" "$path" 2>/dev/null || fail slot_already_claimed
          checkfile "$path"; cmp -s "$TMP" "$path" || fail claim_compare
          fsync "$path" || fail claim_sync
          syncdirs
          emit "CLAIMED|$RECORD"
        elif [ "$MODE" = FINISH ]; then
          checkfile "$path"; cmp -s "$TMP" "$path" || fail foreign_claim
          case "$TERMINAL" in
            CHANGED|NOOP) case "$RECORD" in LSARTX1\\|*) ;; *) fail terminal_kind ;; esac ;;
            RESTORED) case "$RECORD" in LSARTX2\\|*) ;; *) fail terminal_kind ;; esac ;;
            REJECTED_BEFORE_WRITE|NOT_READY|LOCAL_NOT_SENT) ;;
            *) fail invalid_terminal ;;
          esac
          printf '%s|%s\\n' "$RECORD" "$TERMINAL" >"$TMP" || fail terminal_write
          fsync "$TMP" || fail terminal_sync
          dest="${path%.claim}.done"
          if ! ln "$TMP" "$dest" 2>/dev/null; then
            checkfile "$dest"; cmp -s "$TMP" "$dest" || fail terminal_conflict
          fi
          checkfile "$dest"; cmp -s "$TMP" "$dest" || fail terminal_compare
          fsync "$path" "$dest" || fail terminal_sync
          syncdirs
          emit "FINISHED|$RECORD|$TERMINAL"
        else
          fail unknown_mode
        fi
        """;
}
