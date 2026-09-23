package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.app.KeyguardManager;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.PowerManager;
import android.os.SystemClock;
import android.accessibilityservice.AccessibilityServiceInfo;
import android.graphics.Rect;
import android.os.Bundle;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityWindowInfo;
import android.view.accessibility.AccessibilityEvent;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/** Independent observer APK: never restarts the module's config-provider process. */
public final class UiWindowRunner extends Instrumentation {
    private Bundle arguments;
    @Override public void onCreate(Bundle arguments) {super.onCreate(arguments);this.arguments=arguments;start();}
    @Override public void onStart() {
        Bundle result=new Bundle();
        try {
            UiAutomation automation=getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES);
            AccessibilityServiceInfo info=automation.getServiceInfo();
            info.flags|=AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS
                    |AccessibilityServiceInfo.FLAG_INCLUDE_NOT_IMPORTANT_VIEWS|AccessibilityServiceInfo.FLAG_REPORT_VIEW_IDS;
            automation.setServiceInfo(info);android.os.SystemClock.sleep(600);
            JSONArray events=new JSONArray(),samples=new JSONArray();
            long duration=Math.max(0,Math.min(60000,Long.parseLong(arguments.getString("observeMillis","0"))));
            if(duration>0){
                automation.setOnAccessibilityEventListener(event->{
                    if(event.getEventType()!=AccessibilityEvent.TYPE_VIEW_TEXT_CHANGED
                            ||!"com.android.systemui".contentEquals(String.valueOf(event.getPackageName())))return;
                    try{
                        AccessibilityNodeInfo source=event.getSource();String id=source==null?"":String.valueOf(source.getViewIdResourceName());
                        String text=event.getText().toString();
                        if(!id.contains("clock")&&!id.endsWith("/am_pm")&&!text.contains("°C")&&!text.contains("mA")&&!text.matches(".*[0-9.]+[VW].*"))return;
                        synchronized(events){events.put(new JSONObject().put("eventUptimeMs",event.getEventTime()).put("receivedUptimeMs",SystemClock.uptimeMillis()).put("id",id).put("text",text));}
                    }catch(Exception ignored){ }
                });
                BatteryManager battery=getTargetContext().getSystemService(BatteryManager.class);
                PowerManager power=getTargetContext().getSystemService(PowerManager.class);
                KeyguardManager keyguard=getTargetContext().getSystemService(KeyguardManager.class);
                ArrayList<AccessibilityNodeInfo> chargeAreas=new ArrayList<>();
                for(AccessibilityWindowInfo window:automation.getWindows()){
                    AccessibilityNodeInfo root=window.getRoot();if(root!=null)chargeAreas.addAll(root.findAccessibilityNodeInfosByViewId("com.android.systemui:id/keyguard_indication_area"));
                }
                long deadline=SystemClock.elapsedRealtime()+duration;
                while(SystemClock.elapsedRealtime()<deadline){
                    Intent state=getTargetContext().registerReceiver(null,new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
                    JSONObject sample=new JSONObject().put("at",System.currentTimeMillis()).put("uptimeMs",SystemClock.uptimeMillis())
                            .put("currentMicroamps",battery.getIntProperty(BatteryManager.BATTERY_PROPERTY_CURRENT_NOW))
                            .put("interactive",power.isInteractive()).put("locked",keyguard.isKeyguardLocked());
                    if(state!=null)sample.put("temperatureTenthsC",state.getIntExtra(BatteryManager.EXTRA_TEMPERATURE,Integer.MIN_VALUE))
                            .put("voltageMillivolts",state.getIntExtra(BatteryManager.EXTRA_VOLTAGE,0)).put("plugged",state.getIntExtra(BatteryManager.EXTRA_PLUGGED,0));
                    JSONArray texts=new JSONArray();for(AccessibilityNodeInfo area:chargeAreas)chargeTexts(area,texts,0);sample.put("chargeTexts",texts);
                    samples.put(sample);SystemClock.sleep(200);
                }
                automation.setOnAccessibilityEventListener(null);
            }
            JSONArray windows=new JSONArray();
            for(AccessibilityWindowInfo window:automation.getWindows()) {
                Rect bounds=new Rect();window.getBoundsInScreen(bounds);
                windows.put(new JSONObject().put("id",window.getId()).put("type",window.getType())
                        .put("title",String.valueOf(window.getTitle())).put("active",window.isActive()).put("focused",window.isFocused())
                        .put("bounds",bounds.toShortString()).put("root",node(window.getRoot(),0)));
            }
            String label=arguments.getString("label");
            if(label==null||!label.matches("[A-Za-z0-9_.-]+"))throw new IllegalArgumentException("Invalid evidence label");
            File directory=new File(getTargetContext().getFilesDir(),"ui-windows");directory.mkdirs();
            JSONObject report=new JSONObject().put("at",System.currentTimeMillis()).put("uiWindows",windows).put("textEvents",events).put("batterySamples",samples).put("status","pass");
            Files.write(new File(directory,label+".json").toPath(),report.toString(2).getBytes(StandardCharsets.UTF_8));
            result.putString("status","pass");finish(Activity.RESULT_OK,result);
        }catch(Throwable error){result.putString("status","fail");result.putString("error",android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,result);}
    }
    private static void chargeTexts(AccessibilityNodeInfo node,JSONArray texts,int depth){
        if(node==null||depth>5||!node.refresh())return;
        String value=String.valueOf(node.getText());
        if(node.isVisibleToUser()&&(value.contains("°C")||value.contains("mA")||value.matches(".*[0-9.]+[VW].*")))texts.put(value);
        for(int i=0;i<node.getChildCount();i++)chargeTexts(node.getChild(i),texts,depth+1);
    }
    private static JSONObject node(AccessibilityNodeInfo node,int depth)throws Exception {
        if(node==null||depth>35)return new JSONObject();
        Rect bounds=new Rect();node.getBoundsInScreen(bounds);
        JSONObject value=new JSONObject().put("package",String.valueOf(node.getPackageName()))
                .put("id",String.valueOf(node.getViewIdResourceName())).put("class",String.valueOf(node.getClassName()))
                .put("text",String.valueOf(node.getText())).put("description",String.valueOf(node.getContentDescription()))
                .put("clickable",node.isClickable()).put("checkable",node.isCheckable()).put("checked",node.isChecked())
                .put("enabled",node.isEnabled()).put("focusable",node.isFocusable()).put("focused",node.isFocused())
                .put("scrollable",node.isScrollable()).put("longClickable",node.isLongClickable()).put("password",node.isPassword())
                .put("selected",node.isSelected()).put("visible",node.isVisibleToUser()).put("bounds",bounds.toShortString());
        JSONArray children=new JSONArray();for(int i=0;i<node.getChildCount();i++)children.put(node(node.getChild(i),depth+1));
        return value.put("children",children);
    }
}
