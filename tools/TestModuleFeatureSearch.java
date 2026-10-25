package ls.augment.com;

import java.util.*;

/** User queries resolve to real V2.0 owners and respect the hidden-entry session. */
public final class TestModuleFeatureSearch {
    private static int checkedResults;
    private static void require(boolean condition,String message){if(!condition)throw new AssertionError(message);}
    private static List<ModuleFeatureSearch.Result> search(String query,boolean unlocked){
        List<ModuleFeatureSearch.Result> results=ModuleFeatureSearch.search(query,unlocked);
        Set<String> unique=new HashSet<>();
        for(ModuleFeatureSearch.Result result:results){
            checkedResults++;
            require(unique.add(result.route+"|"+result.title),"Duplicate search row for "+query+": "+result.title);
            require(result.route.equals(ModuleHierarchy.resolve(result.route)),"Search must return a canonical route: "+result.route);
            require(!result.title.isEmpty()&&!result.path.isEmpty(),"Search rows need a title and readable destination");
            require(!ModuleHierarchy.title(result.route).isEmpty(),"Search row has no destination title: "+result.route);
            String category=ModuleHierarchy.categoryForRoute(result.route);
            require(ModulePresentationCatalog.find(category)!=null,"Search must use a current display category, not an old runtime scope: "+result.route);
            List<String> path=ModuleHierarchy.path(result.route);
            require(path.size()<9&&new HashSet<>(path).size()==path.size(),"Search path must be acyclic: "+result.route);
            require("home".equals(path.get(0)),"Feature search must start under Home: "+result.route);
            require(result.route.equals(path.get(path.size()-1)),"Search path must end at destination");
            for(String node:path){
                require(ModuleHierarchy.singleChild(node)==null,"Breadcrumb must not reintroduce an old alias: "+node);
                if(node.startsWith("target-"))require(ModulePresentationCatalog.find(node.substring(7))!=null,"Old hook target leaked into search: "+node);
            }
            if(!unlocked){
                require(!ModuleHierarchy.isRestricted(result.route),"Locked search exposed hidden management: "+result.route);
                require(!result.title.contains("四大皆空")&&!result.title.contains("消失吧")&&!result.title.contains("应用隐藏")&&!result.path.contains("四大皆空")&&!result.path.contains("消失吧"),"Locked result text exposed hidden management");
            }
        }
        return results;
    }
    private static void destination(String query,String route,String category){
        List<ModuleFeatureSearch.Result> results=search(query,false);
        require(!results.isEmpty(),"Expected searchable query: "+query);
        String resolved=ModuleHierarchy.resolve(route);
        require(results.stream().anyMatch(r->r.route.equals(resolved)),"Query '"+query+"' must reach "+resolved);
        for(ModuleFeatureSearch.Result result:results)if(result.route.equals(resolved))require(category.equals(ModuleHierarchy.categoryForRoute(result.route)),"Query has wrong primary category: "+query);
    }
    private static void exactFeature(String query,String route,String category){
        destination(query,route,category);
        ModuleFeatureSearch.Result first=search(query,false).get(0);
        require(query.equals(first.title)&&ModuleHierarchy.resolve(route).equals(first.route),"Exact functional title must rank above parent categories: "+query);
    }
    public static void main(String[] args){
        HiddenEntrySession.lock();
        require(search(null,false).isEmpty()&&search("",false).isEmpty()&&search(" / - · ",false).isEmpty(),"Empty and punctuation-only queries do not list every feature");
        require(search("definitely-no-such-duo-feature",false).isEmpty(),"Unknown query returns no fabricated result");
        for(ModulePresentationCatalog.Category category:ModulePresentationCatalog.categories()){
            List<ModuleFeatureSearch.Result> results=search(category.title,false);
            require(!results.isEmpty(),"All 14 category titles are searchable: "+category.title);
            require(results.get(0).title.equals(category.title)&&results.get(0).route.equals(ModuleHierarchy.resolve(category.route())),"Exact category title ranks first and uses its current canonical route: "+category.title);
        }
        destination("MTP","group/connectivity/usb_mtp","connectivity");
        destination("m t p","group/connectivity/usb_mtp","connectivity");
        exactFeature("自定义 MTP 存储名称","group/connectivity/usb_mtp","connectivity");
        destination("USB","group/connectivity/usb","connectivity");
        exactFeature("自动允许 USB 调试授权","group/connectivity/usb_debug","connectivity");
        exactFeature("USB 调试","group/connectivity/usb_debug","connectivity");
        exactFeature("USB 安装","group/connectivity/usb_debug","connectivity");
        exactFeature("指定 USB 默认用途","group/connectivity/usb_connection","connectivity");
        for(ModuleFeatureSearch.Result result:search("USB",false)){
            require(!"开发者选项".equals(result.title),"USB aliases must not attach to the developer master action");
            require(!"锁定刷新率（原厂开关）".equals(result.title),"USB aliases must not attach to refresh-rate action");
        }
        exactFeature("开发者选项","group/system_settings/developer","system_settings");
        exactFeature("自定义竞技键","competitive_key","system_settings");
        destination("shell","competitive_key","system_settings");
        exactFeature("电池预设样式","status_battery","notifications");
        exactFeature("锁定刷新率（原厂开关）","group/system_settings/display","system_settings");
        exactFeature("截图隐藏状态栏","group/capture/capture","capture");
        exactFeature("录屏隐藏状态栏","group/capture/capture","capture");
        exactFeature("取消截图裁剪最小尺寸限制","group/capture/capture","capture");
        exactFeature("取消相册编辑裁剪最小尺寸限制","group/capture/image_edit","capture");
        exactFeature("双击状态栏锁屏","group/interaction/status_gestures","interaction");
        exactFeature("隐藏锁屏顶部状态栏","group/lockscreen/lock_display","lockscreen");
        exactFeature("锁屏上滑效果","group/lockscreen/liftarc","lockscreen");
        exactFeature("最近任务卡片圆角调节","group/desktop/recents","desktop");
        exactFeature("允许修改小组件大小","group/desktop/desktop_clock","desktop");
        exactFeature("解除Dock栏应用数量限制","group/desktop/dock_glass","desktop");
        exactFeature("强制新装APP图标显示在桌面末页","group/desktop/launcher_grid","desktop");
        destination("桌面组件","group/desktop/desktop_clock","desktop");
        destination("圆角偏移","group/desktop/recents","desktop");
        for(String query:Arrays.asList("LiftArc","小白条","锁屏玻璃","上甩解锁","提示文字"))
            destination(query,"group/lockscreen/liftarc","lockscreen");
        destination("AI 触发器","ai_trigger","gaming");destination("ai触发器","ai_trigger","gaming");
        destination("游戏助手","ai_trigger","gaming");destination("点击冷却","ai_trigger","gaming");
        destination("单双排","status_arrangement","notifications");destination("双排","status_arrangement","notifications");
        destination("动态图标","status_assets","notifications");destination("GIF","status_assets","notifications");destination("WebP","status_assets","notifications");
        destination("图标素材","status_assets","notifications");destination("时钟格式","status_clock","notifications");
        exactFeature("状态栏自定义","status_layout","notifications");exactFeature("灵动岛","group/notifications/island","notifications");
        exactFeature("主题下载与使用","group/lockscreen/theme_download","lockscreen");exactFeature("联名主题","group/lockscreen/collab_theme","lockscreen");
        for(String query:Arrays.asList("状态栏自定义","灵动岛"))for(ModuleFeatureSearch.Result result:search(query,false))require(result.path.startsWith("通知与控制中心"),"Merged feature path shows notification/control-center: "+query);
        for(String query:Arrays.asList("主题下载与使用","联名主题"))for(ModuleFeatureSearch.Result result:search(query,false))if("lockscreen".equals(ModuleHierarchy.categoryForRoute(result.route)))require(result.path.startsWith("主题与锁屏"),"Merged theme feature path uses requested title: "+query);
        destination("游戏登录","freeform_rules","multitasking");destination("小窗数量上限","freeform_limits","multitasking");
        destination("固定转速","fan_control","cooling");destination("超过100%音量","group/audio/audio_gain","audio");
        for(String query:Arrays.asList("四大皆空","消失吧APP","应用隐藏","锁屏自动隐藏"))require(search(query,HiddenEntrySession.isUnlocked()).isEmpty(),"Locked session must not advertise concealed features: "+query);
        require(search("消失",false).stream().anyMatch(r->"status_notifications".equals(r.route)&&!ModuleHierarchy.isRestricted(r.route)),"A short hidden-name substring still finds ordinary notification descriptions while locked");
        for(int i=0;i<7;i++)HiddenEntrySession.recordSystemVersionTap(1_000L+i*100L);
        require(HiddenEntrySession.isUnlocked(),"Test uses the real seven-tap session transition");
        List<ModuleFeatureSearch.Result> shortHiddenQuery=search("消失",true);
        require(shortHiddenQuery.stream().anyMatch(r->"hide".equals(r.route)&&ModuleHierarchy.isRestricted(r.route)),"Unlocked short query reaches the real hidden management page");
        require(shortHiddenQuery.stream().anyMatch(r->"status_notifications".equals(r.route)&&!ModuleHierarchy.isRestricted(r.route)),"Unlocked short query retains a legitimate ordinary notification result");
        for(ModuleFeatureSearch.Result result:shortHiddenQuery)if(ModuleHierarchy.isRestricted(result.route))require("apps".equals(ModuleHierarchy.categoryForRoute(result.route)),"Only restricted matches require Applications ownership for a short query");
        for(String query:Arrays.asList("四大皆空","消失吧APP","应用隐藏","锁屏自动隐藏")){
            List<ModuleFeatureSearch.Result> results=search(query,HiddenEntrySession.isUnlocked());
            require(!results.isEmpty(),"Unlocked hidden feature can be discovered: "+query);
            require(results.stream().anyMatch(r->ModuleHierarchy.isRestricted(r.route)),"Unlocked query reaches the guarded management route: "+query);
            for(ModuleFeatureSearch.Result result:results)require("apps".equals(ModuleHierarchy.categoryForRoute(result.route)),"Concealed app controls have only app-management as their primary category");
        }
        HiddenEntrySession.lock();
        require(search("四大皆空",HiddenEntrySession.isUnlocked()).isEmpty(),"Leaving the session must remove previously discoverable hidden results");
        require(search("消失",false).stream().noneMatch(r->ModuleHierarchy.isRestricted(r.route)),"Locking again removes restricted short-query results while retaining ordinary matches");
        // Broad queries exercise titles, parameter summaries, direct system actions and editor aliases.
        for(String query:Arrays.asList("状态栏","通知","控制中心","桌面","锁屏","主题","音量","手势","小窗","截图","游戏","风扇","连接","应用","系统","步数","字体","图标","隐藏","安装","usb","MTP","Wi-Fi","刷新率")){
            search(query,false);search(query,true);
        }
        exactFeature("红魔Step","atomic_workbench","atomic_workbench");
        destination("红魔 step","atomic_workbench","atomic_workbench");
        destination("原子工作台","atomic_workbench","atomic_workbench");
        for(ModuleFeatureSearch.Result result:search("原子工作台",false)){
            require(!result.title.contains("原子工作台")&&!result.path.contains("原子工作台"),"Legacy search must display the current RedMagic Step name");
        }
        destination("VANSTEP","atomic_workbench","atomic_workbench");
        destination("任务恢复","atomic_workbench","atomic_workbench");
        System.out.println("V2.0 feature search: OK (14 titles, task queries, hidden-session transitions, "+checkedResults+" validated results)");
    }
}
