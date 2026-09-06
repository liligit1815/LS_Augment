.class public LI3/b;
.super Ljava/lang/Object;

# interfaces
.implements LI3/c;


# instance fields
.field private final a:Z

.field private b:Landroid/os/Vibrator;

.field private c:Landroid/content/Context;

.field private d:LH3/c;

.field private e:Landroid/os/Handler;

.field private f:Landroid/os/HandlerThread;

.field private g:LI3/a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, LI3/b;->a:Z

    .line 6
    .line 7
    new-instance v0, LI3/a;

    .line 8
    .line 9
    invoke-direct {v0}, LI3/a;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, LI3/b;->g:LI3/a;

    .line 13
    .line 14
    iput-object p1, p0, LI3/b;->c:Landroid/content/Context;

    .line 15
    .line 16
    const-string v0, "vibrator"

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Landroid/os/Vibrator;

    .line 23
    .line 24
    iput-object p1, p0, LI3/b;->b:Landroid/os/Vibrator;

    .line 25
    .line 26
    new-instance p1, LH3/c;

    .line 27
    .line 28
    iget-object v0, p0, LI3/b;->c:Landroid/content/Context;

    .line 29
    .line 30
    invoke-direct {p1, v0}, LH3/c;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, LI3/b;->d:LH3/c;

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private c()V
    .locals 1

    .line 1
    iget-object v0, p0, LI3/b;->d:LH3/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, LH3/c;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, LI3/b;->b:Landroid/os/Vibrator;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/os/Vibrator;->cancel()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private d()V
    .locals 1

    .line 1
    iget-object v0, p0, LI3/b;->f:Landroid/os/HandlerThread;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, LI3/b;->f:Landroid/os/HandlerThread;

    .line 10
    .line 11
    iput-object v0, p0, LI3/b;->e:Landroid/os/Handler;

    .line 12
    .line 13
    :cond_0
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, LI3/b;->g:LI3/a;

    .line 2
    .line 3
    invoke-virtual {v0}, LI3/a;->a()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, LI3/b;->d()V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0}, LI3/b;->c()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, LI3/b;->g:LI3/a;

    .line 2
    .line 3
    invoke-virtual {v0}, LI3/a;->a()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, LI3/b;->d()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, LI3/b;->d:LH3/c;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, LH3/c;->c()V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, LI3/b;->d:LH3/c;

    .line 18
    .line 19
    :cond_0
    return-void
.end method
