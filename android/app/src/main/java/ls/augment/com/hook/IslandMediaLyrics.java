package ls.augment.com.hook;

import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.media.session.PlaybackState;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.*;
import ls.augment.com.IslandVisualSpec;
import ls.augment.com.SystemUiOptions;
import ls.augment.com.step.IslandLyricsSource;
import ls.augment.com.step.SongLines;
import static ls.augment.com.hook.SystemUiAdapter.field;

final class IslandMediaLyrics {
    private final Handler main=new Handler(Looper.getMainLooper());
    private static final ExecutorService IO=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"DuoIslandLyrics");t.setDaemon(true);return t;});
    private View card,panel;
    private TextView compact,album,line,translation;
    private LinearLayout block;
    private final View.OnAttachStateChangeListener attachments=new View.OnAttachStateChangeListener(){
        public void onViewAttachedToWindow(View v){render();}
        public void onViewDetachedFromWindow(View v){if(card!=null&&!card.isAttachedToWindow()&&!panel.isAttachedToWindow())main.removeCallbacks(tick);}
    };
    static void bindFullscreen(IslandMediaLyrics lyrics,Object manager,Object card,MediaController selected,int user){
        try{
            Object panel=card==null?null:SystemUiAdapter.call(card,"getPanelIsland");
            Object bound=SystemUiAdapter.field(panel,"mMediaController");
            lyrics.bind(manager,card,panel,bound instanceof MediaController&&selected.getSessionToken().equals(((MediaController)bound).getSessionToken())?selected:null,user);
        }catch(Exception unavailable){lyrics.clear();}
    }
    private IslandCompactWidth width;
    private MediaController source;
    private MediaController.Callback callback;
    private Future<?> lookup;
    private SongLines lines;
    private long generation,duration;
    private List<?> track;
    private String title="",albumName="";
    private boolean hadSessionLines;
    private int user,choice;
    private PlaybackState state;
    private final Runnable tick=this::render;

    void bind(Object manager,Object small,Object large,MediaController controller,int userId){
        if(!(small instanceof View)||!(large instanceof View)||controller==null||userId<0){clear();return;}
        if(source!=null&&card==small&&panel==large&&user==userId&&source.getSessionToken().equals(controller.getSessionToken())){
            int setting=setting();if(setting!=choice){track=null;update();}return;
        }
        clear();card=(View)small;panel=(View)large;source=controller;user=userId;
        try{
            card.addOnAttachStateChangeListener(attachments);panel.addOnAttachStateChangeListener(attachments);
            Object header=field(panel,"mDisplayContainer");
            if(!(header instanceof LinearLayout)){Object heading=field(panel,"mDisplayTitle");if(heading instanceof TextView)header=((TextView)heading).getParent();}
            if(header instanceof LinearLayout&&((LinearLayout)header).getOrientation()==LinearLayout.VERTICAL){
                LinearLayout labels=(LinearLayout)header;album=label(labels,11,IslandVisualSpec.SECONDARY);
                LinearLayout target=labels;
                if(panel instanceof FrameLayout&&IslandMediaLayout.supportsLyrics(panel)){
                    block=new LinearLayout(panel.getContext());block.setOrientation(LinearLayout.VERTICAL);
                    block.setTag("duo_media_lyrics");block.setVisibility(View.GONE);
                    ((FrameLayout)panel).addView(block,new FrameLayout.LayoutParams(-1,-2));target=block;
                }
                line=label(target,16,IslandVisualSpec.PRIMARY);translation=label(target,12,IslandVisualSpec.SECONDARY);
            }
            if(card instanceof FrameLayout){
                try{width=new IslandCompactWidth(card.getContext(),manager,card);}catch(Exception unverified){width=null;}
                FrameLayout host=(FrameLayout)card;compact=new TextView(host.getContext());compact.setSingleLine(true);
                compact.setTextSize(12);compact.setTextColor(IslandVisualSpec.PRIMARY);compact.setEllipsize(TextUtils.TruncateAt.END);
                FrameLayout.LayoutParams params=new FrameLayout.LayoutParams(-1,-2,Gravity.CENTER_VERTICAL);
                params.setMarginStart(dp(30));params.setMarginEnd(dp(31));host.addView(compact,params);
            }
            MediaController bound=source;
            callback=new MediaController.Callback(){
                @Override public void onMetadataChanged(MediaMetadata metadata){if(source==bound)update();}
                @Override public void onPlaybackStateChanged(PlaybackState next){if(source==bound){state=next;render();}}
                @Override public void onSessionDestroyed(){if(source==bound)clear();}
            };
            source.registerCallback(callback,main);state=source.getPlaybackState();update();
        }catch(RuntimeException unavailable){clear();FeatureRuntimeLog.state("ISLAND_LYRICS","native","view_or_session_unavailable");}
    }
    private int setting(){return FeatureSettings.integer(card.getContext(),SystemUiOptions.PREFIX+"island_lyrics_source",0,0,5);}
    private int dp(int n){return Native12IslandStyle.dp(card.getContext(),n);}
    private TextView label(LinearLayout parent,int size,int color){
        TextView text=new TextView(parent.getContext());text.setTextSize(size);text.setTextColor(color);
        text.setTag("duo_island_lyric_"+(color==IslandVisualSpec.SECONDARY?"secondary":"primary"));
        text.setMaxLines(3);text.setEllipsize(TextUtils.TruncateAt.END);text.setVisibility(View.GONE);
        parent.addView(text,new LinearLayout.LayoutParams(-1,-2));return text;
    }
    private static String text(MediaMetadata m,String key){CharSequence v=m==null?null:m.getText(key);return v==null?"":v.toString().trim();}
    private void update(){
        try{
            MediaMetadata m=source.getMetadata();String pkg=source.getPackageName(),id=text(m,MediaMetadata.METADATA_KEY_MEDIA_ID);
            title=text(m,MediaMetadata.METADATA_KEY_TITLE);if(title.isEmpty())title=text(m,MediaMetadata.METADATA_KEY_DISPLAY_TITLE);
            albumName=text(m,MediaMetadata.METADATA_KEY_ALBUM);String artist=text(m,MediaMetadata.METADATA_KEY_ARTIST);
            duration=m==null?0:m.getLong(MediaMetadata.METADATA_KEY_DURATION);choice=setting();
            List<?> next=Arrays.asList(id,title,artist,albumName,duration,choice);
            boolean changed=!Objects.equals(next,track);
            if(changed){generation++;if(lookup!=null)lookup.cancel(true);lookup=null;lines=null;track=next;}
            SongLines local=IslandLyricsSource.session(m);
            boolean lostSession=hadSessionLines&&local.empty();hadSessionLines=!local.empty();
            if(lostSession)lines=null;
            if(!local.empty()){generation++;if(lookup!=null)lookup.cancel(true);lookup=null;lines=local;}
            else if((changed||lostSession)&&choice>0&&!title.isEmpty()&&!artist.isEmpty()&&duration>0){
                long epoch=generation,ms=duration;int selected=choice,owner=user;String name=title;
                lookup=IO.submit(()->{try{
                    SongLines result=IslandLyricsSource.lookup(owner,pkg,id,name,artist,ms,selected);
                    main.post(()->{if(generation==epoch&&source!=null){lines=result;render();}});
                }catch(Exception unavailable){/* Song metadata remains visible. */}});
            }
            render();
        }catch(RuntimeException malformed){generation++;lines=null;title="";albumName="";render();}
    }
    private void render(){
        main.removeCallbacks(tick);if(source==null)return;
        long pos=state==null?-1:state.getPosition();
        boolean playing=state!=null&&state.getState()==PlaybackState.STATE_PLAYING;
        if(playing&&pos>=0&&state.getLastPositionUpdateTime()>0)pos+=(long)(Math.max(0,SystemClock.elapsedRealtime()-state.getLastPositionUpdateTime())*state.getPlaybackSpeed());
        java.util.Map.Entry<Long,String> current=lines==null||pos<0?null:lines.current(duration>0?Math.min(duration,pos):pos);
        String[] words=current==null?new String[]{""}:current.getValue().split("\n",2);
        assign(album,albumName);assign(line,words[0]);assign(translation,words.length==2?words[1]:"");
        if(block!=null)block.setVisibility(words[0].isEmpty()?View.GONE:View.VISIBLE);
        String shortText=words[0].isEmpty()?title:words[0];
        if(compact!=null&&(!TextUtils.equals(compact.getText(),shortText)||compact.getVisibility()!=(shortText.isEmpty()?View.GONE:View.VISIBLE))){
            if(width!=null)try{if(shortText.isEmpty())width.restore();else width.apply(compact.getPaint().measureText(shortText)+dp(15),true);}
            catch(Exception unavailable){width.restore();width=null;}
            assign(compact,shortText);
        }
        if(playing&&lines!=null&&!lines.empty()&&(card.isAttachedToWindow()||panel.isAttachedToWindow()))main.postDelayed(tick,350);
    }
    private static void assign(TextView view,String value){
        if(view==null)return;
        if(!TextUtils.equals(view.getText(),value))view.setText(value);
        int visible=value.isEmpty()?View.GONE:View.VISIBLE;if(view.getVisibility()!=visible)view.setVisibility(visible);
    }
    void clear(){
        generation++;main.removeCallbacks(tick);if(lookup!=null)lookup.cancel(true);lookup=null;
        if(source!=null&&callback!=null)try{source.unregisterCallback(callback);}catch(RuntimeException ignored){}
        if(card!=null)card.removeOnAttachStateChangeListener(attachments);if(panel!=null)panel.removeOnAttachStateChangeListener(attachments);
        if(block!=null&&block.getParent() instanceof ViewGroup)((ViewGroup)block.getParent()).removeView(block);block=null;
        if(width!=null)width.restore();width=null;
        for(TextView text:new TextView[]{compact,album,line,translation})if(text!=null&&text.getParent() instanceof ViewGroup)((ViewGroup)text.getParent()).removeView(text);
        compact=album=line=translation=null;source=null;card=panel=null;lines=null;track=null;callback=null;state=null;hadSessionLines=false;
    }
}
