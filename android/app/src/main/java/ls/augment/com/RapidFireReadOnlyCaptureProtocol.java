package ls.augment.com;

import java.util.*;

/** A completed, bounded read-only recording of identified shoulder sources. */
public final class RapidFireReadOnlyCaptureProtocol {
    private RapidFireReadOnlyCaptureProtocol() { }
    public static boolean isComplete(String output,List<RapidFireInputDetector.Device> devices) {
        if(output==null||devices==null||devices.isEmpty()||output.contains("LSA_READONLY_ERROR="))return false;
        Set<String> expected=new HashSet<>(),declared=new HashSet<>();
        for(RapidFireInputDetector.Device d:devices) {
            if(d==null||d.path==null||!d.path.matches("/dev/input/event[0-9]+")
                    ||!RapidFireInputDetector.isLikelyShoulderName(d.name))return false;
            expected.add(d.path);
        }
        boolean ready=false,end=false;
        for(String raw:output.split("\\r?\\n")) {
            String line=raw.trim();
            if(line.startsWith("LSA_READONLY_SOURCE=")) {
                String source=line.substring("LSA_READONLY_SOURCE=".length());
                if(ready||end||!expected.contains(source)||!declared.add(source))return false;
            } else if(line.equals("LSA_READONLY_READY=1")) {
                if(ready||end||!declared.equals(expected))return false;ready=true;
            } else if(line.startsWith("LSA_READONLY_END=")) {
                if(!ready||end||!line.equals("LSA_READONLY_END=window_elapsed"))return false;end=true;
            } else if(line.startsWith("/dev/input/")) {
                int colon=line.indexOf(':');
                if(!ready||end||colon<0||!expected.contains(line.substring(0,colon)))return false;
            }
        }
        return ready&&end;
    }
    public static RapidFireInputDetector.Capture observedPair(String output,List<RapidFireInputDetector.Device> devices) {
        return isComplete(output,devices)?RapidFireInputDetector.parseCapture(output,devices):null;
    }
}
