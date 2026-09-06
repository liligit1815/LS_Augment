package ls.augment.com;

import android.content.Context;
import android.graphics.Bitmap;
import android.util.AtomicFile;
import java.io.*;
import java.security.MessageDigest;
import java.util.Locale;

final class LauncherIconStore {
    static File directory(Context c){return new File(c.getFilesDir(),"launcher-icons");}
    static File file(Context c,String hash)throws FileNotFoundException{
        if(hash==null||!hash.matches("[0-9a-f]{64}"))throw new FileNotFoundException("invalid icon");
        return new File(directory(c),hash+".png");
    }
    static String save(Context c,Bitmap bitmap)throws Exception{
        ByteArrayOutputStream bytes=new ByteArrayOutputStream();if(!bitmap.compress(Bitmap.CompressFormat.PNG,100,bytes))throw new IOException("icon encoding");
        byte[] data=bytes.toByteArray();if(data.length>2097152)throw new IOException("icon too large");
        StringBuilder hash=new StringBuilder();for(byte b:MessageDigest.getInstance("SHA-256").digest(data))hash.append(String.format(Locale.ROOT,"%02x",b&255));
        if(!directory(c).isDirectory()&&!directory(c).mkdirs())throw new IOException("icon directory");
        AtomicFile target=new AtomicFile(file(c,hash.toString()));FileOutputStream out=target.startWrite();
        try{out.write(data);target.finishWrite(out);}catch(Throwable e){target.failWrite(out);throw e;}
        return hash.toString();
    }
}
