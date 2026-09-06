.class Lcom/android/launcher3/taskbar/M0$e;
.super Ljava/lang/Object;
.source "NavbarButtonsViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/M0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "e"
.end annotation


# instance fields
.field private final a:F

.field private final b:F

.field private final c:Landroid/animation/ObjectAnimator;

.field private final d:Ljava/util/function/IntPredicate;

.field private e:Z


# direct methods
.method constructor <init>(Landroid/view/View;Ljava/util/function/IntPredicate;)V
    .locals 6

    .line 1
    sget-object v3, Lcom/android/launcher3/G2;->k:Landroid/util/FloatProperty;

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Ljava/lang/Object;Ljava/util/function/IntPredicate;Landroid/util/Property;FF)V

    .line 2
    iget-object p0, v0, Lcom/android/launcher3/taskbar/M0$e;->c:Landroid/animation/ObjectAnimator;

    new-instance p1, Lcom/android/launcher3/anim/a;

    invoke-direct {p1, v1}, Lcom/android/launcher3/anim/a;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, p1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    return-void
.end method

.method constructor <init>(Lcom/android/launcher3/anim/d;Ljava/util/function/IntPredicate;)V
    .locals 6

    .line 4
    sget-object v3, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Ljava/lang/Object;Ljava/util/function/IntPredicate;Landroid/util/Property;FF)V

    return-void
.end method

.method constructor <init>(Lcom/android/launcher3/util/v1$c;Ljava/util/function/IntPredicate;)V
    .locals 6

    .line 3
    sget-object v3, Lcom/android/launcher3/util/v1;->MULTI_PROPERTY_VALUE:Landroid/util/FloatProperty;

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Ljava/lang/Object;Ljava/util/function/IntPredicate;Landroid/util/Property;FF)V

    return-void
.end method

.method constructor <init>(Ljava/lang/Object;Ljava/util/function/IntPredicate;Landroid/util/Property;FF)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/util/function/IntPredicate;",
            "Landroid/util/Property<",
            "TT;",
            "Ljava/lang/Float;",
            ">;FF)V"
        }
    .end annotation

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/M0$e;->e:Z

    .line 7
    iput-object p2, p0, Lcom/android/launcher3/taskbar/M0$e;->d:Ljava/util/function/IntPredicate;

    .line 8
    iput p4, p0, Lcom/android/launcher3/taskbar/M0$e;->a:F

    .line 9
    iput p5, p0, Lcom/android/launcher3/taskbar/M0$e;->b:F

    const/4 p2, 0x2

    .line 10
    new-array p2, p2, [F

    const/4 v1, 0x0

    aput p4, p2, v1

    aput p5, p2, v0

    invoke-static {p1, p3, p2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/taskbar/M0$e;->c:Landroid/animation/ObjectAnimator;

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0$e;->c:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0$e;->c:Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->end()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public b(IZ)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0$e;->d:Ljava/util/function/IntPredicate;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/function/IntPredicate;->test(I)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/M0$e;->e:Z

    .line 8
    .line 9
    if-eq v0, p1, :cond_1

    .line 10
    .line 11
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/M0$e;->e:Z

    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/taskbar/M0$e;->c:Landroid/animation/ObjectAnimator;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/launcher3/taskbar/M0$e;->c:Landroid/animation/ObjectAnimator;

    .line 19
    .line 20
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/M0$e;->e:Z

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget v0, p0, Lcom/android/launcher3/taskbar/M0$e;->a:F

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget v0, p0, Lcom/android/launcher3/taskbar/M0$e;->b:F

    .line 28
    .line 29
    :goto_0
    const/4 v1, 0x1

    .line 30
    new-array v1, v1, [F

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    aput v0, v1, v2

    .line 34
    .line 35
    invoke-virtual {p1, v1}, Landroid/animation/ObjectAnimator;->setFloatValues([F)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/android/launcher3/taskbar/M0$e;->c:Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    .line 41
    .line 42
    .line 43
    if-eqz p2, :cond_1

    .line 44
    .line 45
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0$e;->c:Landroid/animation/ObjectAnimator;

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->end()V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method
