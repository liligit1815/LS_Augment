package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.text.InputType;
import android.view.View;
import android.widget.*;
import java.util.*;
import java.util.function.*;

/** App-specific Toast settings using the same folds, selectors and numeric controls as Duo. */
final class IslandToastRuleEditor {
    private final Activity activity;private final UiKit ui;
    private final Supplier<String> read;private final Consumer<String> write;
    private final LinearLayout content;private final int user=android.os.Process.myUid()/100000;
    private String pkg="";
    IslandToastRuleEditor(Activity activity,UiKit ui,Supplier<String> read,Consumer<String> write){
        this.activity=activity;this.ui=ui;this.read=read;this.write=write;
        content=new LinearLayout(activity);content.setOrientation(LinearLayout.VERTICAL);render();
    }
    View view(){return content;}
    private boolean available(){return !activity.isDestroyed()&&!activity.isFinishing()&&content.isShown();}
    private IslandToastRules.Rule current(){IslandToastRules rules=IslandToastRules.parse(read.get());return rules==null?null:rules.rule(user,pkg);}
    private boolean save(IslandToastRules.Rule rule,boolean rebuild){
        if(!available())return false;IslandToastRules rules=IslandToastRules.parse(read.get());
        String next=rules==null?null:rules.updated(user,pkg,rule);
        if(next==null){Toast.makeText(activity,"规则无效或已达配置容量上限，请减少应用或词条",Toast.LENGTH_SHORT).show();return false;}
        write.accept(next);if(rebuild)render();return true;
    }
    private void render(){
        content.removeAllViews();IslandToastRules rules=IslandToastRules.parse(read.get());if(rules==null)return;
        Button pick=ui.textButton(pkg.isEmpty()?"选择提示应用":"更换提示应用");
        pick.setTag("toast-select-app");pick.setOnClickListener(v->AppSelectionDialog.pick(activity,ui,"选择提示应用",String.join(";",rules.packages(user)),selected->{
            if(!available())return;pkg=selected;render();
        }));content.addView(pick,ui.wrap());
        if(pkg.isEmpty())return;
        String label=pkg;try{label=activity.getPackageManager().getApplicationLabel(activity.getPackageManager().getApplicationInfo(pkg,0)).toString();}catch(Exception absent){}
        content.addView(ui.featureTitle(label,"仅处理系统标准文字提示。排除词优先；启用仅保留匹配词后，不匹配的提示也会被过滤。过滤会结束对应原提示，其他提示按所选方式展示。\n\n替换需确认岛已显示，动画期间可能短暂保留原提示。轻点查看全文，此类提示不提供应用操作。"),ui.wrap());
        IslandToastRules.Rule rule=rules.rule(user,pkg);
        String[] modes={"跟随系统","上岛并保留原提示","上岛后替换原提示","仅按关键词过滤"};
        Button mode=ui.textButton("提示处理 · "+modes[rule==null?0:rule.mode]);mode.setTag("toast-mode");
        mode.setOnClickListener(v->ui.choiceDialog("提示处理",modes,null,choice->{
            if(!available())return;IslandToastRules.Rule latest=current();if(latest==null)latest=IslandToastRules.Rule.defaults();
            save(choice==0?null:new IslandToastRules.Rule(choice,latest.seconds,latest.whitelist,latest.firstExpand,latest.updateExpand,latest.include,latest.exclude),true);
        }));content.addView(mode,ui.wrap());
        if(rule==null)return;
        if(rule.mode!=IslandToastRules.FILTER){
            View title=ui.featureTitle("提示停留时间（秒）","从本次提示进入岛开始计时；1.2秒内相同文字去重，不延长时限。");content.addView(title,ui.wrap());
            ParameterSlider duration=new ParameterSlider(ui,EnhancementOption.integer("toast_seconds","system","提示停留时间（秒）","",5,1,20),String.valueOf(rule.seconds),value->{
                IslandToastRules.Rule latest=current();if(latest!=null)save(new IslandToastRules.Rule(latest.mode,Integer.parseInt(value),latest.whitelist,latest.firstExpand,latest.updateExpand,latest.include,latest.exclude),false);
            },true);content.addView(duration,ui.wrap());duration.bindTitle(title);
            toggle("首次提示展开","该应用新的提示岛出现时自动展开。",rule.firstExpand,on->{IslandToastRules.Rule latest=current();if(latest!=null)save(new IslandToastRules.Rule(latest.mode,latest.seconds,latest.whitelist,on,latest.updateExpand,latest.include,latest.exclude),false);});
            toggle("更新提示展开","同一应用在停留期间出现不同文字时展开；重复提示不重展。",rule.updateExpand,on->{IslandToastRules.Rule latest=current();if(latest!=null)save(new IslandToastRules.Rule(latest.mode,latest.seconds,latest.whitelist,latest.firstExpand,on,latest.include,latest.exclude),false);});
        }
        toggle("仅保留匹配词","包含任意匹配词才保留；排除词优先。两个词表均为空时不进行过滤。",rule.whitelist,on->{IslandToastRules.Rule latest=current();if(latest!=null)save(new IslandToastRules.Rule(latest.mode,latest.seconds,on,latest.firstExpand,latest.updateExpand,latest.include,latest.exclude),false);});
        for(boolean include:new boolean[]{true,false}){
            String title=include?"匹配词":"排除词",words=include?rule.include:rule.exclude;
            Button edit=ui.textButton(title+" · "+(words.isEmpty()?0:words.split("\n").length)+" 项");edit.setTag(include?"toast-include":"toast-exclude");
            edit.setOnClickListener(v->keywords(include,title));content.addView(edit,ui.wrap());
        }
    }
    private void toggle(String title,String help,boolean value,Consumer<Boolean> update){
        Switch toggle=new Switch(activity);toggle.setChecked(value);content.addView(ui.featureRow(title,help,toggle),ui.wrap());
        toggle.setOnCheckedChangeListener((button,on)->{if(available())update.accept(on);});
    }
    private void keywords(boolean include,String title){
        IslandToastRules.Rule initial=current();if(initial==null||!available())return;
        String target=pkg,initialValue=include?initial.include:initial.exclude;long generation=ResetWriteFence.generation();
        LinearLayout body=new LinearLayout(activity);body.setOrientation(LinearLayout.VERTICAL);
        body.addView(ui.text("每行一个词，按包含关系匹配，不区分英文大小写；最多32项，每项128字，总长不超过2048字。",12,ui.muted,false),ui.wrap());
        EditText field=new EditText(activity);field.setInputType(InputType.TYPE_CLASS_TEXT|InputType.TYPE_TEXT_FLAG_MULTI_LINE);ui.styleInput(field);field.setMinLines(3);field.setText(initialValue);body.addView(field,ui.wrap());
        TextView error=ui.inlineInputError(field,"toast-keywords");body.addView(error,ui.wrap());
        Dialog dialog=ui.glassDialog(title,body,"确定",null,"取消");
        dialog.getWindow().getDecorView().findViewWithTag("glass-dialog-confirm").setOnClickListener(v->{
            if(!available()||!target.equals(pkg)||ResetWriteFence.stale(generation)){dialog.dismiss();return;}
            IslandToastRules.Rule latest=current();if(latest==null){dialog.dismiss();return;}
            if(!initialValue.equals(include?latest.include:latest.exclude)){error.setText("词表已变化，请取消后重新打开。");error.setVisibility(View.VISIBLE);return;}
            String value=IslandToastRules.keywords(field.getText().toString());
            if(value==null){error.setText("请检查词条长度和数量，不要输入控制字符。");error.setVisibility(View.VISIBLE);return;}
            if(save(new IslandToastRules.Rule(latest.mode,latest.seconds,latest.whitelist,latest.firstExpand,latest.updateExpand,include?value:latest.include,include?latest.exclude:value),true))dialog.dismiss();
            else{error.setText("配置容量不足，请减少词条后重试。");error.setVisibility(View.VISIBLE);}
        });
    }
}
