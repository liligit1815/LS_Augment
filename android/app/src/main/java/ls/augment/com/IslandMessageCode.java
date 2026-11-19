package ls.augment.com;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** The label must distinguish collection, meal and authentication codes in the actual message. */
public final class IslandMessageCode {
    private static final Pattern PICKUP=Pattern.compile("(取件码|取件碼|取餐码|取餐碼)\\s*(?:是|为|為|[:：])?\\s*([A-Za-z0-9]{1,8}(?:-[A-Za-z0-9]{1,6}){0,2})(?![A-Za-z0-9-])");
    public final String kind,value;
    private IslandMessageCode(String k,String v){kind=k;value=v;}
    public static IslandMessageCode read(boolean sms,String text){
        if(text==null||text.length()>8192)return null;
        String auth=SmsVerificationCode.extract(text),label=null,code=null;
        Matcher m=PICKUP.matcher(text);
        while(m.find()){
            String candidate=m.group(2),type=m.group(1).startsWith("取件")?"取件码":"取餐码";
            if(auth!=null||candidate.length()<2||!candidate.matches(".*[0-9].*")||code!=null&&(!code.equals(candidate)||!type.equals(label)))return null;
            code=candidate;label=type;
        }
        if(code!=null)return new IslandMessageCode(label,code);
        return sms&&auth!=null?new IslandMessageCode("验证码",auth):null;
    }
    public static long deadline(long posted,long message,long previous,long now){
        if(posted<=0||posted>now)return 0;
        long receipt=message>0?Math.min(posted,message):posted;
        if(previous>0)receipt=Math.min(previous,receipt);
        return receipt>Long.MAX_VALUE-300000?Long.MAX_VALUE:receipt+300000;
    }
    private IslandMessageCode(){throw new AssertionError();}
}
