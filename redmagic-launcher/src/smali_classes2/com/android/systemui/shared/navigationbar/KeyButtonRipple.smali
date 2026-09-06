.class public Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;
.super Landroid/graphics/drawable/Drawable;
.source "KeyButtonRipple.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$LogInterpolator;,
        Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$TraceAnimatorListener;,
        Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$Type;
    }
.end annotation


# static fields
.field private static final ALPHA_OUT_INTERPOLATOR:Landroid/view/animation/Interpolator;

.field private static final ANIMATION_DURATION_FADE:I = 0x1c2

.field private static final ANIMATION_DURATION_FADE_FAST:I = 0x50

.field private static final ANIMATION_DURATION_SCALE:I = 0x15e

.field private static final GLOW_MAX_ALPHA:F = 0.2f

.field private static final GLOW_MAX_ALPHA_DARK:F = 0.1f

.field private static final GLOW_MAX_SCALE_FACTOR:F = 1.35f


# instance fields
.field private final mAnimatorListener:Landroid/animation/AnimatorListenerAdapter;

.field private mBottomProp:Landroid/graphics/CanvasProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/graphics/CanvasProperty<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private mDark:Z

.field private mDelayTouchFeedback:Z

.field private mDrawingHardwareGlow:Z

.field private final mEnterHwTraceAnimator:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$TraceAnimatorListener;

.field private final mExitHwTraceAnimator:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$TraceAnimatorListener;

.field private mGlowAlpha:F

.field private mGlowScale:F

.field private final mHandler:Landroid/os/Handler;

.field private final mInterpolator:Landroid/view/animation/Interpolator;

.field private mLastDark:Z

.field private mLeftProp:Landroid/graphics/CanvasProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/graphics/CanvasProperty<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private mMaxWidth:I

.field private final mMaxWidthResource:I

.field private mOnInvisibleRunnable:Ljava/lang/Runnable;

.field private mPaintProp:Landroid/graphics/CanvasProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/graphics/CanvasProperty<",
            "Landroid/graphics/Paint;",
            ">;"
        }
    .end annotation
.end field

.field private mPressed:Z

.field private mRightProp:Landroid/graphics/CanvasProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/graphics/CanvasProperty<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private mRipplePaint:Landroid/graphics/Paint;

.field private final mRunningAnimations:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field private mRxProp:Landroid/graphics/CanvasProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/graphics/CanvasProperty<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private mRyProp:Landroid/graphics/CanvasProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/graphics/CanvasProperty<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private mSpeedUpNextFade:Z

.field private mSupportHardware:Z

.field private final mTargetView:Landroid/view/View;

.field private final mTmpArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field private mTopProp:Landroid/graphics/CanvasProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/graphics/CanvasProperty<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private mType:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$Type;

.field private mVisible:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 2
    .line 3
    const v1, 0x3f4ccccd    # 0.8f

    .line 4
    .line 5
    .line 6
    const/high16 v2, 0x3f800000    # 1.0f

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-direct {v0, v3, v3, v1, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->ALPHA_OUT_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/View;I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mGlowAlpha:F

    .line 6
    .line 7
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    iput v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mGlowScale:F

    .line 10
    .line 11
    new-instance v0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$LogInterpolator;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {v0, v1}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$LogInterpolator;-><init>(Lcom/android/systemui/shared/navigationbar/c;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 18
    .line 19
    new-instance v0, Landroid/os/Handler;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mHandler:Landroid/os/Handler;

    .line 25
    .line 26
    new-instance v0, Ljava/util/HashSet;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRunningAnimations:Ljava/util/HashSet;

    .line 32
    .line 33
    new-instance v0, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mTmpArray:Ljava/util/ArrayList;

    .line 39
    .line 40
    new-instance v0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$TraceAnimatorListener;

    .line 41
    .line 42
    const-string v1, "exitHardware"

    .line 43
    .line 44
    invoke-direct {v0, v1}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$TraceAnimatorListener;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mExitHwTraceAnimator:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$TraceAnimatorListener;

    .line 48
    .line 49
    new-instance v0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$TraceAnimatorListener;

    .line 50
    .line 51
    const-string v1, "enterHardware"

    .line 52
    .line 53
    invoke-direct {v0, v1}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$TraceAnimatorListener;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mEnterHwTraceAnimator:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$TraceAnimatorListener;

    .line 57
    .line 58
    sget-object v0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$Type;->ROUNDED_RECT:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$Type;

    .line 59
    .line 60
    iput-object v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mType:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$Type;

    .line 61
    .line 62
    new-instance v0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$1;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$1;-><init>(Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;)V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mAnimatorListener:Landroid/animation/AnimatorListenerAdapter;

    .line 68
    .line 69
    iput p3, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mMaxWidthResource:I

    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    iput p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mMaxWidth:I

    .line 80
    .line 81
    iput-object p2, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mTargetView:Landroid/view/View;

    .line 82
    .line 83
    return-void
.end method

.method public static synthetic a(Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->enterSoftware()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->enterHardware()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mPressed:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;)Ljava/util/HashSet;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRunningAnimations:Ljava/util/HashSet;

    .line 2
    .line 3
    return-object p0
.end method

.method private drawHardware(Landroid/graphics/RecordingCanvas;)V
    .locals 10

    .line 1
    iget-boolean v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mDrawingHardwareGlow:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mType:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$Type;

    .line 6
    .line 7
    sget-object v1, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$Type;->ROUNDED_RECT:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$Type;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v3, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mLeftProp:Landroid/graphics/CanvasProperty;

    .line 12
    .line 13
    iget-object v4, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mTopProp:Landroid/graphics/CanvasProperty;

    .line 14
    .line 15
    iget-object v5, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRightProp:Landroid/graphics/CanvasProperty;

    .line 16
    .line 17
    iget-object v6, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mBottomProp:Landroid/graphics/CanvasProperty;

    .line 18
    .line 19
    iget-object v7, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRxProp:Landroid/graphics/CanvasProperty;

    .line 20
    .line 21
    iget-object v8, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRyProp:Landroid/graphics/CanvasProperty;

    .line 22
    .line 23
    iget-object v9, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mPaintProp:Landroid/graphics/CanvasProperty;

    .line 24
    .line 25
    move-object v2, p1

    .line 26
    invoke-virtual/range {v2 .. v9}, Landroid/graphics/RecordingCanvas;->drawRoundRect(Landroid/graphics/CanvasProperty;Landroid/graphics/CanvasProperty;Landroid/graphics/CanvasProperty;Landroid/graphics/CanvasProperty;Landroid/graphics/CanvasProperty;Landroid/graphics/CanvasProperty;Landroid/graphics/CanvasProperty;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    move-object v2, p1

    .line 31
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    div-int/lit8 p1, p1, 0x2

    .line 40
    .line 41
    int-to-float p1, p1

    .line 42
    invoke-static {p1}, Landroid/graphics/CanvasProperty;->createFloat(F)Landroid/graphics/CanvasProperty;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    div-int/lit8 v0, v0, 0x2

    .line 55
    .line 56
    int-to-float v0, v0

    .line 57
    invoke-static {v0}, Landroid/graphics/CanvasProperty;->createFloat(F)Landroid/graphics/CanvasProperty;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    const/high16 v3, 0x3f800000    # 1.0f

    .line 82
    .line 83
    int-to-float v1, v1

    .line 84
    mul-float/2addr v1, v3

    .line 85
    const/high16 v3, 0x40000000    # 2.0f

    .line 86
    .line 87
    div-float/2addr v1, v3

    .line 88
    invoke-static {v1}, Landroid/graphics/CanvasProperty;->createFloat(F)Landroid/graphics/CanvasProperty;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iget-object p0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mPaintProp:Landroid/graphics/CanvasProperty;

    .line 93
    .line 94
    invoke-virtual {v2, p1, v0, v1, p0}, Landroid/graphics/RecordingCanvas;->drawCircle(Landroid/graphics/CanvasProperty;Landroid/graphics/CanvasProperty;Landroid/graphics/CanvasProperty;Landroid/graphics/CanvasProperty;)V

    .line 95
    .line 96
    .line 97
    :cond_1
    return-void
.end method

.method private drawSoftware(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    iget v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mGlowAlpha:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpl-float v0, v0, v1

    .line 5
    .line 6
    if-lez v0, :cond_5

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->getRipplePaint()Landroid/graphics/Paint;

    .line 9
    .line 10
    .line 11
    move-result-object v6

    .line 12
    iget v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mGlowAlpha:F

    .line 13
    .line 14
    const/high16 v1, 0x437f0000    # 255.0f

    .line 15
    .line 16
    mul-float/2addr v0, v1

    .line 17
    float-to-int v0, v0

    .line 18
    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    int-to-float v0, v0

    .line 30
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    int-to-float v1, v1

    .line 39
    cmpl-float v2, v0, v1

    .line 40
    .line 41
    if-lez v2, :cond_0

    .line 42
    .line 43
    const/4 v2, 0x1

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const/4 v2, 0x0

    .line 46
    :goto_0
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->getRippleSize()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    int-to-float v3, v3

    .line 51
    iget v4, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mGlowScale:F

    .line 52
    .line 53
    mul-float/2addr v3, v4

    .line 54
    const/high16 v4, 0x3f000000    # 0.5f

    .line 55
    .line 56
    mul-float/2addr v3, v4

    .line 57
    mul-float/2addr v0, v4

    .line 58
    mul-float/2addr v1, v4

    .line 59
    if-eqz v2, :cond_1

    .line 60
    .line 61
    move v4, v3

    .line 62
    goto :goto_1

    .line 63
    :cond_1
    move v4, v0

    .line 64
    :goto_1
    if-eqz v2, :cond_2

    .line 65
    .line 66
    move v3, v1

    .line 67
    :cond_2
    move-object v8, v6

    .line 68
    if-eqz v2, :cond_3

    .line 69
    .line 70
    move v6, v1

    .line 71
    goto :goto_2

    .line 72
    :cond_3
    move v6, v0

    .line 73
    :goto_2
    iget-object p0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mType:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$Type;

    .line 74
    .line 75
    sget-object v2, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$Type;->ROUNDED_RECT:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$Type;

    .line 76
    .line 77
    if-ne p0, v2, :cond_4

    .line 78
    .line 79
    sub-float v2, v0, v4

    .line 80
    .line 81
    move p0, v3

    .line 82
    sub-float v3, v1, p0

    .line 83
    .line 84
    add-float/2addr v4, v0

    .line 85
    add-float v5, v1, p0

    .line 86
    .line 87
    move v7, v6

    .line 88
    move-object v1, p1

    .line 89
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_4
    move p0, v1

    .line 94
    move-object v1, p1

    .line 95
    move p1, p0

    .line 96
    move p0, v3

    .line 97
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 98
    .line 99
    .line 100
    invoke-virtual {v1, v0, p1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 101
    .line 102
    .line 103
    invoke-static {v4, p0}, Ljava/lang/Math;->min(FF)F

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    neg-float v2, v4

    .line 108
    move v3, v2

    .line 109
    move v5, v4

    .line 110
    move-object v6, v8

    .line 111
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawOval(FFFFLandroid/graphics/Paint;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 115
    .line 116
    .line 117
    :cond_5
    return-void
.end method

.method static bridge synthetic e(Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mDrawingHardwareGlow:Z

    .line 2
    .line 3
    return-void
.end method

.method private endAnimations(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "KeyButtonRipple.endAnim: reason="

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string p1, " cancel="

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-wide/16 v0, 0x1000

    .line 33
    .line 34
    invoke-static {v0, v1, p1}, Landroid/os/Trace;->instant(JLjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    const/4 p1, 0x0

    .line 38
    iput-boolean p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mVisible:Z

    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mTmpArray:Ljava/util/ArrayList;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRunningAnimations:Ljava/util/HashSet;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mTmpArray:Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    :goto_0
    if-ge p1, v0, :cond_2

    .line 54
    .line 55
    iget-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mTmpArray:Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Landroid/animation/Animator;

    .line 62
    .line 63
    if-eqz p2, :cond_1

    .line 64
    .line 65
    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_1
    invoke-virtual {v1}, Landroid/animation/Animator;->end()V

    .line 70
    .line 71
    .line 72
    :goto_1
    add-int/lit8 p1, p1, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    iget-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mTmpArray:Ljava/util/ArrayList;

    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRunningAnimations:Ljava/util/HashSet;

    .line 81
    .line 82
    invoke-virtual {p1}, Ljava/util/HashSet;->clear()V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mHandler:Landroid/os/Handler;

    .line 86
    .line 87
    const/4 p1, 0x0

    .line 88
    invoke-virtual {p0, p1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method private enterHardware()V
    .locals 9

    .line 1
    const-string v0, "enterHardware"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {p0, v0, v1}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->endAnimations(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    iput-boolean v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mVisible:Z

    .line 8
    .line 9
    iput-boolean v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mDrawingHardwareGlow:Z

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->getExtendSize()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    div-int/lit8 v0, v0, 0x2

    .line 16
    .line 17
    int-to-float v0, v0

    .line 18
    invoke-static {v0}, Landroid/graphics/CanvasProperty;->createFloat(F)Landroid/graphics/CanvasProperty;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-direct {p0, v0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->setExtendStart(Landroid/graphics/CanvasProperty;)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Landroid/view/RenderNodeAnimator;

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->getExtendStart()Landroid/graphics/CanvasProperty;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->getExtendSize()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    div-int/lit8 v2, v2, 0x2

    .line 36
    .line 37
    int-to-float v2, v2

    .line 38
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->getRippleSize()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    int-to-float v3, v3

    .line 43
    const v4, 0x3faccccd    # 1.35f

    .line 44
    .line 45
    .line 46
    mul-float/2addr v3, v4

    .line 47
    const/high16 v5, 0x40000000    # 2.0f

    .line 48
    .line 49
    div-float/2addr v3, v5

    .line 50
    sub-float/2addr v2, v3

    .line 51
    invoke-direct {v0, v1, v2}, Landroid/view/RenderNodeAnimator;-><init>(Landroid/graphics/CanvasProperty;F)V

    .line 52
    .line 53
    .line 54
    const-wide/16 v1, 0x15e

    .line 55
    .line 56
    invoke-virtual {v0, v1, v2}, Landroid/view/RenderNodeAnimator;->setDuration(J)Landroid/graphics/animation/RenderNodeAnimator;

    .line 57
    .line 58
    .line 59
    iget-object v3, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 60
    .line 61
    invoke-virtual {v0, v3}, Landroid/view/RenderNodeAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 62
    .line 63
    .line 64
    iget-object v3, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mAnimatorListener:Landroid/animation/AnimatorListenerAdapter;

    .line 65
    .line 66
    invoke-virtual {v0, v3}, Landroid/view/RenderNodeAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 67
    .line 68
    .line 69
    iget-object v3, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mTargetView:Landroid/view/View;

    .line 70
    .line 71
    invoke-virtual {v0, v3}, Landroid/view/RenderNodeAnimator;->setTarget(Landroid/view/View;)V

    .line 72
    .line 73
    .line 74
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->getExtendSize()I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    div-int/lit8 v3, v3, 0x2

    .line 79
    .line 80
    int-to-float v3, v3

    .line 81
    invoke-static {v3}, Landroid/graphics/CanvasProperty;->createFloat(F)Landroid/graphics/CanvasProperty;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-direct {p0, v3}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->setExtendEnd(Landroid/graphics/CanvasProperty;)V

    .line 86
    .line 87
    .line 88
    new-instance v3, Landroid/view/RenderNodeAnimator;

    .line 89
    .line 90
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->getExtendEnd()Landroid/graphics/CanvasProperty;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->getExtendSize()I

    .line 95
    .line 96
    .line 97
    move-result v7

    .line 98
    div-int/lit8 v7, v7, 0x2

    .line 99
    .line 100
    int-to-float v7, v7

    .line 101
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->getRippleSize()I

    .line 102
    .line 103
    .line 104
    move-result v8

    .line 105
    int-to-float v8, v8

    .line 106
    mul-float/2addr v8, v4

    .line 107
    div-float/2addr v8, v5

    .line 108
    add-float/2addr v7, v8

    .line 109
    invoke-direct {v3, v6, v7}, Landroid/view/RenderNodeAnimator;-><init>(Landroid/graphics/CanvasProperty;F)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v3, v1, v2}, Landroid/view/RenderNodeAnimator;->setDuration(J)Landroid/graphics/animation/RenderNodeAnimator;

    .line 113
    .line 114
    .line 115
    iget-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 116
    .line 117
    invoke-virtual {v3, v1}, Landroid/view/RenderNodeAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 118
    .line 119
    .line 120
    iget-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mAnimatorListener:Landroid/animation/AnimatorListenerAdapter;

    .line 121
    .line 122
    invoke-virtual {v3, v1}, Landroid/view/RenderNodeAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 123
    .line 124
    .line 125
    iget-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mEnterHwTraceAnimator:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$TraceAnimatorListener;

    .line 126
    .line 127
    invoke-virtual {v3, v1}, Landroid/view/RenderNodeAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 128
    .line 129
    .line 130
    iget-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mTargetView:Landroid/view/View;

    .line 131
    .line 132
    invoke-virtual {v3, v1}, Landroid/view/RenderNodeAnimator;->setTarget(Landroid/view/View;)V

    .line 133
    .line 134
    .line 135
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->isHorizontal()Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    const/4 v2, 0x0

    .line 140
    if-eqz v1, :cond_0

    .line 141
    .line 142
    invoke-static {v2}, Landroid/graphics/CanvasProperty;->createFloat(F)Landroid/graphics/CanvasProperty;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    iput-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mTopProp:Landroid/graphics/CanvasProperty;

    .line 147
    .line 148
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    int-to-float v1, v1

    .line 157
    invoke-static {v1}, Landroid/graphics/CanvasProperty;->createFloat(F)Landroid/graphics/CanvasProperty;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    iput-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mBottomProp:Landroid/graphics/CanvasProperty;

    .line 162
    .line 163
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    div-int/lit8 v1, v1, 0x2

    .line 172
    .line 173
    int-to-float v1, v1

    .line 174
    invoke-static {v1}, Landroid/graphics/CanvasProperty;->createFloat(F)Landroid/graphics/CanvasProperty;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    iput-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRxProp:Landroid/graphics/CanvasProperty;

    .line 179
    .line 180
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    div-int/lit8 v1, v1, 0x2

    .line 189
    .line 190
    int-to-float v1, v1

    .line 191
    invoke-static {v1}, Landroid/graphics/CanvasProperty;->createFloat(F)Landroid/graphics/CanvasProperty;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    iput-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRyProp:Landroid/graphics/CanvasProperty;

    .line 196
    .line 197
    goto :goto_0

    .line 198
    :cond_0
    invoke-static {v2}, Landroid/graphics/CanvasProperty;->createFloat(F)Landroid/graphics/CanvasProperty;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    iput-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mLeftProp:Landroid/graphics/CanvasProperty;

    .line 203
    .line 204
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    int-to-float v1, v1

    .line 213
    invoke-static {v1}, Landroid/graphics/CanvasProperty;->createFloat(F)Landroid/graphics/CanvasProperty;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    iput-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRightProp:Landroid/graphics/CanvasProperty;

    .line 218
    .line 219
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    div-int/lit8 v1, v1, 0x2

    .line 228
    .line 229
    int-to-float v1, v1

    .line 230
    invoke-static {v1}, Landroid/graphics/CanvasProperty;->createFloat(F)Landroid/graphics/CanvasProperty;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    iput-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRxProp:Landroid/graphics/CanvasProperty;

    .line 235
    .line 236
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 241
    .line 242
    .line 243
    move-result v1

    .line 244
    div-int/lit8 v1, v1, 0x2

    .line 245
    .line 246
    int-to-float v1, v1

    .line 247
    invoke-static {v1}, Landroid/graphics/CanvasProperty;->createFloat(F)Landroid/graphics/CanvasProperty;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    iput-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRyProp:Landroid/graphics/CanvasProperty;

    .line 252
    .line 253
    :goto_0
    iput v4, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mGlowScale:F

    .line 254
    .line 255
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->getMaxGlowAlpha()F

    .line 256
    .line 257
    .line 258
    move-result v1

    .line 259
    iput v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mGlowAlpha:F

    .line 260
    .line 261
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->getRipplePaint()Landroid/graphics/Paint;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    iput-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRipplePaint:Landroid/graphics/Paint;

    .line 266
    .line 267
    iget v2, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mGlowAlpha:F

    .line 268
    .line 269
    const/high16 v4, 0x437f0000    # 255.0f

    .line 270
    .line 271
    mul-float/2addr v2, v4

    .line 272
    float-to-int v2, v2

    .line 273
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 274
    .line 275
    .line 276
    iget-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRipplePaint:Landroid/graphics/Paint;

    .line 277
    .line 278
    invoke-static {v1}, Landroid/graphics/CanvasProperty;->createPaint(Landroid/graphics/Paint;)Landroid/graphics/CanvasProperty;

    .line 279
    .line 280
    .line 281
    move-result-object v1

    .line 282
    iput-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mPaintProp:Landroid/graphics/CanvasProperty;

    .line 283
    .line 284
    invoke-virtual {v0}, Landroid/view/RenderNodeAnimator;->start()V

    .line 285
    .line 286
    .line 287
    invoke-virtual {v3}, Landroid/view/RenderNodeAnimator;->start()V

    .line 288
    .line 289
    .line 290
    iget-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRunningAnimations:Ljava/util/HashSet;

    .line 291
    .line 292
    invoke-virtual {v1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 293
    .line 294
    .line 295
    iget-object v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRunningAnimations:Ljava/util/HashSet;

    .line 296
    .line 297
    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 301
    .line 302
    .line 303
    iget-boolean v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mDelayTouchFeedback:Z

    .line 304
    .line 305
    if-eqz v0, :cond_1

    .line 306
    .line 307
    iget-boolean v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mPressed:Z

    .line 308
    .line 309
    if-nez v0, :cond_1

    .line 310
    .line 311
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->exitHardware()V

    .line 312
    .line 313
    .line 314
    :cond_1
    return-void
.end method

.method private enterSoftware()V
    .locals 3

    .line 1
    const-string v0, "enterSoftware"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {p0, v0, v1}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->endAnimations(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    iput-boolean v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mVisible:Z

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->getMaxGlowAlpha()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mGlowAlpha:F

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    new-array v0, v0, [F

    .line 17
    .line 18
    fill-array-data v0, :array_0

    .line 19
    .line 20
    .line 21
    const-string v1, "glowScale"

    .line 22
    .line 23
    invoke-static {p0, v1, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 30
    .line 31
    .line 32
    const-wide/16 v1, 0x15e

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mAnimatorListener:Landroid/animation/AnimatorListenerAdapter;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRunningAnimations:Ljava/util/HashSet;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    iget-boolean v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mDelayTouchFeedback:Z

    .line 51
    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    iget-boolean v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mPressed:Z

    .line 55
    .line 56
    if-nez v0, :cond_0

    .line 57
    .line 58
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->exitSoftware()V

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void

    .line 62
    nop

    .line 63
    :array_0
    .array-data 4
        0x0
        0x3faccccd    # 1.35f
    .end array-data
.end method

.method private exitHardware()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->getRipplePaint()Landroid/graphics/Paint;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/graphics/CanvasProperty;->createPaint(Landroid/graphics/Paint;)Landroid/graphics/CanvasProperty;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mPaintProp:Landroid/graphics/CanvasProperty;

    .line 10
    .line 11
    new-instance v0, Landroid/view/RenderNodeAnimator;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mPaintProp:Landroid/graphics/CanvasProperty;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-direct {v0, v1, v2, v3}, Landroid/view/RenderNodeAnimator;-><init>(Landroid/graphics/CanvasProperty;IF)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->getFadeDuration()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    int-to-long v1, v1

    .line 25
    invoke-virtual {v0, v1, v2}, Landroid/view/RenderNodeAnimator;->setDuration(J)Landroid/graphics/animation/RenderNodeAnimator;

    .line 26
    .line 27
    .line 28
    sget-object v1, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->ALPHA_OUT_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/view/RenderNodeAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mAnimatorListener:Landroid/animation/AnimatorListenerAdapter;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/view/RenderNodeAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mExitHwTraceAnimator:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$TraceAnimatorListener;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/RenderNodeAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 41
    .line 42
    .line 43
    :try_start_0
    iget-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mTargetView:Landroid/view/View;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/view/RenderNodeAnimator;->setTarget(Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/view/RenderNodeAnimator;->start()V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRunningAnimations:Ljava/util/HashSet;

    .line 52
    .line 53
    invoke-virtual {v1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :catch_0
    move-exception v0

    .line 58
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 59
    .line 60
    .line 61
    :goto_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method private exitSoftware()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mGlowAlpha:F

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    new-array v1, v1, [F

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    aput v0, v1, v2

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v2, 0x1

    .line 11
    aput v0, v1, v2

    .line 12
    .line 13
    const-string v0, "glowAlpha"

    .line 14
    .line 15
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->ALPHA_OUT_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->getFadeDuration()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    int-to-long v1, v1

    .line 29
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mAnimatorListener:Landroid/animation/AnimatorListenerAdapter;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRunningAnimations:Ljava/util/HashSet;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method static bridge synthetic f(Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mVisible:Z

    .line 2
    .line 3
    return-void
.end method

.method private getExtendEnd()Landroid/graphics/CanvasProperty;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/graphics/CanvasProperty<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->isHorizontal()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRightProp:Landroid/graphics/CanvasProperty;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mBottomProp:Landroid/graphics/CanvasProperty;

    .line 11
    .line 12
    return-object p0
.end method

.method private getExtendSize()I
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->isHorizontal()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method private getExtendStart()Landroid/graphics/CanvasProperty;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/graphics/CanvasProperty<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->isHorizontal()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mLeftProp:Landroid/graphics/CanvasProperty;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mTopProp:Landroid/graphics/CanvasProperty;

    .line 11
    .line 12
    return-object p0
.end method

.method private getFadeDuration()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mSpeedUpNextFade:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x50

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/16 v0, 0x1c2

    .line 9
    .line 10
    :goto_0
    const/4 v1, 0x0

    .line 11
    iput-boolean v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mSpeedUpNextFade:Z

    .line 12
    .line 13
    return v0
.end method

.method private getMaxGlowAlpha()F
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mLastDark:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const p0, 0x3dcccccd    # 0.1f

    .line 6
    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    const p0, 0x3e4ccccd    # 0.2f

    .line 10
    .line 11
    .line 12
    return p0
.end method

.method private getRipplePaint()Landroid/graphics/Paint;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRipplePaint:Landroid/graphics/Paint;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/Paint;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRipplePaint:Landroid/graphics/Paint;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRipplePaint:Landroid/graphics/Paint;

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mLastDark:Z

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    const/high16 v1, -0x1000000

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v1, -0x1

    .line 26
    :goto_0
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object p0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRipplePaint:Landroid/graphics/Paint;

    .line 30
    .line 31
    return-object p0
.end method

.method private getRippleSize()I
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->isHorizontal()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    :goto_0
    iget p0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mMaxWidth:I

    .line 25
    .line 26
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0
.end method

.method private isHorizontal()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-le v0, p0, :cond_0

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

.method private setExtendEnd(Landroid/graphics/CanvasProperty;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/CanvasProperty<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->isHorizontal()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRightProp:Landroid/graphics/CanvasProperty;

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mBottomProp:Landroid/graphics/CanvasProperty;

    .line 11
    .line 12
    return-void
.end method

.method private setExtendStart(Landroid/graphics/CanvasProperty;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/CanvasProperty<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->isHorizontal()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mLeftProp:Landroid/graphics/CanvasProperty;

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mTopProp:Landroid/graphics/CanvasProperty;

    .line 11
    .line 12
    return-void
.end method

.method private setPressed(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mDark:Z

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mLastDark:Z

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-object v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRipplePaint:Landroid/graphics/Paint;

    .line 11
    .line 12
    iput-boolean v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mLastDark:Z

    .line 13
    .line 14
    :cond_0
    iget-boolean v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mSupportHardware:Z

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-direct {p0, p1}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->setPressedHardware(Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->setPressedSoftware(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private setPressedHardware(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    iget-boolean p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mDelayTouchFeedback:Z

    .line 4
    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRunningAnimations:Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/util/HashSet;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mHandler:Landroid/os/Handler;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mHandler:Landroid/os/Handler;

    .line 22
    .line 23
    new-instance v0, Lcom/android/systemui/shared/navigationbar/a;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Lcom/android/systemui/shared/navigationbar/a;-><init>(Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    int-to-long v1, p0

    .line 33
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-boolean p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mVisible:Z

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->enterHardware()V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void

    .line 45
    :cond_2
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->enterHardware()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->exitHardware()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method private setPressedSoftware(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    iget-boolean p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mDelayTouchFeedback:Z

    .line 4
    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mRunningAnimations:Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/util/HashSet;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mHandler:Landroid/os/Handler;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mHandler:Landroid/os/Handler;

    .line 22
    .line 23
    new-instance v0, Lcom/android/systemui/shared/navigationbar/b;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Lcom/android/systemui/shared/navigationbar/b;-><init>(Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    int-to-long v1, p0

    .line 33
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-boolean p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mVisible:Z

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->enterSoftware()V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void

    .line 45
    :cond_2
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->enterSoftware()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    invoke-direct {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->exitSoftware()V

    .line 50
    .line 51
    .line 52
    return-void
.end method


# virtual methods
.method public abortDelayedRipple()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->isHardwareAccelerated()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mSupportHardware:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p1, Landroid/graphics/RecordingCanvas;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->drawHardware(Landroid/graphics/RecordingCanvas;)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->drawSoftware(Landroid/graphics/Canvas;)V

    .line 16
    .line 17
    .line 18
    :goto_0
    iget-boolean p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mPressed:Z

    .line 19
    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    iget-boolean p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mVisible:Z

    .line 23
    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mOnInvisibleRunnable:Ljava/lang/Runnable;

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    new-instance p1, Landroid/os/Handler;

    .line 31
    .line 32
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mOnInvisibleRunnable:Ljava/lang/Runnable;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 42
    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    iput-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mOnInvisibleRunnable:Ljava/lang/Runnable;

    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public getGlowAlpha()F
    .locals 0
    .annotation build Le/a;
    .end annotation

    .line 1
    iget p0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mGlowAlpha:F

    .line 2
    .line 3
    return p0
.end method

.method public getGlowScale()F
    .locals 0
    .annotation build Le/a;
    .end annotation

    .line 1
    iget p0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mGlowScale:F

    .line 2
    .line 3
    return p0
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
.end method

.method public hasFocusStateSpecified()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public isStateful()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public jumpToCurrentState()V
    .locals 2

    .line 1
    const-string v0, "jumpToCurrentState"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, v0, v1}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->endAnimations(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected onStateChange([I)Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    array-length v2, p1

    .line 4
    const/4 v3, 0x1

    .line 5
    if-ge v1, v2, :cond_1

    .line 6
    .line 7
    aget v2, p1, v1

    .line 8
    .line 9
    const v4, 0x10100a7

    .line 10
    .line 11
    .line 12
    if-ne v2, v4, :cond_0

    .line 13
    .line 14
    move p1, v3

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    move p1, v0

    .line 20
    :goto_1
    iget-boolean v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mPressed:Z

    .line 21
    .line 22
    if-eq p1, v1, :cond_2

    .line 23
    .line 24
    invoke-direct {p0, p1}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->setPressed(Z)V

    .line 25
    .line 26
    .line 27
    iput-boolean p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mPressed:Z

    .line 28
    .line 29
    return v3

    .line 30
    :cond_2
    return v0
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setDarkIntensity(F)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f000000    # 0.5f

    .line 2
    .line 3
    cmpl-float p1, p1, v0

    .line 4
    .line 5
    if-ltz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p1, 0x0

    .line 10
    :goto_0
    iput-boolean p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mDark:Z

    .line 11
    .line 12
    return-void
.end method

.method public setDelayTouchFeedback(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mDelayTouchFeedback:Z

    .line 2
    .line 3
    return-void
.end method

.method public setGlowAlpha(F)V
    .locals 0
    .annotation build Le/a;
    .end annotation

    .line 1
    iput p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mGlowAlpha:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setGlowScale(F)V
    .locals 0
    .annotation build Le/a;
    .end annotation

    .line 1
    iput p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mGlowScale:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnInvisibleRunnable(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mOnInvisibleRunnable:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method public setType(Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$Type;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mType:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$Type;

    .line 2
    .line 3
    return-void
.end method

.method public setVisible(ZZ)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->jumpToCurrentState()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return p1
.end method

.method public speedUpNextFade()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mSpeedUpNextFade:Z

    .line 3
    .line 4
    return-void
.end method

.method public updateResources()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mTargetView:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget v1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mMaxWidthResource:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->mMaxWidth:I

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 20
    .line 21
    .line 22
    return-void
.end method
