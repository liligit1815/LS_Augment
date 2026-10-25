package ls.augment.com;

import android.app.Dialog;
import android.app.Instrumentation;
import android.content.*;
import android.net.Uri;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicReference;
import org.json.*;

/** Real physical long press/drop and recipient reads, using only developer-owned sources/receiver. */
final class AtomicWorkbenchDropReceiveDeviceCases {
    private final Instrumentation test;private final Context context;private final String pkg,nonce=UUID.randomUUID().toString().replace("-","");
    private final int receiverUid;private final AtomicReference<Bundle> receipt=new AtomicReference<>();
    private final ArrayList<Uri> owned=new ArrayList<>();private AtomicWorkbenchActivity activity;private Button source;private String stage="preflight";private int task=-1,display=-1;
    private JSONObject dragObservation;
    private AtomicWorkbenchDropReceiveDeviceCases(Instrumentation test){this.test=test;context=test.getTargetContext();pkg=test.getContext().getPackageName();receiverUid=test.getContext().getApplicationInfo().uid;}
    static JSONObject run(Instrumentation test)throws Exception{return new AtomicWorkbenchDropReceiveDeviceCases(test).run();}
    private JSONObject run()throws Exception{
        JSONObject report=new JSONObject().put("success",false).put("source","OWNED_PHYSICAL_DRAG_NO_THIRD_PARTY_SOURCE").put("appToAppDragVerified",false);
        JSONArray cases=new JSONArray();report.put("cases",cases);AppConfig config=new AppConfig(context);String quick=config.get(AtomicWorkbenchConfig.QUICK_OPEN_APPS);
        AtomicWorkbenchPendingPayload pending=AtomicWorkbenchPendingStorage.repository(context).load();
        boolean registered=false,business=false,recovered=false,finished=false,restored=false;
        BroadcastReceiver listener=new BroadcastReceiver(){@Override public void onReceive(Context c,Intent i){
            if(getSentFromUid()==receiverUid&&nonce.equals(i.getStringExtra("nonce"))&&pkg.equals(i.getStringExtra("fixture_package")))receipt.set(new Bundle(i.getExtras()));}};
        try{
            require(config.getBoolean(AtomicWorkbenchConfig.ENABLED)&&!AtomicWorkbenchCleanup.pending(),"workspace_preflight");
            require(!context.getSystemService(android.app.KeyguardManager.class).isKeyguardLocked(),"unlock_required");
            context.registerReceiver(listener,new IntentFilter(AtomicWorkbenchFixtureActivity.ACTION_STATE),Context.RECEIVER_EXPORTED);registered=true;
            require(config.save(Collections.singletonMap(AtomicWorkbenchConfig.QUICK_OPEN_APPS,"1")).success,"quick_save");
            activity=(AtomicWorkbenchActivity)test.startActivitySync(new Intent(context,AtomicWorkbenchActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            main(()->{activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);return null;});
            stage="receiver_launch";await(()->main(()->(Boolean)call("canInteract",new Class<?>[0])));
            String key=pkg+"/ls.augment.com.AtomicWorkbenchFixtureActivity";
            await(()->main(()->activity.getWindow().getDecorView().findViewWithTag("atomic-workbench-quick-app:"+key)!=null));
            main(()->{View tile=activity.getWindow().getDecorView().findViewWithTag("atomic-workbench-quick-app:"+key);require(tile.performClick(),"fixture_tile_click");return null;});
            await(()->main(()->{Dialog dialog=(Dialog)field("closeDialog");if(dialog!=null&&dialog.isShowing()){View create=button(dialog.getWindow().getDecorView(),"新开应用");if(create!=null&&create.isEnabled())create.performClick();}
                return (Boolean)call("mainReady",new Class<?>[0])&&pkg.equals(call("transferPackage",new Class<?>[]{int.class},model().mainWindowId()));}));
            Bundle initial=query(v->v.getInt("task_id",-1)>0&&v.getInt("display_id",-1)>0&&!v.getBoolean("destroyed"));task=initial.getInt("task_id");display=initial.getInt("display_id");
            report.put("originalTask",task).put("originalDisplay",display);
            main(()->{int observedWindow=model().mainWindowId();View frame=(View)get(((Object[])field("slots"))[observedWindow],"frame");
                // The production listener is exactly this method call. Forward it
                // once and observe only fixed event/result counters.
                frame.setOnDragListener((view,event)->{try{
                    JSONObject observation=dragObservation;int action=event.getAction();if(observation!=null){String eventKey="action"+action;observation.put(eventKey,observation.optInt(eventKey)+1);}
                    if(observation!=null&&action==DragEvent.ACTION_DROP){observation.put("busyBeforeDrop",field("busy")).put("epochBeforeDrop",field("epoch")).put("readyBeforeDrop",call("workspaceDropReady",new Class<?>[]{int.class},observedWindow));}
                    boolean accepted=(Boolean)call("onWorkspaceDrag",new Class<?>[]{int.class,View.class,DragEvent.class},observedWindow,view,event);
                    if(observation!=null){observation.put("accepted"+action,accepted);if(action==DragEvent.ACTION_DROP)observation.put("dropReady",(Boolean)call("workspaceDropReady",new Class<?>[]{int.class},model().mainWindowId()));}
                    return accepted;
                }catch(Exception unavailable){throw new AssertionError(unavailable);}});return null;});
            byte[] png=android.util.Base64.decode("iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+jp1kAAAAASUVORK5CYII=",0);
            byte[] document="%PDF-1.4\n1 0 obj<</Type/Catalog>>endobj\n%%EOF".getBytes(java.nio.charset.StandardCharsets.UTF_8);
            byte[] video;try(InputStream input=context.getResources().openRawResource(R.raw.redmagic_first_start)){video=input.readAllBytes();}
            Uri image=seed(png,"image.png","image/png"),file=seed(document,"document.pdf","application/pdf"),movie=seed(video,"video.mp4","video/mp4");
            ArrayList<List<Uri>> inputs=new ArrayList<>();inputs.add(List.of(image));inputs.add(List.of(movie));inputs.add(List.of(image,file,movie));
            String[][] digests={{hash(png)},{hash(video)},{hash(png),hash(document),hash(video)}};
            for(int index=0;index<inputs.size();index++){
                stage="physical_drop_"+index;String text="DuoReceive-"+nonce+"-"+index;String textHash=hash(text.getBytes(java.nio.charset.StandardCharsets.UTF_8));
                AtomicWorkbenchTransferStore.Payload data=new AtomicWorkbenchTransferStore.Payload(text,System.currentTimeMillis());data.uris.addAll(inputs.get(index));
                AtomicWorkbenchPendingPayload snapshot=AtomicWorkbenchTransferStore.batch(context,data);int before=receipt.get().getInt("received_count");
                main(()->{dragObservation=new JSONObject();if(source!=null)((ViewGroup)source.getParent()).removeView(source);UiKit ui=(UiKit)field("ui");source=ui.tonalButton("拖拽验收样本");
                    FrameLayout.LayoutParams lp=new FrameLayout.LayoutParams(ui.dp(180),ui.dp(52),Gravity.TOP|Gravity.LEFT);lp.leftMargin=ui.dp(16);lp.topMargin=ui.dp(105);
                    ((ViewGroup)activity.getWindow().getDecorView()).addView(source,lp);source.setOnLongClickListener(v->{try{
                        AtomicWorkbenchTransfer transfer=(AtomicWorkbenchTransfer)field("transfer");
                        AtomicWorkbenchContentPanel.DragSource gesture=new AtomicWorkbenchContentPanel.DragSource(){boolean held=true;
                            public boolean held(){return held;}public boolean accessibility(){return false;}public void starting(){}public void started(){}public void ended(){held=false;}};
                        // Use the production content-drag entry, including its
                        // host focus/input lifecycle. Raw beginDrag omits that owner.
                        Method start=AtomicWorkbenchTransfer.class.getDeclaredMethod("beginContentDrag",View.class,AtomicWorkbenchPendingPayload.class,AtomicWorkbenchContentPanel.DragSource.class);start.setAccessible(true);
                        return (Boolean)start.invoke(transfer,source,snapshot,gesture);
                    }catch(Exception unavailable){return false;}});return null;});
                await(()->main(()->source.isLaidOut()&&source.isShown()));
                float[][] points=main(()->{Object slot=((Object[])field("slots"))[model().mainWindowId()];return new float[][]{center(source),center((View)get(slot,"frame"))};});
                long down=SystemClock.uptimeMillis();touch(down,MotionEvent.ACTION_DOWN,points[0]);SystemClock.sleep(ViewConfiguration.getLongPressTimeout()+180L);
                stage="drag_started_"+index;await(()->main(()->get(field("transfer"),"activeDrag")!=null));
                require(main(()->(Boolean)field("hostDragActive")),"production_drag_owner_missing");
                int dragEpoch=main(()->(Integer)field("epoch"));
                // Exercise the real timer callback while the native drag owns
                // the pointer. It must observe state without changing focus/epoch.
                main(()->{call("pollStatus",new Class<?>[0]);return null;});
                await(()->main(()->!(Boolean)field("polling")));
                require(main(()->(Integer)field("epoch")==dragEpoch&&!(Boolean)field("busy")),"poll_refocused_during_drag");
                for(int step=1;step<=8;step++){float a=step/8f;touch(down,MotionEvent.ACTION_MOVE,new float[]{points[0][0]+a*(points[1][0]-points[0][0]),points[0][1]+a*(points[1][1]-points[0][1])});SystemClock.sleep(45L);}
                touch(down,MotionEvent.ACTION_UP,points[1]);
                stage="receiver_confirmation_"+index;
                Bundle received=query(v->v.getInt("received_count")>before&&textHash.equals(v.getString("received_text_hash")));
                require(received.getInt("task_id")==task&&received.getInt("display_id")==display,"receiver_left_selected_window");
                require(received.getBoolean("received_all_read")&&received.getBoolean("received_read_flag")&&!received.getBoolean("received_private_metadata"),"recipient_read_or_metadata");
                require(Arrays.equals(digests[index],received.getStringArray("received_digests")),"received_bytes_differ");
                require((inputs.get(index).size()>1?Intent.ACTION_SEND_MULTIPLE:Intent.ACTION_SEND).equals(received.getString("received_action")),"wrong_receive_action");
                require(main(()->field("closeDialog")==null||!((Dialog)field("closeDialog")).isShowing()),"unexpected_module_delivery_menu");
                AtomicWorkbenchPendingPayload after=AtomicWorkbenchPendingStorage.repository(context).load();require(after.signature().equals(pending.signature())&&after.text.equals(pending.text),"pending_queue_changed");
                cases.put(new JSONObject().put("kind",index==0?"IMAGE":index==1?"VIDEO":"MIXED_FILES").put("files",inputs.get(index).size()).put("sameTaskDisplay",true).put("bytesMatched",true).put("nativePhysicalDrag",true).put("dragObservation",new JSONObject(dragObservation.toString())));
                await(()->main(()->(Boolean)call("canInteract",new Class<?>[0])&&(Boolean)call("mainReady",new Class<?>[0])));
            }
            business=true;report.put("cases",cases).put("pendingQueueUnchanged",true).put("moduleDeliveryMenuShown",false);
        }catch(Exception|AssertionError failed){report.put("failureStage",stage).put("failureType",failed.getClass().getSimpleName());if(failed instanceof AssertionError)report.put("failureReason",failed.getMessage());
            Bundle last=receipt.get();if(last!=null)report.put("lastReceivedCount",last.getInt("received_count")).put("lastReceivedAllRead",last.getBoolean("received_all_read")).put("lastReceivedAction",last.getString("received_action")).put("lastReceivedMime",last.getString("received_mime"));
            if(dragObservation!=null)report.put("dragObservation",dragObservation);
            if(activity!=null)report.put("workspaceStatus",main(()->((TextView)field("status")).getText().toString()));}
        finally{
            try{if(activity!=null){main(()->{if(source!=null){source.cancelDragAndDrop();if(source.getParent() instanceof ViewGroup)((ViewGroup)source.getParent()).removeView(source);}call("requestCloseAll",new Class<?>[]{boolean.class},true);return null;});
                await(()->!AtomicWorkbenchCleanup.pending()&&main(()->activity.isFinishing()||activity.isDestroyed()));}
                if(task>0){query(v->v.getInt("task_id")==task&&v.getInt("display_id")==0&&!v.getBoolean("destroyed"));recovered=true;control(AtomicWorkbenchFixtureActivity.ACTION_FINISH);
                    query(v->v.getInt("task_id")==task&&v.getBoolean("destroyed"));finished=true;}else{recovered=true;finished=true;}
            }catch(Exception|AssertionError failed){report.put("cleanupFailureType",failed.getClass().getSimpleName());}
            restored=config.save(Collections.singletonMap(AtomicWorkbenchConfig.QUICK_OPEN_APPS,quick)).success&&quick.equals(config.get(AtomicWorkbenchConfig.QUICK_OPEN_APPS));
            for(Uri uri:owned){context.revokeUriPermission(uri,Intent.FLAG_GRANT_READ_URI_PERMISSION);String id=uri.getPathSegments().get(0);new File(new File(context.getCacheDir(),"workbench-transfer"),id+".bin").delete();context.getSharedPreferences("atomic-workbench-transfer",0).edit().remove(id).commit();}
            if(registered)context.unregisterReceiver(listener);
        }
        return report.put("sameTaskReturned",recovered).put("ownedFixtureFinished",finished).put("quickSettingRestored",restored).put("success",business&&recovered&&finished&&restored);
    }
    private Uri seed(byte[]bytes,String name,String mime)throws Exception{String id=UUID.randomUUID().toString().replace("-","");File dir=new File(context.getCacheDir(),"workbench-transfer");dir.mkdirs();
        try(FileOutputStream out=new FileOutputStream(new File(dir,id+".bin"))){out.write(bytes);}context.getSharedPreferences("atomic-workbench-transfer",0).edit().putString(id,new JSONObject().put("name",name).put("mime",mime).put("created",System.currentTimeMillis()).toString()).commit();
        Uri uri=new Uri.Builder().scheme("content").authority(AtomicWorkbenchTransferStore.authority(context)).appendPath(id).appendPath(name).build();owned.add(uri);return uri;}
    private Bundle query(java.util.function.Predicate<Bundle> accepts)throws Exception{AtomicReference<Bundle> found=new AtomicReference<>();await(()->{Bundle value=receipt.get();if(value!=null&&accepts.test(value)){found.set(value);return true;}control(AtomicWorkbenchFixtureActivity.ACTION_QUERY);return false;});return found.get();}
    private void control(String action){context.sendBroadcast(new Intent(action).setPackage(pkg).putExtra("nonce",nonce),null,android.app.BroadcastOptions.makeBasic().setShareIdentityEnabled(true).setDeferralPolicy(android.app.BroadcastOptions.DEFERRAL_POLICY_NONE).toBundle());}
    private void touch(long down,int action,float[]point)throws Exception{MotionEvent e=MotionEvent.obtain(down,SystemClock.uptimeMillis(),action,point[0],point[1],0);e.setSource(InputDevice.SOURCE_TOUCHSCREEN);try{require(test.getUiAutomation().injectInputEvent(e,true),"physical_input_rejected");}finally{e.recycle();}}
    private static float[] center(View view){int[] xy=new int[2];view.getLocationOnScreen(xy);return new float[]{xy[0]+view.getWidth()/2f,xy[1]+view.getHeight()/2f};}
    private AtomicWorkbenchWorkspaceModel model()throws Exception{return (AtomicWorkbenchWorkspaceModel)field("model");}
    private Object field(String name)throws Exception{return get(activity,name);}
    private static Object get(Object obj,String name)throws Exception{Field f=obj.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(obj);}
    private Object call(String name,Class<?>[]types,Object...args)throws Exception{Method m=activity.getClass().getDeclaredMethod(name,types);m.setAccessible(true);return m.invoke(activity,args);}
    private static View button(View v,String text){if(v instanceof Button&&text.contentEquals(((Button)v).getText()))return v;if(v instanceof ViewGroup)for(int i=0;i<((ViewGroup)v).getChildCount();i++){View found=button(((ViewGroup)v).getChildAt(i),text);if(found!=null)return found;}return null;}
    private <T>T main(Callable<T>c)throws Exception{AtomicReference<T>r=new AtomicReference<>();AtomicReference<Throwable>x=new AtomicReference<>();test.runOnMainSync(()->{try{r.set(c.call());}catch(Throwable e){x.set(e);}});if(x.get() instanceof Exception)throw(Exception)x.get();if(x.get()!=null)throw new AssertionError(x.get());return r.get();}
    private static String hash(byte[]value)throws Exception{return java.util.HexFormat.of().formatHex(java.security.MessageDigest.getInstance("SHA-256").digest(value));}
    private static void await(Callable<Boolean>state)throws Exception{long end=SystemClock.uptimeMillis()+20000;do{if(state.call())return;SystemClock.sleep(100);}while(SystemClock.uptimeMillis()<end);throw new AssertionError("receive_state_timeout");}
    private static void require(boolean value,String reason){if(!value)throw new AssertionError(reason);}
}
