.class public final Lcom/android/quickstep/util/BorderAnimator$Companion;
.super Ljava/lang/Object;
.source "BorderAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/BorderAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/BorderAnimator$Companion;-><init>()V

    return-void
.end method

.method public static synthetic createScalingBorderAnimator$default(Lcom/android/quickstep/util/BorderAnimator$Companion;IIILu4/l;Landroid/view/View;Landroid/view/View;IJJLandroid/view/animation/Interpolator;ILjava/lang/Object;)Lcom/android/quickstep/util/BorderAnimator;
    .locals 15

    .line 1
    move/from16 v0, p13

    .line 2
    .line 3
    and-int/lit8 v1, v0, 0x40

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    move v9, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move/from16 v9, p7

    .line 11
    .line 12
    :goto_0
    and-int/lit16 v1, v0, 0x80

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    const-wide/16 v1, 0x12c

    .line 17
    .line 18
    move-wide v10, v1

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    move-wide/from16 v10, p8

    .line 21
    .line 22
    :goto_1
    and-int/lit16 v1, v0, 0x100

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    const-wide/16 v1, 0x85

    .line 27
    .line 28
    move-wide v12, v1

    .line 29
    goto :goto_2

    .line 30
    :cond_2
    move-wide/from16 v12, p10

    .line 31
    .line 32
    :goto_2
    and-int/lit16 v0, v0, 0x200

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    invoke-static {}, Lcom/android/quickstep/util/BorderAnimator;->access$getDEFAULT_INTERPOLATOR$cp()Landroid/view/animation/Interpolator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    move-object v14, v0

    .line 41
    :goto_3
    move-object v2, p0

    .line 42
    move/from16 v3, p1

    .line 43
    .line 44
    move/from16 v4, p2

    .line 45
    .line 46
    move/from16 v5, p3

    .line 47
    .line 48
    move-object/from16 v6, p4

    .line 49
    .line 50
    move-object/from16 v7, p5

    .line 51
    .line 52
    move-object/from16 v8, p6

    .line 53
    .line 54
    goto :goto_4

    .line 55
    :cond_3
    move-object/from16 v14, p12

    .line 56
    .line 57
    goto :goto_3

    .line 58
    :goto_4
    invoke-virtual/range {v2 .. v14}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createScalingBorderAnimator(IIILu4/l;Landroid/view/View;Landroid/view/View;IJJLandroid/view/animation/Interpolator;)Lcom/android/quickstep/util/BorderAnimator;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public static synthetic createSimpleBorderAnimator$default(Lcom/android/quickstep/util/BorderAnimator$Companion;IILu4/l;Landroid/view/View;IJJLandroid/view/animation/Interpolator;ILjava/lang/Object;)Lcom/android/quickstep/util/BorderAnimator;
    .locals 13

    .line 1
    move/from16 v0, p11

    .line 2
    .line 3
    and-int/lit8 v1, v0, 0x10

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    move v7, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move/from16 v7, p5

    .line 11
    .line 12
    :goto_0
    and-int/lit8 v1, v0, 0x20

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    const-wide/16 v1, 0x12c

    .line 17
    .line 18
    move-wide v8, v1

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    move-wide/from16 v8, p6

    .line 21
    .line 22
    :goto_1
    and-int/lit8 v1, v0, 0x40

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    const-wide/16 v1, 0x85

    .line 27
    .line 28
    move-wide v10, v1

    .line 29
    goto :goto_2

    .line 30
    :cond_2
    move-wide/from16 v10, p8

    .line 31
    .line 32
    :goto_2
    and-int/lit16 v0, v0, 0x80

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    invoke-static {}, Lcom/android/quickstep/util/BorderAnimator;->access$getDEFAULT_INTERPOLATOR$cp()Landroid/view/animation/Interpolator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    move-object v12, v0

    .line 41
    :goto_3
    move-object v2, p0

    .line 42
    move v3, p1

    .line 43
    move v4, p2

    .line 44
    move-object/from16 v5, p3

    .line 45
    .line 46
    move-object/from16 v6, p4

    .line 47
    .line 48
    goto :goto_4

    .line 49
    :cond_3
    move-object/from16 v12, p10

    .line 50
    .line 51
    goto :goto_3

    .line 52
    :goto_4
    invoke-virtual/range {v2 .. v12}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createSimpleBorderAnimator(IILu4/l;Landroid/view/View;IJJLandroid/view/animation/Interpolator;)Lcom/android/quickstep/util/BorderAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method


# virtual methods
.method public final createScalingBorderAnimator(IIILu4/l;Landroid/view/View;Landroid/view/View;)Lcom/android/quickstep/util/BorderAnimator;
    .locals 16
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
    const-string v0, "boundsBuilder"

    move-object/from16 v5, p4

    invoke-static {v5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "targetView"

    move-object/from16 v6, p5

    invoke-static {v6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "contentView"

    move-object/from16 v7, p6

    invoke-static {v7, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v14, 0x3c0

    const/4 v15, 0x0

    const/4 v8, 0x0

    const-wide/16 v9, 0x0

    const-wide/16 v11, 0x0

    const/4 v13, 0x0

    move-object/from16 v1, p0

    move/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    invoke-static/range {v1 .. v15}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createScalingBorderAnimator$default(Lcom/android/quickstep/util/BorderAnimator$Companion;IIILu4/l;Landroid/view/View;Landroid/view/View;IJJLandroid/view/animation/Interpolator;ILjava/lang/Object;)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object v0

    return-object v0
.end method

.method public final createScalingBorderAnimator(IIILu4/l;Landroid/view/View;Landroid/view/View;I)Lcom/android/quickstep/util/BorderAnimator;
    .locals 16
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
    const-string v0, "boundsBuilder"

    move-object/from16 v5, p4

    invoke-static {v5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "targetView"

    move-object/from16 v6, p5

    invoke-static {v6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "contentView"

    move-object/from16 v7, p6

    invoke-static {v7, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v14, 0x380

    const/4 v15, 0x0

    const-wide/16 v9, 0x0

    const-wide/16 v11, 0x0

    const/4 v13, 0x0

    move-object/from16 v1, p0

    move/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    move/from16 v8, p7

    invoke-static/range {v1 .. v15}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createScalingBorderAnimator$default(Lcom/android/quickstep/util/BorderAnimator$Companion;IIILu4/l;Landroid/view/View;Landroid/view/View;IJJLandroid/view/animation/Interpolator;ILjava/lang/Object;)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object v0

    return-object v0
.end method

.method public final createScalingBorderAnimator(IIILu4/l;Landroid/view/View;Landroid/view/View;IJ)Lcom/android/quickstep/util/BorderAnimator;
    .locals 16
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
    const-string v0, "boundsBuilder"

    move-object/from16 v5, p4

    invoke-static {v5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "targetView"

    move-object/from16 v6, p5

    invoke-static {v6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "contentView"

    move-object/from16 v7, p6

    invoke-static {v7, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v14, 0x300

    const/4 v15, 0x0

    const-wide/16 v11, 0x0

    const/4 v13, 0x0

    move-object/from16 v1, p0

    move/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    move/from16 v8, p7

    move-wide/from16 v9, p8

    invoke-static/range {v1 .. v15}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createScalingBorderAnimator$default(Lcom/android/quickstep/util/BorderAnimator$Companion;IIILu4/l;Landroid/view/View;Landroid/view/View;IJJLandroid/view/animation/Interpolator;ILjava/lang/Object;)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object v0

    return-object v0
.end method

.method public final createScalingBorderAnimator(IIILu4/l;Landroid/view/View;Landroid/view/View;IJJ)Lcom/android/quickstep/util/BorderAnimator;
    .locals 16
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
    const-string v0, "boundsBuilder"

    move-object/from16 v5, p4

    invoke-static {v5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "targetView"

    move-object/from16 v6, p5

    invoke-static {v6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "contentView"

    move-object/from16 v7, p6

    invoke-static {v7, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v14, 0x200

    const/4 v15, 0x0

    const/4 v13, 0x0

    move-object/from16 v1, p0

    move/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    move/from16 v8, p7

    move-wide/from16 v9, p8

    move-wide/from16 v11, p10

    invoke-static/range {v1 .. v15}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createScalingBorderAnimator$default(Lcom/android/quickstep/util/BorderAnimator$Companion;IIILu4/l;Landroid/view/View;Landroid/view/View;IJJLandroid/view/animation/Interpolator;ILjava/lang/Object;)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object v0

    return-object v0
.end method

.method public final createScalingBorderAnimator(IIILu4/l;Landroid/view/View;Landroid/view/View;IJJLandroid/view/animation/Interpolator;)Lcom/android/quickstep/util/BorderAnimator;
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
            "IJJ",
            "Landroid/view/animation/Interpolator;",
            ")",
            "Lcom/android/quickstep/util/BorderAnimator;"
        }
    .end annotation

    const-string p0, "boundsBuilder"

    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "targetView"

    invoke-static {p5, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "contentView"

    move-object/from16 v5, p6

    invoke-static {v5, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "interpolator"

    move-object/from16 v8, p12

    invoke-static {v8, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    new-instance p0, Lcom/android/quickstep/util/BorderAnimator;

    .line 6
    new-instance v3, Lcom/android/quickstep/util/BorderAnimator$ScalingParams;

    move v1, p2

    move v2, p3

    move-object v4, p5

    move-object v0, v3

    move-object v3, p4

    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/util/BorderAnimator$ScalingParams;-><init>(IILu4/l;Landroid/view/View;Landroid/view/View;)V

    move-object v3, v0

    const/4 v9, 0x0

    move-object v0, p0

    move v1, p1

    move/from16 v2, p7

    move-wide/from16 v4, p8

    move-wide/from16 v6, p10

    .line 7
    invoke-direct/range {v0 .. v9}, Lcom/android/quickstep/util/BorderAnimator;-><init>(IILcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;JJLandroid/view/animation/Interpolator;Lkotlin/jvm/internal/j;)V

    return-object v0
.end method

.method public final createSimpleBorderAnimator(IILu4/l;Landroid/view/View;)Lcom/android/quickstep/util/BorderAnimator;
    .locals 14
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
    const-string v0, "boundsBuilder"

    move-object/from16 v4, p3

    invoke-static {v4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "targetView"

    move-object/from16 v5, p4

    invoke-static {v5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v12, 0xf0

    const/4 v13, 0x0

    const/4 v6, 0x0

    const-wide/16 v7, 0x0

    const-wide/16 v9, 0x0

    const/4 v11, 0x0

    move-object v1, p0

    move v2, p1

    move/from16 v3, p2

    invoke-static/range {v1 .. v13}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createSimpleBorderAnimator$default(Lcom/android/quickstep/util/BorderAnimator$Companion;IILu4/l;Landroid/view/View;IJJLandroid/view/animation/Interpolator;ILjava/lang/Object;)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object p0

    return-object p0
.end method

.method public final createSimpleBorderAnimator(IILu4/l;Landroid/view/View;I)Lcom/android/quickstep/util/BorderAnimator;
    .locals 14
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
    const-string v0, "boundsBuilder"

    move-object/from16 v4, p3

    invoke-static {v4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "targetView"

    move-object/from16 v5, p4

    invoke-static {v5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v12, 0xe0

    const/4 v13, 0x0

    const-wide/16 v7, 0x0

    const-wide/16 v9, 0x0

    const/4 v11, 0x0

    move-object v1, p0

    move v2, p1

    move/from16 v3, p2

    move/from16 v6, p5

    invoke-static/range {v1 .. v13}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createSimpleBorderAnimator$default(Lcom/android/quickstep/util/BorderAnimator$Companion;IILu4/l;Landroid/view/View;IJJLandroid/view/animation/Interpolator;ILjava/lang/Object;)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object p0

    return-object p0
.end method

.method public final createSimpleBorderAnimator(IILu4/l;Landroid/view/View;IJ)Lcom/android/quickstep/util/BorderAnimator;
    .locals 14
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
    const-string v0, "boundsBuilder"

    move-object/from16 v4, p3

    invoke-static {v4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "targetView"

    move-object/from16 v5, p4

    invoke-static {v5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v12, 0xc0

    const/4 v13, 0x0

    const-wide/16 v9, 0x0

    const/4 v11, 0x0

    move-object v1, p0

    move v2, p1

    move/from16 v3, p2

    move/from16 v6, p5

    move-wide/from16 v7, p6

    invoke-static/range {v1 .. v13}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createSimpleBorderAnimator$default(Lcom/android/quickstep/util/BorderAnimator$Companion;IILu4/l;Landroid/view/View;IJJLandroid/view/animation/Interpolator;ILjava/lang/Object;)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object p0

    return-object p0
.end method

.method public final createSimpleBorderAnimator(IILu4/l;Landroid/view/View;IJJ)Lcom/android/quickstep/util/BorderAnimator;
    .locals 14
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
    const-string v0, "boundsBuilder"

    move-object/from16 v4, p3

    invoke-static {v4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "targetView"

    move-object/from16 v5, p4

    invoke-static {v5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v12, 0x80

    const/4 v13, 0x0

    const/4 v11, 0x0

    move-object v1, p0

    move v2, p1

    move/from16 v3, p2

    move/from16 v6, p5

    move-wide/from16 v7, p6

    move-wide/from16 v9, p8

    invoke-static/range {v1 .. v13}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createSimpleBorderAnimator$default(Lcom/android/quickstep/util/BorderAnimator$Companion;IILu4/l;Landroid/view/View;IJJLandroid/view/animation/Interpolator;ILjava/lang/Object;)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object p0

    return-object p0
.end method

.method public final createSimpleBorderAnimator(IILu4/l;Landroid/view/View;IJJLandroid/view/animation/Interpolator;)Lcom/android/quickstep/util/BorderAnimator;
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
            "IJJ",
            "Landroid/view/animation/Interpolator;",
            ")",
            "Lcom/android/quickstep/util/BorderAnimator;"
        }
    .end annotation

    const-string p0, "boundsBuilder"

    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "targetView"

    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "interpolator"

    invoke-static {p10, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    move p0, p2

    move p2, p1

    .line 5
    new-instance p1, Lcom/android/quickstep/util/BorderAnimator;

    move-object v0, p4

    .line 6
    new-instance p4, Lcom/android/quickstep/util/BorderAnimator$SimpleParams;

    invoke-direct {p4, p0, p3, v0}, Lcom/android/quickstep/util/BorderAnimator$SimpleParams;-><init>(ILu4/l;Landroid/view/View;)V

    move p3, p5

    move-wide p5, p6

    move-wide p7, p8

    move-object p9, p10

    const/4 p10, 0x0

    .line 7
    invoke-direct/range {p1 .. p10}, Lcom/android/quickstep/util/BorderAnimator;-><init>(IILcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;JJLandroid/view/animation/Interpolator;Lkotlin/jvm/internal/j;)V

    return-object p1
.end method
