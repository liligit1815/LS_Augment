package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.content.ComponentName;
import android.os.Handler;
import android.os.Looper;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.concurrent.Executor;
import java.util.function.BooleanSupplier;

/** Shared UiKit dialog; all changes are implemented by the phone's exact reference-management API. */
final class AtomicWorkbenchTaskReferenceControls implements AutoCloseable {
    private final Activity activity;
    private final UiKit ui;
    private final Executor executor;
    private final AtomicWorkbenchTaskReferenceUiState.Transport transport;
    private final BooleanSupplier gate;
    private final AtomicWorkbenchTaskReferenceUiState state;
    private final AtomicWorkbenchTaskReferenceUiState.Scope scope;
    private final Runnable changed;
    private final Handler main=new Handler(Looper.getMainLooper());
    private final LinearLayout body, rows;
    private final TextView status;
    private final Button refresh;
    private final Runnable observe=this::observe;
    private Dialog dialog, confirmation;
    private volatile boolean closed;
    private boolean readAfterFlight;
    private long rendered=-1;

    static AtomicWorkbenchTaskReferenceControls show(Activity activity,UiKit ui,Executor executor,
            AtomicWorkbenchTaskReferenceUiState.Transport transport,BooleanSupplier gate,
            AtomicWorkbenchTaskReferenceUiState state,Object connection,long session,long reset,Runnable changed) {
        return new AtomicWorkbenchTaskReferenceControls(activity,ui,executor,transport,gate,state,
                state.bind(connection,session,reset),changed);
    }
    private AtomicWorkbenchTaskReferenceControls(Activity activity,UiKit ui,Executor executor,
            AtomicWorkbenchTaskReferenceUiState.Transport transport,BooleanSupplier gate,
            AtomicWorkbenchTaskReferenceUiState state,AtomicWorkbenchTaskReferenceUiState.Scope scope,Runnable changed) {
        this.activity=activity; this.ui=ui; this.executor=executor; this.transport=transport; this.gate=gate;
        this.state=state; this.scope=scope; this.changed=changed;
        body=new LinearLayout(activity); body.setOrientation(LinearLayout.VERTICAL);
        status=ui.text("正在读取暂存记录…",13,ui.muted,false); status.setAccessibilityLiveRegion(android.view.View.ACCESSIBILITY_LIVE_REGION_POLITE);
        body.addView(status,ui.wrap());
        refresh=ui.tonalButton("刷新并核实结果"); refresh.setMinimumHeight(ui.dp(48));
        body.addView(refresh,ui.margins(0,8,0,8)); refresh.setOnClickListener(view->start(null));
        rows=new LinearLayout(activity); rows.setOrientation(LinearLayout.VERTICAL); body.addView(rows,ui.wrap());
        dialog=ui.glassDialog("管理暂存记录",body,null,null,"关闭");
        dialog.setOnDismissListener(ignored->close());
        start(null);
    }
    private boolean live() {
        if(closed || activity.isFinishing() || activity.isDestroyed() || !state.current(scope)) return false;
        try { return gate.getAsBoolean(); } catch(RuntimeException unavailable) { return false; }
    }
    private void start(AtomicWorkbenchTaskReferenceUiState.Selection selection) {
        if(!live()) { close(); return; }
        var work=state.begin(scope,selection);
        if(work!=null) {
            readAfterFlight=false;
            try { executor.execute(()->state.run(work,transport,this::live)); }
            catch(RuntimeException unavailable) { state.rejected(work); }
        } else if(selection==null && state.view(scope).busy) readAfterFlight=true;
        observe();
    }
    private void observe() {
        main.removeCallbacks(observe);
        if(!live()) { close(); return; }
        var view=state.view(scope);
        if(!view.busy && readAfterFlight) { readAfterFlight=false; start(null); return; }
        if(rendered!=view.version) {
            rendered=view.version; render(view);
            if(!view.busy && changed!=null) changed.run();
        }
        if(view.busy) main.postDelayed(observe,150L);
    }
    private void render(AtomicWorkbenchTaskReferenceUiState.ViewState value) {
        String summary=value.notice;
        if(value.snapshot!=null) summary+="\n记录 "+value.snapshot.totalCount+" · 待核实 "+value.snapshot.pendingCount
                +" · 已暂存 "+value.snapshot.heldCount+"\n记录上限 64，待处理上限 16";
        if(!value.available && value.snapshot!=null) summary+="\n以上为上次信息，暂不允许清理。";
        if(value.unconfirmed>0) summary+="\n还有 "+value.unconfirmed+" 次操作结果未确认；刷新会逐一核实。";
        if(value.unconfirmed>=AtomicWorkbenchTaskReferenceUiState.MAX_UNCONFIRMED)
            summary+="\n未确认操作已达上限，请先刷新核实结果，再清理记录。";
        if(value.supersededUnknown>0) summary+="\n另有 "+value.supersededUnknown+" 次先前请求结果未知，对应记录已由后续操作确认移除。";
        status.setText(summary); refresh.setEnabled(!value.busy); rows.removeAllViews();
        if(value.snapshot==null) return;
        if(value.snapshot.entries.isEmpty()) {
            rows.addView(ui.text(value.available?"当前没有暂存记录。":"当前记录尚未核实。",14,ui.muted,false),ui.wrap()); return;
        }
        for(var entry:value.snapshot.entries) {
            LinearLayout card=ui.preferenceCard(); card.setPadding(ui.dp(14),ui.dp(12),ui.dp(14),ui.dp(12));
            TextView title=ui.text(label(entry.identity),15,ui.text,true); title.setAccessibilityHeading(true); card.addView(title,ui.wrap());
            card.addView(ui.text(description(entry),13,ui.muted,false),ui.margins(0,6,0,0));
            var action=entry.forgettable?AtomicWorkbenchTaskReferenceRequest.Action.FORGET:
                    entry.canReleaseAndForget?AtomicWorkbenchTaskReferenceRequest.Action.RELEASE_AND_FORGET:null;
            if(action!=null) {
                Button remove=ui.tonalButton(action==AtomicWorkbenchTaskReferenceRequest.Action.FORGET?"移除记录":
                        entry.pending?"继续清理并移除":"取消暂存并移除记录"); remove.setMinimumHeight(ui.dp(48));
                remove.setEnabled(value.available&&!value.busy&&value.unconfirmed<AtomicWorkbenchTaskReferenceUiState.MAX_UNCONFIRMED);
                card.addView(remove,ui.margins(0,8,0,0));
                remove.setOnClickListener(view->{
                    if(!live())return;
                    confirm(new AtomicWorkbenchTaskReferenceUiState.Selection(value.snapshot,entry,action));
                });
            }
            rows.addView(card,ui.margins(0,0,0,8));
        }
    }
    private void confirm(AtomicWorkbenchTaskReferenceUiState.Selection selection) {
        if(confirmation!=null || !live()) return;
        String detail=selection.action==AtomicWorkbenchTaskReferenceRequest.Action.FORGET?
                "移除这条暂存记录。应用任务保持当前状态，之后不能从这条记录恢复。":
                "释放此任务的暂存状态，再移除记录。应用将按系统正常规则显示；任务不会被结束。";
        final Dialog[] expected=new Dialog[1];
        expected[0]=ui.glassDialog(label(selection.entry.identity),detail,"确认",()->{
            if(confirmation==expected[0]) confirmation=null;
            if(live()) start(selection);
        },"取消");
        confirmation=expected[0];
        expected[0].setOnDismissListener(ignored->{ if(confirmation==expected[0]) confirmation=null; });
    }
    private String label(AtomicWorkbenchTaskIdentity task) {
        ComponentName component=ComponentName.unflattenFromString(task.realComponent);
        try {
            if(component!=null && task.userId==android.os.Process.myUid()/100000)
                return activity.getPackageManager().getActivityInfo(component,0).loadLabel(activity.getPackageManager()).toString();
        } catch(Exception unavailable) { /* Cross-user and removed apps keep their exact component label. */ }
        return component==null?task.realComponent:component.getPackageName();
    }
    private static String description(AtomicWorkbenchTaskReferenceSnapshot.Entry entry) {
        String state=entry.leaseState.equals("HELD")?"已暂存":entry.pending?"清理状态待核实":
                entry.disposition.equals("ENDED")?"任务已结束":entry.disposition.equals("RESTORED")?"已恢复到工作台":
                entry.disposition.equals("EXTERNALLY_ACTIVE")?"已在工作台外使用":entry.disposition.equals("STALE")?"原任务已变化":"已移出或完成释放";
        if(entry.pending&&!entry.canReleaseAndForget) state+="，核实完成后才能移除";
        return state+" · 任务 "+entry.identity.taskId+" · 用户 "+entry.identity.userId;
    }
    @Override public void close() {
        if(closed)return; closed=true; main.removeCallbacks(observe);
        Dialog child=confirmation; confirmation=null; if(child!=null&&child.isShowing())child.dismiss();
        Dialog parent=dialog; dialog=null; if(parent!=null&&parent.isShowing())parent.dismiss();
        // Pending request identities belong to state, and survive this dialog's lifetime.
    }
}
