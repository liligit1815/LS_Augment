.class public abstract Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;
.super Ljava/lang/Object;
.source "ProxyDigitalHumanService.java"

# interfaces
.implements Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;,
        Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;
    }
.end annotation


# instance fields
.field private handler:Landroid/os/Handler;

.field private playerCallback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

.field private proxyDigitalHumanClientCallback:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;

.field private savedState:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

.field private unityPlayer:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->handler:Landroid/os/Handler;

    .line 14
    .line 15
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$1;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$1;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->playerCallback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 21
    .line 22
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-direct {v0, p0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$1;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->proxyDigitalHumanClientCallback:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;

    .line 29
    .line 30
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 31
    .line 32
    invoke-direct {v0, p0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$1;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->savedState:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 36
    .line 37
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;->SurfaceView:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->initPlayer(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method static synthetic access$1300(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->postOnUiThread(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic access$1400(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->proxyDigitalHumanClientCallback:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$200(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->savedState:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->unityPlayer:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;

    .line 2
    .line 3
    return-object p0
.end method

.method private postOnUiThread(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/os/Looper;->isCurrentThread()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->handler:Landroid/os/Handler;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/ViewGroup;Ljava/lang/Integer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->savedState:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->setBindedView(Landroid/view/ViewGroup;)Landroid/view/ViewGroup;

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;

    .line 7
    .line 8
    invoke-direct {v0, p0, p2, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$2;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;Ljava/lang/Integer;Landroid/view/ViewGroup;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->postOnUiThread(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-virtual {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->switchScene(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method protected getAvatarHeight()I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->getAvatarHeight()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method protected getAvatarLayoutParams(FF)[F
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1, p2}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->getAvatarLayoutParams(FF)[F

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method protected getAvatarWidth()I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->getAvatarWidth()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public getHumanScale()Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->getHumanScaleV2()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method protected getScene()Ljava/lang/Integer;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->getScene()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public abstract getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;
.end method

.method public hide()V
    .locals 1

    .line 1
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$7;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$7;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->postOnUiThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public initPlayer(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;)V
    .locals 1

    .line 1
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;->SurfaceView:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->unityPlayer:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    instance-of p1, p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;

    .line 10
    .line 11
    if-nez p1, :cond_3

    .line 12
    .line 13
    :cond_0
    new-instance p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;

    .line 14
    .line 15
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->playerCallback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 16
    .line 17
    invoke-direct {p1, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->unityPlayer:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;->TextureView:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;

    .line 24
    .line 25
    if-ne p1, v0, :cond_3

    .line 26
    .line 27
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->unityPlayer:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;

    .line 28
    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    instance-of p1, p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;

    .line 32
    .line 33
    if-nez p1, :cond_3

    .line 34
    .line 35
    :cond_2
    new-instance p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;

    .line 36
    .line 37
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->playerCallback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 38
    .line 39
    invoke-direct {p1, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;)V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->unityPlayer:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;

    .line 43
    .line 44
    :cond_3
    return-void
.end method

.method protected isHumanInited()Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->isHumanInited()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method protected isHumanRendered()Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->isHumanRendered()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method protected onSurfaceChanged(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1, p2, p3, p4}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->onSurfaceChanged(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;II)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method protected onSurfaceCreated(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 v0, 0x12

    .line 8
    .line 9
    invoke-interface {p0, v0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->setSDKVersionCode(I)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->onSurfaceCreated(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method protected onSurfaceDestroyed(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1, p2}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->onSurfaceDestroyed(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method protected onTouchEvent(Landroid/view/MotionEvent;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->onTouchEvent(Landroid/view/MotionEvent;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public pauseMotion()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->pauseMotion()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public registerCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->proxyDigitalHumanClientCallback:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;

    .line 2
    .line 3
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->savedState:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 4
    .line 5
    invoke-virtual {v1, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->registerCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;->setInnerCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->proxyDigitalHumanClientCallback:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;

    .line 19
    .line 20
    invoke-interface {p1, p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->registerCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public release()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->savedState:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-static {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->access$1000(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public restoreState()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->proxyDigitalHumanClientCallback:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->registerCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->savedState:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 7
    .line 8
    invoke-static {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->access$1200(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public resumeMotion()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->resumeMotion()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public saveState()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->savedState:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 2
    .line 3
    invoke-static {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->access$1100(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setBackgroundColor(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->savedState:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->setBackgroundColor(I)I

    .line 4
    .line 5
    .line 6
    new-instance p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$5;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$5;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->postOnUiThread(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method protected setHumanRendered()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->setHumanRendered()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setHumanRotation(F)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->setHumanRotation(F)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setHumanScale(FFFFF)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface/range {p0 .. p5}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->setHumanScaleV2(FFFFF)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setZOrderOnTop(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->savedState:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->setZOrderOnTop(Z)Z

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$4;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$4;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;Z)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->postOnUiThread(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public show()V
    .locals 1

    .line 1
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$6;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$6;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->postOnUiThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public startMotion(ILcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1, p2}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->startMotion(ILcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public startSpeak(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->startSpeak(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public stopMotion()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->stopMotion()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public stopSpeak()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->stopSpeak()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public supportedTouchEvent(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->savedState:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->setSupportedTouchEvent(Ljava/lang/Boolean;)Z

    .line 8
    .line 9
    .line 10
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$3;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$3;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;Z)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->postOnUiThread(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method protected switchScene(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->savedState:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->setScene(I)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-interface {v0, p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->switchScene(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public unregisterCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->proxyDigitalHumanClientCallback:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;

    .line 2
    .line 3
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->savedState:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;

    .line 4
    .line 5
    invoke-virtual {v1, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->unregisterCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;->setInnerCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->getService()Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->proxyDigitalHumanClientCallback:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;

    .line 19
    .line 20
    invoke-interface {p1, p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;->unregisterCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
