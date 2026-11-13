package ls.augment.com.hook;

import android.app.Notification;
import android.os.Parcelable;
import android.text.TextUtils;
import android.widget.TextView;
import java.util.List;
import java.util.regex.Pattern;

/** Formats only the space the OEM host actually allocated to the supplemental label. */
final class DuoCompactText {
    private static final Pattern FILE = Pattern.compile(".+\\.[\\p{L}\\d]{1,10}$");
    private static final Pattern STATUS = Pattern.compile("(?i)(?:正在下载|下载中|下载|downloading|download|\\d{1,3}\\s*%)");
    private final TextView label;
    private String summary="", metric="";

    DuoCompactText(TextView label) {
        this.label=label;
        label.setSingleLine(true);
        label.setEllipsize(TextUtils.TruncateAt.MARQUEE);
        label.setMarqueeRepeatLimit(-1);
        label.setSelected(true);
        label.addOnLayoutChangeListener((v,l,t,r,b,ol,ot,or,ob)->{if(r-l!=or-ol)render();});
    }
    void bind(String summary,String metric) {
        this.summary=summary;this.metric=metric;
        render();
    }
    float naturalWidth() { return label.getPaint().measureText(summary+(metric.isEmpty()?"":"  "+metric)); }
    private void render() {
        String text=summary;
        if(!metric.isEmpty()){
            text=metric;
            String gap="  ";
            float room=label.getWidth()-label.getCompoundPaddingLeft()-label.getCompoundPaddingRight()
                    -label.getPaint().measureText(gap+metric);
            if(!summary.isEmpty()&&room>=label.getPaint().measureText("文件…")){
                text=TextUtils.ellipsize(summary,label.getPaint(),room,TextUtils.TruncateAt.END)+gap+metric;
            }
        }
        if(!TextUtils.equals(label.getText(),text))label.setText(text);
    }
    static String fileName(Notification n) {
        String title=line(n.extras.getCharSequence(Notification.EXTRA_TITLE));
        String detail=line(n.extras.getCharSequence(Notification.EXTRA_TEXT));
        if(FILE.matcher(detail).matches()&&!FILE.matcher(title).matches())return detail;
        return STATUS.matcher(title).matches()?"":title;
    }
    @SuppressWarnings("deprecation")
    static String senderOrTitle(Notification n,String app) {
        try {
            Parcelable[] raw=n.extras.getParcelableArray(Notification.EXTRA_MESSAGES);
            if(raw!=null){
                List<Notification.MessagingStyle.Message> messages=Notification.MessagingStyle.Message.getMessagesFromBundleArray(raw);
                if(!messages.isEmpty()){
                    android.app.Person sender=messages.get(messages.size()-1).getSenderPerson();
                    String name=sender==null?"":line(sender.getName());
                    if(!name.isEmpty())return name;
                }
            }
        } catch(RuntimeException malformed){ /* Partial messaging extras may still have a normal title. */ }
        String title=line(n.extras.getCharSequence(Notification.EXTRA_TITLE));
        return title.isEmpty()?app:title;
    }
    static String messageSummary(Notification n,String app) {
        String sender=senderOrTitle(n,app),body="";
        try {
            Parcelable[] raw=n.extras.getParcelableArray(Notification.EXTRA_MESSAGES);
            if(raw!=null){
                List<Notification.MessagingStyle.Message> messages=Notification.MessagingStyle.Message.getMessagesFromBundleArray(raw);
                if(!messages.isEmpty())body=line(messages.get(messages.size()-1).getText());
            }
        }catch(RuntimeException malformed){/* Use the notification's normal text below. */}
        if(body.isEmpty())body=line(n.extras.getCharSequence(Notification.EXTRA_BIG_TEXT));
        if(body.isEmpty())body=line(n.extras.getCharSequence(Notification.EXTRA_TEXT));
        return body.isEmpty()||body.equals(sender)?sender:sender+"  ·  "+body;
    }
    private static String line(CharSequence text) {
        if(text==null)return "";
        String value=text.toString().replace('\n',' ').replace('\r',' ').trim();
        if(value.length()<=4096)return value;
        int end=Character.isHighSurrogate(value.charAt(4095))?4095:4096;
        return value.substring(0,end);
    }
}
