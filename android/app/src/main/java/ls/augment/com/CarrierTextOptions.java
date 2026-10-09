package ls.augment.com;

import java.text.SimpleDateFormat;
import java.util.*;

public final class CarrierTextOptions {
    public static final String P="ls_augment_carrier_";
    public static final String[] PANELS={"notification","control","lock"};
    public static String key(String panel,String suffix){return P+panel+"_"+suffix;}
    public static List<EnhancementOption> options(){List<EnhancementOption> out=new ArrayList<>();String[] names={"通知页","控制中心","锁屏"};
        for(int i=0;i<PANELS.length;i++){String p=PANELS[i],g="lock".equals(p)?"lockscreen":"quicksettings";
            out.add(EnhancementOption.toggle(key(p,"enabled"),g,names[i]+"运营商文字","仅修改此位置的文字；保留原生布局与点击行为，过长时省略。关闭恢复最新系统运营商信息。"));
            out.add(EnhancementOption.choice(key(p,"mode"),g,"显示内容","此位置独立设置。",1,"系统运营商","自定义文字","自定义时间"));
            out.add(EnhancementOption.text(key(p,"text"),g,"自定义文字","支持中文、英文和符号，按单行显示；换行视为空格。","红魔Duo",120));
            out.add(EnhancementOption.custom(key(p,"pattern"),g,"时间格式","例如 HH:mm、MM-dd EEEE；显示时跟随时间和时区更新，包含秒时每秒刷新。","HH:mm",v->{if(v.length()>80||v.trim().isEmpty())return null;try{new SimpleDateFormat(v,Locale.getDefault());return v;}catch(IllegalArgumentException e){return null;}}));
            out.add(EnhancementOption.integer(key(p,"size"),g,"字号（sp）","lock".equals(p)
                    ?"0 跟随系统。使用此处独立字号，长文字在时钟和图标之外的可用宽度内省略。高度或最少文字空间不足时暂用系统排布；可增加状态栏高度或调整字号。"
                    :"0 跟随系统，较长文字自动省略以保留相邻控件。",0,0,40));
        }return Collections.unmodifiableList(out);
    }
}
