.class public Lcom/android/launcher3/N6;
.super Ljava/lang/Object;
.source "WorkspaceStateTransitionAnimation.java"


# static fields
.field private static final d:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/Workspace<",
            "*>;>;"
        }
    .end annotation
.end field

.field private static final e:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/Hotseat;",
            ">;"
        }
    .end annotation
.end field

.field private static final f:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;",
            ">;"
        }
    .end annotation
.end field

.field private static final g:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/LongClickTextView;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:Lcom/android/launcher3/C2;

.field private final b:Lcom/android/launcher3/Workspace;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/Workspace<",
            "*>;"
        }
    .end annotation
.end field

.field private c:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/G2;->c:Lcom/android/launcher3/util/y1;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/y1;->n(Ljava/lang/Integer;)Landroid/util/FloatProperty;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Lcom/android/launcher3/N6;->d:Landroid/util/FloatProperty;

    .line 13
    .line 14
    sget-object v0, Lcom/android/launcher3/G2;->d:Lcom/android/launcher3/util/y1;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/y1;->n(Ljava/lang/Integer;)Landroid/util/FloatProperty;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sput-object v0, Lcom/android/launcher3/N6;->e:Landroid/util/FloatProperty;

    .line 21
    .line 22
    sget-object v0, Lcom/android/launcher3/G2;->t:Lcom/android/launcher3/util/y1;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/y1;->n(Ljava/lang/Integer;)Landroid/util/FloatProperty;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sput-object v0, Lcom/android/launcher3/N6;->f:Landroid/util/FloatProperty;

    .line 29
    .line 30
    sget-object v0, Lcom/android/launcher3/G2;->u:Lcom/android/launcher3/util/y1;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/y1;->n(Ljava/lang/Integer;)Landroid/util/FloatProperty;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sput-object v0, Lcom/android/launcher3/N6;->g:Landroid/util/FloatProperty;

    .line 37
    .line 38
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/Workspace;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/C2;",
            "Lcom/android/launcher3/Workspace<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 7
    .line 8
    return-void
.end method

.method private b(Lcom/android/launcher3/V3;Lcom/android/launcher3/CellLayout;ILcom/android/launcher3/V3$f;Lcom/android/launcher3/anim/Y;LQ1/f;)V
    .locals 1

    .line 1
    invoke-virtual {p4, p3}, Lcom/android/launcher3/V3$f;->a(I)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    instance-of p3, p1, LQ1/e;

    .line 6
    .line 7
    if-nez p3, :cond_1

    .line 8
    .line 9
    instance-of p1, p1, LQ1/a;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p1, 0x0

    .line 15
    goto :goto_1

    .line 16
    :cond_1
    :goto_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    :goto_1
    sget-object p3, Lcom/android/launcher3/CellLayout;->w0:Landroid/util/FloatProperty;

    .line 19
    .line 20
    sget-object v0, LJ0/h;->Y:Landroid/view/animation/Interpolator;

    .line 21
    .line 22
    invoke-virtual {p5, p2, p3, p1, v0}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x3

    .line 26
    iget-object p3, p4, Lcom/android/launcher3/V3$f;->a:Landroid/view/animation/Interpolator;

    .line 27
    .line 28
    invoke-virtual {p6, p1, p3}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    sget-object p4, Lcom/android/launcher3/G2;->k:Landroid/util/FloatProperty;

    .line 37
    .line 38
    invoke-virtual {p5, p3, p4, p0, p1}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    invoke-static {}, Lx1/O;->k1()Z

    .line 42
    .line 43
    .line 44
    move-result p3

    .line 45
    if-eqz p3, :cond_2

    .line 46
    .line 47
    invoke-virtual {p2}, Lcom/android/launcher3/CellLayout;->getUpperRightCornerLayout()Lcom/android/launcher3/bestie/UpperRightCornerLayout;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    if-eqz p3, :cond_2

    .line 52
    .line 53
    invoke-virtual {p2}, Lcom/android/launcher3/CellLayout;->getUpperRightCornerLayout()Lcom/android/launcher3/bestie/UpperRightCornerLayout;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-virtual {p5, p2, p4, p0, p1}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 58
    .line 59
    .line 60
    :cond_2
    return-void
.end method

.method private c(Lcom/android/launcher3/CellLayout;ILcom/android/launcher3/V3$g;Lcom/android/launcher3/anim/Y;LQ1/f;)V
    .locals 0

    .line 1
    invoke-virtual {p3, p2}, Lcom/android/launcher3/V3$g;->a(I)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 p2, 0xf

    .line 6
    .line 7
    iget-object p3, p3, Lcom/android/launcher3/V3$g;->a:Landroid/view/animation/Interpolator;

    .line 8
    .line 9
    invoke-virtual {p5, p2, p3}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    sget-object p3, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    .line 14
    .line 15
    invoke-virtual {p4, p1, p3, p0, p2}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private d(Landroid/view/View;FLjava/lang/String;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const p0, 0x7f0b03b6

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    instance-of v0, v0, Landroid/animation/Animator;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const v0, 0x7f0b03b7

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    instance-of v1, v1, Ljava/lang/Float;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Landroid/animation/Animator;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ljava/lang/Float;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    cmpl-float v1, v0, p2

    .line 42
    .line 43
    if-eqz v1, :cond_0

    .line 44
    .line 45
    new-instance v1, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v2, "endViewAnimIfNeedWhenSetWorkspaceProperty end view anim, viewTag="

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string p3, " animEndAlpha="

    .line 59
    .line 60
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string p3, " endAlpha="

    .line 67
    .line 68
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p3

    .line 78
    const-string v0, "WorkspaceStateTransitionAnimation"

    .line 79
    .line 80
    invoke-static {v0, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Landroid/animation/Animator;->end()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 87
    .line 88
    .line 89
    :cond_0
    return-void
.end method

.method public static f(Lcom/android/launcher3/C2;Landroid/view/View;FLandroid/util/FloatProperty;)Landroid/animation/ValueAnimator;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(",
            "Lcom/android/launcher3/C2;",
            "TT;F",
            "Landroid/util/FloatProperty<",
            "TT;>;)",
            "Landroid/animation/ValueAnimator;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/g0;->i(Landroid/content/Context;)Lx2/h;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7f07047a

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, v0}, Lx2/h;->getFloat(I)F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const v1, 0x7f07047b

    .line 13
    .line 14
    .line 15
    invoke-interface {p0, v1}, Lx2/h;->getFloat(I)F

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const v2, 0x7f07047c

    .line 20
    .line 21
    .line 22
    invoke-interface {p0, v2}, Lx2/h;->a(I)F

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    new-instance v2, Lcom/android/launcher3/anim/f0;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-direct {v2, v3}, Lcom/android/launcher3/anim/f0;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v1}, Lcom/android/launcher3/anim/f0;->s(F)Lcom/android/launcher3/anim/f0;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1, v0}, Lcom/android/launcher3/anim/f0;->n(F)Lcom/android/launcher3/anim/f0;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const v1, 0x3b03126f    # 0.002f

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/f0;->p(F)Lcom/android/launcher3/anim/f0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0, p2}, Lcom/android/launcher3/anim/f0;->o(F)Lcom/android/launcher3/anim/f0;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p3, p1}, Landroid/util/FloatProperty;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Ljava/lang/Float;

    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    invoke-virtual {p2, v0}, Lcom/android/launcher3/anim/f0;->q(F)Lcom/android/launcher3/anim/f0;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-virtual {p2, p0}, Lcom/android/launcher3/anim/f0;->r(F)Lcom/android/launcher3/anim/f0;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0, p1, p3}, Lcom/android/launcher3/anim/f0;->c(Ljava/lang/Object;Landroid/util/FloatProperty;)Landroid/animation/ValueAnimator;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0
.end method

.method public static g(Lcom/android/launcher3/C2;Lcom/android/launcher3/Workspace;F)Landroid/animation/ValueAnimator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/C2;",
            "Lcom/android/launcher3/Workspace<",
            "*>;F)",
            "Landroid/animation/ValueAnimator;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/launcher3/N6;->d:Landroid/util/FloatProperty;

    .line 2
    .line 3
    invoke-static {p0, p1, p2, v0}, Lcom/android/launcher3/N6;->f(Lcom/android/launcher3/C2;Landroid/view/View;FLandroid/util/FloatProperty;)Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method public a(Lcom/android/launcher3/V3;Lcom/android/launcher3/CellLayout;I)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/android/launcher3/V3;->v(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$f;

    .line 4
    .line 5
    .line 6
    move-result-object v5

    .line 7
    sget-object v6, Lcom/android/launcher3/anim/Y;->a:Lcom/android/launcher3/anim/Y;

    .line 8
    .line 9
    new-instance v7, LQ1/f;

    .line 10
    .line 11
    invoke-direct {v7}, LQ1/f;-><init>()V

    .line 12
    .line 13
    .line 14
    move-object v1, p0

    .line 15
    move-object v2, p1

    .line 16
    move-object v3, p2

    .line 17
    move v4, p3

    .line 18
    invoke-direct/range {v1 .. v7}, Lcom/android/launcher3/N6;->b(Lcom/android/launcher3/V3;Lcom/android/launcher3/CellLayout;ILcom/android/launcher3/V3$f;Lcom/android/launcher3/anim/Y;LQ1/f;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public e()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/N6;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public h(Lcom/android/launcher3/anim/Y;Lcom/android/launcher3/V3;LQ1/f;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/DragLayer;->getWorkspaceDragScrim()Ln1/s;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Ln1/s;->f:Landroid/util/FloatProperty;

    .line 12
    .line 13
    iget-object v2, p0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-virtual {p2, v2}, Lcom/android/launcher3/V3;->u(Lcom/android/launcher3/C2;)F

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    sget-object v3, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 20
    .line 21
    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/LauncherRootView;->getSysUiScrim()Ln1/x;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ln1/x;->f()Lcom/android/launcher3/anim/d;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget-object v1, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 39
    .line 40
    sget v2, Lcom/android/launcher3/V3;->i:I

    .line 41
    .line 42
    invoke-virtual {p2, v2}, Lcom/android/launcher3/V3;->hasFlag(I)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    const/4 v4, 0x0

    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    :cond_0
    :goto_0
    move v2, v4

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    invoke-static {}, Lx1/O;->t()Ljava/lang/Boolean;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_2

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    sget-object v2, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 63
    .line 64
    if-ne p2, v2, :cond_0

    .line 65
    .line 66
    const/high16 v2, 0x3e800000    # 0.25f

    .line 67
    .line 68
    :goto_1
    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 69
    .line 70
    .line 71
    invoke-static {}, Lx1/O;->N1()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_5

    .line 76
    .line 77
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 78
    .line 79
    if-eq p2, v0, :cond_3

    .line 80
    .line 81
    sget-object v0, Lcom/android/launcher3/V3;->C:Lcom/android/launcher3/V3;

    .line 82
    .line 83
    if-ne p2, v0, :cond_5

    .line 84
    .line 85
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v1, p0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 92
    .line 93
    invoke-virtual {p2, v1}, Lcom/android/launcher3/V3;->y(Lcom/android/launcher3/C2;)I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    invoke-virtual {v0, v1}, Lcom/android/launcher3/views/ScrimView;->setBackgroundBlur(I)V

    .line 98
    .line 99
    .line 100
    sget-object v0, Lcom/android/launcher3/V3;->C:Lcom/android/launcher3/V3;

    .line 101
    .line 102
    if-ne p2, v0, :cond_4

    .line 103
    .line 104
    iget-object p2, p0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 105
    .line 106
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    invoke-virtual {p2, v4}, Landroid/view/View;->setAlpha(F)V

    .line 111
    .line 112
    .line 113
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    const/16 p2, 0xd

    .line 120
    .line 121
    invoke-virtual {p3, p2, v3}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    const/high16 p3, 0x3f800000    # 1.0f

    .line 126
    .line 127
    invoke-virtual {p1, p0, p3, p2}, Lcom/android/launcher3/anim/Y;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_5
    invoke-static {}, Lx1/O;->N1()Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-nez v0, :cond_6

    .line 136
    .line 137
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 138
    .line 139
    if-ne p2, v0, :cond_6

    .line 140
    .line 141
    iget-object v0, p0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 142
    .line 143
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {v0}, Lcom/android/launcher3/views/ScrimView;->releaseBackgroundBlur()V

    .line 148
    .line 149
    .line 150
    :cond_6
    invoke-static {}, Lx1/O;->C2()Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-nez v0, :cond_7

    .line 155
    .line 156
    invoke-static {}, Lx1/O;->l2()Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    if-nez v0, :cond_7

    .line 161
    .line 162
    iget-object v0, p0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 163
    .line 164
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    iget-object p0, p0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 169
    .line 170
    invoke-virtual {p2, p0}, Lcom/android/launcher3/V3;->y(Lcom/android/launcher3/C2;)I

    .line 171
    .line 172
    .line 173
    move-result p0

    .line 174
    const/16 p2, 0xb

    .line 175
    .line 176
    sget-object v1, LJ0/h;->G:Landroid/view/animation/Interpolator;

    .line 177
    .line 178
    invoke-virtual {p3, p2, v1}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 179
    .line 180
    .line 181
    move-result-object p2

    .line 182
    invoke-virtual {p1, v0, p0, p2}, Lcom/android/launcher3/anim/Y;->d(Landroid/view/View;ILandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 183
    .line 184
    .line 185
    :cond_7
    return-void
.end method

.method public i(Lcom/android/launcher3/V3;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lcom/android/launcher3/anim/C;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget-boolean v2, v2, Lu2/e;->m:Z

    .line 16
    .line 17
    if-nez v2, :cond_1

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lu2/e;->b()Landroid/animation/AnimatorSet;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    iget-object v1, p0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 36
    .line 37
    iget-boolean v0, v0, Lcom/android/launcher3/anim/C;->E:Z

    .line 38
    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/4 v0, 0x0

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 45
    :goto_1
    sget-object v1, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 46
    .line 47
    if-ne p1, v1, :cond_2

    .line 48
    .line 49
    iget-object v1, p0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 50
    .line 51
    invoke-static {v1}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    sget-object v2, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 56
    .line 57
    if-ne v1, v2, :cond_2

    .line 58
    .line 59
    new-instance p0, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    const-string v1, "setState "

    .line 65
    .line 66
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string p1, " "

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string p1, "WorkspaceStateTransitionAnimation"

    .line 85
    .line 86
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_2
    sget-object v0, Lcom/android/launcher3/anim/Y;->a:Lcom/android/launcher3/anim/Y;

    .line 91
    .line 92
    new-instance v1, LQ1/f;

    .line 93
    .line 94
    invoke-direct {v1}, LQ1/f;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/N6;->k(Lcom/android/launcher3/V3;Lcom/android/launcher3/anim/Y;LQ1/f;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public j(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V
    .locals 1

    .line 1
    invoke-static {}, Lx1/O;->l2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p3, Lcom/android/launcher3/anim/Y;->a:Lcom/android/launcher3/anim/Y;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p3, p2}, Lcom/android/launcher3/N6;->k(Lcom/android/launcher3/V3;Lcom/android/launcher3/anim/Y;LQ1/f;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0, p1, p3, p2}, Lcom/android/launcher3/N6;->k(Lcom/android/launcher3/V3;Lcom/android/launcher3/anim/Y;LQ1/f;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public k(Lcom/android/launcher3/V3;Lcom/android/launcher3/anim/Y;LQ1/f;)V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Lcom/android/launcher3/V3;->x(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;

    .line 8
    .line 9
    .line 10
    move-result-object v7

    .line 11
    iget-object v2, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Lcom/android/launcher3/V3;->m(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;

    .line 14
    .line 15
    .line 16
    move-result-object v8

    .line 17
    iget v2, v7, Lcom/android/launcher3/V3$h;->a:F

    .line 18
    .line 19
    iput v2, v0, Lcom/android/launcher3/N6;->c:F

    .line 20
    .line 21
    iget-object v2, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Lcom/android/launcher3/V3;->v(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$f;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    iget-object v2, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 28
    .line 29
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 30
    .line 31
    .line 32
    move-result v9

    .line 33
    const/4 v3, 0x0

    .line 34
    :goto_0
    if-ge v3, v9, :cond_0

    .line 35
    .line 36
    iget-object v2, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 37
    .line 38
    invoke-virtual {v2, v3}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Lcom/android/launcher3/CellLayout;

    .line 43
    .line 44
    move-object/from16 v5, p2

    .line 45
    .line 46
    move-object/from16 v6, p3

    .line 47
    .line 48
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/N6;->b(Lcom/android/launcher3/V3;Lcom/android/launcher3/CellLayout;ILcom/android/launcher3/V3$f;Lcom/android/launcher3/anim/Y;LQ1/f;)V

    .line 49
    .line 50
    .line 51
    move-object/from16 v21, v6

    .line 52
    .line 53
    move-object v6, v1

    .line 54
    move-object v1, v4

    .line 55
    move-object v4, v5

    .line 56
    move-object/from16 v5, v21

    .line 57
    .line 58
    add-int/lit8 v3, v3, 0x1

    .line 59
    .line 60
    move-object v4, v1

    .line 61
    move-object v1, v6

    .line 62
    goto :goto_0

    .line 63
    :cond_0
    move-object/from16 v5, p3

    .line 64
    .line 65
    move-object v6, v1

    .line 66
    move-object v1, v4

    .line 67
    move-object/from16 v4, p2

    .line 68
    .line 69
    iget-object v2, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 70
    .line 71
    invoke-virtual {v6, v2}, Lcom/android/launcher3/V3;->t(Lcom/android/launcher3/C2;)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    iget-object v3, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 76
    .line 77
    invoke-virtual {v3}, Lcom/android/launcher3/Workspace;->getHotseat()Lcom/android/launcher3/Hotseat;

    .line 78
    .line 79
    .line 80
    move-result-object v11

    .line 81
    sget-object v3, LJ0/h;->Y:Landroid/view/animation/Interpolator;

    .line 82
    .line 83
    const/4 v12, 0x1

    .line 84
    invoke-virtual {v5, v12, v3}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 85
    .line 86
    .line 87
    move-result-object v13

    .line 88
    iget-object v14, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 89
    .line 90
    invoke-virtual {v14}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 91
    .line 92
    .line 93
    move-result-object v14

    .line 94
    invoke-virtual {v14}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 95
    .line 96
    .line 97
    move-result-object v14

    .line 98
    check-cast v14, Lcom/android/launcher3/V3;

    .line 99
    .line 100
    instance-of v15, v4, Lcom/android/launcher3/anim/V;

    .line 101
    .line 102
    if-eqz v15, :cond_1

    .line 103
    .line 104
    sget-object v15, Lcom/android/launcher3/V3;->t:Lcom/android/launcher3/V3;

    .line 105
    .line 106
    if-ne v14, v15, :cond_1

    .line 107
    .line 108
    sget-object v15, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 109
    .line 110
    if-ne v6, v15, :cond_1

    .line 111
    .line 112
    move v15, v12

    .line 113
    goto :goto_1

    .line 114
    :cond_1
    const/4 v15, 0x0

    .line 115
    :goto_1
    if-eqz v15, :cond_2

    .line 116
    .line 117
    move/from16 v16, v12

    .line 118
    .line 119
    move-object v12, v4

    .line 120
    check-cast v12, Lcom/android/launcher3/anim/V;

    .line 121
    .line 122
    iget-object v10, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 123
    .line 124
    move/from16 v18, v2

    .line 125
    .line 126
    iget-object v2, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 127
    .line 128
    move/from16 v19, v15

    .line 129
    .line 130
    iget v15, v0, Lcom/android/launcher3/N6;->c:F

    .line 131
    .line 132
    move/from16 v20, v9

    .line 133
    .line 134
    sget-object v9, Lcom/android/launcher3/N6;->d:Landroid/util/FloatProperty;

    .line 135
    .line 136
    invoke-static {v10, v2, v15, v9}, Lcom/android/launcher3/N6;->f(Lcom/android/launcher3/C2;Landroid/view/View;FLandroid/util/FloatProperty;)Landroid/animation/ValueAnimator;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-virtual {v12, v2}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 141
    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_2
    move/from16 v18, v2

    .line 145
    .line 146
    move/from16 v20, v9

    .line 147
    .line 148
    move/from16 v16, v12

    .line 149
    .line 150
    move/from16 v19, v15

    .line 151
    .line 152
    iget-object v2, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 153
    .line 154
    sget-object v9, Lcom/android/launcher3/N6;->d:Landroid/util/FloatProperty;

    .line 155
    .line 156
    iget v10, v0, Lcom/android/launcher3/N6;->c:F

    .line 157
    .line 158
    invoke-virtual {v4, v2, v9, v10, v13}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 159
    .line 160
    .line 161
    :goto_2
    iget-object v2, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 162
    .line 163
    invoke-virtual {v2, v11}, Lcom/android/launcher3/Workspace;->setPivotToScaleWithSelf(Landroid/view/View;)V

    .line 164
    .line 165
    .line 166
    iget-object v2, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 167
    .line 168
    invoke-static {v2}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    iget-boolean v2, v2, Lcom/android/launcher3/r4;->g0:Z

    .line 173
    .line 174
    if-eqz v2, :cond_3

    .line 175
    .line 176
    iget-object v2, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 177
    .line 178
    invoke-static {v2}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    if-eqz v2, :cond_3

    .line 183
    .line 184
    move/from16 v2, v16

    .line 185
    .line 186
    goto :goto_3

    .line 187
    :cond_3
    const/4 v2, 0x0

    .line 188
    :goto_3
    iget-object v9, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 189
    .line 190
    if-eqz v2, :cond_4

    .line 191
    .line 192
    invoke-static {}, Lx1/O;->q2()Z

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    if-nez v2, :cond_4

    .line 197
    .line 198
    const/4 v2, 0x0

    .line 199
    goto :goto_4

    .line 200
    :cond_4
    iget-object v2, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 201
    .line 202
    invoke-virtual {v2}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    invoke-virtual {v1, v2}, Lcom/android/launcher3/V3$f;->a(I)F

    .line 207
    .line 208
    .line 209
    move-result v2

    .line 210
    :goto_4
    iget-object v12, v1, Lcom/android/launcher3/V3$f;->a:Landroid/view/animation/Interpolator;

    .line 211
    .line 212
    const/4 v15, 0x3

    .line 213
    invoke-virtual {v5, v15, v12}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 214
    .line 215
    .line 216
    move-result-object v12

    .line 217
    invoke-virtual {v4, v9, v2, v12}, Lcom/android/launcher3/anim/Y;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 218
    .line 219
    .line 220
    iget-object v2, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 221
    .line 222
    invoke-virtual {v2}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    if-eqz v2, :cond_5

    .line 227
    .line 228
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->k0()Z

    .line 233
    .line 234
    .line 235
    move-result v2

    .line 236
    if-nez v2, :cond_5

    .line 237
    .line 238
    iget-object v2, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 239
    .line 240
    invoke-virtual {v2}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 241
    .line 242
    .line 243
    move-result-object v9

    .line 244
    invoke-virtual {v2, v9}, Lcom/android/launcher3/Workspace;->setPivotToScaleWithSelf(Landroid/view/View;)V

    .line 245
    .line 246
    .line 247
    :cond_5
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->N0()Z

    .line 252
    .line 253
    .line 254
    move-result v2

    .line 255
    if-nez v2, :cond_6

    .line 256
    .line 257
    iget-object v2, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 258
    .line 259
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 260
    .line 261
    .line 262
    move-result-object v2

    .line 263
    iget-object v2, v2, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 264
    .line 265
    iget-boolean v2, v2, Lcom/android/launcher3/r4;->k:Z

    .line 266
    .line 267
    if-eqz v2, :cond_7

    .line 268
    .line 269
    :cond_6
    iget-object v2, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 270
    .line 271
    iget-object v9, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 272
    .line 273
    invoke-virtual {v9}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 274
    .line 275
    .line 276
    move-result-object v9

    .line 277
    invoke-virtual {v2, v9}, Lcom/android/launcher3/Workspace;->setPivotToScaleWithSelf(Landroid/view/View;)V

    .line 278
    .line 279
    .line 280
    :cond_7
    invoke-virtual {v6}, Lcom/android/launcher3/V3;->z()Z

    .line 281
    .line 282
    .line 283
    move-result v2

    .line 284
    if-eqz v2, :cond_8

    .line 285
    .line 286
    const/high16 v2, 0x3f800000    # 1.0f

    .line 287
    .line 288
    goto :goto_5

    .line 289
    :cond_8
    iget v2, v8, Lcom/android/launcher3/V3$h;->a:F

    .line 290
    .line 291
    :goto_5
    const/4 v12, 0x4

    .line 292
    if-eqz v19, :cond_b

    .line 293
    .line 294
    move-object v13, v4

    .line 295
    check-cast v13, Lcom/android/launcher3/anim/V;

    .line 296
    .line 297
    iget-object v9, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 298
    .line 299
    sget-object v10, Lcom/android/launcher3/N6;->e:Landroid/util/FloatProperty;

    .line 300
    .line 301
    invoke-static {v9, v11, v2, v10}, Lcom/android/launcher3/N6;->f(Lcom/android/launcher3/C2;Landroid/view/View;FLandroid/util/FloatProperty;)Landroid/animation/ValueAnimator;

    .line 302
    .line 303
    .line 304
    move-result-object v9

    .line 305
    invoke-virtual {v13, v9}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 306
    .line 307
    .line 308
    iget-object v9, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 309
    .line 310
    invoke-virtual {v9}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 311
    .line 312
    .line 313
    move-result-object v9

    .line 314
    if-eqz v9, :cond_9

    .line 315
    .line 316
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 317
    .line 318
    .line 319
    move-result-object v9

    .line 320
    invoke-virtual {v9}, Lcom/android/launcher3/H5;->k0()Z

    .line 321
    .line 322
    .line 323
    move-result v9

    .line 324
    if-nez v9, :cond_9

    .line 325
    .line 326
    iget-object v9, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 327
    .line 328
    iget-object v10, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 329
    .line 330
    invoke-virtual {v10}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 331
    .line 332
    .line 333
    move-result-object v10

    .line 334
    sget-object v15, Lcom/android/launcher3/N6;->f:Landroid/util/FloatProperty;

    .line 335
    .line 336
    invoke-static {v9, v10, v2, v15}, Lcom/android/launcher3/N6;->f(Lcom/android/launcher3/C2;Landroid/view/View;FLandroid/util/FloatProperty;)Landroid/animation/ValueAnimator;

    .line 337
    .line 338
    .line 339
    move-result-object v9

    .line 340
    invoke-virtual {v13, v9}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 341
    .line 342
    .line 343
    :cond_9
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 344
    .line 345
    .line 346
    move-result-object v9

    .line 347
    invoke-virtual {v9}, Lcom/android/launcher3/H5;->N0()Z

    .line 348
    .line 349
    .line 350
    move-result v9

    .line 351
    if-nez v9, :cond_a

    .line 352
    .line 353
    iget-object v9, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 354
    .line 355
    invoke-virtual {v9}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 356
    .line 357
    .line 358
    move-result-object v9

    .line 359
    iget-object v9, v9, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 360
    .line 361
    iget-boolean v9, v9, Lcom/android/launcher3/r4;->k:Z

    .line 362
    .line 363
    if-eqz v9, :cond_e

    .line 364
    .line 365
    :cond_a
    iget-object v9, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 366
    .line 367
    invoke-virtual {v9}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 368
    .line 369
    .line 370
    move-result-object v10

    .line 371
    sget-object v15, Lcom/android/launcher3/N6;->g:Landroid/util/FloatProperty;

    .line 372
    .line 373
    invoke-static {v9, v10, v2, v15}, Lcom/android/launcher3/N6;->f(Lcom/android/launcher3/C2;Landroid/view/View;FLandroid/util/FloatProperty;)Landroid/animation/ValueAnimator;

    .line 374
    .line 375
    .line 376
    move-result-object v2

    .line 377
    invoke-virtual {v13, v2}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 378
    .line 379
    .line 380
    goto :goto_6

    .line 381
    :cond_b
    invoke-virtual {v5, v12, v13}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 382
    .line 383
    .line 384
    move-result-object v9

    .line 385
    sget-object v10, Lcom/android/launcher3/N6;->e:Landroid/util/FloatProperty;

    .line 386
    .line 387
    invoke-virtual {v4, v11, v10, v2, v9}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 388
    .line 389
    .line 390
    iget-object v10, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 391
    .line 392
    invoke-virtual {v10}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 393
    .line 394
    .line 395
    move-result-object v10

    .line 396
    if-eqz v10, :cond_c

    .line 397
    .line 398
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 399
    .line 400
    .line 401
    move-result-object v10

    .line 402
    invoke-virtual {v10}, Lcom/android/launcher3/H5;->k0()Z

    .line 403
    .line 404
    .line 405
    move-result v10

    .line 406
    if-nez v10, :cond_c

    .line 407
    .line 408
    iget-object v10, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 409
    .line 410
    invoke-virtual {v10}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 411
    .line 412
    .line 413
    move-result-object v10

    .line 414
    sget-object v13, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 415
    .line 416
    invoke-virtual {v4, v10, v13, v2, v9}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 417
    .line 418
    .line 419
    :cond_c
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 420
    .line 421
    .line 422
    move-result-object v10

    .line 423
    invoke-virtual {v10}, Lcom/android/launcher3/H5;->N0()Z

    .line 424
    .line 425
    .line 426
    move-result v10

    .line 427
    if-nez v10, :cond_d

    .line 428
    .line 429
    iget-object v10, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 430
    .line 431
    invoke-virtual {v10}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 432
    .line 433
    .line 434
    move-result-object v10

    .line 435
    iget-object v10, v10, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 436
    .line 437
    iget-boolean v10, v10, Lcom/android/launcher3/r4;->k:Z

    .line 438
    .line 439
    if-eqz v10, :cond_e

    .line 440
    .line 441
    :cond_d
    iget-object v10, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 442
    .line 443
    invoke-virtual {v10}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 444
    .line 445
    .line 446
    move-result-object v10

    .line 447
    sget-object v13, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 448
    .line 449
    invoke-virtual {v4, v10, v13, v2, v9}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 450
    .line 451
    .line 452
    :cond_e
    :goto_6
    iget-object v1, v1, Lcom/android/launcher3/V3$f;->a:Landroid/view/animation/Interpolator;

    .line 453
    .line 454
    const/4 v2, 0x3

    .line 455
    invoke-virtual {v5, v2, v1}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 456
    .line 457
    .line 458
    move-result-object v1

    .line 459
    and-int/lit8 v2, v18, 0x20

    .line 460
    .line 461
    if-eqz v2, :cond_f

    .line 462
    .line 463
    const/high16 v2, 0x3f800000    # 1.0f

    .line 464
    .line 465
    goto :goto_7

    .line 466
    :cond_f
    const/4 v2, 0x0

    .line 467
    :goto_7
    iget-object v9, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 468
    .line 469
    invoke-virtual {v9}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 470
    .line 471
    .line 472
    move-result-object v9

    .line 473
    invoke-virtual {v9}, Lcom/android/launcher3/V4;->getPageIndicator()Landroid/view/View;

    .line 474
    .line 475
    .line 476
    move-result-object v9

    .line 477
    if-eqz v9, :cond_10

    .line 478
    .line 479
    iget-object v9, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 480
    .line 481
    invoke-virtual {v9}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 482
    .line 483
    .line 484
    move-result-object v9

    .line 485
    invoke-virtual {v9}, Lcom/android/launcher3/V4;->getPageIndicator()Landroid/view/View;

    .line 486
    .line 487
    .line 488
    move-result-object v9

    .line 489
    invoke-virtual {v4, v9, v2, v1}, Lcom/android/launcher3/anim/Y;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 490
    .line 491
    .line 492
    :cond_10
    const/16 v2, 0x10

    .line 493
    .line 494
    invoke-virtual {v5, v2, v1}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 495
    .line 496
    .line 497
    move-result-object v2

    .line 498
    iget-object v9, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 499
    .line 500
    invoke-static {v9}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 501
    .line 502
    .line 503
    move-result-object v9

    .line 504
    iget-object v10, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 505
    .line 506
    invoke-static {v10}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 507
    .line 508
    .line 509
    move-result-object v10

    .line 510
    iget-boolean v10, v10, Lcom/android/launcher3/r4;->g0:Z

    .line 511
    .line 512
    if-eqz v10, :cond_11

    .line 513
    .line 514
    if-eqz v9, :cond_11

    .line 515
    .line 516
    move/from16 v10, v16

    .line 517
    .line 518
    goto :goto_8

    .line 519
    :cond_11
    const/4 v10, 0x0

    .line 520
    :goto_8
    and-int/lit8 v13, v18, 0x1

    .line 521
    .line 522
    if-eqz v13, :cond_13

    .line 523
    .line 524
    if-eqz v10, :cond_12

    .line 525
    .line 526
    invoke-static {}, Lx1/O;->q2()Z

    .line 527
    .line 528
    .line 529
    move-result v13

    .line 530
    if-nez v13, :cond_12

    .line 531
    .line 532
    sget-object v13, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 533
    .line 534
    if-ne v14, v13, :cond_13

    .line 535
    .line 536
    sget-object v13, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 537
    .line 538
    if-ne v6, v13, :cond_13

    .line 539
    .line 540
    :cond_12
    const/high16 v13, 0x3f800000    # 1.0f

    .line 541
    .line 542
    goto :goto_9

    .line 543
    :cond_13
    const/4 v13, 0x0

    .line 544
    :goto_9
    new-instance v15, Ljava/lang/StringBuilder;

    .line 545
    .line 546
    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 547
    .line 548
    .line 549
    const-string v12, "hotseatIconsAlpha "

    .line 550
    .line 551
    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 552
    .line 553
    .line 554
    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 555
    .line 556
    .line 557
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 558
    .line 559
    .line 560
    move-result-object v12

    .line 561
    const-string v15, "WorkspaceStateTransitionAnimation"

    .line 562
    .line 563
    invoke-static {v15, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 564
    .line 565
    .line 566
    invoke-virtual {v4, v11, v13, v2}, Lcom/android/launcher3/anim/Y;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 567
    .line 568
    .line 569
    if-eqz v10, :cond_15

    .line 570
    .line 571
    sget-object v2, Lcom/android/launcher3/V3;->t:Lcom/android/launcher3/V3;

    .line 572
    .line 573
    if-eq v6, v2, :cond_15

    .line 574
    .line 575
    iget-object v2, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 576
    .line 577
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->O2()Z

    .line 578
    .line 579
    .line 580
    move-result v2

    .line 581
    if-nez v2, :cond_15

    .line 582
    .line 583
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 584
    .line 585
    if-ne v6, v2, :cond_14

    .line 586
    .line 587
    const/high16 v2, 0x3f800000    # 1.0f

    .line 588
    .line 589
    goto :goto_a

    .line 590
    :cond_14
    move v2, v13

    .line 591
    :goto_a
    invoke-virtual {v4, v9, v2, v1}, Lcom/android/launcher3/anim/Y;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 592
    .line 593
    .line 594
    :cond_15
    const-string v2, "hotseat"

    .line 595
    .line 596
    invoke-direct {v0, v11, v13, v2}, Lcom/android/launcher3/N6;->d(Landroid/view/View;FLjava/lang/String;)V

    .line 597
    .line 598
    .line 599
    iget-object v2, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 600
    .line 601
    invoke-virtual {v2}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 602
    .line 603
    .line 604
    move-result-object v2

    .line 605
    if-eqz v2, :cond_16

    .line 606
    .line 607
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 608
    .line 609
    .line 610
    move-result-object v2

    .line 611
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->k0()Z

    .line 612
    .line 613
    .line 614
    move-result v2

    .line 615
    if-nez v2, :cond_16

    .line 616
    .line 617
    iget-object v2, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 618
    .line 619
    invoke-virtual {v2}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 620
    .line 621
    .line 622
    move-result-object v2

    .line 623
    const-string v9, "MfvPageIndicatorLayout"

    .line 624
    .line 625
    invoke-direct {v0, v2, v13, v9}, Lcom/android/launcher3/N6;->d(Landroid/view/View;FLjava/lang/String;)V

    .line 626
    .line 627
    .line 628
    iget-object v2, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 629
    .line 630
    invoke-virtual {v2}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 631
    .line 632
    .line 633
    move-result-object v2

    .line 634
    invoke-virtual {v4, v2, v13, v1}, Lcom/android/launcher3/anim/Y;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 635
    .line 636
    .line 637
    :cond_16
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 638
    .line 639
    .line 640
    move-result-object v2

    .line 641
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->N0()Z

    .line 642
    .line 643
    .line 644
    move-result v2

    .line 645
    if-nez v2, :cond_17

    .line 646
    .line 647
    iget-object v2, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 648
    .line 649
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 650
    .line 651
    .line 652
    move-result-object v2

    .line 653
    iget-object v2, v2, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 654
    .line 655
    iget-boolean v2, v2, Lcom/android/launcher3/r4;->k:Z

    .line 656
    .line 657
    if-eqz v2, :cond_18

    .line 658
    .line 659
    :cond_17
    iget-object v2, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 660
    .line 661
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 662
    .line 663
    .line 664
    move-result-object v2

    .line 665
    const-string v9, "LongClickHelpTextViewStremaer"

    .line 666
    .line 667
    invoke-direct {v0, v2, v13, v9}, Lcom/android/launcher3/N6;->d(Landroid/view/View;FLjava/lang/String;)V

    .line 668
    .line 669
    .line 670
    iget-object v2, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 671
    .line 672
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 673
    .line 674
    .line 675
    move-result-object v2

    .line 676
    invoke-virtual {v4, v2, v13, v1}, Lcom/android/launcher3/anim/Y;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 677
    .line 678
    .line 679
    :cond_18
    sget v1, Lcom/android/launcher3/V3;->l:I

    .line 680
    .line 681
    invoke-virtual {v6, v1}, Lcom/android/launcher3/V3;->hasFlag(I)Z

    .line 682
    .line 683
    .line 684
    move-result v2

    .line 685
    if-eqz v2, :cond_19

    .line 686
    .line 687
    const/4 v2, 0x4

    .line 688
    goto :goto_b

    .line 689
    :cond_19
    const/4 v2, 0x0

    .line 690
    :goto_b
    invoke-virtual {v11, v2}, Landroid/view/ViewGroup;->setImportantForAccessibility(I)V

    .line 691
    .line 692
    .line 693
    invoke-virtual {v6, v1}, Lcom/android/launcher3/V3;->hasFlag(I)Z

    .line 694
    .line 695
    .line 696
    move-result v1

    .line 697
    if-eqz v1, :cond_1a

    .line 698
    .line 699
    const/high16 v1, 0x60000

    .line 700
    .line 701
    goto :goto_c

    .line 702
    :cond_1a
    const/high16 v1, 0x20000

    .line 703
    .line 704
    :goto_c
    invoke-virtual {v11, v1}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 705
    .line 706
    .line 707
    const/4 v9, 0x2

    .line 708
    invoke-virtual {v5, v9, v3}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 709
    .line 710
    .line 711
    move-result-object v10

    .line 712
    iget-object v1, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 713
    .line 714
    sget-object v2, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    .line 715
    .line 716
    iget v3, v7, Lcom/android/launcher3/V3$h;->b:F

    .line 717
    .line 718
    invoke-virtual {v4, v1, v2, v3, v10}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 719
    .line 720
    .line 721
    iget-object v1, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 722
    .line 723
    sget-object v2, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    .line 724
    .line 725
    iget v3, v7, Lcom/android/launcher3/V3$h;->c:F

    .line 726
    .line 727
    invoke-virtual {v4, v1, v2, v3, v10}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 728
    .line 729
    .line 730
    iget-object v1, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 731
    .line 732
    invoke-virtual {v6, v1}, Lcom/android/launcher3/V3;->w(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$g;

    .line 733
    .line 734
    .line 735
    move-result-object v3

    .line 736
    sget-object v1, Lf1/a;->c:Lf1/a$a;

    .line 737
    .line 738
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 739
    .line 740
    .line 741
    move-result v1

    .line 742
    if-nez v1, :cond_1b

    .line 743
    .line 744
    move/from16 v7, v20

    .line 745
    .line 746
    const/4 v2, 0x0

    .line 747
    :goto_d
    if-ge v2, v7, :cond_1b

    .line 748
    .line 749
    iget-object v1, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 750
    .line 751
    invoke-virtual {v1, v2}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 752
    .line 753
    .line 754
    move-result-object v1

    .line 755
    check-cast v1, Lcom/android/launcher3/CellLayout;

    .line 756
    .line 757
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/N6;->c(Lcom/android/launcher3/CellLayout;ILcom/android/launcher3/V3$g;Lcom/android/launcher3/anim/Y;LQ1/f;)V

    .line 758
    .line 759
    .line 760
    add-int/lit8 v2, v2, 0x1

    .line 761
    .line 762
    goto :goto_d

    .line 763
    :cond_1b
    const/4 v1, 0x5

    .line 764
    invoke-virtual {v5, v1, v10}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 765
    .line 766
    .line 767
    move-result-object v1

    .line 768
    iget-object v2, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 769
    .line 770
    invoke-virtual {v2}, Lcom/android/launcher3/V4;->getPageIndicator()Landroid/view/View;

    .line 771
    .line 772
    .line 773
    move-result-object v2

    .line 774
    if-eqz v2, :cond_1c

    .line 775
    .line 776
    iget-object v2, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 777
    .line 778
    invoke-virtual {v2}, Lcom/android/launcher3/V4;->getPageIndicator()Landroid/view/View;

    .line 779
    .line 780
    .line 781
    move-result-object v2

    .line 782
    sget-object v3, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    .line 783
    .line 784
    iget v7, v8, Lcom/android/launcher3/V3$h;->c:F

    .line 785
    .line 786
    invoke-virtual {v4, v2, v3, v7, v1}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 787
    .line 788
    .line 789
    :cond_1c
    const/16 v2, 0x8

    .line 790
    .line 791
    invoke-virtual {v5, v2}, LQ1/f;->c(I)Z

    .line 792
    .line 793
    .line 794
    move-result v2

    .line 795
    if-nez v2, :cond_1d

    .line 796
    .line 797
    invoke-virtual {v0, v4, v6, v5}, Lcom/android/launcher3/N6;->h(Lcom/android/launcher3/anim/Y;Lcom/android/launcher3/V3;LQ1/f;)V

    .line 798
    .line 799
    .line 800
    :cond_1d
    invoke-virtual {v6}, Lcom/android/launcher3/V3;->z()Z

    .line 801
    .line 802
    .line 803
    move-result v2

    .line 804
    if-nez v2, :cond_21

    .line 805
    .line 806
    sget-object v2, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    .line 807
    .line 808
    iget v3, v8, Lcom/android/launcher3/V3$h;->c:F

    .line 809
    .line 810
    invoke-virtual {v4, v11, v2, v3, v10}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 811
    .line 812
    .line 813
    iget-object v3, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 814
    .line 815
    invoke-virtual {v6, v3}, Lcom/android/launcher3/V3;->t(Lcom/android/launcher3/C2;)I

    .line 816
    .line 817
    .line 818
    move-result v3

    .line 819
    and-int/lit8 v3, v3, 0x1

    .line 820
    .line 821
    if-eqz v3, :cond_1e

    .line 822
    .line 823
    const/4 v3, 0x0

    .line 824
    invoke-virtual {v11, v3}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 825
    .line 826
    .line 827
    :cond_1e
    iget-object v3, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 828
    .line 829
    invoke-virtual {v3}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 830
    .line 831
    .line 832
    move-result-object v3

    .line 833
    if-eqz v3, :cond_1f

    .line 834
    .line 835
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 836
    .line 837
    .line 838
    move-result-object v3

    .line 839
    invoke-virtual {v3}, Lcom/android/launcher3/H5;->k0()Z

    .line 840
    .line 841
    .line 842
    move-result v3

    .line 843
    if-nez v3, :cond_1f

    .line 844
    .line 845
    iget-object v3, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 846
    .line 847
    invoke-virtual {v3}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 848
    .line 849
    .line 850
    move-result-object v3

    .line 851
    iget v5, v8, Lcom/android/launcher3/V3$h;->c:F

    .line 852
    .line 853
    invoke-virtual {v4, v3, v2, v5, v10}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 854
    .line 855
    .line 856
    iget-object v3, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 857
    .line 858
    invoke-virtual {v3}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 859
    .line 860
    .line 861
    move-result-object v3

    .line 862
    const/4 v5, 0x0

    .line 863
    invoke-virtual {v3, v5}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 864
    .line 865
    .line 866
    :cond_1f
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 867
    .line 868
    .line 869
    move-result-object v3

    .line 870
    invoke-virtual {v3}, Lcom/android/launcher3/H5;->N0()Z

    .line 871
    .line 872
    .line 873
    move-result v3

    .line 874
    if-nez v3, :cond_20

    .line 875
    .line 876
    iget-object v3, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 877
    .line 878
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 879
    .line 880
    .line 881
    move-result-object v3

    .line 882
    iget-object v3, v3, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 883
    .line 884
    iget-boolean v3, v3, Lcom/android/launcher3/r4;->k:Z

    .line 885
    .line 886
    if-eqz v3, :cond_21

    .line 887
    .line 888
    :cond_20
    iget-object v3, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 889
    .line 890
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 891
    .line 892
    .line 893
    move-result-object v3

    .line 894
    iget v5, v8, Lcom/android/launcher3/V3$h;->c:F

    .line 895
    .line 896
    invoke-virtual {v4, v3, v2, v5, v10}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 897
    .line 898
    .line 899
    iget-object v2, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 900
    .line 901
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 902
    .line 903
    .line 904
    move-result-object v2

    .line 905
    const/4 v3, 0x0

    .line 906
    invoke-virtual {v2, v3}, Lcom/android/launcher3/LongClickTextView;->setVisibility(I)V

    .line 907
    .line 908
    .line 909
    :cond_21
    iget-object v2, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 910
    .line 911
    invoke-virtual {v2}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 912
    .line 913
    .line 914
    move-result-object v2

    .line 915
    if-eqz v2, :cond_24

    .line 916
    .line 917
    sget-object v2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 918
    .line 919
    if-eq v6, v2, :cond_22

    .line 920
    .line 921
    if-eq v14, v2, :cond_22

    .line 922
    .line 923
    sget-object v3, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 924
    .line 925
    if-ne v6, v3, :cond_24

    .line 926
    .line 927
    :cond_22
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 928
    .line 929
    .line 930
    move-result-object v3

    .line 931
    invoke-virtual {v3}, Lcom/android/launcher3/H5;->k0()Z

    .line 932
    .line 933
    .line 934
    move-result v3

    .line 935
    if-nez v3, :cond_24

    .line 936
    .line 937
    iget-object v3, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 938
    .line 939
    invoke-virtual {v3}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 940
    .line 941
    .line 942
    move-result-object v3

    .line 943
    if-ne v6, v2, :cond_23

    .line 944
    .line 945
    new-array v2, v9, [I

    .line 946
    .line 947
    iget-object v5, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 948
    .line 949
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 950
    .line 951
    .line 952
    move-result-object v5

    .line 953
    invoke-virtual {v5, v3, v2}, Lcom/android/launcher3/views/BaseDragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 954
    .line 955
    .line 956
    iget-object v5, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 957
    .line 958
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getPivotY()F

    .line 959
    .line 960
    .line 961
    move-result v5

    .line 962
    aget v7, v2, v16

    .line 963
    .line 964
    int-to-float v7, v7

    .line 965
    sub-float/2addr v5, v7

    .line 966
    invoke-virtual {v3, v5}, Landroid/widget/RelativeLayout;->setPivotY(F)V

    .line 967
    .line 968
    .line 969
    iget-object v5, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 970
    .line 971
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getPivotX()F

    .line 972
    .line 973
    .line 974
    move-result v5

    .line 975
    const/16 v17, 0x0

    .line 976
    .line 977
    aget v2, v2, v17

    .line 978
    .line 979
    int-to-float v2, v2

    .line 980
    sub-float/2addr v5, v2

    .line 981
    invoke-virtual {v3, v5}, Landroid/widget/RelativeLayout;->setPivotX(F)V

    .line 982
    .line 983
    .line 984
    :cond_23
    sget-object v2, Lcom/android/launcher3/G2;->n:Landroid/util/FloatProperty;

    .line 985
    .line 986
    iget v5, v0, Lcom/android/launcher3/N6;->c:F

    .line 987
    .line 988
    invoke-virtual {v4, v3, v2, v5, v1}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 989
    .line 990
    .line 991
    sget-object v2, Lcom/android/launcher3/G2;->o:Landroid/util/FloatProperty;

    .line 992
    .line 993
    iget v5, v0, Lcom/android/launcher3/N6;->c:F

    .line 994
    .line 995
    invoke-virtual {v4, v3, v2, v5, v1}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 996
    .line 997
    .line 998
    iget-object v2, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 999
    .line 1000
    invoke-virtual {v2}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 1001
    .line 1002
    .line 1003
    move-result-object v2

    .line 1004
    const/4 v3, 0x0

    .line 1005
    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 1006
    .line 1007
    .line 1008
    :cond_24
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 1009
    .line 1010
    .line 1011
    move-result-object v2

    .line 1012
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->N0()Z

    .line 1013
    .line 1014
    .line 1015
    move-result v2

    .line 1016
    if-nez v2, :cond_25

    .line 1017
    .line 1018
    iget-object v2, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 1019
    .line 1020
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 1021
    .line 1022
    .line 1023
    move-result-object v2

    .line 1024
    iget-object v2, v2, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 1025
    .line 1026
    iget-boolean v2, v2, Lcom/android/launcher3/r4;->k:Z

    .line 1027
    .line 1028
    if-eqz v2, :cond_26

    .line 1029
    .line 1030
    :cond_25
    sget-object v2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 1031
    .line 1032
    if-eq v6, v2, :cond_27

    .line 1033
    .line 1034
    if-eq v14, v2, :cond_27

    .line 1035
    .line 1036
    sget-object v3, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 1037
    .line 1038
    if-ne v6, v3, :cond_26

    .line 1039
    .line 1040
    goto :goto_e

    .line 1041
    :cond_26
    return-void

    .line 1042
    :cond_27
    :goto_e
    iget-object v3, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 1043
    .line 1044
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 1045
    .line 1046
    .line 1047
    move-result-object v3

    .line 1048
    if-ne v6, v2, :cond_28

    .line 1049
    .line 1050
    new-array v2, v9, [I

    .line 1051
    .line 1052
    iget-object v5, v0, Lcom/android/launcher3/N6;->a:Lcom/android/launcher3/C2;

    .line 1053
    .line 1054
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 1055
    .line 1056
    .line 1057
    move-result-object v5

    .line 1058
    invoke-virtual {v5, v3, v2}, Lcom/android/launcher3/views/BaseDragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 1059
    .line 1060
    .line 1061
    iget-object v5, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 1062
    .line 1063
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getPivotY()F

    .line 1064
    .line 1065
    .line 1066
    move-result v5

    .line 1067
    aget v6, v2, v16

    .line 1068
    .line 1069
    int-to-float v6, v6

    .line 1070
    sub-float/2addr v5, v6

    .line 1071
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setPivotY(F)V

    .line 1072
    .line 1073
    .line 1074
    iget-object v5, v0, Lcom/android/launcher3/N6;->b:Lcom/android/launcher3/Workspace;

    .line 1075
    .line 1076
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getPivotX()F

    .line 1077
    .line 1078
    .line 1079
    move-result v5

    .line 1080
    const/16 v17, 0x0

    .line 1081
    .line 1082
    aget v2, v2, v17

    .line 1083
    .line 1084
    int-to-float v2, v2

    .line 1085
    sub-float/2addr v5, v2

    .line 1086
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setPivotX(F)V

    .line 1087
    .line 1088
    .line 1089
    :cond_28
    sget-object v2, Lcom/android/launcher3/G2;->n:Landroid/util/FloatProperty;

    .line 1090
    .line 1091
    iget v5, v0, Lcom/android/launcher3/N6;->c:F

    .line 1092
    .line 1093
    invoke-virtual {v4, v3, v2, v5, v1}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 1094
    .line 1095
    .line 1096
    sget-object v2, Lcom/android/launcher3/G2;->o:Landroid/util/FloatProperty;

    .line 1097
    .line 1098
    iget v0, v0, Lcom/android/launcher3/N6;->c:F

    .line 1099
    .line 1100
    invoke-virtual {v4, v3, v2, v0, v1}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 1101
    .line 1102
    .line 1103
    const/4 v5, 0x0

    .line 1104
    invoke-virtual {v3, v5}, Lcom/android/launcher3/LongClickTextView;->setVisibility(I)V

    .line 1105
    .line 1106
    .line 1107
    return-void
.end method
