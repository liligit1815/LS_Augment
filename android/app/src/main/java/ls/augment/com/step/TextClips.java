package ls.augment.com.step;
import java.util.*;
/** No persistence. An observed clipboard event is consumed only once, including after deletion. */
public final class TextClips {
    private final LinkedList<String> items=new LinkedList<>();
    private long lastStamp=Long.MIN_VALUE;
    public synchronized void observe(long stamp,String text,boolean sensitive){
        if(stamp==lastStamp)return;lastStamp=stamp;
        if(sensitive || text==null || text.isBlank() || text.length()>8192)return;
        items.remove(text);items.addFirst(text);while(items.size()>24)items.removeLast();
    }
    public synchronized List<String> list(){return new ArrayList<>(items);}
    public synchronized void remove(String item){items.remove(item);}
    public synchronized void clear(){items.clear();}
    public synchronized void reset(){items.clear();lastStamp=Long.MIN_VALUE;}
}
