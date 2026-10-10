package ls.augment.com;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** LiftArc 1.0.22 lock-screen configuration; the outer feature starts disabled. */
public final class LiftArcOptions {
    public static final String PREFIX="ls_augment_liftarc_";
    public static final String ENABLED=PREFIX+"enabled";
    public static final String STATUS=PREFIX+"status";
    private static final List<EnhancementOption> OPTIONS=create();
    private LiftArcOptions() { }
    public static String key(String suffix){return PREFIX+suffix;}
    public static List<EnhancementOption> options(){return OPTIONS;}
    public static EnhancementOption option(String suffix){for(EnhancementOption o:OPTIONS)if(o.key.equals(key(suffix)))return o;throw new IllegalArgumentException(suffix);}
    public static String[] parameterKeys(){return OPTIONS.stream().filter(o->!ENABLED.equals(o.key)).map(o->o.key).toArray(String[]::new);}
    public static String[] glassParameterKeys(){return OPTIONS.stream().filter(o->o.key.startsWith(PREFIX+"glass_")&&!o.key.equals(key("glass_live"))).map(o->o.key).toArray(String[]::new);}
    private static EnhancementOption toggle(String suffix,String title,String help,boolean initial){return EnhancementOption.toggle(key(suffix),"liftarc",title,help,initial);}
    private static EnhancementOption number(String suffix,String title,String help,double initial,double min,double max){return EnhancementOption.decimal(key(suffix),"liftarc",title,help,initial,min,max);}
    private static EnhancementOption integer(String suffix,String title,String help,int initial,int min,int max){return EnhancementOption.integer(key(suffix),"liftarc",title,help,initial,min,max);}
    private static List<EnhancementOption> create(){
        ArrayList<EnhancementOption> list=new ArrayList<>();
        list.add(toggle("enabled","锁屏上滑效果","使用底部指示条上滑，调整锁屏内容联动、弧形与壁纸效果。解锁仍交给系统验证；关闭后还原本功能持有的视图属性并保留参数。",false));
        list.add(toggle("show_handle","显示指示条","控制底部指示条外观。关闭只使指示条透明，不关闭底部触控区域，也不隐藏独立设置的提示文字。",true));
        list.add(number("handle_alpha","指示条不透明度","设置指示条不透明度，1为完全不透明。",1,.1,1));
        list.add(toggle("handle_wide","全宽触控","将底部36dp高的指示条触控带扩展到屏幕全宽；通知、快捷入口和面板交互仍让路。",false));
        list.add(toggle("haptic","触感反馈","开始拖动及跨越进度档位时使用手机振动反馈。",true));
        list.add(toggle("parallax","锁屏内容联动","上滑时移动已识别的锁屏内容。关闭只停止内容位移，保留底部手势、回弹和快速上甩解锁。",true));
        list.add(number("drag_ratio","跟手程度","100%为1:1跟手；降低数值会缩短所需上滑行程，同样拖动达到的进度更大。",.85,.3,1));
        list.add(toggle("release_return","松手回弹","未达到解锁条件时，松手将进度与本功能修改的内容位置归零。",true));
        list.add(toggle("flick_unlock","快速上甩解锁","向上快速甩动超过速度阈值时触发系统解锁流程；有安全锁时仍显示系统验证界面。",true));
        list.add(number("flick_velocity","触发速度（dp/s）","快速上甩解锁的向上速度阈值，单位dp/s。",1200,300,3000));
        list.add(number("unlock_ms","解锁动画时长（ms）","设置上滑解锁过渡时长，单位毫秒。",340,150,800));
        list.add(toggle("intercept_swipe","接管原厂上滑","接管已识别锁屏空白和时钟区域的上滑，通知行、展开的控制中心和底部快捷入口继续使用原厂交互。",false));
        list.add(toggle("arc_enabled","弧形效果","随拖动进度显示弧形裁切与边界；边界样式、位置与明暗由共用效果参数控制。",true));
        list.add(toggle("arc_dim","使用压暗边界","共用边界样式：开启为压暗，关闭为描边；弧形和玻璃按各自启用状态使用此设置。",true));
        list.add(toggle("dim_upper","效果位于弧线上方","控制压暗和背景模糊使用弧线上方或下方。",false));
        list.add(number("dim_strength","压暗强度","设置弧形与玻璃压暗效果强度，使用压暗边界时生效。",.57,.05,1));
        list.add(number("arc_width","描边宽度（dp）","设置普通弧形描边宽度，单位dp；使用描边边界时生效。",3,1,10));
        list.add(number("arc_alpha","描边不透明度","设置普通弧形描边不透明度；使用描边边界时生效。",1,.1,1));
        list.add(EnhancementOption.color(key("arc_color"),"liftarc","描边颜色","设置普通弧形描边颜色；8位HEX依次为透明度、红、绿、蓝。","#FFFFFFFF"));
        list.add(toggle("blur_enabled","上滑背景模糊","对缓存的静态锁屏壁纸进行分区模糊，随手势增加强度。动态壁纸画面不作为实时采样来源。",false));
        list.add(number("blur_strength","背景模糊强度","设置上滑背景模糊最大强度；与玻璃带模糊分别控制。",.70,.01,1));
        list.add(toggle("glass_live","锁屏玻璃","使用静态锁屏壁纸缓存和手机着色器，随手势绘制折射与高光；不进行跨窗口或动态视频实时采样。",false));
        list.add(number("glass_thick","玻璃厚度（dp）","设置弧线附近玻璃带厚度，单位dp。",20,1,40));
        list.add(number("glass_opacity","玻璃不透明度","设置玻璃带整体不透明度。",.96,.2,1));
        list.add(number("glass_diffuse","漫反射","设置玻璃带漫反射与扩散比例。",.05,0,1));
        list.add(number("glass_blur","玻璃带模糊（px）","设置玻璃带内部模糊半径，单位为物理像素px。",1,0,20));
        list.add(number("glass_refract","折射强度","设置壁纸在玻璃带内的折射位移强度。",.85,0,.90));
        list.add(number("glass_edge_ref","边缘折射","设置玻璃带边缘的附加折射强度。",.40,0,.50));
        list.add(number("glass_refract_w","折射范围","设置折射在玻璃带中的覆盖范围。",.45,0,1));
        list.add(number("glass_fresnel","菲涅尔","设置玻璃边缘的菲涅尔反射比例。",.22,0,1));
        list.add(number("glass_highlight","边缘高光","设置玻璃边缘高光强度。",.46,0,1));
        list.add(number("glass_hl_width","高光宽度（倍）","设置边缘高光宽度倍率。",.85,.30,1.50));
        list.add(EnhancementOption.text(key("hint_text"),"liftarc","提示文字内容","显示在指示条附近的文字。留空隐藏文字，保留字体与位置配置。","",65536));
        list.add(number("hint_size","字号（sp）","设置提示文字字号，单位sp并遵循系统字体缩放。",12,6,40));
        list.add(integer("hint_weight","字重","提示文字字重按100分档使用；100最细，900最粗。",400,100,900));
        list.add(EnhancementOption.choice(key("hint_font"),"liftarc","字体族","选择手机系统字体族；不导入独立字体文件。",0,"系统默认","衬线","等宽","手写","窄体"));
        list.add(EnhancementOption.color(key("hint_color"),"liftarc","文字颜色","设置提示文字颜色；透明度与RGB一起保存。","#D9FFFFFF"));
        list.add(number("hint_gap","与指示条距离（dp）","设置提示文字到指示条的竖直距离，单位dp。",10,0,96));
        list.add(number("hint_offset_x","水平偏移（dp）","设置提示文字相对居中的水平偏移，负值向左，正值向右。",0,-120,120));
        if(list.size()!=39)throw new IllegalStateException("LiftArc settings must total 39");
        return Collections.unmodifiableList(list);
    }
}
