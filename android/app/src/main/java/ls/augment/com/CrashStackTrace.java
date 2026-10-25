package ls.augment.com;

import java.util.IdentityHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Stack locations and exception types only: never exception messages or buffer payloads. */
public final class CrashStackTrace {
    public static final int LIMIT=64*1024;
    private static final Pattern TYPE=Pattern.compile("(?:Caused by: |Suppressed: )?([A-Za-z_$][A-Za-z0-9_.$]*\\.[A-Za-z0-9_.$]+)(?::.*)?");
    private static final Pattern FRAME=Pattern.compile("at ([A-Za-z0-9_.$<>-]+)\\(([A-Za-z0-9_.$ -]+(?::[0-9]+)?)\\)");
    private CrashStackTrace() { }
    public static String symbol(String value,int max) {
        return value!=null&&value.length()<=max&&value.matches("[A-Za-z0-9_.$<>:-]+")?value:"unknown";
    }
    public static void append(StringBuilder out,Throwable failure) {
        append(out,failure,"root",new IdentityHashMap<>(),0);
    }
    private static void append(StringBuilder out,Throwable failure,String relation,IdentityHashMap<Throwable,Boolean> seen,int depth) {
        if(failure==null)return;
        if(depth>=16||seen.size()>=16||out.length()>LIMIT-2048){out.append("STACK_TRUNCATED\n");return;}
        if(seen.put(failure,true)!=null){out.append("CAUSE_CYCLE\n");return;}
        out.append("exception=").append(symbol(failure.getClass().getName(),200)).append(" relation=").append(relation).append('\n');
        StackTraceElement[] frames=failure.getStackTrace();
        int written=0;
        for(;written<Math.min(128,frames.length)&&out.length()<LIMIT-2048;written++) {
            StackTraceElement frame=frames[written];if(frame==null)continue;
            out.append(" at ").append(symbol(frame.getClassName(),200)).append('#').append(symbol(frame.getMethodName(),160))
                .append('(').append(symbol(frame.getFileName(),160)).append(':').append(frame.getLineNumber()).append(")\n");
        }
        if(written<frames.length)out.append("FRAMES_TRUNCATED\n");
        Throwable[] suppressed=failure.getSuppressed();
        for(int i=0;i<Math.min(4,suppressed.length);i++)append(out,suppressed[i],"suppressed",seen,depth+1);
        if(suppressed.length>4)out.append("SUPPRESSED_TRUNCATED\n");
        append(out,failure.getCause(),"cause",seen,depth+1);
    }
    /** Parse a native eulogy or DropBox entry, stopping before unrelated log buffers. */
    static String fromText(String input,boolean eulogy) {
        StringBuilder out=new StringBuilder();boolean active=!eulogy,started=false;int frames=0,types=0;
        for(String raw:input.split("\\r?\\n")) {
            String line=raw.trim();
            if(!active){if(line.equals("Dump triggered by exception:"))active=true;continue;}
            Matcher frame=FRAME.matcher(line),type=TYPE.matcher(line);
            if(frame.matches()) {
                if(++frames>512||out.length()>LIMIT-1024){out.append("STACK_TRUNCATED\n");break;}
                out.append(" at ").append(frame.group(1)).append('(').append(frame.group(2)).append(")\n");started=true;
            }else if(type.matches()&&type.group(1).contains(".")&&(!started||line.startsWith("Caused by:")||line.startsWith("Suppressed:"))) {
                if(++types>16){out.append("CAUSES_TRUNCATED\n");break;}
                out.append("exception=").append(type.group(1)).append(" relation=")
                    .append(line.startsWith("Caused by:")?"cause":line.startsWith("Suppressed:")?"suppressed":"root").append('\n');started=true;
            }else if(started&&line.matches("\\.\\.\\. [0-9]+ more"))out.append(line).append('\n');
            else if(started&&!line.isEmpty())break;
        }
        return started?out.toString():"status=NO_MATCHING_JAVA_STACK;absence_not_no_crash=true\n";
    }
}
