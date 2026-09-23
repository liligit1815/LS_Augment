package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Base64;
import android.view.accessibility.AccessibilityNodeInfo;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

/** Enter Unicode through the real tile EditText accessibility input action. */
public final class UiTextRunner extends Instrumentation {
    private Bundle arguments;
    @Override public void onCreate(Bundle args) { super.onCreate(args); arguments=args; start(); }
    @Override public void onStart() {
        Bundle result=new Bundle();
        try {
            UiAutomation automation=getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES);
            AccessibilityNodeInfo root=automation.getRootInActiveWindow();
            if(root==null || !"ls.augment.com".contentEquals(root.getPackageName())
                    || root.findAccessibilityNodeInfosByText("快捷磁贴").isEmpty()) {
                throw new IllegalStateException("The module tile settings must be foreground");
            }
            ArrayList<AccessibilityNodeInfo> fields=new ArrayList<>();collect(root,fields);
            int index=Integer.parseInt(arguments.getString("fieldIndex"));
            String value=new String(Base64.decode(arguments.getString("textBase64"),Base64.DEFAULT),StandardCharsets.UTF_8);
            if(fields.size()!=2 || index<0 || index>1 || value.codePointCount(0,value.length())>200) {
                throw new IllegalArgumentException("Unexpected tile field or test text");
            }
            Bundle action=new Bundle();
            action.putCharSequence(AccessibilityNodeInfo.ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE,value);
            if(!fields.get(index).performAction(AccessibilityNodeInfo.ACTION_SET_TEXT,action)) {
                throw new IllegalStateException("Android rejected the input action");
            }
            SystemClock.sleep(800);fields.get(index).refresh();
            result.putString("actual",String.valueOf(fields.get(index).getText()));
            result.putString("status","pass");finish(Activity.RESULT_OK,result);
        } catch(Throwable error) {
            result.putString("status","fail");result.putString("error",android.util.Log.getStackTraceString(error));
            finish(Activity.RESULT_CANCELED,result);
        }
    }
    private static void collect(AccessibilityNodeInfo node,ArrayList<AccessibilityNodeInfo> fields) {
        if(node.isVisibleToUser() && "android.widget.EditText".contentEquals(node.getClassName()))fields.add(node);
        for(int i=0;i<node.getChildCount();i++) {
            AccessibilityNodeInfo child=node.getChild(i);if(child!=null)collect(child,fields);
        }
    }
}
