package ls.augment.com;

import android.app.Activity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.function.BiConsumer;
import java.util.function.Function;

/** Same-page island settings, built entirely from the shared Duo controls. */
final class IslandSettingsEditor {
    private final Activity activity;
    private final UiKit ui;
    private final Function<String,String> read, unavailable, help;
    private final BiConsumer<String,String> write;
    private final Map<String,View> controls;
    private final Map<IslandSceneRegistry.Scene,TextView> states=new LinkedHashMap<>();
    private boolean binding;
    IslandSettingsEditor(Activity activity,UiKit ui,Function<String,String> read,BiConsumer<String,String> write,
            Function<String,String> unavailable,Function<String,String> help,Map<String,View> controls) {
        this.activity=activity;this.ui=ui;this.read=read;this.write=write;this.unavailable=unavailable;this.help=help;this.controls=controls;
    }
    View view(Function<String,View> input) {
        LinearLayout content=column();
        content.addView(ui.text("红魔12原生样式 · 轻点展开 · 长按打开来源",12,ui.muted,false),ui.margins(0,8,0,8));
        for(String group:new String[]{"系统活动","通知与传输","通话录音与AI","出行与生活服务"}) {
            LinearLayout section=column();
            for(IslandSceneRegistry.Scene scene:IslandSceneRegistry.scenes()) if(group.equals(scene.group)) {
                Switch toggle=toggle(scene.key);
                section.addView(ui.featureRow(scene.title,help.apply(scene.id),toggle),ui.wrap());
                TextView state=ui.text("",12,ui.muted,false);states.put(scene,state);section.addView(state,ui.margins(0,0,0,4));
                toggle.setOnCheckedChangeListener((button,on)->{if(!binding)write.accept(scene.key,on?"1":"0");});
                if("notifications".equals(scene.id)) {
                    LinearLayout rules=column();rules.setPadding(ui.dp(12),0,0,0);
                    View blacklist=new IslandNoticeBlacklistEditor(activity,ui,()->read.apply(IslandNoticeBlacklist.KEY),
                            next->write.accept(IslandNoticeBlacklist.KEY,next)).view();
                    controls.put(IslandNoticeBlacklist.KEY,blacklist);rules.addView(blacklist,ui.wrap());
                    rules.addView(input.apply(SystemUiOptions.PREFIX+"island_notice_seconds"),ui.wrap());
                    View editor=new IslandNoticeRuleEditor(activity,ui,()->read.apply(IslandNoticeRules.KEY),
                            next->write.accept(IslandNoticeRules.KEY,next)).view();
                    controls.put(IslandNoticeRules.KEY,editor);rules.addView(ui.foldingSection("应用与渠道例外",editor,false),ui.wrap());
                    section.addView(rules,ui.wrap());UiKit.Fold fold=ui.fold(toggle,rules);
                    toggle.setOnCheckedChangeListener((button,on)->{fold.sync();if(!binding)write.accept(scene.key,on?"1":"0");});
                } else if("downloads".equals(scene.id)) {
                    LinearLayout channels=column();channels.setPadding(ui.dp(12),0,0,0);
                    View editor=new IslandDownloadChannelEditor(activity,ui,read,write).view();
                    controls.put(IslandDownloadConfig.CHANNELS,editor);channels.addView(editor,ui.wrap());section.addView(channels,ui.wrap());
                    UiKit.Fold fold=ui.fold(toggle,channels);
                    toggle.setOnCheckedChangeListener((button,on)->{fold.sync();if(!binding)write.accept(scene.key,on?"1":"0");});
                }
            }
            content.addView(ui.foldingSection(group,section,false),ui.wrap());
        }
        content.addView(ui.text("提醒交互",13,ui.muted,true),ui.margins(0,8,0,4));
        Switch first=toggle(SystemUiOptions.ISLAND_FIRST_EXPAND);
        content.addView(ui.featureRow("首次提醒展开","普通通知与上传下载首次出现时展开，后续更新与手动收起保持原有状态。普通通知遵循黑名单及应用、渠道例外；上传下载按所选渠道接入。",first),ui.wrap());
        first.setOnCheckedChangeListener((button,on)->{if(!binding)write.accept(SystemUiOptions.ISLAND_FIRST_EXPAND,on?"1":"0");});
        refresh();return content;
    }
    void refresh() {
        binding=true;
        try { for(Map.Entry<IslandSceneRegistry.Scene,TextView> entry:states.entrySet()) {
            IslandSceneRegistry.Scene scene=entry.getKey();String reason=unavailable.apply(scene.id);
            Switch toggle=(Switch)controls.get(scene.key);
            // A missing capability does not erase a saved selection or claim it is effective.
            toggle.setChecked(ConfigSchema.truthy(read.apply(scene.key)));toggle.setEnabled(reason.isEmpty()||toggle.isChecked());
            TextView state=entry.getValue();state.setText(reason);state.setVisibility(reason.isEmpty()?View.GONE:View.VISIBLE);
        }} finally { binding=false; }
    }
    private Switch toggle(String key) {
        Switch toggle=new Switch(activity);toggle.setTag("config:"+key);toggle.setChecked(ConfigSchema.truthy(read.apply(key)));controls.put(key,toggle);return toggle;
    }
    private LinearLayout column() { LinearLayout view=new LinearLayout(activity);view.setOrientation(LinearLayout.VERTICAL);return view; }
}
