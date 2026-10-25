package ls.augment.com;

import android.content.ComponentName;
import android.os.Bundle;
import android.view.Surface;

/** Shared workspace mechanics; each source keeps its own DTO, validation and wire route. */
final class AtomicWorkbenchWorkspaceOpenRequest {
    final AtomicWorkbenchMediaOpenRequest media;
    final AtomicWorkbenchNotificationOpenRequest notification;
    final String sourceId, component;
    private AtomicWorkbenchWorkspaceOpenRequest(AtomicWorkbenchMediaOpenRequest media, AtomicWorkbenchNotificationOpenRequest notification) {
        this.media=media;this.notification=notification;
        sourceId=media!=null?media.sourceId:notification.sourceId;component=media!=null?media.component:notification.component;
    }
    static AtomicWorkbenchWorkspaceOpenRequest media(AtomicWorkbenchMediaOpenRequest value){return value==null?null:new AtomicWorkbenchWorkspaceOpenRequest(value,null);}
    static AtomicWorkbenchWorkspaceOpenRequest notification(AtomicWorkbenchNotificationOpenRequest value){return new AtomicWorkbenchWorkspaceOpenRequest(null,value);}
    boolean fresh(long now){return media!=null?media.fresh(now):notification.fresh(now);}
    Bundle descriptor(){return media!=null?media.descriptor():notification.descriptor();}
    String rejectedKey(){return media!=null?"media_open_rejected":"notification_open_rejected";}
    Bundle open(AtomicWorkbenchClient client,int id,Surface surface,int width,int height,int density,ComponentName component)throws Exception{
        return media!=null?client.openMediaWindow(id,surface,width,height,density,component,media):client.openNotificationWindow(id,surface,width,height,density,component,notification);
    }
    Bundle focus(AtomicWorkbenchClient client,int id,ComponentName component)throws Exception{
        return media!=null?client.focusMediaWindow(id,component,media):client.focusNotificationWindow(id,component,notification);
    }
}
