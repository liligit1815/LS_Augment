.class public abstract Lcom/android/launcher3/popup/c;
.super Lcom/android/launcher3/a;
.source "ArrowPopup.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Lcom/android/launcher3/a;"
    }
.end annotation


# static fields
.field private static final CLOSE_CHILD_FADE_DURATION_U:I = 0x53

.field private static final CLOSE_CHILD_FADE_START_DELAY_U:I = 0x96

.field private static final CLOSE_DURATION_U:I = 0xe9

.field private static final CLOSE_FADE_DURATION_U:I = 0x53

.field private static final CLOSE_FADE_START_DELAY_U:I = 0x96

.field private static final OPEN_CHILD_FADE_DURATION_U:I = 0x53

.field private static final OPEN_CHILD_FADE_START_DELAY_U:I = 0x0

.field private static final OPEN_DURATION_U:I = 0xc8

.field private static final OPEN_FADE_DURATION_U:I = 0x53

.field private static final OPEN_FADE_START_DELAY_U:I = 0x0

.field private static final OPEN_OVERSHOOT_DURATION_U:I = 0xc8


# instance fields
.field protected final mActivityContext:Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected final mArrow:Landroid/view/View;

.field protected mArrowColor:I

.field protected final mArrowHeight:I

.field protected final mArrowOffsetHorizontal:I

.field protected final mArrowOffsetVertical:I

.field protected final mArrowPointRadius:I

.field protected final mArrowWidth:I

.field protected final mChildContainerMargin:I

.field protected mCloseChildFadeDuration:I

.field protected mCloseChildFadeStartDelay:I

.field protected mCloseDuration:I

.field protected mCloseFadeDuration:I

.field protected mCloseFadeStartDelay:I

.field protected final mColors:[I

.field protected mDeferContainerRemoval:Z

.field protected final mElevation:F

.field private final mEndRect:Landroid/graphics/Rect;

.field protected mGravity:I

.field private mIcon:Landroid/view/View;

.field protected final mInflater:Landroid/view/LayoutInflater;

.field protected mIsAboveIcon:Z

.field protected mIsArrowRotated:Z

.field protected mIsLeftAligned:Z

.field protected final mIsRtl:Z

.field private final mIterateChildrenTag:Ljava/lang/String;

.field private mOnCloseCallbacks:Lcom/android/launcher3/util/Y1;

.field protected mOpenChildFadeDuration:I

.field protected mOpenChildFadeStartDelay:I

.field protected mOpenCloseAnimator:Landroid/animation/AnimatorSet;

.field protected mOpenDuration:I

.field protected mOpenFadeDuration:I

.field protected mOpenFadeStartDelay:I

.field protected final mOutlineRadius:F

.field private final mRoundedBottom:Landroid/graphics/drawable/GradientDrawable;

.field private final mRoundedTop:Landroid/graphics/drawable/GradientDrawable;

.field private final mStartRect:Landroid/graphics/Rect;

.field protected final mStreamerBg:Landroid/view/View;

.field protected final mTempRect:Landroid/graphics/Rect;

.field protected shouldScaleArrow:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 50
    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher3/popup/c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 49
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/popup/c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 12

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 p2, 0x114

    .line 2
    iput p2, p0, Lcom/android/launcher3/popup/c;->mOpenDuration:I

    const/4 p2, 0x0

    .line 3
    iput p2, p0, Lcom/android/launcher3/popup/c;->mOpenFadeStartDelay:I

    const/16 p3, 0x26

    .line 4
    iput p3, p0, Lcom/android/launcher3/popup/c;->mOpenFadeDuration:I

    .line 5
    iput p3, p0, Lcom/android/launcher3/popup/c;->mOpenChildFadeStartDelay:I

    const/16 p3, 0x4c

    .line 6
    iput p3, p0, Lcom/android/launcher3/popup/c;->mOpenChildFadeDuration:I

    const/16 p3, 0xc8

    .line 7
    iput p3, p0, Lcom/android/launcher3/popup/c;->mCloseDuration:I

    const/16 p3, 0x8c

    .line 8
    iput p3, p0, Lcom/android/launcher3/popup/c;->mCloseFadeStartDelay:I

    const/16 v0, 0x32

    .line 9
    iput v0, p0, Lcom/android/launcher3/popup/c;->mCloseFadeDuration:I

    .line 10
    iput p2, p0, Lcom/android/launcher3/popup/c;->mCloseChildFadeStartDelay:I

    .line 11
    iput p3, p0, Lcom/android/launcher3/popup/c;->mCloseChildFadeDuration:I

    .line 12
    new-instance p3, Landroid/graphics/Rect;

    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/popup/c;->mTempRect:Landroid/graphics/Rect;

    .line 13
    iput-boolean p2, p0, Lcom/android/launcher3/popup/c;->shouldScaleArrow:Z

    .line 14
    iput-boolean p2, p0, Lcom/android/launcher3/popup/c;->mIsArrowRotated:Z

    .line 15
    new-instance p3, Lcom/android/launcher3/util/Y1;

    invoke-direct {p3}, Lcom/android/launcher3/util/Y1;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/popup/c;->mOnCloseCallbacks:Lcom/android/launcher3/util/Y1;

    .line 16
    new-instance p3, Landroid/graphics/Rect;

    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/popup/c;->mStartRect:Landroid/graphics/Rect;

    .line 17
    new-instance p3, Landroid/graphics/Rect;

    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/popup/c;->mEndRect:Landroid/graphics/Rect;

    .line 18
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p3

    iput-object p3, p0, Lcom/android/launcher3/popup/c;->mInflater:Landroid/view/LayoutInflater;

    .line 19
    invoke-static {p1}, Lcom/android/launcher3/util/F2;->k(Landroid/content/Context;)F

    move-result p3

    iput p3, p0, Lcom/android/launcher3/popup/c;->mOutlineRadius:F

    .line 20
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 21
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/launcher3/popup/c;->mIsRtl:Z

    .line 22
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070269

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    iput v1, p0, Lcom/android/launcher3/popup/c;->mElevation:F

    .line 23
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f040555

    .line 24
    invoke-static {p1, v2}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    move-result v3

    iput v3, p0, Lcom/android/launcher3/popup/c;->mArrowColor:I

    const v3, 0x7f0709e7

    .line 25
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/android/launcher3/popup/c;->mChildContainerMargin:I

    const v3, 0x7f0709e4

    .line 26
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/android/launcher3/popup/c;->mArrowWidth:I

    const v4, 0x7f0709dd

    .line 27
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    iput v4, p0, Lcom/android/launcher3/popup/c;->mArrowHeight:I

    .line 28
    new-instance v5, Landroid/view/View;

    invoke-direct {v5, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 29
    new-instance v6, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    invoke-direct {v6, v3, v4}, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const v5, 0x7f0709e3

    .line 30
    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    iput v5, p0, Lcom/android/launcher3/popup/c;->mArrowOffsetVertical:I

    const v5, 0x7f0709e0

    .line 31
    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    const/4 v6, 0x2

    div-int/lit8 v7, v3, 0x2

    sub-int/2addr v5, v7

    iput v5, p0, Lcom/android/launcher3/popup/c;->mArrowOffsetHorizontal:I

    const v5, 0x7f0709dc

    .line 32
    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    iput v5, p0, Lcom/android/launcher3/popup/c;->mArrowPointRadius:I

    .line 33
    new-instance v5, Landroid/view/View;

    invoke-direct {v5, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 34
    new-instance v7, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    invoke-direct {v7, v3, v4}, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const v3, 0x7f0709eb

    .line 35
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 36
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    iput-object v3, p0, Lcom/android/launcher3/popup/c;->mRoundedTop:Landroid/graphics/drawable/GradientDrawable;

    .line 37
    invoke-static {p1, v2}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    move-result p1

    .line 38
    invoke-virtual {v3, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    int-to-float v1, v1

    const/16 v2, 0x8

    .line 39
    new-array v4, v2, [F

    aput p3, v4, p2

    const/4 v5, 0x1

    aput p3, v4, v5

    aput p3, v4, v6

    const/4 v7, 0x3

    aput p3, v4, v7

    const/4 v8, 0x4

    aput v1, v4, v8

    const/4 v9, 0x5

    aput v1, v4, v9

    const/4 v10, 0x6

    aput v1, v4, v10

    const/4 v11, 0x7

    aput v1, v4, v11

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 40
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    iput-object v3, p0, Lcom/android/launcher3/popup/c;->mRoundedBottom:Landroid/graphics/drawable/GradientDrawable;

    .line 41
    invoke-virtual {v3, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 42
    new-array p1, v2, [F

    aput v1, p1, p2

    aput v1, p1, v5

    aput v1, p1, v6

    aput v1, p1, v7

    aput p3, p1, v8

    aput p3, p1, v9

    aput p3, p1, v10

    aput p3, p1, v11

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 43
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f140301

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/popup/c;->mIterateChildrenTag:Ljava/lang/String;

    .line 44
    check-cast v0, Lcom/android/launcher3/views/k;

    invoke-interface {v0}, Lcom/android/launcher3/views/k;->canUseMultipleShadesForPopup()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 45
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f06070d

    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    move-result p1

    .line 46
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    const p3, 0x7f060710

    invoke-virtual {p2, p3}, Landroid/content/Context;->getColor(I)I

    move-result p2

    .line 47
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p3

    const v0, 0x7f060713

    invoke-virtual {p3, v0}, Landroid/content/Context;->getColor(I)I

    move-result p3

    filled-new-array {p1, p2, p3}, [I

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/popup/c;->mColors:[I

    return-void

    .line 48
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f06045c

    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    move-result p1

    filled-new-array {p1}, [I

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/popup/c;->mColors:[I

    return-void
.end method

.method public static synthetic N(Lcom/android/launcher3/popup/c;Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/popup/c;->lambda$animateOpen_mfv$0(Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O(Lcom/android/launcher3/popup/c;Landroid/animation/Animator;Landroid/animation/Animator;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/popup/c;->lambda$animateClose_mfv$1(Landroid/animation/Animator;Landroid/animation/Animator;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic access$000(Lcom/android/launcher3/popup/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/a;->announceAccessibilityChanges()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic access$100(Lcom/android/launcher3/popup/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/a;->announceAccessibilityChanges()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private animateOpen_mfv()V
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 6
    .line 7
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    const v3, 0x7f0c0057

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    int-to-long v3, v3

    .line 22
    const v5, 0x7f0c0056

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getInteger(I)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    int-to-long v5, v2

    .line 30
    sget-object v2, Lcom/android/launcher3/anim/L;->n:Landroid/view/animation/Interpolator;

    .line 31
    .line 32
    iget-object v7, p0, Lcom/android/launcher3/popup/c;->mEndRect:Landroid/graphics/Rect;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 35
    .line 36
    .line 37
    move-result v8

    .line 38
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 39
    .line 40
    .line 41
    move-result v9

    .line 42
    invoke-virtual {v7, v0, v0, v8, v9}, Landroid/graphics/Rect;->set(IIII)V

    .line 43
    .line 44
    .line 45
    invoke-direct {p0}, Lcom/android/launcher3/popup/c;->createOpenCloseOutlineProvider()Lcom/android/launcher3/anim/d0;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    invoke-virtual {v7, p0, v0}, Lcom/android/launcher3/anim/c0;->b(Landroid/view/View;Z)Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    invoke-virtual {v7, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v7, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v7}, Landroid/animation/ValueAnimator;->start()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v7}, Landroid/animation/ValueAnimator;->pause()V

    .line 63
    .line 64
    .line 65
    const/4 v8, 0x0

    .line 66
    const/high16 v9, 0x3f800000    # 1.0f

    .line 67
    .line 68
    const/4 v10, 0x2

    .line 69
    new-array v11, v10, [F

    .line 70
    .line 71
    fill-array-data v11, :array_0

    .line 72
    .line 73
    .line 74
    invoke-static {v11}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 75
    .line 76
    .line 77
    move-result-object v11

    .line 78
    add-long/2addr v3, v5

    .line 79
    invoke-virtual {v11, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v11, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 83
    .line 84
    .line 85
    new-instance v2, Lcom/android/launcher3/popup/a;

    .line 86
    .line 87
    invoke-direct {v2, p0, v7}, Lcom/android/launcher3/popup/a;-><init>(Lcom/android/launcher3/popup/c;Landroid/animation/ValueAnimator;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v11, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v11}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 94
    .line 95
    .line 96
    iget-object v2, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 97
    .line 98
    invoke-virtual {v2, v8}, Landroid/view/View;->setScaleX(F)V

    .line 99
    .line 100
    .line 101
    iget-object v2, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 102
    .line 103
    invoke-virtual {v2, v8}, Landroid/view/View;->setScaleY(F)V

    .line 104
    .line 105
    .line 106
    iget-object v2, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 107
    .line 108
    sget-object v3, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 109
    .line 110
    const/4 v4, 0x1

    .line 111
    new-array v11, v4, [F

    .line 112
    .line 113
    aput v9, v11, v0

    .line 114
    .line 115
    invoke-static {v2, v3, v11}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-virtual {v2, v5, v6}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    iget-object v11, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 124
    .line 125
    invoke-virtual {v11, v8}, Landroid/view/View;->setScaleX(F)V

    .line 126
    .line 127
    .line 128
    iget-object v11, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 129
    .line 130
    invoke-virtual {v11, v8}, Landroid/view/View;->setScaleY(F)V

    .line 131
    .line 132
    .line 133
    iget-object v8, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 134
    .line 135
    new-array v11, v4, [F

    .line 136
    .line 137
    aput v9, v11, v0

    .line 138
    .line 139
    invoke-static {v8, v3, v11}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    invoke-virtual {v3, v5, v6}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    new-instance v5, Lcom/android/launcher3/popup/c$c;

    .line 148
    .line 149
    invoke-direct {v5, p0}, Lcom/android/launcher3/popup/c$c;-><init>(Lcom/android/launcher3/popup/c;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v1, v5}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 153
    .line 154
    .line 155
    iput-object v1, p0, Lcom/android/launcher3/popup/c;->mOpenCloseAnimator:Landroid/animation/AnimatorSet;

    .line 156
    .line 157
    new-array p0, v10, [Landroid/animation/Animator;

    .line 158
    .line 159
    aput-object v2, p0, v0

    .line 160
    .line 161
    aput-object v7, p0, v4

    .line 162
    .line 163
    invoke-virtual {v1, p0}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 164
    .line 165
    .line 166
    new-array p0, v10, [Landroid/animation/Animator;

    .line 167
    .line 168
    aput-object v3, p0, v0

    .line 169
    .line 170
    aput-object v7, p0, v4

    .line 171
    .line 172
    invoke-virtual {v1, p0}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 176
    .line 177
    .line 178
    return-void

    .line 179
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private createOpenCloseOutlineProvider()Lcom/android/launcher3/anim/d0;
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v1, p0, Lcom/android/launcher3/popup/c;->mIsLeftAligned:Z

    .line 6
    .line 7
    iget-boolean v2, p0, Lcom/android/launcher3/popup/c;->mIsRtl:Z

    .line 8
    .line 9
    xor-int/2addr v1, v2

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const v1, 0x7f0709e1

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const v1, 0x7f0709df

    .line 17
    .line 18
    .line 19
    :goto_0
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const v2, 0x7f0709e4

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    div-int/lit8 v2, v2, 0x2

    .line 31
    .line 32
    const v3, 0x7f0709dc

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget-boolean v3, p0, Lcom/android/launcher3/popup/c;->mIsLeftAligned:Z

    .line 40
    .line 41
    if-nez v3, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    sub-int v1, v3, v1

    .line 48
    .line 49
    :cond_1
    iget-boolean v3, p0, Lcom/android/launcher3/popup/c;->mIsAboveIcon:Z

    .line 50
    .line 51
    const/4 v4, 0x0

    .line 52
    if-eqz v3, :cond_2

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    goto :goto_1

    .line 59
    :cond_2
    move v3, v4

    .line 60
    :goto_1
    iget-object v5, p0, Lcom/android/launcher3/popup/c;->mStartRect:Landroid/graphics/Rect;

    .line 61
    .line 62
    sub-int v6, v1, v2

    .line 63
    .line 64
    add-int/2addr v1, v2

    .line 65
    invoke-virtual {v5, v6, v3, v1, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lcom/android/launcher3/popup/c;->mEndRect:Landroid/graphics/Rect;

    .line 69
    .line 70
    invoke-virtual {v1}, Landroid/graphics/Rect;->isEmpty()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_3

    .line 75
    .line 76
    iget-object v1, p0, Lcom/android/launcher3/popup/c;->mEndRect:Landroid/graphics/Rect;

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 87
    .line 88
    .line 89
    :cond_3
    new-instance v1, Lcom/android/launcher3/anim/d0;

    .line 90
    .line 91
    iget v2, p0, Lcom/android/launcher3/popup/c;->mOutlineRadius:F

    .line 92
    .line 93
    iget-object v3, p0, Lcom/android/launcher3/popup/c;->mStartRect:Landroid/graphics/Rect;

    .line 94
    .line 95
    iget-object p0, p0, Lcom/android/launcher3/popup/c;->mEndRect:Landroid/graphics/Rect;

    .line 96
    .line 97
    invoke-direct {v1, v0, v2, v3, p0}, Lcom/android/launcher3/anim/d0;-><init>(FFLandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 98
    .line 99
    .line 100
    return-object v1
.end method

.method private fadeInChildViews(Landroid/view/ViewGroup;[FJJLandroid/animation/AnimatorSet;)V
    .locals 10

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    move v8, v0

    .line 8
    :goto_0
    if-ltz v8, :cond_2

    .line 9
    .line 10
    invoke-virtual {p1, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    instance-of v1, v0, Landroid/view/ViewGroup;

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/android/launcher3/popup/c;->isShortcutContainer(Landroid/view/View;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    check-cast v0, Landroid/view/ViewGroup;

    .line 31
    .line 32
    move-object v2, p2

    .line 33
    move-wide v3, p3

    .line 34
    move-wide v5, p5

    .line 35
    move-object/from16 v7, p7

    .line 36
    .line 37
    move-object v1, v0

    .line 38
    move-object v0, p0

    .line 39
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/popup/c;->fadeInChildViews(Landroid/view/ViewGroup;[FJJLandroid/animation/AnimatorSet;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    move-wide v6, p5

    .line 43
    move-object/from16 v9, p7

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_1
    check-cast v0, Landroid/view/ViewGroup;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    add-int/lit8 v1, v1, -0x1

    .line 53
    .line 54
    :goto_1
    if-ltz v1, :cond_0

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    const/4 v4, 0x0

    .line 61
    aget v4, p2, v4

    .line 62
    .line 63
    invoke-virtual {v3, v4}, Landroid/view/View;->setAlpha(F)V

    .line 64
    .line 65
    .line 66
    sget-object v4, Landroid/widget/LinearLayout;->ALPHA:Landroid/util/Property;

    .line 67
    .line 68
    invoke-static {v3, v4, p2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-virtual {v3, p3, p4}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 73
    .line 74
    .line 75
    move-wide v6, p5

    .line 76
    invoke-virtual {v3, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 77
    .line 78
    .line 79
    sget-object v9, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 80
    .line 81
    invoke-virtual {v3, v9}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 82
    .line 83
    .line 84
    move-object/from16 v9, p7

    .line 85
    .line 86
    invoke-virtual {v9, v3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 87
    .line 88
    .line 89
    add-int/lit8 v1, v1, -0x1

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :goto_2
    add-int/lit8 v8, v8, -0x1

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    return-void
.end method

.method private varargs getAnimatorOfFloat(Landroid/view/View;Landroid/util/Property;IILandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;II",
            "Landroid/view/animation/Interpolator;",
            "[F)",
            "Landroid/animation/Animator;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    int-to-long p1, p3

    .line 6
    invoke-virtual {p0, p1, p2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p5}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 10
    .line 11
    .line 12
    int-to-long p1, p4

    .line 13
    invoke-virtual {p0, p1, p2}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method private getArrowLeft()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/popup/c;->mIsLeftAligned:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/popup/c;->mArrowOffsetHorizontal:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget v1, p0, Lcom/android/launcher3/popup/c;->mArrowOffsetHorizontal:I

    .line 13
    .line 14
    sub-int/2addr v0, v1

    .line 15
    iget p0, p0, Lcom/android/launcher3/popup/c;->mArrowWidth:I

    .line 16
    .line 17
    sub-int/2addr v0, p0

    .line 18
    return v0
.end method

.method private synthetic lambda$animateClose_mfv$1(Landroid/animation/Animator;Landroid/animation/Animator;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    check-cast p3, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {v0, p3}, Landroid/view/View;->setAlpha(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/animation/Animator;->isStarted()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/4 v0, 0x0

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    move p1, v0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move p1, p3

    .line 26
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 30
    .line 31
    invoke-virtual {p1, p3}, Landroid/view/View;->setAlpha(F)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2}, Landroid/animation/Animator;->isStarted()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    move p3, v0

    .line 41
    :cond_1
    invoke-virtual {p0, p3}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private synthetic lambda$animateOpen_mfv$0(Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {v0, p2}, Landroid/view/View;->setAlpha(F)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {v0, p2}, Landroid/view/View;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isStarted()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p2, 0x0

    .line 29
    :goto_0
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private orientAboutObject(ZZ)V
    .locals 16

    move-object/from16 v0, p0

    const/4 v1, 0x0

    .line 2
    invoke-virtual {v0, v1, v1}, Landroid/widget/LinearLayout;->measure(II)V

    .line 3
    iget v2, v0, Lcom/android/launcher3/popup/c;->mArrowHeight:I

    iget v3, v0, Lcom/android/launcher3/popup/c;->mArrowOffsetVertical:I

    add-int/2addr v2, v3

    invoke-virtual {v0}, Lcom/android/launcher3/popup/c;->getExtraVerticalOffset()I

    move-result v3

    add-int/2addr v2, v3

    .line 4
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    move v5, v1

    :goto_0
    if-ltz v3, :cond_1

    .line 5
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-nez v6, :cond_0

    add-int/lit8 v5, v5, 0x1

    :cond_0
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    :cond_1
    sub-int/2addr v5, v4

    .line 6
    iget v3, v0, Lcom/android/launcher3/popup/c;->mChildContainerMargin:I

    mul-int/2addr v5, v3

    .line 7
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result v3

    add-int/2addr v3, v2

    add-int/2addr v3, v5

    .line 8
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result v5

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    move-result v6

    add-int/2addr v5, v6

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getPaddingRight()I

    move-result v6

    add-int/2addr v5, v6

    .line 9
    iget-object v6, v0, Lcom/android/launcher3/popup/c;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v6}, Lcom/android/launcher3/popup/c;->getTargetObjectLocation(Landroid/graphics/Rect;)V

    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    move-result-object v6

    .line 11
    invoke-virtual {v6}, Lcom/android/launcher3/h1;->getInsets()Landroid/graphics/Rect;

    move-result-object v7

    .line 12
    iget-object v8, v0, Lcom/android/launcher3/popup/c;->mTempRect:Landroid/graphics/Rect;

    iget v9, v8, Landroid/graphics/Rect;->left:I

    .line 13
    iget v10, v8, Landroid/graphics/Rect;->right:I

    sub-int/2addr v10, v5

    .line 14
    iget-boolean v11, v0, Lcom/android/launcher3/popup/c;->mIsRtl:Z

    if-nez v11, :cond_2

    move/from16 v11, p1

    goto :goto_1

    :cond_2
    if-nez p2, :cond_3

    move v11, v4

    goto :goto_1

    :cond_3
    move v11, v1

    :goto_1
    iput-boolean v11, v0, Lcom/android/launcher3/popup/c;->mIsLeftAligned:Z

    if-eqz v11, :cond_4

    move v11, v9

    goto :goto_2

    :cond_4
    move v11, v10

    .line 15
    :goto_2
    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v8

    .line 16
    div-int/lit8 v12, v8, 0x2

    iget v13, v0, Lcom/android/launcher3/popup/c;->mArrowOffsetHorizontal:I

    sub-int/2addr v12, v13

    iget v13, v0, Lcom/android/launcher3/popup/c;->mArrowWidth:I

    div-int/lit8 v13, v13, 0x2

    sub-int/2addr v12, v13

    .line 17
    iget-boolean v13, v0, Lcom/android/launcher3/popup/c;->mIsLeftAligned:Z

    if-eqz v13, :cond_5

    goto :goto_3

    :cond_5
    neg-int v12, v12

    :goto_3
    add-int/2addr v11, v12

    if-nez p1, :cond_6

    if-nez p2, :cond_6

    goto :goto_6

    :cond_6
    add-int v12, v11, v5

    .line 18
    iget v13, v7, Landroid/graphics/Rect;->left:I

    add-int/2addr v12, v13

    .line 19
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v13

    iget v14, v7, Landroid/graphics/Rect;->right:I

    sub-int/2addr v13, v14

    if-ge v12, v13, :cond_7

    move v12, v4

    goto :goto_4

    :cond_7
    move v12, v1

    .line 20
    :goto_4
    iget v13, v7, Landroid/graphics/Rect;->left:I

    if-le v11, v13, :cond_8

    move v13, v4

    goto :goto_5

    :cond_8
    move v13, v1

    .line 21
    :goto_5
    iget-boolean v14, v0, Lcom/android/launcher3/popup/c;->mIsLeftAligned:Z

    if-eqz v14, :cond_9

    if-nez v12, :cond_a

    :cond_9
    if-nez v14, :cond_14

    if-eqz v13, :cond_14

    .line 22
    :cond_a
    :goto_6
    iget-object v12, v0, Lcom/android/launcher3/popup/c;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v12}, Landroid/graphics/Rect;->height()I

    move-result v12

    .line 23
    iget-object v13, v0, Lcom/android/launcher3/popup/c;->mIcon:Landroid/view/View;

    instance-of v14, v13, Lcom/android/launcher3/widget/T;

    if-eqz v14, :cond_b

    check-cast v13, Lcom/android/launcher3/widget/T;

    invoke-virtual {v13}, Lcom/android/launcher3/widget/h;->u()Z

    move-result v13

    if-eqz v13, :cond_b

    .line 24
    sget-object v13, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    iget-object v14, v0, Lcom/android/launcher3/popup/c;->mIcon:Landroid/view/View;

    invoke-virtual {v14}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/android/launcher3/F1;

    .line 25
    iget-object v14, v0, Lcom/android/launcher3/popup/c;->mIcon:Landroid/view/View;

    invoke-virtual {v14}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    move-result-object v14

    iget v14, v14, Lcom/android/launcher3/X3;->o0:I

    sub-int/2addr v12, v14

    iget-object v14, v0, Lcom/android/launcher3/popup/c;->mIcon:Landroid/view/View;

    .line 26
    invoke-virtual {v14}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    move-result-object v13

    iget v13, v13, Lcom/android/launcher3/X3;->p0:I

    add-int/2addr v12, v13

    .line 27
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    const v14, 0x7f070bda

    invoke-virtual {v13, v14}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v13

    add-int/2addr v12, v13

    .line 28
    :cond_b
    iget-object v13, v0, Lcom/android/launcher3/popup/c;->mTempRect:Landroid/graphics/Rect;

    iget v13, v13, Landroid/graphics/Rect;->top:I

    sub-int/2addr v13, v3

    .line 29
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getTop()I

    move-result v14

    iget v15, v7, Landroid/graphics/Rect;->top:I

    add-int/2addr v14, v15

    if-le v13, v14, :cond_c

    move v14, v4

    goto :goto_7

    :cond_c
    move v14, v1

    :goto_7
    iput-boolean v14, v0, Lcom/android/launcher3/popup/c;->mIsAboveIcon:Z

    if-nez v14, :cond_d

    .line 30
    iget-object v13, v0, Lcom/android/launcher3/popup/c;->mTempRect:Landroid/graphics/Rect;

    iget v13, v13, Landroid/graphics/Rect;->top:I

    add-int/2addr v13, v12

    add-int/2addr v13, v2

    sub-int/2addr v3, v2

    .line 31
    :cond_d
    iget v2, v7, Landroid/graphics/Rect;->left:I

    sub-int/2addr v11, v2

    sub-int/2addr v13, v15

    .line 32
    iput v1, v0, Lcom/android/launcher3/popup/c;->mGravity:I

    add-int/2addr v15, v13

    add-int/2addr v15, v3

    .line 33
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getBottom()I

    move-result v2

    iget v3, v7, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v2, v3

    if-le v15, v2, :cond_11

    const/16 v2, 0x10

    .line 34
    iput v2, v0, Lcom/android/launcher3/popup/c;->mGravity:I

    add-int/2addr v9, v8

    .line 35
    iget v2, v7, Landroid/graphics/Rect;->left:I

    sub-int/2addr v9, v2

    sub-int/2addr v10, v8

    sub-int/2addr v10, v2

    .line 36
    iget-boolean v2, v0, Lcom/android/launcher3/popup/c;->mIsRtl:Z

    if-nez v2, :cond_f

    add-int/2addr v5, v9

    .line 37
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getRight()I

    move-result v2

    if-ge v5, v2, :cond_e

    .line 38
    iput-boolean v4, v0, Lcom/android/launcher3/popup/c;->mIsLeftAligned:Z

    goto :goto_9

    .line 39
    :cond_e
    iput-boolean v1, v0, Lcom/android/launcher3/popup/c;->mIsLeftAligned:Z

    goto :goto_8

    .line 40
    :cond_f
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getLeft()I

    move-result v2

    if-le v10, v2, :cond_10

    .line 41
    iput-boolean v1, v0, Lcom/android/launcher3/popup/c;->mIsLeftAligned:Z

    :goto_8
    move v11, v10

    goto :goto_a

    .line 42
    :cond_10
    iput-boolean v4, v0, Lcom/android/launcher3/popup/c;->mIsLeftAligned:Z

    :goto_9
    move v11, v9

    .line 43
    :goto_a
    iput-boolean v4, v0, Lcom/android/launcher3/popup/c;->mIsAboveIcon:Z

    :cond_11
    int-to-float v1, v11

    .line 44
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setX(F)V

    .line 45
    iget v1, v0, Lcom/android/launcher3/popup/c;->mGravity:I

    invoke-static {v1}, Landroid/view/Gravity;->isVertical(I)Z

    move-result v1

    if-eqz v1, :cond_12

    return-void

    .line 46
    :cond_12
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 47
    iget-object v2, v0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 48
    iget-boolean v3, v0, Lcom/android/launcher3/popup/c;->mIsAboveIcon:Z

    const/16 v4, 0x30

    if-eqz v3, :cond_13

    const/16 v3, 0x50

    .line 49
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 50
    invoke-virtual {v0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v3

    sub-int/2addr v3, v13

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result v5

    sub-int/2addr v3, v5

    iget v5, v7, Landroid/graphics/Rect;->top:I

    sub-int/2addr v3, v5

    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 51
    iget v1, v2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    sub-int/2addr v3, v1

    iget v1, v0, Lcom/android/launcher3/popup/c;->mArrowOffsetVertical:I

    sub-int/2addr v3, v1

    iget v1, v7, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v3, v1

    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    goto :goto_b

    .line 52
    :cond_13
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iput v4, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 53
    iget v3, v7, Landroid/graphics/Rect;->top:I

    add-int/2addr v13, v3

    iput v13, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    sub-int/2addr v13, v3

    .line 54
    iget v1, v2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    sub-int/2addr v13, v1

    iget v1, v0, Lcom/android/launcher3/popup/c;->mArrowOffsetVertical:I

    sub-int/2addr v13, v1

    iput v13, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 55
    :goto_b
    iget-object v1, v0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 56
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 57
    iget-object v2, v0, Lcom/android/launcher3/popup/c;->mTempRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    iget v3, v7, Landroid/graphics/Rect;->top:I

    sub-int/2addr v2, v3

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f070c11

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sub-int/2addr v2, v0

    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    return-void

    :cond_14
    if-eqz p1, :cond_15

    if-nez v14, :cond_15

    move v2, v4

    goto :goto_c

    :cond_15
    move v2, v1

    :goto_c
    if-eqz p2, :cond_16

    if-eqz v14, :cond_16

    move v1, v4

    .line 58
    :cond_16
    invoke-direct {v0, v2, v1}, Lcom/android/launcher3/popup/c;->orientAboutObject(ZZ)V

    return-void
.end method


# virtual methods
.method protected addArrow()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getX()F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-direct {p0}, Lcom/android/launcher3/popup/c;->getArrowLeft()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    int-to-float v2, v2

    .line 21
    add-float/2addr v1, v2

    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setX(F)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object v2, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 39
    .line 40
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 45
    .line 46
    const v2, 0x7f070c11

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    iget-object v3, p0, Lcom/android/launcher3/popup/c;->mTempRect:Landroid/graphics/Rect;

    .line 54
    .line 55
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    mul-int/lit8 v4, v2, 0x2

    .line 60
    .line 61
    add-int/2addr v3, v4

    .line 62
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 63
    .line 64
    iget-object v3, p0, Lcom/android/launcher3/popup/c;->mTempRect:Landroid/graphics/Rect;

    .line 65
    .line 66
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    add-int/2addr v3, v4

    .line 71
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 72
    .line 73
    iget-object v3, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 74
    .line 75
    iget-object v4, p0, Lcom/android/launcher3/popup/c;->mTempRect:Landroid/graphics/Rect;

    .line 76
    .line 77
    iget v4, v4, Landroid/graphics/Rect;->left:I

    .line 78
    .line 79
    sub-int/2addr v4, v2

    .line 80
    int-to-float v2, v4

    .line 81
    invoke-virtual {v3, v2}, Landroid/view/View;->setX(F)V

    .line 82
    .line 83
    .line 84
    iget-object v2, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 85
    .line 86
    iget-object v3, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 87
    .line 88
    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    invoke-static {v4}, Lx1/O;->z1(Landroid/content/Context;)Z

    .line 97
    .line 98
    .line 99
    move-result v4

    .line 100
    if-eqz v4, :cond_0

    .line 101
    .line 102
    const-string v4, "transform_icon_resize_frame_dark"

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_0
    const-string v4, "transform_icon_resize_frame"

    .line 106
    .line 107
    :goto_0
    invoke-static {v3, v4}, Lf1/d;->f(Landroid/content/Context;Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 112
    .line 113
    .line 114
    iget-object v2, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 115
    .line 116
    new-instance v3, Landroid/graphics/Rect;

    .line 117
    .line 118
    iget v4, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 119
    .line 120
    iget v1, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 121
    .line 122
    const/4 v5, 0x0

    .line 123
    invoke-direct {v3, v5, v5, v4, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v2, v3}, Landroid/view/View;->setClipBounds(Landroid/graphics/Rect;)V

    .line 127
    .line 128
    .line 129
    iget-object v1, p0, Lcom/android/launcher3/popup/c;->mIcon:Landroid/view/View;

    .line 130
    .line 131
    const/4 v2, 0x4

    .line 132
    if-eqz v1, :cond_5

    .line 133
    .line 134
    instance-of v3, v1, Lcom/android/launcher3/widget/T;

    .line 135
    .line 136
    if-eqz v3, :cond_1

    .line 137
    .line 138
    check-cast v1, Lcom/android/launcher3/widget/T;

    .line 139
    .line 140
    invoke-virtual {v1}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 144
    .line 145
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 146
    .line 147
    .line 148
    goto :goto_1

    .line 149
    :cond_1
    instance-of v3, v1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 150
    .line 151
    if-eqz v3, :cond_2

    .line 152
    .line 153
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 154
    .line 155
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 156
    .line 157
    .line 158
    goto :goto_1

    .line 159
    :cond_2
    instance-of v3, v1, Lcom/android/launcher3/BubbleTextView;

    .line 160
    .line 161
    if-eqz v3, :cond_4

    .line 162
    .line 163
    check-cast v1, Lcom/android/launcher3/BubbleTextView;

    .line 164
    .line 165
    invoke-virtual {v1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    if-eqz v3, :cond_3

    .line 170
    .line 171
    invoke-virtual {v1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 176
    .line 177
    iget v1, v1, Lcom/android/launcher3/model/data/y;->container:I

    .line 178
    .line 179
    if-lez v1, :cond_3

    .line 180
    .line 181
    iget-object v1, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 182
    .line 183
    const v3, 0x7f070aa0

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    invoke-virtual {v1, v0}, Landroid/view/View;->setElevation(F)V

    .line 191
    .line 192
    .line 193
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 194
    .line 195
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 196
    .line 197
    .line 198
    goto :goto_1

    .line 199
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 200
    .line 201
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 202
    .line 203
    .line 204
    goto :goto_1

    .line 205
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 206
    .line 207
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 208
    .line 209
    .line 210
    :goto_1
    iget v0, p0, Lcom/android/launcher3/popup/c;->mGravity:I

    .line 211
    .line 212
    invoke-static {v0}, Landroid/view/Gravity;->isVertical(I)Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-eqz v0, :cond_6

    .line 217
    .line 218
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 219
    .line 220
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 221
    .line 222
    .line 223
    goto :goto_2

    .line 224
    :cond_6
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->updateArrowColor()V

    .line 225
    .line 226
    .line 227
    :goto_2
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 228
    .line 229
    iget v1, p0, Lcom/android/launcher3/popup/c;->mArrowWidth:I

    .line 230
    .line 231
    int-to-float v1, v1

    .line 232
    const/high16 v2, 0x40000000    # 2.0f

    .line 233
    .line 234
    div-float/2addr v1, v2

    .line 235
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 236
    .line 237
    .line 238
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 239
    .line 240
    iget-boolean v1, p0, Lcom/android/launcher3/popup/c;->mIsAboveIcon:Z

    .line 241
    .line 242
    if-eqz v1, :cond_7

    .line 243
    .line 244
    iget p0, p0, Lcom/android/launcher3/popup/c;->mArrowHeight:I

    .line 245
    .line 246
    int-to-float p0, p0

    .line 247
    goto :goto_3

    .line 248
    :cond_7
    const/4 p0, 0x0

    .line 249
    :goto_3
    invoke-virtual {v0, p0}, Landroid/view/View;->setPivotY(F)V

    .line 250
    .line 251
    .line 252
    return-void
.end method

.method public addOnCloseCallback(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/popup/c;->mOnCloseCallbacks:Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected animateClose()V
    .locals 9

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mOpenCloseAnimator:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 11
    .line 12
    .line 13
    :cond_1
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 15
    .line 16
    const/16 v7, 0x53

    .line 17
    .line 18
    sget-object v8, LJ0/h;->c:Landroid/view/animation/Interpolator;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    const/16 v3, 0xe9

    .line 22
    .line 23
    const/16 v4, 0x96

    .line 24
    .line 25
    const/16 v5, 0x53

    .line 26
    .line 27
    const/16 v6, 0x96

    .line 28
    .line 29
    move-object v1, p0

    .line 30
    invoke-virtual/range {v1 .. v8}, Lcom/android/launcher3/popup/c;->getOpenCloseAnimator(ZIIIIILandroid/view/animation/Interpolator;)Landroid/animation/AnimatorSet;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iput-object p0, v1, Lcom/android/launcher3/popup/c;->mOpenCloseAnimator:Landroid/animation/AnimatorSet;

    .line 35
    .line 36
    invoke-virtual {v1, p0}, Lcom/android/launcher3/popup/c;->onCreateCloseAnimation(Landroid/animation/AnimatorSet;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, v1, Lcom/android/launcher3/popup/c;->mOpenCloseAnimator:Landroid/animation/AnimatorSet;

    .line 40
    .line 41
    new-instance v0, Lcom/android/launcher3/popup/c$b;

    .line 42
    .line 43
    invoke-direct {v0, v1}, Lcom/android/launcher3/popup/c$b;-><init>(Lcom/android/launcher3/popup/c;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, v1, Lcom/android/launcher3/popup/c;->mOpenCloseAnimator:Landroid/animation/AnimatorSet;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method protected animateClose_mfv()V
    .locals 14

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    iget-boolean v3, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 5
    .line 6
    if-nez v3, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v3, p0, Lcom/android/launcher3/popup/c;->mEndRect:Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-virtual {v3}, Landroid/graphics/Rect;->setEmpty()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getOutlineProvider()Landroid/view/ViewOutlineProvider;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    instance-of v3, v3, Lcom/android/launcher3/anim/c0;

    .line 19
    .line 20
    if-eqz v3, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getOutlineProvider()Landroid/view/ViewOutlineProvider;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Lcom/android/launcher3/anim/c0;

    .line 27
    .line 28
    iget-object v4, p0, Lcom/android/launcher3/popup/c;->mEndRect:Landroid/graphics/Rect;

    .line 29
    .line 30
    invoke-virtual {v3, v4}, Lcom/android/launcher3/anim/c0;->d(Landroid/graphics/Rect;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object v3, p0, Lcom/android/launcher3/popup/c;->mOpenCloseAnimator:Landroid/animation/AnimatorSet;

    .line 34
    .line 35
    if-eqz v3, :cond_2

    .line 36
    .line 37
    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->cancel()V

    .line 38
    .line 39
    .line 40
    :cond_2
    iput-boolean v2, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 41
    .line 42
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 43
    .line 44
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    sget-object v5, Lcom/android/launcher3/anim/L;->m:Landroid/view/animation/Interpolator;

    .line 52
    .line 53
    const v6, 0x7f0c0057

    .line 54
    .line 55
    .line 56
    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getInteger(I)I

    .line 57
    .line 58
    .line 59
    move-result v6

    .line 60
    int-to-long v6, v6

    .line 61
    const v8, 0x7f0c0056

    .line 62
    .line 63
    .line 64
    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getInteger(I)I

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    int-to-long v8, v4

    .line 69
    iget-object v4, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 70
    .line 71
    sget-object v10, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 72
    .line 73
    const/4 v11, 0x0

    .line 74
    new-array v12, v1, [F

    .line 75
    .line 76
    aput v11, v12, v2

    .line 77
    .line 78
    invoke-static {v4, v10, v12}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    invoke-virtual {v4, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    iget-object v12, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 87
    .line 88
    new-array v13, v1, [F

    .line 89
    .line 90
    aput v11, v13, v2

    .line 91
    .line 92
    invoke-static {v12, v10, v13}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 93
    .line 94
    .line 95
    move-result-object v10

    .line 96
    invoke-virtual {v10, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 97
    .line 98
    .line 99
    move-result-object v10

    .line 100
    invoke-direct {p0}, Lcom/android/launcher3/popup/c;->createOpenCloseOutlineProvider()Lcom/android/launcher3/anim/d0;

    .line 101
    .line 102
    .line 103
    move-result-object v12

    .line 104
    invoke-virtual {v12, p0, v1}, Lcom/android/launcher3/anim/c0;->b(Landroid/view/View;Z)Landroid/animation/ValueAnimator;

    .line 105
    .line 106
    .line 107
    move-result-object v12

    .line 108
    invoke-virtual {v12, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v12, v5}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 112
    .line 113
    .line 114
    new-array v13, v0, [Landroid/animation/Animator;

    .line 115
    .line 116
    aput-object v12, v13, v2

    .line 117
    .line 118
    aput-object v4, v13, v1

    .line 119
    .line 120
    invoke-virtual {v3, v13}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getAlpha()F

    .line 124
    .line 125
    .line 126
    move-result v12

    .line 127
    new-array v0, v0, [F

    .line 128
    .line 129
    aput v12, v0, v2

    .line 130
    .line 131
    aput v11, v0, v1

    .line 132
    .line 133
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    add-long/2addr v6, v8

    .line 138
    invoke-virtual {v0, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0, v5}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 142
    .line 143
    .line 144
    new-instance v1, Lcom/android/launcher3/popup/b;

    .line 145
    .line 146
    invoke-direct {v1, p0, v4, v10}, Lcom/android/launcher3/popup/b;-><init>(Lcom/android/launcher3/popup/c;Landroid/animation/Animator;Landroid/animation/Animator;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v3, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0, v3}, Lcom/android/launcher3/popup/c;->onCreateCloseAnimation(Landroid/animation/AnimatorSet;)V

    .line 156
    .line 157
    .line 158
    new-instance v0, Lcom/android/launcher3/popup/c$d;

    .line 159
    .line 160
    invoke-direct {v0, p0}, Lcom/android/launcher3/popup/c$d;-><init>(Lcom/android/launcher3/popup/c;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v3, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 164
    .line 165
    .line 166
    iput-object v3, p0, Lcom/android/launcher3/popup/c;->mOpenCloseAnimator:Landroid/animation/AnimatorSet;

    .line 167
    .line 168
    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->start()V

    .line 169
    .line 170
    .line 171
    return-void
.end method

.method protected animateOpen()V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    const/16 v7, 0x53

    .line 6
    .line 7
    sget-object v8, LJ0/h;->d:Landroid/view/animation/Interpolator;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    const/16 v3, 0xc8

    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    const/16 v5, 0x53

    .line 14
    .line 15
    const/4 v6, 0x0

    .line 16
    move-object v1, p0

    .line 17
    invoke-virtual/range {v1 .. v8}, Lcom/android/launcher3/popup/c;->getOpenCloseAnimator(ZIIIIILandroid/view/animation/Interpolator;)Landroid/animation/AnimatorSet;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iput-object p0, v1, Lcom/android/launcher3/popup/c;->mOpenCloseAnimator:Landroid/animation/AnimatorSet;

    .line 22
    .line 23
    invoke-virtual {v1, p0}, Lcom/android/launcher3/popup/c;->onCreateOpenAnimation(Landroid/animation/AnimatorSet;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, v1, Lcom/android/launcher3/popup/c;->mOpenCloseAnimator:Landroid/animation/AnimatorSet;

    .line 27
    .line 28
    new-instance v0, Lcom/android/launcher3/popup/c$a;

    .line 29
    .line 30
    invoke-direct {v0, v1}, Lcom/android/launcher3/popup/c$a;-><init>(Lcom/android/launcher3/popup/c;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, v1, Lcom/android/launcher3/popup/c;->mOpenCloseAnimator:Landroid/animation/AnimatorSet;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public assignMarginsAndBackgrounds(Landroid/view/ViewGroup;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/popup/c;->assignMarginsAndBackgrounds(Landroid/view/ViewGroup;I)V

    return-void
.end method

.method protected assignMarginsAndBackgrounds(Landroid/view/ViewGroup;I)V
    .locals 9

    .line 2
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    :goto_0
    if-ge v2, v0, :cond_1

    .line 3
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 4
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {p0, v4}, Lcom/android/launcher3/popup/c;->isShortcutOrWrapper(Landroid/view/View;)Z

    move-result v4

    if-eqz v4, :cond_0

    add-int/lit8 v3, v3, 0x1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 5
    :cond_1
    new-instance v2, Landroid/animation/AnimatorSet;

    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    const/4 v4, 0x0

    move v5, v1

    :goto_1
    if-ge v5, v0, :cond_6

    .line 6
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 7
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v7

    if-nez v7, :cond_5

    if-eqz v4, :cond_2

    .line 8
    invoke-virtual {p0, v4}, Lcom/android/launcher3/popup/c;->isShortcutContainer(Landroid/view/View;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 9
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 10
    iget v8, p0, Lcom/android/launcher3/popup/c;->mChildContainerMargin:I

    iput v8, v7, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 11
    instance-of v8, v6, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    if-eqz v8, :cond_2

    instance-of v4, v4, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    if-eqz v4, :cond_2

    .line 12
    iput v1, v7, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 13
    :cond_2
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 14
    iput v1, v4, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 15
    instance-of v4, v6, Landroid/view/ViewGroup;

    if-eqz v4, :cond_3

    invoke-virtual {p0, v6}, Lcom/android/launcher3/popup/c;->isShortcutContainer(Landroid/view/View;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 16
    move-object v4, v6

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {p0, v4, p2}, Lcom/android/launcher3/popup/c;->assignMarginsAndBackgrounds(Landroid/view/ViewGroup;I)V

    goto :goto_2

    .line 17
    :cond_3
    invoke-virtual {p0, v6}, Lcom/android/launcher3/popup/c;->isShortcutOrWrapper(Landroid/view/View;)Z

    move-result v4

    if-eqz v4, :cond_4

    const/4 v4, 0x1

    :cond_4
    :goto_2
    move-object v4, v6

    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_6
    const-wide/16 p1, 0x0

    .line 18
    invoke-virtual {v2, p1, p2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    move-result-object p1

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 19
    invoke-virtual {p0, v1, v1}, Landroid/widget/LinearLayout;->measure(II)V

    return-void
.end method

.method protected closeComplete()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mOpenCloseAnimator:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/popup/c;->mOpenCloseAnimator:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/android/launcher3/popup/c;->mDeferContainerRemoval:Z

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mOnCloseCallbacks:Lcom/android/launcher3/util/Y1;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/util/Y1;->b()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object p0, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method protected getAccessibilityInitialFocusView()Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :cond_0
    return-object p0
.end method

.method protected getAccessibilityTarget()Landroid/util/Pair;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Landroid/view/View;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getExtraVerticalOffset()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7f0709ec

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method protected getOpenCloseAnimator(ZIIIIILandroid/view/animation/Interpolator;)Landroid/animation/AnimatorSet;
    .locals 27

    .line 1
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/popup/c;->setPivotForOpenCloseAnimation()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    const/4 v3, 0x2

    .line 8
    const/high16 v4, 0x3f800000    # 1.0f

    .line 9
    .line 10
    new-array v5, v3, [F

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    aput v0, v5, v2

    .line 15
    .line 16
    aput v4, v5, v1

    .line 17
    .line 18
    :goto_0
    move-object v12, v5

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    aput v4, v5, v2

    .line 21
    .line 22
    aput v0, v5, v1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :goto_1
    const v5, 0x3f828f5c    # 1.02f

    .line 26
    .line 27
    .line 28
    const/high16 v6, 0x3f000000    # 0.5f

    .line 29
    .line 30
    new-array v7, v3, [F

    .line 31
    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    aput v6, v7, v2

    .line 35
    .line 36
    aput v5, v7, v1

    .line 37
    .line 38
    :goto_2
    move-object/from16 v19, v7

    .line 39
    .line 40
    goto :goto_3

    .line 41
    :cond_1
    aput v4, v7, v2

    .line 42
    .line 43
    aput v6, v7, v1

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :goto_3
    sget-object v8, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 47
    .line 48
    sget-object v11, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 49
    .line 50
    move-object/from16 v7, p0

    .line 51
    .line 52
    move-object/from16 v6, p0

    .line 53
    .line 54
    move/from16 v10, p3

    .line 55
    .line 56
    move/from16 v9, p4

    .line 57
    .line 58
    invoke-direct/range {v6 .. v12}, Lcom/android/launcher3/popup/c;->getAnimatorOfFloat(Landroid/view/View;Landroid/util/Property;IILandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget-object v7, v6, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 63
    .line 64
    invoke-direct/range {v6 .. v12}, Lcom/android/launcher3/popup/c;->getAnimatorOfFloat(Landroid/view/View;Landroid/util/Property;IILandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    sget-object v15, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    .line 69
    .line 70
    const/16 v17, 0x0

    .line 71
    .line 72
    move-object/from16 v14, p0

    .line 73
    .line 74
    move-object/from16 v13, p0

    .line 75
    .line 76
    move/from16 v16, p2

    .line 77
    .line 78
    move-object/from16 v18, p7

    .line 79
    .line 80
    invoke-direct/range {v13 .. v19}, Lcom/android/launcher3/popup/c;->getAnimatorOfFloat(Landroid/view/View;Landroid/util/Property;IILandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    move-object/from16 v22, v15

    .line 85
    .line 86
    sget-object v15, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    .line 87
    .line 88
    invoke-direct/range {v13 .. v19}, Lcom/android/launcher3/popup/c;->getAnimatorOfFloat(Landroid/view/View;Landroid/util/Property;IILandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 89
    .line 90
    .line 91
    move-result-object v6

    .line 92
    new-instance v7, Landroid/animation/AnimatorSet;

    .line 93
    .line 94
    invoke-direct {v7}, Landroid/animation/AnimatorSet;-><init>()V

    .line 95
    .line 96
    .line 97
    if-eqz p1, :cond_2

    .line 98
    .line 99
    new-array v3, v3, [F

    .line 100
    .line 101
    fill-array-data v3, :array_0

    .line 102
    .line 103
    .line 104
    new-instance v8, Landroid/view/animation/PathInterpolator;

    .line 105
    .line 106
    const v9, 0x3e99999a    # 0.3f

    .line 107
    .line 108
    .line 109
    const v10, 0x3ea8f5c3    # 0.33f

    .line 110
    .line 111
    .line 112
    invoke-direct {v8, v9, v0, v10, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 113
    .line 114
    .line 115
    const/16 v23, 0xc8

    .line 116
    .line 117
    move-object/from16 v21, p0

    .line 118
    .line 119
    move-object/from16 v20, p0

    .line 120
    .line 121
    move/from16 v24, p2

    .line 122
    .line 123
    move-object/from16 v26, v3

    .line 124
    .line 125
    move-object/from16 v25, v8

    .line 126
    .line 127
    invoke-direct/range {v20 .. v26}, Lcom/android/launcher3/popup/c;->getAnimatorOfFloat(Landroid/view/View;Landroid/util/Property;IILandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 128
    .line 129
    .line 130
    move-result-object v18

    .line 131
    move-object/from16 v22, v15

    .line 132
    .line 133
    invoke-direct/range {v20 .. v26}, Lcom/android/launcher3/popup/c;->getAnimatorOfFloat(Landroid/view/View;Landroid/util/Property;IILandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 134
    .line 135
    .line 136
    move-result-object v17

    .line 137
    move-object v13, v1

    .line 138
    move-object v14, v2

    .line 139
    move-object v15, v5

    .line 140
    move-object/from16 v16, v6

    .line 141
    .line 142
    filled-new-array/range {v13 .. v18}, [Landroid/animation/Animator;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {v7, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 147
    .line 148
    .line 149
    :goto_4
    move/from16 v0, p5

    .line 150
    .line 151
    goto :goto_5

    .line 152
    :cond_2
    move-object v13, v1

    .line 153
    move-object v14, v2

    .line 154
    move-object v15, v5

    .line 155
    move-object v0, v6

    .line 156
    filled-new-array {v13, v14, v15, v0}, [Landroid/animation/Animator;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {v7, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 161
    .line 162
    .line 163
    goto :goto_4

    .line 164
    :goto_5
    int-to-long v9, v0

    .line 165
    move/from16 v0, p6

    .line 166
    .line 167
    int-to-long v0, v0

    .line 168
    move-object v13, v7

    .line 169
    move-object/from16 v7, p0

    .line 170
    .line 171
    move-object/from16 v6, p0

    .line 172
    .line 173
    move-object v8, v12

    .line 174
    move-wide v11, v0

    .line 175
    invoke-direct/range {v6 .. v13}, Lcom/android/launcher3/popup/c;->fadeInChildViews(Landroid/view/ViewGroup;[FJJLandroid/animation/AnimatorSet;)V

    .line 176
    .line 177
    .line 178
    return-object v13

    .line 179
    :array_0
    .array-data 4
        0x3f828f5c    # 1.02f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method protected getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method protected abstract getTargetObjectLocation(Landroid/graphics/Rect;)V
.end method

.method protected handleClose(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->animateClose_mfv()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->closeComplete()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public inflateAndAdd(ILandroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Landroid/view/View;",
            ">(I",
            "Landroid/view/ViewGroup;",
            ")TR;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/popup/c;->mInflater:Landroid/view/LayoutInflater;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    .line 2
    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-object p0
.end method

.method public inflateAndAdd(ILandroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Landroid/view/View;",
            ">(I",
            "Landroid/view/ViewGroup;",
            "I)TR;"
        }
    .end annotation

    .line 3
    iget-object p0, p0, Lcom/android/launcher3/popup/c;->mInflater:Landroid/view/LayoutInflater;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    .line 4
    invoke-virtual {p2, p0, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    return-object p0
.end method

.method public isAboveIcon()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/popup/c;->mIsAboveIcon:Z

    .line 2
    .line 3
    return p0
.end method

.method isShortcutContainer(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/popup/c;->mIterateChildrenTag:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method protected isShortcutOrWrapper(Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 2
    .line 3
    return p0
.end method

.method protected onCreateCloseAnimation(Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    return-void
.end method

.method protected onCreateOpenAnimation(Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Lcom/android/launcher3/h1;->getInsets()Landroid/graphics/Rect;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTranslationX()F

    .line 13
    .line 14
    .line 15
    move-result p5

    .line 16
    int-to-float p2, p2

    .line 17
    add-float/2addr p5, p2

    .line 18
    iget p2, p3, Landroid/graphics/Rect;->left:I

    .line 19
    .line 20
    int-to-float p2, p2

    .line 21
    cmpg-float p2, p5, p2

    .line 22
    .line 23
    if-ltz p2, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTranslationX()F

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    int-to-float p4, p4

    .line 30
    add-float/2addr p2, p4

    .line 31
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result p4

    .line 35
    iget p3, p3, Landroid/graphics/Rect;->right:I

    .line 36
    .line 37
    sub-int/2addr p4, p3

    .line 38
    int-to-float p3, p4

    .line 39
    cmpl-float p2, p2, p3

    .line 40
    .line 41
    if-lez p2, :cond_1

    .line 42
    .line 43
    :cond_0
    iget p2, p0, Lcom/android/launcher3/popup/c;->mGravity:I

    .line 44
    .line 45
    or-int/lit8 p2, p2, 0x1

    .line 46
    .line 47
    iput p2, p0, Lcom/android/launcher3/popup/c;->mGravity:I

    .line 48
    .line 49
    :cond_1
    iget p2, p0, Lcom/android/launcher3/popup/c;->mGravity:I

    .line 50
    .line 51
    invoke-static {p2}, Landroid/view/Gravity;->isHorizontal(I)Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-eqz p2, :cond_2

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getWidth()I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    div-int/lit8 p2, p2, 0x2

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 64
    .line 65
    .line 66
    move-result p3

    .line 67
    div-int/lit8 p3, p3, 0x2

    .line 68
    .line 69
    sub-int/2addr p2, p3

    .line 70
    int-to-float p2, p2

    .line 71
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setX(F)V

    .line 72
    .line 73
    .line 74
    iget-object p2, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 75
    .line 76
    const/4 p3, 0x4

    .line 77
    invoke-virtual {p2, p3}, Landroid/view/View;->setVisibility(I)V

    .line 78
    .line 79
    .line 80
    :cond_2
    iget p2, p0, Lcom/android/launcher3/popup/c;->mGravity:I

    .line 81
    .line 82
    invoke-static {p2}, Landroid/view/Gravity;->isVertical(I)Z

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    if-eqz p2, :cond_3

    .line 87
    .line 88
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getHeight()I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    div-int/lit8 p1, p1, 0x2

    .line 93
    .line 94
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    div-int/lit8 p2, p2, 0x2

    .line 99
    .line 100
    sub-int/2addr p1, p2

    .line 101
    int-to-float p1, p1

    .line 102
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setY(F)V

    .line 103
    .line 104
    .line 105
    :cond_3
    return-void
.end method

.method protected orientAboutObject()V
    .locals 1

    const/4 v0, 0x1

    .line 1
    invoke-direct {p0, v0, v0}, Lcom/android/launcher3/popup/c;->orientAboutObject(ZZ)V

    return-void
.end method

.method protected setChildColor(Landroid/view/View;ILandroid/animation/AnimatorSet;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p1, p0, Landroid/graphics/drawable/GradientDrawable;

    .line 6
    .line 7
    const-string v0, "color"

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Landroid/graphics/drawable/GradientDrawable;

    .line 16
    .line 17
    check-cast p0, Landroid/graphics/drawable/GradientDrawable;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/graphics/drawable/GradientDrawable;->getColor()Landroid/content/res/ColorStateList;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    filled-new-array {p0, p2}, [I

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p1, v0, p0}, Landroid/animation/ObjectAnimator;->ofArgb(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p3, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    instance-of p1, p0, Landroid/graphics/drawable/ColorDrawable;

    .line 40
    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Landroid/graphics/drawable/ColorDrawable;

    .line 48
    .line 49
    check-cast p0, Landroid/graphics/drawable/ColorDrawable;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    filled-new-array {p0, p2}, [I

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p1, v0, p0}, Landroid/animation/ObjectAnimator;->ofArgb(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p3, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 64
    .line 65
    .line 66
    :cond_1
    return-void
.end method

.method public setIcon(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/popup/c;->mIcon:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method protected setPivotForOpenCloseAnimation()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/popup/c;->mArrowOffsetHorizontal:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/popup/c;->mArrowWidth:I

    .line 4
    .line 5
    div-int/lit8 v1, v1, 0x2

    .line 6
    .line 7
    add-int/2addr v0, v1

    .line 8
    iget-boolean v1, p0, Lcom/android/launcher3/popup/c;->mIsArrowRotated:Z

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/android/launcher3/popup/c;->mIsLeftAligned:Z

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-float v2, v1

    .line 23
    :goto_0
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setPivotX(F)V

    .line 24
    .line 25
    .line 26
    int-to-float v0, v0

    .line 27
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setPivotY(F)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-boolean v1, p0, Lcom/android/launcher3/popup/c;->mIsLeftAligned:Z

    .line 32
    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    int-to-float v0, v0

    .line 36
    goto :goto_1

    .line 37
    :cond_2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    sub-int/2addr v1, v0

    .line 42
    int-to-float v0, v1

    .line 43
    :goto_1
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setPivotX(F)V

    .line 44
    .line 45
    .line 46
    iget-boolean v0, p0, Lcom/android/launcher3/popup/c;->mIsAboveIcon:Z

    .line 47
    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    int-to-float v2, v0

    .line 55
    :cond_3
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setPivotY(F)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method protected setupForDisplay()V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->orientAboutObject()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method protected shouldAddArrow()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public show()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->setupForDisplay()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/android/launcher3/popup/c;->assignMarginsAndBackgrounds(Landroid/view/ViewGroup;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->shouldAddArrow()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->addArrow()V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/popup/c;->animateOpen_mfv()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public showArrow(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->shouldAddArrow()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x4

    .line 14
    :goto_0
    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method protected showStreamerBg()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mIcon:Landroid/view/View;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/android/launcher3/BubbleTextView;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 9
    .line 10
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    instance-of v1, v0, Lcom/android/launcher3/widget/T;

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    check-cast v0, Lcom/android/launcher3/widget/T;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->resizeMode:I

    .line 27
    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Lcom/android/launcher3/popup/c;->mStreamerBg:Landroid/view/View;

    .line 31
    .line 32
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method protected updateArrowColor()V
    .locals 13

    .line 1
    iget v0, p0, Lcom/android/launcher3/popup/c;->mGravity:I

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/Gravity;->isVertical(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 10
    .line 11
    new-instance v1, Lcom/android/launcher3/popup/A;

    .line 12
    .line 13
    iget v2, p0, Lcom/android/launcher3/popup/c;->mArrowWidth:I

    .line 14
    .line 15
    int-to-float v2, v2

    .line 16
    iget v3, p0, Lcom/android/launcher3/popup/c;->mArrowHeight:I

    .line 17
    .line 18
    int-to-float v3, v3

    .line 19
    iget v4, p0, Lcom/android/launcher3/popup/c;->mArrowPointRadius:I

    .line 20
    .line 21
    int-to-float v4, v4

    .line 22
    iget v5, p0, Lcom/android/launcher3/popup/c;->mOutlineRadius:F

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 25
    .line 26
    .line 27
    move-result v6

    .line 28
    int-to-float v6, v6

    .line 29
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    int-to-float v7, v7

    .line 34
    iget v8, p0, Lcom/android/launcher3/popup/c;->mArrowOffsetHorizontal:I

    .line 35
    .line 36
    int-to-float v8, v8

    .line 37
    iget v9, p0, Lcom/android/launcher3/popup/c;->mArrowOffsetVertical:I

    .line 38
    .line 39
    neg-int v9, v9

    .line 40
    int-to-float v9, v9

    .line 41
    iget-boolean v10, p0, Lcom/android/launcher3/popup/c;->mIsAboveIcon:Z

    .line 42
    .line 43
    xor-int/lit8 v10, v10, 0x1

    .line 44
    .line 45
    iget-boolean v11, p0, Lcom/android/launcher3/popup/c;->mIsLeftAligned:Z

    .line 46
    .line 47
    iget v12, p0, Lcom/android/launcher3/popup/c;->mArrowColor:I

    .line 48
    .line 49
    invoke-direct/range {v1 .. v12}, Lcom/android/launcher3/popup/A;-><init>(FFFFFFFFZZI)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 53
    .line 54
    .line 55
    iget v0, p0, Lcom/android/launcher3/popup/c;->mElevation:F

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setElevation(F)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 61
    .line 62
    iget p0, p0, Lcom/android/launcher3/popup/c;->mElevation:F

    .line 63
    .line 64
    invoke-virtual {v0, p0}, Landroid/view/View;->setElevation(F)V

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void
.end method
