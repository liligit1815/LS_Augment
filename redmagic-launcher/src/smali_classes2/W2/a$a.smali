.class LW2/a$a;
.super LW2/j;
.source "AndroidSpringLooperFactory.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = LW2/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private final b:Landroid/view/Choreographer;

.field private final c:Landroid/view/Choreographer$FrameCallback;

.field private d:Z

.field private e:J


# direct methods
.method public constructor <init>(Landroid/view/Choreographer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LW2/j;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LW2/a$a;->b:Landroid/view/Choreographer;

    .line 5
    .line 6
    new-instance p1, LW2/a$a$a;

    .line 7
    .line 8
    invoke-direct {p1, p0}, LW2/a$a$a;-><init>(LW2/a$a;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, LW2/a$a;->c:Landroid/view/Choreographer$FrameCallback;

    .line 12
    .line 13
    return-void
.end method

.method static synthetic d(LW2/a$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LW2/a$a;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method static synthetic e(LW2/a$a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, LW2/a$a;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method static synthetic f(LW2/a$a;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, LW2/a$a;->e:J

    .line 2
    .line 3
    return-wide p1
.end method

.method static synthetic g(LW2/a$a;)Landroid/view/Choreographer$FrameCallback;
    .locals 0

    .line 1
    iget-object p0, p0, LW2/a$a;->c:Landroid/view/Choreographer$FrameCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic h(LW2/a$a;)Landroid/view/Choreographer;
    .locals 0

    .line 1
    iget-object p0, p0, LW2/a$a;->b:Landroid/view/Choreographer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static i()LW2/a$a;
    .locals 2

    .line 1
    new-instance v0, LW2/a$a;

    .line 2
    .line 3
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, LW2/a$a;-><init>(Landroid/view/Choreographer;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public b()V
    .locals 2

    .line 1
    iget-boolean v0, p0, LW2/a$a;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, LW2/a$a;->d:Z

    .line 8
    .line 9
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iput-wide v0, p0, LW2/a$a;->e:J

    .line 14
    .line 15
    iget-object v0, p0, LW2/a$a;->b:Landroid/view/Choreographer;

    .line 16
    .line 17
    iget-object v1, p0, LW2/a$a;->c:Landroid/view/Choreographer$FrameCallback;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, LW2/a$a;->b:Landroid/view/Choreographer;

    .line 23
    .line 24
    iget-object p0, p0, LW2/a$a;->c:Landroid/view/Choreographer$FrameCallback;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, LW2/a$a;->d:Z

    .line 3
    .line 4
    iget-object v0, p0, LW2/a$a;->b:Landroid/view/Choreographer;

    .line 5
    .line 6
    iget-object p0, p0, LW2/a$a;->c:Landroid/view/Choreographer$FrameCallback;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
