package ls.augment.com;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.function.Function;

/** Resource readiness, not a claim that a gesture has been drawn or passed a pixel test. */
public final class BackGestureRuntimeObservation {
    public static final String KEY="ls_augment_back_icon_runtime_v1";
    public final long revision,generation,elapsed,processStarted;
    public final int pid,build,loadedMask,requiredMask;
    public final String signature,phase;

    private BackGestureRuntimeObservation(long revision,String signature,long generation,int pid,int build,
            long elapsed,long processStarted,String phase,int loadedMask,int requiredMask) {
        this.revision=revision;this.signature=signature;this.generation=generation;this.pid=pid;this.build=build;
        this.elapsed=elapsed;this.processStarted=processStarted;this.phase=phase;
        this.loadedMask=loadedMask;this.requiredMask=requiredMask;
    }

    /** Include the master and every side parameter, including geometry-only changes and disabled values. */
    public static String signature(Function<String,String> values) {
        return fingerprint(values,true);
    }

    /** Resource states are reusable across unrelated revisions, but not across gesture parameter edits. */
    public static String parameterSignature(Function<String,String> values) {
        return fingerprint(values,false);
    }

    private static String fingerprint(Function<String,String> values,boolean master) {
        StringBuilder text=new StringBuilder();
        if(master)append(text,ConfigSchema.SYSTEMUI_MASTER,values.apply(ConfigSchema.SYSTEMUI_MASTER));
        append(text,BackGestureIconPolicy.ENABLED,values.apply(BackGestureIconPolicy.ENABLED));
        for(String key:BackGestureIconPolicy.parameterKeys())append(text,key,values.apply(key));
        try {
            byte[] bytes=MessageDigest.getInstance("SHA-256").digest(text.toString().getBytes(StandardCharsets.UTF_8));
            StringBuilder result=new StringBuilder(64);
            for(byte value:bytes){result.append(Character.forDigit((value&255)>>>4,16));result.append(Character.forDigit(value&15,16));}
            return result.toString();
        }catch(java.security.NoSuchAlgorithmException impossible){throw new IllegalStateException(impossible);}
    }

    private static void append(StringBuilder out,String key,String value) {
        out.append(key.length()).append(':').append(key).append(':');
        if(value==null)out.append("-1:");else out.append(value.length()).append(':').append(value);
        out.append(';');
    }

    /** Bits: left icon, left wave, right icon, right wave. A wave can be customized without an icon. */
    public static int requiredMask(Function<String,String> values) {
        if(!"1".equals(values.apply(BackGestureIconPolicy.ENABLED)))return 0;
        int result=0;
        for(int side=0;side<2;side++) {
            BackGestureIconPolicy.Side setting=new BackGestureIconPolicy.Side(values,side);
            if(setting.custom)result|=1<<(side*2);
            if(BackGestureIconPolicy.validAsset(setting.backgroundHash))result|=2<<(side*2);
        }
        return result;
    }

    public static BackGestureRuntimeObservation create(long revision,Function<String,String> values,
            long generation,int pid,int build,long elapsed,long processStarted,boolean committed,int loadedMask) {
        int required=requiredMask(values);
        String phase=!committed?"loading":!"1".equals(values.apply(BackGestureIconPolicy.ENABLED))?"disabled":
                (loadedMask&required)==required?"ready":"fallback";
        return new BackGestureRuntimeObservation(revision,signature(values),generation,pid,build,elapsed,
                processStarted,phase,committed?loadedMask:0,required);
    }

    public String serialize() {
        return "BG1;"+revision+';'+signature+';'+generation+';'+pid+';'+build+';'+elapsed+';'+processStarted+';'+phase+';'+loadedMask+';'+requiredMask;
    }

    public static BackGestureRuntimeObservation parse(String raw) {
        try {
            if(raw==null||raw.length()>512)return null;
            String[] fields=raw.split(";",-1);
            if(fields.length!=11||!"BG1".equals(fields[0])||!fields[2].matches("[0-9a-f]{64}"))return null;
            BackGestureRuntimeObservation result=new BackGestureRuntimeObservation(Long.parseLong(fields[1]),fields[2],
                    Long.parseLong(fields[3]),Integer.parseInt(fields[4]),Integer.parseInt(fields[5]),Long.parseLong(fields[6]),
                    Long.parseLong(fields[7]),fields[8],Integer.parseInt(fields[9]),Integer.parseInt(fields[10]));
            if(result.revision<1||result.generation<1||result.pid<1||result.build<1||result.processStarted<0
                    ||result.elapsed<result.processStarted||result.loadedMask<0||result.loadedMask>15
                    ||result.requiredMask<0||result.requiredMask>15)return null;
            if(!"ready".equals(result.phase)&&!"disabled".equals(result.phase)&&!"loading".equals(result.phase)&&!"fallback".equals(result.phase))return null;
            if("ready".equals(result.phase)&&(result.loadedMask&result.requiredMask)!=result.requiredMask)return null;
            if("disabled".equals(result.phase)&&(result.requiredMask!=0||result.loadedMask!=0))return null;
            if("loading".equals(result.phase)&&result.loadedMask!=0)return null;
            return result;
        }catch(RuntimeException invalid){return null;}
    }

    public boolean confirms(long expectedRevision,Function<String,String> values,int expectedBuild,int expectedPid,
            long expectedProcessStart,long notBefore,long now) {
        String expectedPhase="1".equals(values.apply(BackGestureIconPolicy.ENABLED))?"ready":"disabled";
        return revision==expectedRevision&&signature.equals(signature(values))&&build==expectedBuild
                &&(expectedPid==0||pid==expectedPid)&&(expectedProcessStart<0||processStarted==expectedProcessStart)
                &&elapsed>=notBefore&&elapsed<=now&&phase.equals(expectedPhase)
                &&requiredMask==requiredMask(values)&&(loadedMask&requiredMask)==requiredMask;
    }
}
