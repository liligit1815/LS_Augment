package ls.augment.com.hook;

import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.media.session.PlaybackState;
import android.os.SystemClock;
import android.text.format.DateUtils;
import android.view.View;
import android.widget.SeekBar;
import android.widget.TextView;

import static ls.augment.com.hook.SystemUiAdapter.field;

/** Session-backed seek on the Duo-owned ordinary panel when its native view model is absent. */
final class IslandLegacyMediaProgress implements SeekBar.OnSeekBarChangeListener,View.OnAttachStateChangeListener {
    private SeekBar bar;
    private TextView elapsed,total;
    private MediaController source,drag;
    private final Runnable tick=this::render;
    void bind(Object panel,MediaController controller){
        Object b=field(panel,"mMediaProgress"),e=field(panel,"mElapsedTime"),t=field(panel,"mTotalTime");
        if(!(b instanceof SeekBar)||!(e instanceof TextView)||!(t instanceof TextView)||field(panel,"mSeekBarViewModel")!=null){clear();return;}
        if(bar!=b||source==null||!source.getSessionToken().equals(controller.getSessionToken())){
            clear();bar=(SeekBar)b;elapsed=(TextView)e;total=(TextView)t;source=controller;
            bar.setOnSeekBarChangeListener(this);bar.addOnAttachStateChangeListener(this);
        }
        render();
    }
    private void render(){
        if(bar==null)return;bar.removeCallbacks(tick);
        MediaMetadata m=source.getMetadata();PlaybackState s=source.getPlaybackState();
        long length=m==null?0:Math.min(Integer.MAX_VALUE,m.getLong(MediaMetadata.METADATA_KEY_DURATION));
        int visibility=length>0&&s!=null&&s.getPosition()>=0?View.VISIBLE:View.GONE;
        bar.setVisibility(visibility);elapsed.setVisibility(visibility);total.setVisibility(visibility);
        if(visibility!=View.VISIBLE)return;
        long pos=s.getPosition();boolean playing=s.getState()==PlaybackState.STATE_PLAYING;
        if(playing&&s.getLastPositionUpdateTime()>0)pos+=(long)(Math.max(0,SystemClock.elapsedRealtime()-s.getLastPositionUpdateTime())*s.getPlaybackSpeed());
        bar.setMax((int)length);bar.setEnabled((s.getActions()&PlaybackState.ACTION_SEEK_TO)!=0);
        if(drag==null)bar.setProgress((int)Math.max(0,Math.min(length,pos)));
        elapsed.setText(DateUtils.formatElapsedTime(bar.getProgress()/1000));total.setText(DateUtils.formatElapsedTime(length/1000));
        if(playing&&bar.isShown()&&bar.isAttachedToWindow())bar.postDelayed(tick,500);
    }
    public void onStartTrackingTouch(SeekBar b){drag=source;}
    public void onProgressChanged(SeekBar b,int pos,boolean user){if(user&&drag!=null)elapsed.setText(DateUtils.formatElapsedTime(pos/1000));}
    public void onStopTrackingTouch(SeekBar b){
        MediaController bound=drag;drag=null;
        if(bound==null||bound!=source||!b.isShown())return;
        PlaybackState s=bound.getPlaybackState();
        if(s!=null&&(s.getActions()&PlaybackState.ACTION_SEEK_TO)!=0)bound.getTransportControls().seekTo(b.getProgress());
    }
    public void onViewAttachedToWindow(View v){render();}
    public void onViewDetachedFromWindow(View v){v.removeCallbacks(tick);drag=null;}
    void clear(){if(bar!=null){bar.removeCallbacks(tick);bar.removeOnAttachStateChangeListener(this);bar.setOnSeekBarChangeListener(null);}
        bar=null;source=drag=null;elapsed=total=null;}
}
