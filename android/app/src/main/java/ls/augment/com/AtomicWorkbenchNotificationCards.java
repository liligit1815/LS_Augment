package ls.augment.com;

import android.app.Dialog;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.function.Consumer;

/** Shared-UiKit pages for actual public timers/stopwatches and the backend's local timer records. */
final class AtomicWorkbenchNotificationCards implements AutoCloseable {
    interface RecordAction {void record(Bundle request,Consumer<Bundle> reply);}
    interface SourceAction {void run(String operation,Bundle request,Consumer<Bundle> reply);}
    private final UiKit ui;
    private final RecordAction recorder;
    private final SourceAction sourceAction;
    private final Runnable changed;
    private final Handler main=new Handler(Looper.getMainLooper());
    private final AtomicWorkbenchNotificationCardsModel model=new AtomicWorkbenchNotificationCardsModel();
    private final Map<String,Card> rows=new LinkedHashMap<>();
    private final Runnable tick=this::tick;
    private boolean active,closed;
    private long lifecycle;
    private Dialog history;
    private String historySource;
    private LinearLayout historyBody;
    private List<AtomicWorkbenchNotificationCardData.Record> historyRows=List.of();
    AtomicWorkbenchNotificationCards(UiKit ui,RecordAction recorder,Runnable onChanged){this(ui,recorder,null,onChanged);}
    AtomicWorkbenchNotificationCards(UiKit ui,RecordAction recorder,SourceAction sourceAction,Runnable onChanged){
        if(ui==null)throw new IllegalArgumentException("missing_notification_ui");this.ui=ui;this.recorder=recorder;this.sourceAction=sourceAction;changed=onChanged;
    }
    /** Capture on dispatch, then carry this token through the asynchronous Root reply. */
    long beginUpdate(){return closed?-1:model.beginUpdate();}
    void apply(Bundle state){apply(state,beginUpdate());}
    void apply(Bundle state,long updateId){
        AtomicWorkbenchNotificationCardData.Snapshot frozen=AtomicWorkbenchNotificationCardData.Snapshot.parse(state,Process.myUid()/100000);
        if(Looper.myLooper()!=Looper.getMainLooper()){main.post(()->applyFrozen(frozen,updateId));return;}applyFrozen(frozen,updateId);
    }
    private void applyFrozen(AtomicWorkbenchNotificationCardData.Snapshot snapshot,long updateId){
        if(closed||!model.apply(snapshot,updateId))return;
        List<AtomicWorkbenchNotificationCardData> data=model.cards();java.util.Set<String> live=new java.util.HashSet<>();
        for(AtomicWorkbenchNotificationCardData d:data){
            live.add(d.id);Card card=rows.get(d.id);if(card==null){card=new Card(d);rows.put(d.id,card);}else {if(card.data.revision!=d.revision)card.sourceUnknown=false;card.data=d;}
            if(snapshot.valid&&snapshot.available&&updateId>card.blockedAfter)card.needsRefresh=false;
        }
        rows.keySet().retainAll(live);
        if(historySource!=null){if(model.source(historySource)==null)closeHistory();else refreshHistory();}
        render();schedule();if(changed!=null)changed.run();
    }
    List<AtomicWorkbenchCardPager.Page> pages(){
        ArrayList<AtomicWorkbenchCardPager.Page> pages=new ArrayList<>();
        for(AtomicWorkbenchNotificationCardData d:model.cards()){Card card=rows.get(d.id);if(card!=null)pages.add(new AtomicWorkbenchCardPager.Page("notification:"+d.id,card.title(),d.appeared,card));}
        return List.copyOf(pages);
    }
    boolean trustedComplete(){return model.complete();}
    boolean currentSource(String id,String generation,long revision){AtomicWorkbenchNotificationCardData d=model.source(id);return !closed&&active&&d!=null&&d.generation.equals(generation)&&d.revision==revision&&d.canOpenAt(SystemClock.elapsedRealtime());}
    void setActive(boolean value){if(closed)return;active=value;if(!active){closeHistory();closeSourceDialog();for(Card card:rows.values())if(card.sourcePending!=null){if(card.sourceSending)card.sourceUnknown=true;card.sourcePending=null;}for(Card card:rows.values())if(card.pending!=null){card.pending=null;card.needsRefresh=true;}}render();schedule();}
    /** The caller also resets Pager notification selection when the Root identity changes. */
    void reset(){lifecycle++;model.reset();rows.clear();closeHistory();closeSourceDialog();main.removeCallbacks(tick);if(changed!=null)changed.run();}
    @Override public void close(){if(closed)return;closed=true;active=false;reset();}
    private void tick(){if(closed||!active)return;render();schedule();}
    private void schedule(){main.removeCallbacks(tick);if(!closed&&active&&!rows.isEmpty())main.postDelayed(tick,250);}
    private void render(){long now=SystemClock.elapsedRealtime();for(Card card:rows.values())card.render(now);refreshSourceDialog(now);}

    private final class Card extends LinearLayout {
        AtomicWorkbenchNotificationCardData data;
        final TextView heading,time,status;
        final LinearLayout actions;
        final Button record,records,sourceOpen,sourceOperations;
        final LinearLayout sourceRow;
        String sourcePending;boolean sourceSending,sourceUnknown;
        final String label;
        String pending;
        boolean needsRefresh;
        long blockedAfter;
        Card(AtomicWorkbenchNotificationCardData data){
            super(ui.activity);this.data=data;label=appLabel(data.pkg);setOrientation(VERTICAL);setPadding(ui.dp(4),0,ui.dp(6),0);
            setTag("atomic-workbench-notification:"+data.id);setMinimumHeight(ui.dp(72));
            heading=ui.text(title(),13,ui.muted,false);heading.setMaxLines(2);heading.setEllipsize(TextUtils.TruncateAt.END);addView(heading,ui.wrap());
            time=ui.text("时间未知",25,ui.text,true);time.setMaxLines(2);time.setTextDirection(View.TEXT_DIRECTION_LTR);time.setTag("atomic-workbench-chronometer-time");
            addView(time,ui.margins(0,4,0,0));
            status=ui.text("",11,ui.muted,false);status.setMaxLines(3);addView(status,ui.margins(0,4,0,0));
            actions=new LinearLayout(ui.activity);actions.setGravity(Gravity.CENTER_VERTICAL);addView(actions,ui.margins(0,6,0,0));
            record=ui.accentButton("记录当前计时");record.setTag("atomic-workbench-timer-record");record.setOnClickListener(view->record(this));
            records=ui.button("查看记录");records.setTag("atomic-workbench-timer-records");records.setOnClickListener(view->showHistory(data.id));
            sourceRow=new LinearLayout(ui.activity);sourceRow.setGravity(Gravity.CENTER_VERTICAL);addView(sourceRow,ui.margins(0,8,0,0));
            sourceOpen=ui.button("打开来源");sourceOpen.setOnClickListener(view->sourceAction(this,"describe_open",null));
            sourceOperations=ui.button("通知操作");sourceOperations.setOnClickListener(view->sourceAction(this,"describe",null));
            layoutSourceActions(0);layoutActions(0);
        }
        String title(){return (data.kind.equals("timer")?"倒计时":"秒表")+" · "+label;}
        @Override protected void onSizeChanged(int width,int height,int oldWidth,int oldHeight){super.onSizeChanged(width,height,oldWidth,oldHeight);if(width!=oldWidth){layoutActions(width);layoutSourceActions(width);}}
        private void layoutSourceActions(int width){
            int measured=width>0?width:ui.activity.getResources().getDisplayMetrics().widthPixels;
            boolean stacked=ui.activity.getResources().getConfiguration().fontScale>1.2f||measured/Math.max(.1f,ui.activity.getResources().getDisplayMetrics().density)<360;
            sourceRow.removeAllViews();sourceRow.setOrientation(stacked?VERTICAL:HORIZONTAL);
            sourceRow.addView(sourceOpen,stacked?new LinearLayout.LayoutParams(-1,-2):new LinearLayout.LayoutParams(0,-2,1));
            LinearLayout.LayoutParams p=stacked?new LinearLayout.LayoutParams(-1,-2):new LinearLayout.LayoutParams(0,-2,1);if(stacked)p.topMargin=ui.dp(8);else p.leftMargin=ui.dp(8);sourceRow.addView(sourceOperations,p);
        }
        private void layoutActions(int width){
            int measured=width>0?width:ui.activity.getResources().getDisplayMetrics().widthPixels;
            float density=ui.activity.getResources().getDisplayMetrics().density;
            boolean stacked=ui.activity.getResources().getConfiguration().fontScale>1.2f||measured/Math.max(.1f,density)<360;
            actions.removeAllViews();actions.setOrientation(stacked?VERTICAL:HORIZONTAL);
            if(recorder!=null&&data.countDown){actions.addView(record,stacked?new LinearLayout.LayoutParams(-1,-2):new LinearLayout.LayoutParams(0,-2,1));}
            LinearLayout.LayoutParams p=stacked?new LinearLayout.LayoutParams(-1,-2):new LinearLayout.LayoutParams(0,-2,1);
            if(recorder!=null&&data.countDown){if(stacked)p.topMargin=ui.dp(6);else p.leftMargin=ui.dp(8);}actions.addView(records,p);
        }
        void render(long now){
            Long value=active?data.timeAt(now):null;String valueText=value==null?"时间未知":AtomicWorkbenchNotificationCardData.format(value);
            if(!valueText.contentEquals(time.getText()))time.setText(valueText);
            String detail=sourceUnknown?"操作结果未确认，请打开来源核对":needsRefresh?"记录结果未确认，请刷新查看":data.status.equals("clock_changed")?"系统时间发生变化，等待来源更新"
                    :value==null?"等待计时来源更新":"秒级计时";
            if(data.full)detail+=" · 已记录 32 次";if(model.limited())detail+=" · 仅显示部分计时来源";status.setText(detail);
            boolean enabled=recorder!=null&&active&&pending==null&&!needsRefresh&&data.canRecordAt(now);
            ui.setButtonEnabled(record,enabled);record.setText(pending==null?"记录当前计时":"正在记录…");
            records.setVisibility(data.records.isEmpty()?View.GONE:View.VISIBLE);records.setText(records.getContext().getString(R.string.status_atomicworkbenchnotificationcards_4 ,String.valueOf(data.records.size())));
            ui.setButtonEnabled(records,active&&!data.records.isEmpty());
            actions.setVisibility(recorder!=null&&data.countDown||!data.records.isEmpty()?View.VISIBLE:View.GONE);
            boolean open=sourceAction!=null&&active&&data.canOpenAt(now),ops=sourceAction!=null&&active&&data.canDescribeAt(now);
            sourceOpen.setVisibility(open?View.VISIBLE:View.GONE);sourceOperations.setVisibility(ops?View.VISIBLE:View.GONE);
            sourceRow.setVisibility(open||ops?View.VISIBLE:View.GONE);ui.setButtonEnabled(sourceOpen,open&&sourcePending==null);ui.setButtonEnabled(sourceOperations,ops&&sourcePending==null);
            setContentDescription(title()+"，"+valueText+"，"+detail);
        }
    }
    private Dialog sourceDialog;
    private AtomicWorkbenchNotificationCardData actionSource;
    private long actionUntil;
    private final List<Button> sourceButtons=new ArrayList<>();
    private void closeSourceDialog(){
        Dialog old=sourceDialog;sourceDialog=null;actionSource=null;actionUntil=0;sourceButtons.clear();if(old!=null)old.dismiss();
    }
    private void refreshSourceDialog(long now){
        if(sourceDialog==null||actionSource==null)return;
        AtomicWorkbenchNotificationCardData current=model.source(actionSource.id);Card card=rows.get(actionSource.id);
        boolean same=current!=null&&current.sameLifetime(actionSource)&&current.revision==actionSource.revision;
        if(!same){closeSourceDialog();return;}
        boolean live=active&&current.canDescribeAt(now)&&now<actionUntil&&card!=null&&card.sourcePending==null;
        for(Button button:sourceButtons)ui.setButtonEnabled(button,live&&Boolean.TRUE.equals(button.getTag()));
    }
    private Bundle sourceRequest(AtomicWorkbenchNotificationCardData source,int index,String actionId,long now,String request){
        Bundle b=new Bundle();b.putInt("schema",1);b.putString("request_id",request);b.putString("source_id",source.id);
        b.putString("source_generation",source.generation);b.putLong("source_revision",source.revision);b.putLong("created_elapsed",now);
        b.putLong("deadline_elapsed",Math.addExact(now,5000));b.putInt("index",index);b.putString("action_id",actionId);return b;
    }
    private void sourceAction(Card card,String operation,AtomicWorkbenchNotificationActionData.Action action){
        AtomicWorkbenchNotificationCardData current=model.source(card.data.id);long now=SystemClock.elapsedRealtime();
        if(closed||!active||sourceAction==null||current==null||rows.get(current.id)!=card||card.sourcePending!=null)return;
        if(operation.equals("describe_open")?!current.canOpenAt(now):!current.canDescribeAt(now))return;
        if(operation.equals("send")&&(action==null||!action.enabled||actionSource==null||!actionSource.sameLifetime(current)
                ||actionSource.revision!=current.revision||now>=actionUntil))return;
        String id=UUID.randomUUID().toString().replace("-","");long epoch=lifecycle;
        Bundle request=sourceRequest(current,action==null?-1:action.index,action==null?"":action.id,now,id);
        card.sourcePending=id;card.sourceSending=operation.equals("send");card.render(now);refreshSourceDialog(now);
        main.postDelayed(()->{
            if(!currentSourceRequest(card,id,epoch))return;card.sourcePending=null;
            if(operation.equals("send"))card.sourceUnknown=true;
            card.render(SystemClock.elapsedRealtime());closeSourceDialog();notice(operation.equals("send")?"操作结果未确认，请打开来源核对；不会自动重发。":"来源信息未确认，请重新打开。");
        },5000);
        try{sourceAction.run(operation,request,reply->main.post(()->{
            if(!currentSourceRequest(card,id,epoch))return;card.sourcePending=null;
            AtomicWorkbenchNotificationCardData live=model.source(current.id);
            if(live==null||!live.sameLifetime(current)||live.revision!=current.revision){closeSourceDialog();card.render(SystemClock.elapsedRealtime());return;}
            if(operation.equals("describe_open")){
                card.render(SystemClock.elapsedRealtime());notice(reply!=null&&reply.getBoolean("success")?"正在工作台打开来源。":"来源入口未确认，请重新打开。");return;
            }
            AtomicWorkbenchNotificationActionData result=AtomicWorkbenchNotificationActionData.parse(reply,current,operation,id,SystemClock.elapsedRealtime());
            if(result==null||SystemClock.elapsedRealtime()>=request.getLong("deadline_elapsed")){
                if(operation.equals("send"))card.sourceUnknown=true;closeSourceDialog();notice("操作结果未确认，请打开来源核对；不会自动重发。");
            }else if(operation.equals("describe")){
                if(result.success)showSourceDialog(card,current,result);else notice("当前通知操作不可用，请打开来源应用。");
            }else{
                card.sourceUnknown=!result.sent;
                if(result.sent)try{sourceAction.run("confirm_sent",new Bundle(request),ignored->{});}catch(RuntimeException ignored){}
                closeSourceDialog();notice(result.sent?"已发送，请以来源实际状态为准。":"操作结果未确认，请打开来源核对；不会自动重发。");
            }
            card.render(SystemClock.elapsedRealtime());
        }));}catch(RuntimeException unavailable){
            if(currentSourceRequest(card,id,epoch)){card.sourcePending=null;if(operation.equals("send"))card.sourceUnknown=true;closeSourceDialog();card.render(now);notice("操作结果未确认，请打开来源核对；不会自动重发。");}
        }
    }
    private boolean currentSourceRequest(Card card,String id,long epoch){return !closed&&lifecycle==epoch&&rows.get(card.data.id)==card&&id.equals(card.sourcePending);}
    private void showSourceDialog(Card card,AtomicWorkbenchNotificationCardData source,AtomicWorkbenchNotificationActionData data){
        closeHistory();closeSourceDialog();LinearLayout body=new LinearLayout(ui.activity);body.setOrientation(LinearLayout.VERTICAL);
        boolean found=false;
        for(AtomicWorkbenchNotificationActionData.Action action:data.actions){
            if(action.label.isEmpty())continue;found=true;
            Button button=ui.button(action.label);button.setTag(action.enabled);button.setOnClickListener(view->sourceAction(card,"send",action));
            body.addView(button,ui.margins(0,sourceButtons.isEmpty()?0:8,0,0));sourceButtons.add(button);
            if(!action.enabled){TextView reason=ui.text(actionReason(action.status),12,ui.muted,false);body.addView(reason,ui.margins(0,4,0,0));}
        }
        if(!found){notice("来源没有公开通知操作，请打开来源应用。");sourceButtons.clear();return;}
        if(data.limited)body.addView(ui.text("仅显示前 8 项公开操作。",12,ui.muted,false),ui.margins(0,8,0,0));
        actionSource=source;actionUntil=data.until;
        try{sourceDialog=ui.glassDialog("通知公开操作",body,"关闭",null,null);}catch(RuntimeException unavailable){closeSourceDialog();notice("暂时无法显示通知操作。");return;}
        Dialog shown=sourceDialog;shown.setOnDismissListener(ignored->{if(sourceDialog==shown){sourceDialog=null;actionSource=null;actionUntil=0;sourceButtons.clear();}});
        refreshSourceDialog(SystemClock.elapsedRealtime());
    }
    private String actionReason(String status){
        return switch(status){
            case "remote_input_required"->"此操作需要输入，请在来源应用中处理。";
            case "open_source_required"->"此操作需要打开界面，请使用“打开来源”。";
            case "already_requested"->"本次操作结果尚待来源确认，不会重复发送。";
            case "creator_mismatch"->"无法确认此操作属于当前通知来源。";
            case "capacity_limited"->"当前操作数量已达上限，请稍后重新打开。";
            default->"当前通知操作不可用。";
        };
    }

    private void record(Card card){
        AtomicWorkbenchNotificationCardData current=model.source(card.data.id);long now=SystemClock.elapsedRealtime();
        if(closed||!active||recorder==null||rows.get(card.data.id)!=card||current==null||card.pending!=null||card.needsRefresh||!current.canRecordAt(now))return;
        long epoch=lifecycle,update=beginUpdate(),deadline=now+5000;String requestId=UUID.randomUUID().toString().replace("-","");
        Bundle request=new Bundle();request.putInt("schema",1);request.putString("request_id",requestId);request.putString("source_id",current.id);
        request.putString("source_generation",current.generation);request.putLong("source_revision",current.revision);request.putLong("created_elapsed",now);request.putLong("deadline_elapsed",deadline);
        card.pending=requestId;card.blockedAfter=update;card.render(now);
        main.postDelayed(()->{if(currentRequest(card,requestId,epoch)){card.pending=null;card.needsRefresh=true;card.render(SystemClock.elapsedRealtime());notice("记录结果未确认，请刷新查看");}},5000);
        try{recorder.record(request,reply->{
            AtomicWorkbenchNotificationCardData.Snapshot frozen=AtomicWorkbenchNotificationCardData.Snapshot.parse(reply,Process.myUid()/100000);
            main.post(()->{
                if(!currentRequest(card,requestId,epoch))return;
                // Handler delays use uptime, while the signed request uses elapsed time.
                // Sleep must not extend this UI request's five-second acknowledgement lease.
                if(SystemClock.elapsedRealtime()>=deadline){
                    card.pending=null;card.needsRefresh=true;card.render(SystemClock.elapsedRealtime());notice("记录结果未确认，请刷新查看");return;
                }
                card.pending=null;card.needsRefresh=!frozen.stored;applyFrozen(frozen,update);card.render(SystemClock.elapsedRealtime());
                notice(frozen.stored?"已记录当前计时":"记录结果未确认，请刷新查看");
            });
        });}catch(RuntimeException unavailable){if(currentRequest(card,requestId,epoch)){card.pending=null;card.needsRefresh=true;card.render(now);notice("记录结果未确认，请刷新查看");}}
    }
    private boolean currentRequest(Card card,String id,long epoch){return !closed&&lifecycle==epoch&&rows.get(card.data.id)==card&&id.equals(card.pending);}
    private String appLabel(String pkg){
        String label=pkg;try{CharSequence text=ui.activity.getPackageManager().getApplicationLabel(ui.activity.getPackageManager().getApplicationInfo(pkg,0));if(text!=null&&!text.toString().isBlank())label=text.toString();}catch(Exception unavailable){/* Package identity remains readable. */}
        StringBuilder clean=new StringBuilder();for(int n=0;n<label.length()&&clean.length()<88;n++)clean.append(Character.isISOControl(label.charAt(n))?' ':label.charAt(n));return clean.toString();
    }
    private void showHistory(String id){
        AtomicWorkbenchNotificationCardData data=model.source(id);if(closed||!active||data==null||data.records.isEmpty())return;
        closeHistory();historySource=id;historyBody=new LinearLayout(ui.activity);historyBody.setOrientation(LinearLayout.VERTICAL);historyRows=List.of();refreshHistory();
        Dialog dialog;try{dialog=ui.glassDialog("本次工作台记录",historyBody,"知道了",null,null);}catch(RuntimeException unavailable){closeHistory();notice("暂时无法显示记录");return;}history=dialog;
        dialog.setOnDismissListener(ignored->{if(history==dialog){history=null;historyBody=null;historySource=null;historyRows=List.of();}});
    }
    private void refreshHistory(){
        AtomicWorkbenchNotificationCardData data=model.source(historySource);if(historyBody==null||data==null)return;
        boolean same=data.records.size()==historyRows.size();if(same)for(int n=0;n<data.records.size();n++){
            AtomicWorkbenchNotificationCardData.Record a=data.records.get(n),b=historyRows.get(n);if(a.number!=b.number||a.time!=b.time||a.sample!=b.sample){same=false;break;}}
        if(same)return;historyRows=data.records;historyBody.removeAllViews();
        for(AtomicWorkbenchNotificationCardData.Record r:data.records){
            LinearLayout row=ui.groupRow();TextView number=ui.text("第 "+r.number+" 次",13,ui.muted,false);row.addView(number,new LinearLayout.LayoutParams(-2,-2));
            TextView value=ui.text(AtomicWorkbenchNotificationCardData.format(r.time),16,ui.text,true);value.setMaxLines(2);value.setGravity(Gravity.END);
            LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(0,-2,1);p.leftMargin=ui.dp(12);row.addView(value,p);historyBody.addView(row,ui.wrap());
        }
    }
    private void closeHistory(){Dialog old=history;history=null;historySource=null;historyBody=null;historyRows=List.of();if(old!=null)old.dismiss();}
    private void notice(String value){if(!closed)Toast.makeText(ui.activity,value,Toast.LENGTH_LONG).show();}
}
