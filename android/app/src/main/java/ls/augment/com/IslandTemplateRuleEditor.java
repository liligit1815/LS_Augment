package ls.augment.com;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.*;
import java.util.*;
import java.util.function.*;
import org.json.JSONObject;

/** Real notification templates inside the common island settings page. */
final class IslandTemplateRuleEditor {
    private static final String[] MODES={"跟随上级","沿用场景与渠道选择","通知原文","真实进度","通知发布计数"};
    private final Activity activity;private final UiKit ui;private final Supplier<String> read;private final Consumer<String> write;
    private final LinearLayout content;private final int user=android.os.Process.myUid()/100000;
    private final Map<String,String> channels=new TreeMap<>();private String pkg="",status="";private int request;
    IslandTemplateRuleEditor(Activity activity,UiKit ui,Supplier<String> read,Consumer<String> write){
        this.activity=activity;this.ui=ui;this.read=read;this.write=write;
        content=new LinearLayout(activity);content.setOrientation(LinearLayout.VERTICAL);render();
    }
    View view(){return content;}
    private boolean available(){return !activity.isDestroyed()&&!activity.isFinishing()&&content.isShown();}
    void saveState(Bundle state){
        Bundle saved=new Bundle();saved.putInt("user",user);saved.putString("package",pkg);
        Bundle found=new Bundle();channels.forEach(found::putString);saved.putBundle("channels",found);state.putBundle("island-template-editor",saved);
    }
    void restoreState(Bundle state){
        Bundle saved=state==null?null:state.getBundle("island-template-editor");if(saved==null||saved.getInt("user",-1)!=user)return;
        String selected=saved.getString("package","");pkg=selected.isEmpty()||IslandDownloadConfig.validApp(user,selected)?selected:"";
        Bundle found=saved.getBundle("channels");channels.clear();
        if(found!=null)for(String id:found.keySet())if(!IslandTemplateRules.key(user,pkg,id).isEmpty())channels.put(id,found.getString(id,id));
        render();
    }
    private void load(String selected){
        if(!available())return;pkg=selected;channels.clear();status="正在读取通知渠道…";int generation=++request;render();
        new Thread(()->{
            Map<String,String> found=new TreeMap<>();String message;
            try{JSONObject result=IslandNoticeChannels.read(activity,selected);result.keys().forEachRemaining(id->found.put(id,result.optString(id,id)));message=found.isEmpty()?"此应用尚未创建通知渠道。":"";}
            catch(Exception missing){message="暂时无法读取渠道，已保存的规则仍可编辑。";}
            String note=message;activity.runOnUiThread(()->{
                if(generation!=request||activity.isDestroyed()||activity.isFinishing())return;
                channels.putAll(found);status=note;render();
            });
        },"Duo-TemplateChannels").start();
    }
    private void render(){
        Bundle state=new Bundle();ui.saveState(state);content.removeAllViews();
        IslandTemplateRules rules=IslandTemplateRules.parse(read.get());if(rules==null)return;
        content.addView(ui.text("渠道优先于应用，应用优先于默认模板。“沿用场景与渠道选择”恢复原有分流。模板决定内容含义，排列、文字和图标仍在通知内容规则中设置。",12,ui.muted,false),ui.wrap());
        content.addView(ui.text("通知原文：普通通知按提醒时限显示，持续通知随来源撤回。真实进度：使用通知提供的进度；缺少进度时保留原文。通知发布计数：统计当前通知的发布与更新次数，不是未读数。\n需开启对应的普通通知、持续状态、上传下载或计数场景。权限、黑名单与环境规则仍有效；媒体、导航、通话、录屏及系统下载保持专门处理。",12,ui.muted,false),ui.margins(0,4,0,8));
        choice("默认模板",IslandTemplateRules.key(user,"",""),rules);
        Set<String> known=new TreeSet<>();Map<String,String> visible=new TreeMap<>(channels);
        for(String key:rules.keys()){
            String[] p=IslandTemplateRules.parts(key);if(!p[0].equals(String.valueOf(user)))continue;
            if(!p[1].isEmpty())known.add(p[1]);if(p[1].equals(pkg)&&!p[2].isEmpty())visible.putIfAbsent(p[2],p[2]);
        }
        Button pick=ui.textButton(pkg.isEmpty()?"选择模板来源应用":"更换模板来源应用");pick.setTag("island-template-app");
        pick.setOnClickListener(v->AppSelectionDialog.pick(activity,ui,"选择模板来源应用",String.join(";",known),this::load));content.addView(pick,ui.wrap());
        if(!pkg.isEmpty()){
            String label=pkg;try{label=activity.getPackageManager().getApplicationLabel(activity.getPackageManager().getApplicationInfo(pkg,0)).toString();}catch(Exception absent){}
            choice(label+" · 应用模板",IslandTemplateRules.key(user,pkg,""),rules);
            if(!status.isEmpty())content.addView(ui.text(status,12,ui.muted,false),ui.wrap());
            Set<String> labels=new HashSet<>(),duplicates=new HashSet<>();for(String name:visible.values())if(!labels.add(name))duplicates.add(name);
            for(Map.Entry<String,String> row:visible.entrySet())choice(duplicates.contains(row.getValue())?row.getValue()+" ("+row.getKey()+")":row.getValue(),IslandTemplateRules.key(user,pkg,row.getKey()),rules);
        }
        ui.restoreState(state);
    }
    private void choice(String title,String key,IslandTemplateRules rules){
        Button button=ui.textButton(title+" · "+MODES[rules.mode(key)]);button.setTag("island-template:"+key);
        button.setOnClickListener(v->{
            long generation=ResetWriteFence.generation();String selected=pkg;IslandTemplateRules before=IslandTemplateRules.parse(read.get());if(before==null)return;
            ui.choiceDialog(title,MODES,null,mode->{
                if(!available()||ResetWriteFence.stale(generation)||!selected.equals(pkg))return;
                IslandTemplateRules current=IslandTemplateRules.parse(read.get());if(current==null)return;
                if(current.mode(key)!=before.mode(key)){Toast.makeText(activity,"模板已变化，请重新选择",Toast.LENGTH_SHORT).show();render();return;}
                String raw=current.updated(key,mode);
                if(raw==null){Toast.makeText(activity,"规则已达容量上限，请清理不用的模板规则",Toast.LENGTH_SHORT).show();return;}
                write.accept(raw);render();
            });
        });content.addView(button,ui.wrap());
    }
}
