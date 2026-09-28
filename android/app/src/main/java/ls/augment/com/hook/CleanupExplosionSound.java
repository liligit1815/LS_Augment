package ls.augment.com.hook;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.media.AudioAttributes;
import android.media.AudioManager;
import android.media.SoundPool;

/** Preloaded short effect; never changes system volume, focus or the ringer mode. */
final class CleanupExplosionSound {
    private static SoundPool pool;
    private static int sample;
    private static volatile boolean ready;
    static synchronized void prepare(Context context){
        if(pool!=null)return;
        try{
            Context module=context.createPackageContext("ls.augment.com",0);
            int id=module.getResources().getIdentifier("cleanup_explosion","raw","ls.augment.com");
            if(id==0)return;
            SoundPool next=new SoundPool.Builder().setMaxStreams(1).setAudioAttributes(new AudioAttributes.Builder()
                    .setUsage(AudioAttributes.USAGE_ASSISTANCE_SONIFICATION)
                    .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION).build()).build();
            next.setOnLoadCompleteListener((p,s,status)->{ready=status==0;
                FeatureSettings.diagnostic(context,"ls_augment_cleanup_sound_runtime",ready?"loaded":"load_failed:"+status);});
            try(AssetFileDescriptor asset=module.getResources().openRawResourceFd(id)){
                pool=next;sample=next.load(asset,1);
            }catch(Exception error){next.release();pool=null;ready=false;}
        }catch(Exception error){FeatureSettings.diagnostic(context,"ls_augment_cleanup_sound_runtime","unavailable:"+error.getClass().getSimpleName());}
    }
    static synchronized int play(Context context){
        try{
            AudioManager manager=(AudioManager)context.getSystemService(Context.AUDIO_SERVICE);
            if(manager==null||manager.getRingerMode()!=AudioManager.RINGER_MODE_NORMAL
                    ||manager.getStreamVolume(AudioManager.STREAM_SYSTEM)==0){
                FeatureSettings.diagnostic(context,"ls_augment_cleanup_sound_runtime","muted_by_system");return 0;
            }
            if(!ready||pool==null)return 0;
            int stream=pool.play(sample,.8f,.8f,1,0,1f);
            FeatureSettings.diagnostic(context,"ls_augment_cleanup_sound_runtime","explosion_stream="+stream);
            return stream;
        }catch(RuntimeException ignored){return 0;}
    }
    static synchronized void stop(int stream){if(stream!=0&&pool!=null)pool.stop(stream);}
}
