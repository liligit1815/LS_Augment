package ls.augment.com.step;

import android.content.Context;
import android.graphics.Bitmap;
import android.media.MediaMetadata;
import android.media.MediaRouter2;
import android.media.session.*;
import android.media.session.MediaController;
import android.net.Uri;
import android.os.SystemClock;
import android.text.TextUtils;
import android.view.*;
import android.widget.*;
import org.json.*;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.*;

/** All commands belong to the selected MediaSession; seeking never targets a replacement player. */
final class PlayerCard extends LinearLayout {
    private static final class Bookmark {
        final int user;
        final MediaSession.Token player;
        final String track,sessionLyrics;
        final SongLines lines;
        final boolean manualLyrics,manualPlayer;
        Bookmark(PlayerCard card){
            user=card.owner.userId;player=card.controller.getSessionToken();track=card.identity;
            sessionLyrics=card.rawLyrics;lines=card.lines;manualLyrics=card.manualLyrics;
            manualPlayer=player.equals(card.owner.deck.preferred);
        }
    }
    private static Bookmark bookmark;
    static void forget(){bookmark=null;LyricLookup.clear();}
    static MediaSession.Token previousPlayer(int user){return bookmark!=null && bookmark.user==user && bookmark.manualPlayer?bookmark.player:null;}
    final WorkspaceQuickBar owner;
    final ImageView cover;
    final TextView title,line,output,times;
    final LinearLayout actions;
    final SeekBar seek;
    final LinearLayout legacy,center;
    final NativeMusicCard nativeCard;
    boolean nativeVisible;
    final ExecutorService lookup=Executors.newSingleThreadExecutor();
    MediaController controller,dragOwner;
    MediaRouter2 router;
    Future<?> request;
    String titleText="",artist="",identity="",rawLyrics="",liveLine="",dragKey;
    long duration;
    long position;
    int generation,autoAttempts;
    long nextAutoLookup;
    boolean closed,failed,fetching,manualLyrics;
    LyricLookup.Status lyricStatus=LyricLookup.Status.NO_MATCH;
    int lyricSource=-1;
    SongLines lines=new SongLines(null);

    PlayerCard(WorkspaceQuickBar host){
        super(host.ctx);owner=host;Context c=host.ctx;
        setBackground(StepMaterial.glass(c,false,0));setGravity(Gravity.CENTER_VERTICAL);setOrientation(HORIZONTAL);
        setPadding(host.dp(10),host.dp(8),host.dp(10),host.dp(8));
        legacy=new LinearLayout(c);legacy.setOrientation(VERTICAL);legacy.setGravity(Gravity.CENTER_VERTICAL);
        addView(legacy,new LayoutParams(0,-1,1.05f));
        LinearLayout metadata=new LinearLayout(c);metadata.setGravity(Gravity.CENTER_VERTICAL);
        cover=new ImageView(c);cover.setScaleType(ImageView.ScaleType.CENTER_CROP);metadata.addView(cover,host.dp(42),host.dp(42));
        title=StepMaterial.label(c,"暂无播放",13,true);title.setMaxLines(2);title.setEllipsize(TextUtils.TruncateAt.END);
        title.setPadding(host.dp(8),0,0,0);title.setGravity(Gravity.START|Gravity.CENTER_VERTICAL);
        metadata.addView(title,new LayoutParams(0,host.dp(48),1));legacy.addView(metadata,-1,host.dp(52));
        title.setClickable(false);
        actions=new LinearLayout(c);actions.setGravity(Gravity.CENTER);legacy.addView(actions,-1,host.dp(44));
        seek=new SeekBar(c);seek.setMax(1000);seek.setContentDescription("播放进度");legacy.addView(seek,-1,host.dp(32));
        times=StepMaterial.label(c,"0:00 / 0:00",10,false);legacy.addView(times,-1,host.dp(20));
        center=new LinearLayout(c);center.setOrientation(VERTICAL);center.setGravity(Gravity.CENTER);
        center.setPadding(host.dp(12),0,0,0);
        line=StepMaterial.label(c,"暂无歌词",14,false);line.setMaxLines(5);line.setEllipsize(TextUtils.TruncateAt.END);
        line.setGravity(Gravity.CENTER);line.setLineSpacing(host.dp(5),1f);
        center.addView(line,-1,-1);
        addView(center,new LayoutParams(0,-1,1));
        seek.setOnTouchListener((v,e)->{if(e.getActionMasked()==MotionEvent.ACTION_DOWN)v.getParent().requestDisallowInterceptTouchEvent(true);return false;});
        seek.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
            public void onProgressChanged(SeekBar s,int value,boolean user){}
            public void onStartTrackingTouch(SeekBar s){dragOwner=controller;dragKey=identity;}
            public void onStopTrackingTouch(SeekBar s){
                if(dragOwner!=null && dragOwner==controller && identity.equals(dragKey) && permitted(PlaybackState.ACTION_SEEK_TO))
                    controller.getTransportControls().seekTo(Math.round(duration*(s.getProgress()/1000d)));
                dragOwner=null;
            }
        });
        output=StepMaterial.label(c,"设备",12,true);output.setContentDescription("选择当前播放器的播放设备");
        StepMaterial.feedback(output);
        output.setOnClickListener(v->{try{if(router!=null && !router.showSystemOutputSwitcher())host.logUnavailable("系统未打开输出设备选择器");}
            catch(RuntimeException e){host.note(e);}});metadata.addView(output,host.dp(44),host.dp(44));
        nativeCard=NativeMusicCard.create(this);
        if(nativeCard!=null){nativeCard.setVisibility(GONE);addView(nativeCard,0,new LayoutParams(0,-1,1.05f));}

    }
    // This view runs inside SystemUI. Its UID may hold either permission independently of Duo.
    @androidx.annotation.RequiresPermission(anyOf={android.Manifest.permission.MEDIA_CONTENT_CONTROL,
            android.Manifest.permission.MEDIA_ROUTING_CONTROL}, conditional=true)
    private void bindOutputRouter(MediaController current) {
        if (owner.ctx.checkSelfPermission(android.Manifest.permission.MEDIA_CONTENT_CONTROL) != android.content.pm.PackageManager.PERMISSION_GRANTED
                && owner.ctx.checkSelfPermission(android.Manifest.permission.MEDIA_ROUTING_CONTROL) != android.content.pm.PackageManager.PERMISSION_GRANTED) {
            owner.host.log("原厂输出选择器不可用：缺少媒体路由控制权限");
            return;
        }
        try {
            router=MediaRouter2.getInstance(owner.ctx,current.getPackageName(),owner.host.main::post,()->{
                if(controller==current){router=null;output.setVisibility(GONE);}
            });
        } catch(RuntimeException|LinkageError unavailable) {
            owner.host.log("原厂输出选择器不可用："+unavailable.getClass().getSimpleName());
        }
    }
    boolean permitted(long action){
        PlaybackState s=controller==null?null:controller.getPlaybackState();return s!=null && (s.getActions()&action)!=0;
    }
    void bind(MediaController current){
        if(closed)return;
        boolean boundPlayerChanged=controller!=current;
        if(boundPlayerChanged){
            controller=current;router=null;dragOwner=null;
            if(current!=null && owner.currentUser())bindOutputRouter(current);
        }
        MediaMetadata m=current==null?null:current.getMetadata();
        titleText=value(m,MediaMetadata.METADATA_KEY_TITLE);artist=value(m,MediaMetadata.METADATA_KEY_ARTIST);
        if(m!=null){
            android.media.MediaDescription desc=m.getDescription();
            if(titleText.isEmpty() && desc.getTitle()!=null)titleText=desc.getTitle().toString();
            if(artist.isEmpty() && desc.getSubtitle()!=null)artist=desc.getSubtitle().toString();
        }
        if("unknown".equalsIgnoreCase(artist) || "<unknown>".equalsIgnoreCase(artist))artist="";
        String pkg=current==null?"":current.getPackageName();
        PlayerLyrics track=PlayerLyrics.from(pkg,titleText,artist);
        titleText=track.title;artist=track.artist;liveLine=track.line;
        duration=m==null?0:Math.max(0,m.getLong(MediaMetadata.METADATA_KEY_DURATION));
        String key=current==null?"":value(m,MediaMetadata.METADATA_KEY_MEDIA_ID)+"\n"+titleText+"\n"+artist+"\n"+duration;
        String local=lyric(m);
        boolean changedTrack=!identity.equals(key)||boundPlayerChanged;
        if(changedTrack){
            identity=key;rawLyrics=local;autoAttempts=0;nextAutoLookup=0;cancelLookup();lines=new SongLines(local);failed=false;manualLyrics=false;
            Bookmark previous=bookmark;bookmark=null;
            if(previous!=null && current!=null && previous.user==owner.userId && previous.player.equals(current.getSessionToken())
                    && key.equals(previous.track) && (previous.manualLyrics || local.equals(previous.sessionLyrics))){
                lines=previous.lines;manualLyrics=previous.manualLyrics;
            }
            lyricStatus=LyricLookup.Status.NO_MATCH;lyricSource=-1;
            // Prefer the session; otherwise try its provider, then the remaining verified sources.


        }else if(!rawLyrics.equals(local) && !manualLyrics){
            SongLines session=new SongLines(local);
            // Some players expose only one frozen/current lyric in metadata.
            // It must not replace the complete synchronized lookup on each poll.
            if(session.timeline()){
                cancelLookup();lines=session;failed=false;lyricStatus=LyricLookup.Status.FOUND;
            }else if(!lines.timeline() && lyricStatus!=LyricLookup.Status.FOUND)lines=session;
        }
        rawLyrics=local;
        ensureLyrics();
        Bitmap art=null;if(m!=null){art=m.getBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART);if(art==null)art=m.getBitmap(MediaMetadata.METADATA_KEY_ART);if(art==null)art=m.getBitmap(MediaMetadata.METADATA_KEY_DISPLAY_ICON);}
        cover.setImageBitmap(art);cover.setVisibility(art==null?GONE:VISIBLE);
        String label=current==null?"暂无播放":current.getPackageName();
        if(current!=null)try{label=owner.ctx.getPackageManager().getApplicationLabel(owner.ctx.getPackageManager().getApplicationInfo(label,0)).toString();}catch(Exception ignored){}
        title.setText(current==null?"暂无播放":(titleText.isEmpty()?label:titleText)+(artist.isEmpty()?"":" · "+artist));
        title.setContentDescription(title.getText());
        actions.removeAllViews();PlaybackState s=current==null?null:current.getPlaybackState();
        boolean playing=s!=null && s.getState()==PlaybackState.STATE_PLAYING;
        button("上一曲",PlaybackState.ACTION_SKIP_TO_PREVIOUS,()->current.getTransportControls().skipToPrevious());
        button(playing?"暂停":"播放",(playing?PlaybackState.ACTION_PAUSE:PlaybackState.ACTION_PLAY)|PlaybackState.ACTION_PLAY_PAUSE,
                ()->{if(playing)current.getTransportControls().pause();else current.getTransportControls().play();});
        button("下一曲",PlaybackState.ACTION_SKIP_TO_NEXT,()->current.getTransportControls().skipToNext());
        seek.setVisibility(duration>0 && permitted(PlaybackState.ACTION_SEEK_TO)?VISIBLE:GONE);
        output.setVisibility(router==null?GONE:VISIBLE);tick();
    }
    void showNative(boolean visible){
        if(nativeCard==null || visible==nativeVisible)return;
        nativeVisible=visible;
        NativeMusicCard.detach(seek);NativeMusicCard.detach(times);
        LinearLayout destination=visible?nativeCard.card:legacy;
        destination.addView(seek,2,new LayoutParams(-1,owner.dp(32)));
        destination.addView(times,3,new LayoutParams(-1,owner.dp(20)));
        legacy.setVisibility(visible?GONE:VISIBLE);nativeCard.setVisibility(visible?VISIBLE:GONE);
    }

    static String value(MediaMetadata m,String k){String v=m==null?null:m.getString(k);return v==null?"":v.trim();}
    static String lyric(MediaMetadata m){
        if(m!=null)for(String k:m.keySet()){
            String key=k.toLowerCase(java.util.Locale.ROOT);
            if(!key.contains("lyric") && !key.endsWith("lrc"))continue;
            String v=value(m,k);
            if(!v.isEmpty() && !v.contains("://") && !v.startsWith("/") && !v.matches("[0-9]+"))return v;
        }
        return "";
    }
    void button(String label,long flag,Runnable click){
        if(!permitted(flag))return;
        MediaController bound=controller;TextView b=StepMaterial.label(owner.ctx,label,12,false);
        StepMaterial.feedback(b);
        b.setOnClickListener(v->{if(controller==bound && permitted(flag))try{click.run();}catch(RuntimeException e){owner.note(e);}});
        actions.addView(b,new LayoutParams(0,-1,1));
    }
    void tick(){
        if(closed)return;
        if(nativeCard!=null){showNative(nativeCard.matches(controller));nativeCard.update(controller);}
        PlaybackState s=controller==null?null:controller.getPlaybackState();
        long pos=s==null?0:s.getPosition();
        if(s!=null && s.getState()==PlaybackState.STATE_PLAYING && s.getLastPositionUpdateTime()>0)
            pos+=Math.round((SystemClock.elapsedRealtime()-s.getLastPositionUpdateTime())*s.getPlaybackSpeed());
        pos=Math.max(0,duration>0?Math.min(duration,pos):pos);
        if(dragOwner==null && duration>0)seek.setProgress((int)Math.round(1000d*pos/duration));
        boolean searchable=controller!=null && !titleText.isEmpty() && !artist.isEmpty();
        boolean identifiable=!titleText.isEmpty() || !value(controller==null?null:controller.getMetadata(),MediaMetadata.METADATA_KEY_MEDIA_ID).isEmpty();
        times.setText(android.text.format.DateUtils.formatElapsedTime(pos/1000)+" / "+android.text.format.DateUtils.formatElapsedTime(duration/1000));
        position=pos;line.setClickable(false);
        if(!manualLyrics && rawLyrics.isEmpty() && !liveLine.isEmpty())line.setText(liveLine);
        else if(!lines.empty()){
            SongLines.Display context=lines.display(pos,true);
            String value=context.text;
            android.text.SpannableString display=new android.text.SpannableString(value);
            if(context.currentStart>0)display.setSpan(new android.text.style.RelativeSizeSpan(.84f),0,context.currentStart,0);
            if(context.currentEnd>=0 && context.currentEnd<value.length())display.setSpan(new android.text.style.RelativeSizeSpan(.84f),context.currentEnd,value.length(),0);
            if(context.currentStart>=0 && context.currentEnd>context.currentStart)
                display.setSpan(new android.text.style.StyleSpan(android.graphics.Typeface.BOLD),context.currentStart,context.currentEnd,0);
            line.setText(display);
        }else line.setText(controller==null?"":fetching?"正在查询歌词…":
                lyricStatus==LyricLookup.Status.INSTRUMENTAL?"纯音乐 · 无歌词":
                lyricStatus==LyricLookup.Status.UNAVAILABLE?"歌词服务暂不可用":
                lyricStatus==LyricLookup.Status.INSUFFICIENT?(identifiable?"播放器未提供完整歌曲信息":"播放器未提供歌曲信息"):
                !identifiable?"播放器未提供歌词":failed?"暂未匹配到歌词":searchable?"暂无歌词":"播放器未提供歌词");
    }
    void cancelLookup(){generation++;fetching=false;if(request!=null)request.cancel(true);request=null;}
    void ensureLyrics(){
        if(closed || fetching || controller==null || lines.timeline() || !liveLine.isEmpty() || manualLyrics
                || lyricStatus==LyricLookup.Status.FOUND && !lines.empty()
                || lyricStatus==LyricLookup.Status.INSTRUMENTAL || autoAttempts>=3
                || SystemClock.elapsedRealtime()<nextAutoLookup || !StepRuntime.interactive(owner.ctx))return;
        if(titleText.isEmpty() || artist.isEmpty() || duration<=0){lyricStatus=LyricLookup.Status.INSUFFICIENT;return;}
        autoAttempts++;nextAutoLookup=SystemClock.elapsedRealtime()+35000;
        findLyrics(-1,false);
    }
    void findLyrics(int source,boolean manual){
        if(closed || controller==null || !owner.currentUser() || !StepRuntime.interactive(owner.ctx))return;
        cancelLookup();
        final String song=titleText,by=artist;final long length=duration;final int stamp=++generation;
        String pkg=controller.getPackageName();String mediaId=value(controller.getMetadata(),MediaMetadata.METADATA_KEY_MEDIA_ID);
        final MediaController bound=controller;final String key=identity;
        boolean enough=!song.isEmpty() && !by.isEmpty() && length>0;
        if(!enough){lyricStatus=LyricLookup.Status.INSUFFICIENT;failed=false;tick();return;}
        fetching=true;tick();
        request=lookup.submit(()->{
            LyricLookup.Result answer;
            try{answer=LyricLookup.run(owner.userId+"\n"+pkg+"\n"+key,source,PlayerLyrics.source(pkg),enough,manual,
                    provider->LyricSources.lookup(provider,song,by,length,pkg,mediaId));}
            catch(java.io.InterruptedIOException cancelled){return;}
            catch(Exception failure){answer=LyricLookup.Result.state(LyricLookup.Status.UNAVAILABLE,-1);}
            final LyricLookup.Result result=answer;
            owner.host.main.post(()->{
                if(closed || stamp!=generation || controller!=bound || !key.equals(identity) || !owner.currentUser())return;
                fetching=false;lyricStatus=result.status;lyricSource=result.source;
                nextAutoLookup=SystemClock.elapsedRealtime()+35000;
                StepRuntime.diagnostic("LYRICS","package="+pkg+";status="+result.status+";source="+result.source+";attempt="+autoAttempts+";sessionTimeline="+new SongLines(rawLyrics).timeline()+";lookupTimeline="+new SongLines(result.text).timeline());
                failed=result.status!=LyricLookup.Status.FOUND;
                if(!failed){lines=new SongLines(result.text);manualLyrics=manual && source>=0;}
                tick();
            });
        });
    }
    void close(){
        bookmark=owner.host.retainOnExit && controller!=null && owner.currentUser()?new Bookmark(this):null;
        closed=true;if(nativeCard!=null)nativeCard.close();
        controller=null;router=null;cover.setImageDrawable(null);cancelLookup();lookup.shutdownNow();
    }
}
