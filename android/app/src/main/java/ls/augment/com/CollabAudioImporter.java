package ls.augment.com;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.MediaStore;
import android.widget.Button;
import android.widget.LinearLayout;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicBoolean;

/** Copies existing ROM audio only after an explicit click; never changes the selected sound. */
public final class CollabAudioImporter {
    private static final AtomicBoolean RUNNING=new AtomicBoolean();
    private static final long MAX_FILE=20L*1024*1024, MAX_TOTAL=256L*1024*1024;
    private CollabAudioImporter() { }

    static void addAction(Activity activity,UiKit ui,LinearLayout card,ExecutorService worker){
        card.addView(ui.text("把本机预置联名铃声、通知音和闹钟复制到系统声音库。不下载素材，不改变当前声音；重复导入会跳过已有文件。导入的副本可在文件管理中删除。",12,ui.muted,false),ui.wrap());
        Button button=ui.tonalButton("导入本机联名铃声");card.addView(button,ui.wrap());
        button.setOnClickListener(v->{
            if(!RUNNING.compareAndSet(false,true))return;
            ui.setButtonEnabled(button,false);button.setText("正在导入…");
            try{worker.execute(()->{
                String summary;
                try{summary=importAudio(activity.getApplicationContext());}
                catch(Exception error){summary="导入未完成："+error.getClass().getSimpleName();}
                finally{RUNNING.set(false);}
                String message=summary;
                activity.runOnUiThread(()->{if(activity.isDestroyed())return;ui.setButtonEnabled(button,true);button.setText("导入本机联名铃声");
                    AppDialogs.builder(activity).setTitle("联名铃声").setMessage(message).setPositiveButton("确定",null).show();});
            });}catch(RejectedExecutionException closed){
                RUNNING.set(false);ui.setButtonEnabled(button,true);button.setText("导入本机联名铃声");
            }
        });
    }

    private static String importAudio(Context context)throws IOException{
        // Static roots only. Java validates every returned component before any subsequent command.
        String listing="for c in ringtones notifications alarms; do for d in /product/media/audio/$c/IP_*; do "
                +"[ -d \"$d\" ] && [ ! -L \"$d\" ] || continue; for f in \"$d\"/*.ogg; do "
                +"[ -f \"$f\" ] && [ ! -L \"$f\" ] || continue; printf '%s\\n' \"$f\"; done; done; done";
        RootShell.Result result=RootShell.run(listing,null,20,128*1024);
        if(!result.isSuccess())return "无法读取本机联名音频："+result.publicError();
        if(result.capture!=null&&!result.capture.reliable())return "联名音频清单未完整读取，未开始导入。";
        int copied=0,skipped=0,failed=0,matched=0;long total=0;
        for(String source:result.output.split("\\r?\\n")){
            String[] path=source.split("/",-1);
            if(path.length!=7||!source.startsWith("/product/media/audio/")||!CollabPolicy.validAudioCategory(path[4])
                    ||!CollabPolicy.validAudioVariant(path[5])||!CollabPolicy.validAudioName(path[6]))continue;
            if(++matched>256){failed++;break;}
            String name=CollabPolicy.audioDestinationName(path[5],path[6]);
            String relative=(path[4].equals("ringtones")?"Ringtones":path[4].equals("notifications")?"Notifications":"Alarms")+"/红魔Duo/";
            ContentResolver resolver=context.getContentResolver();
            Uri collection=MediaStore.Audio.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY);
            if(existsEither(context,resolver,collection,relative,name)){skipped++;continue;}
            File staging=File.createTempFile("collab-audio-",".ogg",context.getCacheDir());
            Uri added=null;
            try{
                String src=RootShell.quote(source),dst=RootShell.quote(staging.getCanonicalPath());
                String copy="[ \"$(readlink -f "+src+")\" = "+src+" ] && [ ! -L "+dst+" ] && "
                        +"[ -f "+src+" ] && [ \"$(stat -c %s "+src+")\" -le "+MAX_FILE+" ] && cat "+src+" > "+dst;
                RootShell.Result read=RootShell.run(copy,null,20,4096);
                long size=staging.length();
                if(!read.isSuccess()||size<=0||size>MAX_FILE||total+size>MAX_TOTAL){failed++;continue;}
                // A previous import may have completed while the source was being staged.
                if(existsEither(context,resolver,collection,relative,name)){skipped++;continue;}
                ContentValues values=new ContentValues();values.put(MediaStore.MediaColumns.DISPLAY_NAME,name);
                values.put(MediaStore.MediaColumns.RELATIVE_PATH,relative);values.put(MediaStore.MediaColumns.MIME_TYPE,"audio/ogg");
                values.put(MediaStore.MediaColumns.IS_PENDING,1);values.put(MediaStore.Audio.Media.IS_MUSIC,0);
                values.put(MediaStore.Audio.Media.IS_RINGTONE,path[4].equals("ringtones")?1:0);
                values.put(MediaStore.Audio.Media.IS_NOTIFICATION,path[4].equals("notifications")?1:0);
                values.put(MediaStore.Audio.Media.IS_ALARM,path[4].equals("alarms")?1:0);
                added=resolver.insert(collection,values);if(added==null)throw new IOException("media_insert");
                try(FileInputStream input=new FileInputStream(staging);OutputStream output=resolver.openOutputStream(added,"w")){
                    if(output==null)throw new IOException("media_output");byte[] buffer=new byte[16384];int n;long written=0;
                    while((n=input.read(buffer))!=-1){written+=n;if(written>MAX_FILE)throw new IOException("audio_size");output.write(buffer,0,n);}
                    if(written!=size)throw new IOException("audio_changed");
                }
                values.clear();values.put(MediaStore.MediaColumns.IS_PENDING,0);
                if(resolver.update(added,values,null,null)!=1)throw new IOException("media_publish");
                total+=size;copied++;added=null;
            }catch(Exception error){failed++;}
            finally{if(added!=null)try{resolver.delete(added,null,null);}catch(RuntimeException ignored){}staging.delete();}
        }
        String summary=matched==0?"本机未找到可导入的联名音频。":"已导入 "+copied+" 个，已有 "+skipped+" 个，失败或超出限制 "+failed+" 个。副本位于 Ringtones、Notifications、Alarms 下的红魔Duo文件夹（兼容旧版本已导入文件）。";
        context.getSharedPreferences(AppConfig.DIAGNOSTICS,0).edit().putString("ls_augment_collab_audio_import",summary).apply();
        return summary;
    }
    private static boolean existsEither(Context context,ContentResolver resolver,Uri collection,String relative,String name)throws IOException{
        return exists(context,resolver,collection,relative,name)
                ||exists(context,resolver,collection,relative.replace("/红魔Duo/","/LS_Augment/"),name.replace("红魔Duo_","LS_"));
    }
    private static boolean exists(Context context,ContentResolver resolver,Uri collection,String relative,String name)throws IOException{
        boolean existing=false;
        try(Cursor cursor=resolver.query(collection,new String[]{MediaStore.MediaColumns._ID,MediaStore.MediaColumns.IS_PENDING,MediaStore.MediaColumns.OWNER_PACKAGE_NAME},
                MediaStore.MediaColumns.RELATIVE_PATH+"=? AND "+MediaStore.MediaColumns.DISPLAY_NAME+"=?",new String[]{relative,name},null)){
            if(cursor==null)throw new IOException("media_query");
            while(cursor.moveToNext()){
                if(cursor.getInt(1)==1&&context.getPackageName().equals(cursor.getString(2))){
                    // Recover only this package's unfinished insertion after process death.
                    Uri pending=android.content.ContentUris.withAppendedId(collection,cursor.getLong(0));
                    if(resolver.delete(pending,null,null)!=1)throw new IOException("pending_cleanup");
                }else existing=true;
            }
            return existing;
        }
    }
}
