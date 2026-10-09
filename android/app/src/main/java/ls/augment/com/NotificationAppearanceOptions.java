package ls.augment.com;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Parameters for the device's existing notification shade views and native row states. */
public final class NotificationAppearanceOptions {
    public static final String PREFIX = "ls_augment_rm_notification_";
    public static final String CLOCK_PORTRAIT = PREFIX + "clock_portrait_enabled";
    public static final String CLOCK_LANDSCAPE = PREFIX + "clock_landscape_enabled";
    public static final String CLEAR = PREFIX + "clear_appearance_enabled";
    public static final String STACK_COUNT = PREFIX + "stack_complete_count";
    public static final String STACK_STEP = PREFIX + "stack_step";
    public static final String STACK_INSET = PREFIX + "stack_inset";
    public static final String STACK_LANDSCAPE = PREFIX + "stack_landscape";
    public static final String CLEAR_ALIGN = PREFIX + "clear_align";
    public static final String CLEAR_X = PREFIX + "clear_x";
    public static final String CLEAR_Y = PREFIX + "clear_y";
    public static final String CLEAR_LIGHT = PREFIX + "clear_color_light";
    public static final String CLEAR_DARK = PREFIX + "clear_color_dark";
    public static final String CLEAR_TRAVEL = PREFIX + "clear_entry_travel";
    public static final String CLEAR_DURATION = PREFIX + "clear_entry_duration";
    private NotificationAppearanceOptions() { }
    public static String clock(boolean landscape, String suffix) {
        return PREFIX + "clock_" + (landscape ? "landscape_" : "portrait_") + suffix;
    }
    public static List<EnhancementOption> options() {
        List<EnhancementOption> result = new ArrayList<>();
        for (boolean landscape : new boolean[]{false, true}) {
            String group = "notification_clock", name = landscape ? "横屏" : "竖屏";
            result.add(EnhancementOption.toggle(clock(landscape,"enabled"),group,name+"通知页大时钟",
                    "使用原生时钟与日期，随通知列表上滑收起；保留点击、系统时间更新及原有天气。锁屏和控制中心使用原厂布局。"));
            result.add(EnhancementOption.integer(clock(landscape,"size"),group,name+"展开字号（sp）","通知列表位于顶部时使用的时钟字号，随系统字体缩放。保持所选字号；秒与时段可换行。若当前页面无法完整容纳时分、日期和通知区域，临时使用原厂布局，可减小字号或偏移。",landscape?44:64,24,100));
            result.add(EnhancementOption.integer(clock(landscape,"compact_size"),group,name+"收起字号（sp）","不超过该方向的展开字号。",24,16,48));
            result.add(EnhancementOption.integer(clock(landscape,"collapse_distance"),group,name+"收起滚动距离（dp）","通知列表上滑达到此距离时完成收起。",120,40,300));
            result.add(EnhancementOption.choice(clock(landscape,"align"),group,name+"时钟与日期对齐","时钟和日期使用同一对齐方式，保留两侧留白。",0,"靠左","居中","靠右"));
            result.add(EnhancementOption.integer(clock(landscape,"x"),group,name+"水平偏移（dp）","在所选对齐位置上向左或向右移动，实际位置受页面边界限制。",0,-120,120));
            result.add(EnhancementOption.integer(clock(landscape,"y"),group,name+"顶部偏移（dp）","从系统状态图标下方开始，避免覆盖隐私指示与电量。",0,0,100));
            result.add(EnhancementOption.integer(clock(landscape,"date_size"),group,name+"日期字号（sp）","设置时钟下方原生日期的字号，日期内容与点击操作保持原厂行为。",14,10,24));
            result.add(EnhancementOption.integer(clock(landscape,"date_gap"),group,name+"日期间距（dp）","设置时钟下边缘与日期上边缘之间的距离。",6,0,24));
            result.add(EnhancementOption.integer(clock(landscape,"list_gap"),group,name+"时钟到通知间距（dp）","为原生通知列表保留空间。",16,4,64));
        }
        result.add(EnhancementOption.integer(STACK_COUNT,"notification_stack","完整显示条数","以屏幕可用空间为上限；其余通知在底部依次堆叠，上滑可逐条查看。手动展开通知时优先完整显示内容，收起后恢复堆叠。",2,1,6));
        result.add(EnhancementOption.integer(STACK_STEP,"notification_stack","堆叠层间距（dp）","最多显示三层，继续上滑可查看后续通知。",8,4,20));
        result.add(EnhancementOption.integer(STACK_INSET,"notification_stack","每层两侧缩进（dp）","下层通知逐层向内缩进；上滑到完整显示位置后恢复原来的宽度。",6,0,16));
        result.add(EnhancementOption.toggle(STACK_LANDSCAPE,"notification_stack","横屏使用列表堆叠","关闭时横屏仍使用原厂列表。"));
        result.add(EnhancementOption.toggle(CLEAR,"notification_clear","通知清除按钮样式","调整原生清除按钮，保留清除范围、长按、无障碍及可见性规则。"));
        result.add(EnhancementOption.choice(CLEAR_ALIGN,"notification_clear","水平位置","避让原生通知管理按钮；原有位置不调整系统对齐。",0,"原有位置","靠左","居中","靠右"));
        result.add(EnhancementOption.integer(CLEAR_X,"notification_clear","水平偏移（dp）","自动限制在原按钮父容器内。",0,-120,120));
        result.add(EnhancementOption.integer(CLEAR_Y,"notification_clear","垂直偏移（dp）","自动限制在原页脚的触摸区域内。",0,-24,24));
        result.add(EnhancementOption.color(CLEAR_LIGHT,"notification_clear","浅色模式底色","保留原生按压反馈与按钮文字。","#E3E3E8"));
        result.add(EnhancementOption.color(CLEAR_DARK,"notification_clear","深色模式底色","系统使用深色主题时应用的清除按钮底色，关闭功能后恢复原厂。","#44444C"));
        result.add(EnhancementOption.integer(CLEAR_TRAVEL,"notification_clear","入场移动距离（dp）","仅在原生按钮由隐藏变为显示时播放；0 为不移动。",12,0,40));
        result.add(EnhancementOption.integer(CLEAR_DURATION,"notification_clear","入场时长（毫秒）","跟随系统关闭动画的设置；0 为不播放。",220,0,600));
        return Collections.unmodifiableList(result);
    }
}
