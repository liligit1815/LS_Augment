package ls.augment.com.hook;

import android.app.Notification;
import android.app.PendingIntent;
import android.app.RemoteInput;
import android.content.ClipData;
import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.provider.Telephony;
import android.service.notification.StatusBarNotification;
import android.text.InputFilter;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.*;
import java.util.*;
import ls.augment.com.IslandVisualSpec;
import ls.augment.com.IslandMessageCode;

/** Source actions live only as long as their notification, current user and visible panel. */
final class IslandMessageControls {
    private static final long CODE_LIFETIME=5*60_000L;
    private static final Map<List<?>,String> drafts=new LinkedHashMap<>();
    private static final Map<List<?>,Long> receipts=new LinkedHashMap<>();
    private static IslandMessageControls editing;
    private final LinearLayout row;
    private final Context context;
    private final Button action;
    private final View messageBody,sourceActions;
    private int bodyVisibility,buttonsVisibility;
    private final TextView number;
    private final Runnable expire=this::showAction;
    private StatusBarNotification source;
    private List<?> conversation;
    private PopupWindow popup;
    private View.OnLayoutChangeListener reposition;
    private EditText input;
    private boolean submitted,discardDraft;
    private long expires;
    private String codeKind;

    IslandMessageControls(LinearLayout parent,View body,View buttons){
        context=parent.getContext();messageBody=body;sourceActions=buttons;
        row=new LinearLayout(context);row.setOrientation(LinearLayout.VERTICAL);
        number=new TextView(context);number.setTextSize(30);number.setTypeface(Typeface.MONOSPACE,Typeface.BOLD);
        number.setTextColor(IslandVisualSpec.PRIMARY);row.addView(number);
        action=button("");row.addView(action,new LinearLayout.LayoutParams(-1,-2));
        row.setVisibility(View.GONE);parent.addView(row,new LinearLayout.LayoutParams(-1,-2));
        row.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){
            public void onViewAttachedToWindow(View v){showAction();}
            public void onViewDetachedFromWindow(View v){closeEditor();row.removeCallbacks(expire);}
        });
    }
    private Button button(String label){
        Button b=new Button(context);b.setAllCaps(false);b.setText(label);b.setMinHeight(dp(48));
        Native12IslandStyle.action(b);b.setTextColor(IslandVisualSpec.PRIMARY);return b;
    }
    private int dp(int n){return Native12IslandStyle.dp(context,n);}
    private static List<?> identity(StatusBarNotification n){
        String shortcut=n.getNotification().getShortcutId();
        CharSequence conversationTitle=n.getNotification().extras.getCharSequence(Notification.EXTRA_CONVERSATION_TITLE);
        String title=conversationTitle==null?null:conversationTitle.toString().trim();
        return Arrays.asList(n.getUserId(),n.getUid(),n.getPackageName(),n.getKey(),shortcut,
                shortcut==null?(title==null?DuoCompactText.senderOrTitle(n.getNotification(),""):title):"");
    }
    static Notification.Action reply(StatusBarNotification n){
        if(n==null||n.getNotification()==null||n.getNotification().extras==null||n.getNotification().actions==null||n.getUserId()<0)return null;
        try{return ownedReply(n);}catch(RuntimeException unreadable){return null;}
    }
    private static Notification.Action ownedReply(StatusBarNotification n){
        Notification.Action chosen=null;
        for(Notification.Action a:n.getNotification().actions){
            if(a==null||a.actionIntent==null||a.isAuthenticationRequired()||a.actionIntent.isImmutable()
                    ||a.actionIntent.getCreatorUid()!=n.getUid()||!n.getPackageName().equals(a.actionIntent.getCreatorPackage())
                    ||!(a.getSemanticAction()==Notification.Action.SEMANTIC_ACTION_REPLY
                    ||Notification.CATEGORY_MESSAGE.equals(n.getNotification().category)
                    ||n.getNotification().extras.containsKey(Notification.EXTRA_MESSAGES)))continue;
            if(freeInput(a)==null)continue;
            if(chosen!=null)return null;
            chosen=a;
        }
        return chosen;
    }
    private static RemoteInput freeInput(Notification.Action a){
        RemoteInput selected=null;
        if(a.getRemoteInputs()!=null)for(RemoteInput i:a.getRemoteInputs())if(i!=null&&i.getAllowFreeFormInput()){
            if(selected!=null||i.getResultKey()==null||i.getResultKey().isEmpty())return null;
            selected=i;
        }
        return selected;
    }
    void bind(StatusBarNotification next){
        List<?> key=next==null?null:identity(next);
        boolean same=Objects.equals(conversation,key);
        if(popup!=null&&same&&next!=null&&sameAction(source,next)){source=next;return;}
        if(!same||next==null||popup!=null&&!sameAction(source,next))closeEditor();
        if(!same||source==null||next!=null&&source.getPostTime()!=next.getPostTime())submitted=false;
        source=next;conversation=key;
        if(next!=null){bodyVisibility=messageBody.getVisibility();buttonsVisibility=sourceActions.getVisibility();}
        showAction();
    }
    private static boolean sameAction(StatusBarNotification a,StatusBarNotification b){
        Notification.Action first=reply(a),second=reply(b);
        return first!=null&&second!=null&&first.actionIntent.equals(second.actionIntent)
                &&freeInput(first).getResultKey().equals(freeInput(second).getResultKey());
    }
    private String code(StatusBarNotification current){
        if(current==null||current.getUserId()<0)return null;
        boolean sms=false;
        try{sms=current.getPackageName().equals(Telephony.Sms.getDefaultSmsPackage(context));}
        catch(RuntimeException unavailable){/* Other applications can still provide an explicit pickup code. */}
        Notification n=current.getNotification();String raw=DuoCompactText.messageBody(n);
        if(raw.isEmpty())raw=IslandNotificationText.read(current.getPackageName(),n).compact();
        IslandMessageCode found=IslandMessageCode.read(sms,raw);if(found==null)return null;
        String value=found.value;codeKind=found.kind;
        long time=0;
        try{
            android.os.Parcelable[] items=n.extras.getParcelableArray(Notification.EXTRA_MESSAGES);
            if(items!=null){List<Notification.MessagingStyle.Message> messages=Notification.MessagingStyle.Message.getMessagesFromBundleArray(items);
                if(!messages.isEmpty()){long stamp=messages.get(messages.size()-1).getTimestamp();if(stamp>0)time=stamp;}}
        }catch(RuntimeException ignored){}
        List<?> id=Arrays.asList(current.getUserId(),current.getUid(),current.getKey(),time,codeKind,value);
        long now=System.currentTimeMillis();
        expires=IslandMessageCode.deadline(current.getPostTime(),time,receipts.getOrDefault(id,0L),now);
        if(expires==0)return null;receipts.put(id,expires-CODE_LIFETIME);trim(receipts,64);
        return now<expires?value:null;
    }
    private void showAction(){
        row.removeCallbacks(expire);action.setOnClickListener(null);number.setVisibility(View.GONE);
        row.setVisibility(View.GONE);
        if(source==null)return;
        String value=code(source);
        if(value!=null){
            messageBody.setVisibility(View.GONE);sourceActions.setVisibility(View.GONE);
            number.setText(value);number.setVisibility(View.VISIBLE);
            action.setText("复制"+codeKind);action.setEnabled(true);row.setVisibility(View.VISIBLE);
            action.setOnClickListener(v->{
                StatusBarNotification live=DynamicIslandHook.actionSource(source);
                if(live==null||!value.equals(code(live))){showAction();return;}
                ClipboardManager clipboard=context.getSystemService(ClipboardManager.class);
                if(clipboard==null)return;
                ClipData clip=ClipData.newPlainText(codeKind,value);
                PersistableBundle extras=new PersistableBundle();extras.putBoolean(ClipDescription.EXTRA_IS_SENSITIVE,true);
                clip.getDescription().setExtras(extras);
                try{clipboard.setPrimaryClip(clip);action.setText("已复制");}catch(RuntimeException denied){action.setText("复制失败，重试");}
            });
            row.postDelayed(expire,Math.max(1,expires-System.currentTimeMillis()));return;
        }
        messageBody.setVisibility(bodyVisibility);sourceActions.setVisibility(buttonsVisibility);
        number.setText("");
        if(reply(source)==null)return;
        row.setVisibility(View.VISIBLE);action.setEnabled(!submitted);
        action.setText(submitted?"已交给应用":drafts.containsKey(conversation)?"继续草稿":"回复…");
        action.setOnClickListener(v->openEditor());
    }
    static boolean holds(StatusBarNotification n){return editing!=null&&editing.popup!=null&&n!=null&&Objects.equals(editing.conversation,identity(n));}
    static boolean inside(View root){
        if(editing==null||root==null)return false;
        for(View v=editing.row;v!=null;v=v.getParent() instanceof View?(View)v.getParent():null)if(v==root)return true;
        return false;
    }
    static boolean editing(){return editing!=null&&editing.popup!=null;}
    static void privacyReset(){if(editing!=null){editing.discardDraft=true;editing.closeEditor();}drafts.clear();receipts.clear();}
    private void openEditor(){
        StatusBarNotification live=DynamicIslandHook.actionSource(source);
        if(submitted||popup!=null||live==null||!sameAction(source,live)||!action.isShown())return;
        if(editing!=null)editing.closeEditor();
        LinearLayout box=new LinearLayout(context);box.setOrientation(LinearLayout.VERTICAL);box.setPadding(dp(12),dp(6),dp(12),dp(8));
        GradientDrawable background=new GradientDrawable();background.setColor(android.graphics.Color.BLACK);background.setCornerRadius(dp(16));box.setBackground(background);
        input=new EditText(context);input.setTextColor(IslandVisualSpec.PRIMARY);input.setHintTextColor(IslandVisualSpec.SECONDARY);
        input.setHint("回复 "+DuoCompactText.senderOrTitle(source.getNotification(),""));input.setMaxLines(3);
        input.setImeOptions(android.view.inputmethod.EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING);
        input.setFilters(new InputFilter[]{new InputFilter.LengthFilter(4096)});input.setText(drafts.getOrDefault(conversation,""));
        input.setSelection(input.length());box.addView(input,new LinearLayout.LayoutParams(-1,-2));
        LinearLayout bar=new LinearLayout(context);
        Button cancel=button("收起输入"),send=button("发送");
        send.setEnabled(input.length()>0);
        input.addTextChangedListener(new android.text.TextWatcher(){
            public void beforeTextChanged(CharSequence s,int start,int count,int after){}
            public void afterTextChanged(android.text.Editable s){}
            public void onTextChanged(CharSequence s,int start,int before,int count){send.setEnabled(!submitted&&!s.toString().trim().isEmpty());}
        });
        bar.addView(cancel,new LinearLayout.LayoutParams(0,-2,1));bar.addView(send,new LinearLayout.LayoutParams(0,-2,1));box.addView(bar);
        PopupWindow window=new PopupWindow(box,Math.max(1,row.getWidth()),ViewGroup.LayoutParams.WRAP_CONTENT,true);
        window.setBackgroundDrawable(background);window.setOutsideTouchable(true);
        window.setInputMethodMode(PopupWindow.INPUT_METHOD_NEEDED);window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        discardDraft=false;popup=window;editing=this;
        window.setOnDismissListener(()->{
            if(popup!=window)return;
            if(!submitted&&!discardDraft&&input.length()>0){drafts.put(conversation,input.getText().toString());trim(drafts,12);}else drafts.remove(conversation);
            if(reposition!=null){action.removeOnLayoutChangeListener(reposition);reposition=null;}
            action.setMinHeight(dp(48));action.setTextColor(IslandVisualSpec.PRIMARY);
            popup=null;input=null;if(editing==this)editing=null;showAction();DynamicIslandHook.editorClosed();
        });
        cancel.setOnClickListener(v->closeEditor());
        send.setOnClickListener(v->{
            if(submitted||popup!=window||input.getText().toString().trim().isEmpty())return;
            StatusBarNotification current=DynamicIslandHook.actionSource(source);
            if(current==null||!sameAction(live,current)){send.setText("操作已失效");return;}
            Notification.Action a=reply(current);RemoteInput field=freeInput(a);
            Intent fill=new Intent();Bundle result=new Bundle();result.putCharSequence(field.getResultKey(),input.getText().toString());
            RemoteInput.addResultsToIntent(a.getRemoteInputs(),fill,result);RemoteInput.setResultsSource(fill,RemoteInput.SOURCE_FREE_FORM_INPUT);
            try{send.setEnabled(false);a.actionIntent.send(context,0,fill);submitted=true;drafts.remove(conversation);closeEditor();}
            catch(PendingIntent.CanceledException|RuntimeException failure){send.setEnabled(true);send.setText("重试发送");}
        });
        try{
            box.measure(View.MeasureSpec.makeMeasureSpec(Math.max(1,row.getWidth()),View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
            action.setMinHeight(Math.max(dp(48),box.getMeasuredHeight()));
            reposition=(v,l,t,r,b,ol,ot,or,ob)->{if(popup==window&&window.isShowing())window.update(action,0,-action.getHeight(),action.getWidth(),-1);};
            action.addOnLayoutChangeListener(reposition);
            window.showAsDropDown(action,0,-action.getHeight(),Gravity.START);input.requestFocus();
            action.setTextColor(android.graphics.Color.TRANSPARENT);
            DynamicIslandHook.editorLayoutChanged();
            InputMethodManager ime=context.getSystemService(InputMethodManager.class);
            if(ime!=null)input.post(()->{if(input!=null&&popup==window)ime.showSoftInput(input,InputMethodManager.SHOW_IMPLICIT);});
        }catch(RuntimeException missing){if(window.isShowing())window.dismiss();else{
            if(reposition!=null)action.removeOnLayoutChangeListener(reposition);reposition=null;action.setMinHeight(dp(48));
            popup=null;input=null;editing=null;DynamicIslandHook.editorClosed();}}
    }
    private void closeEditor(){if(popup!=null)popup.dismiss();}
    private static void trim(Map<?,?> values,int limit){while(values.size()>limit)values.remove(values.keySet().iterator().next());}
}
