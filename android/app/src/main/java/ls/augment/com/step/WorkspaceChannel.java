package ls.augment.com.step;

import android.content.Intent;
import android.os.*;
import android.view.SurfaceControl;
import java.util.ArrayList;
import static ls.augment.com.step.StepRuntime.*;
import static ls.augment.com.step.NativeWorkspaceGuard.*;

/** Session-scoped phone IPC. Interactive handoffs must not wait in the broadcast queue. */
final class WorkspaceChannel extends Binder {
    static final String DESCRIPTOR="ls.augment.com.step.WorkspaceChannel";
    static final int COMMAND=FIRST_CALL_TRANSACTION, FINISH=COMMAND+1, START=FINISH+1, FOCUS=START+1;
    final IBinder expected;
    WorkspaceChannel(IBinder expected){this.expected=expected;}
    @Override protected boolean onTransact(int code,Parcel data,Parcel reply,int flags)throws RemoteException{
        if(code!=COMMAND && code!=FINISH && code!=START && code!=FOCUS)return super.onTransact(code,data,reply,flags);
        if(Binder.getCallingUid()!=systemUiUid)throw new SecurityException("workspace host identity");
        data.enforceInterface(DESCRIPTOR);
        if(!expected.equals(data.readStrongBinder()))throw new SecurityException("workspace session identity");
        if(code==FOCUS){
            float x=data.readFloat(),y=data.readFloat();boolean selected=false;
            long identity=Binder.clearCallingIdentity();
            try{synchronized(Wm.lock){if(expected.equals(owner))selected=WorkspaceBackFocus.select(x,y);}}
            finally{Binder.restoreCallingIdentity(identity);}
            reply.writeNoException();reply.writeBoolean(selected);return true;
        }
        if(code==COMMAND){
            Intent intent=data.readTypedObject(Intent.CREATOR);
            if(intent==null || !expected.equals(intent.getExtras().getBinder("owner")))throw new SecurityException("workspace command owner");
            Wm.handler.post(()->execute(intent));
            return true;
        }
        ArrayList<IBinder> tokens=data.createBinderArrayList();
        SurfaceControl.Transaction tx=data.readTypedObject(SurfaceControl.Transaction.CREATOR);
        SurfaceControl.Transaction previews=data.readTypedObject(SurfaceControl.Transaction.CREATOR);
        int[] previewSlots=data.createIntArray();
        boolean sync=data.readBoolean();
        boolean applied=false;
        long identity=Binder.clearCallingIdentity();
        try{
            synchronized(Wm.lock){
                if(tx!=null && tokens!=null && !tokens.isEmpty() && tokens.size()<=16 && expected.equals(owner)
                        && active && !ending && Wm.active && replayPending!=null
                        && field(Wm.display,"mMagnificationSpec")==Wm.ownedSpec){
                    // The native finish and the CURRENT calibrated workspace transform
                    // are applied under the same ownership lock, never queued for later.
                    if(code==FINISH)NativeTransitionPose.finishIn(tx,tokens);
                    stageMagnification(tx);
                    if(code==START)NativeTransitionPose.startIn(tx,tokens);
                    UpperTaskPresentation.stage(tx);
                    if(previews!=null && settledSideSnapshot(previewSlots))call(tx,"merge",previews);
                    call(tx,"apply",sync);applied=true;transitionReplays++;
                    diagnostic(code==FINISH?"TRANSITION_FINISH":"TRANSITION_START","atomic;session="+session+";transitions="+tokens.size());
                }
            }
        }catch(Exception|LinkageError failure){diagnostic("TRANSITION_FINISH","native_fallback;reason="+failure);}
        finally{if(tx!=null)tx.close();if(previews!=null)previews.close();Binder.restoreCallingIdentity(identity);}
        reply.writeNoException();reply.writeBoolean(applied);return true;
    }
    static void command(IBinder channel,IBinder owner,Intent intent)throws RemoteException{
        Parcel data=Parcel.obtain();
        try{
            data.writeInterfaceToken(DESCRIPTOR);data.writeStrongBinder(owner);data.writeTypedObject(intent,0);
            if(!channel.transact(COMMAND,data,null,IBinder.FLAG_ONEWAY))throw new RemoteException("workspace command channel unavailable");
        }finally{data.recycle();}
    }
    static boolean focusRegion(IBinder channel,IBinder owner,float x,float y)throws RemoteException{
        Parcel data=Parcel.obtain(),reply=Parcel.obtain();
        try{
            data.writeInterfaceToken(DESCRIPTOR);data.writeStrongBinder(owner);data.writeFloat(x);data.writeFloat(y);
            if(!channel.transact(FOCUS,data,reply,0))return false;
            reply.readException();return reply.readBoolean();
        }finally{data.recycle();reply.recycle();}
    }
    static boolean finish(IBinder channel,IBinder owner,ArrayList<IBinder> tokens,SurfaceControl.Transaction tx,SurfaceControl.Transaction previews,int[] previewSlots,boolean sync,boolean finishing)throws RemoteException{
        Parcel data=Parcel.obtain(),reply=Parcel.obtain();
        try{
            data.writeInterfaceToken(DESCRIPTOR);data.writeStrongBinder(owner);data.writeBinderList(tokens);data.writeTypedObject(tx,0);
            data.writeTypedObject(previews,0);
            data.writeIntArray(previewSlots);
            data.writeBoolean(sync);
            if(!channel.transact(finishing?FINISH:START,data,reply,0))return false;
            reply.readException();return reply.readBoolean();
        }finally{data.recycle();reply.recycle();}
    }
}
