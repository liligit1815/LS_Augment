.class Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2$1;
.super Ljava/lang/Object;
.source "SurfaceViewPlayer.java"

# interfaces
.implements Landroid/view/PixelCopy$OnPixelCopyFinishedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;


# direct methods
.method constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2$1;->this$2:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPixelCopyFinished(I)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2$1;->this$2:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;

    .line 2
    .line 3
    iget-object p1, p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 4
    .line 5
    invoke-static {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;)Landroid/os/Handler;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2$1;->this$2:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;

    .line 13
    .line 14
    iget-object p1, p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 15
    .line 16
    invoke-static {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;)Ljava/util/concurrent/atomic/AtomicReference;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2$1;->this$2:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;

    .line 27
    .line 28
    iget-object p1, p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 29
    .line 30
    invoke-static {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;)Ljava/util/concurrent/atomic/AtomicReference;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Landroid/graphics/Bitmap;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2$1;->this$2:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;

    .line 47
    .line 48
    iget-object p1, p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 49
    .line 50
    invoke-static {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;)Ljava/util/concurrent/atomic/AtomicReference;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Landroid/graphics/Bitmap;

    .line 59
    .line 60
    invoke-virtual {p1, v0, v0}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-nez p1, :cond_0

    .line 65
    .line 66
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2$1;->this$2:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;

    .line 67
    .line 68
    iget-object p1, p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 69
    .line 70
    iget-object p1, p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;

    .line 71
    .line 72
    iget-object p1, p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->callback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 73
    .line 74
    invoke-interface {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;->setModelRendered()V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2$1;->this$2:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;

    .line 78
    .line 79
    iget-object p1, p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 80
    .line 81
    invoke-static {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->access$700(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2$1;->this$2:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;

    .line 85
    .line 86
    iget-object p1, p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 87
    .line 88
    invoke-static {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->access$800(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;)V

    .line 89
    .line 90
    .line 91
    :cond_0
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2$1;->this$2:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;

    .line 92
    .line 93
    iget-object p1, p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 94
    .line 95
    invoke-static {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;)Landroid/os/Handler;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    if-eqz p1, :cond_1

    .line 100
    .line 101
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2$1;->this$2:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;

    .line 102
    .line 103
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener$2;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;

    .line 104
    .line 105
    invoke-static {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$UnityInitReadyListener;)Landroid/os/Handler;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    const-wide/16 v1, 0x32

    .line 110
    .line 111
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 112
    .line 113
    .line 114
    :cond_1
    return-void
.end method
