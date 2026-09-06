.class public final Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;
.super Ljava/lang/Object;
.source "ScalingWorkspaceRevealAnim.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim$Companion;

.field private static final FADE_DURATION_MS:J = 0xc8L

.field private static final MAX_ALPHA:F = 1.0f

.field public static final MAX_SIZE:F = 1.0f

.field private static final MIN_ALPHA:F = 0.0f

.field public static final MIN_SIZE:F = 0.85f

.field private static final SCALE_DURATION_MS:J = 0x3e8L

.field public static final SCALE_INTERPOLATOR:Landroid/view/animation/PathInterpolator;


# instance fields
.field private final animation:Lcom/android/launcher3/anim/V;

.field private final launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;->Companion:Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim$Companion;

    .line 8
    .line 9
    new-instance v2, Landroid/graphics/Path;

    .line 10
    .line 11
    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {v2, v0, v0}, Landroid/graphics/Path;->moveTo(FF)V

    .line 16
    .line 17
    .line 18
    const v7, 0x3e19999a    # 0.15f

    .line 19
    .line 20
    .line 21
    const v8, 0x3eca57a8    # 0.3952f

    .line 22
    .line 23
    .line 24
    const v3, 0x3d3851ec    # 0.045f

    .line 25
    .line 26
    .line 27
    const v4, 0x3d11d14e    # 0.0356f

    .line 28
    .line 29
    .line 30
    const v5, 0x3dc7ae14    # 0.0975f

    .line 31
    .line 32
    .line 33
    const v6, 0x3e526e98    # 0.2055f

    .line 34
    .line 35
    .line 36
    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 37
    .line 38
    .line 39
    const/high16 v7, 0x3f800000    # 1.0f

    .line 40
    .line 41
    const/high16 v8, 0x3f800000    # 1.0f

    .line 42
    .line 43
    const v3, 0x3e70a3d7    # 0.235f

    .line 44
    .line 45
    .line 46
    const v4, 0x3f2f7cee    # 0.6855f

    .line 47
    .line 48
    .line 49
    const v5, 0x3e70a3d7    # 0.235f

    .line 50
    .line 51
    .line 52
    const/high16 v6, 0x3f800000    # 1.0f

    .line 53
    .line 54
    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 55
    .line 56
    .line 57
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 58
    .line 59
    invoke-direct {v0, v2}, Landroid/view/animation/PathInterpolator;-><init>(Landroid/graphics/Path;)V

    .line 60
    .line 61
    .line 62
    sput-object v0, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;->SCALE_INTERPOLATOR:Landroid/view/animation/PathInterpolator;

    .line 63
    .line 64
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/util/RectFSpringAnim;Landroid/graphics/RectF;Z)V
    .locals 10

    const-string v0, "launcher"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;->launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 3
    new-instance v1, Lcom/android/launcher3/anim/V;

    const-wide/16 v2, 0x3e8

    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/anim/V;-><init>(J)V

    iput-object v1, p0, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;->animation:Lcom/android/launcher3/anim/V;

    .line 4
    new-instance p0, LQ1/f;

    invoke-direct {p0}, LQ1/f;-><init>()V

    const/16 v0, 0xe

    .line 5
    iput v0, p0, LQ1/f;->i:I

    const-wide/16 v2, 0x0

    .line 6
    iput-wide v2, p0, LQ1/f;->g:J

    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    move-result-object v0

    .line 8
    sget-object v2, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    sget-object v7, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    invoke-virtual {v0, v2, v7, p0}, Lcom/android/launcher3/statemanager/d;->r(Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/statemanager/a;LQ1/f;)Landroid/animation/AnimatorSet;

    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    const/4 v3, 0x1

    .line 11
    invoke-virtual {v0, v3}, Lcom/android/launcher3/V4;->forceFinishScroller(Z)V

    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->getStateTransitionAnimation()Lcom/android/launcher3/N6;

    move-result-object v0

    .line 13
    sget-object v3, Lcom/android/launcher3/anim/Y;->a:Lcom/android/launcher3/anim/Y;

    .line 14
    invoke-virtual {v0, v3, v2, p0}, Lcom/android/launcher3/N6;->h(Lcom/android/launcher3/anim/Y;Lcom/android/launcher3/V3;LQ1/f;)V

    .line 15
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    move-result-object v2

    .line 16
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    move-result-object p0

    .line 17
    invoke-static {}, Lcom/android/launcher3/y0;->d()Z

    move-result v0

    const v3, 0x3f59999a    # 0.85f

    const/high16 v8, 0x3f800000    # 1.0f

    if-eqz v0, :cond_0

    .line 18
    sget-object v0, LJ0/a;->a:LJ0/a$a;

    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, LJ0/a$a;->a(Landroid/view/View;)V

    .line 19
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v0, p0}, LJ0/a$a;->a(Landroid/view/View;)V

    .line 20
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getScaleX()F

    move-result v0

    cmpg-float v0, v0, v8

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    move v4, v3

    goto :goto_1

    .line 21
    :cond_1
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getScaleX()F

    move-result v3

    goto :goto_0

    .line 22
    :goto_1
    invoke-virtual {v2, p0}, Lcom/android/launcher3/Workspace;->setPivotToScaleWithSelf(Landroid/view/View;)V

    .line 23
    sget-object v0, Lcom/android/launcher3/G2;->c:Lcom/android/launcher3/util/y1;

    const/4 v9, 0x2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/android/launcher3/util/y1;->n(Ljava/lang/Integer;)Landroid/util/FloatProperty;

    move-result-object v3

    .line 24
    sget-object v6, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;->SCALE_INTERPOLATOR:Landroid/view/animation/PathInterpolator;

    const/high16 v5, 0x3f800000    # 1.0f

    .line 25
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    move-object v0, v2

    .line 26
    sget-object v2, Lcom/android/launcher3/G2;->d:Lcom/android/launcher3/util/y1;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/y1;->n(Ljava/lang/Integer;)Landroid/util/FloatProperty;

    move-result-object v3

    move-object v2, p0

    .line 27
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    if-eqz p4, :cond_2

    const/4 p0, 0x0

    .line 28
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 29
    sget-object p4, LJ0/h;->q:Landroid/view/animation/Interpolator;

    const v3, 0x3e4ccccd    # 0.2f

    invoke-static {p4, p0, v3}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    move-result-object v4

    .line 30
    invoke-virtual {v1, v0, v8, v4}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 31
    invoke-virtual {v2, p0}, Lcom/android/launcher3/Hotseat;->setAlpha(F)V

    .line 32
    invoke-static {p4, p0, v3}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    move-result-object p0

    .line 33
    invoke-virtual {v1, v2, v8, p0}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 34
    :cond_2
    new-instance p0, LQ1/f;

    invoke-direct {p0}, LQ1/f;-><init>()V

    const/4 p4, 0x0

    if-eqz p1, :cond_3

    move-object v3, p1

    goto :goto_2

    :cond_3
    move-object v3, p4

    :goto_2
    if-eqz v3, :cond_4

    .line 35
    invoke-virtual {v3}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    move-result-object v3

    goto :goto_3

    :cond_4
    move-object v3, p4

    :goto_3
    const/16 v4, 0xd

    .line 36
    invoke-virtual {p0, v4, v6}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    if-eqz v3, :cond_5

    .line 37
    invoke-virtual {v3, v7, p0, v1}, LP1/h;->N(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V

    :cond_5
    const/16 v3, 0xb

    .line 38
    invoke-virtual {p0, v3, v6}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 39
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->getStateTransitionAnimation()Lcom/android/launcher3/N6;

    move-result-object p1

    invoke-virtual {p1, v1, v7, p0}, Lcom/android/launcher3/N6;->h(Lcom/android/launcher3/anim/Y;Lcom/android/launcher3/V3;LQ1/f;)V

    .line 40
    new-instance p0, Landroid/graphics/RectF;

    invoke-direct {p0, p3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 41
    new-instance p1, Lcom/android/quickstep/util/G0;

    invoke-direct {p1, p0, p3, p2, v0}, Lcom/android/quickstep/util/G0;-><init>(Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/android/quickstep/util/RectFSpringAnim;Lcom/android/launcher3/Workspace;)V

    invoke-virtual {v1, p1}, Lcom/android/launcher3/anim/f;->i(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 42
    invoke-virtual {v0, v9, p4}, Landroid/view/ViewGroup;->setLayerType(ILandroid/graphics/Paint;)V

    .line 43
    invoke-virtual {v2, v9, p4}, Landroid/view/ViewGroup;->setLayerType(ILandroid/graphics/Paint;)V

    .line 44
    new-instance p0, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim$2;

    invoke-direct {p0}, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim$2;-><init>()V

    .line 45
    invoke-virtual {v1, p0}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 46
    new-instance p0, Lcom/android/quickstep/util/H0;

    invoke-direct {p0, v0, v2}, Lcom/android/quickstep/util/H0;-><init>(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;)V

    invoke-static {p0}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    move-result-object p0

    .line 47
    invoke-virtual {v1, p0}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/util/RectFSpringAnim;Landroid/graphics/RectF;ZILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_0

    const/4 p4, 0x1

    .line 48
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/util/RectFSpringAnim;Landroid/graphics/RectF;Z)V

    return-void
.end method

.method private static final _init_$lambda$2(Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/android/quickstep/util/RectFSpringAnim;Lcom/android/launcher3/Workspace;Landroid/animation/ValueAnimator;)V
    .locals 4

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p4, Landroid/graphics/RectF;

    .line 7
    .line 8
    invoke-direct {p4, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 9
    .line 10
    .line 11
    new-instance p0, Landroid/graphics/Matrix;

    .line 12
    .line 13
    invoke-direct {p0}, Landroid/graphics/Matrix;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getScaleX()F

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getScaleY()F

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getPivotX()F

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getPivotY()F

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {p0, v0, v1, v2, v3}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 36
    .line 37
    .line 38
    new-instance p0, Landroid/graphics/Matrix;

    .line 39
    .line 40
    invoke-direct {p0}, Landroid/graphics/Matrix;-><init>()V

    .line 41
    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    int-to-float v0, v0

    .line 45
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getScaleX()F

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    div-float v1, v0, v1

    .line 50
    .line 51
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getScaleY()F

    .line 52
    .line 53
    .line 54
    move-result p3

    .line 55
    div-float/2addr v0, p3

    .line 56
    invoke-virtual {p4}, Landroid/graphics/RectF;->centerX()F

    .line 57
    .line 58
    .line 59
    move-result p3

    .line 60
    invoke-virtual {p4}, Landroid/graphics/RectF;->centerY()F

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    invoke-virtual {p0, v1, v0, p3, v2}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 68
    .line 69
    .line 70
    invoke-static {p4, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-nez p0, :cond_1

    .line 75
    .line 76
    if-eqz p1, :cond_0

    .line 77
    .line 78
    invoke-virtual {p1, p4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 79
    .line 80
    .line 81
    :cond_0
    if-eqz p2, :cond_1

    .line 82
    .line 83
    invoke-virtual {p2}, Lcom/android/quickstep/util/RectFSpringAnim;->onTargetPositionChanged()V

    .line 84
    .line 85
    .line 86
    :cond_1
    return-void
.end method

.method private static final _init_$lambda$3(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;)V
    .locals 2

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->setLayerType(ILandroid/graphics/Paint;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->setLayerType(ILandroid/graphics/Paint;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/android/launcher3/y0;->d()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    sget-object v0, LJ0/a;->a:LJ0/a$a;

    .line 21
    .line 22
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p0, v1}, LJ0/a$a;->b(Landroid/view/View;Landroid/animation/Animator;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p1, v1}, LJ0/a$a;->b(Landroid/view/View;Landroid/animation/Animator;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getAlpha()F

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    new-instance p1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v0, "alpha of workspace at the end of animation: "

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p1, "ScalingWorkspaceRevealAnim"

    .line 56
    .line 57
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static synthetic a(Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/android/quickstep/util/RectFSpringAnim;Lcom/android/launcher3/Workspace;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;->_init_$lambda$2(Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/android/quickstep/util/RectFSpringAnim;Lcom/android/launcher3/Workspace;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;->_init_$lambda$3(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final getAnimators()Landroid/animation/AnimatorSet;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;->animation:Lcom/android/launcher3/anim/V;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "buildAnim(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public final start()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;->getAnimators()Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/android/launcher3/y0;->d()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    sget-object v1, LJ0/a;->a:LJ0/a$a;

    .line 12
    .line 13
    iget-object v2, p0, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;->launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 14
    .line 15
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const-string v3, "getWorkspace(...)"

    .line 20
    .line 21
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v2, v0}, LJ0/a$a;->b(Landroid/view/View;Landroid/animation/Animator;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;->launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v2, "getHotseat(...)"

    .line 34
    .line 35
    invoke-static {p0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, p0, v0}, LJ0/a$a;->b(Landroid/view/View;Landroid/animation/Animator;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 42
    .line 43
    .line 44
    return-void
.end method
