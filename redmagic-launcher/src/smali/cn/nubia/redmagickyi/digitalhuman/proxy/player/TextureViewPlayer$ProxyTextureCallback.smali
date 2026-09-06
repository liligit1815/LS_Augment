.class Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;
.super Ljava/lang/Object;
.source "TextureViewPlayer.java"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProxyTextureCallback"
.end annotation


# instance fields
.field private isCreated:Z

.field private surface:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Landroid/view/Surface;",
            ">;"
        }
    .end annotation
.end field

.field private surfaceType:Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

.field final synthetic this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;


# direct methods
.method public constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->surface:Ljava/util/concurrent/atomic/AtomicReference;

    .line 12
    .line 13
    iput-object p2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->surfaceType:Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 14
    .line 15
    return-void
.end method

.method private getSurface(Landroid/graphics/SurfaceTexture;Z)Landroid/view/Surface;
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->surface:Ljava/util/concurrent/atomic/AtomicReference;

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    if-nez p2, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object p2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->surface:Ljava/util/concurrent/atomic/AtomicReference;

    .line 12
    .line 13
    new-instance v0, Landroid/view/Surface;

    .line 14
    .line 15
    invoke-direct {v0, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->surface:Ljava/util/concurrent/atomic/AtomicReference;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Landroid/view/Surface;

    .line 28
    .line 29
    return-object p0
.end method

.method private surfaceChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->isCreated:Z

    .line 3
    .line 4
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;->Background:Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 5
    .line 6
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->surfaceType:Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 7
    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->drawBackground()V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;

    .line 14
    .line 15
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->access$100(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;

    .line 19
    .line 20
    iget-object v0, v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->callback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-direct {p0, p1, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->getSurface(Landroid/graphics/SurfaceTexture;Z)Landroid/view/Surface;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->surfaceType:Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 28
    .line 29
    invoke-interface {v0, p1, p0, p2, p3}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;->surfaceChanged(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;II)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private surfaceCreated(Landroid/graphics/SurfaceTexture;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->isCreated:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;

    .line 5
    .line 6
    iget-object v1, v1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->callback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 7
    .line 8
    invoke-direct {p0, p1, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->getSurface(Landroid/graphics/SurfaceTexture;Z)Landroid/view/Surface;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->surfaceType:Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 13
    .line 14
    invoke-interface {v1, p1, p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;->surfaceCreated(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private surfaceDestroyed(Landroid/graphics/SurfaceTexture;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->isCreated:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;

    .line 5
    .line 6
    iget-object v1, v1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->callback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 7
    .line 8
    invoke-direct {p0, p1, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->getSurface(Landroid/graphics/SurfaceTexture;Z)Landroid/view/Surface;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->surfaceType:Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 13
    .line 14
    invoke-interface {v1, p1, p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;->surfaceDestroyed(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public drawBackground()V
    .locals 4

    .line 1
    const-string v0, "drawBackground"

    .line 2
    .line 3
    const-string v1, "Client-TextureViewPlayer"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->isCreated:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->surface:Ljava/util/concurrent/atomic/AtomicReference;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    :try_start_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->surface:Ljava/util/concurrent/atomic/AtomicReference;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/view/Surface;

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-virtual {v0, v2}, Landroid/view/Surface;->lockCanvas(Landroid/graphics/Rect;)Landroid/graphics/Canvas;

    .line 30
    .line 31
    .line 32
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    :try_start_1
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    invoke-virtual {v0, v3, v2}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 39
    .line 40
    .line 41
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;

    .line 42
    .line 43
    iget-object v2, v2, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->callback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 44
    .line 45
    invoke-interface {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;->getBackgroundColor()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    invoke-virtual {v0, v2}, Landroid/graphics/Canvas;->drawColor(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    .line 51
    .line 52
    :try_start_2
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->surface:Ljava/util/concurrent/atomic/AtomicReference;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    :goto_0
    check-cast p0, Landroid/view/Surface;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Landroid/view/Surface;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 61
    .line 62
    .line 63
    goto :goto_2

    .line 64
    :catchall_0
    move-exception v2

    .line 65
    goto :goto_1

    .line 66
    :catch_0
    move-exception v2

    .line 67
    :try_start_3
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 68
    .line 69
    .line 70
    :try_start_4
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->surface:Ljava/util/concurrent/atomic/AtomicReference;

    .line 71
    .line 72
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    goto :goto_0

    .line 77
    :goto_1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->surface:Ljava/util/concurrent/atomic/AtomicReference;

    .line 78
    .line 79
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    check-cast p0, Landroid/view/Surface;

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Landroid/view/Surface;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 86
    .line 87
    .line 88
    throw v2
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 89
    :catch_1
    const-string p0, "drawBackground failed"

    .line 90
    .line 91
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    :cond_0
    :goto_2
    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->surfaceCreated(Landroid/graphics/SurfaceTexture;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2, p3}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->surfaceChanged(Landroid/graphics/SurfaceTexture;II)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->surfaceDestroyed(Landroid/graphics/SurfaceTexture;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return p0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$ProxyTextureCallback;->surfaceChanged(Landroid/graphics/SurfaceTexture;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    return-void
.end method
