package ls.augment.com.step;

import android.content.*;
import android.media.*;
import android.media.session.*;
import android.media.session.MediaController;
import android.os.Build;
import android.provider.Settings;
import android.view.*;
import android.widget.*;
import java.util.*;

/** Horizontal pages inside the top band. All displayed actions call a real local system service. */
final class WorkspaceDeck extends FrameLayout {
    final WorkspaceQuickBar owner;
    final Context ctx;
    final View networks;
    final EnumMap<WorkspaceActions.Code,View> codeButtons=new EnumMap<>(WorkspaceActions.Code.class);
    final PlayerCard media;
    final View mediaPage;
    static final int CONTROLS=0,MUSIC=1,UPPER=2,LEGACY_ROUTE=3,CHOSEN_CONTROLS=4,NAVIGATION=5;
    final WorkspaceNavigation navigation;
    final TextView navigationPage;
    boolean musicActive,manualPage,restored,gesture,interrupted,pendingMusicRestore;
    int savedPage;
    final TextView topPage;
    final java.util.List<Runnable> tileRefresh=new ArrayList<>();
    boolean closed;
    int mediaPoll;
    final Runnable tick=new Runnable(){public void run(){if(closed)return;for(Runnable update:tileRefresh)update.run();if((mediaPoll++&1)==0){refreshMedia();navigation.poll();}if(page==1)media.tick();postDelayed(this,500);}};
    final MediaSessionManager sessions;
    final WorkspacePlayback playback;
    MediaController controller;
    MediaSession.Token preferred;
    boolean dragging,observing,vertical,blocked;
    VelocityTracker velocity;
    int page;
    float offset,startOffset;
    android.animation.ValueAnimator paging;
    float downX,downY;
    final MediaController.Callback player=new MediaController.Callback(){
        @Override public void onMetadataChanged(MediaMetadata m){renderMedia();}
        @Override public void onPlaybackStateChanged(PlaybackState state){refreshMedia();}
        @Override public void onSessionDestroyed(){refreshMedia();}
    };
    final MediaSessionManager.OnActiveSessionsChangedListener listener=ignored->refreshMedia();
    WorkspaceDeck(WorkspaceQuickBar owner){
        super(owner.ctx);this.owner=owner;ctx=owner.ctx;
        if(owner.sideToolbar==null)networks=owner.controls;
        else{
            ImageView resting=new ImageView(ctx);resting.setContentDescription("顶部壁纸");
            resting.setScaleType(ImageView.ScaleType.CENTER_CROP);
            networks=resting;
        }
        addView(networks,-1,-1);
        media=new PlayerCard(owner);mediaPage=viewport(media);
        topPage=StepMaterial.label(ctx,"打开顶部任务窗口",16,true);topPage.setOnClickListener(v->{if(owner.upper!=null)owner.upper.toggle(true);});
        navigation=new WorkspaceNavigation(this);
        navigationPage=StepMaterial.label(ctx,"打开导航",16,true);navigationPage.setOnClickListener(v->navigation.open());
        StepMaterial.feedback(topPage);
        positionPages();
        sessions=ctx.getSystemService(MediaSessionManager.class);
        playback=new WorkspacePlayback(ctx);
        preferred=media.nativeCard==null?PlayerCard.previousPlayer(owner.userId):null;
        if(sessions!=null)try{sessions.addOnActiveSessionsChangedListener(listener,null,owner.host.main);observing=true;}
        catch(SecurityException unavailable){owner.host.log("媒体会话不可用："+unavailable);}
        refreshMedia();
        post(tick);
    }
    View viewport(View content){
        if(!owner.host.geometry.compact)return content;
        // Keep the native card intact; vertical scrolling reaches every control
        // when the app-filling geometry leaves a shorter top band.
        ScrollView viewport=new ScrollView(ctx);viewport.setFillViewport(true);
        viewport.addView(content,new ScrollView.LayoutParams(-1,owner.dp(96)));
        return viewport;
    }
    void updatePlayback(){
        boolean active=controller!=null && playing(controller);
        if(active==musicActive && (indexOfChild(mediaPage)>=0)==active)return;
        stopPaging();interrupted=gesture;
        musicActive=active;
        if(active && indexOfChild(mediaPage)<0)addView(mediaPage,1,new FrameLayout.LayoutParams(-1,-1));
        else if(!active)removeView(mediaPage);
        int destination=page;
        if(active && pendingMusicRestore){destination=MUSIC;pendingMusicRestore=false;}
        if(!active && page==MUSIC){destination=CONTROLS;manualPage=false;savedPage=destination;}
        jump(destination);
    }
    View card(int id){return id==MUSIC?mediaPage:id==UPPER?topPage:id==NAVIGATION?navigationPage:networks;}
    int id(View view){return view==mediaPage?MUSIC:view==topPage?UPPER:view==navigationPage?NAVIGATION:CONTROLS;}
    String caption(){return page==NAVIGATION?"地图导航":page==MUSIC?"音乐页":page==UPPER?"顶部任务":owner.sideToolbar==null?"控制页":"顶部壁纸";}
    void navigationChanged(boolean active){
        active=active && owner.upper!=null;
        if(active==(navigationPage.getParent()!=null) || gesture || paging!=null || navigation.opening)return;
        if(active)addView(navigationPage,-1,-1);else removeView(navigationPage);
        jump(page==NAVIGATION && !active?CONTROLS:page);
    }
    void openNativePage(){
        if(owner.upper==null)return;
        if(page==NAVIGATION)navigation.open();
        else if(page==UPPER)owner.upper.applyFace(true);
    }
    void jump(int target){
        stopPaging();View v=card(target);int index=indexOfChild(v);
        page=index<0?id(getChildAt(0)):target;offset=index<0?0:index;positionPages();setContentDescription(caption());
        if(restored && owner.host.quickBar!=null)owner.host.publishViewState();
    }
    void tile(LinearLayout row,String label,String action){
        Intent i=new Intent(action);
        if(!owner.canOpenSystem(i))return;
        String key=label.equals("WLAN")?"wifi":label.equals("移动网络")?"mobile":label.equals("蓝牙")?"bt":
                label.equals("VPN")?"vpn":label.equals("音量")?"volume":"sun";
        FrameLayout tile=new FrameLayout(ctx);
        StepMaterial.feedback(tile);
        StepGlyph icon=new StepGlyph(ctx,key,"打开"+label+"设置",()->owner.systemAction(i));
        icon.setClickable(false);icon.setFocusable(false);icon.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        String spec=key.equals("mobile")?"data":key;
        FrameLayout layers=new FrameLayout(ctx);ImageView nativeImage=new ImageView(ctx);
        layers.setBackground(StepMaterial.glass(ctx,false,32));
        nativeImage.setScaleType(ImageView.ScaleType.FIT_CENTER);nativeImage.setVisibility(GONE);
        layers.addView(icon,-1,-1);layers.addView(nativeImage,-1,-1);final Object[] previous={null};
        Runnable refresh=()->{
            int state=NativeTiles.read(owner.userId,spec);
            Object current=NativeTiles.icon(owner.userId,spec);
            if(current!=previous[0]){
                previous[0]=current;android.graphics.drawable.Drawable image=null;
                if(current!=null)try{image=(android.graphics.drawable.Drawable)NativeTiles.drawable.invoke(current,ctx);}
                catch(ReflectiveOperationException|RuntimeException unavailable){}
                nativeImage.setImageDrawable(image);nativeImage.setVisibility(image==null?GONE:VISIBLE);icon.setVisibility(image==null?VISIBLE:GONE);
            }
            nativeImage.setColorFilter(state==2?0xff458df0:StepMaterial.ink(ctx));
            icon.accent=state==2?0xff458df0:0;icon.invalidate();
            tile.setAlpha(state==0?.48f:1f);tile.setEnabled(state!=0);
            tile.setContentDescription(state<0?"打开"+label+"设置":label+(state==0?"不可用":state==2?"已开启":"已关闭"));
        };
        tile.setOnClickListener(t->{
            int state=NativeTiles.read(owner.userId,spec);
            if(key.equals("vpn") || state<0)owner.systemAction(i);else if(state>0)owner.activateTile(spec,t);
            tile.postDelayed(refresh,250);
        });
        tile.setOnLongClickListener(t->{owner.systemAction(i);return true;});tileRefresh.add(refresh);
        int size=owner.host.geometry.compact?owner.dp(26):Math.min(owner.dp(41),Math.max(owner.dp(15),(owner.host.geometry.top-owner.dp(70))/3));
        int inset=Math.max(2,size/5);layers.setPadding(inset,inset,inset,inset);
        tile.addView(layers,new FrameLayout.LayoutParams(size,size,Gravity.CENTER));
        refresh.run();
        row.addView(tile,new LinearLayout.LayoutParams(0,-1,1));
    }
    void bindCodes(Map<WorkspaceActions.Code,List<WorkspaceActions.Service>> available){
        owner.tools.closeProviders();
        for(WorkspaceActions.Code kind:WorkspaceActions.Code.values()){
            View button=codeButtons.get(kind);if(button==null)continue;
            List<WorkspaceActions.Service> targets=available.getOrDefault(kind,Collections.emptyList());
            button.setOnClickListener(v->owner.tools.openCode(v,targets));
            button.setEnabled(!targets.isEmpty());button.setAlpha(targets.isEmpty()?.45f:1f);
            button.setContentDescription(targets.isEmpty()?kind.label+"，当前用户无可用服务":kind.label);
        }
    }
    void refreshMedia(){
        if(owner.host.ready && !StepRuntime.interactive(ctx))return;
        if(!observing){controller=null;renderMedia();return;}
        try{
            Set<Integer> activeUids=playback.activeUids();
            List<MediaController> candidates=new ArrayList<>();
            for(MediaController candidate:sessions.getActiveSessions(null))
                if(playback.playing(candidate,activeUids))candidates.add(candidate);
            MediaController next=SystemMediaSelection.current(sessions,candidates);
            for(MediaController c:candidates){
                if(c.getSessionToken().equals(preferred)){next=c;break;}
            }
            if(next==null || !next.getSessionToken().equals(preferred))preferred=null;
            if(media.nativeCard!=null && preferred==null){
                MediaController nativeSelected=media.nativeCard.selected(candidates,next);
                if(nativeSelected!=null)next=nativeSelected;
            }
            if(controller!=null && next!=null && next.getSessionToken().equals(controller.getSessionToken())){renderMedia();return;}
            if(controller!=null)controller.unregisterCallback(player);
            controller=next;if(next!=null)next.registerCallback(player,owner.host.main);
            renderMedia();
        }catch(RuntimeException error){if(controller!=null)controller.unregisterCallback(player);controller=null;renderMedia();}
    }
    static boolean playing(MediaController c){PlaybackState s=c.getPlaybackState();return s!=null && s.getState()==PlaybackState.STATE_PLAYING;}
    void renderMedia(){media.bind(controller);updatePlayback();}
    void restorePage(int previous){
        savedPage=previous;restored=true;
        pendingMusicRestore=previous==MUSIC && !musicActive;
        if(pendingMusicRestore)postDelayed(()->pendingMusicRestore=false,5000);
        manualPage=previous==CHOSEN_CONTROLS || previous==MUSIC;
        if(previous==CHOSEN_CONTROLS)jump(CONTROLS);
        else if(previous==LEGACY_ROUTE || previous==CONTROLS)jump(CONTROLS);
        else jump(pendingMusicRestore?CONTROLS:previous);
    }
    int savedPage(){return pendingMusicRestore?MUSIC:page==CONTROLS && manualPage?CHOSEN_CONTROLS:page;}
    void fromUpper(int direction){
        pendingMusicRestore=false;
        int current=indexOfChild(owner.host.upperId==owner.host.upperNavigationId && owner.host.upperId>=0?navigationPage:topPage),next=current+direction;
        if(next<0 || next>=getChildCount())next=indexOfChild(networks);
        int destination=id(getChildAt(Math.max(0,next)));
        Runnable done=()->{manualPage=true;savedPage=destination;jump(destination);openNativePage();};
        if(owner.host.upperId>=0)owner.host.upperAction("park",done);
        else{owner.upper.render(false);done.run();}
    }
    void leaveUpperPage(){if(page==UPPER || page==NAVIGATION)jump(CONTROLS);}
    void positionPages(){
        for(int n=0;n<getChildCount();n++){
            View v=getChildAt(n);float dx=n-offset;
            v.setTranslationX(dx*(getWidth()+owner.dp(8)));v.setVisibility(Math.abs(dx)<.9999f?VISIBLE:INVISIBLE);
            v.setImportantForAccessibility(id(v)==page?IMPORTANT_FOR_ACCESSIBILITY_AUTO:IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        }
        owner.updatePageIndicator();
    }
    @Override protected void onSizeChanged(int w,int h,int oldW,int oldH){super.onSizeChanged(w,h,oldW,oldH);positionPages();}
    void stopPaging(){android.animation.ValueAnimator old=paging;paging=null;if(old!=null)old.cancel();}
    void settlePage(int next){
        pendingMusicRestore=false;
        stopPaging();int index=Math.max(0,Math.min(getChildCount()-1,next));page=id(getChildAt(index));
        android.animation.ValueAnimator run=android.animation.ValueAnimator.ofFloat(offset,index);paging=run;
        run.setDuration(200);run.setInterpolator(new android.view.animation.DecelerateInterpolator());
        run.addUpdateListener(a->{if(paging==run){offset=(Float)a.getAnimatedValue();positionPages();}});
        run.addListener(new android.animation.AnimatorListenerAdapter(){public void onAnimationEnd(android.animation.Animator a){
            if(paging!=run)return;paging=null;
            setContentDescription(caption());
            openNativePage();
            owner.host.publishViewState();
        }});run.start();
    }
    void trackAxis(MotionEvent e){
        if(dragging || vertical || blocked || interrupted)return;
        float dx=Math.abs(e.getX()-downX),dy=Math.abs(e.getY()-downY);
        int slop=ViewConfiguration.get(ctx).getScaledTouchSlop();
        if(dy>slop && dy>=dx)vertical=true;
        else if(dx>slop && dx>dy*1.25f)dragging=true;
    }
    @Override public void onInitializeAccessibilityNodeInfo(android.view.accessibility.AccessibilityNodeInfo info){
        super.onInitializeAccessibilityNodeInfo(info);info.setScrollable(true);int i=indexOfChild(card(page));
        if(i>0)info.addAction(android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_BACKWARD);
        if(i+1<getChildCount())info.addAction(android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_FORWARD);
    }
    @Override public boolean performAccessibilityAction(int action,android.os.Bundle args){
        int dir=action==android.view.accessibility.AccessibilityNodeInfo.ACTION_SCROLL_FORWARD?1:
                action==android.view.accessibility.AccessibilityNodeInfo.ACTION_SCROLL_BACKWARD?-1:0;
        int next=indexOfChild(card(page))+dir;
        if(dir!=0 && next>=0 && next<getChildCount()){manualPage=true;savedPage=id(getChildAt(next));settlePage(next);return true;}
        return super.performAccessibilityAction(action,args);
    }
    @Override public boolean dispatchTouchEvent(MotionEvent e){
        int action=e.getActionMasked();
        if(action==MotionEvent.ACTION_DOWN){
            pendingMusicRestore=false;
            if(velocity!=null)velocity.recycle();
            velocity=VelocityTracker.obtain();
            stopPaging();downX=e.getX();downY=e.getY();startOffset=offset;
            dragging=vertical=blocked=interrupted=false;gesture=true;
            // Reserve edge-origin streams for the input monitor. Paging must
            // not move even one frame before the sidebar direction is known.
            if(owner.sideToolbar!=null && owner.upper!=null && owner.upper.monitor!=null)
                blocked=owner.sideToolbar.edgeStart(e.getRawX(),e.getRawY())>=0;
            if(owner.sideToolbar==null && page==CONTROLS && owner.scroll.isShown()){
                android.graphics.Rect appBounds=new android.graphics.Rect();owner.scroll.getDrawingRect(appBounds);
                offsetDescendantRectToMyCoords(owner.scroll,appBounds);blocked=appBounds.contains((int)downX,(int)downY);
            }
            if(page==MUSIC && media.seek.isShown() && media.seek.isEnabled()){
                android.graphics.Rect bounds=new android.graphics.Rect();
                media.seek.getDrawingRect(bounds);offsetDescendantRectToMyCoords(media.seek,bounds);
                blocked=bounds.contains((int)downX,(int)downY);
            }
        }else if(action==MotionEvent.ACTION_POINTER_DOWN){
            blocked=true;
            if(dragging){dragging=false;settlePage(indexOfChild(card(page)));}
        }
        if(velocity!=null)velocity.addMovement(e);
        boolean handled=super.dispatchTouchEvent(e);
        if(action==MotionEvent.ACTION_UP || action==MotionEvent.ACTION_CANCEL){
            gesture=false;
            if(velocity!=null){velocity.recycle();velocity=null;}
            if(!dragging && paging==null && Math.abs(offset-indexOfChild(card(page)))>.001f)settlePage(indexOfChild(card(page)));
        }
        return handled;
    }
    @Override public boolean onInterceptTouchEvent(MotionEvent e){
        if(e.getActionMasked()==MotionEvent.ACTION_MOVE)trackAxis(e);
        return dragging;
    }
    @Override public boolean onTouchEvent(MotionEvent e){
        int action=e.getActionMasked();
        if(interrupted){if(action==MotionEvent.ACTION_UP || action==MotionEvent.ACTION_CANCEL)gesture=false;return true;}
        if(action==MotionEvent.ACTION_MOVE){
            trackAxis(e);
            if(dragging){
                offset=Math.max(0,Math.min(getChildCount()-1,startOffset-(e.getX()-downX)/Math.max(1,getWidth()+owner.dp(8))));positionPages();
            }
        }
        if(action==MotionEvent.ACTION_UP || action==MotionEvent.ACTION_CANCEL){
            float dx=e.getX()-downX;
            int current=indexOfChild(card(page)),target=current;
            if(action==MotionEvent.ACTION_UP && dragging){
                if(velocity!=null)velocity.computeCurrentVelocity(1000);
                float speed=velocity==null?0:velocity.getXVelocity();
                if(Math.abs(dx)>2*ViewConfiguration.get(ctx).getScaledTouchSlop() && Math.abs(speed)>owner.dp(600))target+=speed<0?1:-1;
                else if(Math.abs(dx)>getWidth()*.18f)target+=dx<0?1:-1;
            }
            if(target>=0 && target<getChildCount() && target!=current){manualPage=true;savedPage=id(getChildAt(target));}
            settlePage(target);dragging=false;gesture=false;
        }
        return true;
    }
    void close(){
        owner.tools.closeProviders();
        closed=true;removeCallbacks(tick);stopPaging();media.close();
        if(velocity!=null){velocity.recycle();velocity=null;}
        if(controller!=null)controller.unregisterCallback(player);
        if(observing)sessions.removeOnActiveSessionsChangedListener(listener);controller=null;observing=false;
    }
}
