.class public final Lcom/android/launcher3/D3$c;
.super Ljava/lang/Object;
.source "LauncherModel.kt"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/D3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "c"
.end annotation


# instance fields
.field private g:Lz1/c2;

.field final synthetic h:Lcom/android/launcher3/D3;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/D3;Lz1/c2;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/c2;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "task"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/D3$c;->h:Lcom/android/launcher3/D3;

    .line 7
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Lcom/android/launcher3/D3;->F(Lcom/android/launcher3/D3;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    monitor-enter v0

    .line 16
    :try_start_0
    invoke-static {p1}, Lcom/android/launcher3/D3;->E(Lcom/android/launcher3/D3;)Lz1/c2;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-ne v1, p2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->l0()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/4 v2, 0x1

    .line 27
    add-int/2addr v1, v2

    .line 28
    invoke-static {p1, v1}, Lcom/android/launcher3/D3;->G(Lcom/android/launcher3/D3;I)V

    .line 29
    .line 30
    .line 31
    iput-object p2, p0, Lcom/android/launcher3/D3$c;->g:Lz1/c2;

    .line 32
    .line 33
    invoke-static {p1, v2}, Lcom/android/launcher3/D3;->H(Lcom/android/launcher3/D3;Z)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x0

    .line 37
    invoke-static {p1, p0}, Lcom/android/launcher3/D3;->J(Lcom/android/launcher3/D3;Z)V

    .line 38
    .line 39
    .line 40
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    monitor-exit v0

    .line 43
    return-void

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    :try_start_1
    new-instance p0, Ljava/util/concurrent/CancellationException;

    .line 47
    .line 48
    const-string p1, "Loader already stopped"

    .line 49
    .line 50
    invoke-direct {p0, p1}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    :goto_0
    monitor-exit v0

    .line 55
    throw p0
.end method


# virtual methods
.method public final b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/D3$c;->h:Lcom/android/launcher3/D3;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/D3;->F(Lcom/android/launcher3/D3;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/android/launcher3/D3$c;->h:Lcom/android/launcher3/D3;

    .line 8
    .line 9
    monitor-enter v0

    .line 10
    const/4 v1, 0x1

    .line 11
    :try_start_0
    invoke-static {p0, v1}, Lcom/android/launcher3/D3;->J(Lcom/android/launcher3/D3;Z)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    monitor-exit v0

    .line 20
    throw p0
.end method

.method public close()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/D3$c;->h:Lcom/android/launcher3/D3;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/D3;->F(Lcom/android/launcher3/D3;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/D3$c;->h:Lcom/android/launcher3/D3;

    .line 8
    .line 9
    monitor-enter v0

    .line 10
    :try_start_0
    invoke-static {v1}, Lcom/android/launcher3/D3;->E(Lcom/android/launcher3/D3;)Lz1/c2;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    iget-object p0, p0, Lcom/android/launcher3/D3$c;->g:Lz1/c2;

    .line 15
    .line 16
    if-ne v2, p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    invoke-static {v1, p0}, Lcom/android/launcher3/D3;->I(Lcom/android/launcher3/D3;Lz1/c2;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    const/4 p0, 0x0

    .line 26
    invoke-static {v1, p0}, Lcom/android/launcher3/D3;->H(Lcom/android/launcher3/D3;Z)V

    .line 27
    .line 28
    .line 29
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    monitor-exit v0

    .line 32
    return-void

    .line 33
    :goto_1
    monitor-exit v0

    .line 34
    throw p0
.end method
