package ls.augment.com;

/** Exact, short-lived owning-process reset handshake, with no configuration writers. */
public final class LauncherResetPolicy {
    public static final String PACKAGE="com.zte.mifavor.launcher";
    public static final long MAX_TTL_MS=20000L;
    private LauncherResetPolicy() { }
    public static final class Request {
        public final String nonce,checksum;
        public final int user,launcherUid,moduleVersion;
        public final long serial,revision,createdAt,expiresAt,generation;
        public Request(String nonce,int user,long serial,int launcherUid,int moduleVersion,
                long revision,String checksum,long createdAt,long expiresAt,long generation) {
            this.nonce=nonce;this.user=user;this.serial=serial;this.launcherUid=launcherUid;
            this.moduleVersion=moduleVersion;this.revision=revision;this.checksum=checksum;
            this.createdAt=createdAt;this.expiresAt=expiresAt;this.generation=generation;
        }
    }
    public static boolean valid(Request r,long now) {
        return r!=null&&r.nonce!=null&&r.nonce.matches("[0-9a-f]{8}(-[0-9a-f]{4}){3}-[0-9a-f]{12}")
                &&r.checksum!=null&&r.checksum.matches("[0-9a-f]{64}")
                &&r.user>=0&&r.user<=99999&&r.serial>=0&&r.serial<=Integer.MAX_VALUE
                &&r.launcherUid>=10000&&r.launcherUid/100000==r.user
                &&r.launcherUid%100000>=10000&&r.moduleVersion>0&&r.revision>0&&r.generation>0
                &&r.createdAt>=0&&now>=r.createdAt&&r.expiresAt>now
                &&r.expiresAt>r.createdAt&&r.expiresAt-r.createdAt<=MAX_TTL_MS;
    }
    public static boolean caller(Request r,int uid,String callingPackage,String[] packages) {
        return r!=null&&uid==r.launcherUid&&uid/100000==r.user&&PACKAGE.equals(callingPackage)
                &&packages!=null&&packages.length==1&&PACKAGE.equals(packages[0]);
    }
    public static boolean matches(Request r,String nonce,int user,long serial,int version,
            long revision,String checksum,long generation,long now) {
        return valid(r,now)&&r.nonce.equals(nonce)&&r.user==user&&r.serial==serial
                &&r.moduleVersion==version&&r.revision==revision&&r.checksum.equals(checksum)
                &&r.generation==generation;
    }
    public static final class Receipt {
        public final boolean success; public final String code; public final int pid;
        Receipt(boolean success,String code,int pid){this.success=success;this.code=code;this.pid=pid;}
    }
    /** A restarted process cannot acknowledge its predecessor's claimed request. */
    public static final class Session {
        public final Request request;
        private int ownerPid;
        private Receipt receipt;
        public Session(Request request){this.request=request;}
        public synchronized boolean claim(int pid,long now) {
            if(!valid(request,now)||pid<=0||receipt!=null)return false;
            if(ownerPid==0)ownerPid=pid;
            return ownerPid==pid;
        }
        public synchronized boolean ack(int pid,boolean success,String code,long now) {
            if(!valid(request,now)||pid<=0||pid!=ownerPid||receipt!=null
                    ||code==null||!code.matches("[a-z_]{1,48}")
                    ||success&&!"pages_empty".equals(code))return false;
            receipt=new Receipt(success,code,pid);notifyAll();return true;
        }
        public synchronized Receipt receipt(){return receipt;}
    }
}
