package ls.augment.com.hook;

import java.io.File;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.channels.Channels;
import java.nio.channels.FileChannel;
import java.nio.file.AccessDeniedException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.NoSuchFileException;
import java.nio.file.StandardOpenOption;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.EnumSet;
import java.util.Locale;

/** Bounded reads of OEM frames; diagnostics never include paths or exception messages. */
final class CollabChargingFrame {
    static final long MAX_BYTES=8L*1024*1024,MAX_PIXELS=16_000_000;
    enum Reason { READY,FILE_MISSING,NOT_REGULAR_FILE,EMPTY_FILE,FILE_TOO_LARGE,
        PATH_REJECTED,ACCESS_DENIED,IO_ERROR,INVALID_DIMENSIONS,DIMENSIONS_TOO_LARGE,
        DECODE_FAILED,DECODE_EXCEPTION }
    interface Decoder<T> {
        Bounds bounds(InputStream input)throws IOException;
        T decode(InputStream input)throws IOException;
    }
    static final class Bounds {
        final int width,height;
        Bounds(int width,int height){this.width=width;this.height=height;}
    }
    static final class Result<T> {
        final T bitmap;
        final Reason reason;
        final String frame,stage,exception;
        final long bytes;
        final int width,height;
        Result(T bitmap,Reason reason,String frame,String stage,String exception,long bytes,int width,int height){
            this.bitmap=bitmap;this.reason=reason;this.frame=frame;this.stage=stage;this.exception=exception;
            this.bytes=bytes;this.width=width;this.height=height;
        }
        String diagnostic(int style,boolean fast,int plug){
            return (reason==Reason.READY?"device_frames_ready;scope=single_frame":"missing_or_invalid_frame")
                    +";reason="+reason.name().toLowerCase(Locale.ROOT)+";frame="+frame
                    +";stage="+stage+";bytes="+bytes+";width="+width+";height="+height
                    +";style="+(style==1?1:0)+";fast="+(fast?1:0)+";wireless="+(plug==4?1:0)
                    +";exception="+exception;
        }
    }
    /** The first sample of each finite reason is retained, then at most one sample per 30 s. */
    static final class Reporter {
        private final EnumSet<Reason> seen=EnumSet.noneOf(Reason.class);
        private long lastAt;
        synchronized boolean publish(Reason reason,long elapsed){
            boolean first=seen.add(reason);
            if(!first&&elapsed>=lastAt&&elapsed-lastAt<30_000)return false;
            lastAt=elapsed;return true;
        }
    }
    private CollabChargingFrame(){}
    static <T> Result<T> load(File file,Decoder<T> decoder){
        String name=safeFrameName(file.getName()),stage="path";
        long size=-1;int width=-1,height=-1;
        try{
            if(name.equals("invalid")||!file.getCanonicalPath().equals(file.getAbsolutePath()))
                return result(null,Reason.PATH_REJECTED,name,stage,"",size,width,height);
            stage="stat";
            BasicFileAttributes attrs=Files.readAttributes(file.toPath(),BasicFileAttributes.class,LinkOption.NOFOLLOW_LINKS);
            if(!attrs.isRegularFile())return result(null,Reason.NOT_REGULAR_FILE,name,stage,"",size,width,height);
            size=attrs.size();
            Reason sizeFailure=sizeFailure(size);
            if(sizeFailure!=null)return result(null,sizeFailure,name,stage,"",size,width,height);
            stage="open";
            // Keep both decodes on one handle. decodeFile hides open/read failures and
            // reopens by path, so it cannot distinguish missing files from corrupt images.
            try(FileChannel channel=FileChannel.open(file.toPath(),StandardOpenOption.READ,LinkOption.NOFOLLOW_LINKS)){
                size=channel.size();sizeFailure=sizeFailure(size);
                if(sizeFailure!=null)return result(null,sizeFailure,name,stage,"",size,width,height);
                CheckedInput input=new CheckedInput(Channels.newInputStream(channel),channel);
                stage="bounds";
                Bounds bounds=decoder.bounds(input);input.check();
                if(bounds!=null){width=bounds.width;height=bounds.height;}
                if(width<=0||height<=0)return result(null,Reason.INVALID_DIMENSIONS,name,stage,"",size,width,height);
                if((long)width*height>MAX_PIXELS)return result(null,Reason.DIMENSIONS_TOO_LARGE,name,stage,"",size,width,height);
                channel.position(0);input.resetBudget();stage="decode";
                T bitmap=decoder.decode(input);input.check();
                return result(bitmap,bitmap==null?Reason.DECODE_FAILED:Reason.READY,name,stage,"",size,width,height);
            }
        }catch(SecurityException|AccessDeniedException denied){
            return result(null,Reason.ACCESS_DENIED,name,stage,"access_denied",size,width,height);
        }catch(NoSuchFileException missing){
            return result(null,Reason.FILE_MISSING,name,stage,"missing",size,width,height);
        }catch(ReadLimitException growth){
            return result(null,Reason.FILE_TOO_LARGE,name,stage,"read_limit",growth.bytes,width,height);
        }catch(IOException unreadable){
            return result(null,Reason.IO_ERROR,name,stage,"io",size,width,height);
        }catch(RuntimeException invalid){
            return result(null,Reason.DECODE_EXCEPTION,name,stage,
                    invalid instanceof IllegalArgumentException?"invalid_argument":"runtime",size,width,height);
        }
    }
    private static Reason sizeFailure(long size){return size<=0?Reason.EMPTY_FILE:size>MAX_BYTES?Reason.FILE_TOO_LARGE:null;}
    private static String safeFrameName(String name){
        return name.matches("redmagic_(?:wireless_pb_|pb_)?(?:fast_)?charge_0[0-9]{2,3}\\.webp")?name:"invalid";
    }
    private static <T> Result<T> result(T bitmap,Reason reason,String name,String stage,String error,long bytes,int width,int height){
        return new Result<>(bitmap,reason,name,stage,error,bytes,width,height);
    }
    /** BitmapFactory may swallow an IOException; remember it so it is not called a bad bitmap. */
    private static final class CheckedInput extends FilterInputStream {
        private IOException failure;
        private final FileChannel channel;
        private long remaining=MAX_BYTES;
        CheckedInput(InputStream input,FileChannel channel){super(input);this.channel=channel;}
        void resetBudget(){remaining=MAX_BYTES;failure=null;}
        @Override public int read()throws IOException{
            try{if(remaining==0){check();return -1;}int value=in.read();if(value>=0)remaining--;return value;}
            catch(IOException error){failure=error;throw error;}
        }
        @Override public int read(byte[] b,int off,int len)throws IOException{
            if(len==0)return 0;
            try{if(remaining==0){check();return -1;}int count=in.read(b,off,(int)Math.min(len,remaining));if(count>0)remaining-=count;return count;}
            catch(IOException error){failure=error;throw error;}
        }
        @Override public long skip(long bytes)throws IOException{
            if(bytes<=0)return 0;
            try{if(remaining==0){check();return 0;}long count=in.skip(Math.min(bytes,remaining));remaining-=count;return count;}
            catch(IOException error){failure=error;throw error;}
        }
        @Override public int available()throws IOException{try{return (int)Math.min(in.available(),remaining);}catch(IOException error){failure=error;throw error;}}
        void check()throws IOException{if(failure!=null)throw failure;long size=channel.size();if(size>MAX_BYTES)throw new ReadLimitException(size);}
    }
    private static final class ReadLimitException extends IOException {
        final long bytes;
        ReadLimitException(long bytes){this.bytes=bytes;}
    }
}
