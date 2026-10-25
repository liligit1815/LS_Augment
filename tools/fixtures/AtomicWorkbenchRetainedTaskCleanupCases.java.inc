 static String selected="";
 static void scenario(String id,String name,Case body)throws Throwable{if(selected.isEmpty()||selected.equals(id))test(name,body);}
 static void installProvider(IBinder endpoint,IBinder app){AtomicWorkbenchProvider.reset();var p=AtomicWorkbenchProvider.pending;p.endpoint=endpoint;p.owner=app;android.os.Process.uid=1000;Binder.uid=0;Binder.pid=123;}
 static Bundle credentials(RootCredentials endpoint)throws Exception{return endpoint.normal();}
 static class Wire implements IBinder{
  Object service;int syncFlags=16,calls,lastCode;boolean drop,unsupported;
  Wire(Object service){this.service=service;}public boolean isBinderAlive(){return true;}public void linkToDeath(DeathRecipient r,int flags){}
  public boolean transact(int code,Parcel data,Parcel reply,int flags)throws Exception{
   calls++;lastCode=code;data.pos=0;
   try{
    if(code==0x00D04E05)invoke("handle",new Class<?>[]{Object.class,Parcel.class,Parcel.class},service,data,reply);
    else if(code==0x00D04E09){if(unsupported)return false;invoke("handleRetainedCleanup",new Class<?>[]{Object.class,Parcel.class,Parcel.class,int.class},service,data,reply,flags|syncFlags);}
    else return false;
    if(drop){drop=false;throw new java.io.IOException("controlled lost reply");}return true;
   }catch(NoSuchMethodException oldModule){return false;}catch(Exception e){throw e;}catch(Error e){throw e;}catch(Throwable e){throw new AssertionError(e);}
  }
 }
 static class Connected{
  Fixture f=new Fixture();Wire wire=new Wire(f.s);TaskTransport t;
  Connected()throws Exception{ServiceManager.window=wire;t=new TaskTransport(f.s.mContext,f.endpoint);if(!t.primary().getBoolean("success"))throw new AssertionError("normal ingress/watch not registered");}
  AtomicWorkbenchTaskOperationRequest request(Task task,AtomicWorkbenchTaskOperationRequest.Action action)throws Throwable{
   var b=f.request(task,action).toBundle();b.putLong("issued_elapsed",SystemClock.now);b.putLong("deadline_elapsed",SystemClock.now+5000);return AtomicWorkbenchTaskOperationRequest.fromBundle(b);
  }
  AtomicWorkbenchTaskOperationRequest applied(Task task,AtomicWorkbenchTaskOperationRequest.Action action)throws Throwable{var r=request(task,action);Bundle p=t.prepare(r);check(p.get("ticket") instanceof String,"normal prepare failed");check(t.apply(r.operationId,p.getString("ticket")).getBoolean("success"),"normal apply failed");return r;}
  void dead(){f.endpoint.close();f.app.die();f.s.mH.tick();f.s.mContext.resolver.fail=true;}
  Bundle retainedAuth()throws Exception{return f.endpoint.retained();}
  Bundle raw(String action,Bundle args,Bundle auth,int flags,Object service)throws Throwable{
   Parcel data=packet(action,args,auth),reply=Parcel.obtain();invoke("handleRetainedCleanup",new Class<?>[]{Object.class,Parcel.class,Parcel.class,int.class},service,data,reply,flags);
   if(reply.values.isEmpty())return null;reply.readException();check(reply.readInt()==1,"reply schema");reply.readString();return reply.readBundle(null);
  }
 }
 static Parcel packet(String action,Bundle request,Bundle auth){Parcel p=Parcel.obtain();p.writeInterfaceToken("ls.augment.com.atomic_task_operations.v1");p.writeInt(1);p.writeBundle(auth);p.writeString(action);p.writeBundle(request);return p;}
 static Bundle op(String id){Bundle b=new Bundle();b.putString("operation_id",id);return b;}
 static boolean clean(Bundle b){return b!=null&&Boolean.TRUE.equals(b.get("cleanup_complete"))&&Boolean.FALSE.equals(b.get("cleanup_pending"))&&Boolean.FALSE.equals(b.get("hidden_lease"));}
 static void expectFailure(Case body,String message)throws Throwable{boolean failed=false;try{body.run();}catch(Exception expected){failed=true;}check(failed,message);}
 public static void main(String[] args)throws Throwable{
  if(args.length>0)selected=args[0];
  scenario("dead-owner","actual metadata transport cached native cleanup and exact release after app death",()->{
   Connected c=new Connected();var r=c.applied(c.f.a,SHELVE);c.dead();int providers=c.f.s.mContext.resolver.calls;
   Bundle global=null,receipt=null;try{global=c.t.cleanup();receipt=c.t.release(r.operationId);}catch(Exception unavailable){}
   check(global!=null&&global.getBoolean("success")&&clean(receipt),"original owned nonempty cleanup did not converge");
   check(c.f.s.mContext.resolver.calls==providers,"retained path queried dead Provider");check(c.f.a.content==c.f.zero&&c.f.a.mForceHiddenFlags==0&&c.f.a.fronts==0,"native responsibility changed incorrectly");
   check(((Map<?,?>)fld("WATCHES").get(null)).containsKey(c.f.endpoint),"live Root principal retired on app death");
  });
  scenario("actions","live owner forbidden actions normal query and unsupported old module fail closed",()->{
   Connected c=new Connected();Bundle auth=c.f.endpoint.normal();check(!c.raw("cleanup",new Bundle(),auth,16,c.f.s).getBoolean("success"),"live owner gained retained permit");
   var r=c.applied(c.f.a,SHELVE);c.dead();int providers=c.f.s.mContext.resolver.calls;
   for(String action:new String[]{"prepare","apply","describe","primary_display","inspect","query","unknown"})check(!c.raw(action,new Bundle(),c.retainedAuth(),18,c.f.s).getBoolean("success"),"forbidden retained action "+action);
   expectFailure(()->c.t.query(r.operationId),"ordinary query gained dead-owner fallback");
   c.wire.unsupported=true;expectFailure(()->c.t.release(r.operationId),"unsupported module returned complete");
   check(c.f.s.mContext.resolver.calls==providers,"rejected/unsupported route queried Provider");
  });
  scenario("flags","all native sync combinations and strict one-way unknown null tail boundaries",()->{
   for(int flag:new int[]{0,2,16,18}){Connected c=new Connected();var r=c.applied(c.f.a,SHELVE);c.dead();check(clean(c.raw("release",op(r.operationId),c.retainedAuth(),flag,c.f.s)),"legal native sync rejected "+flag);}
   Connected c=new Connected();var r=c.applied(c.f.a,SHELVE);c.dead();
   for(int flag:new int[]{1,3,17,19,4,32,-1}){Parcel data=packet("release",op(r.operationId),c.retainedAuth()),reply=Parcel.obtain();invoke("handleRetainedCleanup",new Class<?>[]{Object.class,Parcel.class,Parcel.class,int.class},c.f.s,data,reply,flag);if((flag&1)!=0)check(reply.values.isEmpty(),"one-way reply written");else{reply.readException();reply.readInt();reply.readString();check(!reply.readBundle(null).getBoolean("success"),"unknown flags admitted");}}
   Parcel data=packet("release",op(r.operationId),c.retainedAuth());invoke("handleRetainedCleanup",new Class<?>[]{Object.class,Parcel.class,Parcel.class,int.class},c.f.s,data,null,16);
   for(int kind=0;kind<5;kind++){Parcel p=packet("release",op(r.operationId),c.retainedAuth()),reply=Parcel.obtain();if(kind==0)p.values.set(0,"wrong");if(kind==1)p.values.set(1,2);if(kind==2)p.writeInt(9);if(kind==3)p.size=48*1024+1;if(kind==4)p=null;invoke("handleRetainedCleanup",new Class<?>[]{Object.class,Parcel.class,Parcel.class,int.class},c.f.s,p,reply,16);reply.readException();reply.readInt();reply.readString();check(!reply.readBundle(null).getBoolean("success"),"malformed packet admitted "+kind);}
  });
  scenario("principal","actual cached principal caller pid token session reset endpoint WMS and typed shape",()->{
   Connected c=new Connected();var r=c.applied(c.f.a,SHELVE);c.dead();int providers=c.f.s.mContext.resolver.calls;
   for(String key:new String[]{"uid","user","root_pid","session","reset_generation","token","endpoint","nonce","version","extra","missing","type"}){
    Bundle b=c.retainedAuth();switch(key){case "uid":b.putInt(key,10056);break;case "user":b.putInt(key,1);break;case "root_pid":b.putInt(key,124);break;case "session":case "reset_generation":b.putLong(key,999);break;case "token":b.putString(key,"c".repeat(64));break;case "endpoint":b.putBinder(key,new Live());break;case "nonce":b.putString(key,"bad");break;case "version":b.putInt(key,2);break;case "extra":b.putInt(key,1);break;case "missing":b.remove("token");break;case "type":b.putInt("session",7);break;}
    check(!c.raw("release",op(r.operationId),b,16,c.f.s).getBoolean("success"),"principal substitution admitted "+key);
   }
   Binder.pid=124;check(!c.raw("cleanup",new Bundle(),c.retainedAuth(),16,c.f.s).getBoolean("success"),"actual caller PID ignored");Binder.pid=123;
   Binder.uid=10055;check(!c.raw("cleanup",new Bundle(),c.retainedAuth(),16,c.f.s).getBoolean("success"),"actual caller UID ignored");Binder.uid=0;
   check(!c.raw("cleanup",new Bundle(),c.retainedAuth(),16,new Service()).getBoolean("success"),"foreign WMS borrowed cache");
   check(c.f.s.mContext.resolver.calls==providers,"principal rejection queried Provider");
  });
  scenario("cache","missing cached principal and missing old operation cannot manufacture a receipt",()->{
   Connected c=new Connected();var r=c.applied(c.f.a,SHELVE);c.dead();((Map<?,?>)fld("OPERATIONS").get(null)).remove(r.operationId);
   check(c.t.cleanup().getBoolean("success"),"known empty aggregate rejected");check(!clean(c.t.release(r.operationId)),"missing per-record receipt fabricated");
   ((Map<?,?>)fld("WATCHES").get(null)).clear();check(!c.t.cleanup().getBoolean("success"),"missing cache synthesized aggregate receipt");
  });
  scenario("cancel","cancel original un-dispatched ticket is available only through exact cleanup route",()->{
   Connected c=new Connected();var r=c.request(c.f.a,SHELVE);check(c.t.prepare(r).get("ticket") instanceof String,"normal prepare failed");c.dead();
   Bundle b=c.t.cancel(r.operationId);check(b.getBoolean("cancelled")&&!b.getBoolean("mutation_dispatched")&&c.f.a.moves==0,"cancel dispatched new task operation");
  });
  scenario("lost-reply","lost global and per-record replies retain original receipt without duplicate mutation",()->{
   Connected c=new Connected();var r=c.applied(c.f.a,SHELVE);c.dead();int moves=c.f.a.moves,providers=c.f.s.mContext.resolver.calls;
   c.wire.drop=true;expectFailure(()->c.t.cleanup(),"lost cleanup reply accepted");check(c.t.cleanup().getBoolean("success"),"cleanup retry failed");
   c.wire.drop=true;expectFailure(()->c.t.release(r.operationId),"lost release reply accepted");check(clean(c.t.release(r.operationId)),"release retry lost original final facts");
   check(c.f.a.moves==moves&&c.f.a.fronts==0&&c.f.s.mContext.resolver.calls==providers,"retry created new mutation or Provider IPC");
  });
  scenario("foreign","fresh inherited cleanup preserves old original owner receipt and rejects foreign retained claims",()->{
   Connected c=new Connected();var r=c.applied(c.f.a,SHELVE);c.dead();var old=c.f.endpoint;
   RootCredentials other=new RootCredentials();Live app=new Live();other.bind(app);installProvider(other,app);c.f.s.mContext.resolver.fail=false;TaskTransport t=new TaskTransport(c.f.s.mContext,other);
   check(t.primary().getBoolean("success"),"fresh Root normal registration failed");check(clean(t.release(r.operationId)),"original fresh inherited recovery changed");
   other.close();app.die();c.f.s.mH.tick();c.f.s.mContext.resolver.fail=true;check(!clean(t.release(r.operationId)),"foreign retained caller inherited old operation");
   check(clean(c.t.release(r.operationId)),"fresh recovery erased original Root final receipt");
  });
  scenario("retention","live owner durable-ack unknown expiry pressure then owner death keeps original terminal receipt",()->{
   Connected c=new Connected();var r=c.applied(c.f.a,END_TASK);
   // No Store/Journal acknowledgement has been delivered. This receiver fixture deliberately
   // treats native-terminal as insufficient; actual durable-chain integration is separate.
   SystemClock.now=10000;var next=c.request(c.f.b,END_TASK);check(c.t.prepare(next).get("ticket") instanceof String,"expiry pressure request failed");
   check(((Map<?,?>)fld("OPERATIONS").get(null)).containsKey(r.operationId),"live Root final receipt pruned before durable acknowledgement");
   c.dead();Bundle receipt=c.t.release(r.operationId);check(clean(receipt)&&receipt.getBoolean("ended"),"terminal receipt unavailable after later owner death");
  });
  scenario("capacity","operation bound refuses new prepare without evicting live Root terminal receipts",()->{
   Connected c=new Connected();for(int i=0;i<80;i++){Task t=i==0?c.f.a:c.f.task(100+i,c.f.one);c.applied(t,END_TASK);}
   check(((Map<?,?>)fld("OPERATIONS").get(null)).size()==80,"receipt bound changed");SystemClock.now=10000;var r=c.request(c.f.b,END_TASK);Bundle no=c.t.prepare(r);
   check(!no.getBoolean("success")&&"task_operation_capacity".equals(no.getString("reason")),"full receipt table evicted final fact");
  });
  scenario("watch-capacity","principal bound retains app-dead live Root and reclaims only after endpoint death",()->{
   Connected c=new Connected();RootCredentials[] roots=new RootCredentials[8];roots[0]=c.f.endpoint;
   for(int i=1;i<8;i++){RootCredentials root=new RootCredentials();Live app=new Live();root.bind(app);installProvider(root,app);check(new TaskTransport(c.f.s.mContext,root).primary().getBoolean("success"),"normal principal capacity too small");roots[i]=root;}
   c.f.app.die();c.f.s.mH.tick();RootCredentials ninth=new RootCredentials();Live app=new Live();ninth.bind(app);installProvider(ninth,app);
   check(!new TaskTransport(c.f.s.mContext,ninth).primary().getBoolean("success"),"app-dead live Root principal evicted");
   roots[0].die();c.f.s.mH.tick();check(new TaskTransport(c.f.s.mContext,ninth).primary().getBoolean("success"),"dead endpoint clean principal not reclaimed");
  });
  scenario("pending","unhide failure remains pending and endpoint death cannot drop unknown native responsibility",()->{
   Connected c=new Connected();var r=c.applied(c.f.a,SHELVE);c.f.a.failUnhide=true;c.dead();
   check(!c.t.cleanup().getBoolean("success")&&!clean(c.t.release(r.operationId)),"failed unhide returned complete");check(c.f.a.mForceHiddenFlags==2,"unknown hidden lease dropped");
   c.f.endpoint.die();c.f.s.mH.tick();check(((Map<?,?>)fld("WATCHES").get(null)).containsKey(c.f.endpoint),"dead Root unknown responsibility evicted");
   c.f.a.failUnhide=false;c.f.s.mH.tick();check(c.f.a.mForceHiddenFlags==0&&!((Map<?,?>)fld("WATCHES").get(null)).containsKey(c.f.endpoint),"confirmed death cleanup failed to retire");
  });
  System.out.println("RETAINED CLEANUP RESULT "+cases+" cases; "+checks+" assertions");
 }
