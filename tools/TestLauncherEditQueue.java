package ls.augment.com;

import java.util.*;

public final class TestLauncherEditQueue {
    private static void require(boolean condition,String message){if(!condition)throw new AssertionError(message);}
    public static void main(String[] args){
        LauncherEditQueue queue=new LauncherEditQueue();
        LauncherEditQueue.Draft a=queue.put(0,"com.example.a","甲","");
        require(queue.takePending().size()==1,"A queued once");
        require(queue.takePending().isEmpty(),"in-flight generation is not duplicated");
        LauncherEditQueue.Draft b=queue.put(0,"com.example.b","乙","");
        queue.complete(a,false);
        require(queue.get(0,"com.example.a")==a,"failed A retains its own draft after switching to B");
        require(queue.get(0,"com.example.b")==b,"failed A cannot replace B");
        require(queue.takePending().size()==2,"failed A and unsaved B are retryable");
        LauncherEditQueue.Draft a2=queue.put(0,"com.example.a","甲第二版","");
        require(queue.takePending().equals(Collections.singletonList(a2)),"last edits enqueue while an older save is in flight");
        queue.complete(a,true);
        require(queue.get(0,"com.example.a")==a2,"old success cannot clear newer draft");
        queue.complete(a2,false);
        require(queue.takePending().equals(Collections.singletonList(a2)),"latest failure remains retryable");
        queue.complete(a2,true);
        require(queue.get(0,"com.example.a")==null,"only matching successful generation is cleared");
        LauncherEditQueue.Draft clone=queue.put(10,"com.example.b","工作空间","");
        require(queue.get(0,"com.example.b")==b&&queue.get(10,"com.example.b")==clone,"users are isolated");
        LauncherEditQueue restored=new LauncherEditQueue();
        for(LauncherEditQueue.Draft draft:queue.snapshot())restored.restore(draft.key(),LauncherEditQueue.encode(draft));
        require(restored.takePending().size()==2,"recreation preserves in-flight and unsaved drafts for retry");
        require(restored.get(10,"com.example.b").name.equals("工作空间"),"Unicode names survive persistence");
        LauncherEditQueue.Draft invalid=queue.put(0,"com.example.invalid","未完成\t输入","");
        require(invalid.entry()==null&&!queue.takePending().contains(invalid),"invalid names never reach live configuration");
        restored.restore(invalid.key(),LauncherEditQueue.encode(invalid));
        require(restored.get(0,"com.example.invalid").name.equals(invalid.name),"invalid input remains available to correct after recreation");
        restored.restore("broken","broken");
        restored.restore("0:not-a-package","QQ==|");
        require(restored.snapshot().size()==3,"invalid persisted identities are ignored");
        System.out.println("Launcher draft queue checks passed");
    }
}
