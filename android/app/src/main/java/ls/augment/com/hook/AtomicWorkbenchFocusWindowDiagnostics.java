package ls.augment.com.hook;

import android.os.Process;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.atomic.AtomicLong;

/** Evidence only. No diagnostic fact authorizes a window or changes a hook result. */
final class AtomicWorkbenchFocusWindowDiagnostics {
    static final int ADD_GATE=1, POLICY_RECHECK=2;
    static final int NOT_INSTALLED=1, NESTED_ADD=2, ARGUMENTS=3, DISPLAY_RANGE=4,
            CALLER_UID=5, CALLER_PID=6, CALLER_USER=7, ATTR_TYPE=8, ATTR_WIDTH=9,
            ATTR_HEIGHT=10, ATTR_PACKAGE=11, ATTR_TITLE_NULL=12, ATTR_TITLE=13,
            ATTR_TOUCH=14, ATTR_FLAGS=15, ATTR_PRIVATE=16, ATTR_X=17, ATTR_Y=18,
            ATTR_DIM=19, ATTR_ANIMATION=20, ATTR_FORMAT=21, ATTR_ALPHA=22,
            ATTR_ALPHA_FINITE=23, ATTR_SOFT=24, ATTR_GRAVITY=25, ATTR_INSETS=26,
            DISPLAY_MISSING=27, UID_CHANGED=28, PID_CHANGED=29, PID_OWNER=30,
            SESSION_UID=31, SESSION_PID=32, CURRENT_USER=33, IME_SCOPE=34,
            PROCESS_MISSING=35, PROCESS_UID=36, PROCESS_PID=37, PROCESS_USER=38,
            PROCESS_NAME=39, INFO_MISSING=40, INFO_UID=41, INFO_PACKAGE=42,
            CLIENT_MISSING=43, CLIENT_DEAD=44, DISPLAY_ID=45, DISPLAY_REQUIRED=46,
            DISPLAY_FORBIDDEN=47, TITLE_UNIQUE=48, CONTEXT_MISSING=49,
            CONTEXT_DEAD=50, WINDOW_CONTEXT=51, LISTENERS_SHAPE=52,
            LISTENER_MISSING=53, CONTEXT_WPC=54, CONTEXT_TYPE=55,
            CONTAINER_MISSING=56, CONTAINER_DISPLAY=57, DUPLICATE_GUARD=58,
            RESERVATION=59, REFLECTION=60, POLICY_ARGUMENTS=61, NO_PERMIT=62;
    static final int TYPE=0, WIDTH=1, HEIGHT=2, FLAGS=3, PRIVATE_FLAGS=4,
            X=5, Y=6, DIM=7, ANIMATION=8, FORMAT=9, ALPHA=10, SOFT=11,
            GRAVITY=12, INSETS=13;
    private static final String[] GATES={"NONE","NOT_INSTALLED","NESTED_ADD","ARGUMENTS",
            "DISPLAY_RANGE","CALLER_UID","CALLER_PID","CALLER_USER","ATTR_TYPE","ATTR_WIDTH",
            "ATTR_HEIGHT","ATTR_PACKAGE","ATTR_TITLE_NULL","ATTR_TITLE","ATTR_TOUCH","ATTR_FLAGS",
            "ATTR_PRIVATE","ATTR_X","ATTR_Y","ATTR_DIM","ATTR_ANIMATION","ATTR_FORMAT","ATTR_ALPHA",
            "ATTR_ALPHA_FINITE","ATTR_SOFT","ATTR_GRAVITY","ATTR_INSETS","DISPLAY_MISSING","UID_CHANGED",
            "PID_CHANGED","PID_OWNER","SESSION_UID","SESSION_PID","CURRENT_USER","IME_SCOPE",
            "PROCESS_MISSING","PROCESS_UID","PROCESS_PID","PROCESS_USER","PROCESS_NAME","INFO_MISSING",
            "INFO_UID","INFO_PACKAGE","CLIENT_MISSING","CLIENT_DEAD","DISPLAY_ID","DISPLAY_REQUIRED",
            "DISPLAY_FORBIDDEN","TITLE_UNIQUE","CONTEXT_MISSING","CONTEXT_DEAD","WINDOW_CONTEXT",
            "LISTENERS_SHAPE","LISTENER_MISSING","CONTEXT_WPC","CONTEXT_TYPE","CONTAINER_MISSING",
            "CONTAINER_DISPLAY","DUPLICATE_GUARD","RESERVATION","REFLECTION","POLICY_ARGUMENTS","NO_PERMIT"};
    private static final String[] ATTRS={"a_type","a_width","a_height","a_flags","a_private",
            "a_x","a_y","a_dim","a_animation","a_format","a_alpha","a_soft","a_gravity","a_insets"};
    private static volatile Writer writer;

    /** Called only by installation, before any callback can use diagnostics. Never initialized on offer. */
    static synchronized void initialize() {
        if(writer!=null)return;
        try { Writer candidate=new Writer(Process.myPid()); candidate.thread.start(); writer=candidate; }
        catch(Throwable ignored) { /* A disabled observer cannot disable a permission hook. */ }
    }
    static Attempt begin(String owner,int abi,int uid,int pid,int display,int user) {
        Writer current=writer;
        return current==null?null:new Attempt(owner,abi,current.pid,current.sequence.incrementAndGet(),uid,pid,display,user);
    }
    static void installation(String owner,int abi,String stage,int bits,String failure) {
        Writer current=writer;
        if(current!=null)current.offer(new Frame(owner,abi,current.pid,stage,bits,failure));
    }
    static void offer(Attempt attempt,int installedBits) {
        Writer current=writer;
        if(current!=null&&attempt!=null&&attempt.candidate)current.offer(new Frame(attempt,installedBits));
    }

    static final class Attempt {
        final String owner;
        final int abi,serverPid;
        int uid,pid,display,user;
        final long sequence,started=System.nanoTime();
        final int[] attrs=new int[14];
        // Filled from the existing IME lookup only: Root PID, UID, display, registration generation, state.
        final long[] binding={-1,-1,-1,-1,0};
        long visited,passed;
        int known,stage=ADD_GATE,firstGate,firstStage,originalState,result,throwKind,registered,override;
        int allowedPrivate,fitTypes;
        boolean fitKnown;
        boolean candidate,packageKnown,packageMatches;
        Attempt(String owner,int abi,int serverPid,long sequence,int uid,int pid,int display,int user) {
            this.owner=owner;this.abi=abi;this.serverPid=serverPid;this.sequence=sequence;
            this.uid=uid;this.pid=pid;this.display=display;this.user=user;
        }
        void check(int gate,boolean pass) {
            visited|=1L<<gate;
            if(pass)passed|=1L<<gate;
            else {passed&=~(1L<<gate);if(firstGate==0){firstGate=gate;firstStage=stage;}}
        }
        void attribute(int index,int value){attrs[index]=value;known|=1<<index;}
        void packageMatch(boolean value){packageKnown=true;packageMatches=value;}
    }
    private static final class Frame {
        final String owner,installStage,failure;
        final int abi,serverPid,bits,uid,pid,display,user,known,firstGate,firstStage,originalState,result,throwKind,registered,allowedPrivate,fitTypes,override;
        final long sequence,visited,passed,duration;
        final boolean fitKnown;
        final int[] attrs;
        final long[] binding;
        Frame(String owner,int abi,int serverPid,String stage,int bits,String failure){
            this.owner=owner;this.abi=abi;this.serverPid=serverPid;this.installStage=stage;this.bits=bits;this.failure=failure;
            uid=pid=display=user=known=firstGate=firstStage=originalState=result=throwKind=registered=0;
            sequence=visited=passed=duration=0;override=0;attrs=null;binding=null;
            allowedPrivate=fitTypes=0;fitKnown=false;
        }
        Frame(Attempt a,int bits){
            owner=a.owner;abi=a.abi;serverPid=a.serverPid;installStage="";failure="";this.bits=bits;
            uid=a.uid;pid=a.pid;display=a.display;user=a.user;known=a.known;firstGate=a.firstGate;firstStage=a.firstStage;
            originalState=a.originalState;result=a.result;throwKind=a.throwKind;registered=a.registered;
            sequence=a.sequence;visited=a.visited;passed=a.passed;duration=Math.max(0,System.nanoTime()-a.started);
            override=a.override;attrs=a.attrs.clone();binding=a.binding.clone();
            allowedPrivate=a.allowedPrivate;fitTypes=a.fitTypes;fitKnown=a.fitKnown;
        }
    }
    private static final class Repeat {long at,count;Repeat(long at){this.at=at;}}
    private static final class Writer implements Runnable {
        final int pid;
        final AtomicLong sequence=new AtomicLong(),dropped=new AtomicLong();
        final ArrayBlockingQueue<Frame> queue=new ArrayBlockingQueue<>(32);
        final Thread thread;
        final LinkedHashMap<String,Repeat> repeats=new LinkedHashMap<String,Repeat>(16,.75f,true){
            @Override protected boolean removeEldestEntry(Map.Entry<String,Repeat> e){return size()>16;}
        };
        String boot="UNKNOWN";
        Writer(int pid){this.pid=pid;thread=new Thread(this,"Duo-FocusEvidence");thread.setDaemon(true);}
        void offer(Frame frame){if(!queue.offer(frame))dropped.incrementAndGet();}
        @Override public void run(){
            try {String value=new String(Files.readAllBytes(Path.of("/proc/sys/kernel/random/boot_id")),StandardCharsets.UTF_8).trim();
                if(value.matches("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}"))boot=value;
            }catch(Throwable ignored){}
            for(;;)try{emit(queue.take());}catch(InterruptedException ignored){}catch(Throwable ignored){dropped.incrementAndGet();}
        }
        void emit(Frame f)throws Exception {
            String prefix=" owner_id="+f.owner+" diag_abi="+f.abi+" server_pid="+f.serverPid+" boot_id="+boot+" hook_bits="+f.bits+" diag_dropped="+dropped.get();
            if(f.attrs==null){HookTelemetry.atomicWorkbench("INFO","ATOMIC_FOCUS_WINDOW_OWNER"+prefix+" install_stage="+f.installStage+" install_failure="+f.failure,null);return;}
            String key=f.owner+":"+f.uid+":"+f.pid+":"+f.display+":"+Arrays.toString(f.binding)+":"+f.firstGate+":"+f.firstStage+":"+f.originalState+":"+f.result+":"+f.throwKind+":"+f.registered+":"+f.override+":"+f.known+":"+f.fitKnown+":"+f.fitTypes+":"+Arrays.toString(f.attrs);
            long now=System.nanoTime()/1_000_000L;Repeat repeat=repeats.get(key);long suppressed=0;
            if(repeat!=null){if(now-repeat.at<3000){repeat.count++;return;}suppressed=repeat.count;repeat.count=0;repeat.at=now;}else repeats.put(key,new Repeat(now));
            String bindingId="UNKNOWN";
            if(f.binding[3]>0)bindingId=hex(MessageDigest.getInstance("SHA-256").digest((boot+":"+f.serverPid+":"+f.binding[0]+":"+f.binding[1]+":"+f.binding[2]+":"+f.binding[3]).getBytes(StandardCharsets.UTF_8)));
            StringBuilder text=new StringBuilder("ATOMIC_FOCUS_WINDOW_ADD_RESULT").append(prefix)
                    .append(" attempt_seq=").append(f.sequence).append(" caller_uid=").append(f.uid).append(" caller_pid=").append(f.pid)
                    .append(" user=").append(f.user).append(" display=").append(f.display).append(" root_pid=").append(f.binding[0])
                    .append(" registration_generation=").append(f.binding[3]).append(" binding_id=").append(bindingId)
                    .append(" binding_state=").append(f.binding[4]==2?"IME_MATCHED":f.binding[4]==1?"CACHE_ONLY":f.binding[4]==3?"NO_REGISTRATION":"NOT_CHECKED")
                    .append(" first_gate=").append(f.visited==0?"NOT_OBSERVED":GATES[f.firstGate]).append(" first_stage=").append(f.firstStage==POLICY_RECHECK?"POLICY_RECHECK":f.firstStage==ADD_GATE?"ADD_GATE":"NONE")
                    .append(" visited_mask=0x").append(Long.toHexString(f.visited)).append(" passed_mask=0x").append(Long.toHexString(f.passed))
                    .append(" observed_fields=0x").append(Integer.toHexString(f.known)).append(" permission_override=").append(f.override==2?"TRUE":f.override==1?"FALSE":"UNKNOWN")
                    .append(" original_state=").append(f.originalState==1?"RETURNED":f.originalState==2?"THREW":"UNKNOWN")
                    .append(" add_result=").append(f.originalState==1?Integer.toString(f.result):"UNKNOWN")
                    .append(" throw_kind=").append(f.throwKind==1?"SECURITY":f.throwKind==2?"ILLEGAL_STATE":f.throwKind==3?"OTHER_THROWABLE":"NONE")
                    .append(" registry_state=").append(f.registered==2?"TRUE":f.registered==1?"FALSE":"UNKNOWN")
                    .append(" allowed_private=").append(f.allowedPrivate).append(" fit_types=").append(f.fitKnown?Integer.toString(f.fitTypes):"UNKNOWN")
                    .append(" suppressed=").append(suppressed);
            for(int i=0;i<ATTRS.length;i++)text.append(' ').append(ATTRS[i]).append('=').append((f.known&(1<<i))==0?"UNKNOWN":(i==DIM||i==ALPHA)?Float.toString(Float.intBitsToFloat(f.attrs[i])):Integer.toString(f.attrs[i]));
            HookTelemetry.atomicWorkbench("INFO",text.toString(),null);
        }
    }
    private static String hex(byte[] bytes){StringBuilder out=new StringBuilder(64);for(byte b:bytes)out.append(Character.forDigit((b>>>4)&15,16)).append(Character.forDigit(b&15,16));return out.toString();}
    private AtomicWorkbenchFocusWindowDiagnostics(){}
}
