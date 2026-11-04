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
        Bookmark(PlayerCard card){
            user=card.owner.userId;player=card.controller.getSessionToken();track=card.identity;
            sessionLyrics=card.rawLyrics;lines=card.lines;
        }
    }
    private static Bookmark bookmark;
    static void forget(){bookmark=null;}
    static MediaSession.Token previousPlayer(int user){return bookmark!=null && bookmark.user==user?bookmark.player:null;}
    final WorkspaceQuickBar owner;
    final ImageView cover;
    final TextView title,line,output;
    final LinearLayout actions;
    final SeekBar seek;
    final ExecutorService lookup=Executors.newSingleThreadExecutor();
    MediaController controller,dragOwner;
    MediaRouter2 router;
    Future<?> request;
    String titleText="",artist="",identity="",rawLyrics="",dragKey;
    long duration;
    long position;
    int generation;
    boolean closed,failed,fetching;
    SongLines lines=new SongLines(null);

    PlayerCard(WorkspaceQuickBar host){
        super(host.ctx);owner=host;Context c=host.ctx;
        setBackground(StepMaterial.glass(c,false,16));setGravity(Gravity.CENTER_VERTICAL);
        cover=new ImageView(c);cover.setScaleType(ImageView.ScaleType.CENTER_CROP);addView(cover,host.dp(46),host.dp(46));
        LinearLayout center=new LinearLayout(c);center.setOrientation(VERTICAL);center.setGravity(Gravity.CENTER);
        addView(center,new LayoutParams(0,-1,1));
        title=StepMaterial.label(c,"暂无播放",14,true);title.setSingleLine(true);center.addView(title,-1,-2);
        title.setOnClickListener(v->host.deck.players(title));
        line=StepMaterial.label(c,"",11,false);line.setMaxLines(2);line.setEllipsize(TextUtils.TruncateAt.END);
        line.setOnClickListener(v->lyricsMenu());center.addView(line,-1,-2);
        actions=new LinearLayout(c);actions.setGravity(Gravity.CENTER);center.addView(actions,-1,host.dp(26));
        seek=new SeekBar(c);seek.setMax(1000);seek.setContentDescription("播放进度");center.addView(seek,-1,host.dp(20));
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
        output=StepMaterial.label(c,"输出",12,true);output.setContentDescription("选择当前播放器的输出设备");
        output.setOnClickListener(v->{try{if(router!=null && !router.showSystemOutputSwitcher())host.logUnavailable("系统未打开输出设备选择器");}
            catch(RuntimeException e){host.note(e);}});addView(output,host.dp(40),-1);
    }
    boolean permitted(long action){
        PlaybackState s=controller==null?null:controller.getPlaybackState();return s!=null && (s.getActions()&action)!=0;
    }
    void bind(MediaController current){
        if(closed)return;
        boolean boundPlayerChanged=controller!=current;
        if(boundPlayerChanged){
            controller=current;router=null;dragOwner=null;
            if(current!=null && owner.currentUser())try{
                String pkg=current.getPackageName();
                router=MediaRouter2.getInstance(owner.ctx,pkg,owner.host.main::post,()->{
                    if(controller==current){router=null;output.setVisibility(GONE);}
                });
            }catch(RuntimeException|LinkageError unavailable){owner.host.log("原厂输出选择器不可用："+unavailable.getClass().getSimpleName());}
        }
        MediaMetadata m=current==null?null:current.getMetadata();
        titleText=value(m,MediaMetadata.METADATA_KEY_TITLE);artist=value(m,MediaMetadata.METADATA_KEY_ARTIST);
        if(m!=null){
            android.media.MediaDescription desc=m.getDescription();
            if(titleText.isEmpty() && desc.getTitle()!=null)titleText=desc.getTitle().toString();
            if(artist.isEmpty() && desc.getSubtitle()!=null)artist=desc.getSubtitle().toString();
        }
        if("unknown".equalsIgnoreCase(artist) || "<unknown>".equalsIgnoreCase(artist))artist="";
        duration=m==null?0:Math.max(0,m.getLong(MediaMetadata.METADATA_KEY_DURATION));
        String key=current==null?"":value(m,MediaMetadata.METADATA_KEY_MEDIA_ID)+"\n"+titleText+"\n"+artist+"\n"+duration;
        String local=lyric(m);
        if(!identity.equals(key)||!rawLyrics.equals(local)||boundPlayerChanged){
            identity=key;rawLyrics=local;cancelLookup();lines=new SongLines(local);failed=false;
            Bookmark previous=bookmark;bookmark=null;
            if(previous!=null && current!=null && previous.user==owner.userId && previous.player.equals(current.getSessionToken())
                    && key.equals(previous.track) && local.equals(previous.sessionLyrics))lines=previous.lines;
        }
        Bitmap art=null;if(m!=null){art=m.getBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART);if(art==null)art=m.getBitmap(MediaMetadata.METADATA_KEY_ART);if(art==null)art=m.getBitmap(MediaMetadata.METADATA_KEY_DISPLAY_ICON);}
        cover.setImageBitmap(art);cover.setVisibility(art==null?GONE:VISIBLE);
        String label=current==null?"暂无播放":current.getPackageName();
        if(current!=null)try{label=owner.ctx.getPackageManager().getApplicationLabel(owner.ctx.getPackageManager().getApplicationInfo(label,0)).toString();}catch(Exception ignored){}
        title.setText(current==null?"暂无播放":(titleText.isEmpty()?label:titleText)+(artist.isEmpty()?"":" · "+artist));
        title.setContentDescription(current==null?"暂无播放":title.getText()+"，选择播放器");
        actions.removeAllViews();PlaybackState s=current==null?null:current.getPlaybackState();
        boolean playing=s!=null && s.getState()==PlaybackState.STATE_PLAYING;
        button("上一曲",PlaybackState.ACTION_SKIP_TO_PREVIOUS,()->current.getTransportControls().skipToPrevious());
        button(playing?"暂停":"播放",(playing?PlaybackState.ACTION_PAUSE:PlaybackState.ACTION_PLAY)|PlaybackState.ACTION_PLAY_PAUSE,
                ()->{if(playing)current.getTransportControls().pause();else current.getTransportControls().play();});
        button("下一曲",PlaybackState.ACTION_SKIP_TO_NEXT,()->current.getTransportControls().skipToNext());
        seek.setVisibility(duration>0 && permitted(PlaybackState.ACTION_SEEK_TO)?VISIBLE:GONE);
        output.setVisibility(router==null?GONE:VISIBLE);tick();
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
        b.setOnClickListener(v->{if(controller==bound && permitted(flag))try{click.run();}catch(RuntimeException e){owner.note(e);}});
        actions.addView(b,owner.dp(50),-1);
    }
    void tick(){
        if(closed)return;
        PlaybackState s=controller==null?null:controller.getPlaybackState();
        long pos=s==null?0:s.getPosition();
        if(s!=null && s.getState()==PlaybackState.STATE_PLAYING && s.getLastPositionUpdateTime()>0)
            pos+=Math.round((SystemClock.elapsedRealtime()-s.getLastPositionUpdateTime())*s.getPlaybackSpeed());
        pos=Math.max(0,duration>0?Math.min(duration,pos):pos);
        if(dragOwner==null && duration>0)seek.setProgress((int)Math.round(1000d*pos/duration));
        boolean searchable=controller!=null && !titleText.isEmpty() && !artist.isEmpty();
        boolean identifiable=!titleText.isEmpty() || !value(controller==null?null:controller.getMetadata(),MediaMetadata.METADATA_KEY_MEDIA_ID).isEmpty();
        position=pos;line.setClickable(!lines.empty() || identifiable);
        if(!lines.empty()){
            String value=lines.context(pos);
            android.text.SpannableString display=new android.text.SpannableString(value);
            int split=value.indexOf('\n');
            if(split>0)display.setSpan(new android.text.style.RelativeSizeSpan(.84f),split+1,value.length(),0);
            if(lines.current(pos)!=null && !value.isEmpty())display.setSpan(new android.text.style.StyleSpan(android.graphics.Typeface.BOLD),0,split>0?split:value.length(),0);
            line.setText(display);
        }else line.setText(controller==null?"":!identifiable?"播放器未提供歌词":fetching?"正在查询歌词…":failed?"未匹配歌词 · 点按重试":searchable?"选择歌词来源":"选择本地歌词");
    }
    void cancelLookup(){generation++;fetching=false;if(request!=null)request.cancel(true);request=null;}
    void lyricsMenu(){
        if(controller==null || closed)return;
        String key=identity;MediaController bound=controller;
        android.widget.PopupMenu menu=new android.widget.PopupMenu(owner.ctx,line);
        for(java.util.Map.Entry<Long,String> row:lines.nearby(position)){
            long at=row.getKey();String words=row.getValue().replace('\n',' ');
            boolean current=row.equals(lines.current(position));
            menu.getMenu().add((current?"● ":"")+String.format(java.util.Locale.ROOT,"%d:%02d  ",at/60000,(at/1000)%60)+words)
                .setEnabled(permitted(PlaybackState.ACTION_SEEK_TO)).setOnMenuItemClickListener(item->{
                    if(controller==bound && key.equals(identity) && permitted(PlaybackState.ACTION_SEEK_TO))
                        try{bound.getTransportControls().seekTo(at);}catch(RuntimeException e){owner.note(e);}
                    return true;
                });
        }
        if(!rawLyrics.isEmpty())menu.getMenu().add("播放器歌词").setOnMenuItemClickListener(item->{
            if(controller==bound && key.equals(identity)){cancelLookup();lines=new SongLines(rawLyrics);failed=false;tick();}return true;});
        if(!titleText.isEmpty() || !value(bound.getMetadata(),MediaMetadata.METADATA_KEY_MEDIA_ID).isEmpty())
            menu.getMenu().add("打开本地歌词文件").setOnMenuItemClickListener(item->{pickLocal(bound,key);return true;});
        if(!titleText.isEmpty() && !artist.isEmpty())for(int i=0;i<LyricSources.names.length;i++){
            final int source=i;
            menu.getMenu().add(LyricSources.names[i]).setOnMenuItemClickListener(item->{if(controller==bound && key.equals(identity))findLyrics(source);return true;});
        }
        if(menu.getMenu().size()>0)menu.show();
    }
    void pickLocal(MediaController bound,String key){
        if(closed || bound!=controller || !identity.equals(key) || !owner.currentUser())return;
        cancelLookup();int stamp=generation;
        android.os.ResultReceiver reply=new android.os.ResultReceiver(owner.host.main){
            @Override protected void onReceiveResult(int code,android.os.Bundle data){
                if(closed || stamp!=generation || controller!=bound || !identity.equals(key) || !owner.currentUser())return;
                if(code!=1){owner.logUnavailable(data.getString("error","歌词未导入"));return;}
                lines=new SongLines(data.getString("lyrics"));failed=false;tick();
            }
        };
        try{owner.ctx.startActivity(new android.content.Intent().setClassName(StepRuntime.PACKAGE,LocalLyricsActivity.class.getName())
                .addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK).putExtra("reply",StepRuntime.remote(reply)));}
        catch(RuntimeException e){owner.note(e);}
    }
    void findLyrics(int source){
        if(closed || controller==null || !owner.currentUser() || !StepRuntime.interactive(owner.ctx))return;
        cancelLookup();
        final String song=titleText,by=artist;final long length=duration;final int stamp=++generation;
        String pkg=controller.getPackageName();String mediaId=value(controller.getMetadata(),MediaMetadata.METADATA_KEY_MEDIA_ID);
        fetching=true;tick();
        request=lookup.submit(()->{
            String text="";
            try{text=LyricSources.lookup(source,song,by,length,pkg,mediaId);}catch(Exception ignored){}
            SongLines result=new SongLines(text);
            owner.host.main.post(()->{if(!closed && stamp==generation){fetching=false;failed=result.empty();if(!failed)lines=result;tick();}});
        });
    }
    void close(){
        bookmark=owner.host.retainOnExit && controller!=null && owner.currentUser()?new Bookmark(this):null;
        closed=true;controller=null;router=null;cover.setImageDrawable(null);cancelLookup();lookup.shutdownNow();
    }
}
