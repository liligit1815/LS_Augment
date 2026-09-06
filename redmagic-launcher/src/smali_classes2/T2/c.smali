.class public LT2/c;
.super Ljava/lang/Object;
.source "SplashScreenExitAnimationUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LT2/c$b;,
        LT2/c$c;
    }
.end annotation


# static fields
.field private static final a:Landroid/view/animation/Interpolator;

.field private static final b:Landroid/view/animation/Interpolator;

.field private static final c:Landroid/view/animation/Interpolator;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 2
    .line 3
    const v1, 0x3e19999a    # 0.15f

    .line 4
    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    const/high16 v3, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, v3, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 10
    .line 11
    .line 12
    sput-object v0, LT2/c;->a:Landroid/view/animation/Interpolator;

    .line 13
    .line 14
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 15
    .line 16
    const v1, 0x3ecccccd    # 0.4f

    .line 17
    .line 18
    .line 19
    invoke-direct {v0, v2, v2, v1, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 20
    .line 21
    .line 22
    sput-object v0, LT2/c;->b:Landroid/view/animation/Interpolator;

    .line 23
    .line 24
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 25
    .line 26
    invoke-direct {v0, v2, v2, v2, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 27
    .line 28
    .line 29
    sput-object v0, LT2/c;->c:Landroid/view/animation/Interpolator;

    .line 30
    .line 31
    return-void
.end method

.method public static synthetic a(IILandroid/view/ViewGroup;FFIILandroid/animation/ValueAnimator;)V
    .locals 7

    .line 1
    invoke-virtual {p7}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p7

    .line 5
    check-cast p7, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p7}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    sget-object p7, LT2/c;->a:Landroid/view/animation/Interpolator;

    .line 12
    .line 13
    const-wide/16 v1, 0x0

    .line 14
    .line 15
    int-to-long v3, p0

    .line 16
    move v5, p1

    .line 17
    invoke-static/range {v0 .. v5}, LT2/c;->g(FJJI)F

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-interface {p7, p0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    instance-of p1, p2, Landroid/window/SplashScreenView;

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    move-object p1, p2

    .line 30
    check-cast p1, Landroid/window/SplashScreenView;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/window/SplashScreenView;->getIconView()Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p7

    .line 36
    invoke-virtual {p1}, Landroid/window/SplashScreenView;->getBrandingView()Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const/4 p7, 0x0

    .line 42
    move-object p1, p7

    .line 43
    :goto_0
    const/high16 v6, 0x3f800000    # 1.0f

    .line 44
    .line 45
    if-eqz p7, :cond_1

    .line 46
    .line 47
    sub-float v1, v6, p0

    .line 48
    .line 49
    mul-float/2addr p3, v1

    .line 50
    invoke-virtual {p7, p3}, Landroid/view/View;->setAlpha(F)V

    .line 51
    .line 52
    .line 53
    :cond_1
    if-eqz p1, :cond_2

    .line 54
    .line 55
    sub-float p0, v6, p0

    .line 56
    .line 57
    mul-float/2addr p4, p0

    .line 58
    invoke-virtual {p1, p4}, Landroid/view/View;->setAlpha(F)V

    .line 59
    .line 60
    .line 61
    :cond_2
    sget-object p0, LM2/a;->c:Landroid/view/animation/Interpolator;

    .line 62
    .line 63
    int-to-long v1, p5

    .line 64
    int-to-long v3, p6

    .line 65
    invoke-static/range {v0 .. v5}, LT2/c;->g(FJJI)F

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    invoke-interface {p0, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    sub-float/2addr v6, p0

    .line 74
    invoke-virtual {p2, v6}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public static synthetic b(IILandroid/view/ViewGroup;FFIILT2/c$b;LT2/c$c;Landroid/animation/ValueAnimator;)V
    .locals 6

    .line 1
    invoke-virtual {p9}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p9

    .line 5
    check-cast p9, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p9}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    sget-object p9, LT2/c;->a:Landroid/view/animation/Interpolator;

    .line 12
    .line 13
    const-wide/16 v1, 0x0

    .line 14
    .line 15
    int-to-long v3, p0

    .line 16
    move v5, p1

    .line 17
    invoke-static/range {v0 .. v5}, LT2/c;->g(FJJI)F

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-interface {p9, p0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    instance-of p1, p2, Landroid/window/SplashScreenView;

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    check-cast p2, Landroid/window/SplashScreenView;

    .line 30
    .line 31
    invoke-virtual {p2}, Landroid/window/SplashScreenView;->getIconView()Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p2}, Landroid/window/SplashScreenView;->getBrandingView()Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 p1, 0x0

    .line 41
    move-object p2, p1

    .line 42
    :goto_0
    const/high16 p9, 0x3f800000    # 1.0f

    .line 43
    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    sub-float v1, p9, p0

    .line 47
    .line 48
    mul-float/2addr p3, v1

    .line 49
    invoke-virtual {p1, p3}, Landroid/view/View;->setAlpha(F)V

    .line 50
    .line 51
    .line 52
    :cond_1
    if-eqz p2, :cond_2

    .line 53
    .line 54
    sub-float/2addr p9, p0

    .line 55
    mul-float/2addr p4, p9

    .line 56
    invoke-virtual {p2, p4}, Landroid/view/View;->setAlpha(F)V

    .line 57
    .line 58
    .line 59
    :cond_2
    int-to-long p1, p5

    .line 60
    int-to-long p3, p6

    .line 61
    move p0, v0

    .line 62
    move p5, v5

    .line 63
    invoke-static/range {p0 .. p5}, LT2/c;->g(FJJI)F

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    invoke-virtual {p7, p0}, LT2/c$b;->a(F)V

    .line 68
    .line 69
    .line 70
    if-eqz p8, :cond_3

    .line 71
    .line 72
    invoke-virtual {p8, p0}, LT2/c$c;->b(F)V

    .line 73
    .line 74
    .line 75
    :cond_3
    return-void
.end method

.method static bridge synthetic c()Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    sget-object v0, LT2/c;->b:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic d()Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    sget-object v0, LT2/c;->c:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object v0
.end method

.method private static e(Landroid/view/ViewGroup;IIFFIILandroid/animation/Animator$AnimatorListener;)Landroid/animation/ValueAnimator;
    .locals 10

    .line 1
    move-object/from16 v0, p7

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    new-array v1, v1, [F

    .line 5
    .line 6
    fill-array-data v1, :array_0

    .line 7
    .line 8
    .line 9
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    int-to-long v2, p1

    .line 14
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    .line 17
    sget-object v2, LM2/a;->a:Landroid/view/animation/Interpolator;

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 20
    .line 21
    .line 22
    new-instance v2, LT2/a;

    .line 23
    .line 24
    move-object v5, p0

    .line 25
    move v4, p1

    .line 26
    move v3, p2

    .line 27
    move v6, p3

    .line 28
    move v7, p4

    .line 29
    move v8, p5

    .line 30
    move/from16 v9, p6

    .line 31
    .line 32
    invoke-direct/range {v2 .. v9}, LT2/a;-><init>(IILandroid/view/ViewGroup;FFII)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 36
    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-object v1

    .line 44
    nop

    .line 45
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private static f(Landroid/view/ViewGroup;Landroid/view/SurfaceControl;ILcom/android/wm/shell/shared/m;Landroid/graphics/Rect;IIFFIILandroid/animation/Animator$AnimatorListener;F)Landroid/animation/ValueAnimator;
    .locals 13

    move-object/from16 v10, p11

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v0

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v1

    const/4 v11, 0x2

    div-int/2addr v1, v11

    mul-int/2addr v0, v0

    mul-int v2, v1, v1

    add-int/2addr v0, v2

    int-to-double v4, v0

    .line 3
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-int v0, v4

    int-to-float v0, v0

    const/high16 v2, 0x3fa00000    # 1.25f

    mul-float/2addr v0, v2

    float-to-double v4, v0

    const-wide/high16 v6, 0x3fe0000000000000L    # 0.5

    add-double/2addr v4, v6

    double-to-int v0, v4

    const/4 v2, -0x1

    const/4 v4, 0x0

    .line 4
    filled-new-array {v2, v2, v4}, [I

    move-result-object v5

    const/4 v6, 0x3

    .line 5
    new-array v6, v6, [F

    fill-array-data v6, :array_0

    .line 6
    new-instance v12, LT2/c$b;

    invoke-direct {v12, p0}, LT2/c$b;-><init>(Landroid/view/ViewGroup;)V

    .line 7
    invoke-virtual {v12, v1, v4}, LT2/c$b;->b(II)V

    .line 8
    invoke-virtual {v12, v4, v0}, LT2/c$b;->d(II)V

    .line 9
    invoke-virtual {v12, v5, v6}, LT2/c$b;->c([I[F)V

    if-eqz p1, :cond_2

    .line 10
    invoke-virtual {p1}, Landroid/view/SurfaceControl;->isValid()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 11
    new-instance v0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 12
    instance-of v1, p0, Landroid/window/SplashScreenView;

    if-eqz v1, :cond_0

    .line 13
    move-object v1, p0

    check-cast v1, Landroid/window/SplashScreenView;

    .line 14
    invoke-virtual {v1}, Landroid/window/SplashScreenView;->getInitBackgroundColor()I

    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_1

    .line 16
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, LT2/c;->h(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/high16 v1, -0x1000000

    goto :goto_0

    :cond_1
    move v1, v2

    .line 17
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 18
    :goto_1
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v2, p2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 19
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    move-object v3, v0

    .line 20
    new-instance v0, LT2/c$c;

    neg-int v1, p2

    int-to-float v2, v1

    const/4 v1, 0x0

    move-object v5, p0

    move-object v4, p1

    move v8, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move/from16 v9, p12

    invoke-direct/range {v0 .. v9}, LT2/c$c;-><init>(FFLandroid/view/View;Landroid/view/SurfaceControl;Landroid/view/ViewGroup;Lcom/android/wm/shell/shared/m;Landroid/graphics/Rect;IF)V

    move-object v9, v0

    move-object v0, v3

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    move-object v9, v0

    .line 21
    :goto_2
    new-array v1, v11, [F

    fill-array-data v1, :array_1

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v11

    move/from16 v2, p5

    int-to-long v3, v2

    .line 22
    invoke-virtual {v11, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 23
    sget-object v1, LM2/a;->a:Landroid/view/animation/Interpolator;

    invoke-virtual {v11, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    if-eqz v10, :cond_3

    .line 24
    invoke-virtual {v11, v10}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 25
    :cond_3
    new-instance v1, LT2/c$a;

    invoke-direct {v1, v9, p0, v12, v0}, LT2/c$a;-><init>(LT2/c$c;Landroid/view/ViewGroup;LT2/c$b;Landroid/view/View;)V

    invoke-virtual {v11, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 26
    new-instance v0, LT2/b;

    move-object v3, p0

    move/from16 v1, p6

    move/from16 v4, p7

    move/from16 v5, p8

    move/from16 v6, p9

    move/from16 v7, p10

    move-object v8, v12

    invoke-direct/range {v0 .. v9}, LT2/b;-><init>(IILandroid/view/ViewGroup;FFIILT2/c$b;LT2/c$c;)V

    invoke-virtual {v11, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    return-object v11

    nop

    :array_0
    .array-data 4
        0x0
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private static g(FJJI)F
    .locals 0

    .line 1
    int-to-float p5, p5

    .line 2
    mul-float/2addr p0, p5

    .line 3
    long-to-float p1, p1

    .line 4
    sub-float/2addr p0, p1

    .line 5
    long-to-float p1, p3

    .line 6
    div-float/2addr p0, p1

    .line 7
    const/4 p1, 0x0

    .line 8
    const/high16 p2, 0x3f800000    # 1.0f

    .line 9
    .line 10
    invoke-static {p0, p1, p2}, Landroid/util/MathUtils;->constrain(FFF)F

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method private static h(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Landroid/content/res/Configuration;->uiMode:I

    .line 10
    .line 11
    and-int/lit8 p0, p0, 0x30

    .line 12
    .line 13
    const/16 v0, 0x20

    .line 14
    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public static i(ILandroid/view/ViewGroup;Landroid/view/SurfaceControl;ILcom/android/wm/shell/shared/m;Landroid/graphics/Rect;IIFFIILandroid/animation/Animator$AnimatorListener;F)V
    .locals 9

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    move-object v1, p1

    move v2, p6

    move/from16 v3, p7

    move/from16 v4, p8

    move/from16 v5, p9

    move/from16 v6, p10

    move/from16 v7, p11

    move-object/from16 v8, p12

    .line 1
    invoke-static/range {v1 .. v8}, LT2/c;->e(Landroid/view/ViewGroup;IIFFIILandroid/animation/Animator$AnimatorListener;)Landroid/animation/ValueAnimator;

    move-result-object p0

    goto :goto_0

    .line 2
    :cond_0
    invoke-static/range {p1 .. p13}, LT2/c;->f(Landroid/view/ViewGroup;Landroid/view/SurfaceControl;ILcom/android/wm/shell/shared/m;Landroid/graphics/Rect;IIFFIILandroid/animation/Animator$AnimatorListener;F)Landroid/animation/ValueAnimator;

    move-result-object p0

    .line 3
    :goto_0
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public static j(Landroid/view/ViewGroup;Landroid/view/SurfaceControl;ILcom/android/wm/shell/shared/m;Landroid/graphics/Rect;IIFFIILandroid/animation/Animator$AnimatorListener;)V
    .locals 14

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v13, 0x0

    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move/from16 v3, p2

    .line 6
    .line 7
    move-object/from16 v4, p3

    .line 8
    .line 9
    move-object/from16 v5, p4

    .line 10
    .line 11
    move/from16 v6, p5

    .line 12
    .line 13
    move/from16 v7, p6

    .line 14
    .line 15
    move/from16 v8, p7

    .line 16
    .line 17
    move/from16 v9, p8

    .line 18
    .line 19
    move/from16 v10, p9

    .line 20
    .line 21
    move/from16 v11, p10

    .line 22
    .line 23
    move-object/from16 v12, p11

    .line 24
    .line 25
    invoke-static/range {v0 .. v13}, LT2/c;->i(ILandroid/view/ViewGroup;Landroid/view/SurfaceControl;ILcom/android/wm/shell/shared/m;Landroid/graphics/Rect;IIFFIILandroid/animation/Animator$AnimatorListener;F)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
