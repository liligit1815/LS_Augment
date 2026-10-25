package ls.augment.com;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.UUID;

/** Independent log export. Collection and document writes never block the UI thread. */
public final class LogExportActivity extends Activity {
    private static final int SAVE=73;
    private Job job;
    private TextView status;
    private boolean pickerOpen;
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        UiKit ui=new UiKit(this);LinearLayout page=ui.detailPage("导出日志",null);
        status=ui.text("正在收集设备、权限、功能配置与运行记录…",14,ui.muted,false);
        page.addView(status,ui.wrap());
        job=(Job)getLastNonConfigurationInstance();
        pickerOpen=state!=null&&state.getBoolean("picker");
        if(job==null){
            String name=state==null?null:state.getString("file");
            if(name==null||!name.matches("duo-log-[a-f0-9-]+\\.txt"))name="duo-log-"+UUID.randomUUID()+".txt";
            job=new Job(getApplicationContext(),new File(getCacheDir(),name));
            job.collect(pickerOpen);
        }
        job.owner=this;render();
    }
    @Override public Object onRetainNonConfigurationInstance(){return job;}
    @Override protected void onSaveInstanceState(Bundle state){state.putBoolean("picker",pickerOpen);state.putString("file",job.file.getName());super.onSaveInstanceState(state);}
    @Override protected void onDestroy(){if(job!=null){job.owner=null;if(isFinishing()){job.discard=true;if(job.phase!=0&&job.phase!=2)job.release();}}super.onDestroy();}
    private void render(){
        if(isFinishing()||isDestroyed())return;
        if(job.phase==1&&!pickerOpen){
            pickerOpen=true;
            try{startActivityForResult(new Intent(Intent.ACTION_CREATE_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
                    .setType("text/plain").putExtra(Intent.EXTRA_TITLE,"红魔Duo-logs-"+System.currentTimeMillis()+".txt"),SAVE);}
            catch(RuntimeException error){job.fail("无法打开文件保存位置");}
        }else if(job.phase==2)status.setText("正在保存日志…");
        else if(job.phase==3||job.phase==4){Toast.makeText(this,job.message,Toast.LENGTH_LONG).show();job.release();finish();}
    }
    @Override protected void onActivityResult(int request,int result,Intent data){
        super.onActivityResult(request,result,data);
        if(request!=SAVE)return;
        pickerOpen=false;
        if(result!=RESULT_OK||data==null||data.getData()==null){job.discard=true;if(job.phase!=0)job.release();finish();return;}
        job.save(data.getData());render();
    }
    private static final class Job {
        final Context context;File file;final Handler main=new Handler(Looper.getMainLooper());
        volatile boolean discard;boolean leased;int phase;String message="";LogExportActivity owner;Uri pendingSave;
        Job(Context context,File file){this.context=context;this.file=file;}
        void collect(boolean resume){new Thread(()->{try{
            file=LogExportCache.acquire(context.getCacheDir(),file.getName(),System.currentTimeMillis());leased=true;
            if(!resume||!file.isFile()){
                byte[] bytes=DiagnosticExport.build(context).getBytes(StandardCharsets.UTF_8);
                if(bytes.length>LogExportCache.MAX_FILE_BYTES)throw new IOException("export_size_limit");
                Files.write(file.toPath(),bytes);
            }
            main.post(()->{if(discard){release();return;}phase=1;if(pendingSave!=null){Uri uri=pendingSave;pendingSave=null;save(uri);}notifyOwner();});
        }catch(Exception error){main.post(()->fail("日志收集失败："+error.getClass().getSimpleName()));}},"duo-log-collect").start();}
        void save(Uri uri){if(phase==0){pendingSave=uri;return;}if(phase!=1)return;phase=2;new Thread(()->{try(InputStream input=new FileInputStream(file);OutputStream output=context.getContentResolver().openOutputStream(uri,"wt")){
            if(output==null)throw new IOException("no_output");byte[] bytes=new byte[8192];int count;
            while((count=input.read(bytes))!=-1)output.write(bytes,0,count);output.flush();
        }catch(Exception error){main.post(()->fail("日志保存失败："+error.getClass().getSimpleName()));return;}
            main.post(()->{phase=3;message="日志已导出";release();notifyOwner();});},"duo-log-save").start();}
        void release(){if(leased){leased=false;File released=file;new Thread(()->LogExportCache.release(released),"duo-log-cleanup").start();}}
        void fail(String error){phase=4;message=error;release();notifyOwner();}
        void notifyOwner(){if(owner!=null)owner.render();}
    }
}
