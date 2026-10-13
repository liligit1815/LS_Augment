package ls.augment.com;

import java.util.HashMap;
import java.util.Map;

public final class TestRecentsCardRadiusUiRange {
    private static int checks;
    private static void check(boolean yes,String message){checks++;if(!yes)throw new AssertionError(message);}
    private static Map<String,Number> sample(){
        Map<String,Number> data=new HashMap<>();
        data.put("schema",2);data.put("launcherVersion",260029L);data.put("launcherLastUpdateTime",123456789L);
        data.put("densityDpi",520);data.put("displayWidthPx",1216);data.put("displayHeightPx",2688);data.put("rotation",0);
        data.put("minOffsetDp",-25);data.put("maxOffsetDp",76);data.put("nativeRadiusDp",24.2);data.put("maxRadiusDp",100.1);
        return data;
    }
    private static RecentsCardRadiusUiRange read(Map<String,Number> data){return RecentsCardRadiusUiRange.verified(data,260029L,123456789L,"firmware-a","firmware-a",520,1216,2688);}
    private static void reject(String key,Number number){Map<String,Number> data=sample();data.put(key,number);check(read(data)==null,"Reject invalid "+key+"="+number);}
    public static void main(String[] args){
        Map<String,Number> data=sample();RecentsCardRadiusUiRange range=read(data);
        check(range!=null&&range.minOffsetDp==-25&&range.maxOffsetDp==76,"Measured endpoints reach UI unchanged");
        int saved=100;check(range.clamp(saved)==76&&saved==100,"Out-of-range saved value is only projected to the thumb");
        check(range.clamp(-100)==-25&&range.clamp(0)==0&&range.clamp(24)==24,"Negative, factory and positive values retain their meaning");
        data.put("displayWidthPx",2688);data.put("displayHeightPx",1216);data.put("rotation",1);
        check(read(data)!=null,"Portrait settings accept the saved landscape overview sample");
        reject("schema",1);reject("schema",3);reject("launcherVersion",260030L);reject("launcherLastUpdateTime",123456790L);
        reject("densityDpi",480);reject("displayWidthPx",1080);reject("displayHeightPx",2700);reject("rotation",4);
        reject("rotation",-1);reject("minOffsetDp",-24);reject("maxOffsetDp",75);
        reject("minOffsetDp",0);reject("maxOffsetDp",-1);reject("nativeRadiusDp",-1);reject("nativeRadiusDp",Double.NaN);reject("maxRadiusDp",Double.POSITIVE_INFINITY);
        reject("densityDpi",520.5);reject("minOffsetDp",-25.5);
        data=sample();data.remove("maxOffsetDp");check(read(data)==null,"Missing data cannot enable editing");
        data=sample();data.put("nativeRadiusDp",24.000001);data.put("maxRadiusDp",100.000001);data.put("minOffsetDp",-24);
        check(read(data)!=null,"Float noise near integer OEM radius does not manufacture a dead step");
        check(RecentsCardRadiusUiRange.verified(sample(),260029L,123456789L,"firmware-a","firmware-b",520,1216,2688)==null,"Firmware update invalidates saved geometry");
        check(RecentsCardRadiusUiRange.verified(sample(),260029L,123456789L,"","",520,1216,2688)==null,"Unknown firmware cannot authenticate a saved range");
        check(RecentsCardRadiusUiRange.verified(sample(),260029L,0L,"firmware-a","firmware-a",520,1216,2688)==null,"Missing package update identity is invalid");
        check(RecentsCardRadiusUiRange.verified(null,260029L,123456789L,"firmware-a","firmware-a",520,1216,2688)==null,"Missing record stays missing");
        check(read(sample())!=null,"A durable record needs no process, boot, build or observation timestamp");
        data=sample();data.put("build",1);data.put("pid",-1);data.put("observedElapsed",Long.MIN_VALUE);
        check(read(data)!=null,"Historical transport metadata does not expire otherwise matching geometry");
        for(String key:new String[]{"schema","launcherVersion","launcherLastUpdateTime","densityDpi","displayWidthPx","displayHeightPx","rotation","nativeRadiusDp","maxRadiusDp","minOffsetDp","maxOffsetDp"}){
            data=sample();data.remove(key);check(read(data)==null,"Every geometry and package identity field is required: "+key);
        }
        reject("densityDpi",Long.MAX_VALUE);reject("displayWidthPx",Double.POSITIVE_INFINITY);reject("maxRadiusDp",0);
        data=sample();data.put("minOffsetDp",-2001);data.put("nativeRadiusDp",2001);data.put("maxRadiusDp",2100);data.put("maxOffsetDp",99);
        check(read(data)==null,"Transport bounds remain enforced for corrupted large radii");
        System.out.println("PASS TestRecentsCardRadiusUiRange: "+checks+" checks; persistent identity, geometry, orientation and saved-value projection");
    }
}
