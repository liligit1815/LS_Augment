package ls.augment.com.step;

import java.util.*;
import java.util.regex.*;

/** Bounded, time-ordered display of LRC or plain text from a media session. */
public final class SongLines {
    private static final Pattern TIME=Pattern.compile("\\[(\\d{1,3}):(\\d{2})(?:[.:](\\d{1,3}))?\\]");
    private static final Pattern KRC=Pattern.compile("^\\[(\\d{1,10}),(\\d{1,8})\\](.+)$");
    private static final Pattern WORD=Pattern.compile("<\\d{1,8},\\d{1,8},\\d{1,4}>");
    private final TreeMap<Long,String> lines=new TreeMap<>();
    private String plain="";
    public SongLines(String text){
        if(text==null)return;
        text=text.substring(0,Math.min(text.length(),120000));
        long offset=0;Matcher tag=Pattern.compile("(?im)^\\[offset:([+-]?\\d{1,7})\\]").matcher(text);
        if(tag.find())offset=Long.parseLong(tag.group(1));
        for(String line:text.split("\\r?\\n",2048)){
            Matcher krc=KRC.matcher(line);
            if(krc.matches()){
                String words=WORD.matcher(krc.group(3)).replaceAll("").trim();
                if(!words.isEmpty())lines.merge(Math.max(0,Long.parseLong(krc.group(1))+offset),words,(a,b)->a.equals(b)?a:a+"\n"+b);
                continue;
            }
            Matcher m=TIME.matcher(line);List<Long> stamps=new ArrayList<>();int end=0;
            while(m.find() && m.start()==end && stamps.size()<8){
                end=m.end();int seconds=Integer.parseInt(m.group(2));if(seconds>59)continue;
                String decimal=m.group(3)==null?"":m.group(3);
                stamps.add(Math.max(0,(Long.parseLong(m.group(1))*60+seconds)*1000+Integer.parseInt((decimal+"000").substring(0,3))+offset));
            }
            if(stamps.isEmpty())continue;
            String words=line.substring(end).trim();if(words.isEmpty())continue;
            for(long at:stamps)lines.merge(at,words,(a,b)->a.equals(b)?a:a+"\n"+b);
        }
        if(lines.isEmpty() && !text.trim().startsWith("[") && !text.trim().startsWith("{"))plain=text.trim();
    }
    public boolean empty(){return lines.isEmpty() && plain.isEmpty();}
    public boolean timeline(){return lines.size()>1;}
    public static final class Display {
        public final String text;
        public final int currentStart,currentEnd;
        Display(String text,int start,int end){this.text=text;currentStart=start;currentEnd=end;}
    }
    public Display display(long ms,boolean previous){
        Map.Entry<Long,String> now=lines.floorEntry(ms);
        if(now==null)return new Display(lines.isEmpty()?plain:lines.firstEntry().getValue(),-1,-1);
        StringBuilder text=new StringBuilder();
        Map.Entry<Long,String> before=previous?lines.lowerEntry(now.getKey()):null;
        if(before!=null)text.append(before.getValue().split("\n",2)[0]).append('\n');
        int start=text.length();text.append(now.getValue());int end=text.length();
        Map.Entry<Long,String> next=lines.higherEntry(now.getKey());
        if(next!=null)text.append('\n').append(next.getValue().split("\n",2)[0]);
        return new Display(text.toString(),start,end);
    }
    public Map.Entry<Long,String> current(long ms){return lines.floorEntry(ms);}
    public List<Map.Entry<Long,String>> nearby(long ms){
        List<Map.Entry<Long,String>> rows=new ArrayList<>(3);
        Map.Entry<Long,String> now=current(ms);
        if(now!=null){Map.Entry<Long,String> prev=lines.lowerEntry(now.getKey());if(prev!=null)rows.add(prev);rows.add(now);}
        Map.Entry<Long,String> next=lines.higherEntry(ms);
        if(next!=null)rows.add(next);
        return rows;
    }
    public String context(long ms){
        Map.Entry<Long,String> now=lines.floorEntry(ms);
        if(now==null)return lines.isEmpty()?plain:lines.firstEntry().getValue();
        if(now.getValue().indexOf('\n')>=0)return now.getValue();
        Map.Entry<Long,String> next=lines.higherEntry(now.getKey());
        return next==null?now.getValue():now.getValue()+"\n"+next.getValue().split("\n",2)[0];
    }
    public String at(long ms){Map.Entry<Long,String> row=lines.floorEntry(ms);return row==null?plain:row.getValue();}
}
