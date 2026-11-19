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
    private IslandContentRuleEditor contentEditor;
    private IslandTemplateRuleEditor templateEditor;
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
                } else if("face".equals(scene.id)) {
                    section.addView(input.apply(SystemUiOptions.PREFIX+"island_face_theme"),ui.wrap());
                } else if("media".equals(scene.id)) {
                    section.addView(input.apply(SystemUiOptions.PREFIX+"island_lyrics_source"),ui.wrap());
                } else if("charging".equals(scene.id)) {
                    LinearLayout fields=column();
                    for(String key:new String[]{IslandChargeConfig.LEFT,IslandChargeConfig.RIGHT,IslandChargeConfig.DURATION,IslandChargeConfig.SECONDS})
                        fields.addView(input.apply(key),ui.wrap());
                    section.addView(ui.foldingSection("充电显示",fields,false),ui.wrap());
                } else if("toast".equals(scene.id)) {
                    View editor=new IslandToastRuleEditor(activity,ui,()->read.apply(IslandToastRules.KEY),next->write.accept(IslandToastRules.KEY,next)).view();
                    controls.put(IslandToastRules.KEY,editor);section.addView(editor,ui.wrap());UiKit.Fold fold=ui.fold(toggle,editor);
                    toggle.setOnCheckedChangeListener((button,on)->{fold.sync();if(!binding)write.accept(scene.key,on?"1":"0");});
                } else if("downloads".equals(scene.id)||"ongoing".equals(scene.id)||"notification_count".equals(scene.id)) {
                    LinearLayout channels=column();channels.setPadding(ui.dp(12),0,0,0);
                    boolean ongoing="ongoing".equals(scene.id);
                    View editor=new IslandDownloadChannelEditor(activity,ui,read,write,scene.id).view();
                    controls.put("notification_count".equals(scene.id)?IslandCountConfig.CHANNELS:ongoing?IslandOngoingConfig.CHANNELS:IslandDownloadConfig.CHANNELS,editor);channels.addView(editor,ui.wrap());section.addView(channels,ui.wrap());
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
        LinearLayout gestures=column();
        gestures.addView(input.apply(IslandGestureConfig.EXPANDED),ui.wrap());
        gestures.addView(input.apply(IslandGestureConfig.COMPACT),ui.wrap());
        Switch protect=toggle(IslandGestureConfig.PROTECT);
        gestures.addView(ui.featureRow("保护持续活动","附加动作默认忽略持续通知和进度任务；原厂切换、隐藏及真实业务按钮继续有效。",protect),ui.wrap());
        protect.setOnCheckedChangeListener((button,on)->{if(!binding)write.accept(IslandGestureConfig.PROTECT,on?"1":"0");});
        content.addView(ui.foldingSection("滑动操作",gestures,false),ui.wrap());
        View environments=new IslandEnvironmentRuleEditor(activity,ui,()->read.apply(IslandEnvironmentRules.KEY),
                next->write.accept(IslandEnvironmentRules.KEY,next)).view();
        controls.put(IslandEnvironmentRules.KEY,environments);
        content.addView(ui.foldingSection("来源与环境规则",environments,false),ui.wrap());
        templateEditor=new IslandTemplateRuleEditor(activity,ui,()->read.apply(IslandTemplateRules.KEY),next->write.accept(IslandTemplateRules.KEY,next));
        View templates=templateEditor.view();controls.put(IslandTemplateRules.KEY,templates);
        content.addView(ui.foldingSection("通知模板",templates,false),ui.wrap());
        contentEditor=new IslandContentRuleEditor(activity,ui,()->read.apply(IslandContentRules.KEY),next->write.accept(IslandContentRules.KEY,next));
        View formats=contentEditor.view();
        controls.put(IslandContentRules.KEY,formats);
        content.addView(ui.foldingSection("通知内容规则",formats,false),ui.wrap());
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
    void saveState(android.os.Bundle state){if(contentEditor!=null)contentEditor.saveState(state);if(templateEditor!=null)templateEditor.saveState(state);}
    void restoreState(android.os.Bundle state){if(contentEditor!=null)contentEditor.restoreState(state);if(templateEditor!=null)templateEditor.restoreState(state);}
    private Switch toggle(String key) {
        Switch toggle=new Switch(activity);toggle.setTag("config:"+key);toggle.setChecked(ConfigSchema.truthy(read.apply(key)));controls.put(key,toggle);return toggle;
    }
    private LinearLayout column() { LinearLayout view=new LinearLayout(activity);view.setOrientation(LinearLayout.VERTICAL);return view; }
}
