package ls.augment.com;

import java.util.*;

/** Search the same presentation routes that own the controls; never clone a setting. */
final class ModuleFeatureSearch {
    static final class Result {
        final String title, path, route, keywords;
        Result(String title,String route,String keywords){
            this.title=title;this.route=ModuleHierarchy.resolve(route);
            List<String> labels=new ArrayList<>();
            for(String node:ModuleHierarchy.path(this.route))if(!"home".equals(node))labels.add(ModuleHierarchy.title(node));
            this.path=String.join(" / ",labels);this.keywords=normalize(title+" "+path+" "+keywords);
        }
    }
    private ModuleFeatureSearch(){}
    static List<Result> search(String query,boolean unlocked){
        String needle=normalize(query);if(needle.isEmpty())return Collections.emptyList();
        Map<String,Result> results=new LinkedHashMap<>();
        Map<String,EnhancementOption> options=new HashMap<>();
        for(EnhancementOption option:EnhancementCatalog.options())options.put(option.key,option);
        for(ModulePresentationCatalog.Category category:ModulePresentationCatalog.categories())
            add(results,needle,unlocked,new Result(category.title,"target-"+category.id,unlocked?category.summary:category.summary.replace("与应用隐藏","").replace("应用隐藏","")));
        for(ModuleHierarchy.Section section:ModuleHierarchy.allSections()){
            if(section.restricted&&!unlocked)continue;
            String sectionAliases="liftarc".equals(section.id)?" LiftArc 小白条 指示条 上甩解锁 弧形 锁屏玻璃 提示文字":"";
            add(results,needle,unlocked,new Result(section.title,section.route(),ModuleHierarchy.summary(section)+sectionAliases));
            for(NativeFeatureGroups.Feature feature:section.features)feature(results,needle,unlocked,feature,section.route(),options);
            for(String entry:section.entries){
                String title=ModuleHierarchy.title(entry);
                if(!title.isEmpty())add(results,needle,unlocked,new Result(title,entry,entryAliases(entry)));
            }
            for(String key:section.deviceSettings){
                String title="development_settings_enabled".equals(key)?"开发者选项":"adb_enabled".equals(key)?"USB 调试":"adb_install_enabled".equals(key)?"USB 安装":"锁定刷新率（原厂开关）";
                String aliases=key.startsWith("adb_")?"USB 连接 调试 安装 ":"development_settings_enabled".equals(key)?"开发者选项 系统设置 ":"屏幕 显示 刷新率 ";
                add(results,needle,unlocked,new Result(title,section.route(),aliases+key));
            }
        }
        // The status editor owns its related native controls outside generic sections.
        for(NativeFeatureGroups.Feature feature:NativeFeatureGroups.forGroup("statusbar")){
            String key=feature.toggleKey!=null?feature.toggleKey:feature.parameterKeys[0];
            String route=ModuleHierarchy.featureRoute(key);
            if(route!=null)feature(results,needle,unlocked,feature,route,options);
        }
        for(String route:StatusBarPages.ROUTES)add(results,needle,unlocked,new Result(ModuleHierarchy.title(route),route,entryAliases(route)));
        // Parameters remain searchable without adding their own settings page.
        for(EnhancementOption option:options.values()){
            if(option.kind==EnhancementOption.Kind.INTERNAL||option.title.isEmpty())continue;
            String route=ModuleHierarchy.featureRoute(option.key);
            if(route!=null)add(results,needle,unlocked,new Result(option.title,route,option.summary));
        }
        List<Result> list=new ArrayList<>(results.values());
        list.sort(Comparator.comparingInt(r->normalize(r.title).equals(needle)?0:normalize(r.title).contains(needle)?1:2));
        return list;
    }
    private static void feature(Map<String,Result> out,String query,boolean unlocked,NativeFeatureGroups.Feature f,String fallback,Map<String,EnhancementOption> options){
        StringBuilder copy=new StringBuilder();String route=null;
        for(String key:f.allKeys()){
            if(route==null)route=ModuleHierarchy.featureRoute(key);
            EnhancementOption option=options.get(key);if(option!=null)copy.append(' ').append(option.title).append(' ').append(option.summary);
        }
        add(out,query,unlocked,new Result(f.title,route==null?fallback:route,copy.toString()));
        for(NativeFeatureGroups.Feature child:f.children)feature(out,query,unlocked,child,route==null?fallback:route,options);
    }
    private static void add(Map<String,Result> out,String query,boolean unlocked,Result result){
        if(!unlocked&&ModuleHierarchy.isRestricted(result.route))return;
        if(result.keywords.contains(query))out.putIfAbsent(result.route+"|"+result.title,result);
    }
    private static String normalize(String text){return text==null?"":text.toLowerCase(Locale.ROOT).replaceAll("[\\s/\\-·]+","");}
    private static String entryAliases(String route){
        switch(route){
            case "ai_trigger":return "AI触发器 极速响应 模板 识图 点击冷却 游戏助手";
            case "fan_control":return "散热风扇 固定转速 本机测量 息屏运转 磁贴";
            case "freeform_rules":return "游戏登录 微信 QQ 小窗 第三方应用跳转";
            case "freeform_limits":return "小窗数量上限 全应用支持 例外名单";
            case "audio_gain":return "超过100%音量 增益";
            case "shoulder":return "肩键 极速连点 兼容性测试 方案切换";
            case "combo_speed":return "一键连招速度";
            case "mi_health":return "小米运动健康 账号绑定 倍率 随机步数 每日上限";
            case "status_arrangement":return "单双排 位置 大小 顺序 留白 高度 预设 恢复";
            case "status_clock":return "时钟格式 字体 秒 毫秒 中文时段";
            case "status_assets":return "图标素材 字体 PNG GIF WebP 动态图标 导入 导出 社区";
            case "hide":return "应用隐藏 消失吧APP 锁屏自动隐藏 快捷磁贴 用户空间";
            default:return "";
        }
    }
}
