package ls.augment.com;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Set;

/** Necessary shoulder state records omit raw OEM payloads and private field values. */
public final class ShoulderSwitchLogPolicy {
    public static final String FEATURE="SHOULDER_SWITCH",FILE="detail-SHOULDER_SWITCH.log";
    private static final int MAX_MESSAGE_CHARS=1500;
    private static final Pattern PRIVATE_FIELD=Pattern.compile(
            "(?i)(?:^|[\\s;|,{?&])['\"]?((?:[a-z0-9]+_)*(?:token|account|password|passwd|secret|authorization|credential|test_session|sha256|data|payload|settingsdata|content|schemename|macroname|casename|tgkcasename)(?:_[a-z0-9]+)*)['\"]?\\s*[:=]\\s*");
    private static final Pattern OEM_ERROR=Pattern.compile(
            "(?:^|\\s)(?:[EF]\\s+(?:InputManagerProxy|TgkHelper)|[WEF]\\s+TgkService)\\s*:");
    private static final Pattern MODULE_ERROR=Pattern.compile(
            "(?:^|\\s)[WEF]\\s+(?:LS_Augment_TGK|LS_AugmentNative)\\s*:");
    private static final Pattern FIELD=Pattern.compile("(?:^|[\\s;|])([A-Za-z][A-Za-z0-9_]*)=([^\\s;|]+)");
    private static final Set<String> FIELDS=Set.of("tx","stage","pkg","table","caseId","previousCaseId",
            "keyCode","mode","pointHash","expectedHash","observedHash","status","reason","errorClass",
            "route","calls","registered","version","pid","elapsed","index","count","seq","wall","thread");
    private ShoulderSwitchLogPolicy(){}
    public static boolean level(String level){
        return "INFO".equals(level)||"WARN".equals(level)||"ERROR".equals(level);
    }
    public static boolean runtime(String feature,String level){
        return (FEATURE.equals(feature)||"LIFTARC".equals(feature))&&level(level);
    }
    public static boolean necessaryLine(String line){
        if(line==null)return false;
        return line.matches(".*\\bSHOULDER_SWITCH (?:INFO|WARN|ERROR) .*")
                ||OEM_ERROR.matcher(line).find()||MODULE_ERROR.matcher(line).find();
    }
    public static String safeSwitch(String value){
        String input=safe(value);StringBuilder fields=new StringBuilder();
        Matcher matcher=FIELD.matcher(input);
        while(matcher.find()){
            String key=matcher.group(1),field=matcher.group(2);
            if(!FIELDS.contains(key)||!field.matches("[A-Za-z0-9_.$:/,+-]{1,256}"))continue;
            if(fields.length()>0)fields.append(' ');
            fields.append(key).append('=').append(field);
        }
        // Callers use identifiers/status codes, never scheme names or free text.
        if(fields.length()>0&&input.endsWith(" [TRUNCATED]"))fields.append(" [TRUNCATED]");
        return fields.toString();
    }
    public static String safe(String value){
        String text=(value==null?"":value).replace('\r',' ').replace('\n',' ');
        Matcher privateField=PRIVATE_FIELD.matcher(text);
        // An opaque payload may contain delimiters or encoded private fields.
        // Retain only the preceding diagnostic state, never parse/print its tail.
        if(privateField.find())text=text.substring(0,privateField.start(1))+"[REDACTED_FIELDS]";
        if(text.length()>MAX_MESSAGE_CHARS){
            int end=MAX_MESSAGE_CHARS;
            if(Character.isHighSurrogate(text.charAt(end-1)))end--;
            text=text.substring(0,end)+" [TRUNCATED]";
        }
        return text;
    }
}
