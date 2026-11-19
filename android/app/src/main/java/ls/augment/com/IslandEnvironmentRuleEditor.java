package ls.augment.com;

import android.app.Activity;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;
import java.util.function.Consumer;
import java.util.function.Supplier;

/** Shared setting controls; source selection does not enable a scene or grant notification access. */
final class IslandEnvironmentRuleEditor {
    private final Activity activity;private final UiKit ui;private final Supplier<String> read;private final Consumer<String> write;
    private final LinearLayout content;private final int user=android.os.Process.myUid()/100000;
    private static final String[] TITLES={"普通通知","持续状态通知","通知发布计数","上传与下载","文字提示（Toast）"};
    private static final String[] MODES={"跟随场景","不上岛","不自动展开","首次及更新自动展开"};
    IslandEnvironmentRuleEditor(Activity activity,UiKit ui,Supplier<String> read,Consumer<String> write){
        this.activity=activity;this.ui=ui;this.read=read;this.write=write;content=column();render();
    }
    View view(){return content;}
    private LinearLayout column(){LinearLayout v=new LinearLayout(activity);v.setOrientation(LinearLayout.VERTICAL);return v;}
    private boolean available(){return !activity.isDestroyed()&&!activity.isFinishing()&&content.isShown();}
    private boolean save(String raw){
        if(!available())return false;
        if(raw==null){Toast.makeText(activity,"规则无效或容量不足，请减少不再使用的规则",Toast.LENGTH_SHORT).show();return false;}
        write.accept(raw);return true;
    }
    private String appName(String pkg){try{return activity.getPackageManager().getApplicationLabel(activity.getPackageManager().getApplicationInfo(pkg,0)).toString();}catch(Exception absent){return pkg;}}
    private void render(){
        android.os.Bundle folds=new android.os.Bundle();ui.saveState(folds);
        content.removeAllViews();IslandEnvironmentRules rules=IslandEnvironmentRules.parse(read.get());if(rules==null)return;
        content.addView(ui.text("渠道和来源应用规则优先，其次是当前前台应用、勿扰和场景默认。不自动展开仍可手动查看；自动展开只响应新内容，不延长停留时间，也不抢占已展开的其他面板。\n\n系统通知权限、隐私和普通通知黑名单始终有效。横屏或系统隐藏状态栏时，仍按系统允许的方式显示。",12,ui.muted,false),ui.wrap());
        LinearLayout foreground=column();
        Button pick=ui.textButton("添加前台应用规则");pick.setOnClickListener(v->AppSelectionDialog.pick(activity,ui,"选择前台应用",String.join(";",rules.packages('F',user)),pkg->{
            if(available())edit(appName(pkg),IslandEnvironmentRules.key('F',user,"*",pkg,""));
        }));foreground.addView(pick,ui.wrap());
        for(String pkg:rules.packages('F',user))choice(foreground,appName(pkg),IslandEnvironmentRules.key('F',user,"*",pkg,""),rules);
        content.addView(ui.foldingSection("当前前台应用",foreground,false),ui.wrap());
        LinearLayout exempt=column();exempt.addView(ui.text("这些来源应用跳过前台应用规则，继续匹配勿扰及场景默认。来源自己的应用和渠道规则仍优先。",12,ui.muted,false),ui.wrap());
        Button add=ui.textButton("添加不受前台规则影响的来源");add.setOnClickListener(v->AppSelectionDialog.pick(activity,ui,"选择来源应用",String.join(";",rules.packages('X',user)),pkg->{
            IslandEnvironmentRules current=IslandEnvironmentRules.parse(read.get());
            if(current!=null&&save(current.updated(IslandEnvironmentRules.key('X',user,"*",pkg,""),1)))render();
        }));exempt.addView(add,ui.wrap());
        for(String pkg:rules.packages('X',user)){
            Button remove=ui.textButton(appName(pkg)+" · 移除例外");remove.setOnClickListener(v->{
                IslandEnvironmentRules current=IslandEnvironmentRules.parse(read.get());if(current!=null&&save(current.updated(IslandEnvironmentRules.key('X',user,"*",pkg,""),0)))render();
            });exempt.addView(remove,ui.wrap());
        }content.addView(ui.foldingSection("前台规则的来源例外",exempt,false),ui.wrap());
        choice(content,"勿扰模式",IslandEnvironmentRules.key('D',user,"*","",""),rules);
        for(int i=0;i<IslandEnvironmentRules.SCENES.size();i++){
            String scene=IslandEnvironmentRules.SCENES.get(i);LinearLayout section=column();
            choice(section,"场景默认",IslandEnvironmentRules.key('S',user,scene,"",""),rules);
            if(scene.equals("notifications"))section.addView(ui.text("来源应用和渠道仍在普通通知的“应用与渠道例外”中设置；其中“首次自动展开”仅作用于首次提醒。",12,ui.muted,false),ui.wrap());
            else{
                IslandNoticeRuleEditor source=new IslandNoticeRuleEditor(activity,ui,()->{
                    IslandEnvironmentRules current=IslandEnvironmentRules.parse(read.get());return current==null?null:current.sourceRules(scene);
                },raw->{IslandEnvironmentRules current=IslandEnvironmentRules.parse(read.get());if(current!=null)save(current.withSources(scene,raw));},true,!scene.equals("toast"));
                section.addView(source.view(),ui.wrap());
            }
            content.addView(ui.foldingSection(TITLES[i]+"规则",section,false),ui.wrap());
        }
        ui.restoreState(folds);
    }
    private void choice(LinearLayout target,String title,String key,IslandEnvironmentRules rules){
        Button button=ui.textButton(title+" · "+MODES[rules.mode(key)]);button.setTag("island-environment:"+key);
        button.setOnClickListener(v->edit(title,key));target.addView(button,ui.wrap());
    }
    private void edit(String title,String key){
        long generation=ResetWriteFence.generation();
        ui.choiceDialog(title,MODES,null,mode->{
            if(!available()||ResetWriteFence.stale(generation))return;
            IslandEnvironmentRules current=IslandEnvironmentRules.parse(read.get());if(current!=null&&save(current.updated(key,mode)))render();
        });
    }
}
