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
import ls.augment.com.StepRouteFeed;

/** Horizontal pages inside the top band. All displayed actions call a real local system service. */
final class WorkspaceDeck extends FrameLayout {
    final WorkspaceQuickBar owner;
    final Context ctx;
    final StepControlFace networks;
    final EnumMap<WorkspaceActions.Code,View> codeButtons=new EnumMap<>(WorkspaceActions.Code.class);
    final PlayerCard media;
    final LinearLayout routeCard;
    final TextView routeApp,routeTitle,routeDetail,routeHint;
    final StepRouteFeed routes;
    static final int CONTROLS=0,MUSIC=1,UPPER=2,ROUTE=3,CHOSEN_CONTROLS=4;
    boolean navigating,musicActive,manualPage,restored,gesture,interrupted;
    int savedPage;
    final TextView topPage;
    final java.util.List<Runnable> tileRefresh=new ArrayList<>();
    boolean closed;
    int mediaPoll;
    final Runnable tick=new Runnable(){public void run(){if(closed)return;for(Runnable update:tileRefresh)update.run();if((mediaPoll++&1)==0)refreshMedia();if(page==1)media.tick();postDelayed(this,500);}};
    final MediaSessionManager sessions;
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
        @Override public void onPlaybackStateChanged(PlaybackState state){renderMedia();}
        @Override public void onSessionDestroyed(){refreshMedia();}
    };
    final MediaSessionManager.OnActiveSessionsChangedListener listener=ignored->refreshMedia();
    WorkspaceDeck(WorkspaceQuickBar owner){
        super(owner.ctx);this.owner=owner;ctx=owner.ctx;
        networks=new StepControlFace(ctx);
        LinearLayout network=new LinearLayout(ctx);network.setOrientation(LinearLayout.VERTICAL);network.setBackground(StepMaterial.glass(ctx,false,17));
        int pad=owner.dp(4);network.setPadding(pad,pad,pad,pad);
        LinearLayout first=new LinearLayout(ctx),second=new LinearLayout(ctx);
        network.addView(first,new LinearLayout.LayoutParams(-1,0,1));network.addView(second,new LinearLayout.LayoutParams(-1,0,1));
        tile(first,"WLAN",Settings.ACTION_WIFI_SETTINGS);tile(first,"移动网络",Settings.ACTION_WIRELESS_SETTINGS);
        tile(second,"蓝牙",Settings.ACTION_BLUETOOTH_SETTINGS);tile(second,"VPN",Settings.ACTION_VPN_SETTINGS);
        TextView model=StepMaterial.label(ctx,Build.MODEL+"  ⋯",12,true);model.setMaxLines(2);
        model.setContentDescription(Build.MODEL+"，工作区布局与更多工具");
        model.setOnClickListener(owner.tools::menu);
        StepMaterial.feedback(model);
        LevelControl volume=new LevelControl(owner,false),brightness=new LevelControl(owner,true);
        networks.setControls(network,model,volume,brightness);
        tileRefresh.add(volume::refresh);tileRefresh.add(brightness::refresh);
        for(WorkspaceActions.Code kind:WorkspaceActions.Code.values()){
            LinearLayout button=new LinearLayout(ctx);
            button.setOrientation(LinearLayout.VERTICAL);button.setGravity(Gravity.CENTER);
            StepGlyph icon=new StepGlyph(ctx,kind.icon,kind.label,()->{});
            icon.setClickable(false);icon.setFocusable(false);icon.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
            button.addView(icon,new LinearLayout.LayoutParams(-1,0,1));
            TextView caption=StepMaterial.label(ctx,kind.label,10,false);caption.setSingleLine();
            button.setMinimumWidth((int)Math.ceil(caption.getPaint().measureText(kind.label))+owner.dp(6));
            caption.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
            button.addView(caption,-1,-2);button.setFocusable(true);
            StepMaterial.feedback(button);
            networks.addCode(kind,button);codeButtons.put(kind,button);
        }
        bindCodes(Collections.emptyMap());
        addView(networks,-1,-1);
        media=new PlayerCard(owner);addView(media,-1,-1);
        routeCard=new LinearLayout(ctx);routeCard.setOrientation(LinearLayout.VERTICAL);routeCard.setGravity(Gravity.CENTER_VERTICAL);
        routeCard.setPadding(owner.dp(16),0,owner.dp(16),0);routeCard.setBackground(StepMaterial.glass(ctx,false,16));
        routeApp=routeLabel(12,false);routeTitle=routeLabel(19,true);routeDetail=routeLabel(13,false);routeHint=routeLabel(11,false);
        topPage=StepMaterial.label(ctx,"打开顶部任务窗口",16,true);topPage.setOnClickListener(v->{if(owner.upper!=null)owner.upper.toggle(true);});
        StepMaterial.feedback(topPage);
        positionPages();
        sessions=ctx.getSystemService(MediaSessionManager.class);
        preferred=media.nativeCard==null?PlayerCard.previousPlayer(owner.userId):null;
        if(sessions!=null)try{sessions.addOnActiveSessionsChangedListener(listener,null,owner.host.main);observing=true;}
        catch(SecurityException unavailable){owner.host.log("媒体会话不可用："+unavailable);}
        refreshMedia();
        routes=new StepRouteFeed(ctx,owner.user,owner.host.main,this::showRoute,owner.host::log);
        post(tick);
    }
    TextView routeLabel(int size,boolean bold){
        TextView t=StepMaterial.label(ctx,"",size,bold);t.setGravity(Gravity.START|Gravity.CENTER_VERTICAL);
        t.setSingleLine(true);t.setEllipsize(android.text.TextUtils.TruncateAt.END);routeCard.addView(t,-1,-2);return t;
    }
    void showRoute(StepRouteFeed.Route route){
        if(closed)return;
        if(route!=null){
            routeApp.setText(route.app+" · 导航");routeTitle.setText(route.title);
            routeDetail.setText(route.detail);routeDetail.setVisibility(route.detail.isEmpty()?GONE:VISIBLE);
        }
        if(navigating==(route!=null))return;
        stopPaging();interrupted=gesture;navigating=route!=null;
        if(navigating)addView(routeCard,2,new FrameLayout.LayoutParams(-1,-1));else removeView(routeCard);
        int destination=page;
        if(!navigating && page==ROUTE){
            destination=musicActive || pausedTrack()?MUSIC:CONTROLS;
            // The selected route vanished; the fallback is automatic, not a user-pinned controls page.
            manualPage=false;savedPage=destination;
        }
        else if(navigating && !manualPage && (savedPage==ROUTE || page==CONTROLS && !musicActive))destination=ROUTE;
        jump(destination);hint();
    }
    void hint(){routeHint.setText(musicActive?"向右滑动查看音乐":"");routeHint.setVisibility(musicActive?VISIBLE:GONE);}
    boolean pausedTrack(){
        PlaybackState state=controller==null?null:controller.getPlaybackState();
        return state!=null && state.getState()==PlaybackState.STATE_PAUSED && controller.getMetadata()!=null;
    }
    void updatePlayback(){
        boolean active=controller!=null && playing(controller);
        if(!active && controller==null && page==MUSIC && !manualPage)jump(navigating?ROUTE:CONTROLS);
        if(active==musicActive)return;
        musicActive=active;hint();
        if(active && page==CONTROLS && !manualPage && !gesture)jump(MUSIC);
        if(!active && !navigating && page==CONTROLS)manualPage=false;
    }
    View card(int id){return id==ROUTE?routeCard:id==MUSIC?media:id==UPPER?topPage:networks;}
    int id(View view){return view==routeCard?ROUTE:view==media?MUSIC:view==topPage?UPPER:CONTROLS;}
    String caption(){return page==ROUTE?"导航页":page==MUSIC?(navigating?"音乐页，左滑查看导航":"音乐页"):page==UPPER?"顶部任务":"控制页";}
    void jump(int target){
        stopPaging();View v=card(target);int index=indexOfChild(v);
        page=index<0?CONTROLS:target;offset=index<0?0:index;positionPages();setContentDescription(caption());
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
        int size=Math.min(owner.dp(41),Math.max(owner.dp(15),(owner.host.geometry.top-owner.dp(70))/3));
        int inset=Math.max(2,size/5);layers.setPadding(inset,inset,inset,inset);
        tile.addView(layers,new FrameLayout.LayoutParams(size,size,Gravity.CENTER));
        refresh.run();
        row.addView(tile,new LinearLayout.LayoutParams(0,-1,1));
    }
    void bindCodes(Map<WorkspaceActions.Code,List<WorkspaceActions.Service>> available){
        owner.tools.closeProviders();
        for(WorkspaceActions.Code kind:WorkspaceActions.Code.values()){
            View button=codeButtons.get(kind);
            List<WorkspaceActions.Service> targets=available.getOrDefault(kind,Collections.emptyList());
            button.setOnClickListener(v->owner.tools.openCode(v,targets));
            button.setEnabled(!targets.isEmpty());button.setAlpha(targets.isEmpty()?.45f:1f);
            button.setContentDescription(targets.isEmpty()?kind.label+"，当前用户无可用服务":kind.label);
        }
    }
    void refreshMedia(){
        if(!observing){media.bind(null);return;}
        try{
            List<MediaController> candidates=sessions.getActiveSessions(null);
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
    void players(View anchor){
        if(!observing || closed)return;
        try{
            PopupMenu menu=new PopupMenu(ctx,anchor);
            menu.getMenu().add("跟随系统播放").setCheckable(true).setChecked(preferred==null)
                    .setOnMenuItemClickListener(i->{preferred=null;refreshMedia();return true;});
            for(MediaController c:sessions.getActiveSessions(null)){
                String label=c.getPackageName();
                try{label=ctx.getPackageManager().getApplicationLabel(ctx.getPackageManager().getApplicationInfo(label,0)).toString();}
                catch(android.content.pm.PackageManager.NameNotFoundException ignored){}
                menu.getMenu().add(label).setCheckable(true).setChecked(controller!=null && controller.getSessionToken().equals(c.getSessionToken()))
                    .setOnMenuItemClickListener(i->{preferred=c.getSessionToken();refreshMedia();return true;});
            }
            if(menu.getMenu().size()>0)menu.show();
        }catch(RuntimeException error){owner.note(error);}
    }
    void renderMedia(){media.bind(controller);updatePlayback();}
    void restorePage(int previous){
        savedPage=previous;restored=true;
        manualPage=previous==CHOSEN_CONTROLS || previous==MUSIC;
        if(previous==CHOSEN_CONTROLS)jump(CONTROLS);
        else if(previous==ROUTE && !navigating || previous==CONTROLS)jump(musicActive?MUSIC:navigating?ROUTE:CONTROLS);
        else jump(previous);
    }
    int savedPage(){return page==CONTROLS && manualPage?CHOSEN_CONTROLS:page;}
    void leaveUpperPage(){if(page==UPPER)jump(navigating && !musicActive?ROUTE:MUSIC);}
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
        stopPaging();int index=Math.max(0,Math.min(getChildCount()-1,next));page=id(getChildAt(index));
        android.animation.ValueAnimator run=android.animation.ValueAnimator.ofFloat(offset,index);paging=run;
        run.setDuration(200);run.setInterpolator(new android.view.animation.DecelerateInterpolator());
        run.addUpdateListener(a->{if(paging==run){offset=(Float)a.getAnimatedValue();positionPages();}});
        run.addListener(new android.animation.AnimatorListenerAdapter(){public void onAnimationEnd(android.animation.Animator a){
            if(paging!=run)return;paging=null;
            setContentDescription(caption());
            if(page==UPPER && owner.upper!=null)owner.upper.toggle(true);
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
            if(velocity!=null)velocity.recycle();
            velocity=VelocityTracker.obtain();
            stopPaging();downX=e.getX();downY=e.getY();startOffset=offset;
            dragging=vertical=blocked=interrupted=false;gesture=true;
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
        closed=true;routes.close();removeCallbacks(tick);stopPaging();media.close();
        if(velocity!=null){velocity.recycle();velocity=null;}
        if(controller!=null)controller.unregisterCallback(player);
        if(observing)sessions.removeOnActiveSessionsChangedListener(listener);controller=null;observing=false;
    }
}
