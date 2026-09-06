.class Lcom/android/launcher3/resource/g0$d;
.super Ljava/lang/Object;
.source "ResourceManagerProxy.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/resource/g0;->o2(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/H5$i;

.field final synthetic h:Ljava/lang/String;

.field final synthetic i:Ljava/lang/String;

.field final synthetic j:Ljava/lang/Object;

.field final synthetic k:Lcom/android/launcher3/resource/g0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/resource/g0;Lcom/android/launcher3/H5$i;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/g0$d;->k:Lcom/android/launcher3/resource/g0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/resource/g0$d;->g:Lcom/android/launcher3/H5$i;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/resource/g0$d;->h:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/resource/g0$d;->i:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/resource/g0$d;->j:Ljava/lang/Object;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/g0$d;->g:Lcom/android/launcher3/H5$i;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/resource/g0$d;->k:Lcom/android/launcher3/resource/g0;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/resource/g0$d;->h:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/android/launcher3/resource/g0;->W1(Lcom/android/launcher3/resource/g0;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/android/launcher3/resource/g0$d;->k:Lcom/android/launcher3/resource/g0;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/launcher3/resource/g0$d;->g:Lcom/android/launcher3/H5$i;

    .line 16
    .line 17
    iget-object v3, p0, Lcom/android/launcher3/resource/g0$d;->i:Ljava/lang/String;

    .line 18
    .line 19
    const-string v4, "com.zte.mifavor.launcher"

    .line 20
    .line 21
    const/4 v5, 0x0

    .line 22
    invoke-interface {v2, v3, v0, v4, v5}, Lcom/android/launcher3/H5$i;->g(Ljava/lang/String;ILjava/lang/String;Z)Landroid/graphics/Bitmap;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v1, v0}, Lcom/android/launcher3/resource/g0;->S1(Lcom/android/launcher3/resource/g0;Landroid/graphics/Bitmap;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/resource/g0$d;->j:Ljava/lang/Object;

    .line 30
    .line 31
    monitor-enter v0

    .line 32
    :try_start_0
    const-string v1, "R-Loader"

    .line 33
    .line 34
    const-string v2, "getViewScreenShoot screenShootLock notifyAll "

    .line 35
    .line 36
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/launcher3/resource/g0$d;->j:Ljava/lang/Object;

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 42
    .line 43
    .line 44
    monitor-exit v0

    .line 45
    return-void

    .line 46
    :catchall_0
    move-exception p0

    .line 47
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    throw p0

    .line 49
    :cond_0
    const-string p0, "R-Loader"

    .line 50
    .line 51
    const-string v0, "getViewScreenShoot callback is null!"

    .line 52
    .line 53
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    return-void
.end method
