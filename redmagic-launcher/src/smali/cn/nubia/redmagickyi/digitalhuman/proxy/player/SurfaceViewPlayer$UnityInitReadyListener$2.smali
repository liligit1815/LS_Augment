.class Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;
.super Landroid/os/Handler;
.source "SurfaceViewPlayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->queryUnityNotBlack()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;


# direct methods
.method constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 1
    :try_start_0
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 2
    .line 3
    iget-object p1, p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;

    .line 4
    .line 5
    invoke-static {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->access$400(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;)Landroid/view/SurfaceView;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 10
    .line 11
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;)Ljava/util/concurrent/atomic/AtomicReference;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/graphics/Bitmap;

    .line 20
    .line 21
    new-instance v1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2$1;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2$1;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;)V

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 27
    .line 28
    invoke-static {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;)Landroid/os/Handler;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-static {p1, v0, v1, v2}, Landroid/view/PixelCopy;->request(Landroid/view/SurfaceView;Landroid/graphics/Bitmap;Landroid/view/PixelCopy$OnPixelCopyFinishedListener;Landroid/os/Handler;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :catch_0
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 37
    .line 38
    invoke-static {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;)Landroid/os/Handler;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 45
    .line 46
    invoke-static {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;)Landroid/os/Handler;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const/4 p1, 0x0

    .line 51
    const-wide/16 v0, 0x32

    .line 52
    .line 53
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 54
    .line 55
    .line 56
    :cond_0
    return-void
.end method
