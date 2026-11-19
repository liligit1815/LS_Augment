package ls.augment.com;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.regex.Pattern;

/** Keeps source fields separate: a notification subtitle is not necessarily its main metric. */
public final class IslandNotificationContent {
    private static final Pattern RATE=Pattern.compile("(?i)\\d+(?:[.,]\\d+)?\\s*(?:[kmgt]?i?b|bytes?)\\s*/\\s*(?:s|秒)(?:\\b|$)");
    public final String title,text,subtext,bigtext,info;
    public final List<String> lines;
    public final boolean proxyRates;

    public IslandNotificationContent(String pkg,String channel,CharSequence title,CharSequence text,
            CharSequence subtext,CharSequence bigtext,CharSequence info,CharSequence[] lines){
        this.title=clean(title);this.text=clean(text);this.subtext=clean(subtext);
        this.bigtext=clean(bigtext);this.info=clean(info);
        ArrayList<String> values=new ArrayList<>();
        if(lines!=null)for(CharSequence line:lines){String value=clean(line);if(!value.isEmpty())values.add(value);if(values.size()==32)break;}
        this.lines=List.copyOf(values);
        // This is the upstream Clash/Meta dynamic-notification contract, not whole-device traffic.
        // Unknown packages and static/malformed payloads keep their original words without metric labels.
        boolean clash="com.github.kr328.clash".equals(pkg)||"com.github.metacubex.clash".equals(pkg)
                ||"com.github.metacubex.clash.meta".equals(pkg)||"com.github.metacubex.clash.alpha".equals(pkg);
        java.util.regex.Matcher rates=RATE.matcher(this.text);
        proxyRates=clash&&"clash_status_channel".equals(channel)&&rates.find()&&rates.find();
    }
    public boolean hasContent(){return !title.isEmpty()||!text.isEmpty()||!subtext.isEmpty()
            ||!bigtext.isEmpty()||!info.isEmpty()||!lines.isEmpty();}
    public String compact(){
        // Keep live rates ahead of cumulative subtext. No synthetic speed when only status is supplied.
        if(!text.isEmpty())return text;
        if(!bigtext.isEmpty())return bigtext;
        if(!lines.isEmpty())return lines.get(lines.size()-1);
        if(!subtext.isEmpty())return subtext;
        if(!info.isEmpty())return info;
        return title;
    }
    public String detail(){return detail(true);}
    public String detail(boolean includeRate){
        LinkedHashSet<String> values=new LinkedHashSet<>();
        if(!text.isEmpty()&&(includeRate||!proxyRates))values.add((proxyRates?"实时速率：":"")+text);
        if(!bigtext.isEmpty()&&!bigtext.equals(text))values.add(bigtext);
        for(String line:lines)if(!line.equals(text)&&!line.equals(bigtext))values.add(line);
        if(!subtext.isEmpty()&&!subtext.equals(text)&&!subtext.equals(bigtext))
            values.add((proxyRates&&!RATE.matcher(subtext).find()?"累计流量：":"")+subtext);
        if(!info.isEmpty()&&!info.equals(text)&&!info.equals(subtext)&&!info.equals(bigtext))values.add(info);
        return String.join("\n",values);
    }
    public List<Object> identity(){return Arrays.asList(title,text,subtext,bigtext,info,lines,proxyRates);}
    private static String clean(CharSequence value){
        if(value==null)return "";String text=value.toString().trim();
        // Bound untrusted payloads without retaining Android spans or source-process objects.
        if(text.length()<=16384)return text;
        int end=Character.isHighSurrogate(text.charAt(16383))?16383:16384;
        return text.substring(0,end)+"…";
    }
}
