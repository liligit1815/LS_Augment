package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.text.InputType;
import android.view.View;
import android.widget.*;
import java.util.*;
import java.util.function.*;
import org.json.JSONObject;

/** Functional text selection inside the existing island editor; no independent visual style settings. */
final class IslandContentRuleEditor {
    private final Activity activity;private final UiKit ui;private final Supplier<String> read;private final Consumer<String> write;
    private final LinearLayout content;private final int user=android.os.Process.myUid()/100000;
    private final TreeMap<String,String> channels=new TreeMap<>();
    private String pkg="",status="";private int request,sceneIndex;
    private static final String[] SCENES={"普通通知","持续状态通知","通知发布计数","上传与下载"};
    private static final String[] FIELDS={"紧凑摘要","展开标题","展开正文"};
    private static final String[] LAYOUT_NAMES={"按实际内容自动","图文与操作","封面与分行正文","图文与纵向操作","图文与进度","文字与进度"};
    private static final String[] ICON_NAMES={"自动选择","通知小图标","来源封面","应用图标"};
    private static final String[] ICON_FIELDS={"收起与副岛图标","展开图标"};
    IslandContentRuleEditor(Activity activity,UiKit ui,Supplier<String> read,Consumer<String> write){
        this.activity=activity;this.ui=ui;this.read=read;this.write=write;content=column();render();
    }
    View view(){return content;}
    void saveState(android.os.Bundle state){
        android.os.Bundle saved=new android.os.Bundle();saved.putInt("user",user);saved.putInt("scene",sceneIndex);saved.putString("package",pkg);
        android.os.Bundle found=new android.os.Bundle();channels.forEach(found::putString);saved.putBundle("channels",found);state.putBundle("island-content-editor",saved);
    }
    void restoreState(android.os.Bundle state){
        android.os.Bundle saved=state==null?null:state.getBundle("island-content-editor");if(saved==null||saved.getInt("user",-1)!=user)return;
        int index=saved.getInt("scene",0);if(index<0||index>=SCENES.length)return;sceneIndex=index;
        String selected=saved.getString("package","");pkg=selected.isEmpty()||IslandDownloadConfig.validApp(user,selected)?selected:"";
        android.os.Bundle found=saved.getBundle("channels");channels.clear();
        if(found!=null)for(String id:found.keySet())if(channels.size()<256&&!IslandContentRules.key(user,scene(),pkg,id).isEmpty())channels.put(id,found.getString(id,id));
        render();
    }
    private LinearLayout column(){LinearLayout view=new LinearLayout(activity);view.setOrientation(LinearLayout.VERTICAL);return view;}
    private boolean available(){return !activity.isDestroyed()&&!activity.isFinishing()&&content.isShown();}
    private String scene(){return IslandContentRules.SCENES.get(sceneIndex);}
    private String appName(String selected){try{return activity.getPackageManager().getApplicationLabel(activity.getPackageManager().getApplicationInfo(selected,0)).toString();}catch(Exception missing){return selected;}}
    private void load(String selected){
        if(!available())return;pkg=selected;channels.clear();status="正在读取通知渠道…";int generation=++request;render();
        new Thread(()->{
            Map<String,String> found=new TreeMap<>();String message;
            try{JSONObject result=IslandNoticeChannels.read(activity,selected);result.keys().forEachRemaining(id->found.put(id,result.optString(id,id)));message=found.isEmpty()?"此应用尚未创建通知渠道。":"";}
            catch(Exception missing){message="暂时无法读取渠道，已保存的规则仍可编辑。";}
            String note=message;activity.runOnUiThread(()->{
                if(generation!=request||activity.isDestroyed()||activity.isFinishing())return;channels.putAll(found);status=note;render();
            });
        },"Duo-ContentChannels").start();
    }
    private void render(){
        android.os.Bundle state=new android.os.Bundle();ui.saveState(state);content.removeAllViews();
        IslandContentRules rules=IslandContentRules.parse(read.get());if(rules==null)return;
        content.addView(ui.text("渠道优先于应用，应用优先于场景默认；文字、排列和两处图标分别继承。内容规则不会开启场景或选择通知渠道。留空跟随上级，选择“原始显示”可覆盖上级文字规则。空结果或处理失败保留原文。",12,ui.muted,false),ui.wrap());
        Button select=ui.textButton("场景 · "+SCENES[sceneIndex]);select.setTag("island-content-scene");
        select.setOnClickListener(v->ui.choiceDialog("选择内容场景",SCENES,null,index->{if(!available())return;sceneIndex=index;render();}));content.addView(select,ui.wrap());
        scope("场景默认",IslandContentRules.key(user,scene(),"",""),rules);
        TreeSet<String> known=new TreeSet<>();Map<String,String> visible=new TreeMap<>(channels);
        for(String key:rules.keys()){
            String[] parts=IslandContentRules.parts(key);if(!parts[0].equals(String.valueOf(user))||!parts[1].equals(scene()))continue;
            if(!parts[2].isEmpty())known.add(parts[2]);if(parts[2].equals(pkg)&&!parts[3].isEmpty())visible.putIfAbsent(parts[3],parts[3]);
        }
        Button pick=ui.textButton(pkg.isEmpty()?"选择内容来源应用":"更换内容来源应用");pick.setTag("island-content-app");
        pick.setOnClickListener(v->AppSelectionDialog.pick(activity,ui,"选择内容来源应用",String.join(";",known),this::load));content.addView(pick,ui.wrap());
        if(!pkg.isEmpty()){
            scope(appName(pkg)+" · 应用默认",IslandContentRules.key(user,scene(),pkg,""),rules);
            if(!status.isEmpty())content.addView(ui.text(status,12,ui.muted,false),ui.wrap());
            Set<String> labels=new HashSet<>(),duplicate=new HashSet<>();for(String label:visible.values())if(!labels.add(label))duplicate.add(label);
            for(Map.Entry<String,String> channel:visible.entrySet())scope(duplicate.contains(channel.getValue())?channel.getValue()+" ("+channel.getKey()+")":channel.getValue(),IslandContentRules.key(user,scene(),pkg,channel.getKey()),rules);
        }
        ui.restoreState(state);
    }
    private void scope(String title,String key,IslandContentRules rules){
        LinearLayout body=column();
        String layout=rules.expression(key,IslandContentRules.LAYOUT);int index=IslandContentRules.LAYOUTS.indexOf(layout);
        Button arrangement=ui.textButton("内容排列 · "+(index<0?"跟随上级":LAYOUT_NAMES[index]));arrangement.setTag("island-layout:"+key);
        arrangement.setOnClickListener(v->editLayout(title,key));body.addView(arrangement,ui.wrap());
        for(int i=0;i<ICON_FIELDS.length;i++){
            int field=IslandContentRules.COMPACT_ICON+i;String label=ICON_FIELDS[i];int selected=IslandContentRules.ICONS.indexOf(rules.expression(key,field));
            Button image=ui.textButton(label+" · "+(selected<0?"跟随上级":ICON_NAMES[selected]));image.setTag("island-content:"+key+":"+field);
            image.setOnClickListener(v->editIcon(title+" · "+label,key,field));body.addView(image,ui.wrap());
        }
        for(int i=0;i<FIELDS.length;i++){
            int field=i;String expression=rules.expression(key,field);
            String label=expression.isEmpty()?"跟随上级":expression.equals("${default}")?"原始显示":"已自定义";
            Button button=ui.textButton(FIELDS[field]+" · "+label);button.setTag("island-content:"+key+":"+field);
            button.setOnClickListener(v->edit(title+" · "+FIELDS[field],key,field));body.addView(button,ui.wrap());
        }
        content.addView(ui.foldingSection(title,body,false),ui.wrap());
    }
    private void editLayout(String title,String key){
        String[] descriptions={"使用渠道、应用或场景的上级设置。","来源提供真实进度时显示进度条，其余内容显示图文与操作。",
                "图标、标题与正文同组，原通知操作位于下方。已有进度保留百分比文字。","图标与标题在上，完整正文独占下方宽度；保留来源图片比例。",
                "原通知操作依次纵向排列，保留全部可用按钮。","图文下方显示来源实际提供的进度；没有进度时不生成进度条。",
                "文字优先，来源图标置于右侧，真实进度显示在下方。"};
        editChoice(title+" · 内容排列",key,IslandContentRules.LAYOUT,LAYOUT_NAMES,IslandContentRules.LAYOUTS,descriptions);
    }
    private void editIcon(String title,String key,int field){
        String[] descriptions={"仅此处图标跟随渠道、应用或场景的上级设置。","优先使用来源封面，其次为通知小图标和来源应用图标。",
                "优先使用这条通知提供的小图标，缺失或无法读取时回退到可用来源图标。","优先使用这条通知的大图标或封面，保持原图比例；没有封面时回退。",
                "优先使用发布通知的应用图标，不使用其他应用的身份。"};
        editChoice(title,key,field,ICON_NAMES,IslandContentRules.ICONS,descriptions);
    }
    private void editChoice(String title,String key,int field,String[] names,List<String> options,String[] descriptions){
        if(!available())return;IslandContentRules initial=IslandContentRules.parse(read.get());if(initial==null)return;
        String before=initial.expression(key,field),selectedScene=scene(),selectedPkg=pkg;long fence=ResetWriteFence.generation();
        String[] choices=new String[names.length+1];choices[0]="跟随上级";System.arraycopy(names,0,choices,1,names.length);
        ui.choiceDialog(title,choices,descriptions,index->{
            if(!available()||!selectedScene.equals(scene())||!selectedPkg.equals(pkg)||ResetWriteFence.stale(fence))return;
            IslandContentRules latest=IslandContentRules.parse(read.get());if(latest==null)return;
            if(!before.equals(latest.expression(key,field))){android.widget.Toast.makeText(activity,"此项已变化，请重新打开。",android.widget.Toast.LENGTH_SHORT).show();return;}
            String next=latest.updated(key,field,index==0?"":options.get(index-1));
            if(next==null){android.widget.Toast.makeText(activity,"规则容量不足，请清除不再使用的内容规则。",android.widget.Toast.LENGTH_SHORT).show();return;}
            write.accept(next);render();
        });
    }
    private void edit(String title,String key,int field){
        if(!available())return;IslandContentRules initial=IslandContentRules.parse(read.get());if(initial==null)return;
        String before=initial.expression(key,field),selectedScene=scene(),selectedPkg=pkg;long fence=ResetWriteFence.generation();
        LinearLayout body=column();
        body.addView(ui.text("可直接写文字或插入字段，最多320字。数据在手机本地处理；只使用来源实际提供的内容。",12,ui.muted,false),ui.wrap());
        EditText input=new EditText(activity);ui.styleInput(input);input.setInputType(InputType.TYPE_CLASS_TEXT|InputType.TYPE_TEXT_FLAG_MULTI_LINE);
        input.setMinLines(3);input.setText(before);input.setTag("island-content-expression");body.addView(input,ui.wrap());
        String[] names={"跟随上级","原始显示","来源标题","正文／实时速率","副标题／累计量","完整长正文","多行内容","附加信息","应用名称","来源进度","来源状态","发布次数","活动通知条数"};
        String[] expressions={"","${default}","${title}","${text}","${subtext}","${bigtext}","${lines}","${info}","${app}","${progress}","${state}","${count}","${notification_count}"};
        Button insert=ui.textButton("选择显示字段");insert.setOnClickListener(v->ui.choiceDialog("显示字段",names,null,index->{if(available())input.setText(expressions[index]);}));body.addView(insert,ui.wrap());
        body.addView(ui.text("进度和状态来自通知或实际传输，次数和条数仅用于通知计数。字段缺失时不生成数值。\n表达式示例：${trim(text)}\n${regex(text, \"([0-9]+)\", 1)}\n${replace(text, \"前缀\", \"\")}\n提取、替换支持正则；替换中的 $1 引用捕获组。",12,ui.muted,false),ui.wrap());
        TextView error=ui.inlineInputError(input,"island-content-expression");body.addView(error,ui.wrap());
        Dialog dialog=ui.glassDialog(title,body,"确定",null,"取消");
        dialog.getWindow().getDecorView().findViewWithTag("glass-dialog-confirm").setOnClickListener(v->{
            if(!available()||!selectedScene.equals(scene())||!selectedPkg.equals(pkg)||ResetWriteFence.stale(fence)){dialog.dismiss();return;}
            IslandContentRules latest=IslandContentRules.parse(read.get());if(latest==null)return;
            if(!before.equals(latest.expression(key,field))){error.setText("此项已变化，请取消后重新打开。");error.setVisibility(View.VISIBLE);return;}
            String expression=input.getText().toString(),problem=IslandTextExpression.error(expression);
            String next=problem.isEmpty()?latest.updated(key,field,expression):null;
            if(next==null){error.setText(problem.isEmpty()?"规则容量不足，请清除不再使用的内容规则。":problem);error.setVisibility(View.VISIBLE);return;}
            write.accept(next);dialog.dismiss();render();
        });
    }
}
