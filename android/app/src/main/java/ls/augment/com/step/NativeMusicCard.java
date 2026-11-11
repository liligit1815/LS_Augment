package ls.augment.com.step;

import android.app.Dialog;
import android.content.Context;
import android.media.MediaMetadata;
import android.media.session.*;
import android.media.session.MediaController;
import android.os.SystemClock;
import android.text.format.DateUtils;
import android.view.*;
import android.widget.*;
import java.lang.reflect.*;
import java.util.*;

/**
 * A separate instance of the installed RedMagic card, inflated from its own resources.
 * No control-center view is moved, and only this instance's layout/listeners are adapted.
 */
final class NativeMusicCard extends FrameLayout {
    static final String CARD="com.zte.controlcenter.view.ControlCenterMediaPlayerView";
    static final String DETAIL="com.zte.controlcenter.view.MediaDevicePanel";
    final PlayerCard player;
    final Context nativeContext;
    final LinearLayout card;
    final Method listening,refresh,support,click,detailClick;
    final Field controller,destroyed;
    final Field nativeSessions,nativeListener,nativeDetail;
    final Method unregister,stopDetail;
    final View previous,play,next,cast;
    final FrameLayout deviceButton;
    final int detailLayout;
    final Class<?> detailType;
    final Method detailEnable,detailData,detailState,detailTime;
    Dialog dialog;
    View detail;
    MediaSession.Token detailToken;
    String detailTrack;
    MediaMetadata detailMetadata;
    PlaybackState detailPlayback;
    boolean detailSeeking;
    boolean closed;
    String lastMissing="";

    static NativeMusicCard create(PlayerCard player){
        try{return new NativeMusicCard(player);}
        catch(Exception|LinkageError missing){
            player.owner.host.log("红魔原生音乐卡片能力缺失，保留媒体会话控件："+missing);
            return null;
        }
    }
    NativeMusicCard(PlayerCard player)throws Exception{
        super(StepRuntime.Shell.context);this.player=player;nativeContext=StepRuntime.Shell.context;
        Class<?> type=Class.forName(CARD,false,StepRuntime.Shell.loader);
        if(!LinearLayout.class.isAssignableFrom(type))throw new IllegalStateException(CARD+" is not LinearLayout");
        controller=NativeMusicContract.field(type,"mMediaController",MediaController.class);
        destroyed=NativeMusicContract.field(type,"mIsMediaSessionDestroyed",boolean.class);
        listening=NativeMusicContract.method(type,"setListening",void.class,boolean.class);
        refresh=NativeMusicContract.method(type,"handleMediaControllerList",void.class,List.class);
        support=NativeMusicContract.method(type,"isSupportMediaControl",boolean.class,String.class);
        click=NativeMusicContract.method(type,"onClick",void.class,View.class);
        for(String name:new String[]{"mHeaderIcon","mCastIcon","mPrevButton","mPlayPauseButton","mNextButton"})
            NativeMusicContract.field(type,name,ImageView.class);
        NativeMusicContract.field(type,"mTitleText",TextView.class);
        NativeMusicContract.field(type,"mArtistText",TextView.class);
        unregister=NativeMusicContract.method(type,"tryToUnregisterCallback",void.class);
        nativeSessions=NativeMusicContract.field(type,"mMediaSessionManager",MediaSessionManager.class);
        nativeListener=NativeMusicContract.field(type,"mSessionsListener",MediaSessionManager.OnActiveSessionsChangedListener.class);
        nativeDetail=StepMembers.findField(type,"mMediaControlDetailAdapter");
        stopDetail=NativeMusicContract.method(nativeDetail.getType(),"removeTimeUpdateCallback",void.class);
        int layout=resource("control_center_media_player");
        detailLayout=resource("control_center_media_device_panel");
        detailType=Class.forName(DETAIL,false,StepRuntime.Shell.loader);
        if(!View.class.isAssignableFrom(detailType))throw new IllegalStateException(DETAIL+" is not View");
        detailEnable=NativeMusicContract.method(detailType,"setButtonEnable",void.class,boolean.class,MediaController.class,boolean.class);
        detailData=NativeMusicContract.method(detailType,"updatePanelData",void.class,MediaMetadata.class,String.class);
        detailState=NativeMusicContract.method(detailType,"updatePlayPauseState",void.class,PlaybackState.class);
        detailTime=NativeMusicContract.method(detailType,"updateProgressTime",void.class,long.class,String.class);
        detailClick=NativeMusicContract.method(detailType,"sendButtonClickEvent",void.class,String.class);
        for(String name:new String[]{"mPrevButton","mPlayPauseButton","mNextButton"})
            NativeMusicContract.field(detailType,name,ImageView.class);
        NativeMusicContract.field(detailType,"mProgressSeekBar",SeekBar.class);
        NativeMusicContract.field(SeekBar.class,"mOnSeekBarChangeListener",SeekBar.OnSeekBarChangeListener.class);
        View inflated=LayoutInflater.from(nativeContext).cloneInContext(nativeContext).inflate(layout,this,false);
        if(!type.isInstance(inflated))throw new IllegalStateException("原厂音乐布局根节点不匹配");
        card=(LinearLayout)inflated;
        previous=view("mPrevButton");play=view("mPlayPauseButton");next=view("mNextButton");cast=view("mCastIcon");
        deviceButton=new FrameLayout(nativeContext);
        reflow();
        // Native showDeviceDetail targets the shade's container. Host its native panel locally.
        card.setOnClickListener(null);card.setClickable(false);
        cast.setOnClickListener(null);cast.setClickable(false);cast.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        deviceButton.setContentDescription("选择播放设备");deviceButton.setFocusable(true);
        deviceButton.setOnClickListener(v->player.output.performClick());
        for(View button:new View[]{previous,play,next})button.setOnClickListener(v->{
            try{
                player.owner.checkAction();
                if(!matches(player.controller)){player.owner.deck.refreshMedia();return;}
                click.invoke(card,v);
            }catch(Exception|LinkageError error){missing(error);}
        });
        listening.invoke(card,true);
        addView(card,new FrameLayout.LayoutParams(-1,-1));
        player.owner.host.log("红魔原生音乐卡片已装载："+type.getName()+"；布局="+layout);
    }
    int resource(String name){
        int id=nativeContext.getResources().getIdentifier(name,"layout",nativeContext.getPackageName());
        if(id==0)throw new IllegalStateException("缺少原厂布局 "+name);
        return id;
    }
    View view(String name){return (View)StepMembers.getObjectField(card,name);}
    static void detach(View view){if(view.getParent() instanceof ViewGroup)((ViewGroup)view.getParent()).removeView(view);}
    void reflow(){
        View cover=view("mHeaderIcon"),title=view("mTitleText"),artist=view("mArtistText");
        if(!(cover.getParent() instanceof FrameLayout) || !(title.getParent() instanceof LinearLayout)
                || title.getParent()!=artist.getParent() || !(previous.getParent() instanceof LinearLayout)
                || previous.getParent()!=play.getParent() || previous.getParent()!=next.getParent())
            throw new IllegalStateException("原厂音乐卡片分组结构未识别");
        View album=(View)cover.getParent(),titles=(View)title.getParent(),buttons=(View)play.getParent();
        if(!descendant(album,card)||!descendant(titles,card)||!descendant(buttons,card)||!descendant(cast,card))
            throw new IllegalStateException("原厂音乐控件不属于当前卡片");
        detach(album);detach(titles);detach(buttons);detach(cast);card.removeAllViews();
        // Preserve original controls, drawables, typefaces and actions; fit the horizontal top band.
        card.setOrientation(LinearLayout.VERTICAL);card.setGravity(Gravity.CENTER_VERTICAL);card.setPadding(0,0,0,0);
        card.setBackgroundColor(android.graphics.Color.TRANSPARENT);
        LinearLayout metadata=new LinearLayout(nativeContext);metadata.setGravity(Gravity.CENTER_VERTICAL);
        metadata.addView(album,new LinearLayout.LayoutParams(dp(42),dp(42)));
        titles.setPadding(dp(8),0,0,0);((TextView)title).setTextSize(13);((TextView)artist).setTextSize(11);
        metadata.addView(titles,new LinearLayout.LayoutParams(0,dp(48),1));
        cast.setBackground(null);cast.setPadding(dp(10),dp(10),dp(10),dp(10));
        if(cast instanceof ImageView)((ImageView)cast).setScaleType(ImageView.ScaleType.FIT_CENTER);
        cast.setScaleX(.7f);cast.setScaleY(.7f);
        deviceButton.addView(cast,new FrameLayout.LayoutParams(dp(44),dp(44),Gravity.CENTER));
        StepMaterial.feedback(deviceButton);
        int deviceSize=Math.round(dp(44)*.7f);
        metadata.addView(deviceButton,new LinearLayout.LayoutParams(deviceSize,deviceSize));card.addView(metadata,-1,dp(52));
        for(View button:new View[]{previous,play,next})button.setLayoutParams(new LinearLayout.LayoutParams(0,dp(44),1));
        card.addView(buttons,new LinearLayout.LayoutParams(-1,dp(44)));
    }
    static boolean descendant(View view,ViewGroup parent){
        for(ViewParent p=view.getParent();p!=null;p=p.getParent())if(p==parent)return true;
        return false;
    }
    int dp(int value){return player.owner.dp(value);}
    @Override protected void onMeasure(int w,int h){
        // OEM configuration updates may restore its QS tile width. This instance belongs to our band.
        if(card!=null){ViewGroup.LayoutParams lp=card.getLayoutParams();lp.width=lp.height=-1;}
        super.onMeasure(w,h);
    }
    MediaController selected(List<MediaController> active,MediaController target){
        if(closed || target==null)return null;
        try{
            if(!Boolean.TRUE.equals(support.invoke(card,target.getPackageName())))return null;
            MediaController value=(MediaController)controller.get(card);
            if(value==null || !value.getSessionToken().equals(target.getSessionToken()) || destroyed.getBoolean(card)){
                refresh.invoke(card,active);value=(MediaController)controller.get(card);
            }
            if(value==null || destroyed.getBoolean(card))return null;
            for(MediaController item:active)if(item.getSessionToken().equals(value.getSessionToken())
                    && target.getSessionToken().equals(value.getSessionToken()))return value;
        }catch(Exception|LinkageError error){missing(error);}
        return null;
    }
    boolean matches(MediaController value){
        try{
            MediaController bound=(MediaController)controller.get(card);
            return !closed && value!=null && !destroyed.getBoolean(card) && bound!=null
                    && bound.getSessionToken().equals(value.getSessionToken());
        }catch(Exception|LinkageError error){missing(error);return false;}
    }
    void update(MediaController value){
        boolean valid=matches(value);
        PlaybackState state=valid?value.getPlaybackState():null;
        long flags=state==null?0:state.getActions();
        previous.setEnabled((flags&PlaybackState.ACTION_SKIP_TO_PREVIOUS)!=0);
        next.setEnabled((flags&PlaybackState.ACTION_SKIP_TO_NEXT)!=0);
        long action=state!=null&&state.getState()==PlaybackState.STATE_PLAYING?PlaybackState.ACTION_PAUSE:PlaybackState.ACTION_PLAY;
        play.setEnabled((flags&(action|PlaybackState.ACTION_PLAY_PAUSE))!=0);
        cast.setEnabled(valid && player.router!=null);deviceButton.setEnabled(valid && player.router!=null);
        deviceButton.setVisibility(player.router==null?GONE:VISIBLE);
        if(detail!=null){
            if(!valid || !value.getSessionToken().equals(detailToken) || !player.identity.equals(detailTrack))closeDetail();
            else try{bindDetail(value);}catch(Exception|LinkageError error){closeDetail();missing(error);}
        }
    }
    void openDetail(){
        try{
            player.owner.checkAction();MediaController value=player.controller;
            if(!matches(value)){player.owner.logUnavailable("当前原生媒体会话已变化");return;}
            closeDetail();
            Context c=StepMaterial.statusBarPanelContext(nativeContext,nativeContext.getSystemService(android.hardware.display.DisplayManager.class).getDisplay(0));
            Dialog opened=new Dialog(c,StepMaterial.dark(c)?android.R.style.Theme_Material_Dialog_NoActionBar:android.R.style.Theme_Material_Light_Dialog_NoActionBar);
            LinearLayout body=new LinearLayout(nativeContext);body.setOrientation(LinearLayout.VERTICAL);
            body.setBackground(StepMaterial.glass(c,true,20));
            LinearLayout header=new LinearLayout(c);header.setGravity(Gravity.CENTER_VERTICAL);
            TextView caption=StepMaterial.label(c,"音乐与输出设备",16,true);
            header.addView(caption,new LinearLayout.LayoutParams(0,dp(48),1));
            header.addView(new StepGlyph(c,"close","关闭音乐面板",this::closeDetail),dp(48),dp(48));
            body.addView(header,-1,-2);
            ScrollView scroll=new ScrollView(nativeContext);
            View panel=LayoutInflater.from(nativeContext).inflate(detailLayout,scroll,false);
            if(!detailType.isInstance(panel))throw new IllegalStateException("原厂音乐详情布局不匹配");
            detail=panel;detailToken=value.getSessionToken();detailTrack=player.identity;dialog=opened;
            guardSeeking(panel,value,detailTrack);
            bindDetail(value);
            scroll.addView(panel);body.addView(scroll,new LinearLayout.LayoutParams(-1,0,1));
            opened.setContentView(body);
            Window window=opened.getWindow();window.setType(StepMaterial.STATUS_BAR_SUB_PANEL);
            window.setBackgroundDrawableResource(android.R.color.transparent);
            window.addFlags(WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE);
            opened.setOnDismissListener(d->{if(dialog==opened){dialog=null;detail=null;detailToken=null;detailTrack=null;}});
            opened.show();
            window.setLayout(Math.min(dp(430),player.owner.host.geometry.width*9/10),Math.min(dp(600),player.owner.host.geometry.height*4/5));
        }catch(Exception|LinkageError error){closeDetail();missing(error);player.owner.logUnavailable("原生音乐详情暂不可用");}
    }
    void bindDetail(MediaController value)throws Exception{
        PlaybackState state=value.getPlaybackState();
        detailEnable.invoke(detail,true,value,false);
        MediaMetadata metadata=value.getMetadata();
        if(metadata!=detailMetadata){detailMetadata=metadata;detailData.invoke(detail,metadata,value.getPackageName());}
        if(state!=detailPlayback){detailPlayback=state;detailState.invoke(detail,state);}
        long position=state==null?0:state.getPosition();
        if(state!=null && state.getState()==PlaybackState.STATE_PLAYING && state.getLastPositionUpdateTime()>0)
            position+=Math.round((SystemClock.elapsedRealtime()-state.getLastPositionUpdateTime())*state.getPlaybackSpeed());
        position=Math.max(0,player.duration>0?Math.min(player.duration,position):position);
        if(!detailSeeking)detailTime.invoke(detail,position,DateUtils.formatElapsedTime(position/1000));
        ((View)StepMembers.getObjectField(detail,"mPrevButton")).setEnabled(player.permitted(PlaybackState.ACTION_SKIP_TO_PREVIOUS));
        ((View)StepMembers.getObjectField(detail,"mNextButton")).setEnabled(player.permitted(PlaybackState.ACTION_SKIP_TO_NEXT));
        ((View)StepMembers.getObjectField(detail,"mPlayPauseButton")).setEnabled(play.isEnabled());
        ((View)StepMembers.getObjectField(detail,"mProgressSeekBar")).setEnabled(player.permitted(PlaybackState.ACTION_SEEK_TO));
    }
    void guardSeeking(View panel,MediaController value,String track)throws Exception{
        SeekBar seek=(SeekBar)StepMembers.getObjectField(panel,"mProgressSeekBar");
        SeekBar.OnSeekBarChangeListener original=(SeekBar.OnSeekBarChangeListener)
                NativeMusicContract.field(SeekBar.class,"mOnSeekBarChangeListener",SeekBar.OnSeekBarChangeListener.class).get(seek);
        // Some RedMagic panels expose a read-only progress widget. Add seeking to that widget only.
        if(original==null && seek.getThumb()==null)seek.setThumb(new SeekBar(nativeContext).getThumb());
        seek.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
            boolean valid(){return !closed && player.controller==value && player.identity.equals(track) && player.permitted(PlaybackState.ACTION_SEEK_TO);}
            public void onStartTrackingTouch(SeekBar bar){detailSeeking=true;if(valid() && original!=null)original.onStartTrackingTouch(bar);}
            public void onProgressChanged(SeekBar bar,int progress,boolean user){if(original!=null && (!user||valid()))original.onProgressChanged(bar,progress,user);}
            public void onStopTrackingTouch(SeekBar bar){
                detailSeeking=false;
                if(valid())try{
                    if(original!=null)original.onStopTrackingTouch(bar);
                    else value.getTransportControls().seekTo(Math.max(0,Math.min(player.duration,bar.getProgress())));
                }catch(RuntimeException error){missing(error);}
            }
        });
        String[] fields={"mPrevButton","mPlayPauseButton","mNextButton"};
        String[] actions={"prev button","playPause button","next button"};
        for(int n=0;n<fields.length;n++){
            String action=actions[n];
            ((View)StepMembers.getObjectField(panel,fields[n])).setOnClickListener(v->{
                try{
                    player.owner.checkAction();
                    if(detail==panel && player.controller==value && player.identity.equals(track))detailClick.invoke(panel,action);
                }catch(Exception|LinkageError error){missing(error);}
            });
        }
    }
    void missing(Throwable error){
        String message=error.toString();
        if(!lastMissing.equals(message)){lastMissing=message;player.owner.host.log("原生音乐能力变化："+message);}
    }
    void closeDetail(){
        if(dialog!=null)dialog.dismiss();
        dialog=null;detail=null;detailToken=null;detailTrack=null;detailMetadata=null;detailPlayback=null;detailSeeking=false;
    }
    void close(){
        if(closed)return;closed=true;closeDetail();
        try{removeView(card);}catch(RuntimeException error){missing(error);}
        // Also cover a failed workspace creation: selection can register before the window attaches.
        try{unregister.invoke(card);}catch(Exception error){missing(error);}
        try{
            MediaSessionManager manager=(MediaSessionManager)nativeSessions.get(card);
            if(manager!=null)manager.removeOnActiveSessionsChangedListener((MediaSessionManager.OnActiveSessionsChangedListener)nativeListener.get(card));
        }catch(Exception error){missing(error);}
        try{stopDetail.invoke(nativeDetail.get(card));}catch(Exception error){missing(error);}
        try{listening.invoke(card,false);}catch(Exception error){missing(error);}
    }
}
