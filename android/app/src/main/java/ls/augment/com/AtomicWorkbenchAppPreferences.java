package ls.augment.com;

import android.content.Context;
import android.util.AtomicFile;
import java.io.*;
import java.util.Arrays;

/** User-private presentation preferences. Never a launcher catalog or launch authority. */
final class AtomicWorkbenchAppPreferences {
    private static final Object LOCK=new Object();
    interface Storage { byte[] read() throws IOException; void write(byte[] value) throws IOException; }
    interface Change { AtomicWorkbenchAppListModel.State apply(AtomicWorkbenchAppListModel.State state); }
    static final class Result {
        final boolean success;
        final String message;
        final AtomicWorkbenchAppListModel.State state;
        Result(boolean success,String message,AtomicWorkbenchAppListModel.State state){this.success=success;this.message=message;this.state=state;}
    }
    private final int userId;
    private final Storage storage;
    AtomicWorkbenchAppPreferences(Context context) {
        this(android.os.Process.myUid()/100000,new Local(new File(context.getFilesDir(),
                "atomic-workbench-apps/user-"+(android.os.Process.myUid()/100000)+".bin")));
    }
    AtomicWorkbenchAppPreferences(int userId,Storage storage){this.userId=userId;this.storage=storage;}
    Result read() {
        synchronized(LOCK){try{return new Result(true,"",AtomicWorkbenchAppListModel.decode(storage.read(),userId));}
            catch(IOException|RuntimeException failure){return new Result(false,"应用偏好读取失败，暂用上次顺序（首次为默认）；未覆盖原配置。",null);}}
    }
    Result change(long generation,Change change) {
        synchronized(LOCK){synchronized(ResetWriteFence.class){
            if(ResetWriteFence.stale(generation))return new Result(false,"配置已重置，请重新打开应用管理。",null);
            try {
                AtomicWorkbenchAppListModel.State prior=AtomicWorkbenchAppListModel.decode(storage.read(),userId);
                AtomicWorkbenchAppListModel.State next=change.apply(prior);
                if(next.userId!=userId)throw new IOException("app_preferences_owner");
                byte[] bytes=AtomicWorkbenchAppListModel.encode(next);storage.write(bytes);
                if(!Arrays.equals(bytes,storage.read()))throw new IOException("app_preferences_verify");
                return new Result(true,"已保存",next);
            }catch(IOException|RuntimeException failure){return new Result(false,"保存未确认，未自动重试；请重新读取后核对。",null);}
        }}
    }
    private static final class Local implements Storage {
        final File file; final AtomicFile atomic;
        Local(File file){this.file=file;atomic=new AtomicFile(file);}
        public byte[] read() throws IOException {
            if(!file.exists()&&!new File(file.getPath()+".bak").exists())return null;
            try(InputStream in=atomic.openRead();ByteArrayOutputStream out=new ByteArrayOutputStream()) {
                byte[] buffer=new byte[4096];int n;
                while((n=in.read(buffer))!=-1){if(out.size()+n>2*1024*1024)throw new IOException("app_preferences_size");out.write(buffer,0,n);}
                return out.toByteArray();
            }
        }
        public void write(byte[] bytes) throws IOException {
            File parent=file.getParentFile();if(!parent.isDirectory()&&!parent.mkdirs())throw new IOException("app_preferences_directory");
            FileOutputStream out=null;
            try{out=atomic.startWrite();out.write(bytes);out.getFD().sync();atomic.finishWrite(out);}
            catch(IOException|RuntimeException failure){if(out!=null)atomic.failWrite(out);throw failure;}
        }
    }
}
