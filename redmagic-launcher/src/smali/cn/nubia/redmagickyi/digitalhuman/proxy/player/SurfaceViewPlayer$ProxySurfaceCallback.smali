.class Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;
.super Ljava/lang/Object;
.source "SurfaceViewPlayer.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProxySurfaceCallback"
.end annotation


# instance fields
.field private isCreated:Z

.field private surfaceHolder:Landroid/view/SurfaceHolder;

.field private surfaceType:Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

.field final synthetic this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;


# direct methods
.method public constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->surfaceType:Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public drawBackground()V
    .locals 4

    .line 1
    const-string v0, "drawBackground"

    .line 2
    .line 3
    const-string v1, "Client-SurfaceViewPlayer"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->isCreated:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->surfaceHolder:Landroid/view/SurfaceHolder;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    :try_start_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->surfaceHolder:Landroid/view/SurfaceHolder;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-interface {v0, v2}, Landroid/view/SurfaceHolder;->lockCanvas(Landroid/graphics/Rect;)Landroid/graphics/Canvas;

    .line 26
    .line 27
    .line 28
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    :try_start_1
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    invoke-virtual {v0, v3, v2}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 35
    .line 36
    .line 37
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;

    .line 38
    .line 39
    iget-object v2, v2, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->callback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 40
    .line 41
    invoke-interface {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;->getBackgroundColor()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-virtual {v0, v2}, Landroid/graphics/Canvas;->drawColor(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    .line 47
    .line 48
    :goto_0
    :try_start_2
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->surfaceHolder:Landroid/view/SurfaceHolder;

    .line 49
    .line 50
    invoke-interface {p0, v0}, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 51
    .line 52
    .line 53
    goto :goto_2

    .line 54
    :catchall_0
    move-exception v2

    .line 55
    goto :goto_1

    .line 56
    :catch_0
    move-exception v2

    .line 57
    :try_start_3
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :goto_1
    :try_start_4
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->surfaceHolder:Landroid/view/SurfaceHolder;

    .line 62
    .line 63
    invoke-interface {p0, v0}, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 64
    .line 65
    .line 66
    throw v2
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 67
    :catch_1
    const-string p0, "drawBackground failed"

    .line 68
    .line 69
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    :cond_0
    :goto_2
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->surfaceHolder:Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    iput-boolean p2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->isCreated:Z

    .line 5
    .line 6
    sget-object p2, Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;->Background:Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 7
    .line 8
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->surfaceType:Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 9
    .line 10
    if-ne p2, v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->drawBackground()V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;

    .line 16
    .line 17
    invoke-static {p2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;->access$100(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;)V

    .line 18
    .line 19
    .line 20
    iget-object p2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;

    .line 21
    .line 22
    iget-object p2, p2, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->callback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 23
    .line 24
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->surfaceType:Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 29
    .line 30
    invoke-interface {p2, p1, p0, p3, p4}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;->surfaceChanged(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;II)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->surfaceHolder:Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;

    .line 4
    .line 5
    iget-object v0, v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->callback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 6
    .line 7
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->surfaceType:Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 12
    .line 13
    invoke-interface {v0, p1, p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;->surfaceCreated(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->surfaceHolder:Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->isCreated:Z

    .line 5
    .line 6
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer;

    .line 7
    .line 8
    iget-object v0, v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->callback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 9
    .line 10
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/SurfaceViewPlayer$ProxySurfaceCallback;->surfaceType:Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;

    .line 15
    .line 16
    invoke-interface {v0, p1, p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;->surfaceDestroyed(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
