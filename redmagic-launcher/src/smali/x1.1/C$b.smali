.class Lx1/C$b;
.super Ljava/util/TimerTask;
.source "GridLoadingToast.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lx1/C;->k(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lx1/C;


# direct methods
.method constructor <init>(Lx1/C;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lx1/C$b;->g:Lx1/C;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lx1/C$b;->g:Lx1/C;

    .line 2
    .line 3
    invoke-static {v0}, Lx1/C;->b(Lx1/C;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lx1/C$b;->g:Lx1/C;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v0, v1}, Lx1/C;->c(Lx1/C;Z)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Landroid/os/Message;

    .line 16
    .line 17
    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 18
    .line 19
    .line 20
    iput v1, v0, Landroid/os/Message;->what:I

    .line 21
    .line 22
    iget-object p0, p0, Lx1/C$b;->g:Lx1/C;

    .line 23
    .line 24
    invoke-static {p0}, Lx1/C;->a(Lx1/C;)Landroid/os/Handler;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    new-instance v0, Landroid/os/Message;

    .line 33
    .line 34
    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 35
    .line 36
    .line 37
    const/4 v1, 0x2

    .line 38
    iput v1, v0, Landroid/os/Message;->what:I

    .line 39
    .line 40
    iget-object p0, p0, Lx1/C$b;->g:Lx1/C;

    .line 41
    .line 42
    invoke-static {p0}, Lx1/C;->a(Lx1/C;)Landroid/os/Handler;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 47
    .line 48
    .line 49
    return-void
.end method
