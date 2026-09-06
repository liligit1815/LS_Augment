.class public Lcom/android/launcher3/widget/custom/bubble/PointerClock;
.super Lcom/android/launcher3/widget/custom/bubble/z;
.source "PointerClock.java"


# static fields
.field private static final q:Landroid/view/animation/Interpolator;


# instance fields
.field private final h:Landroid/graphics/drawable/LayerDrawable;

.field private final i:Landroid/graphics/drawable/RotateDrawable;

.field private final j:Landroid/graphics/drawable/RotateDrawable;

.field private final k:I

.field private final l:I

.field private m:Landroid/animation/AnimatorSet;

.field private n:I

.field private o:I

.field private p:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    const/high16 v2, 0x3f000000    # 0.5f

    .line 6
    .line 7
    const/high16 v3, 0x3e800000    # 0.25f

    .line 8
    .line 9
    invoke-direct {v0, v3, v1, v2, v1}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->q:Landroid/view/animation/Interpolator;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/widget/custom/bubble/PointerClock;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/custom/bubble/z;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 p1, 0xa

    .line 3
    iput p1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->k:I

    .line 4
    iput p1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->l:I

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string p2, "ai_widget_clock_drawable"

    invoke-static {p1, p2}, Lf1/d;->d(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/LayerDrawable;

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->h:Landroid/graphics/drawable/LayerDrawable;

    const p2, 0x7f0b0092

    .line 6
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    check-cast p2, Landroid/graphics/drawable/RotateDrawable;

    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->i:Landroid/graphics/drawable/RotateDrawable;

    const p2, 0x7f0b0093

    .line 7
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/RotateDrawable;

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->j:Landroid/graphics/drawable/RotateDrawable;

    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->a()V

    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/widget/custom/bubble/PointerClock;IFFLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->i(IFFLandroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/widget/custom/bubble/PointerClock;IFFLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->h(IFFLandroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic h(IFFLandroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p4}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    int-to-float p1, p1

    .line 6
    mul-float/2addr p1, p4

    .line 7
    const/high16 v0, 0x40000000    # 2.0f

    .line 8
    .line 9
    div-float/2addr p1, v0

    .line 10
    sub-float v0, p2, p1

    .line 11
    .line 12
    float-to-int v0, v0

    .line 13
    sub-float v1, p3, p1

    .line 14
    .line 15
    float-to-int v1, v1

    .line 16
    add-float/2addr p2, p1

    .line 17
    float-to-int p2, p2

    .line 18
    add-float/2addr p3, p1

    .line 19
    float-to-int p1, p3

    .line 20
    iget-object p3, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->i:Landroid/graphics/drawable/RotateDrawable;

    .line 21
    .line 22
    invoke-virtual {p3, v0, v1, p2, p1}, Landroid/graphics/drawable/RotateDrawable;->setBounds(IIII)V

    .line 23
    .line 24
    .line 25
    const/high16 p1, 0x437f0000    # 255.0f

    .line 26
    .line 27
    mul-float/2addr p1, p4

    .line 28
    float-to-int p1, p1

    .line 29
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->i:Landroid/graphics/drawable/RotateDrawable;

    .line 30
    .line 31
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/RotateDrawable;->setAlpha(I)V

    .line 32
    .line 33
    .line 34
    iget p1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->n:I

    .line 35
    .line 36
    int-to-float p1, p1

    .line 37
    const/high16 p2, 0x44340000    # 720.0f

    .line 38
    .line 39
    mul-float/2addr p4, p2

    .line 40
    add-float/2addr p1, p4

    .line 41
    float-to-int p1, p1

    .line 42
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->i:Landroid/graphics/drawable/RotateDrawable;

    .line 43
    .line 44
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/RotateDrawable;->setLevel(I)Z

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private synthetic i(IFFLandroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p4}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    int-to-float p1, p1

    .line 6
    mul-float/2addr p1, p4

    .line 7
    const/high16 v0, 0x40000000    # 2.0f

    .line 8
    .line 9
    div-float/2addr p1, v0

    .line 10
    sub-float v0, p2, p1

    .line 11
    .line 12
    float-to-int v0, v0

    .line 13
    sub-float v1, p3, p1

    .line 14
    .line 15
    float-to-int v1, v1

    .line 16
    add-float/2addr p2, p1

    .line 17
    float-to-int p2, p2

    .line 18
    add-float/2addr p3, p1

    .line 19
    float-to-int p1, p3

    .line 20
    iget-object p3, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->j:Landroid/graphics/drawable/RotateDrawable;

    .line 21
    .line 22
    invoke-virtual {p3, v0, v1, p2, p1}, Landroid/graphics/drawable/RotateDrawable;->setBounds(IIII)V

    .line 23
    .line 24
    .line 25
    const/high16 p1, 0x437f0000    # 255.0f

    .line 26
    .line 27
    mul-float/2addr p1, p4

    .line 28
    float-to-int p1, p1

    .line 29
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->j:Landroid/graphics/drawable/RotateDrawable;

    .line 30
    .line 31
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/RotateDrawable;->setAlpha(I)V

    .line 32
    .line 33
    .line 34
    iget p1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->o:I

    .line 35
    .line 36
    int-to-float p1, p1

    .line 37
    const/high16 p2, 0x45610000    # 3600.0f

    .line 38
    .line 39
    mul-float/2addr p4, p2

    .line 40
    add-float/2addr p1, p4

    .line 41
    float-to-int p1, p1

    .line 42
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->j:Landroid/graphics/drawable/RotateDrawable;

    .line 43
    .line 44
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/RotateDrawable;->setLevel(I)Z

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 48
    .line 49
    .line 50
    return-void
.end method


# virtual methods
.method public a()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->m:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 21
    .line 22
    .line 23
    const/16 v1, 0xa

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    add-int/lit8 v1, v1, 0x2

    .line 30
    .line 31
    const/16 v2, 0xc

    .line 32
    .line 33
    rem-int/2addr v1, v2

    .line 34
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    add-int/lit8 v3, v3, 0x32

    .line 39
    .line 40
    rem-int/lit8 v3, v3, 0x3c

    .line 41
    .line 42
    iget-object v4, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->i:Landroid/graphics/drawable/RotateDrawable;

    .line 43
    .line 44
    mul-int/lit8 v1, v1, 0x3c

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    add-int/2addr v1, v0

    .line 51
    invoke-virtual {v4, v1}, Landroid/graphics/drawable/RotateDrawable;->setLevel(I)Z

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->j:Landroid/graphics/drawable/RotateDrawable;

    .line 55
    .line 56
    mul-int/lit8 v3, v3, 0x3c

    .line 57
    .line 58
    invoke-virtual {v0, v3}, Landroid/graphics/drawable/RotateDrawable;->setLevel(I)Z

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->Y()Lcom/android/launcher3/H5$g;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/H5$g;->c()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    const-string v0, "PointerClock"

    .line 28
    .line 29
    const-string v1, "onWallpaperFingerprintChanged: set drawable"

    .line 30
    .line 31
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->i:Landroid/graphics/drawable/RotateDrawable;

    .line 35
    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "ai_custom_widget_clock_hour"

    .line 43
    .line 44
    invoke-static {v0, v1}, Lf1/d;->d(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->i:Landroid/graphics/drawable/RotateDrawable;

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/RotateDrawable;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->j:Landroid/graphics/drawable/RotateDrawable;

    .line 58
    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v1, "ai_custom_widget_clock_minute"

    .line 66
    .line 67
    invoke-static {v0, v1}, Lf1/d;->d(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->j:Landroid/graphics/drawable/RotateDrawable;

    .line 76
    .line 77
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/RotateDrawable;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->Y()Lcom/android/launcher3/H5$g;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Lcom/android/launcher3/H5$g;->a()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->g(I)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public c()V
    .locals 7

    .line 1
    const/4 v0, 0x2

    .line 2
    const-string v1, "PointerClock"

    .line 3
    .line 4
    const-string v2, "doUnlockAnim"

    .line 5
    .line 6
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->i:Landroid/graphics/drawable/RotateDrawable;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/graphics/drawable/RotateDrawable;->getLevel()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iput v1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->n:I

    .line 18
    .line 19
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->j:Landroid/graphics/drawable/RotateDrawable;

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/graphics/drawable/RotateDrawable;->getLevel()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iput v1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->o:I

    .line 28
    .line 29
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->m:Landroid/animation/AnimatorSet;

    .line 30
    .line 31
    if-nez v1, :cond_4

    .line 32
    .line 33
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 34
    .line 35
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->m:Landroid/animation/AnimatorSet;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    int-to-float v2, v2

    .line 57
    const/high16 v3, 0x3f000000    # 0.5f

    .line 58
    .line 59
    mul-float/2addr v2, v3

    .line 60
    int-to-float v3, v1

    .line 61
    const/high16 v4, 0x40000000    # 2.0f

    .line 62
    .line 63
    div-float/2addr v3, v4

    .line 64
    iget-object v4, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->i:Landroid/graphics/drawable/RotateDrawable;

    .line 65
    .line 66
    if-eqz v4, :cond_2

    .line 67
    .line 68
    new-array v4, v0, [F

    .line 69
    .line 70
    fill-array-data v4, :array_0

    .line 71
    .line 72
    .line 73
    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    const-wide/16 v5, 0x3e8

    .line 78
    .line 79
    invoke-virtual {v4, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 80
    .line 81
    .line 82
    sget-object v5, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->q:Landroid/view/animation/Interpolator;

    .line 83
    .line 84
    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 85
    .line 86
    .line 87
    new-instance v5, Lcom/android/launcher3/widget/custom/bubble/A;

    .line 88
    .line 89
    invoke-direct {v5, p0, v1, v2, v3}, Lcom/android/launcher3/widget/custom/bubble/A;-><init>(Lcom/android/launcher3/widget/custom/bubble/PointerClock;IFF)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 93
    .line 94
    .line 95
    iget-object v5, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->m:Landroid/animation/AnimatorSet;

    .line 96
    .line 97
    invoke-virtual {v5, v4}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 98
    .line 99
    .line 100
    :cond_2
    iget-object v4, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->j:Landroid/graphics/drawable/RotateDrawable;

    .line 101
    .line 102
    if-eqz v4, :cond_3

    .line 103
    .line 104
    new-array v0, v0, [F

    .line 105
    .line 106
    fill-array-data v0, :array_1

    .line 107
    .line 108
    .line 109
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    const-wide/16 v4, 0x4e2

    .line 114
    .line 115
    invoke-virtual {v0, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 116
    .line 117
    .line 118
    sget-object v4, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->q:Landroid/view/animation/Interpolator;

    .line 119
    .line 120
    invoke-virtual {v0, v4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 121
    .line 122
    .line 123
    new-instance v4, Lcom/android/launcher3/widget/custom/bubble/B;

    .line 124
    .line 125
    invoke-direct {v4, p0, v1, v2, v3}, Lcom/android/launcher3/widget/custom/bubble/B;-><init>(Lcom/android/launcher3/widget/custom/bubble/PointerClock;IFF)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 129
    .line 130
    .line 131
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->m:Landroid/animation/AnimatorSet;

    .line 132
    .line 133
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 134
    .line 135
    .line 136
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->m:Landroid/animation/AnimatorSet;

    .line 137
    .line 138
    new-instance v1, Lcom/android/launcher3/widget/custom/bubble/PointerClock$a;

    .line 139
    .line 140
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/bubble/PointerClock$a;-><init>(Lcom/android/launcher3/widget/custom/bubble/PointerClock;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 144
    .line 145
    .line 146
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->m:Landroid/animation/AnimatorSet;

    .line 147
    .line 148
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    nop

    .line 153
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public d(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->i:Landroid/graphics/drawable/RotateDrawable;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/RotateDrawable;->setAlpha(I)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->j:Landroid/graphics/drawable/RotateDrawable;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/RotateDrawable;->setAlpha(I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->i:Landroid/graphics/drawable/RotateDrawable;

    .line 16
    .line 17
    const/16 v0, 0xff

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/RotateDrawable;->setAlpha(I)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->j:Landroid/graphics/drawable/RotateDrawable;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/RotateDrawable;->setAlpha(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->a()V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->m:Landroid/animation/AnimatorSet;

    .line 31
    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->m:Landroid/animation/AnimatorSet;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->end()V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public g(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "applyForeColor: color: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "PointerClock"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->p:I

    .line 28
    .line 29
    if-eq v0, p1, :cond_0

    .line 30
    .line 31
    iput p1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->p:I

    .line 32
    .line 33
    :cond_0
    const/4 p1, -0x1

    .line 34
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->p:I

    .line 35
    .line 36
    if-ne p1, v0, :cond_2

    .line 37
    .line 38
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->i:Landroid/graphics/drawable/RotateDrawable;

    .line 39
    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string v0, "ai_custom_widget_clock_hour_light"

    .line 47
    .line 48
    invoke-static {p1, v0}, Lf1/d;->d(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->i:Landroid/graphics/drawable/RotateDrawable;

    .line 57
    .line 58
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/RotateDrawable;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->j:Landroid/graphics/drawable/RotateDrawable;

    .line 62
    .line 63
    if-eqz p1, :cond_4

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const-string v0, "ai_custom_widget_clock_minute_light"

    .line 70
    .line 71
    invoke-static {p1, v0}, Lf1/d;->d(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->j:Landroid/graphics/drawable/RotateDrawable;

    .line 80
    .line 81
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/RotateDrawable;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->i:Landroid/graphics/drawable/RotateDrawable;

    .line 86
    .line 87
    if-eqz p1, :cond_3

    .line 88
    .line 89
    invoke-virtual {p1}, Landroid/graphics/drawable/RotateDrawable;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->p:I

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->i:Landroid/graphics/drawable/RotateDrawable;

    .line 99
    .line 100
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/RotateDrawable;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 101
    .line 102
    .line 103
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->j:Landroid/graphics/drawable/RotateDrawable;

    .line 104
    .line 105
    if-eqz p1, :cond_4

    .line 106
    .line 107
    invoke-virtual {p1}, Landroid/graphics/drawable/RotateDrawable;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->p:I

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->j:Landroid/graphics/drawable/RotateDrawable;

    .line 117
    .line 118
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/RotateDrawable;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 119
    .line 120
    .line 121
    :cond_4
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->h:Landroid/graphics/drawable/LayerDrawable;

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v1, v2, v2, v0, v0}, Landroid/graphics/drawable/LayerDrawable;->setBounds(IIII)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->h:Landroid/graphics/drawable/LayerDrawable;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method protected onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected onMeasure(II)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0, p1, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setScene(I)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/android/launcher3/widget/custom/bubble/z;->g:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p1, v0, :cond_2

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const-string v0, "desktop_clock_settings_menu_item_color"

    .line 11
    .line 12
    invoke-static {p1, v0}, Lf1/d;->b(Landroid/content/Context;Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->i:Landroid/graphics/drawable/RotateDrawable;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "default_pointer_clock_hour"

    .line 25
    .line 26
    invoke-static {v0, v1}, Lf1/d;->d(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->i:Landroid/graphics/drawable/RotateDrawable;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/RotateDrawable;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->j:Landroid/graphics/drawable/RotateDrawable;

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "default_pointer_clock_minute"

    .line 51
    .line 52
    invoke-static {v0, v1}, Lf1/d;->d(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->j:Landroid/graphics/drawable/RotateDrawable;

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/RotateDrawable;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 69
    .line 70
    .line 71
    :cond_2
    return-void
.end method
