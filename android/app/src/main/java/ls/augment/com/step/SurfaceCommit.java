package ls.augment.com.step;

import java.lang.reflect.Proxy;
import java.util.concurrent.Executor;

final class SurfaceCommit {
    static void observe(Object transaction, Executor executor, Runnable committed) throws Exception {
        Class<?> callback=Class.forName("android.view.SurfaceControl$TransactionCommittedListener");
        Object listener=Proxy.newProxyInstance(callback.getClassLoader(),new Class<?>[]{callback},(p,m,a)->{
            if(m.getName().equals("hashCode"))return System.identityHashCode(p);
            if(m.getName().equals("equals"))return p==a[0];
            if(m.getName().equals("toString"))return "StepSurfaceCommit";
            if(m.getName().equals("onTransactionCommitted"))committed.run();
            return null;
        });
        OwnershipBridge.method(transaction.getClass(),"addTransactionCommittedListener",Executor.class,callback)
                .invoke(transaction,executor,listener);
    }
}
