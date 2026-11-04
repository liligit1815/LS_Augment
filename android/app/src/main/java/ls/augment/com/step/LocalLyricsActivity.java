package ls.augment.com.step;

import android.app.Activity;
import android.content.Intent;
import android.os.*;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

/** The system document picker grants access only to the file chosen for this song. */
public final class LocalLyricsActivity extends Activity {
    @Override protected void onCreate(Bundle state){
        super.onCreate(state);
        if(getIntent().getParcelableExtra("reply")==null){finish();return;}
        if(state==null)try{startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
                .setType("*/*").putExtra(Intent.EXTRA_TITLE,"选择本地歌词"),1);}
        catch(RuntimeException unavailable){finish();}
    }
    @Override protected void onActivityResult(int req,int result,Intent data){
        super.onActivityResult(req,result,data);
        ResultReceiver reply=getIntent().getParcelableExtra("reply");
        if(req!=1 || result!=RESULT_OK || data==null || data.getData()==null || reply==null){finish();return;}
        android.net.Uri uri=data.getData();
        new Thread(()->{
            Bundle msg=new Bundle();
            try(InputStream input=getContentResolver().openInputStream(uri);ByteArrayOutputStream bytes=new ByteArrayOutputStream()){
                byte[] b=new byte[4096];int n;
                while(input!=null && (n=input.read(b))!=-1){
                    if(bytes.size()+n>120000)throw new java.io.IOException("歌词文件超过 120 KB");
                    bytes.write(b,0,n);
                }
                String lyrics=StandardCharsets.UTF_8.newDecoder().decode(java.nio.ByteBuffer.wrap(bytes.toByteArray())).toString();
                if(lyrics.startsWith("\ufeff"))lyrics=lyrics.substring(1);
                if(lyrics.indexOf('\0')>=0 || new SongLines(lyrics).empty())throw new java.io.IOException("没有可显示的歌词");
                msg.putString("lyrics",lyrics);reply.send(1,msg);
            }catch(Exception e){msg.putString("error","无法读取歌词，请选择 UTF-8 文本或 LRC 文件（最多 120 KB）");reply.send(0,msg);}
            runOnUiThread(this::finish);
        },"StepLocalLyrics").start();
    }
}
