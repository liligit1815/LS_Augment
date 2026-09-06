.class Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;
.super Ljava/lang/Object;
.source "TextureViewPlayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UnityInitReadyListener"
.end annotation


# instance fields
.field private counter:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

.field private frameBitmap:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private handler:Landroid/os/Handler;

.field private handlerThread:Landroid/os/HandlerThread;

.field final synthetic this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;


# direct methods
.method private constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->frameBitmap:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method synthetic constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$1;)V
    .locals 0

    .line 3
    invoke-direct {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;)V

    return-void
.end method

.method static synthetic access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;)Ljava/util/concurrent/atomic/AtomicReference;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->frameBitmap:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$700(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->quitUnityNotBlack()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic access$800(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->animIn()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private animIn()V
    .locals 3

    .line 1
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 2
    .line 3
    new-instance v1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$1;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$1;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$OnCounterEventListener;)V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    new-array v1, v1, [F

    .line 13
    .line 14
    fill-array-data v1, :array_0

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->ofFloat([F)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-wide/16 v1, 0x0

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->setDuration(J)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-virtual {v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->postToMainThread(Z)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->start()Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->counter:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 37
    .line 38
    return-void

    .line 39
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private queryUnityNotBlack()V
    .locals 4

    .line 1
    new-instance v0, Landroid/os/HandlerThread;

    .line 2
    .line 3
    const-string v1, "queryUnityNotBlack"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->handlerThread:Landroid/os/HandlerThread;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/os/HandlerThread;->isAlive()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->handlerThread:Landroid/os/HandlerThread;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->frameBitmap:Ljava/util/concurrent/atomic/AtomicReference;

    .line 22
    .line 23
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;

    .line 24
    .line 25
    invoke-static {v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->access$400(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;)Landroid/view/TextureView;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Landroid/view/TextureView;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;

    .line 34
    .line 35
    invoke-static {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->access$400(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;)Landroid/view/TextureView;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Landroid/view/TextureView;->getHeight()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    sget-object v3, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    .line 44
    .line 45
    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$2;

    .line 53
    .line 54
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->handlerThread:Landroid/os/HandlerThread;

    .line 55
    .line 56
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-direct {v0, p0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$2;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;Landroid/os/Looper;)V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->handler:Landroid/os/Handler;

    .line 64
    .line 65
    const/4 p0, 0x0

    .line 66
    invoke-virtual {v0, p0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method private quitUnityNotBlack()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->counter:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->handler:Landroid/os/Handler;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->handler:Landroid/os/Handler;

    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->handlerThread:Landroid/os/HandlerThread;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->handlerThread:Landroid/os/HandlerThread;

    .line 26
    .line 27
    :cond_2
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->frameBitmap:Ljava/util/concurrent/atomic/AtomicReference;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_4

    .line 34
    .line 35
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->frameBitmap:Ljava/util/concurrent/atomic/AtomicReference;

    .line 36
    .line 37
    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Landroid/graphics/Bitmap;

    .line 42
    .line 43
    if-eqz p0, :cond_3

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_3

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .line 53
    .line 54
    :cond_3
    return-void

    .line 55
    :catch_0
    move-exception p0

    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .line 60
    .line 61
    const-string v1, "quitUnityNotBlack exception: "

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const-string v0, "Client-TextureViewPlayer"

    .line 78
    .line 79
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    :cond_4
    return-void
.end method


# virtual methods
.method public isModelReady()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;

    .line 2
    .line 3
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->callback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 4
    .line 5
    invoke-interface {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;->isModelReady()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isModelRendered()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;

    .line 2
    .line 3
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->callback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 4
    .line 5
    invoke-interface {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;->isModelRendered()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public onModelReady()V
    .locals 2

    .line 1
    const-string v0, "Client-TextureViewPlayer"

    .line 2
    .line 3
    const-string v1, "model ready!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    :try_start_0
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->quitUnityNotBlack()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->queryUnityNotBlack()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->quitUnityNotBlack()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public restoreState()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->quitUnityNotBlack()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
