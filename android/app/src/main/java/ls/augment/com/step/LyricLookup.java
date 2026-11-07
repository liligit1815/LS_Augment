package ls.augment.com.step;

import java.io.InterruptedIOException;
import java.util.*;

/** Bounded in-memory lookup state; an outage is different from a successful empty search. */
final class LyricLookup {
    enum Status { FOUND, INSTRUMENTAL, NO_MATCH, UNAVAILABLE, INSUFFICIENT }
    static final class Result {
        final Status status;
        final String text;
        final int source;
        Result(Status status,String text,int source){
            this.status=status;this.text=text==null?"":text.substring(0,Math.min(120000,text.length()));this.source=source;
        }
        static Result text(String text,int source){
            return new Result(new SongLines(text).empty()?Status.NO_MATCH:Status.FOUND,text,source);
        }
        static Result state(Status status,int source){return new Result(status,"",source);}
    }
    interface Source { Result query(int source)throws Exception; }
    private static final class Cached {
        final Result result;final long at;
        Cached(Result result,long at){this.result=result;this.at=at;}
    }
    private static final LinkedHashMap<String,Cached> cache=new LinkedHashMap<>(24,.75f,true);
    private static int epoch;
    static synchronized void clear(){cache.clear();epoch++;}
    static int[] order(int chosen,int preferred){
        if(chosen>=0 && chosen<4)return new int[]{chosen};
        LinkedHashSet<Integer> order=new LinkedHashSet<>();
        if(preferred>=0 && preferred<4)order.add(preferred);
        for(int source:new int[]{3,0,1,2})order.add(source);
        return order.stream().mapToInt(Integer::intValue).toArray();
    }
    static Result run(String key,int chosen,int preferred,boolean enough,boolean retry,Source source)throws Exception{
        if(!enough)return Result.state(Status.INSUFFICIENT,-1);
        long now=System.currentTimeMillis();
        String cacheKey=chosen+"\n"+key;
        final int started;
        synchronized(LyricLookup.class){
            started=epoch;
            Cached saved=cache.get(cacheKey);
            if(!retry && saved!=null){
                long ttl=saved.result.status==Status.FOUND || saved.result.status==Status.INSTRUMENTAL?3600000:30000;
                if(now>=saved.at && now-saved.at<ttl)return saved.result;
            }
        }
        Result result=query(order(chosen,preferred),source);
        if(Thread.currentThread().isInterrupted())throw new InterruptedIOException();
        synchronized(LyricLookup.class){
            if(started!=epoch)return result; // An old user's in-flight response cannot repopulate the cache.
            cache.put(cacheKey,new Cached(result,now));
            while(cache.size()>24)cache.remove(cache.keySet().iterator().next());
        }
        return result;
    }
    static Result query(int[] order,Source source)throws Exception{
        boolean unavailable=false;
        for(int index:order){
            if(Thread.currentThread().isInterrupted())throw new InterruptedIOException();
            try{
                Result result=source.query(index);
                if(result==null){unavailable=true;continue;}
                if(result.status==Status.FOUND || result.status==Status.INSTRUMENTAL)return result;
                unavailable|=result.status==Status.UNAVAILABLE;
            }catch(InterruptedIOException interrupted){
                // SocketTimeoutException also extends InterruptedIOException. Only an actual
                // cancelled worker stops the chain; a network timeout must try the next service.
                if(Thread.currentThread().isInterrupted())throw interrupted;
                unavailable=true;
            }
            catch(Exception failure){unavailable=true;}
        }
        return Result.state(unavailable?Status.UNAVAILABLE:Status.NO_MATCH,-1);
    }
}
