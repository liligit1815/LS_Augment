package ls.augment.com;

import java.io.*;
import java.nio.charset.StandardCharsets;

/** Keeps the newest complete UTF-8 lines, including bytes beyond a rotation boundary. */
final class BoundedLog {
    static byte[] tail(File file,int limit)throws IOException {
        try(RandomAccessFile input=new RandomAccessFile(file,"r")){
            long start=Math.max(0,input.length()-limit);input.seek(start);
            if(start>0){int b;while((b=input.read())!=-1&&b!='\n'){} }
            byte[] data=new byte[(int)(input.length()-input.getFilePointer())];input.readFully(data);return data;
        }
    }
    static synchronized boolean append(File file,String line,int max,int keep)throws IOException {
        byte[] bytes=(line.replace('\r',' ').replace('\n',' ')+'\n').getBytes(StandardCharsets.UTF_8);
        if(bytes.length>max-keep)throw new IOException("event exceeds log limit");
        boolean rotated=file.isFile()&&file.length()+bytes.length>max;
        if(rotated){byte[] recent=tail(file,keep);try(FileOutputStream out=new FileOutputStream(file)){out.write(recent);}}
        try(FileOutputStream out=new FileOutputStream(file,true)){out.write(bytes);}return rotated;
    }
}
