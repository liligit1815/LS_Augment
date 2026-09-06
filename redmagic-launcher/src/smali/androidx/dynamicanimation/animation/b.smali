.class public Landroidx/dynamicanimation/animation/b;
.super Ljava/lang/Object;
.source "AnimationHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/dynamicanimation/animation/b$f;,
        Landroidx/dynamicanimation/animation/b$b;,
        Landroidx/dynamicanimation/animation/b$e;,
        Landroidx/dynamicanimation/animation/b$d;,
        Landroidx/dynamicanimation/animation/b$c;
    }
.end annotation


# static fields
.field private static final j:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Landroidx/dynamicanimation/animation/b;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:Lo/r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lo/r<",
            "Landroidx/dynamicanimation/animation/b$c;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field final b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/dynamicanimation/animation/b$c;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Landroidx/dynamicanimation/animation/b$b;

.field private final d:Ljava/lang/Runnable;

.field private e:Landroidx/dynamicanimation/animation/i;

.field f:J

.field private g:Z

.field public h:F

.field public i:Landroidx/dynamicanimation/animation/b$e;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Landroidx/dynamicanimation/animation/b;->j:Ljava/lang/ThreadLocal;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroidx/dynamicanimation/animation/i;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lo/r;

    .line 5
    .line 6
    invoke-direct {v0}, Lo/r;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Landroidx/dynamicanimation/animation/b;->a:Lo/r;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Landroidx/dynamicanimation/animation/b;->b:Ljava/util/ArrayList;

    .line 17
    .line 18
    new-instance v0, Landroidx/dynamicanimation/animation/b$b;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-direct {v0, p0, v1}, Landroidx/dynamicanimation/animation/b$b;-><init>(Landroidx/dynamicanimation/animation/b;Landroidx/dynamicanimation/animation/b$a;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Landroidx/dynamicanimation/animation/b;->c:Landroidx/dynamicanimation/animation/b$b;

    .line 25
    .line 26
    new-instance v0, Landroidx/dynamicanimation/animation/a;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Landroidx/dynamicanimation/animation/a;-><init>(Landroidx/dynamicanimation/animation/b;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Landroidx/dynamicanimation/animation/b;->d:Ljava/lang/Runnable;

    .line 32
    .line 33
    const-wide/16 v0, 0x0

    .line 34
    .line 35
    iput-wide v0, p0, Landroidx/dynamicanimation/animation/b;->f:J

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    iput-boolean v0, p0, Landroidx/dynamicanimation/animation/b;->g:Z

    .line 39
    .line 40
    const/high16 v0, 0x3f800000    # 1.0f

    .line 41
    .line 42
    iput v0, p0, Landroidx/dynamicanimation/animation/b;->h:F

    .line 43
    .line 44
    iput-object p1, p0, Landroidx/dynamicanimation/animation/b;->e:Landroidx/dynamicanimation/animation/i;

    .line 45
    .line 46
    return-void
.end method

.method public static synthetic a(Landroidx/dynamicanimation/animation/b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/dynamicanimation/animation/b;->c:Landroidx/dynamicanimation/animation/b$b;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/b$b;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method static synthetic b(Landroidx/dynamicanimation/animation/b;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/dynamicanimation/animation/b;->d:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic c(Landroidx/dynamicanimation/animation/b;)Landroidx/dynamicanimation/animation/i;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/dynamicanimation/animation/b;->e:Landroidx/dynamicanimation/animation/i;

    .line 2
    .line 3
    return-object p0
.end method

.method private e()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Landroidx/dynamicanimation/animation/b;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Landroidx/dynamicanimation/animation/b;->b:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    add-int/lit8 v0, v0, -0x1

    .line 12
    .line 13
    :goto_0
    if-ltz v0, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Landroidx/dynamicanimation/animation/b;->b:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    iget-object v1, p0, Landroidx/dynamicanimation/animation/b;->b:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget-object v0, p0, Landroidx/dynamicanimation/animation/b;->b:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_2

    .line 38
    .line 39
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 40
    .line 41
    const/16 v1, 0x21

    .line 42
    .line 43
    if-lt v0, v1, :cond_2

    .line 44
    .line 45
    iget-object v0, p0, Landroidx/dynamicanimation/animation/b;->i:Landroidx/dynamicanimation/animation/b$e;

    .line 46
    .line 47
    invoke-interface {v0}, Landroidx/dynamicanimation/animation/b$e;->b()Z

    .line 48
    .line 49
    .line 50
    :cond_2
    const/4 v0, 0x0

    .line 51
    iput-boolean v0, p0, Landroidx/dynamicanimation/animation/b;->g:Z

    .line 52
    .line 53
    :cond_3
    return-void
.end method

.method static h()Landroidx/dynamicanimation/animation/b;
    .locals 3

    .line 1
    sget-object v0, Landroidx/dynamicanimation/animation/b;->j:Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    new-instance v1, Landroidx/dynamicanimation/animation/b;

    .line 10
    .line 11
    new-instance v2, Landroidx/dynamicanimation/animation/b$f;

    .line 12
    .line 13
    invoke-direct {v2}, Landroidx/dynamicanimation/animation/b$f;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-direct {v1, v2}, Landroidx/dynamicanimation/animation/b;-><init>(Landroidx/dynamicanimation/animation/i;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroidx/dynamicanimation/animation/b;

    .line 27
    .line 28
    return-object v0
.end method

.method private i(Landroidx/dynamicanimation/animation/b$c;J)Z
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/dynamicanimation/animation/b;->a:Lo/r;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lo/r;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Long;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    cmp-long p2, v2, p2

    .line 18
    .line 19
    if-gez p2, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Landroidx/dynamicanimation/animation/b;->a:Lo/r;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lo/r;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    return v1

    .line 27
    :cond_1
    const/4 p0, 0x0

    .line 28
    return p0
.end method


# virtual methods
.method d(Landroidx/dynamicanimation/animation/b$c;J)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/dynamicanimation/animation/b;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Landroidx/dynamicanimation/animation/b;->e:Landroidx/dynamicanimation/animation/i;

    .line 10
    .line 11
    iget-object v1, p0, Landroidx/dynamicanimation/animation/b;->d:Ljava/lang/Runnable;

    .line 12
    .line 13
    invoke-interface {v0, v1}, Landroidx/dynamicanimation/animation/i;->a(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 17
    .line 18
    const/16 v1, 0x21

    .line 19
    .line 20
    if-lt v0, v1, :cond_1

    .line 21
    .line 22
    invoke-static {}, Landroid/animation/ValueAnimator;->getDurationScale()F

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, Landroidx/dynamicanimation/animation/b;->h:F

    .line 27
    .line 28
    iget-object v0, p0, Landroidx/dynamicanimation/animation/b;->i:Landroidx/dynamicanimation/animation/b$e;

    .line 29
    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    new-instance v0, Landroidx/dynamicanimation/animation/b$d;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Landroidx/dynamicanimation/animation/b$d;-><init>(Landroidx/dynamicanimation/animation/b;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Landroidx/dynamicanimation/animation/b;->i:Landroidx/dynamicanimation/animation/b$e;

    .line 38
    .line 39
    :cond_0
    iget-object v0, p0, Landroidx/dynamicanimation/animation/b;->i:Landroidx/dynamicanimation/animation/b$e;

    .line 40
    .line 41
    invoke-interface {v0}, Landroidx/dynamicanimation/animation/b$e;->a()Z

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, p0, Landroidx/dynamicanimation/animation/b;->b:Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_2

    .line 51
    .line 52
    iget-object v0, p0, Landroidx/dynamicanimation/animation/b;->b:Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    :cond_2
    const-wide/16 v0, 0x0

    .line 58
    .line 59
    cmp-long v0, p2, v0

    .line 60
    .line 61
    if-lez v0, :cond_3

    .line 62
    .line 63
    iget-object p0, p0, Landroidx/dynamicanimation/animation/b;->a:Lo/r;

    .line 64
    .line 65
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 66
    .line 67
    .line 68
    move-result-wide v0

    .line 69
    add-long/2addr v0, p2

    .line 70
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-virtual {p0, p1, p2}, Lo/r;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    :cond_3
    return-void
.end method

.method f(J)V
    .locals 5

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const/4 v2, 0x0

    .line 6
    :goto_0
    iget-object v3, p0, Landroidx/dynamicanimation/animation/b;->b:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    if-ge v2, v3, :cond_2

    .line 13
    .line 14
    iget-object v3, p0, Landroidx/dynamicanimation/animation/b;->b:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    check-cast v3, Landroidx/dynamicanimation/animation/b$c;

    .line 21
    .line 22
    if-nez v3, :cond_0

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_0
    invoke-direct {p0, v3, v0, v1}, Landroidx/dynamicanimation/animation/b;->i(Landroidx/dynamicanimation/animation/b$c;J)Z

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-eqz v4, :cond_1

    .line 30
    .line 31
    invoke-interface {v3, p1, p2}, Landroidx/dynamicanimation/animation/b$c;->doAnimationFrame(J)Z

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    invoke-direct {p0}, Landroidx/dynamicanimation/animation/b;->e()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public g()F
    .locals 0

    .line 1
    iget p0, p0, Landroidx/dynamicanimation/animation/b;->h:F

    .line 2
    .line 3
    return p0
.end method

.method j()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/dynamicanimation/animation/b;->e:Landroidx/dynamicanimation/animation/i;

    .line 2
    .line 3
    invoke-interface {p0}, Landroidx/dynamicanimation/animation/i;->b()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method k(Landroidx/dynamicanimation/animation/b$c;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/dynamicanimation/animation/b;->a:Lo/r;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lo/r;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Landroidx/dynamicanimation/animation/b;->b:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-ltz p1, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Landroidx/dynamicanimation/animation/b;->b:Ljava/util/ArrayList;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, p1, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    iput-boolean p1, p0, Landroidx/dynamicanimation/animation/b;->g:Z

    .line 22
    .line 23
    :cond_0
    return-void
.end method
