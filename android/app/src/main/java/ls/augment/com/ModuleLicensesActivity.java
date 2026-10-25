package ls.augment.com;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Offline, selectable full texts using the shared About navigation and appearance. */
public final class ModuleLicensesActivity extends Activity {
    private static final String EXTRA_DOCUMENT="license_document";
    private final ExecutorService worker=Executors.newSingleThreadExecutor();
    private boolean closed, loading, userScrolled;
    private int generation, pendingScroll;
    private ScrollView scroll;
    private TextView body;
    private Button retry;
    private ViewTreeObserver restoreObserver;
    private ViewTreeObserver.OnGlobalLayoutListener restoreListener;


    // Gesture observer/forwarder retains native click handling or its separate accessible actions; do not synthesize a second click.
    //noinspection ClickableViewAccessibility
    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        String id=getIntent().getStringExtra(EXTRA_DOCUMENT);
        ModuleLicenseDocuments.Entry entry=ModuleLicenseDocuments.find(id);
        // Only our fixed document ids have a document route, including after recreation.
        getIntent().putExtra(ModuleNavigation.EXTRA_ROUTE,id==null?"licenses":"license_document");
        UiKit ui=new UiKit(this);
        LinearLayout page=ui.detailPage(id==null?"许可和第三方声明":"许可正文",null);
        scroll=getWindow().getDecorView().findViewWithTag("detail-scroll");
        if (scroll!=null) scroll.setOnTouchListener((view,event)->{
            userScrolled=true;pendingScroll=0;cancelScrollRestore();return false;
        });
        pendingScroll=state==null?0:Math.max(0,state.getInt("license-scroll",0));
        if (id==null) {
            ui.addDetailSectionTitle(page,"本地文本");
            for (ModuleLicenseDocuments.Entry item:ModuleLicenseDocuments.entries()) {
                LinearLayout card=ui.preferenceCard();
                card.addView(ui.preferenceRow("license:"+item.id,item.title,item.summary,
                        ()->startActivity(new Intent(this,ModuleLicensesActivity.class)
                                .putExtra(EXTRA_DOCUMENT,item.id))),ui.wrap());
                page.addView(card,ui.margins(0,0,0,8));
            }
            restoreScroll(generation);
            return;
        }
        ui.addDetailSectionTitle(page,entry==null?"未找到许可文本":entry.title);
        if (entry==null) {
            page.addView(ui.text("此许可条目不存在，请返回许可列表重新选择。",13,ui.muted,false),ui.wrap());
            return;
        }
        TextView source=ui.text("来源："+entry.source,12,ui.accent,false);
        source.setTag("license-source");source.setFocusable(true);
        source.setOnClickListener(view->{
            try { startActivity(new Intent(Intent.ACTION_VIEW,Uri.parse(entry.source))
                    .addCategory(Intent.CATEGORY_BROWSABLE)); }
            catch (ActivityNotFoundException | SecurityException error) {
                Toast.makeText(this,"未找到可打开来源链接的浏览器",Toast.LENGTH_LONG).show();
            }
        });
        page.addView(source,ui.margins(0,0,0,8));
        body=ui.text("正在读取本地文本…",13,ui.text,false);
        body.setTag("license-full-text");body.setTextIsSelectable(true);
        body.setLineSpacing(ui.dp(3),1.05f);
        page.addView(body,ui.wrap());
        retry=ui.tonalButton("重新读取");retry.setTag("license-retry");
        retry.setVisibility(android.view.View.GONE);
        retry.setOnClickListener(view->load(entry));
        page.addView(retry,ui.margins(0,8,0,0));
        load(entry);
    }

    private void load(ModuleLicenseDocuments.Entry entry) {
        if (closed||loading) return;
        cancelScrollRestore();
        loading=true;retry.setVisibility(android.view.View.GONE);
        body.setText("正在读取本地文本…");
        int request=++generation;
        worker.execute(()->{
            String text=null;
            try { text=ModuleLicenseDocuments.read(entry.id,path->getAssets().open(path)); }
            catch (IOException | RuntimeException error) { /* Render a visible failure, never partial text. */ }
            final String result=text;
            runOnUiThread(()->{
                if (closed||request!=generation) return;
                loading=false;
                body.setText(result==null?"无法读取本地许可文本。可重新读取，或返回许可列表。":result);
                retry.setVisibility(result==null?android.view.View.VISIBLE:android.view.View.GONE);
                if (result!=null) restoreScroll(request);
            });
        });
    }

    private void restoreScroll(int request) {
        cancelScrollRestore();
        if (closed||request!=generation||scroll==null||userScrolled||pendingScroll<=0) return;
        final ScrollView expected=scroll;
        final View content=expected.getChildCount()==1?expected.getChildAt(0):null;
        if (content==null) return;
        final int position=pendingScroll;
        restoreObserver=expected.getViewTreeObserver();
        restoreListener=new ViewTreeObserver.OnGlobalLayoutListener() {
            @Override public void onGlobalLayout() {
                if (restoreListener!=this) return;
                // Global-layout notification follows layout, not an arbitrary main-queue post.
                // Retire first, so scroll changes cannot keep this observer alive.
                cancelScrollRestore();
                if (closed||request!=generation||scroll!=expected||userScrolled
                        ||!expected.isAttachedToWindow()||expected.getHeight()<=0
                        ||expected.getChildCount()!=1||expected.getChildAt(0)!=content) return;
                int viewport=Math.max(0,expected.getHeight()-expected.getPaddingTop()-expected.getPaddingBottom());
                int max=Math.max(0,content.getHeight()-viewport);
                pendingScroll=0;
                expected.scrollTo(0,Math.max(0,Math.min(position,max)));
            }
        };
        restoreObserver.addOnGlobalLayoutListener(restoreListener);
        // Both a freshly built list and newly loaded text must pass a content layout.
        expected.requestLayout();
    }

    private void cancelScrollRestore() {
        ViewTreeObserver observer=restoreObserver;
        ViewTreeObserver.OnGlobalLayoutListener listener=restoreListener;
        restoreObserver=null;restoreListener=null;
        if (listener==null) return;
        if (observer!=null&&observer.isAlive()) observer.removeOnGlobalLayoutListener(listener);
        else if (scroll!=null) scroll.getViewTreeObserver().removeOnGlobalLayoutListener(listener);
    }
    @Override protected void onSaveInstanceState(Bundle state) {
        state.putInt("license-scroll",!userScrolled&&pendingScroll>0?pendingScroll:
                scroll==null?0:scroll.getScrollY());super.onSaveInstanceState(state);
    }
    @Override protected void onDestroy() {
        closed=true;++generation;cancelScrollRestore();worker.shutdownNow();super.onDestroy();
    }
}
