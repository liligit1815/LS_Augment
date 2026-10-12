package ls.augment.com.hook;

import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import com.android.systemui.statusbar.notification.row.ExpandableNotificationRow;
import com.android.systemui.statusbar.notification.stack.NotificationStackScrollLayout;
import com.android.systemui.statusbar.notification.stack.SectionHeaderView;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import ls.augment.com.NotificationAppearanceOptions;
import ls.augment.com.SystemUiOptions;

/** Executes registered production layout/input hooks; native rendering/gesture side effects are substituted. */
public final class TestNotificationWholeStack {
    static int checks;static long clock=1000;
    static void check(boolean ok,String label){checks++;if(!ok)throw new AssertionError(label);}
    static void near(float actual,float wanted,String label){check(Math.abs(actual-wanted)<.01f,label+": "+actual+" != "+wanted);}
    static void frame(NotificationStackScrollLayout host){host.requestChildrenUpdate();android.os.Handler.drain();}
    static ExpandableNotificationRow row(String key,String app,int user,boolean silent,long time){return new ExpandableNotificationRow(key,app,user,silent,time);}
    static NotificationStackScrollLayout fresh(){
        NotificationStackScrollLayout host=new NotificationStackScrollLayout();
        host.addView(row("a-old","app.a",0,false,100));host.addView(row("b-alert-latest","app.b",0,false,300));
        host.addView(row("a-new","app.a",0,false,200));SectionHeaderView nativeHeader=new SectionHeaderView();nativeHeader.title="native silent";host.addView(nativeHeader);
        host.addView(row("s-old","app.a",0,true,800));host.addView(row("s-latest","app.c",0,true,900));frame(host);return host;
    }
    static ExpandableNotificationRow get(NotificationStackScrollLayout host,String key){
        for(View child:host.children)if(child instanceof ExpandableNotificationRow&&((ExpandableNotificationRow)child).identity.equals(key))return (ExpandableNotificationRow)child;
        throw new AssertionError("missing original row "+key);
    }
    static List<String> visible(NotificationStackScrollLayout host){
        List<String> keys=new ArrayList<>();for(View view:host.algorithm.mTempAlgorithmState.visibleChildren)
            if(view instanceof ExpandableNotificationRow&&view.getVisibility()==View.VISIBLE&&view.getAlpha()>0)keys.add(((ExpandableNotificationRow)view).identity);return keys;
    }
    static void visible(NotificationStackScrollLayout host,String... expected){
        check(visible(host).equals(Arrays.asList(expected)),"native selected identities: "+visible(host)+" expected "+Arrays.toString(expected));
        List<String> keys=Arrays.asList(expected);for(View child:host.children)if(child instanceof ExpandableNotificationRow){
            ExpandableNotificationRow row=(ExpandableNotificationRow)child;if(!keys.contains(row.identity)&&row.visibility!=View.GONE){
                check(row.visibility==View.INVISIBLE&&row.state.hidden&&row.alpha==0,"folded row has no drawing or accessibility/touch target: "+row.identity);
                check(!row.nativeHit(row.y+50),"folded notification cannot receive native click: "+row.identity);
            }
        }
    }
    static SectionHeaderView silentHeader(NotificationStackScrollLayout host){
        SectionHeaderView result=null;for(View view:host.children)if(view instanceof SectionHeaderView){SectionHeaderView h=(SectionHeaderView)view;
            if(h.duo&&h.visibility==View.VISIBLE){check("静默".equals(h.title),"only silent label remains, no empty alert/app/merged arrow rows");check(result==null,"one visible silent label");result=h;}}
        check(result!=null,"silent section label stays visible");return result;
    }
    static void noControls(NotificationStackScrollLayout host,String reason){
        for(View view:host.children)if(view instanceof SectionHeaderView&&((SectionHeaderView)view).duo)check(view.visibility==View.GONE,reason+" hides module labels");
        check(host.overlay.shapes.isEmpty(),reason+" clears decorative tails");
    }
    static MotionEvent event(long down,long when,int action,float x,float y){return new MotionEvent(down,when,action,x,y);}
    static MotionEvent down(NotificationStackScrollLayout host,String key){
        ExpandableNotificationRow row=get(host,key);clock+=1000;MotionEvent event=event(clock,clock,0,row.getLeft()+row.getTranslationX()+row.getWidth()/2f,row.getTop()+row.y+row.height/2f);
        check(host.dispatchTouchEvent(event),"native DOWN remains handled");return event;
    }
    static MotionEvent up(MotionEvent down,long duration){return event(down.downTime,down.downTime+duration,1,down.x,down.y);}
    static void tap(NotificationStackScrollLayout host,String key){MotionEvent d=down(host,key);check(host.dispatchTouchEvent(up(d,60)),"card short tap handled");android.os.Handler.drain();}
    static void collapsedCancel(NotificationStackScrollLayout host,String key,String... expected){
        ExpandableNotificationRow row=get(host,key);int clicks=row.nativeClicks,events=host.nativeActions.size(),recycled=MotionEvent.recycledCopies;tap(host,key);visible(host,expected);
        check(row.nativeClicks==clicks,"first tap expands without launching notification");
        check(host.nativeActions.subList(events,host.nativeActions.size()).equals(Arrays.asList(0,3)),"native sees DOWN then CANCEL, never same-gesture UP");
        check(host.lastNativeEvent.recycled&&MotionEvent.recycledCopies==recycled+1,"cloned cancel recycled after native dispatch");
    }
    static void modes(boolean big,boolean small){FeatureSettings.change(NotificationAppearanceOptions.STACK_BIG,big?"1":"0");FeatureSettings.change(NotificationAppearanceOptions.STACK_SMALL,small?"1":"0");}
    static void inputCases(){
        modes(true,false);FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"1");
        NotificationStackScrollLayout swipe=fresh();MotionEvent d=down(swipe,"b-alert-latest");
        swipe.dispatchTouchEvent(event(d.downTime,d.downTime+30,2,d.x+40,d.y));swipe.dispatchTouchEvent(event(d.downTime,d.downTime+70,1,d.x+40,d.y));android.os.Handler.drain();
        visible(swipe,"b-alert-latest");check(get(swipe,"b-alert-latest").nativeSwipes==1,"horizontal swipe remains native");check(!swipe.nativeActions.contains(3),"swipe gets no module cancel");swipe.detach();
        NotificationStackScrollLayout scroll=fresh();d=down(scroll,"b-alert-latest");
        scroll.dispatchTouchEvent(event(d.downTime,d.downTime+20,2,d.x,d.y+20));scroll.dispatchTouchEvent(up(d,60));android.os.Handler.drain();
        visible(scroll,"b-alert-latest");check(get(scroll,"b-alert-latest").nativeClicks==0,"move away then return cannot become module tap");check(!scroll.nativeActions.contains(3),"scroll remains native");scroll.detach();
        NotificationStackScrollLayout history=fresh();d=down(history,"b-alert-latest");
        history.dispatchTouchEvent(event(d.downTime,d.downTime+30,2,d.x,d.y).sample(d.x+30,d.y));history.dispatchTouchEvent(up(d,60));android.os.Handler.drain();
        visible(history,"b-alert-latest");check(!history.nativeActions.contains(3),"historical sample crossing slop rejects module tap");history.detach();
        NotificationStackScrollLayout longpress=fresh();d=down(longpress,"b-alert-latest");longpress.dispatchTouchEvent(up(d,700));android.os.Handler.drain();
        visible(longpress,"b-alert-latest");check(get(longpress,"b-alert-latest").nativeLongPresses==1,"long press remains native");check(!longpress.nativeActions.contains(3),"long press has no module cancel");longpress.detach();
        NotificationStackScrollLayout multi=fresh();d=down(multi,"b-alert-latest");MotionEvent pointer=event(d.downTime,d.downTime+20,5,d.x,d.y);pointer.pointers=2;
        multi.dispatchTouchEvent(pointer);multi.dispatchTouchEvent(up(d,80));android.os.Handler.drain();visible(multi,"b-alert-latest");check(!multi.nativeActions.contains(3),"multi-pointer gesture never expands");multi.detach();
        NotificationStackScrollLayout canceled=fresh();d=down(canceled,"b-alert-latest");canceled.dispatchTouchEvent(event(d.downTime,d.downTime+30,3,d.x,d.y));canceled.dispatchTouchEvent(up(d,60));android.os.Handler.drain();
        visible(canceled,"b-alert-latest");check(canceled.nativeActions.equals(Arrays.asList(0,3,1)),"CANCEL clears candidate before later UP");canceled.detach();
        NotificationStackScrollLayout falseTap=fresh();get(falseTap,"b-alert-latest").mFalsingManager.falseTap=true;d=down(falseTap,"b-alert-latest");falseTap.dispatchTouchEvent(up(d,60));android.os.Handler.drain();
        visible(falseTap,"b-alert-latest");check(get(falseTap,"b-alert-latest").mFalsingManager.queries>0,"respects OEM false-tap classifier");check(get(falseTap,"b-alert-latest").nativeClicks==0,"false tap never launches notification");check(falseTap.nativeActions.equals(Arrays.asList(0,3)),"false tap cancels native UP without opening group");falseTap.detach();
        NotificationStackScrollLayout nullFalsing=fresh();get(nullFalsing,"b-alert-latest").mFalsingManager=null;tap(nullFalsing,"b-alert-latest");visible(nullFalsing,"b-alert-latest");check(nullFalsing.nativeActions.equals(Arrays.asList(0,1)),"unavailable classifier falls back to complete native gesture");nullFalsing.detach();
        for(String changing:new String[]{"userLocked","guts","animating","groupChanging","pinned","away"}){
            NotificationStackScrollLayout nativeInteraction=fresh();d=down(nativeInteraction,"b-alert-latest");try{get(nativeInteraction,"b-alert-latest").getClass().getField(changing).setBoolean(get(nativeInteraction,"b-alert-latest"),true);}catch(Exception e){throw new AssertionError(e);}
            nativeInteraction.dispatchTouchEvent(up(d,60));android.os.Handler.drain();visible(nativeInteraction,"b-alert-latest");check(!nativeInteraction.nativeActions.contains(3),"native interaction owns gesture: "+changing);nativeInteraction.detach();
        }
        NotificationStackScrollLayout framed=fresh();d=down(framed,"b-alert-latest");frame(framed);framed.dispatchTouchEvent(up(d,60));android.os.Handler.drain();visible(framed,"a-old","b-alert-latest","a-new","s-old","s-latest");check(framed.nativeActions.equals(Arrays.asList(0,3)),"ordinary native frame between DOWN/UP retains valid candidate");framed.detach();
        for(String owner:new String[]{"mIsBeingDragged","mOnlyScrollingInThisMotion","mExpandingNotification","mExpandedInThisMotion"}){
            NotificationStackScrollLayout nativeOwner=fresh();d=down(nativeOwner,"b-alert-latest");try{nativeOwner.getClass().getField(owner).setBoolean(nativeOwner,true);}catch(Exception e){throw new AssertionError(e);}
            nativeOwner.dispatchTouchEvent(up(d,60));android.os.Handler.drain();visible(nativeOwner,"b-alert-latest");check(nativeOwner.nativeActions.equals(Arrays.asList(0,1)),"native container gesture retains original UP: "+owner);check(get(nativeOwner,"b-alert-latest").nativeClicks==0,"native container gesture cannot launch notification: "+owner);nativeOwner.detach();
        }
        NotificationStackScrollLayout stopFling=fresh();stopFling.takeDragOnDown=true;tap(stopFling,"b-alert-latest");visible(stopFling,"b-alert-latest");check(stopFling.nativeActions.equals(Arrays.asList(0,1)),"tap stopping native fling cannot expand stack");stopFling.detach();
        NotificationStackScrollLayout staleFlags=fresh();staleFlags.mIsBeingDragged=true;staleFlags.mOnlyScrollingInThisMotion=true;staleFlags.mExpandingNotification=true;staleFlags.mExpandedInThisMotion=true;
        collapsedCancel(staleFlags,"b-alert-latest","a-old","b-alert-latest","a-new","s-old","s-latest");check(!staleFlags.mIsBeingDragged&&!staleFlags.mOnlyScrollingInThisMotion&&!staleFlags.mExpandingNotification&&!staleFlags.mExpandedInThisMotion,"native DOWN clears old gesture flags before valid short tap");staleFlags.detach();
        NotificationStackScrollLayout menu=fresh();get(menu,"b-alert-latest").menu=new ExpandableNotificationRow.Menu();tap(menu,"b-alert-latest");visible(menu,"b-alert-latest");check(menu.nativeActions.equals(Arrays.asList(0,1))&&get(menu,"b-alert-latest").nativeMenuDismisses==1,"visible native menu dismisses without expanding stack");menu.detach();
        NotificationStackScrollLayout translated=fresh();ExpandableNotificationRow shifted=get(translated,"b-alert-latest");shifted.left=20;shifted.top=10;shifted.x=30;
        collapsedCancel(translated,"b-alert-latest","a-old","b-alert-latest","a-new","s-old","s-latest");translated.detach();
        for(String mode:new String[]{NotificationAppearanceOptions.STACK_BIG,NotificationAppearanceOptions.STACK_SMALL}){
            modes(true,false);NotificationStackScrollLayout changedMode=fresh();d=down(changedMode,"b-alert-latest");String originalMode=FeatureSettings.values.get(mode);FeatureSettings.change(mode,"1".equals(originalMode)?"0":"1");FeatureSettings.change(mode,originalMode);changedMode.dispatchTouchEvent(up(d,60));android.os.Handler.drain();visible(changedMode,"b-alert-latest");check(!changedMode.nativeActions.contains(3),"mode toggle cannot resurrect earlier candidate: "+mode);changedMode.detach();
        }
        NotificationStackScrollLayout upOutside=fresh();ExpandableNotificationRow edge=get(upOutside,"b-alert-latest");clock+=1000;d=event(clock,clock,0,edge.getLeft()+1,edge.y+50);upOutside.dispatchTouchEvent(d);upOutside.hitOverride=edge;upOutside.dispatchTouchEvent(event(d.downTime,d.downTime+60,1,edge.getLeft()-2,d.y));android.os.Handler.drain();visible(upOutside,"b-alert-latest");check(!upOutside.nativeActions.contains(3),"UP beyond actual card bounds is native even below movement slop");upOutside.detach();
        for(String region:new String[]{"side","topclip","bottomclip","backplate"}){
            NotificationStackScrollLayout outside=fresh();ExpandableNotificationRow front=get(outside,"b-alert-latest");outside.hitOverride=front;clock+=1000;
            float x=front.getWidth()/2f,y=front.y+50;
            if(region.equals("side"))x=front.getRight()+1;
            if(region.equals("topclip")){front.appliedClipTop=60;y=front.y+30;}
            if(region.equals("bottomclip")){front.appliedClipBottom=60;y=front.y+80;}
            if(region.equals("backplate"))y=front.y+front.height+8;
            d=event(clock,clock,0,x,y);outside.dispatchTouchEvent(d);outside.dispatchTouchEvent(up(d,60));android.os.Handler.drain();
            visible(outside,"b-alert-latest");check(!outside.nativeActions.contains(3),"permissive native hit cannot expand outside visible real row: "+region);outside.detach();
        }
        NotificationStackScrollLayout wrongTime=fresh();d=down(wrongTime,"b-alert-latest");MotionEvent altered=up(d,60);altered.downTime++;
        wrongTime.dispatchTouchEvent(altered);android.os.Handler.drain();visible(wrongTime,"b-alert-latest");check(!wrongTime.nativeActions.contains(3),"unmatched downTime cannot consume unrelated UP");wrongTime.detach();
        NotificationStackScrollLayout wrongPointer=fresh();d=down(wrongPointer,"b-alert-latest");altered=up(d,60);altered.pointerId=3;
        wrongPointer.dispatchTouchEvent(altered);android.os.Handler.drain();visible(wrongPointer,"b-alert-latest");check(!wrongPointer.nativeActions.contains(3),"changed pointer cannot reuse candidate");wrongPointer.detach();
        NotificationStackScrollLayout removed=fresh();d=down(removed,"b-alert-latest");removed.removeView(get(removed,"b-alert-latest"));frame(removed);removed.dispatchTouchEvent(up(d,60));android.os.Handler.drain();
        visible(removed,"a-new");check(!removed.nativeActions.contains(3),"removed representative cannot expand replacement");removed.detach();
        NotificationStackScrollLayout changed=fresh();d=down(changed,"b-alert-latest");get(changed,"a-new").entry.sbn.time=500;frame(changed);changed.dispatchTouchEvent(up(d,60));android.os.Handler.drain();
        visible(changed,"a-new");check(!changed.nativeActions.contains(3),"changed representative rejects stale UP");changed.detach();
        NotificationStackScrollLayout disabled=fresh();d=down(disabled,"b-alert-latest");FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"0");disabled.dispatchTouchEvent(up(d,60));android.os.Handler.drain();
        visible(disabled,"a-old","b-alert-latest","a-new","s-old","s-latest");check(!disabled.nativeActions.contains(3),"disable leaves pending native gesture intact");disabled.detach();FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"1");
        NotificationStackScrollLayout scene=fresh();d=down(scene,"b-alert-latest");com.android.systemui.scene.shared.flag.SceneContainerFlag.enabled=true;frame(scene);scene.dispatchTouchEvent(up(d,60));android.os.Handler.drain();
        visible(scene,"a-old","b-alert-latest","a-new","s-old","s-latest");check(!scene.nativeActions.contains(3),"scene switch leaves gesture native");scene.detach();com.android.systemui.scene.shared.flag.SceneContainerFlag.enabled=false;
        NotificationStackScrollLayout failure=fresh();d=down(failure,"b-alert-latest");RuntimeException exception=new IllegalStateException("native cancel fixture failure");failure.dispatchFailure=exception;int recycled=MotionEvent.recycledCopies;
        try{failure.dispatchTouchEvent(up(d,60));throw new AssertionError("native cancellation exception swallowed");}catch(RuntimeException actual){check(actual==exception,"native cancellation exception propagates unchanged");}
        check(failure.lastNativeEvent.recycled&&MotionEvent.recycledCopies==recycled+1,"cancel recycled when native dispatch throws");failure.dispatchFailure=null;frame(failure);visible(failure,"b-alert-latest");failure.detach();
        NotificationStackScrollLayout descendants=fresh();View content=new View();content.parent=get(descendants,"b-alert-latest");descendants.hitOverride=content;
        collapsedCancel(descendants,"b-alert-latest","a-old","b-alert-latest","a-new","s-old","s-latest");descendants.detach();
        NotificationStackScrollLayout unrelated=fresh();ViewGroup container=new ViewGroup();container.parent=unrelated;content=new View();content.parent=container;unrelated.hitOverride=content;
        d=down(unrelated,"b-alert-latest");unrelated.dispatchTouchEvent(up(d,60));android.os.Handler.drain();visible(unrelated,"b-alert-latest");check(!unrelated.nativeActions.contains(3),"unrelated descendant cannot expand notification");unrelated.detach();
    }
    static void accessibilityCases(){
        modes(true,true);NotificationStackScrollLayout host=fresh();ExpandableNotificationRow front=get(host,"b-alert-latest");front.nativeNodeClickable=false;AccessibilityNodeInfo info=new AccessibilityNodeInfo();front.onInitializeAccessibilityNodeInfoInternal(info);
        check(info.clickable&&info.actions.stream().anyMatch(a->a.id==16&&a.label!=null&&a.label.toString().contains("展开")),"folded representative exposes labeled accessibility click");
        check(info.actions.stream().anyMatch(a->a.id==262144),"folded representative exposes accessibility expand");check(info.stateDescription!=null&&info.stateDescription.toString().contains("5"),"folded representative announces count");check("b-alert-latest".contentEquals(info.contentDescription),"native content description preserved");
        front.performAccessibilityActionInternal(16,null);android.os.Handler.drain();visible(host,"a-new","b-alert-latest","s-old","s-latest");check(front.nativeClicks==0&&front.nativeAccessibilityCalls==0,"TalkBack expands one big stack without launch");
        ExpandableNotificationRow small=get(host,"a-new");small.performAccessibilityActionInternal(262144,null);android.os.Handler.drain();visible(host,"a-old","a-new","b-alert-latest","s-old","s-latest");check(small.nativeAccessibilityCalls==0,"app accessibility expansion consumed");
        small.performAccessibilityActionInternal(16,null);check(small.nativeClicks==1&&small.nativeAccessibilityCalls==1,"expanded row restores native accessibility click");
        host.setIsExpanded(false);host.setIsExpanded(true);frame(host);front.performAccessibilityActionInternal(32,null);check(front.nativeLongPresses==1,"accessibility long click stays native");visible(host,"b-alert-latest");
        KeyEvent canceled=new KeyEvent(1,66);canceled.canceled=true;front.onKeyUp(66,canceled);visible(host,"b-alert-latest");check(front.nativeKeyCalls==1,"canceled key remains native");
        front.onKeyUp(4,new KeyEvent(1,4));visible(host,"b-alert-latest");check(front.nativeKeyCalls==2,"nonconfirm key remains native");
        front.onKeyUp(66,new KeyEvent(1,66));android.os.Handler.drain();visible(host,"a-new","b-alert-latest","s-old","s-latest");check(front.nativeClicks==0&&front.nativeKeyCalls==2,"keyboard expands one big stack without native click");
        small.onKeyUp(23,new KeyEvent(1,23));android.os.Handler.drain();visible(host,"a-old","a-new","b-alert-latest","s-old","s-latest");check(small.nativeKeyCalls==0,"keyboard opens only collapsed same-app group");
        small.onKeyUp(66,new KeyEvent(1,66));check(small.nativeKeyCalls==1&&small.nativeClicks==2,"expanded keyboard confirm returns to native click");
        info=new AccessibilityNodeInfo();small.onInitializeAccessibilityNodeInfoInternal(info);check(info.stateDescription==null,"expanded node loses module collapsed state");
        FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"0");info=new AccessibilityNodeInfo();front.onInitializeAccessibilityNodeInfoInternal(info);check(info.stateDescription==null&&info.actions.size()==1&&!info.clickable,"disable restores native accessibility node");front.performAccessibilityActionInternal(16,null);check(front.nativeClicks==1,"disabled a11y click opens native notification");
        host.detach();FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"1");modes(false,false);
        NotificationStackScrollLayout singleton=new NotificationStackScrollLayout();singleton.addView(row("one","app.a",0,false,10));frame(singleton);tap(singleton,"one");check(get(singleton,"one").nativeClicks==1&&singleton.overlay.shapes.isEmpty(),"single notification has native click");singleton.detach();
    }
    static void domesticClassificationCases(){
        com.zte.utils.SystemuiUtils.sectionSupport=false;modes(true,false);
        NotificationStackScrollLayout host=fresh();for(View row:host.children)if(row instanceof ExpandableNotificationRow)((ExpandableNotificationRow)row).entry.bucket=5;frame(host);
        visible(host,"a-old","b-alert-latest","a-new","s-old","s-latest");noControls(host,"missing domestic ranking resolver");
        check(FeatureSettings.diagnostics.getOrDefault("ls_augment_notification_stack_runtime","").contains("classification=native-ranking-unavailable"),"missing coordinator explains full native fallback");
        com.android.systemui.statusbar.notification.collection.coordinator.RankingCoordinator ranking=new com.android.systemui.statusbar.notification.collection.coordinator.RankingCoordinator();
        ranking.attach(new com.android.systemui.statusbar.notification.collection.NotifPipeline());android.os.Handler.drain();
        check(ranking.attached==1,"ranking attach retains one original pipeline attach");visible(host,"b-alert-latest");
        check(ranking.silentQueries>0&&ranking.minimizedQueries>0,"domestic classification invokes original silent/minimized sectioners");
        check(FeatureSettings.diagnostics.getOrDefault("ls_augment_notification_stack_runtime","").contains("classification=native-ranking;"),"diagnostic identifies native raw ranking classifier");
        for(View row:host.children)if(row instanceof ExpandableNotificationRow)check(((ExpandableNotificationRow)row).entry.bucket==5&&host.mSectionsManager.getBucket(row)==5,"visual classification never rewrites native row bucket");
        FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"0");List<ExpandableNotificationRow> nativeNormal=host.getRowsToDismissInBackend(1),nativeSilent=host.getRowsToDismissInBackend(2);
        check(nativeSilent.isEmpty(),"domestic native silent clear range is genuinely empty with all buckets5");FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"1");
        check(host.getRowsToDismissInBackend(1).equals(nativeNormal)&&host.getRowsToDismissInBackend(2).equals(nativeSilent),"module raw grouping preserves both original native backend category ranges");
        collapsedCancel(host,"b-alert-latest","a-old","b-alert-latest","a-new","s-old","s-latest");
        host.setIsExpanded(false);host.setIsExpanded(true);frame(host);ExpandableNotificationRow minimized=row("raw-minimized","app.min",0,true,1200);minimized.entry.bucket=5;minimized.entry.importance=1;minimized.entry.ambient=true;host.addView(minimized);frame(host);
        visible(host,"b-alert-latest");check(ranking.minimizedQueries>0,"ambient minimized rows join the silent stack through native sectioner");
        modes(true,false);visible(host,"b-alert-latest");collapsedCancel(host,"b-alert-latest","a-old","b-alert-latest","a-new","s-old","s-latest","raw-minimized");host.detach();modes(true,false);

        NotificationStackScrollLayout mixed=new NotificationStackScrollLayout();ExpandableNotificationRow summary=row("low-summary-with-alert-child","app.group",0,true,100),child=row("important-child","app.group",0,false,900),ordinary=row("ordinary-alert","app.other",0,false,300),quiet=row("quiet","app.quiet",0,true,1000);
        summary.entry.bucket=5;summary.entry.highPriorityChild=true;summary.summary=true;summary.children.add(child);ordinary.entry.bucket=5;quiet.entry.bucket=5;
        com.android.systemui.statusbar.notification.collection.PipelineEntry parent=new com.android.systemui.statusbar.notification.collection.PipelineEntry(){public com.android.systemui.statusbar.notification.collection.NotificationEntry getRepresentativeEntry(){return summary.entry;}};summary.entry.parent=parent;child.entry.parent=parent;
        mixed.addView(summary);mixed.addView(ordinary);mixed.addView(quiet);frame(mixed);visible(mixed,"low-summary-with-alert-child");
        check(summary.children.size()==1&&summary.children.get(0)==child&&summary.entry.parent==parent&&child.entry.parent==parent,"raw classification retains native group parent and high-priority child identity");
        collapsedCancel(mixed,"low-summary-with-alert-child","low-summary-with-alert-child","ordinary-alert","quiet");summary.nativeGroupExpand();check(summary.expandedChildren==1,"mixed-priority summary retains native child expansion");mixed.detach();
        NotificationStackScrollLayout special=new NotificationStackScrollLayout();ExpandableNotificationRow priority=row("special-priority-low","app.priority",0,true,100),low=row("plain-low","app.low",0,true,200),alert=row("ordinary","app.alert",0,false,50);
        priority.entry.bucket=5;priority.entry.specialHighPriority=true;low.entry.bucket=5;alert.entry.bucket=5;special.addView(priority);special.addView(low);special.addView(alert);frame(special);visible(special,"special-priority-low");special.detach();

        NotificationStackScrollLayout unavailable=fresh();for(View row:unavailable.children)if(row instanceof ExpandableNotificationRow)((ExpandableNotificationRow)row).entry.bucket=5;frame(unavailable);
        ranking.silentMissing=true;frame(unavailable);visible(unavailable,"a-old","b-alert-latest","a-new","s-old","s-latest");noControls(unavailable,"missing live silent sectioner");
        check(FeatureSettings.diagnostics.getOrDefault("ls_augment_notification_stack_runtime","").contains("classification=native-ranking-unavailable"),"missing live sectioner falls back fully, without guessed importance sorting");ranking.silentMissing=false;frame(unavailable);visible(unavailable,"b-alert-latest");
        ranking.minimizedMissing=true;frame(unavailable);visible(unavailable,"a-old","b-alert-latest","a-new","s-old","s-latest");noControls(unavailable,"missing live minimized sectioner");ranking.minimizedMissing=false;frame(unavailable);visible(unavailable,"b-alert-latest");
        com.android.systemui.statusbar.notification.collection.coordinator.RankingCoordinator failing=new com.android.systemui.statusbar.notification.collection.coordinator.RankingCoordinator();RuntimeException attachFailure=new IllegalStateException("native ranking attach fixture failure");failing.attachFailure=attachFailure;
        try{failing.attach(new com.android.systemui.statusbar.notification.collection.NotifPipeline());throw new AssertionError("native attach exception swallowed");}catch(RuntimeException actual){check(actual==attachFailure,"native ranking attach exception propagates unchanged");}
        int previousQueries=ranking.silentQueries;frame(unavailable);visible(unavailable,"b-alert-latest");check(ranking.silentQueries>previousQueries,"failed new attach restores original working coordinator ownership");unavailable.detach();

        com.zte.utils.SystemuiUtils.sectionSupport=true;int rawQueries=ranking.silentQueries+ranking.minimizedQueries;NotificationStackScrollLayout overseas=fresh();get(overseas,"b-alert-latest").entry.importance=1;get(overseas,"b-alert-latest").entry.ambient=true;get(overseas,"s-latest").entry.importance=5;get(overseas,"s-latest").entry.specialHighPriority=true;frame(overseas);
        visible(overseas,"b-alert-latest");check(rawQueries==ranking.silentQueries+ranking.minimizedQueries,"section-supported overseas firmware preserves native buckets and never calls raw helper");
        check(FeatureSettings.diagnostics.getOrDefault("ls_augment_notification_stack_runtime","").contains("classification=native-bucket;"),"overseas diagnostic retains native-bucket adapter");overseas.detach();
    }
    static List<String> nativeState(NotificationStackScrollLayout host){
        List<String> values=new ArrayList<>();for(View view:host.children){
            com.android.systemui.statusbar.notification.stack.ExpandableViewState s=view instanceof ExpandableNotificationRow?((ExpandableNotificationRow)view).state:((SectionHeaderView)view).state;
            values.add(System.identityHashCode(view)+":"+view.visibility+":"+view.alpha+":"+view.scaleX+":"+view.z+":"+view.y+":"+s.hidden+":"+s.alpha+":"+s.clipTopAmount+":"+s.clipBottomAmount);
        }return values;
    }
    static void nativePassAndModes(){
        FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"0");modes(false,false);NotificationStackScrollLayout host=fresh();
        List<View> original=new ArrayList<>(host.children);List<String> baseline=nativeState(host);List<View> nativeFlow=new ArrayList<>(host.algorithm.mTempAlgorithmState.visibleChildren);
        List<ExpandableNotificationRow> alert=host.getRowsToDismissInBackend(1),quiet=host.getRowsToDismissInBackend(2);
        int writes=host.scrollabilityUpdates,clamps=host.clamps,sectionQueries=com.zte.utils.SystemuiUtils.sectionSupportQueries,adaptQueries=host.algorithm.adapt.queries;
        com.zte.utils.SystemuiUtils.sectionSupport=false;host.algorithm.adapt.shelfDisabled=false;host.ambient.shelf=new SectionHeaderView();
        FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"1");frame(host);
        visible(host,"a-old","b-alert-latest","a-new","s-old","s-latest");check(nativeState(host).equals(baseline),"00 retains complete native visibility, style and geometry");
        check(host.children.equals(original)&&host.algorithm.mTempAlgorithmState.visibleChildren.equals(nativeFlow),"00 retains native hierarchy and flow order including native headers");
        check(host.algorithm.mTempAlgorithmState.firstViewInShelf==host.algorithm.mTempAlgorithmState.nativeFirstViewInShelf,"00 leaves native shelf selection untouched");
        check(com.zte.utils.SystemuiUtils.sectionSupportQueries==sectionQueries&&host.algorithm.adapt.queries==adaptQueries,"00 needs neither ranking classification nor shelf adapter");
        for(View view:original)if(view instanceof ExpandableNotificationRow)check(((ExpandableNotificationRow)view).entryQueries==0,"00 never inspects notification metadata");
        check(!FeatureSettings.diagnostics.containsKey("ls_augment_notification_stack_runtime_error"),"00 is native mode, not unsupported adapter fallback");
        near(host.getContentHeight(),host.native_getContentHeight(),"00 native content height");near(host.getIntrinsicContentHeight(),host.native_getIntrinsicContentHeight(),"00 native intrinsic extent");
        check(host.scrollabilityUpdates==writes&&host.clamps==clamps,"00 does not write module scroll extent");noControls(host,"00");
        check(host.getRowsToDismissInBackend(1).equals(alert)&&host.getRowsToDismissInBackend(2).equals(quiet),"00 native clear selections retain exact row identities");
        int actions=host.nativeActions.size();tap(host,"a-old");check(get(host,"a-old").nativeClicks==1&&host.nativeActions.subList(actions,host.nativeActions.size()).equals(Arrays.asList(0,1)),"00 first tap is the native notification click");
        AccessibilityNodeInfo info=new AccessibilityNodeInfo();get(host,"a-old").onInitializeAccessibilityNodeInfoInternal(info);check(info.stateDescription==null&&info.actions.size()==1,"00 keeps original a11y actions");
        com.zte.utils.SystemuiUtils.sectionSupport=true;host.algorithm.adapt.shelfDisabled=true;host.ambient.shelf=null;
        modes(false,true);visible(host,"a-new","b-alert-latest","s-old","s-latest");check(host.overlay.shapes.size()==1,"01 directly folds only repeated same-app notifications");
        check(host.mSectionsManager.getBucket(silentHeader(host))==6,"01 preserves silent section label/bucket");
        int b=get(host,"b-alert-latest").nativeClicks;tap(host,"b-alert-latest");check(get(host,"b-alert-latest").nativeClicks==b+1,"01 singleton opens natively without category expansion");
        int s=get(host,"s-old").nativeClicks;tap(host,"s-old");check(get(host,"s-old").nativeClicks==s+1,"01 same app in the other category remains an independent singleton");
        collapsedCancel(host,"a-new","a-old","a-new","b-alert-latest","s-old","s-latest");check(host.overlay.shapes.isEmpty(),"01 one app expansion reveals its own rows directly");
        modes(true,false);visible(host,"b-alert-latest");collapsedCancel(host,"b-alert-latest","a-old","b-alert-latest","a-new","s-old","s-latest");
        check(host.overlay.shapes.isEmpty(),"10 expands to flat native notification lists");silentHeader(host);
        modes(true,true);visible(host,"b-alert-latest");collapsedCancel(host,"b-alert-latest","a-new","b-alert-latest","s-old","s-latest");
        check(host.overlay.shapes.size()==1,"11 outer expansion keeps the repeated app folded");
        String diagnostic=FeatureSettings.diagnostics.getOrDefault("ls_augment_notification_stack_runtime","");check(diagnostic.contains("groups=2;")&&diagnostic.contains("expandedGroups=1;"),"11 counts expandable merged/app groups, not static categories");
        SectionHeaderView ownedSilent=silentHeader(host);ExpandableNotificationRow old=get(host,"a-old");old.state.clipTopAmount=4;old.nextNativeBottom=9;old.nativeScale=.9f;old.nativeAlpha=.7f;old.nativeZ=5;frame(host);
        modes(false,false);visible(host,"a-old","b-alert-latest","a-new","s-old","s-latest");check(host.children.equals(original),"11 to00 removes owned headers completely");noControls(host,"11 to00");
        check(ownedSilent.getParent()==null&&host.mSectionsManager.getBucket(ownedSilent)==-1,"00 releases removed header section metadata as well as its view");
        check(old.visibility==View.VISIBLE&&!old.state.hidden&&old.appliedClipTop==4&&old.appliedClipBottom==9,"11 to00 restores hidden row and native clip state");near(old.scaleX,.9f,"00 native scale restored");near(old.alpha,.7f,"00 native alpha restored");near(old.z,5,"00 native Z restored");
        check(host.algorithm.mTempAlgorithmState.visibleChildren.equals(original),"restored00 flow contains only original objects");near(host.getContentHeight(),host.native_getContentHeight(),"11 to00 releases overridden content height");
        writes=host.scrollabilityUpdates;frame(host);check(host.scrollabilityUpdates==writes,"restored00 has no lingering extent rewrites");
        modes(true,true);visible(host,"b-alert-latest");MotionEvent pending=down(host,"b-alert-latest");actions=host.nativeActions.size()-1;b=get(host,"b-alert-latest").nativeClicks;
        modes(false,false);host.dispatchTouchEvent(up(pending,60));android.os.Handler.drain();check(host.nativeActions.subList(actions,host.nativeActions.size()).equals(Arrays.asList(0,1))&&get(host,"b-alert-latest").nativeClicks==b+1,"mode to00 preserves pending native DOWN/UP and clears module tap ownership");
        old.nativeHidden=true;get(host,"s-old").setVisibility(View.GONE);frame(host);baseline=nativeState(host);FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"0");check(nativeState(host).equals(baseline),"00 and master-off preserve native-hidden/GONE row styling identically");modes(true,true);check(nativeState(host).equals(baseline),"master-off leaves selected mode settings inert");host.detach();
    }
    static void layoutAndBackendCases(){
        FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"1");modes(true,false);NotificationStackScrollLayout host=fresh();List<View> original=new ArrayList<>(host.children);int rawCount=host.children.size();
        visible(host,"b-alert-latest");int children=host.children.size(),passes=host.nativePasses,writes=host.scrollabilityUpdates;float relative=get(host,"b-alert-latest").y-host.ambient.mStackY;
        for(int i=0;i<30;i++){host.ambient.mExpansionChanging=i%2==0;host.ambient.mStackY=100+i*3;frame(host);visible(host,"b-alert-latest");near(get(host,"b-alert-latest").y-host.ambient.mStackY,relative,"native front follows changing anchor");check(host.children.size()==children&&host.overlay.shapes.size()==1,"stable frame reuses native controls/backplate");check(host.nativePasses==passes+i+1,"one native pass per frame");}
        check(host.scrollabilityUpdates==writes,"stationary grouped flow avoids repeat extent writes");
        for(String exclusion:new String[]{"keyguard","doze","closed","scene","landscape"}){
            if(exclusion.equals("keyguard"))host.ambient.mStatusBarState=1;if(exclusion.equals("doze"))host.ambient.mDozing=true;if(exclusion.equals("closed"))host.ambient.mShadeExpanded=false;if(exclusion.equals("scene"))com.android.systemui.scene.shared.flag.SceneContainerFlag.enabled=true;if(exclusion.equals("landscape"))host.getResources().configuration.orientation=2;
            frame(host);check(visible(host).size()==5,"native list on "+exclusion);noControls(host,exclusion);host.ambient.mStatusBarState=0;host.ambient.mDozing=false;host.ambient.mShadeExpanded=true;com.android.systemui.scene.shared.flag.SceneContainerFlag.enabled=false;host.getResources().configuration.orientation=1;
        }
        frame(host);visible(host,"b-alert-latest");host.getResources().configuration.orientation=2;FeatureSettings.change(NotificationAppearanceOptions.STACK_LANDSCAPE,"1");visible(host,"b-alert-latest");FeatureSettings.change(NotificationAppearanceOptions.STACK_LANDSCAPE,"0");check(visible(host).size()==5,"landscape opt-out native");host.getResources().configuration.orientation=1;
        host.ambient.shelf=new SectionHeaderView();host.ambient.stackEndHeight=66;host.algorithm.scrimPadding=10;frame(host);check(host.algorithm.mTempAlgorithmState.firstViewInShelf==get(host,"b-alert-latest"),"filtered shelf selects actual merged-front flow");
        host.ambient.mScrollY=8;frame(host);check(host.algorithm.mTempAlgorithmState.firstViewInShelf==null,"filtered shelf follows native scroll");host.ambient.mScrollY=0;host.ambient.shelf=null;host.algorithm.scrimPadding=0;frame(host);
        get(host,"a-old").userLocked=true;frame(host);visible(host,"a-old","b-alert-latest","a-new","s-old","s-latest");check(host.overlay.shapes.isEmpty(),"native row expansion opens merged stack without extra category fold");get(host,"a-old").userLocked=false;
        host.setIsExpanded(false);frame(host);noControls(host,"closed shade");host.setIsExpanded(true);frame(host);visible(host,"b-alert-latest");
        int listeners=FeatureSettings.listeners.size();host.detach();check(FeatureSettings.listeners.size()==listeners-1,"detach removes listener");check(host.children.size()==rawCount&&host.children.equals(original)&&host.overlay.shapes.isEmpty(),"detach removes labels/plates retaining originals");check(get(host,"s-old").visibility==View.VISIBLE&&get(host,"s-old").alpha==1,"detach restores folded originals");
        FeatureSettings.values.put(SystemUiOptions.NOTIFICATION_STACK,"0");NotificationStackScrollLayout summary=fresh();ExpandableNotificationRow parent=get(summary,"a-old"),child=row("summary-child","app.a",0,false,250);parent.summary=true;parent.children.add(child);
        List<ExpandableNotificationRow> nativeTargets=summary.getRowsToDismissInBackend(1);check(nativeTargets.contains(child),"native summary child clear baseline");FeatureSettings.change(SystemUiOptions.NOTIFICATION_STACK,"1");visible(summary,"b-alert-latest");check(parent.visibility==View.INVISIBLE&&parent.children.size()==1,"folded summary retains children");
        check(summary.getRowsToDismissInBackend(1).equals(nativeTargets),"folded summary clear matches native");check(parent.visibility==View.INVISIBLE&&parent.alpha==0,"backend read restores folded summary afterward");
        RuntimeException error=new IllegalStateException("native clear fixture failure");summary.backendFailure=error;try{summary.getRowsToDismissInBackend(1);throw new AssertionError("clear exception swallowed");}catch(RuntimeException actual){check(actual==error,"native clear exception unchanged");}
        for(String key:new String[]{"a-old","a-new","s-old","s-latest"})check(get(summary,key).visibility==View.INVISIBLE&&get(summary,key).alpha==0,"finally restores "+key);
        summary.backendFailure=null;check(summary.getRowsToDismissInBackend(1).equals(nativeTargets),"clear works after exception");child.entry.sbn.time=1000;frame(summary);visible(summary,"a-old");collapsedCancel(summary,"a-old","a-old","b-alert-latest","a-new","s-old","s-latest");parent.nativeGroupExpand();check(parent.expandedChildren==1&&parent.children.size()==1,"opened native summary retains child expansion");
        summary.removeView(parent);frame(summary);visible(summary,"b-alert-latest","a-new","s-old","s-latest");check(summary.children.stream().noneMatch(v->v==parent),"clear never recreates row");for(View view:new ArrayList<>(summary.children))if(view instanceof ExpandableNotificationRow)summary.removeView(view);frame(summary);noControls(summary,"empty");check(visible(summary).isEmpty(),"clear all leaves no phantom");summary.detach();
        modes(false,true);NotificationStackScrollLayout profiles=new NotificationStackScrollLayout();profiles.addView(row("personal-old","app.a",0,false,10));profiles.addView(row("personal-new","app.a",0,false,20));profiles.addView(row("work","app.a",10,false,30));frame(profiles);visible(profiles,"personal-new","work");tap(profiles,"work");check(get(profiles,"work").nativeClicks==1,"01 work-profile singleton opens directly");collapsedCancel(profiles,"personal-new","personal-old","personal-new","work");profiles.detach();
    }
    public static void main(String[] args)throws Exception{
        AugmentModule module=new AugmentModule();AugmentModule.active=module;check(NotificationStackHook.install(module,TestNotificationWholeStack.class.getClassLoader())==14,"verified layout/input/a11y/ranking hooks install");
        nativePassAndModes();layoutAndBackendCases();inputCases();accessibilityCases();check(module.errors==0,"no callback reflection failures");check(!FeatureSettings.diagnostics.containsKey("ls_augment_notification_stack_runtime_error"),"no unsupported native path");
        int tapChecks=checks;domesticClassificationCases();check(module.errors==0,"native raw classification/attach exception ownership retained");
        System.out.println("Actual grouped NotificationStackHook: "+checks+" checks passed ("+tapChecks+" input/layout/mode checks); 00 native pass,01 direct app stacks,10 flat merged expansion,11 layered app expansion; renderer/gesture effects substituted; physical phone QA required");
    }
}
