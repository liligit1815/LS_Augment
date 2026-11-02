package ls.augment.com;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Process;
import android.view.View;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.Toast;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.function.BiConsumer;
import java.util.function.Function;
import org.json.JSONArray;
import org.json.JSONObject;

/** Observed channel metadata only; uses the existing page's draft and save transaction. */
final class IslandDownloadChannelEditor {
    private final Activity activity;
    private final UiKit ui;
    private final Function<String,String> value;
    private final BiConsumer<String,String> change;
    private final LinearLayout content;
    private final SharedPreferences diagnostics;
    private final SharedPreferences.OnSharedPreferenceChangeListener listener;
    IslandDownloadChannelEditor(Activity activity,UiKit ui,Function<String,String> value,BiConsumer<String,String> change){
        this.activity=activity;this.ui=ui;this.value=value;this.change=change;
        listener=(prefs,key)->{if(IslandDownloadConfig.DISCOVERED.equals(key))activity.runOnUiThread(this::render);};
        diagnostics=activity.getSharedPreferences(AppConfig.DIAGNOSTICS,0);
        content=new LinearLayout(activity);content.setOrientation(LinearLayout.VERTICAL);content.setTag("island-download-channels");
        content.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){
            public void onViewAttachedToWindow(View view){diagnostics.registerOnSharedPreferenceChangeListener(listener);render();}
            public void onViewDetachedFromWindow(View view){diagnostics.unregisterOnSharedPreferenceChangeListener(listener);}
        });render();
    }
    View view(){return content;}
    private void render(){
        if(activity.isDestroyed())return;
        int user=Process.myUid()/100000;Map<String,String> channels=new LinkedHashMap<>();
        Set<String> selected=IslandDownloadConfig.selected(value.apply(IslandDownloadConfig.CHANNELS));
        try{
            JSONObject root=new JSONObject(diagnostics.getString(IslandDownloadConfig.DISCOVERED,"{}"));
            JSONArray rows=root.optJSONArray("channels");
            if(root.optInt("user",-1)==user&&rows!=null)for(int i=0;i<rows.length()&&i<32;i++){
                JSONObject row=rows.optJSONObject(i);if(row==null)continue;
                String key=row.optString("key");String[] parts=IslandDownloadConfig.parts(key);
                if(parts!=null&&Integer.parseInt(parts[0])==user)channels.put(key,row.optString("name",parts[2]));
            }
        }catch(org.json.JSONException ignored){/* Empty discovery state is normal before the first progress notification. */}
        for(String key:selected){String[] parts=IslandDownloadConfig.parts(key);
            if(parts!=null&&Integer.parseInt(parts[0])==user&&!channels.containsKey(key))channels.put(key,parts[2]);}
        content.removeAllViews();
        content.addView(ui.text(channels.isEmpty()?"尚未发现下载渠道。保持灵动岛开启，发起一次带进度通知的下载后返回选择。"
                :"仅所选渠道的持续进度通知会上岛；同一渠道中的上传等进度任务也会显示。",12,ui.muted,false),ui.margins(0,4,0,8));
        for(Map.Entry<String,String> item:channels.entrySet()){
            String key=item.getKey();String[] parts=IslandDownloadConfig.parts(key);if(parts==null)continue;
            CheckBox box=new CheckBox(activity);ui.styleCheckBox(box);box.setMinHeight(ui.dp(48));box.setMinimumHeight(ui.dp(48));
            box.setText(appLabel(parts[1])+" · "+item.getValue());box.setTextSize(UiKit.compactTextSize(14));
            box.setTag("download-channel:"+key);box.setChecked(selected.contains(key));content.addView(box,ui.wrap());
            box.setOnCheckedChangeListener((button,on)->{
                if(activity.isDestroyed()||!content.isShown()||!ConfigSchema.truthy(value.apply(SystemUiOptions.ISLAND))
                        ||!ConfigSchema.truthy(value.apply(IslandDownloadConfig.ENABLED)))return;
                Set<String> next=IslandDownloadConfig.selected(value.apply(IslandDownloadConfig.CHANNELS));
                if(on)next.add(key);else next.remove(key);
                String normalized=IslandDownloadConfig.normalize(String.join(",",next));
                if(normalized==null){box.setChecked(false);Toast.makeText(activity,"最多选择 32 个通知渠道",Toast.LENGTH_SHORT).show();return;}
                change.accept(IslandDownloadConfig.CHANNELS,normalized);
            });
        }
    }
    private String appLabel(String pkg){try{return activity.getPackageManager().getApplicationLabel(
            activity.getPackageManager().getApplicationInfo(pkg,0)).toString();}catch(android.content.pm.PackageManager.NameNotFoundException absent){return pkg;}}
}
