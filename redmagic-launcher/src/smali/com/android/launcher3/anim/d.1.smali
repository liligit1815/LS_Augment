.class public Lcom/android/launcher3/anim/d;
.super Ljava/lang/Object;
.source "AnimatedFloat.java"


# static fields
.field public static final e:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/anim/d;",
            ">;"
        }
    .end annotation
.end field

.field private static final f:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private b:Landroid/animation/ObjectAnimator;

.field private c:Ljava/lang/Float;

.field public d:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/d$a;

    .line 2
    .line 3
    const-string v1, "value"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d$a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/anim/b;

    .line 11
    .line 12
    invoke-direct {v0}, Lcom/android/launcher3/anim/b;-><init>()V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lcom/android/launcher3/anim/d;->f:Ljava/util/function/Consumer;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/anim/d;->f:Ljava/util/function/Consumer;

    invoke-direct {p0, v0}, Lcom/android/launcher3/anim/d;-><init>(Ljava/util/function/Consumer;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Runnable;)V
    .locals 1

    .line 2
    new-instance v0, Lcom/android/launcher3/anim/c;

    invoke-direct {v0, p1}, Lcom/android/launcher3/anim/c;-><init>(Ljava/lang/Runnable;)V

    invoke-direct {p0, v0}, Lcom/android/launcher3/anim/d;-><init>(Ljava/util/function/Consumer;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Runnable;F)V
    .locals 0

    .line 5
    invoke-direct {p0, p1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 6
    iput p2, p0, Lcom/android/launcher3/anim/d;->d:F

    return-void
.end method

.method public constructor <init>(Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-object p1, p0, Lcom/android/launcher3/anim/d;->a:Ljava/util/function/Consumer;

    return-void
.end method

.method public static synthetic a(Ljava/lang/Runnable;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ljava/lang/Float;)V
    .locals 0

    .line 1
    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/anim/d;)Landroid/animation/ObjectAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/d;->b:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/anim/d;Ljava/lang/Float;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/d;->c:Ljava/lang/Float;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic e(Lcom/android/launcher3/anim/d;Landroid/animation/ObjectAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/d;->b:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public f(F)Landroid/animation/ObjectAnimator;
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/anim/d;->g(FF)Landroid/animation/ObjectAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public g(FF)Landroid/animation/ObjectAnimator;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/anim/d;->h()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    new-array v1, v1, [F

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    aput p1, v1, v2

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    aput p2, v1, p1

    .line 14
    .line 15
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/android/launcher3/anim/d;->b:Landroid/animation/ObjectAnimator;

    .line 20
    .line 21
    new-instance v0, Lcom/android/launcher3/anim/d$b;

    .line 22
    .line 23
    invoke-direct {v0, p0, p2}, Lcom/android/launcher3/anim/d$b;-><init>(Lcom/android/launcher3/anim/d;F)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/android/launcher3/anim/d;->b:Landroid/animation/ObjectAnimator;

    .line 30
    .line 31
    return-object p0
.end method

.method public h()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/d;->b:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/anim/d;->b:Landroid/animation/ObjectAnimator;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    new-array v1, v1, [Landroid/animation/PropertyValuesHolder;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/android/launcher3/anim/d;->b:Landroid/animation/ObjectAnimator;

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/d;->b:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/anim/d;->b:Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->end()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public j()J
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/anim/d;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-wide/16 v1, 0x0

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/anim/d;->b:Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/anim/d;->b:Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->getDuration()J

    .line 20
    .line 21
    .line 22
    move-result-wide v3

    .line 23
    iget-object p0, p0, Lcom/android/launcher3/anim/d;->b:Landroid/animation/ObjectAnimator;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->getCurrentPlayTime()J

    .line 26
    .line 27
    .line 28
    move-result-wide v5

    .line 29
    sub-long/2addr v3, v5

    .line 30
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    return-wide v0

    .line 35
    :cond_0
    return-wide v1
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/d;->b:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

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

.method public l(F)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/anim/d;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/anim/d;->c:Ljava/lang/Float;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    cmpl-float p0, p0, p1

    .line 16
    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public m(F)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/anim/d;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 8
    .line 9
    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public n(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 2
    .line 3
    invoke-static {p1, v0}, Ljava/lang/Float;->compare(FF)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iput p1, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/anim/d;->a:Ljava/util/function/Consumer;

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {p0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
