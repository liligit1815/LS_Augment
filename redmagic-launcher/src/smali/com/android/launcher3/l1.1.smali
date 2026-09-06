.class public Lcom/android/launcher3/l1;
.super Ljava/lang/Object;
.source "InterruptibleInOutAnimator.java"


# static fields
.field private static final i:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lcom/android/launcher3/l1;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private a:J

.field private b:F

.field private c:F

.field private d:Landroid/animation/ValueAnimator;

.field private e:F

.field private f:Z

.field private g:Ljava/lang/Object;

.field h:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/l1$a;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 4
    .line 5
    const-string v2, "value"

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/l1$a;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/android/launcher3/l1;->i:Landroid/util/Property;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(JFF)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/l1;->f:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Lcom/android/launcher3/l1;->g:Ljava/lang/Object;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput v1, p0, Lcom/android/launcher3/l1;->h:I

    .line 12
    .line 13
    sget-object v2, Lcom/android/launcher3/l1;->i:Landroid/util/Property;

    .line 14
    .line 15
    const/4 v3, 0x2

    .line 16
    new-array v3, v3, [F

    .line 17
    .line 18
    aput p3, v3, v1

    .line 19
    .line 20
    aput p4, v3, v0

    .line 21
    .line 22
    invoke-static {p0, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, p1, p2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/android/launcher3/l1;->d:Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    iput-wide p1, p0, Lcom/android/launcher3/l1;->a:J

    .line 33
    .line 34
    iput p3, p0, Lcom/android/launcher3/l1;->b:F

    .line 35
    .line 36
    iput p4, p0, Lcom/android/launcher3/l1;->c:F

    .line 37
    .line 38
    new-instance p1, Lcom/android/launcher3/l1$b;

    .line 39
    .line 40
    invoke-direct {p1, p0}, Lcom/android/launcher3/l1$b;-><init>(Lcom/android/launcher3/l1;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/l1;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/l1;->e:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/l1;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/l1;->e:F

    .line 2
    .line 3
    return-void
.end method

.method private c(I)V
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object v1, p0, Lcom/android/launcher3/l1;->d:Landroid/animation/ValueAnimator;

    .line 3
    .line 4
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->getCurrentPlayTime()J

    .line 5
    .line 6
    .line 7
    move-result-wide v1

    .line 8
    const/4 v3, 0x1

    .line 9
    if-ne p1, v3, :cond_0

    .line 10
    .line 11
    iget v4, p0, Lcom/android/launcher3/l1;->c:F

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget v4, p0, Lcom/android/launcher3/l1;->b:F

    .line 15
    .line 16
    :goto_0
    iget-boolean v5, p0, Lcom/android/launcher3/l1;->f:Z

    .line 17
    .line 18
    if-eqz v5, :cond_1

    .line 19
    .line 20
    iget v5, p0, Lcom/android/launcher3/l1;->b:F

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    iget v5, p0, Lcom/android/launcher3/l1;->e:F

    .line 24
    .line 25
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher3/l1;->f()V

    .line 26
    .line 27
    .line 28
    iput p1, p0, Lcom/android/launcher3/l1;->h:I

    .line 29
    .line 30
    iget-wide v6, p0, Lcom/android/launcher3/l1;->a:J

    .line 31
    .line 32
    sub-long v1, v6, v1

    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/launcher3/l1;->d:Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    const-wide/16 v8, 0x0

    .line 37
    .line 38
    invoke-static {v1, v2, v6, v7}, Ljava/lang/Math;->min(JJ)J

    .line 39
    .line 40
    .line 41
    move-result-wide v1

    .line 42
    invoke-static {v8, v9, v1, v2}, Ljava/lang/Math;->max(JJ)J

    .line 43
    .line 44
    .line 45
    move-result-wide v1

    .line 46
    invoke-virtual {p1, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/android/launcher3/l1;->d:Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    const/4 v1, 0x2

    .line 52
    new-array v1, v1, [F

    .line 53
    .line 54
    aput v5, v1, v0

    .line 55
    .line 56
    aput v4, v1, v3

    .line 57
    .line 58
    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/android/launcher3/l1;->d:Landroid/animation/ValueAnimator;

    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 64
    .line 65
    .line 66
    iput-boolean v0, p0, Lcom/android/launcher3/l1;->f:Z

    .line 67
    .line 68
    return-void
.end method


# virtual methods
.method public d()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/l1;->c(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/l1;->c(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/l1;->d:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/android/launcher3/l1;->h:I

    .line 8
    .line 9
    return-void
.end method

.method public g()Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/l1;->d:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/l1;->g:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/l1;->h:I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public j(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/l1;->g:Ljava/lang/Object;

    .line 2
    .line 3
    return-void
.end method
