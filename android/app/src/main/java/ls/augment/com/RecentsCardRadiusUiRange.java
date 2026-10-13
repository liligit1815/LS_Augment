package ls.augment.com;

import java.util.Map;

/** Validates saved geometry independently of process lifetime and observation age. */
final class RecentsCardRadiusUiRange {
    final int minOffsetDp, maxOffsetDp;
    private RecentsCardRadiusUiRange(int min,int max){minOffsetDp=min;maxOffsetDp=max;}
    int clamp(int saved){return Math.max(minOffsetDp,Math.min(maxOffsetDp,saved));}

    static RecentsCardRadiusUiRange verified(Map<String,Number> data,long launcherVersion,
            long launcherLastUpdateTime,String recordedFirmware,String firmware,
            int densityDpi,int width,int height){
        if(data==null||launcherVersion<=0||launcherLastUpdateTime<=0||densityDpi<=0||width<=0||height<=0
                ||firmware==null||firmware.isEmpty()||!firmware.equals(recordedFirmware)
                ||integer(data,"launcherVersion")!=launcherVersion
                ||integer(data,"launcherLastUpdateTime")!=launcherLastUpdateTime
                ||integer(data,"densityDpi")!=densityDpi)return null;
        long observedWidth=integer(data,"displayWidthPx"),observedHeight=integer(data,"displayHeightPx");
        // The settings Activity is portrait-locked; a landscape overview sample is still valid.
        if(Math.min(observedWidth,observedHeight)!=Math.min(width,height)
                ||Math.max(observedWidth,observedHeight)!=Math.max(width,height))return null;
        return geometry(data);
    }

    static RecentsCardRadiusUiRange geometry(Map<String,Number> data){
        if(data==null||integer(data,"schema")!=2)return null;
        long rotation=integer(data,"rotation"),density=integer(data,"densityDpi");
        long width=integer(data,"displayWidthPx"),height=integer(data,"displayHeightPx");
        if(rotation<0||rotation>3||density<=0||density>Integer.MAX_VALUE
                ||width<=0||width>Integer.MAX_VALUE||height<=0||height>Integer.MAX_VALUE)return null;
        long min=integer(data,"minOffsetDp"),max=integer(data,"maxOffsetDp");
        double nativeDp=decimal(data,"nativeRadiusDp"),maximumDp=decimal(data,"maxRadiusDp");
        if(min>0||max<0||min>=max||min<RecentsCardRadiusOptions.MIN||max>RecentsCardRadiusOptions.MAX
                ||!Double.isFinite(nativeDp)||!Double.isFinite(maximumDp)||nativeDp<0||maximumDp<=0
                ||nativeDp>maximumDp+.0001d||min!=(long)Math.floor(-nativeDp+.0001d)
                ||max!=(long)Math.ceil(maximumDp-nativeDp-.0001d))return null;
        return new RecentsCardRadiusUiRange((int)min,(int)max);
    }

    static long integer(Map<String,Number> data,String key){
        Number value=data.get(key);if(value==null)return Long.MIN_VALUE;
        if(value instanceof Integer||value instanceof Long||value instanceof Short||value instanceof Byte)return value.longValue();
        double n=value.doubleValue();return Double.isFinite(n)&&n==Math.rint(n)&&n>Long.MIN_VALUE&&n<Long.MAX_VALUE?(long)n:Long.MIN_VALUE;
    }
    static double decimal(Map<String,Number> data,String key){Number value=data.get(key);return value==null?Double.NaN:value.doubleValue();}
}
