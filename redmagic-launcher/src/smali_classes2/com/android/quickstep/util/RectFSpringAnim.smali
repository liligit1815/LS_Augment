.class public Lcom/android/quickstep/util/RectFSpringAnim;
.super Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;
.source "RectFSpringAnim.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;,
        Lcom/android/quickstep/util/RectFSpringAnim$OnDelayedAnimatorListener;,
        Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;,
        Lcom/android/quickstep/util/RectFSpringAnim$MFVSpringConfig;,
        Lcom/android/quickstep/util/RectFSpringAnim$TaskbarHotseatSpringConfig;,
        Lcom/android/quickstep/util/RectFSpringAnim$DefaultSpringConfig;,
        Lcom/android/quickstep/util/RectFSpringAnim$Tracking;
    }
.end annotation


# static fields
.field private static final RECT_CENTER_X:Landroidx/dynamicanimation/animation/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/dynamicanimation/animation/g<",
            "Lcom/android/quickstep/util/RectFSpringAnim;",
            ">;"
        }
    .end annotation
.end field

.field private static final RECT_SCALE_PROGRESS:Landroidx/dynamicanimation/animation/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/dynamicanimation/animation/g<",
            "Lcom/android/quickstep/util/RectFSpringAnim;",
            ">;"
        }
    .end annotation
.end field

.field private static final RECT_SCALE_PROGRESS_MFV:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/util/RectFSpringAnim;",
            ">;"
        }
    .end annotation
.end field

.field private static final RECT_Y:Landroidx/dynamicanimation/animation/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/dynamicanimation/animation/g<",
            "Lcom/android/quickstep/util/RectFSpringAnim;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "RectFSpringAnim"

.field public static final TRACKING_BOTTOM:I = 0x2

.field public static final TRACKING_CENTER:I = 0x1

.field public static final TRACKING_TOP:I


# instance fields
.field private final mAnimatorListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/animation/Animator$AnimatorListener;",
            ">;"
        }
    .end annotation
.end field

.field private mAnimsStarted:Z

.field private mCurrentCenterX:F

.field public final mCurrentRect:Landroid/graphics/RectF;

.field private mCurrentScaleProgress:F

.field private mCurrentY:F

.field protected final mDampingX:F

.field protected final mDampingY:F

.field public mDelayedAnimationStarted:Z

.field private final mDelayedAnimatorListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/RectFSpringAnim$OnDelayedAnimatorListener;",
            ">;"
        }
    .end annotation
.end field

.field public mHomeAnimTargetViewType:I

.field private mMaxVelocityPxPerS:I

.field private mMinVisChange:F

.field public mNeedDelayedAnimation:Z

.field private final mOnUpdateListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;",
            ">;"
        }
    .end annotation
.end field

.field protected final mRectDamping:F

.field private mRectHeightAnimInterpolator:Landroid/view/animation/Interpolator;

.field private mRectScaleAnim:Landroidx/dynamicanimation/animation/j;

.field private mRectScaleAnimEnded:Z

.field private mRectScaleAnimMFV:Landroid/animation/ObjectAnimator;

.field protected final mRectStiffness:F

.field private mRectXAnim:Lcom/android/launcher3/anim/J;

.field private mRectXAnimEnded:Z

.field private mRectXSpring:Landroidx/dynamicanimation/animation/j;

.field private mRectXYAnimInterpolator:Landroid/view/animation/Interpolator;

.field private mRectYAnim:Lcom/android/launcher3/anim/J;

.field private mRectYAnimEnded:Z

.field private mRectYSpring:Landroidx/dynamicanimation/animation/j;

.field private mStartAspectRatio:F

.field private final mStartRect:Landroid/graphics/RectF;

.field protected final mStiffnessX:F

.field protected final mStiffnessY:F

.field private mTargetRect:Landroid/graphics/RectF;

.field public final mTracking:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/RectFSpringAnim$1;

    .line 2
    .line 3
    const-string v1, "rectCenterXSpring"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/RectFSpringAnim$1;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/quickstep/util/RectFSpringAnim;->RECT_CENTER_X:Landroidx/dynamicanimation/animation/g;

    .line 9
    .line 10
    new-instance v0, Lcom/android/quickstep/util/RectFSpringAnim$2;

    .line 11
    .line 12
    const-string v1, "rectYSpring"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/RectFSpringAnim$2;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/android/quickstep/util/RectFSpringAnim;->RECT_Y:Landroidx/dynamicanimation/animation/g;

    .line 18
    .line 19
    new-instance v0, Lcom/android/quickstep/util/RectFSpringAnim$3;

    .line 20
    .line 21
    const-string v1, "rectScaleProgress"

    .line 22
    .line 23
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/RectFSpringAnim$3;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lcom/android/quickstep/util/RectFSpringAnim;->RECT_SCALE_PROGRESS:Landroidx/dynamicanimation/animation/g;

    .line 27
    .line 28
    new-instance v0, Lcom/android/quickstep/util/RectFSpringAnim$4;

    .line 29
    .line 30
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/RectFSpringAnim$4;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sput-object v0, Lcom/android/quickstep/util/RectFSpringAnim;->RECT_SCALE_PROGRESS_MFV:Landroid/util/FloatProperty;

    .line 34
    .line 35
    return-void
.end method

.method public constructor <init>(Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/RectF;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentRect:Landroid/graphics/RectF;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mOnUpdateListeners:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mAnimatorListeners:Ljava/util/List;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mNeedDelayedAnimation:Z

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mDelayedAnimationStarted:Z

    .line 29
    .line 30
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mDelayedAnimatorListeners:Ljava/util/List;

    .line 36
    .line 37
    sget-object v0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXYAnimInterpolator:Landroid/view/animation/Interpolator;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectHeightAnimInterpolator:Landroid/view/animation/Interpolator;

    .line 42
    .line 43
    iget-object v0, p1, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->startRect:Landroid/graphics/RectF;

    .line 44
    .line 45
    iput-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mStartRect:Landroid/graphics/RectF;

    .line 46
    .line 47
    iget-object v1, p1, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->targetRect:Landroid/graphics/RectF;

    .line 48
    .line 49
    iput-object v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    iput v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentCenterX:F

    .line 56
    .line 57
    iget v1, p1, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->minVisChange:F

    .line 58
    .line 59
    iput v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mMinVisChange:F

    .line 60
    .line 61
    iget v1, p1, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->maxVelocityPxPerS:I

    .line 62
    .line 63
    iput v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mMaxVelocityPxPerS:I

    .line 64
    .line 65
    const/4 v1, 0x1

    .line 66
    invoke-virtual {p0, v1}, Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;->setCanRelease(Z)V

    .line 67
    .line 68
    .line 69
    iget v1, p1, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->tracking:I

    .line 70
    .line 71
    iput v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTracking:I

    .line 72
    .line 73
    iget v1, p1, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->stiffnessX:F

    .line 74
    .line 75
    iput v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mStiffnessX:F

    .line 76
    .line 77
    iget v1, p1, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->stiffnessY:F

    .line 78
    .line 79
    iput v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mStiffnessY:F

    .line 80
    .line 81
    iget v1, p1, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->dampingX:F

    .line 82
    .line 83
    iput v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mDampingX:F

    .line 84
    .line 85
    iget v1, p1, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->dampingY:F

    .line 86
    .line 87
    iput v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mDampingY:F

    .line 88
    .line 89
    iget v1, p1, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->rectStiffness:F

    .line 90
    .line 91
    iput v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectStiffness:F

    .line 92
    .line 93
    invoke-direct {p0, v0}, Lcom/android/quickstep/util/RectFSpringAnim;->getTrackedYFromRect(Landroid/graphics/RectF;)F

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    iput v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentY:F

    .line 98
    .line 99
    iget v0, p1, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->rectDamping:F

    .line 100
    .line 101
    iput v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectDamping:F

    .line 102
    .line 103
    iget p1, p1, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->homeAnimTargetType:I

    .line 104
    .line 105
    iput p1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mHomeAnimTargetViewType:I

    .line 106
    .line 107
    return-void
.end method

.method private static adjustVelocity(FJJF)F
    .locals 3

    .line 1
    invoke-static {p0}, Ljava/lang/Math;->signum(F)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    long-to-float p1, p1

    .line 10
    cmpg-float p2, v1, p1

    .line 11
    .line 12
    if-gez p2, :cond_0

    .line 13
    .line 14
    mul-float/2addr p1, v0

    .line 15
    return p1

    .line 16
    :cond_0
    long-to-float p1, p3

    .line 17
    cmpg-float p2, v1, p1

    .line 18
    .line 19
    if-lez p2, :cond_2

    .line 20
    .line 21
    const/high16 p2, 0x3f800000    # 1.0f

    .line 22
    .line 23
    cmpg-float p3, p5, p2

    .line 24
    .line 25
    if-gtz p3, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    sub-float/2addr v1, p1

    .line 29
    float-to-double p3, v1

    .line 30
    div-float/2addr p2, p5

    .line 31
    float-to-double v1, p2

    .line 32
    invoke-static {p3, p4, v1, v2}, Ljava/lang/Math;->pow(DD)D

    .line 33
    .line 34
    .line 35
    move-result-wide p2

    .line 36
    double-to-float p0, p2

    .line 37
    add-float/2addr p1, p0

    .line 38
    mul-float/2addr p1, v0

    .line 39
    return p1

    .line 40
    :cond_2
    :goto_0
    return p0
.end method

.method public static synthetic b(Lcom/android/quickstep/util/RectFSpringAnim;Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/util/RectFSpringAnim;->lambda$start$0(Landroidx/dynamicanimation/animation/e;ZFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/util/RectFSpringAnim;Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/util/RectFSpringAnim;->lambda$start$2(Landroidx/dynamicanimation/animation/e;ZFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/quickstep/util/RectFSpringAnim;Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/util/RectFSpringAnim;->lambda$start$1(Landroidx/dynamicanimation/animation/e;ZFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/quickstep/util/RectFSpringAnim;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/RectFSpringAnim;->lambda$start$3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic f(Lcom/android/quickstep/util/RectFSpringAnim;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentCenterX:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic g(Lcom/android/quickstep/util/RectFSpringAnim;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentScaleProgress:F

    .line 2
    .line 3
    return p0
.end method

.method private getTrackedYFromRect(Landroid/graphics/RectF;)F
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTracking:I

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    if-eq p0, v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    iget p0, p1, Landroid/graphics/RectF;->bottom:F

    .line 14
    .line 15
    return p0

    .line 16
    :cond_1
    iget p0, p1, Landroid/graphics/RectF;->top:F

    .line 17
    .line 18
    return p0
.end method

.method static bridge synthetic h(Lcom/android/quickstep/util/RectFSpringAnim;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentY:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic i(Lcom/android/quickstep/util/RectFSpringAnim;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentCenterX:F

    .line 2
    .line 3
    return-void
.end method

.method private isEnded()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXAnimEnded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectYAnimEnded:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectScaleAnimEnded:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method static bridge synthetic j(Lcom/android/quickstep/util/RectFSpringAnim;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentScaleProgress:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic k(Lcom/android/quickstep/util/RectFSpringAnim;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentY:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic l(Lcom/android/quickstep/util/RectFSpringAnim;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/RectFSpringAnim;->onUpdate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$start$0(Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXAnimEnded:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/util/RectFSpringAnim;->maybeOnEnd()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic lambda$start$1(Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectYAnimEnded:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/util/RectFSpringAnim;->maybeOnEnd()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic lambda$start$2(Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectScaleAnimEnded:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/util/RectFSpringAnim;->maybeOnEnd()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic lambda$start$3()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectScaleAnimEnded:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/util/RectFSpringAnim;->maybeOnEnd()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic lambda$start$4(Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectScaleAnimEnded:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/util/RectFSpringAnim;->maybeOnEnd()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private maybeOnEnd()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mNeedDelayedAnimation:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string p0, "RectFSpringAnim"

    .line 6
    .line 7
    const-string v0, "Delayed animation not finished"

    .line 8
    .line 9
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-boolean v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mAnimsStarted:Z

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    invoke-direct {p0}, Lcom/android/quickstep/util/RectFSpringAnim;->isEnded()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    sget-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 24
    .line 25
    const-string v1, "Launcher.RectFSpringAnimationEnd"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/K2;->beginSection(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-boolean v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mAnimsStarted:Z

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-virtual {p0, v0}, Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;->setCanRelease(Z)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mAnimatorListeners:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Landroid/animation/Animator$AnimatorListener;

    .line 54
    .line 55
    const/4 v1, 0x0

    .line 56
    invoke-interface {v0, v1}, Landroid/animation/Animator$AnimatorListener;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    sget-object p0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 63
    .line 64
    .line 65
    :cond_2
    return-void
.end method

.method private onUpdate()V
    .locals 8

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/RectFSpringAnim;->isEnded()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_4

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mOnUpdateListeners:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_8

    .line 16
    .line 17
    sget-boolean v0, Lf1/a;->H:Z

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-static {}, Lx1/O;->Y2()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    :cond_1
    iget v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mHomeAnimTargetViewType:I

    .line 28
    .line 29
    invoke-static {v1}, Lcom/android/launcher3/anim/C;->i0(I)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_3

    .line 34
    .line 35
    :cond_2
    invoke-direct {p0}, Lcom/android/quickstep/util/RectFSpringAnim;->setCurrentRect()V

    .line 36
    .line 37
    .line 38
    goto/16 :goto_2

    .line 39
    .line 40
    :cond_3
    if-nez v0, :cond_5

    .line 41
    .line 42
    invoke-static {}, Lx1/O;->Y2()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_4
    iget v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentScaleProgress:F

    .line 50
    .line 51
    iget-object v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mStartRect:Landroid/graphics/RectF;

    .line 52
    .line 53
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    iget-object v2, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 58
    .line 59
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iget v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentScaleProgress:F

    .line 68
    .line 69
    iget-object v2, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mStartRect:Landroid/graphics/RectF;

    .line 70
    .line 71
    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    iget-object v3, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 76
    .line 77
    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    invoke-static {v1, v2, v3}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    goto :goto_1

    .line 86
    :cond_5
    :goto_0
    iget v2, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentScaleProgress:F

    .line 87
    .line 88
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mStartRect:Landroid/graphics/RectF;

    .line 89
    .line 90
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 95
    .line 96
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 97
    .line 98
    .line 99
    move-result v6

    .line 100
    iget-object v7, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXYAnimInterpolator:Landroid/view/animation/Interpolator;

    .line 101
    .line 102
    const/4 v3, 0x0

    .line 103
    const/high16 v4, 0x3f800000    # 1.0f

    .line 104
    .line 105
    invoke-static/range {v2 .. v7}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    iget v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentScaleProgress:F

    .line 110
    .line 111
    iget-object v2, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mStartRect:Landroid/graphics/RectF;

    .line 112
    .line 113
    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    .line 114
    .line 115
    .line 116
    move-result v4

    .line 117
    iget-object v2, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 118
    .line 119
    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    iget-object v6, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectHeightAnimInterpolator:Landroid/view/animation/Interpolator;

    .line 124
    .line 125
    const/4 v2, 0x0

    .line 126
    const/high16 v3, 0x3f800000    # 1.0f

    .line 127
    .line 128
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    :goto_1
    iget v2, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTracking:I

    .line 133
    .line 134
    const/high16 v3, 0x40000000    # 2.0f

    .line 135
    .line 136
    if-eqz v2, :cond_7

    .line 137
    .line 138
    const/4 v4, 0x2

    .line 139
    if-eq v2, v4, :cond_6

    .line 140
    .line 141
    iget-object v2, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentRect:Landroid/graphics/RectF;

    .line 142
    .line 143
    iget v4, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentCenterX:F

    .line 144
    .line 145
    div-float/2addr v0, v3

    .line 146
    sub-float v5, v4, v0

    .line 147
    .line 148
    iget v6, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentY:F

    .line 149
    .line 150
    div-float/2addr v1, v3

    .line 151
    sub-float v3, v6, v1

    .line 152
    .line 153
    add-float/2addr v4, v0

    .line 154
    add-float/2addr v6, v1

    .line 155
    invoke-virtual {v2, v5, v3, v4, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 156
    .line 157
    .line 158
    goto :goto_2

    .line 159
    :cond_6
    iget-object v2, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentRect:Landroid/graphics/RectF;

    .line 160
    .line 161
    iget v4, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentCenterX:F

    .line 162
    .line 163
    div-float/2addr v0, v3

    .line 164
    sub-float v3, v4, v0

    .line 165
    .line 166
    iget v5, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentY:F

    .line 167
    .line 168
    sub-float v1, v5, v1

    .line 169
    .line 170
    add-float/2addr v4, v0

    .line 171
    invoke-virtual {v2, v3, v1, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 172
    .line 173
    .line 174
    goto :goto_2

    .line 175
    :cond_7
    iget-object v2, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentRect:Landroid/graphics/RectF;

    .line 176
    .line 177
    iget v4, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentCenterX:F

    .line 178
    .line 179
    div-float/2addr v0, v3

    .line 180
    sub-float v3, v4, v0

    .line 181
    .line 182
    iget v5, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentY:F

    .line 183
    .line 184
    add-float/2addr v4, v0

    .line 185
    add-float/2addr v1, v5

    .line 186
    invoke-virtual {v2, v3, v5, v4, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 187
    .line 188
    .line 189
    :goto_2
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mOnUpdateListeners:Ljava/util/List;

    .line 190
    .line 191
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 196
    .line 197
    .line 198
    move-result v1

    .line 199
    if-eqz v1, :cond_8

    .line 200
    .line 201
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    check-cast v1, Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;

    .line 206
    .line 207
    iget-object v2, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentRect:Landroid/graphics/RectF;

    .line 208
    .line 209
    iget v3, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentScaleProgress:F

    .line 210
    .line 211
    invoke-interface {v1, v2, v3}, Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;->onUpdate(Landroid/graphics/RectF;F)V

    .line 212
    .line 213
    .line 214
    goto :goto_3

    .line 215
    :cond_8
    :goto_4
    return-void
.end method

.method private setCurrentRect()V
    .locals 12

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mHomeAnimTargetViewType:I

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    const/high16 v2, 0x40000000    # 2.0f

    .line 5
    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    iget v3, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentScaleProgress:F

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mStartRect:Landroid/graphics/RectF;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 13
    .line 14
    .line 15
    move-result v6

    .line 16
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 19
    .line 20
    .line 21
    move-result v7

    .line 22
    iget-object v8, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXYAnimInterpolator:Landroid/view/animation/Interpolator;

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    const/high16 v5, 0x3f800000    # 1.0f

    .line 26
    .line 27
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget v3, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentScaleProgress:F

    .line 32
    .line 33
    iget-object v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mStartRect:Landroid/graphics/RectF;

    .line 34
    .line 35
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    iget-object v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 40
    .line 41
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 42
    .line 43
    .line 44
    move-result v7

    .line 45
    iget-object v8, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectHeightAnimInterpolator:Landroid/view/animation/Interpolator;

    .line 46
    .line 47
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    iget v3, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentScaleProgress:F

    .line 52
    .line 53
    iget-object v4, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mStartRect:Landroid/graphics/RectF;

    .line 54
    .line 55
    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    .line 56
    .line 57
    .line 58
    move-result v6

    .line 59
    iget-object v4, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 60
    .line 61
    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    .line 62
    .line 63
    .line 64
    move-result v7

    .line 65
    iget-object v8, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXYAnimInterpolator:Landroid/view/animation/Interpolator;

    .line 66
    .line 67
    const/4 v4, 0x0

    .line 68
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    iget v4, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentScaleProgress:F

    .line 73
    .line 74
    iget-object v5, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mStartRect:Landroid/graphics/RectF;

    .line 75
    .line 76
    invoke-virtual {v5}, Landroid/graphics/RectF;->centerY()F

    .line 77
    .line 78
    .line 79
    move-result v7

    .line 80
    iget-object v5, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 81
    .line 82
    invoke-virtual {v5}, Landroid/graphics/RectF;->centerY()F

    .line 83
    .line 84
    .line 85
    move-result v8

    .line 86
    iget-object v9, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXYAnimInterpolator:Landroid/view/animation/Interpolator;

    .line 87
    .line 88
    const/4 v5, 0x0

    .line 89
    const/high16 v6, 0x3f800000    # 1.0f

    .line 90
    .line 91
    invoke-static/range {v4 .. v9}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    iget-object p0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentRect:Landroid/graphics/RectF;

    .line 96
    .line 97
    div-float/2addr v0, v2

    .line 98
    sub-float v5, v3, v0

    .line 99
    .line 100
    div-float/2addr v1, v2

    .line 101
    sub-float v2, v4, v1

    .line 102
    .line 103
    add-float/2addr v3, v0

    .line 104
    add-float/2addr v4, v1

    .line 105
    invoke-virtual {p0, v5, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_0
    iget v6, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentScaleProgress:F

    .line 110
    .line 111
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mStartRect:Landroid/graphics/RectF;

    .line 112
    .line 113
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 114
    .line 115
    .line 116
    move-result v9

    .line 117
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 118
    .line 119
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 120
    .line 121
    .line 122
    move-result v10

    .line 123
    iget-object v11, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXYAnimInterpolator:Landroid/view/animation/Interpolator;

    .line 124
    .line 125
    const/4 v7, 0x0

    .line 126
    const/high16 v8, 0x3f800000    # 1.0f

    .line 127
    .line 128
    invoke-static/range {v6 .. v11}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    iget v3, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentScaleProgress:F

    .line 133
    .line 134
    iget-object v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mStartRect:Landroid/graphics/RectF;

    .line 135
    .line 136
    iget v6, v1, Landroid/graphics/RectF;->bottom:F

    .line 137
    .line 138
    iget-object v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 139
    .line 140
    iget v7, v1, Landroid/graphics/RectF;->bottom:F

    .line 141
    .line 142
    iget-object v8, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXYAnimInterpolator:Landroid/view/animation/Interpolator;

    .line 143
    .line 144
    const/4 v4, 0x0

    .line 145
    const/high16 v5, 0x3f800000    # 1.0f

    .line 146
    .line 147
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    iget v3, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentScaleProgress:F

    .line 152
    .line 153
    iget-object v4, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mStartRect:Landroid/graphics/RectF;

    .line 154
    .line 155
    iget v6, v4, Landroid/graphics/RectF;->top:F

    .line 156
    .line 157
    iget-object v4, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 158
    .line 159
    iget v7, v4, Landroid/graphics/RectF;->top:F

    .line 160
    .line 161
    iget-object v8, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXYAnimInterpolator:Landroid/view/animation/Interpolator;

    .line 162
    .line 163
    const/4 v4, 0x0

    .line 164
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 165
    .line 166
    .line 167
    move-result v3

    .line 168
    sub-float v4, v1, v3

    .line 169
    .line 170
    iget v5, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mStartAspectRatio:F

    .line 171
    .line 172
    div-float/2addr v4, v5

    .line 173
    iget-object v5, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 174
    .line 175
    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    .line 176
    .line 177
    .line 178
    move-result v5

    .line 179
    cmpg-float v5, v4, v5

    .line 180
    .line 181
    if-gez v5, :cond_1

    .line 182
    .line 183
    iget-object v3, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 184
    .line 185
    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    .line 186
    .line 187
    .line 188
    move-result v4

    .line 189
    iget v3, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mStartAspectRatio:F

    .line 190
    .line 191
    mul-float/2addr v3, v4

    .line 192
    sub-float v3, v1, v3

    .line 193
    .line 194
    iget-object v5, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 195
    .line 196
    iget v5, v5, Landroid/graphics/RectF;->top:F

    .line 197
    .line 198
    cmpg-float v6, v3, v5

    .line 199
    .line 200
    if-gez v6, :cond_1

    .line 201
    .line 202
    move v3, v5

    .line 203
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentRect:Landroid/graphics/RectF;

    .line 204
    .line 205
    div-float/2addr v4, v2

    .line 206
    sub-float v2, v0, v4

    .line 207
    .line 208
    add-float/2addr v0, v4

    .line 209
    invoke-virtual {p0, v2, v3, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 210
    .line 211
    .line 212
    return-void
.end method


# virtual methods
.method public addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mAnimatorListeners:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public addDelayedAnimatorListener(Lcom/android/quickstep/util/RectFSpringAnim$OnDelayedAnimatorListener;)V
    .locals 1

    .line 1
    sget-boolean v0, Lf1/a;->I:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mNeedDelayedAnimation:Z

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mDelayedAnimatorListeners:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public addOnUpdateListener(Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mOnUpdateListeners:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public cancel()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mAnimsStarted:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mOnUpdateListeners:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;

    .line 22
    .line 23
    invoke-interface {v1}, Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;->onCancel()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/util/RectFSpringAnim;->end()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public delayedmaybeOnEnd()V
    .locals 2

    .line 1
    const-string v0, "RectFSpringAnim"

    .line 2
    .line 3
    const-string v1, "Delayed animation finished"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mNeedDelayedAnimation:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/util/RectFSpringAnim;->end()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public end()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mAnimsStarted:Z

    .line 2
    .line 3
    if-eqz v0, :cond_6

    .line 4
    .line 5
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    sget-boolean v0, Lf1/a;->H:Z

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXSpring:Landroidx/dynamicanimation/animation/j;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->x()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXSpring:Landroidx/dynamicanimation/animation/j;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->C()V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectYSpring:Landroidx/dynamicanimation/animation/j;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->x()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectYSpring:Landroidx/dynamicanimation/animation/j;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->C()V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXAnim:Lcom/android/launcher3/anim/J;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/android/launcher3/anim/J;->b()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectYAnim:Lcom/android/launcher3/anim/J;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/android/launcher3/anim/J;->b()V

    .line 50
    .line 51
    .line 52
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectScaleAnim:Landroidx/dynamicanimation/animation/j;

    .line 53
    .line 54
    if-eqz v0, :cond_4

    .line 55
    .line 56
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->x()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectScaleAnim:Landroidx/dynamicanimation/animation/j;

    .line 63
    .line 64
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->C()V

    .line 65
    .line 66
    .line 67
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectScaleAnim:Landroidx/dynamicanimation/animation/j;

    .line 68
    .line 69
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->y()Landroidx/dynamicanimation/animation/k;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/k;->b()F

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    iput v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentScaleProgress:F

    .line 78
    .line 79
    :cond_4
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectScaleAnimMFV:Landroid/animation/ObjectAnimator;

    .line 80
    .line 81
    if-eqz v0, :cond_5

    .line 82
    .line 83
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->end()V

    .line 84
    .line 85
    .line 86
    const/high16 v0, 0x3f800000    # 1.0f

    .line 87
    .line 88
    iput v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentScaleProgress:F

    .line 89
    .line 90
    :cond_5
    const/4 v0, 0x0

    .line 91
    iput-boolean v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXAnimEnded:Z

    .line 92
    .line 93
    iput-boolean v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectYAnimEnded:Z

    .line 94
    .line 95
    iput-boolean v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectScaleAnimEnded:Z

    .line 96
    .line 97
    invoke-direct {p0}, Lcom/android/quickstep/util/RectFSpringAnim;->onUpdate()V

    .line 98
    .line 99
    .line 100
    :cond_6
    const/4 v0, 0x1

    .line 101
    iput-boolean v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXAnimEnded:Z

    .line 102
    .line 103
    iput-boolean v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectYAnimEnded:Z

    .line 104
    .line 105
    iput-boolean v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectScaleAnimEnded:Z

    .line 106
    .line 107
    invoke-direct {p0}, Lcom/android/quickstep/util/RectFSpringAnim;->maybeOnEnd()V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public getTargetRect()Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 2
    .line 3
    return-object p0
.end method

.method public onTargetPositionChanged()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    sget-boolean v0, Lf1/a;->H:Z

    .line 10
    .line 11
    if-eqz v0, :cond_5

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/android/quickstep/util/RectFSpringAnim;->isEnded()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto/16 :goto_1

    .line 20
    .line 21
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v3, "mCurrentScaleProgress "

    .line 27
    .line 28
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v3, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 32
    .line 33
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v3, "RectFSpringAnim"

    .line 41
    .line 42
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXSpring:Landroidx/dynamicanimation/animation/j;

    .line 46
    .line 47
    const/4 v3, 0x0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iget-object v4, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 51
    .line 52
    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    invoke-virtual {v0, v4}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 57
    .line 58
    .line 59
    iput-boolean v3, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXAnimEnded:Z

    .line 60
    .line 61
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectYSpring:Landroidx/dynamicanimation/animation/j;

    .line 62
    .line 63
    if-eqz v0, :cond_a

    .line 64
    .line 65
    iget v4, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTracking:I

    .line 66
    .line 67
    if-eqz v4, :cond_4

    .line 68
    .line 69
    if-eq v4, v2, :cond_3

    .line 70
    .line 71
    if-eq v4, v1, :cond_2

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    iget-object v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 75
    .line 76
    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_3
    iget-object v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 83
    .line 84
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_4
    iget-object v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 93
    .line 94
    iget v1, v1, Landroid/graphics/RectF;->top:F

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 97
    .line 98
    .line 99
    :goto_0
    iput-boolean v3, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectYAnimEnded:Z

    .line 100
    .line 101
    return-void

    .line 102
    :cond_5
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXAnim:Lcom/android/launcher3/anim/J;

    .line 103
    .line 104
    if-eqz v0, :cond_6

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/android/launcher3/anim/J;->c()F

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iget-object v3, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 111
    .line 112
    invoke-virtual {v3}, Landroid/graphics/RectF;->centerX()F

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    cmpl-float v0, v0, v3

    .line 117
    .line 118
    if-eqz v0, :cond_6

    .line 119
    .line 120
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXAnim:Lcom/android/launcher3/anim/J;

    .line 121
    .line 122
    iget v3, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentCenterX:F

    .line 123
    .line 124
    iget-object v4, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 125
    .line 126
    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    .line 127
    .line 128
    .line 129
    move-result v4

    .line 130
    invoke-virtual {v0, v3, v4}, Lcom/android/launcher3/anim/J;->f(FF)V

    .line 131
    .line 132
    .line 133
    :cond_6
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectYAnim:Lcom/android/launcher3/anim/J;

    .line 134
    .line 135
    if-eqz v0, :cond_a

    .line 136
    .line 137
    iget v3, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTracking:I

    .line 138
    .line 139
    if-eqz v3, :cond_9

    .line 140
    .line 141
    if-eq v3, v2, :cond_8

    .line 142
    .line 143
    if-eq v3, v1, :cond_7

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_7
    invoke-virtual {v0}, Lcom/android/launcher3/anim/J;->c()F

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    iget-object v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 151
    .line 152
    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    .line 153
    .line 154
    cmpl-float v0, v0, v1

    .line 155
    .line 156
    if-eqz v0, :cond_a

    .line 157
    .line 158
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectYAnim:Lcom/android/launcher3/anim/J;

    .line 159
    .line 160
    iget p0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentY:F

    .line 161
    .line 162
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/anim/J;->f(FF)V

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :cond_8
    invoke-virtual {v0}, Lcom/android/launcher3/anim/J;->c()F

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    iget-object v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 171
    .line 172
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    cmpl-float v0, v0, v1

    .line 177
    .line 178
    if-eqz v0, :cond_a

    .line 179
    .line 180
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectYAnim:Lcom/android/launcher3/anim/J;

    .line 181
    .line 182
    iget v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentY:F

    .line 183
    .line 184
    iget-object p0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 185
    .line 186
    invoke-virtual {p0}, Landroid/graphics/RectF;->centerY()F

    .line 187
    .line 188
    .line 189
    move-result p0

    .line 190
    invoke-virtual {v0, v1, p0}, Lcom/android/launcher3/anim/J;->f(FF)V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :cond_9
    invoke-virtual {v0}, Lcom/android/launcher3/anim/J;->c()F

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    iget-object v1, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    .line 199
    .line 200
    iget v1, v1, Landroid/graphics/RectF;->top:F

    .line 201
    .line 202
    cmpl-float v0, v0, v1

    .line 203
    .line 204
    if-eqz v0, :cond_a

    .line 205
    .line 206
    iget-object v0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mRectYAnim:Lcom/android/launcher3/anim/J;

    .line 207
    .line 208
    iget p0, p0, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentY:F

    .line 209
    .line 210
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/anim/J;->f(FF)V

    .line 211
    .line 212
    .line 213
    :cond_a
    :goto_1
    return-void
.end method

.method public start(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/PointF;Landroid/animation/AnimatorSet;Z)V
    .locals 27

    move-object/from16 v1, p0

    move-object/from16 v0, p3

    .line 1
    new-instance v12, Lcom/android/quickstep/util/B0;

    invoke-direct {v12, v1}, Lcom/android/quickstep/util/B0;-><init>(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 2
    new-instance v13, Lcom/android/quickstep/util/C0;

    invoke-direct {v13, v1}, Lcom/android/quickstep/util/C0;-><init>(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 3
    iget v2, v0, Landroid/graphics/PointF;->x:F

    sget-boolean v3, Lf1/a;->H:Z

    const/16 v4, 0x3e8

    if-nez v3, :cond_0

    invoke-static {}, Lx1/O;->Y2()Z

    move-result v5

    if-eqz v5, :cond_1

    :cond_0
    if-eqz p5, :cond_1

    const/4 v5, 0x1

    goto :goto_0

    :cond_1
    move v5, v4

    :goto_0
    int-to-float v5, v5

    mul-float v6, v2, v5

    .line 4
    iget v2, v0, Landroid/graphics/PointF;->y:F

    if-nez v3, :cond_2

    invoke-static {}, Lx1/O;->Y2()Z

    move-result v5

    if-eqz v5, :cond_3

    :cond_2
    if-eqz p5, :cond_3

    const/4 v4, 0x1

    :cond_3
    int-to-float v4, v4

    mul-float v15, v2, v4

    .line 5
    iget v4, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentCenterX:F

    .line 6
    iget-object v2, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v5

    .line 7
    iget v2, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mCurrentY:F

    .line 8
    iget-object v7, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mTargetRect:Landroid/graphics/RectF;

    invoke-direct {v1, v7}, Lcom/android/quickstep/util/RectFSpringAnim;->getTrackedYFromRect(Landroid/graphics/RectF;)F

    move-result v7

    .line 9
    iget-object v8, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mStartRect:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->height()F

    move-result v8

    const/high16 v9, 0x3f800000    # 1.0f

    div-float v8, v9, v8

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    .line 10
    iget-object v10, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mStartRect:Landroid/graphics/RectF;

    invoke-virtual {v10}, Landroid/graphics/RectF;->height()F

    move-result v10

    iget-object v11, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mStartRect:Landroid/graphics/RectF;

    invoke-virtual {v11}, Landroid/graphics/RectF;->width()F

    move-result v11

    div-float/2addr v10, v11

    iput v10, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mStartAspectRatio:F

    .line 11
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    move-result v10

    if-eqz v10, :cond_8

    if-eqz v3, :cond_8

    .line 12
    invoke-static/range {p1 .. p1}, Lcom/android/launcher3/util/g0;->i(Landroid/content/Context;)Lx2/h;

    move-result-object v10

    const v9, 0x7f070ac3

    .line 13
    invoke-interface {v10, v9}, Lx2/h;->getInt(I)I

    move-result v9

    move/from16 v16, v15

    int-to-long v14, v9

    const v9, 0x7f070abf

    .line 14
    invoke-interface {v10, v9}, Lx2/h;->getInt(I)I

    move-result v9

    move-object/from16 v21, v12

    int-to-long v11, v9

    if-eqz v3, :cond_4

    const v9, 0x7f070ac5

    goto :goto_1

    :cond_4
    const v9, 0x7f070ac4

    .line 15
    :goto_1
    invoke-interface {v10, v9}, Lx2/h;->getInt(I)I

    move-result v9

    move-wide/from16 v18, v14

    int-to-long v14, v9

    if-eqz v3, :cond_5

    const v9, 0x7f070ac1

    goto :goto_2

    :cond_5
    const v9, 0x7f070ac0

    .line 16
    :goto_2
    invoke-interface {v10, v9}, Lx2/h;->getInt(I)I

    move-result v9

    move-wide/from16 v22, v14

    int-to-long v14, v9

    const v9, 0x7f070abe

    .line 17
    invoke-interface {v10, v9}, Lx2/h;->getFloat(I)F

    move-result v20

    if-eqz v3, :cond_6

    if-nez p5, :cond_7

    :cond_6
    move-wide/from16 v25, v11

    move-object v12, v10

    move-wide/from16 v9, v25

    move v3, v7

    move/from16 v24, v8

    move-wide/from16 v7, v18

    move/from16 v11, v20

    goto :goto_3

    :cond_7
    move v3, v7

    move/from16 v24, v8

    move-object v12, v10

    move/from16 v15, v16

    goto :goto_4

    .line 18
    :goto_3
    invoke-static/range {v6 .. v11}, Lcom/android/quickstep/util/RectFSpringAnim;->adjustVelocity(FJJF)F

    move-result v6

    move/from16 v20, v11

    move-wide/from16 v18, v14

    move/from16 v15, v16

    move-wide/from16 v16, v22

    .line 19
    invoke-static/range {v15 .. v20}, Lcom/android/quickstep/util/RectFSpringAnim;->adjustVelocity(FJJF)F

    move-result v15

    :goto_4
    const v7, 0x7f070acf

    .line 20
    invoke-interface {v12, v7}, Lx2/h;->getFloat(I)F

    const v7, 0x7f070acd

    .line 21
    invoke-interface {v12, v7}, Lx2/h;->getFloat(I)F

    .line 22
    new-instance v7, Landroidx/dynamicanimation/animation/j;

    sget-object v8, Lcom/android/quickstep/util/RectFSpringAnim;->RECT_CENTER_X:Landroidx/dynamicanimation/animation/g;

    invoke-direct {v7, v1, v8}, Landroidx/dynamicanimation/animation/j;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    new-instance v8, Landroidx/dynamicanimation/animation/k;

    invoke-direct {v8, v5}, Landroidx/dynamicanimation/animation/k;-><init>(F)V

    iget v5, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mStiffnessX:F

    .line 23
    invoke-virtual {v8, v5}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    move-result-object v5

    iget v8, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mDampingX:F

    .line 24
    invoke-virtual {v5, v8}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    move-result-object v5

    .line 25
    invoke-virtual {v7, v5}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    move-result-object v5

    .line 26
    invoke-virtual {v5, v4}, Landroidx/dynamicanimation/animation/e;->q(F)Landroidx/dynamicanimation/animation/e;

    move-result-object v4

    check-cast v4, Landroidx/dynamicanimation/animation/j;

    .line 27
    invoke-virtual {v4, v6}, Landroidx/dynamicanimation/animation/e;->r(F)Landroidx/dynamicanimation/animation/e;

    move-result-object v4

    check-cast v4, Landroidx/dynamicanimation/animation/j;

    move-object/from16 v6, v21

    .line 28
    invoke-virtual {v4, v6}, Landroidx/dynamicanimation/animation/e;->a(Landroidx/dynamicanimation/animation/e$q;)Landroidx/dynamicanimation/animation/e;

    move-result-object v4

    check-cast v4, Landroidx/dynamicanimation/animation/j;

    iput-object v4, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXSpring:Landroidx/dynamicanimation/animation/j;

    const v4, 0x7f070ad7

    .line 29
    invoke-interface {v12, v4}, Lx2/h;->getFloat(I)F

    const v4, 0x7f070ad5

    .line 30
    invoke-interface {v12, v4}, Lx2/h;->getFloat(I)F

    .line 31
    new-instance v4, Landroidx/dynamicanimation/animation/j;

    sget-object v5, Lcom/android/quickstep/util/RectFSpringAnim;->RECT_Y:Landroidx/dynamicanimation/animation/g;

    invoke-direct {v4, v1, v5}, Landroidx/dynamicanimation/animation/j;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    new-instance v5, Landroidx/dynamicanimation/animation/k;

    invoke-direct {v5, v3}, Landroidx/dynamicanimation/animation/k;-><init>(F)V

    iget v3, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mStiffnessY:F

    .line 32
    invoke-virtual {v5, v3}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    move-result-object v3

    iget v5, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mDampingY:F

    .line 33
    invoke-virtual {v3, v5}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    move-result-object v3

    .line 34
    invoke-virtual {v4, v3}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    move-result-object v3

    .line 35
    invoke-virtual {v3, v2}, Landroidx/dynamicanimation/animation/e;->q(F)Landroidx/dynamicanimation/animation/e;

    move-result-object v2

    check-cast v2, Landroidx/dynamicanimation/animation/j;

    .line 36
    invoke-virtual {v2, v15}, Landroidx/dynamicanimation/animation/e;->r(F)Landroidx/dynamicanimation/animation/e;

    move-result-object v2

    check-cast v2, Landroidx/dynamicanimation/animation/j;

    .line 37
    invoke-virtual {v2, v13}, Landroidx/dynamicanimation/animation/e;->a(Landroidx/dynamicanimation/animation/e$q;)Landroidx/dynamicanimation/animation/e;

    move-result-object v2

    check-cast v2, Landroidx/dynamicanimation/animation/j;

    iput-object v2, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mRectYSpring:Landroidx/dynamicanimation/animation/j;

    const v2, 0x7f070acc

    .line 38
    invoke-interface {v12, v2}, Lx2/h;->getFloat(I)F

    const v2, 0x7f070ac8

    .line 39
    invoke-interface {v12, v2}, Lx2/h;->getFloat(I)F

    .line 40
    new-instance v2, Landroidx/dynamicanimation/animation/j;

    sget-object v3, Lcom/android/quickstep/util/RectFSpringAnim;->RECT_SCALE_PROGRESS:Landroidx/dynamicanimation/animation/g;

    invoke-direct {v2, v1, v3}, Landroidx/dynamicanimation/animation/j;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    new-instance v3, Landroidx/dynamicanimation/animation/k;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v3, v4}, Landroidx/dynamicanimation/animation/k;-><init>(F)V

    iget v5, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mRectStiffness:F

    .line 41
    invoke-virtual {v3, v5}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    move-result-object v3

    iget v5, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mRectDamping:F

    .line 42
    invoke-virtual {v3, v5}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    move-result-object v3

    .line 43
    invoke-virtual {v2, v3}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    move-result-object v2

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v3, v24

    mul-float/2addr v0, v3

    .line 44
    invoke-virtual {v2, v0}, Landroidx/dynamicanimation/animation/e;->r(F)Landroidx/dynamicanimation/animation/e;

    move-result-object v0

    check-cast v0, Landroidx/dynamicanimation/animation/j;

    .line 45
    invoke-virtual {v0, v4}, Landroidx/dynamicanimation/animation/e;->m(F)Landroidx/dynamicanimation/animation/e;

    move-result-object v0

    check-cast v0, Landroidx/dynamicanimation/animation/j;

    .line 46
    invoke-virtual {v0, v3}, Landroidx/dynamicanimation/animation/e;->o(F)Landroidx/dynamicanimation/animation/e;

    move-result-object v0

    check-cast v0, Landroidx/dynamicanimation/animation/j;

    new-instance v2, Lcom/android/quickstep/util/D0;

    invoke-direct {v2, v1}, Lcom/android/quickstep/util/D0;-><init>(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 47
    invoke-virtual {v0, v2}, Landroidx/dynamicanimation/animation/e;->a(Landroidx/dynamicanimation/animation/e$q;)Landroidx/dynamicanimation/animation/e;

    move-result-object v0

    check-cast v0, Landroidx/dynamicanimation/animation/j;

    iput-object v0, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mRectScaleAnim:Landroidx/dynamicanimation/animation/j;

    const/4 v14, 0x0

    .line 48
    invoke-virtual {v1, v14}, Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;->setCanRelease(Z)V

    const/4 v0, 0x1

    .line 49
    iput-boolean v0, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mAnimsStarted:Z

    .line 50
    iget-object v0, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXSpring:Landroidx/dynamicanimation/animation/j;

    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->t()V

    .line 51
    iget-object v0, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mRectYSpring:Landroidx/dynamicanimation/animation/j;

    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->t()V

    const/4 v0, 0x1

    goto/16 :goto_9

    :cond_8
    move v0, v6

    move v3, v7

    move-object v6, v12

    const/4 v14, 0x0

    .line 52
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v7

    iget v8, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mMaxVelocityPxPerS:I

    .line 53
    invoke-static {v7, v8}, Lcom/android/launcher3/touch/B;->a(FI)I

    move-result v7

    int-to-float v7, v7

    .line 54
    invoke-static {v0}, Ljava/lang/Math;->signum(F)F

    move-result v0

    mul-float/2addr v7, v0

    .line 55
    invoke-static {v15}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget v8, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mMaxVelocityPxPerS:I

    .line 56
    invoke-static {v0, v8}, Lcom/android/launcher3/touch/B;->a(FI)I

    move-result v0

    int-to-float v0, v0

    .line 57
    invoke-static {v15}, Ljava/lang/Math;->signum(F)F

    move-result v8

    mul-float v15, v0, v8

    .line 58
    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v8

    .line 59
    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    move-result v9

    .line 60
    new-instance v0, Lcom/android/launcher3/anim/J;

    move v10, v3

    sget-object v3, Lcom/android/quickstep/util/RectFSpringAnim;->RECT_CENTER_X:Landroidx/dynamicanimation/animation/g;

    move-object v12, v6

    move v6, v7

    iget v7, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mMinVisChange:F

    move v11, v10

    iget v10, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mDampingX:F

    move/from16 v16, v11

    iget v11, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mStiffnessX:F

    move v14, v2

    move-object/from16 p2, v13

    move/from16 v13, v16

    move-object/from16 v2, p1

    invoke-direct/range {v0 .. v12}, Lcom/android/launcher3/anim/J;-><init>(Ljava/lang/Object;Landroid/content/Context;Landroidx/dynamicanimation/animation/g;FFFFFFFFLandroidx/dynamicanimation/animation/e$q;)V

    iput-object v0, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXAnim:Lcom/android/launcher3/anim/J;

    .line 61
    invoke-static {v14, v13}, Ljava/lang/Math;->min(FF)F

    move-result v8

    .line 62
    invoke-static {v14, v13}, Ljava/lang/Math;->max(FF)F

    move-result v9

    .line 63
    new-instance v0, Lcom/android/launcher3/anim/J;

    sget-object v3, Lcom/android/quickstep/util/RectFSpringAnim;->RECT_Y:Landroidx/dynamicanimation/animation/g;

    iget v7, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mMinVisChange:F

    iget v10, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mDampingY:F

    iget v11, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mStiffnessY:F

    move-object/from16 v12, p2

    move v5, v13

    move v4, v14

    move v6, v15

    invoke-direct/range {v0 .. v12}, Lcom/android/launcher3/anim/J;-><init>(Ljava/lang/Object;Landroid/content/Context;Landroidx/dynamicanimation/animation/g;FFFFFFFFLandroidx/dynamicanimation/animation/e$q;)V

    iput-object v0, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mRectYAnim:Lcom/android/launcher3/anim/J;

    .line 64
    invoke-static {}, Lx1/O;->Y2()Z

    move-result v0

    if-eqz v0, :cond_9

    iget v0, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mHomeAnimTargetViewType:I

    invoke-static {v0}, Lcom/android/launcher3/anim/C;->i0(I)Z

    move-result v0

    if-nez v0, :cond_9

    sget-object v0, Lcom/android/launcher3/anim/L;->T:Landroid/view/animation/Interpolator;

    goto :goto_5

    :cond_9
    sget-object v0, Lcom/android/launcher3/anim/L;->C:Landroid/view/animation/Interpolator;

    :goto_5
    iput-object v0, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXYAnimInterpolator:Landroid/view/animation/Interpolator;

    .line 65
    invoke-static {}, Lx1/O;->Y2()Z

    move-result v0

    if-eqz v0, :cond_a

    iget v0, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mHomeAnimTargetViewType:I

    invoke-static {v0}, Lcom/android/launcher3/anim/C;->i0(I)Z

    move-result v0

    if-nez v0, :cond_a

    sget-object v0, Lcom/android/launcher3/anim/L;->T:Landroid/view/animation/Interpolator;

    goto :goto_6

    :cond_a
    sget-object v0, Lcom/android/launcher3/anim/L;->D:Landroid/view/animation/Interpolator;

    :goto_6
    iput-object v0, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mRectHeightAnimInterpolator:Landroid/view/animation/Interpolator;

    .line 66
    sget-object v0, Lcom/android/quickstep/util/RectFSpringAnim;->RECT_SCALE_PROGRESS_MFV:Landroid/util/FloatProperty;

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    invoke-static {v1, v0, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mRectScaleAnimMFV:Landroid/animation/ObjectAnimator;

    .line 67
    new-instance v2, Lcom/android/quickstep/util/E0;

    invoke-direct {v2, v1}, Lcom/android/quickstep/util/E0;-><init>(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 68
    invoke-static {v2}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    move-result-object v2

    .line 69
    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 70
    invoke-static {}, Lx1/O;->Y2()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 71
    invoke-virtual/range {p4 .. p4}, Landroid/animation/AnimatorSet;->start()V

    .line 72
    :cond_b
    iget-object v0, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mRectScaleAnimMFV:Landroid/animation/ObjectAnimator;

    invoke-static {}, Lx1/O;->Y2()Z

    move-result v2

    if-eqz v2, :cond_c

    sget v2, Lcom/android/launcher3/anim/C;->U:I

    :goto_7
    int-to-long v2, v2

    goto :goto_8

    :cond_c
    sget v2, Lcom/android/launcher3/anim/C;->T:I

    goto :goto_7

    :goto_8
    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 73
    iget-object v0, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mRectScaleAnimMFV:Landroid/animation/ObjectAnimator;

    sget-object v2, LJ0/h;->q:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 74
    iget-object v0, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mRectScaleAnimMFV:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    const/4 v14, 0x0

    .line 75
    invoke-virtual {v1, v14}, Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;->setCanRelease(Z)V

    const/4 v0, 0x1

    .line 76
    iput-boolean v0, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mAnimsStarted:Z

    .line 77
    iget-object v2, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mRectXAnim:Lcom/android/launcher3/anim/J;

    invoke-virtual {v2}, Lcom/android/launcher3/anim/J;->e()V

    .line 78
    iget-object v2, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mRectYAnim:Lcom/android/launcher3/anim/J;

    invoke-virtual {v2}, Lcom/android/launcher3/anim/J;->e()V

    .line 79
    :goto_9
    iget-boolean v2, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mNeedDelayedAnimation:Z

    if-eqz v2, :cond_d

    .line 80
    iget-boolean v2, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mDelayedAnimationStarted:Z

    if-nez v2, :cond_d

    .line 81
    iput-boolean v0, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mDelayedAnimationStarted:Z

    .line 82
    iget-object v0, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mDelayedAnimatorListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/quickstep/util/RectFSpringAnim$OnDelayedAnimatorListener;

    .line 83
    invoke-interface {v2}, Lcom/android/quickstep/util/RectFSpringAnim$OnDelayedAnimatorListener;->onDelayedAnimationStart()V

    goto :goto_a

    .line 84
    :cond_d
    iget-object v0, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mRectScaleAnim:Landroidx/dynamicanimation/animation/j;

    if-eqz v0, :cond_e

    .line 85
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->t()V

    .line 86
    :cond_e
    iget-object v0, v1, Lcom/android/quickstep/util/RectFSpringAnim;->mAnimatorListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/animation/Animator$AnimatorListener;

    const/4 v2, 0x0

    .line 87
    invoke-interface {v1, v2}, Landroid/animation/Animator$AnimatorListener;->onAnimationStart(Landroid/animation/Animator;)V

    goto :goto_b

    :cond_f
    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
