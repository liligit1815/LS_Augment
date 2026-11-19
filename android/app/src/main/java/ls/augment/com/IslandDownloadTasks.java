package ls.augment.com;

import java.util.*;

/** Exact request identities for provider-owned download controls. Never substitutes another task. */
public final class IslandDownloadTasks {
    public static final int LIMIT=64;
    public static final class Task {
        public final long id,bytes,total;
        public final int uid,status,control;
        public final String owner,identity,title;
        public Task(long id,int uid,String owner,String identity,String title,int status,int control,long bytes,long total){
            this.id=id;this.uid=uid;this.owner=owner;this.identity=identity;this.title=title;
            this.status=status;this.control=control;this.bytes=bytes;this.total=total;
        }
        public boolean sameRequest(Task other){return other!=null&&id==other.id&&uid==other.uid
                &&Objects.equals(owner,other.owner)&&Objects.equals(identity,other.identity);}
    }
    public static boolean valid(List<Task> tasks,int user){
        if(tasks==null||tasks.isEmpty()||tasks.size()>LIMIT||user<0)return false;
        Set<Long> ids=new HashSet<>();
        for(Task task:tasks)if(task==null||task.id<=0||task.uid<0||task.uid/100000!=user||!ids.add(task.id)
                ||task.owner==null||!task.owner.matches("[A-Za-z_][A-Za-z0-9_]*(\\.[A-Za-z_][A-Za-z0-9_]*)+")
                ||task.identity==null||!task.identity.matches("[a-f0-9]{64}"))return false;
        return true;
    }
    public static boolean sameRequests(List<Task> previous,List<Task> current){
        if(previous==null||current==null||previous.size()!=current.size()||previous.isEmpty()||previous.size()>LIMIT)return false;
        Map<Long,Task> rows=new HashMap<>();
        for(Task task:current)if(task==null||rows.put(task.id,task)!=null)return false;
        Set<Long> seen=new HashSet<>();
        for(Task task:previous)if(task==null||!seen.add(task.id)||!task.sameRequest(rows.get(task.id)))return false;
        return true;
    }
    public static boolean ready(List<Task> expected,List<Task> current,int user,boolean paused){
        if(!valid(expected,user)||!valid(current,user)||!sameRequests(expected,current))return false;
        for(Task task:current)if(paused?task.status!=193||task.control!=1:
                (task.status!=190&&task.status!=192)||task.control!=0)return false;
        return true;
    }
    public static String condition(boolean running){
        // DownloadProvider leaves CONTROL_RUN as SQL NULL on newly enqueued requests.
        // NULL is accepted only for the expected running state, never for an owned pause.
        return "_id = ? AND uid = ? AND notificationpackage = ? AND uri = ? AND deleted = 0 AND "
                +(running?"(control IS NULL OR control = ?)":"control = ?")+" AND status = ?";
    }
    /** Unknown totals stay unknown. Percent is derived only from actual byte counters. */
    public static int percent(List<Task> tasks){
        java.math.BigInteger bytes=java.math.BigInteger.ZERO,total=java.math.BigInteger.ZERO;
        for(Task task:tasks){if(task.total<=0||task.bytes<0||task.bytes>task.total)return -1;
            bytes=bytes.add(java.math.BigInteger.valueOf(task.bytes));total=total.add(java.math.BigInteger.valueOf(task.total));}
        return tasks.isEmpty()||total.signum()<=0?-1:bytes.multiply(java.math.BigInteger.valueOf(100)).divide(total).intValue();
    }
    private IslandDownloadTasks(){}
}
