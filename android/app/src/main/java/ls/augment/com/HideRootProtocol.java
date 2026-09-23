package ls.augment.com;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.regex.Pattern;

/** Bounded transaction wire contract; a reply never substitutes for native ownership checks. */
final class HideRootProtocol {
    static final String COMMAND = "ls-augment-user-tx-v1", MAGIC = "LSAUTX1";
    static final String RESTORE_MAGIC = "LSAUTXR1";
    static final String SHOW_MAGIC = "LSAUTXS1";
    static final String RECOVERY_MAGIC = "LSAUR2";
    static final int MAX_BYTES = 512;
    static final int MAX_RECOVERY_BYTES = 768;
    private static final Pattern NONCE = Pattern.compile("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}");
    enum Verb { PREPARE, HIDE, STATUS, PREPARE_RESTORE, RESTORE, RESTORE_STATUS,
        PREPARE_RECOVERY, RECOVER, RECOVERY_STATUS, PREPARE_SHOW, SHOW, SHOW_STATUS, CANCEL, CANCEL_SHOW }
    enum Outcome { RESERVED, CHANGED, NOOP, REJECTED_BEFORE_WRITE, UNKNOWN_AFTER_DISPATCH,
        RUNNING, UNKNOWN_NONCE, NONCE_CONFLICT, CAPACITY, NOT_READY, RESTORED }

    static final class Request {
        final Verb verb;
        final int userId;
        final long serial;
        final String packageName, nonce, sourceHideNonce;
        final HideRestoreGrantLedger.Coordinate coordinate;
        final String challenge, authentication;
        Request(Verb verb, int userId, long serial, String packageName, String nonce) {
            this(verb,userId,serial,packageName,nonce,null);
        }
        Request(Verb verb, int userId, long serial, String packageName, String nonce, String sourceHideNonce) {
            this.verb = verb; this.userId = userId; this.serial = serial;
            this.packageName = packageName; this.nonce = nonce; this.sourceHideNonce = sourceHideNonce;
            this.coordinate = null; this.challenge = null; this.authentication = null;
            if (verb == null || isRecovery() || serial > Integer.MAX_VALUE
                    || !new HideTargetCodec.Entry(userId, serial, packageName, true).isBound()
                    || (isPrepare() ? nonce != null : !validNonce(nonce))
                    || (isRestore() ? !validNonce(sourceHideNonce)
                        || !isPrepare() && sourceHideNonce.equals(nonce) : sourceHideNonce != null))
                throw new IllegalArgumentException("Invalid transaction request");
            String[] args = args();
            int bytes = args.length - 1;
            for (String arg : args) {
                for (int i = 0; i < arg.length(); i++)
                    if (arg.charAt(i) < 33 || arg.charAt(i) > 126)
                        throw new IllegalArgumentException("Non-ASCII request");
                bytes += arg.length();
            }
            if (bytes > MAX_BYTES) throw new IllegalArgumentException("Request too long");
        }
        private Request(Verb verb, int userId, long serial, String packageName, String source,
                String challenge, HideRestoreGrantLedger.Coordinate coordinate, String authentication) {
            this.verb=verb;this.userId=userId;this.serial=serial;this.packageName=packageName;
            this.sourceHideNonce=source;this.challenge=challenge;this.coordinate=coordinate;
            this.nonce=coordinate==null?null:coordinate.nonce;this.authentication=authentication;
            if(!isRecovery() || serial>Integer.MAX_VALUE
                    || !new HideTargetCodec.Entry(userId,serial,packageName,true).isBound()
                    || !validNonce(source) || !validNonce(challenge)
                    || (isPrepare() ? coordinate!=null || authentication!=null
                        : coordinate==null || !sameTarget(this,coordinate)
                            || !challenge.equals(coordinate.challenge)
                            || authentication==null || !authentication.matches("[0-9a-f]{64}")))
                throw new IllegalArgumentException("Invalid recovery request");
            requireArguments(args(),MAX_RECOVERY_BYTES);
        }
        static Request prepareRecovery(int user,long serial,String pkg,String source,String challenge) {
            return new Request(Verb.PREPARE_RECOVERY,user,serial,pkg,source,challenge,null,null);
        }
        static Request recover(HideRestoreGrantLedger.Grant grant) {
            if(grant==null)throw new IllegalArgumentException("Missing execute grant");
            HideRestoreGrantLedger.Coordinate c=grant.coordinate;
            return new Request(Verb.RECOVER,c.userId,c.serial,c.packageName,c.sourceHideNonce,c.challenge,c,grant.executeMac);
        }
        static Request recoveryStatus(HideRestoreGrantLedger.StatusProof proof) {
            if(proof==null)throw new IllegalArgumentException("Missing status proof");
            HideRestoreGrantLedger.Coordinate c=proof.coordinate;
            return new Request(Verb.RECOVERY_STATUS,c.userId,c.serial,c.packageName,c.sourceHideNonce,c.challenge,c,proof.statusMac);
        }
        boolean isRecovery() { return verb==Verb.PREPARE_RECOVERY || verb==Verb.RECOVER || verb==Verb.RECOVERY_STATUS; }
        int maxBytes() { return isRecovery()?MAX_RECOVERY_BYTES:MAX_BYTES; }
        boolean isManualShow() { return verb == Verb.PREPARE_SHOW || verb == Verb.SHOW || verb == Verb.SHOW_STATUS || verb == Verb.CANCEL_SHOW; }
        boolean isCancel() { return verb == Verb.CANCEL || verb == Verb.CANCEL_SHOW; }
        boolean isPrepare() { return verb == Verb.PREPARE || verb == Verb.PREPARE_RESTORE || verb==Verb.PREPARE_RECOVERY || verb==Verb.PREPARE_SHOW; }
        boolean isRestore() { return verb == Verb.PREPARE_RESTORE || verb == Verb.RESTORE || verb == Verb.RESTORE_STATUS || isRecovery(); }
        boolean isStatus() { return verb == Verb.STATUS || verb == Verb.RESTORE_STATUS || verb==Verb.RECOVERY_STATUS || verb==Verb.SHOW_STATUS; }
        boolean isExecute() { return verb == Verb.HIDE || verb == Verb.RESTORE || verb==Verb.RECOVER || verb==Verb.SHOW; }
        String[] args() {
            if(isRecovery())return isPrepare()
                    ? new String[]{COMMAND,verb.name(),""+userId,""+serial,packageName,sourceHideNonce,challenge}
                    : new String[]{COMMAND,verb.name(),""+userId,""+serial,packageName,nonce,sourceHideNonce,
                        coordinate.epoch,""+coordinate.generation,challenge,authentication};
            if(isRestore())return isPrepare()
                    ? new String[]{COMMAND, verb.name(), "" + userId, "" + serial, packageName, sourceHideNonce}
                    : new String[]{COMMAND, verb.name(), "" + userId, "" + serial, packageName, nonce, sourceHideNonce};
            return isPrepare() ? new String[]{COMMAND, verb.name(), "" + userId, "" + serial, packageName}
                    : new String[]{COMMAND, verb.name(), "" + userId, "" + serial, packageName, nonce};
        }
        String command() {
            StringBuilder command = new StringBuilder("/system/bin/cmd package");
            for (String arg : args()) command.append(' ').append(RootShell.quote(arg));
            return command.toString();
        }
    }

    static final class Reply {
        final Request request;
        final String nonce;
        final Outcome outcome;
        final HideRestoreGrantLedger.Grant grant;
        final HideRestoreGrantLedger.StatusProof proof;
        final HideRestoreGrantLedger.Coordinate coordinate;
        Reply(Request request, String nonce, Outcome outcome) {
            this.request = request; this.nonce = nonce; this.outcome = outcome;
            this.grant=null;this.proof=null;this.coordinate=request==null?null:request.coordinate;
            if(request!=null&&request.isRecovery()&&(request.isPrepare()||!request.nonce.equals(nonce)
                    || !recoveryState(outcome) && outcome!=Outcome.UNKNOWN_NONCE
                    || request.isExecute()&&outcome==Outcome.RESERVED))
                throw new IllegalArgumentException("Invalid recovery result");
        }
        private Reply(Request request,HideRestoreGrantLedger.Grant grant,
                HideRestoreGrantLedger.StatusProof proof,Outcome outcome) {
            if(request==null||!request.isRecovery()||!request.isPrepare()
                    || (proof==null ? grant!=null || outcome!=Outcome.NOT_READY&&outcome!=Outcome.CAPACITY
                        : !sameTarget(request,proof.coordinate) || !recoveryState(outcome)
                            || grant!=null&&(outcome!=Outcome.RESERVED
                                || !sameCoordinate(grant.coordinate,proof.coordinate)
                                || !request.challenge.equals(grant.coordinate.challenge))))
                throw new IllegalArgumentException("Invalid recovery preparation result");
            this.request=request;this.grant=grant;this.proof=proof;this.outcome=outcome;
            this.coordinate=proof==null?null:proof.coordinate;this.nonce=coordinate==null?"-":coordinate.nonce;
        }
        static Reply recoveryPrepared(Request request,HideRestoreGrantLedger.Grant grant,
                HideRestoreGrantLedger.StatusProof proof,Outcome outcome) {
            return new Reply(request,grant,proof,outcome);
        }
        boolean mutationSuccess() { return request.isRestore() ? outcome == Outcome.RESTORED
                : outcome == Outcome.CHANGED || outcome == Outcome.NOOP; }
        int exitCode() { return mutationSuccess() || outcome == Outcome.RESERVED ? 0 : 75; }
        String encode() {
            if(request.isRecovery())return RECOVERY_MAGIC+"|"+request.verb+"|"+request.userId+"|"+request.serial
                    +"|"+request.packageName+"|"+request.sourceHideNonce+"|"+request.challenge+"|"+nonce
                    +"|"+(coordinate==null?"-":coordinate.epoch)+"|"+(coordinate==null?"-":coordinate.generation)
                    +"|"+(coordinate==null?"-":coordinate.challenge)+"|"+outcome
                    +"|"+(grant==null?"-":grant.executeMac)+"|"+(proof==null?"-":proof.statusMac)+"|END";
            return (request.isRestore() ? RESTORE_MAGIC : request.isManualShow() ? SHOW_MAGIC : MAGIC) + "|" + nonce + "|" + request.verb + "|" + request.userId + "|"
                    + request.serial + "|" + request.packageName + "|"
                    + (request.isRestore() ? request.sourceHideNonce + "|" : "") + outcome + "|"
                    + (outcome == Outcome.CHANGED || outcome == Outcome.RESTORED ? "1" : "0") + "|END";
        }
    }

    /** Legacy Result.output, including its trim(), is deliberately never read here. */
    static Reply parse(Request request, RootShell.Result result) {
        if (request == null || result == null || result.timedOut || result.capture == null
                || !result.capture.reliable()) return null;
        byte[] bytes = result.capture.bytes();
        if (bytes.length == 0 || bytes.length > request.maxBytes()) return null;
        int length = bytes.length;
        if (bytes[length - 1] == '\n') length--;
        for (int i = 0; i < length; i++) if (bytes[i] < 33 || bytes[i] > 126) return null;
        String line = new String(bytes, 0, length, StandardCharsets.US_ASCII);
        String[] fields = line.split("\\|", -1);
        if(request.isRecovery())return parseRecoveryReply(request,result,fields,line);
        boolean restore=request.isRestore();
        if (fields.length != (restore ? 10 : 9) || !(restore ? RESTORE_MAGIC : request.isManualShow() ? SHOW_MAGIC : MAGIC).equals(fields[0])
                || !"END".equals(fields[fields.length-1])) return null;
        try {
            Outcome outcome = Outcome.valueOf(fields[restore ? 7 : 6]);
            if(restore ? outcome==Outcome.CHANGED || outcome==Outcome.NOOP : outcome==Outcome.RESTORED)return null;
            if (request.isPrepare()) {
                if (outcome == Outcome.RESERVED ? !validNonce(fields[1]) || restore && fields[1].equals(request.sourceHideNonce)
                        : !"-".equals(fields[1]) || outcome != Outcome.CAPACITY && outcome != Outcome.NOT_READY)
                    return null;
            } else {
                if (!request.nonce.equals(fields[1]) || outcome == Outcome.CAPACITY
                        || request.isExecute() && outcome == Outcome.RESERVED) return null;
            }
            Reply reply = new Reply(request, fields[1], outcome);
            return reply.encode().equals(line) && result.exitCode == reply.exitCode() ? reply : null;
        } catch (IllegalArgumentException invalid) { return null; }
    }
    /** Syntax/canonical framing only. Server captures root identity and ledger verifies MACs. */
    static Request parseRecoveryRequest(String[] arguments) {
        if(arguments==null || arguments.length!=7&&arguments.length!=11)
            throw new IllegalArgumentException("Invalid recovery argument count");
        String[] args=arguments.clone();requireArguments(args,MAX_RECOVERY_BYTES);
        if(!COMMAND.equals(args[0]))throw new IllegalArgumentException("Invalid recovery command");
        Verb verb=Verb.valueOf(args[1]);Request request;
        int user=Integer.parseInt(args[2]);long serial=Long.parseLong(args[3]);
        if(verb==Verb.PREPARE_RECOVERY&&args.length==7)
            request=Request.prepareRecovery(user,serial,args[4],args[5],args[6]);
        else if((verb==Verb.RECOVER||verb==Verb.RECOVERY_STATUS)&&args.length==11) {
            HideRestoreGrantLedger.Coordinate c=new HideRestoreGrantLedger.Coordinate(
                    args[7],args[6],args[5],Long.parseLong(args[8]),user,serial,args[4],args[9]);
            request=verb==Verb.RECOVER?Request.recover(new HideRestoreGrantLedger.Grant(c,args[10]))
                    :Request.recoveryStatus(new HideRestoreGrantLedger.StatusProof(c,args[10]));
        }else throw new IllegalArgumentException("Invalid recovery verb or arguments");
        if(!Arrays.equals(args,request.args()))throw new IllegalArgumentException("Noncanonical recovery request");
        return request;
    }
    private static Reply parseRecoveryReply(Request request,RootShell.Result result,String[] f,String line) {
        if(f.length!=15 || !RECOVERY_MAGIC.equals(f[0]) || !"END".equals(f[14]))return null;
        try {
            Outcome outcome=Outcome.valueOf(f[11]);Reply reply;
            if(request.isPrepare()) {
                HideRestoreGrantLedger.StatusProof proof=null;HideRestoreGrantLedger.Grant grant=null;
                if(!"-".equals(f[13])) {
                    HideRestoreGrantLedger.Coordinate c=new HideRestoreGrantLedger.Coordinate(
                            f[8],f[5],f[7],Long.parseLong(f[9]),Integer.parseInt(f[2]),Long.parseLong(f[3]),f[4],f[10]);
                    proof=new HideRestoreGrantLedger.StatusProof(c,f[13]);
                    if(!"-".equals(f[12]))grant=new HideRestoreGrantLedger.Grant(c,f[12]);
                }
                reply=Reply.recoveryPrepared(request,grant,proof,outcome);
            }else reply=new Reply(request,f[7],outcome);
            // Exact re-encoding validates every echo, placeholder, number and MAC position.
            return reply.encode().equals(line)&&result.exitCode==reply.exitCode()?reply:null;
        }catch(IllegalArgumentException invalid){return null;}
    }
    private static void requireArguments(String[] args,int limit) {
        int bytes=args.length-1;
        for(String arg:args) {
            if(arg==null||arg.isEmpty()||arg.length()>limit)throw new IllegalArgumentException("Invalid argument length");
            for(int i=0;i<arg.length();i++)if(arg.charAt(i)<33||arg.charAt(i)>126)
                throw new IllegalArgumentException("Non-ASCII or control argument");
            bytes+=arg.length();
        }
        if(bytes>limit)throw new IllegalArgumentException("Recovery request too long");
    }
    private static boolean recoveryState(Outcome outcome) {
        return outcome==Outcome.RESERVED||outcome==Outcome.RUNNING||outcome==Outcome.REJECTED_BEFORE_WRITE
                ||outcome==Outcome.RESTORED||outcome==Outcome.UNKNOWN_AFTER_DISPATCH;
    }
    private static boolean sameTarget(Request r,HideRestoreGrantLedger.Coordinate c) {
        return c!=null&&r.userId==c.userId&&r.serial==c.serial&&r.packageName.equals(c.packageName)
                &&r.sourceHideNonce.equals(c.sourceHideNonce);
    }
    private static boolean sameCoordinate(HideRestoreGrantLedger.Coordinate a,HideRestoreGrantLedger.Coordinate b) {
        return a!=null&&b!=null&&a.userId==b.userId&&a.serial==b.serial&&a.generation==b.generation
                &&a.packageName.equals(b.packageName)&&a.sourceHideNonce.equals(b.sourceHideNonce)
                &&a.nonce.equals(b.nonce)&&a.epoch.equals(b.epoch)&&a.challenge.equals(b.challenge);
    }
    private static boolean validNonce(String text) { return text != null && NONCE.matcher(text).matches(); }
    private HideRootProtocol() { }
}
