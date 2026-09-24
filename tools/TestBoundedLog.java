package ls.augment.com;
import java.io.*;import java.nio.file.*;import java.nio.charset.StandardCharsets;
public final class TestBoundedLog {
    public static void main(String[] args)throws Exception{
        LogRepeatPolicy policy=new LogRepeatPolicy();
        require(policy.record("HIDE_ALL","success=3",1000)!=null,"first event");
        require(policy.record("HIDE_ALL","success=3",1001)==null,"duplicate event");
        require(policy.record("HIDE_ALL","failure=1",1002).contains("previous_event_repeats=1"),"changed failure retained immediately with repeat count");
        require(policy.record("HIDE_ALL","success=3",1003)!=null,"recovery retained immediately");
        require(policy.record("HIDE_ALL","success=3",61003)!=null,"window expiry retains heartbeat");
        require(policy.record("CONFIG_SAVE","height",1)!=null,"config first");
        require(policy.record("CONFIG_SAVE","height",4999)==null,"config slider coalesced");
        require(policy.record("CONFIG_SAVE","clock",5000)!=null,"different setting retained");
        require(policy.record("CONFIG_SAVE","clock",0)!=null,"monotonic clock reset");
        File file=Files.createTempFile("lsa-log-test",".log").toFile();
        try{
            StringBuilder old=new StringBuilder();for(int i=0;i<10000;i++)old.append("中文事件 ").append(i).append('\n');
            Files.writeString(file.toPath(),old,StandardCharsets.UTF_8);
            BoundedLog.append(file,"最新事件",2048,1024);
            String tail=new String(BoundedLog.tail(file,2048),StandardCharsets.UTF_8);
            if(!tail.contains("9999")||!tail.endsWith("最新事件\n")||tail.contains("�")||file.length()>2048)throw new AssertionError("rotation must retain newest complete UTF-8 lines even when file overshot");
            for(int i=0;i<200;i++)BoundedLog.append(file,"新行 "+i,2048,1024);
            if(!new String(BoundedLog.tail(file,2048),StandardCharsets.UTF_8).endsWith("新行 199\n"))throw new AssertionError("append tail lost");
            System.out.println("Bounded log rotation checks passed");
        }finally{Files.deleteIfExists(file.toPath());}
    }
    private static void require(boolean value,String reason){if(!value)throw new AssertionError(reason);}
}
