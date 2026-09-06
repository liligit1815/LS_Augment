.class public final LL0/d$d;
.super Landroid/window/IDumpCallback$Stub;
.source "SettingsAwareViewCapture.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LL0/d;-><init>(Landroid/content/Context;Ljava/util/concurrent/Executor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:LL0/d;


# direct methods
.method constructor <init>(LL0/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, LL0/d$d;->g:LL0/d;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/window/IDumpCallback$Stub;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDump(Landroid/os/ParcelFileDescriptor;)V
    .locals 1

    .line 1
    const-string v0, "out"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    new-instance v0, Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, LL0/d$d;->g:LL0/d;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    :try_start_1
    invoke-static {p0}, LL0/d;->u(LL0/d;)Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, v0, p1}, LL0/n;->i(Ljava/io/OutputStream;Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    :try_start_2
    invoke-static {v0, p0}, Lr4/a;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    :try_start_3
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 29
    :catchall_1
    move-exception p1

    .line 30
    :try_start_4
    invoke-static {v0, p0}, Lr4/a;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    throw p1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 34
    :catch_0
    move-exception p0

    .line 35
    invoke-static {}, LL0/e;->a()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-string v0, "failed to dump data to wm trace"

    .line 40
    .line 41
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 42
    .line 43
    .line 44
    return-void
.end method
