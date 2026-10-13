package ls.augment.com.hook;

import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.nio.file.AccessDeniedException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Comparator;

/** Runs entirely on the host; no Android or device connection. */
public final class TestCollabChargingFrame {
    private static int checks;
    private static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
    private static final class Decoder implements CollabChargingFrame.Decoder<String> {
        int width=20,height=30,boundsCalls,decodeCalls;
        String decoded="bitmap";
        IOException boundsIo;
        RuntimeException decodeError;
        boolean swallowIo;
        public CollabChargingFrame.Bounds bounds(InputStream input)throws IOException{
            boundsCalls++;
            if(boundsIo!=null)throw boundsIo;
            if(swallowIo){input.close();try{input.read();}catch(IOException ignored){}return new CollabChargingFrame.Bounds(width,height);}
            check(input.read()==42,"bounds starts at first byte");
            return new CollabChargingFrame.Bounds(width,height);
        }
        public String decode(InputStream input)throws IOException{
            decodeCalls++;if(decodeError!=null)throw decodeError;
            check(input.read()==42,"full decode rewinds the same open stream");return decoded;
        }
    }
    private static void reason(Path file,Decoder decoder,CollabChargingFrame.Reason expected){
        CollabChargingFrame.Result<String> result=CollabChargingFrame.load(file.toFile(),decoder);
        check(result.reason==expected,"expected "+expected+", got "+result.reason);
        if(expected!=CollabChargingFrame.Reason.READY)check(result.bitmap==null,"failure always requests native fallback");
        String detail=result.diagnostic(1,true,4);
        check(detail.length()<400&&!detail.contains(file.toString())&&!detail.contains("PRIVATE"),"bounded diagnostics contain no path or private exception text");
    }
    public static void main(String[] args)throws Exception{
        Path dir=Files.createTempDirectory("lsa-charge-frames-").toRealPath();
        Path file=dir.resolve("redmagic_pb_fast_charge_012.webp");
        try{
            Decoder untouched=new Decoder();reason(file,untouched,CollabChargingFrame.Reason.FILE_MISSING);
            check(untouched.boundsCalls==0,"missing frames never invoke the decoder");
            Files.createDirectory(file);reason(file,new Decoder(),CollabChargingFrame.Reason.NOT_REGULAR_FILE);Files.delete(file);
            Files.createFile(file);reason(file,new Decoder(),CollabChargingFrame.Reason.EMPTY_FILE);
            try(RandomAccessFile large=new RandomAccessFile(file.toFile(),"rw")){large.setLength(CollabChargingFrame.MAX_BYTES+1);}
            reason(file,new Decoder(),CollabChargingFrame.Reason.FILE_TOO_LARGE);
            Files.write(file,new byte[]{42,43,44});
            Files.createDirectory(dir.resolve("sub"));
            reason(dir.resolve("sub/../"+file.getFileName()),new Decoder(),CollabChargingFrame.Reason.PATH_REJECTED);
            reason(dir.resolve("PRIVATE-frame.webp"),new Decoder(),CollabChargingFrame.Reason.PATH_REJECTED);
            reason(file,new Decoder(),CollabChargingFrame.Reason.READY);
            Decoder invalid=new Decoder();invalid.width=0;reason(file,invalid,CollabChargingFrame.Reason.INVALID_DIMENSIONS);
            check(invalid.decodeCalls==0,"invalid dimensions never allocate a bitmap");
            Decoder huge=new Decoder();huge.width=Integer.MAX_VALUE;huge.height=Integer.MAX_VALUE;
            reason(file,huge,CollabChargingFrame.Reason.DIMENSIONS_TOO_LARGE);
            check(huge.decodeCalls==0,"pixel limit uses non-overflowing arithmetic before allocation");
            Decoder missingBitmap=new Decoder();missingBitmap.decoded=null;reason(file,missingBitmap,CollabChargingFrame.Reason.DECODE_FAILED);
            Decoder denied=new Decoder();denied.boundsIo=new AccessDeniedException("PRIVATE/account");
            reason(file,denied,CollabChargingFrame.Reason.ACCESS_DENIED);
            Decoder io=new Decoder();io.boundsIo=new IOException("PRIVATE/account");reason(file,io,CollabChargingFrame.Reason.IO_ERROR);
            Decoder security=new Decoder();security.decodeError=new SecurityException("PRIVATE/account");
            reason(file,security,CollabChargingFrame.Reason.ACCESS_DENIED);
            Decoder incompatible=new Decoder();incompatible.decodeError=new IllegalArgumentException("PRIVATE/inBitmap");
            reason(file,incompatible,CollabChargingFrame.Reason.DECODE_EXCEPTION);
            Decoder swallowed=new Decoder();swallowed.swallowIo=true;reason(file,swallowed,CollabChargingFrame.Reason.IO_ERROR);
            CollabChargingFrame.Result<String> growing=CollabChargingFrame.load(file.toFile(),new CollabChargingFrame.Decoder<String>(){
                public CollabChargingFrame.Bounds bounds(InputStream input)throws IOException{
                    try(RandomAccessFile growth=new RandomAccessFile(file.toFile(),"rw")){growth.setLength(CollabChargingFrame.MAX_BYTES+100);}
                    check(input.skip(Long.MAX_VALUE)<=CollabChargingFrame.MAX_BYTES,"skip cannot bypass the per-pass byte limit");
                    try{input.read();}catch(IOException swallowed){}
                    return new CollabChargingFrame.Bounds(20,30);
                }
                public String decode(InputStream input){throw new AssertionError("grown file must not reach full decode");}
            });
            check(growing.reason==CollabChargingFrame.Reason.FILE_TOO_LARGE&&growing.exception.equals("read_limit"),"file growth stays distinguished even when the decoder swallows the read limit error");
            try(RandomAccessFile limit=new RandomAccessFile(file.toFile(),"rw")){limit.setLength(CollabChargingFrame.MAX_BYTES);}
            CollabChargingFrame.Result<String> maximum=CollabChargingFrame.load(file.toFile(),new CollabChargingFrame.Decoder<String>(){
                public CollabChargingFrame.Bounds bounds(InputStream input)throws IOException{
                    check(input.skip(CollabChargingFrame.MAX_BYTES)==CollabChargingFrame.MAX_BYTES&&input.read()==-1,"exact byte limit is accepted at EOF");
                    return new CollabChargingFrame.Bounds(20,30);
                }
                public String decode(InputStream input)throws IOException{
                    check(input.read()==42&&input.skip(CollabChargingFrame.MAX_BYTES-1)==CollabChargingFrame.MAX_BYTES-1,"bounds and full decode have independent read budgets");
                    return "bitmap";
                }
            });
            check(maximum.reason==CollabChargingFrame.Reason.READY,"maximum valid file can decode after a complete bounds read");
            Files.write(file,new byte[]{42,43,44});
            CollabChargingFrame.Result<String> ready=CollabChargingFrame.load(file.toFile(),new Decoder());
            check(ready.diagnostic(1,true,4).contains("scope=single_frame")&&ready.bytes==3&&ready.width==20&&ready.height==30,"success reports only the inspected frame and numeric metadata");
            CollabChargingFrame.Reporter reporter=new CollabChargingFrame.Reporter();
            check(reporter.publish(CollabChargingFrame.Reason.FILE_MISSING,1000),"first missing frame retained");
            for(int i=0;i<1000;i++)check(!reporter.publish(CollabChargingFrame.Reason.FILE_MISSING,1001+i),"different missing frame names cannot flood diagnostics");
            check(reporter.publish(CollabChargingFrame.Reason.ACCESS_DENIED,3000),"new reason is recorded immediately");
            check(reporter.publish(CollabChargingFrame.Reason.READY,3001),"first successful decode is recorded");
            for(int i=0;i<1000;i++)check(!reporter.publish(i%2==0?CollabChargingFrame.Reason.READY:CollabChargingFrame.Reason.FILE_MISSING,3002+i),"partial sequence does not alternate writes on every frame");
            check(reporter.publish(CollabChargingFrame.Reason.FILE_MISSING,33_001),"continued failure gets a bounded fresh observation");
            check(reporter.publish(CollabChargingFrame.Reason.READY,63_001),"later recovery can replace runtime status");
            System.out.println("PASS charging frame diagnostics: "+checks+" checks");
        }finally{
            try(var paths=Files.walk(dir)){for(Path path:paths.sorted(Comparator.reverseOrder()).toList())Files.delete(path);}
        }
    }
}
