.class public final Lcom/android/quickstep/util/BorderAnimator;
.super Ljava/lang/Object;
.source "BorderAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;,
        Lcom/android/quickstep/util/BorderAnimator$Companion;,
        Lcom/android/quickstep/util/BorderAnimator$ScalingParams;,
        Lcom/android/quickstep/util/BorderAnimator$SimpleParams;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/util/BorderAnimator$Companion;

.field private static final DEFAULT_APPEARANCE_ANIMATION_DURATION_MS:J = 0x12cL

.field public static final DEFAULT_BORDER_COLOR:I = -0x1

.field private static final DEFAULT_DISAPPEARANCE_ANIMATION_DURATION_MS:J = 0x85L

.field private static final DEFAULT_INTERPOLATOR:Landroid/view/animation/Interpolator;


# instance fields
.field private final appearanceDurationMs:J

.field private final borderAnimationParams:Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;

.field private final borderAnimationProgress:Lcom/android/launcher3/anim/d;

.field private final borderPaint:Landroid/graphics/Paint;

.field private final borderRadiusPx:I

.field private final disappearanceDurationMs:J

.field private final interpolator:Landroid/view/animation/Interpolator;

.field private runningBorderAnimation:Landroid/animation/Animator;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/BorderAnimator$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/BorderAnimator$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/BorderAnimator;->Companion:Lcom/android/quickstep/util/BorderAnimator$Companion;

    .line 8
    .line 9
    sget-object v0, LJ0/h;->d:Landroid/view/animation/Interpolator;

    .line 10
    .line 11
    sput-object v0, Lcom/android/quickstep/util/BorderAnimator;->DEFAULT_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 12
    .line 13
    return-void
.end method

.method private constructor <init>(IILcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;JJLandroid/view/animation/Interpolator;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput p1, p0, Lcom/android/quickstep/util/BorderAnimator;->borderRadiusPx:I

    .line 4
    iput-object p3, p0, Lcom/android/quickstep/util/BorderAnimator;->borderAnimationParams:Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;

    .line 5
    iput-wide p4, p0, Lcom/android/quickstep/util/BorderAnimator;->appearanceDurationMs:J

    .line 6
    iput-wide p6, p0, Lcom/android/quickstep/util/BorderAnimator;->disappearanceDurationMs:J

    .line 7
    iput-object p8, p0, Lcom/android/quickstep/util/BorderAnimator;->interpolator:Landroid/view/animation/Interpolator;

    .line 8
    new-instance p1, Lcom/android/launcher3/anim/d;

    new-instance p3, Lcom/android/quickstep/util/H;

    invoke-direct {p3, p0}, Lcom/android/quickstep/util/H;-><init>(Lcom/android/quickstep/util/BorderAnimator;)V

    invoke-direct {p1, p3}, Lcom/android/launcher3/anim/d;-><init>(Ljava/util/function/Consumer;)V

    iput-object p1, p0, Lcom/android/quickstep/util/BorderAnimator;->borderAnimationProgress:Lcom/android/launcher3/anim/d;

    .line 9
    new-instance p1, Landroid/graphics/Paint;

    const/4 p3, 0x1

    invoke-direct {p1, p3}, Landroid/graphics/Paint;-><init>(I)V

    .line 10
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 11
    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 p2, 0x0

    .line 12
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 13
    iput-object p1, p0, Lcom/android/quickstep/util/BorderAnimator;->borderPaint:Landroid/graphics/Paint;

    return-void
.end method

.method public synthetic constructor <init>(IILcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;JJLandroid/view/animation/Interpolator;Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p8}, Lcom/android/quickstep/util/BorderAnimator;-><init>(IILcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;JJLandroid/view/animation/Interpolator;)V

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/BorderAnimator;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/BorderAnimator;->borderAnimationProgress$lambda$0(Lcom/android/quickstep/util/BorderAnimator;Ljava/lang/Float;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$getBorderAnimationParams$p(Lcom/android/quickstep/util/BorderAnimator;)Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/BorderAnimator;->borderAnimationParams:Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getDEFAULT_INTERPOLATOR$cp()Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/BorderAnimator;->DEFAULT_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getRunningBorderAnimation$p(Lcom/android/quickstep/util/BorderAnimator;)Landroid/animation/Animator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/BorderAnimator;->runningBorderAnimation:Landroid/animation/Animator;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$setRunningBorderAnimation$p(Lcom/android/quickstep/util/BorderAnimator;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/BorderAnimator;->runningBorderAnimation:Landroid/animation/Animator;

    .line 2
    .line 3
    return-void
.end method

.method private static final borderAnimationProgress$lambda$0(Lcom/android/quickstep/util/BorderAnimator;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/BorderAnimator;->updateOutline()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final createScalingBorderAnimator(IIILu4/l;Landroid/view/View;Landroid/view/View;)Lcom/android/quickstep/util/BorderAnimator;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III",
            "Lu4/l<",
            "-",
            "Landroid/graphics/Rect;",
            "Lh4/t;",
            ">;",
            "Landroid/view/View;",
            "Landroid/view/View;",
            ")",
            "Lcom/android/quickstep/util/BorderAnimator;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/quickstep/util/BorderAnimator;->Companion:Lcom/android/quickstep/util/BorderAnimator$Companion;

    move v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createScalingBorderAnimator(IIILu4/l;Landroid/view/View;Landroid/view/View;)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object p0

    return-object p0
.end method

.method public static final createScalingBorderAnimator(IIILu4/l;Landroid/view/View;Landroid/view/View;I)Lcom/android/quickstep/util/BorderAnimator;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III",
            "Lu4/l<",
            "-",
            "Landroid/graphics/Rect;",
            "Lh4/t;",
            ">;",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "I)",
            "Lcom/android/quickstep/util/BorderAnimator;"
        }
    .end annotation

    .line 2
    sget-object v0, Lcom/android/quickstep/util/BorderAnimator;->Companion:Lcom/android/quickstep/util/BorderAnimator$Companion;

    move v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move v7, p6

    invoke-virtual/range {v0 .. v7}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createScalingBorderAnimator(IIILu4/l;Landroid/view/View;Landroid/view/View;I)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object p0

    return-object p0
.end method

.method public static final createScalingBorderAnimator(IIILu4/l;Landroid/view/View;Landroid/view/View;IJ)Lcom/android/quickstep/util/BorderAnimator;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III",
            "Lu4/l<",
            "-",
            "Landroid/graphics/Rect;",
            "Lh4/t;",
            ">;",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "IJ)",
            "Lcom/android/quickstep/util/BorderAnimator;"
        }
    .end annotation

    .line 3
    sget-object v0, Lcom/android/quickstep/util/BorderAnimator;->Companion:Lcom/android/quickstep/util/BorderAnimator$Companion;

    move v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move/from16 v7, p6

    move-wide/from16 v8, p7

    invoke-virtual/range {v0 .. v9}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createScalingBorderAnimator(IIILu4/l;Landroid/view/View;Landroid/view/View;IJ)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object p0

    return-object p0
.end method

.method public static final createScalingBorderAnimator(IIILu4/l;Landroid/view/View;Landroid/view/View;IJJ)Lcom/android/quickstep/util/BorderAnimator;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III",
            "Lu4/l<",
            "-",
            "Landroid/graphics/Rect;",
            "Lh4/t;",
            ">;",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "IJJ)",
            "Lcom/android/quickstep/util/BorderAnimator;"
        }
    .end annotation

    .line 4
    sget-object v0, Lcom/android/quickstep/util/BorderAnimator;->Companion:Lcom/android/quickstep/util/BorderAnimator$Companion;

    move v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move/from16 v7, p6

    move-wide/from16 v8, p7

    move-wide/from16 v10, p9

    invoke-virtual/range {v0 .. v11}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createScalingBorderAnimator(IIILu4/l;Landroid/view/View;Landroid/view/View;IJJ)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object p0

    return-object p0
.end method

.method public static final createScalingBorderAnimator(IIILu4/l;Landroid/view/View;Landroid/view/View;IJJLandroid/view/animation/Interpolator;)Lcom/android/quickstep/util/BorderAnimator;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III",
            "Lu4/l<",
            "-",
            "Landroid/graphics/Rect;",
            "Lh4/t;",
            ">;",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "IJJ",
            "Landroid/view/animation/Interpolator;",
            ")",
            "Lcom/android/quickstep/util/BorderAnimator;"
        }
    .end annotation

    .line 5
    sget-object v0, Lcom/android/quickstep/util/BorderAnimator;->Companion:Lcom/android/quickstep/util/BorderAnimator$Companion;

    move v1, p0

    move v2, p1

    move v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move/from16 v7, p6

    move-wide/from16 v8, p7

    move-wide/from16 v10, p9

    move-object/from16 v12, p11

    invoke-virtual/range {v0 .. v12}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createScalingBorderAnimator(IIILu4/l;Landroid/view/View;Landroid/view/View;IJJLandroid/view/animation/Interpolator;)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object p0

    return-object p0
.end method

.method public static final createSimpleBorderAnimator(IILu4/l;Landroid/view/View;)Lcom/android/quickstep/util/BorderAnimator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lu4/l<",
            "-",
            "Landroid/graphics/Rect;",
            "Lh4/t;",
            ">;",
            "Landroid/view/View;",
            ")",
            "Lcom/android/quickstep/util/BorderAnimator;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/quickstep/util/BorderAnimator;->Companion:Lcom/android/quickstep/util/BorderAnimator$Companion;

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createSimpleBorderAnimator(IILu4/l;Landroid/view/View;)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object p0

    return-object p0
.end method

.method public static final createSimpleBorderAnimator(IILu4/l;Landroid/view/View;I)Lcom/android/quickstep/util/BorderAnimator;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lu4/l<",
            "-",
            "Landroid/graphics/Rect;",
            "Lh4/t;",
            ">;",
            "Landroid/view/View;",
            "I)",
            "Lcom/android/quickstep/util/BorderAnimator;"
        }
    .end annotation

    .line 2
    sget-object v0, Lcom/android/quickstep/util/BorderAnimator;->Companion:Lcom/android/quickstep/util/BorderAnimator$Companion;

    move v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createSimpleBorderAnimator(IILu4/l;Landroid/view/View;I)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object p0

    return-object p0
.end method

.method public static final createSimpleBorderAnimator(IILu4/l;Landroid/view/View;IJ)Lcom/android/quickstep/util/BorderAnimator;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lu4/l<",
            "-",
            "Landroid/graphics/Rect;",
            "Lh4/t;",
            ">;",
            "Landroid/view/View;",
            "IJ)",
            "Lcom/android/quickstep/util/BorderAnimator;"
        }
    .end annotation

    .line 3
    sget-object v0, Lcom/android/quickstep/util/BorderAnimator;->Companion:Lcom/android/quickstep/util/BorderAnimator$Companion;

    move v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move-wide v6, p5

    invoke-virtual/range {v0 .. v7}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createSimpleBorderAnimator(IILu4/l;Landroid/view/View;IJ)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object p0

    return-object p0
.end method

.method public static final createSimpleBorderAnimator(IILu4/l;Landroid/view/View;IJJ)Lcom/android/quickstep/util/BorderAnimator;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lu4/l<",
            "-",
            "Landroid/graphics/Rect;",
            "Lh4/t;",
            ">;",
            "Landroid/view/View;",
            "IJJ)",
            "Lcom/android/quickstep/util/BorderAnimator;"
        }
    .end annotation

    .line 4
    sget-object v0, Lcom/android/quickstep/util/BorderAnimator;->Companion:Lcom/android/quickstep/util/BorderAnimator$Companion;

    move v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move-wide v6, p5

    move-wide/from16 v8, p7

    invoke-virtual/range {v0 .. v9}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createSimpleBorderAnimator(IILu4/l;Landroid/view/View;IJJ)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object p0

    return-object p0
.end method

.method public static final createSimpleBorderAnimator(IILu4/l;Landroid/view/View;IJJLandroid/view/animation/Interpolator;)Lcom/android/quickstep/util/BorderAnimator;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lu4/l<",
            "-",
            "Landroid/graphics/Rect;",
            "Lh4/t;",
            ">;",
            "Landroid/view/View;",
            "IJJ",
            "Landroid/view/animation/Interpolator;",
            ")",
            "Lcom/android/quickstep/util/BorderAnimator;"
        }
    .end annotation

    .line 5
    sget-object v0, Lcom/android/quickstep/util/BorderAnimator;->Companion:Lcom/android/quickstep/util/BorderAnimator$Companion;

    move v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move-wide/from16 v6, p5

    move-wide/from16 v8, p7

    move-object/from16 v10, p9

    invoke-virtual/range {v0 .. v10}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createSimpleBorderAnimator(IILu4/l;Landroid/view/View;IJJLandroid/view/animation/Interpolator;)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object p0

    return-object p0
.end method

.method private final updateOutline()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/BorderAnimator;->interpolator:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/BorderAnimator;->borderAnimationProgress:Lcom/android/launcher3/anim/d;

    .line 4
    .line 5
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 6
    .line 7
    invoke-interface {v0, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/android/quickstep/util/BorderAnimator;->borderAnimationParams:Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->setAnimationProgress(F)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/quickstep/util/BorderAnimator;->borderPaint:Landroid/graphics/Paint;

    .line 17
    .line 18
    const/16 v2, 0xff

    .line 19
    .line 20
    int-to-float v2, v2

    .line 21
    mul-float/2addr v2, v0

    .line 22
    invoke-static {v2}, Lx4/a;->a(F)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/quickstep/util/BorderAnimator;->borderPaint:Landroid/graphics/Paint;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/quickstep/util/BorderAnimator;->borderAnimationParams:Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getBorderStroke()F

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/quickstep/util/BorderAnimator;->borderAnimationParams:Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getTargetView()Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 47
    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public final buildAnimator(Z)Landroid/animation/Animator;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/BorderAnimator;->borderAnimationProgress:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v1, 0x0

    .line 9
    :goto_0
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget-wide v1, p0, Lcom/android/quickstep/util/BorderAnimator;->appearanceDurationMs:J

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_1
    iget-wide v1, p0, Lcom/android/quickstep/util/BorderAnimator;->disappearanceDurationMs:J

    .line 19
    .line 20
    :goto_1
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    new-instance v1, Lcom/android/quickstep/util/BorderAnimator$buildAnimator$lambda$5$$inlined$doOnStart$1;

    .line 27
    .line 28
    invoke-direct {v1, p0, v0}, Lcom/android/quickstep/util/BorderAnimator$buildAnimator$lambda$5$$inlined$doOnStart$1;-><init>(Lcom/android/quickstep/util/BorderAnimator;Landroid/animation/ObjectAnimator;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 32
    .line 33
    .line 34
    new-instance v1, Lcom/android/quickstep/util/BorderAnimator$buildAnimator$lambda$5$$inlined$doOnEnd$1;

    .line 35
    .line 36
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/util/BorderAnimator$buildAnimator$lambda$5$$inlined$doOnEnd$1;-><init>(Lcom/android/quickstep/util/BorderAnimator;Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 40
    .line 41
    .line 42
    const-string p0, "apply(...)"

    .line 43
    .line 44
    invoke-static {v0, p0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-object v0
.end method

.method public final drawBorder(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    const-string v0, "canvas"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/util/BorderAnimator;->borderAnimationParams:Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;

    .line 7
    .line 8
    iget v1, p0, Lcom/android/quickstep/util/BorderAnimator;->borderRadiusPx:I

    .line 9
    .line 10
    int-to-float v1, v1

    .line 11
    invoke-virtual {v0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getRadiusAdjustment()F

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    add-float v8, v1, v2

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getBorderBounds()Landroid/graphics/Rect;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget v1, v1, Landroid/graphics/Rect;->left:I

    .line 22
    .line 23
    int-to-float v1, v1

    .line 24
    invoke-virtual {v0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getAlignmentAdjustment()F

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    add-float v4, v1, v2

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getBorderBounds()Landroid/graphics/Rect;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 35
    .line 36
    int-to-float v1, v1

    .line 37
    invoke-virtual {v0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getAlignmentAdjustment()F

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    add-float v5, v1, v2

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getBorderBounds()Landroid/graphics/Rect;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 48
    .line 49
    int-to-float v1, v1

    .line 50
    invoke-virtual {v0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getAlignmentAdjustment()F

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    sub-float v6, v1, v2

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getBorderBounds()Landroid/graphics/Rect;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 61
    .line 62
    int-to-float v1, v1

    .line 63
    invoke-virtual {v0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getAlignmentAdjustment()F

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    sub-float v7, v1, v0

    .line 68
    .line 69
    iget-object v10, p0, Lcom/android/quickstep/util/BorderAnimator;->borderPaint:Landroid/graphics/Paint;

    .line 70
    .line 71
    move v9, v8

    .line 72
    move-object v3, p1

    .line 73
    invoke-virtual/range {v3 .. v10}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final setBorderVisibility(ZZ)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/high16 v1, 0x3f800000    # 1.0f

    .line 3
    .line 4
    if-eqz p2, :cond_4

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    move v0, v1

    .line 9
    :cond_0
    iget-object p2, p0, Lcom/android/quickstep/util/BorderAnimator;->borderAnimationProgress:Lcom/android/launcher3/anim/d;

    .line 10
    .line 11
    invoke-virtual {p2, v0}, Lcom/android/launcher3/anim/d;->m(F)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_3

    .line 16
    .line 17
    iget-object p2, p0, Lcom/android/quickstep/util/BorderAnimator;->runningBorderAnimation:Landroid/animation/Animator;

    .line 18
    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    invoke-virtual {p2}, Landroid/animation/Animator;->cancel()V

    .line 22
    .line 23
    .line 24
    :cond_1
    if-eqz p1, :cond_2

    .line 25
    .line 26
    iget-object p2, p0, Lcom/android/quickstep/util/BorderAnimator;->borderAnimationParams:Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;

    .line 27
    .line 28
    invoke-virtual {p2}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->onShowBorder()V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p2, p0, Lcom/android/quickstep/util/BorderAnimator;->borderAnimationProgress:Lcom/android/launcher3/anim/d;

    .line 32
    .line 33
    invoke-virtual {p2, v0}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 34
    .line 35
    .line 36
    if-nez p1, :cond_8

    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/quickstep/util/BorderAnimator;->borderAnimationParams:Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->onHideBorder()V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/BorderAnimator;->buildAnimator(Z)Landroid/animation/Animator;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_4
    iget-object p2, p0, Lcom/android/quickstep/util/BorderAnimator;->runningBorderAnimation:Landroid/animation/Animator;

    .line 53
    .line 54
    if-eqz p2, :cond_5

    .line 55
    .line 56
    invoke-virtual {p2}, Landroid/animation/Animator;->end()V

    .line 57
    .line 58
    .line 59
    :cond_5
    if-eqz p1, :cond_6

    .line 60
    .line 61
    iget-object p2, p0, Lcom/android/quickstep/util/BorderAnimator;->borderAnimationParams:Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;

    .line 62
    .line 63
    invoke-virtual {p2}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->onShowBorder()V

    .line 64
    .line 65
    .line 66
    :cond_6
    iget-object p2, p0, Lcom/android/quickstep/util/BorderAnimator;->borderAnimationProgress:Lcom/android/launcher3/anim/d;

    .line 67
    .line 68
    if-eqz p1, :cond_7

    .line 69
    .line 70
    move v0, v1

    .line 71
    :cond_7
    invoke-virtual {p2, v0}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 72
    .line 73
    .line 74
    if-nez p1, :cond_8

    .line 75
    .line 76
    iget-object p0, p0, Lcom/android/quickstep/util/BorderAnimator;->borderAnimationParams:Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->onHideBorder()V

    .line 79
    .line 80
    .line 81
    :cond_8
    return-void
.end method
