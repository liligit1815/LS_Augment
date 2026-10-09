package ls.augment.com;

import java.util.*;

/** A presentation of real eligible status-bar notifications, never a synthetic notification. */
public final class NotificationSummaryOptions {
    public static final String P="ls_augment_notification_summary_";
    public static final String ENABLED=P+"enabled",MODE=P+"mode",SYMBOL=P+"symbol",TEXT=P+"text",ASSET=P+"asset",SIZE=P+"size";
    private NotificationSummaryOptions(){}
    public static String shortText(String value){return value!=null&&value.codePointCount(0,value.length())<=12&&value.indexOf('\n')<0&&value.indexOf('\r')<0&&value.indexOf('\u0000')<0?value:null;}
    public static List<EnhancementOption> options(){return Arrays.asList(
        EnhancementOption.toggle(ENABLED,"statusbar","通知区域汇总","存在可显示的通知时，用一个符号、短文字或图片代替通知图标。保留所有原通知；无通知时消失，图片不可用时恢复原生图标。"),
        EnhancementOption.choice(MODE,"statusbar","汇总样式","只改变桌面与应用顶部状态栏的通知区域。",0,"符号","文字","图片"),
        EnhancementOption.custom(SYMBOL,"statusbar","符号","符号样式使用，最多12个字符。","♥",NotificationSummaryOptions::shortText),
        EnhancementOption.custom(TEXT,"statusbar","短文字","文字样式使用，最多12个字符；空间不足时省略。","有新通知",NotificationSummaryOptions::shortText),
        EnhancementOption.custom(ASSET,"statusbar","汇总图片","图片样式使用，支持 PNG、JPEG、WebP、GIF；按实际通知显隐，关闭时保留图片。","",v->v.isEmpty()||v.matches("[0-9a-f]{64}")?v:null),
        EnhancementOption.integer(SIZE,"statusbar","内容大小（dp）","同时受当前状态栏高度与可用宽度限制。",18,8,40)
    );}
}
