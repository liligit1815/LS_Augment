package ls.augment.com.step;

import android.view.MotionEvent;

/** Two parallel fingers act on the original visible task, only after both lift. */
final class UpperAppGesture {
    final TopGestureMonitor monitor;
    final UpperPane pane;
    LiveWorkspace.Lease target;
    int first=-1,second=-1,direction,pending;
    float x1,y1,x2,y2,span;
    long began;
    boolean multiple,blocked,lifted,claimed;
    UpperAppGesture(TopGestureMonitor monitor){this.monitor=monitor;pane=monitor.pane;}
    void reset(){target=null;first=second=-1;direction=pending=0;multiple=blocked=lifted=claimed=false;}
    boolean sameTarget(){return target!=null && pane.canSwitch() && pane.visible && pane.host.upperId==target.id
            && pane.host.leases.get(target.id)==target && pane.owner.currentUser();}
    boolean onTouch(MotionEvent e)throws Exception{
        int action=e.getActionMasked();
        if(action==MotionEvent.ACTION_DOWN){
            reset();
            if(monitor.inside(e,0))target=pane.gestureTarget();
            first=e.getPointerId(0);x1=e.getRawX();y1=e.getRawY();began=e.getEventTime();return false;
        }
        if(action==MotionEvent.ACTION_CANCEL){boolean was=multiple;reset();return was;}
        if(action==MotionEvent.ACTION_POINTER_DOWN){
            multiple=true;
            int a=e.findPointerIndex(first),b=e.getActionIndex();
            if(blocked || lifted || second>=0 || monitor.horizontal || e.getPointerCount()!=2 || !sameTarget()
                    || e.getEventTime()-began>250 || a<0 || a==b || !monitor.inside(e,a) || !monitor.inside(e,b)
                    || Math.hypot(e.getRawX(a)-x1,e.getRawY(a)-y1)>pane.owner.dp(12)){
                blocked=true;return true;
            }
            second=e.getPointerId(b);x1=e.getRawX(a);y1=e.getRawY(a);x2=e.getRawX(b);y2=e.getRawY(b);
            span=(float)Math.hypot(x2-x1,y2-y1);return true;
        }
        if(!multiple)return false;
        if(!sameTarget() || e.getPointerCount()>2 || e.getEventTime()-began>1500)blocked=true;
        if(action==MotionEvent.ACTION_UP){
            LiveWorkspace.Lease original=target;int result=!blocked && lifted?pending:0;
            reset();if(result!=0)pane.finishGesture(original,result<0);return true;
        }
        if(blocked || lifted)return true;
        int a=e.findPointerIndex(first),b=e.findPointerIndex(second);
        if(a<0 || b<0){blocked=true;return true;}
        float dx1=e.getRawX(a)-x1,dy1=e.getRawY(a)-y1,dx2=e.getRawX(b)-x2,dy2=e.getRawY(b)-y2;
        float separation=(float)Math.hypot(e.getRawX(b)-e.getRawX(a),e.getRawY(b)-e.getRawY(a));
        // Reject scaling, rotation, opposing fingers and predominantly lateral movement.
        if(Math.abs(separation-span)>Math.max(pane.owner.dp(16),span*.12f)
                || Math.abs(dy1-dy2)>Math.max(pane.owner.dp(20),Math.max(Math.abs(dy1),Math.abs(dy2))*.35f)
                || Math.abs(dx1)>pane.owner.dp(20) && Math.abs(dx1)>Math.abs(dy1)
                || Math.abs(dx2)>pane.owner.dp(20) && Math.abs(dx2)>Math.abs(dy2)){
            blocked=true;return true;
        }
        boolean parallel=dy1*dy2>0 && Math.abs(dy1)>Math.abs(dx1)*1.6f && Math.abs(dy2)>Math.abs(dx2)*1.6f;
        int next=parallel?(dy1<0?-1:1):0;
        if(direction!=0 && next!=0 && next!=direction){blocked=true;return true;}
        if(action==MotionEvent.ACTION_MOVE && parallel && Math.min(Math.abs(dy1),Math.abs(dy2))>pane.owner.dp(24)){
            if(!claimed){monitor.pilfer.invoke(monitor.platform);claimed=true;direction=next;}
        }
        if(action==MotionEvent.ACTION_POINTER_UP){
            lifted=true;
            float distance=Math.max(pane.owner.dp(48),pane.host.geometry.contentHeight*.18f);
            if(claimed && parallel && next==direction && Math.min(Math.abs(dy1),Math.abs(dy2))>=distance)pending=direction;
        }
        return true;
    }
}
