.class public Lcom/android/quickstep/views/MiniWindowTipsView;
.super Landroid/widget/FrameLayout;
.source "MiniWindowTipsView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/MiniWindowTipsView$UpdateDisplacementCallback;
    }
.end annotation


# static fields
.field private static final DURATION_MS:J = 0x96L

.field public static final MINIWINDOWTIPSVIEW_RELEASE_TO_TRANS_STATE:I = 0x1

.field public static final MINIWINDOWTIPSVIEW_TRANSFERFAILURE_STATE:I = 0x3

.field public static final MINIWINDOWTIPSVIEW_TRANSFERING_INIT_STATE:I = 0x0

.field public static final MINIWINDOWTIPSVIEW_TRANSFERING_STATE:I = 0x2

.field public static final MINIWINDOWTIPSVIEW_TRANSFERSUCCESS_STATE:I = 0x4

.field public static final MINIWINDOWTIPSVIEW_TRIGGER_APPTHANG:I = 0x1

.field public static final MINIWINDOWTIPSVIEW_TRIGGER_APPTRANS:I = 0x0

.field public static final MINIWINDOWTIPSVIEW_TRIGGER_BOTH:I = 0x2

.field public static final MINIWINDOWTIPSVIEW_TRIGGER_NONE:I = -0x1

.field private static final TAG:Ljava/lang/String; = "MiniWindowTipsView"

.field public static final VIEW_RECT_COLOR:Landroid/util/IntProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/IntProperty<",
            "Lcom/android/quickstep/views/MiniWindowTipsView;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected mAlphaProgress:F

.field mCastAppIconView:Landroid/widget/ImageView;

.field private mCastAppMessageView:Landroid/widget/TextView;

.field private final mCurrentHangRectF:Landroid/graphics/RectF;

.field private mCurrentRectF:Landroid/graphics/RectF;

.field private mCurrentState:I

.field private final mCurrentTransRectF:Landroid/graphics/RectF;

.field private mCurrentWorkspaceTextColor:I

.field private mDeviceHeight:I

.field private mDeviceOrientation:I

.field private mDeviceWidth:I

.field mHideTipsViewAnim:Landroid/animation/ObjectAnimator;

.field mIconView:Landroid/widget/ImageView;

.field private mIfLeftHang:Z

.field mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field private mLeftSlop:F

.field private mMessageView:Landroid/widget/TextView;

.field private final mPaint:Landroid/graphics/Paint;

.field private mPassedTipsViewMovingSlop:Z

.field private mRealTipsViewMovingSlop:F

.field private mRealTriggerMiniWindowSlop:F

.field mRectAlphaAnim:Landroid/animation/ObjectAnimator;

.field private mRectCurrentColor:I

.field private mRectInitColor:I

.field private mRectShown:Z

.field private mRectTargetColor:I

.field private mRectTransferFailureColor:I

.field private mRectTransferInitColor:I

.field private mRectTransferInitColorDark:I

.field private mRectTransferInitColorLight:I

.field private mRectTransferSuccessColor:I

.field private mRectTransferingColor:I

.field private mRelayDeviceName:Ljava/lang/String;

.field mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

.field private mTransferAppRectCornerRadius:Ljava/lang/Float;

.field private mTransferAppRectWidth:Ljava/lang/Float;

.field private mYOverviewAnim:Lcom/android/launcher3/anim/q;

.field private misLand:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/views/MiniWindowTipsView$1;

    .line 2
    .line 3
    const-string v1, "rectColor"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/MiniWindowTipsView$1;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/quickstep/views/MiniWindowTipsView;->VIEW_RECT_COLOR:Landroid/util/IntProperty;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Landroid/graphics/RectF;

    .line 5
    .line 6
    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentRectF:Landroid/graphics/RectF;

    .line 10
    .line 11
    new-instance p2, Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentTransRectF:Landroid/graphics/RectF;

    .line 17
    .line 18
    new-instance p2, Landroid/graphics/RectF;

    .line 19
    .line 20
    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentHangRectF:Landroid/graphics/RectF;

    .line 24
    .line 25
    new-instance p2, Landroid/graphics/Paint;

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-direct {p2, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 29
    .line 30
    .line 31
    iput-object p2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mPaint:Landroid/graphics/Paint;

    .line 32
    .line 33
    const/4 p2, 0x0

    .line 34
    iput p2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectInitColor:I

    .line 35
    .line 36
    const p2, 0x7f060679

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    const v0, 0x43328000    # 178.5f

    .line 44
    .line 45
    .line 46
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-static {p2, v0}, Ls1/q;->h(II)I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    iput p2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectTargetColor:I

    .line 55
    .line 56
    const p2, 0x7f060673

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    const v0, 0x41a33333    # 20.4f

    .line 64
    .line 65
    .line 66
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    invoke-static {p2, v0}, Ls1/q;->h(II)I

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    iput p2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectTransferInitColorLight:I

    .line 75
    .line 76
    invoke-static {}, Lx1/S;->r()Z

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    if-eqz p2, :cond_0

    .line 81
    .line 82
    const p2, 0x7f060678

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_0
    const p2, 0x7f060677

    .line 87
    .line 88
    .line 89
    :goto_0
    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    const/high16 v0, 0x43190000    # 153.0f

    .line 94
    .line 95
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    invoke-static {p2, v0}, Ls1/q;->h(II)I

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    iput p2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectTransferingColor:I

    .line 104
    .line 105
    const p2, 0x7f060675

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    const/16 v0, 0xff

    .line 113
    .line 114
    invoke-static {p2, v0}, Ls1/q;->h(II)I

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    iput p2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectTransferFailureColor:I

    .line 119
    .line 120
    const p2, 0x7f060676

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    invoke-static {p2, v0}, Ls1/q;->h(II)I

    .line 128
    .line 129
    .line 130
    move-result p2

    .line 131
    iput p2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectTransferSuccessColor:I

    .line 132
    .line 133
    const p2, 0x7f060674

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    const p2, 0x41233333    # 10.2f

    .line 141
    .line 142
    .line 143
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 144
    .line 145
    .line 146
    move-result p2

    .line 147
    invoke-static {p1, p2}, Ls1/q;->h(II)I

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    iput p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectTransferInitColorDark:I

    .line 152
    .line 153
    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/views/MiniWindowTipsView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectCurrentColor:I

    .line 2
    .line 3
    return p0
.end method

.method public static addMiniWindowTipsView(Lcom/android/quickstep/util/RecentsOrientedState;Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/AbsSwipeUpHandler;)Lcom/android/quickstep/views/MiniWindowTipsView;
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->x5()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/android/quickstep/views/MiniWindowTipsView;

    .line 20
    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const v2, 0x7f0e0143

    .line 28
    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-virtual {v1, v2, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lcom/android/quickstep/views/MiniWindowTipsView;

    .line 36
    .line 37
    invoke-virtual {v1, p1}, Lcom/android/quickstep/views/MiniWindowTipsView;->setLauncher(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->c6(Lcom/android/quickstep/views/MiniWindowTipsView;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    invoke-virtual {v1, p2}, Lcom/android/quickstep/views/MiniWindowTipsView;->setSwipeUpHandler(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    iget p2, p2, Lcom/android/launcher3/h0;->T0:I

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget p1, p1, Lcom/android/launcher3/h0;->U0:I

    .line 60
    .line 61
    invoke-direct {v1, v0, p0, p2, p1}, Lcom/android/quickstep/views/MiniWindowTipsView;->setupMiniWindowTipsView(Landroid/view/View;Lcom/android/quickstep/util/RecentsOrientedState;II)V

    .line 62
    .line 63
    .line 64
    return-object v1
.end method

.method static bridge synthetic b(Lcom/android/quickstep/views/MiniWindowTipsView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectCurrentColor:I

    .line 2
    .line 3
    return-void
.end method

.method private getTiggerType(Landroid/graphics/RectF;)I
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->misLand:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentRectF:Landroid/graphics/RectF;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLeft()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getRight()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    add-int/2addr v2, v3

    .line 17
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    sub-int/2addr v2, v3

    .line 22
    int-to-float v2, v2

    .line 23
    const/high16 v3, 0x40000000    # 2.0f

    .line 24
    .line 25
    div-float/2addr v2, v3

    .line 26
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationX()F

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    add-float/2addr v2, v4

    .line 31
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTop()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBottom()I

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    add-int/2addr v4, v5

    .line 40
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    sub-int/2addr v4, v5

    .line 45
    int-to-float v4, v4

    .line 46
    div-float/2addr v4, v3

    .line 47
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLeft()I

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getRight()I

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    add-int/2addr v5, v6

    .line 56
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 57
    .line 58
    .line 59
    move-result v6

    .line 60
    add-int/2addr v5, v6

    .line 61
    int-to-float v5, v5

    .line 62
    div-float/2addr v5, v3

    .line 63
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationX()F

    .line 64
    .line 65
    .line 66
    move-result v6

    .line 67
    add-float/2addr v5, v6

    .line 68
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTop()I

    .line 69
    .line 70
    .line 71
    move-result v6

    .line 72
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBottom()I

    .line 73
    .line 74
    .line 75
    move-result v7

    .line 76
    add-int/2addr v6, v7

    .line 77
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 78
    .line 79
    .line 80
    move-result v7

    .line 81
    add-int/2addr v6, v7

    .line 82
    int-to-float v6, v6

    .line 83
    div-float/2addr v6, v3

    .line 84
    invoke-virtual {v0, v2, v4, v5, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 85
    .line 86
    .line 87
    iget v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mDeviceOrientation:I

    .line 88
    .line 89
    if-ne v0, v1, :cond_0

    .line 90
    .line 91
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentTransRectF:Landroid/graphics/RectF;

    .line 92
    .line 93
    iget-object v2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentRectF:Landroid/graphics/RectF;

    .line 94
    .line 95
    iget v3, v2, Landroid/graphics/RectF;->left:F

    .line 96
    .line 97
    iget v4, v2, Landroid/graphics/RectF;->top:F

    .line 98
    .line 99
    iget v2, v2, Landroid/graphics/RectF;->right:F

    .line 100
    .line 101
    iget-object v5, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectWidth:Ljava/lang/Float;

    .line 102
    .line 103
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    add-float/2addr v5, v4

    .line 108
    invoke-virtual {v0, v3, v4, v2, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentHangRectF:Landroid/graphics/RectF;

    .line 112
    .line 113
    iget-object v2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentRectF:Landroid/graphics/RectF;

    .line 114
    .line 115
    iget v3, v2, Landroid/graphics/RectF;->left:F

    .line 116
    .line 117
    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    .line 118
    .line 119
    iget-object v4, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectWidth:Ljava/lang/Float;

    .line 120
    .line 121
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    .line 122
    .line 123
    .line 124
    move-result v4

    .line 125
    sub-float/2addr v2, v4

    .line 126
    iget-object v4, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentRectF:Landroid/graphics/RectF;

    .line 127
    .line 128
    iget v5, v4, Landroid/graphics/RectF;->right:F

    .line 129
    .line 130
    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    .line 131
    .line 132
    invoke-virtual {v0, v3, v2, v5, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 133
    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentHangRectF:Landroid/graphics/RectF;

    .line 138
    .line 139
    iget-object v2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentRectF:Landroid/graphics/RectF;

    .line 140
    .line 141
    iget v3, v2, Landroid/graphics/RectF;->left:F

    .line 142
    .line 143
    iget v4, v2, Landroid/graphics/RectF;->top:F

    .line 144
    .line 145
    iget v2, v2, Landroid/graphics/RectF;->right:F

    .line 146
    .line 147
    iget-object v5, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectWidth:Ljava/lang/Float;

    .line 148
    .line 149
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 150
    .line 151
    .line 152
    move-result v5

    .line 153
    add-float/2addr v5, v4

    .line 154
    invoke-virtual {v0, v3, v4, v2, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentTransRectF:Landroid/graphics/RectF;

    .line 158
    .line 159
    iget-object v2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentRectF:Landroid/graphics/RectF;

    .line 160
    .line 161
    iget v3, v2, Landroid/graphics/RectF;->left:F

    .line 162
    .line 163
    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    .line 164
    .line 165
    iget-object v4, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectWidth:Ljava/lang/Float;

    .line 166
    .line 167
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    .line 168
    .line 169
    .line 170
    move-result v4

    .line 171
    sub-float/2addr v2, v4

    .line 172
    iget-object v4, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentRectF:Landroid/graphics/RectF;

    .line 173
    .line 174
    iget v5, v4, Landroid/graphics/RectF;->right:F

    .line 175
    .line 176
    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    .line 177
    .line 178
    invoke-virtual {v0, v3, v2, v5, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 179
    .line 180
    .line 181
    goto :goto_0

    .line 182
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentRectF:Landroid/graphics/RectF;

    .line 183
    .line 184
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLeft()I

    .line 185
    .line 186
    .line 187
    move-result v2

    .line 188
    int-to-float v2, v2

    .line 189
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTop()I

    .line 190
    .line 191
    .line 192
    move-result v3

    .line 193
    int-to-float v3, v3

    .line 194
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationY()F

    .line 195
    .line 196
    .line 197
    move-result v4

    .line 198
    add-float/2addr v3, v4

    .line 199
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getRight()I

    .line 200
    .line 201
    .line 202
    move-result v4

    .line 203
    int-to-float v4, v4

    .line 204
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBottom()I

    .line 205
    .line 206
    .line 207
    move-result v5

    .line 208
    int-to-float v5, v5

    .line 209
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationY()F

    .line 210
    .line 211
    .line 212
    move-result v6

    .line 213
    add-float/2addr v5, v6

    .line 214
    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 215
    .line 216
    .line 217
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentTransRectF:Landroid/graphics/RectF;

    .line 218
    .line 219
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLeft()I

    .line 220
    .line 221
    .line 222
    move-result v2

    .line 223
    int-to-float v2, v2

    .line 224
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTop()I

    .line 225
    .line 226
    .line 227
    move-result v3

    .line 228
    int-to-float v3, v3

    .line 229
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationY()F

    .line 230
    .line 231
    .line 232
    move-result v4

    .line 233
    add-float/2addr v3, v4

    .line 234
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLeft()I

    .line 235
    .line 236
    .line 237
    move-result v4

    .line 238
    int-to-float v4, v4

    .line 239
    iget-object v5, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectWidth:Ljava/lang/Float;

    .line 240
    .line 241
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 242
    .line 243
    .line 244
    move-result v5

    .line 245
    add-float/2addr v4, v5

    .line 246
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBottom()I

    .line 247
    .line 248
    .line 249
    move-result v5

    .line 250
    int-to-float v5, v5

    .line 251
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationY()F

    .line 252
    .line 253
    .line 254
    move-result v6

    .line 255
    add-float/2addr v5, v6

    .line 256
    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 257
    .line 258
    .line 259
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentHangRectF:Landroid/graphics/RectF;

    .line 260
    .line 261
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getRight()I

    .line 262
    .line 263
    .line 264
    move-result v2

    .line 265
    int-to-float v2, v2

    .line 266
    iget-object v3, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectWidth:Ljava/lang/Float;

    .line 267
    .line 268
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 269
    .line 270
    .line 271
    move-result v3

    .line 272
    sub-float/2addr v2, v3

    .line 273
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTop()I

    .line 274
    .line 275
    .line 276
    move-result v3

    .line 277
    int-to-float v3, v3

    .line 278
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationY()F

    .line 279
    .line 280
    .line 281
    move-result v4

    .line 282
    add-float/2addr v3, v4

    .line 283
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getRight()I

    .line 284
    .line 285
    .line 286
    move-result v4

    .line 287
    int-to-float v4, v4

    .line 288
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBottom()I

    .line 289
    .line 290
    .line 291
    move-result v5

    .line 292
    int-to-float v5, v5

    .line 293
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationY()F

    .line 294
    .line 295
    .line 296
    move-result v6

    .line 297
    add-float/2addr v5, v6

    .line 298
    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 299
    .line 300
    .line 301
    :goto_0
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 302
    .line 303
    iget-boolean v2, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportCasting:Z

    .line 304
    .line 305
    const/4 v3, 0x0

    .line 306
    const/4 v4, -0x1

    .line 307
    if-eqz v2, :cond_5

    .line 308
    .line 309
    iget-boolean v5, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportMiniWindow:Z

    .line 310
    .line 311
    if-eqz v5, :cond_5

    .line 312
    .line 313
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentTransRectF:Landroid/graphics/RectF;

    .line 314
    .line 315
    invoke-static {v0, p1}, Landroid/graphics/RectF;->intersects(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 316
    .line 317
    .line 318
    move-result v0

    .line 319
    if-eqz v0, :cond_3

    .line 320
    .line 321
    iget-object p0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentHangRectF:Landroid/graphics/RectF;

    .line 322
    .line 323
    invoke-static {p0, p1}, Landroid/graphics/RectF;->intersects(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 324
    .line 325
    .line 326
    move-result p0

    .line 327
    if-eqz p0, :cond_2

    .line 328
    .line 329
    const/4 p0, 0x2

    .line 330
    return p0

    .line 331
    :cond_2
    return v3

    .line 332
    :cond_3
    iget-object p0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentHangRectF:Landroid/graphics/RectF;

    .line 333
    .line 334
    invoke-static {p0, p1}, Landroid/graphics/RectF;->intersects(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 335
    .line 336
    .line 337
    move-result p0

    .line 338
    if-eqz p0, :cond_4

    .line 339
    .line 340
    return v1

    .line 341
    :cond_4
    return v4

    .line 342
    :cond_5
    if-eqz v2, :cond_7

    .line 343
    .line 344
    iget-object p0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentTransRectF:Landroid/graphics/RectF;

    .line 345
    .line 346
    invoke-static {p0, p1}, Landroid/graphics/RectF;->intersects(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 347
    .line 348
    .line 349
    move-result p0

    .line 350
    if-eqz p0, :cond_6

    .line 351
    .line 352
    return v3

    .line 353
    :cond_6
    return v4

    .line 354
    :cond_7
    iget-boolean v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportMiniWindow:Z

    .line 355
    .line 356
    if-eqz v0, :cond_8

    .line 357
    .line 358
    iget-object p0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentHangRectF:Landroid/graphics/RectF;

    .line 359
    .line 360
    invoke-static {p0, p1}, Landroid/graphics/RectF;->intersects(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 361
    .line 362
    .line 363
    move-result p0

    .line 364
    if-eqz p0, :cond_8

    .line 365
    .line 366
    return v1

    .line 367
    :cond_8
    return v4
.end method

.method private playRectAlphaAnimation(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectAlphaAnim:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->end()V

    .line 6
    .line 7
    .line 8
    :cond_0
    sget-object v0, Lcom/android/quickstep/views/MiniWindowTipsView;->VIEW_RECT_COLOR:Landroid/util/IntProperty;

    .line 9
    .line 10
    filled-new-array {p1, p2}, [I

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p0, v0, p1}, Landroid/animation/ObjectAnimator;->ofArgb(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectAlphaAnim:Landroid/animation/ObjectAnimator;

    .line 19
    .line 20
    const-wide/16 v0, 0x96

    .line 21
    .line 22
    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectAlphaAnim:Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private setupChildView(Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)V
    .locals 17

    move-object/from16 v0, p0

    .line 1
    invoke-interface/range {p1 .. p1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getRotation()I

    move-result v1

    .line 2
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    const v3, 0x7f0b03bf

    .line 3
    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    const v4, 0x7f0b03c0

    .line 4
    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 5
    invoke-virtual {v3}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/FrameLayout$LayoutParams;

    .line 6
    invoke-virtual {v4}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/widget/FrameLayout$LayoutParams;

    const v7, 0x7f0b03b9

    .line 7
    invoke-virtual {v0, v7}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    const v8, 0x7f0b03b8

    .line 8
    invoke-virtual {v0, v8}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 9
    invoke-virtual {v7}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroid/widget/FrameLayout$LayoutParams;

    .line 10
    invoke-virtual {v8}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f070830

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v11

    float-to-int v11, v11

    .line 12
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x7f140262

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 13
    invoke-virtual {v4}, Landroid/widget/TextView;->getTextSize()F

    move-result v13

    float-to-int v13, v13

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    mul-int/2addr v13, v12

    .line 14
    invoke-virtual {v4}, Landroid/widget/TextView;->getTextSize()F

    move-result v12

    const/high16 v14, 0x40e00000    # 7.0f

    mul-float/2addr v12, v14

    const/high16 v14, 0x40c00000    # 6.0f

    div-float/2addr v12, v14

    float-to-int v12, v12

    .line 15
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "mDeviceWidth = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v15, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mDeviceWidth:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v15, " mDeviceHeight = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v15, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mDeviceHeight:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v15, " messageWidth = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v13, " messageHeight = "

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v13, " orientation = "

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const-string v14, "MiniWindowTipsView"

    invoke-static {v14, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v14, 0x1

    const/4 v13, 0x0

    if-eq v1, v14, :cond_1

    const/4 v15, 0x3

    if-eq v1, v15, :cond_1

    const/16 v1, 0x31

    .line 16
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 17
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v12, 0x7f07083c

    invoke-virtual {v1, v12}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 18
    iput v13, v2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 19
    iput v13, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 20
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v12, 0x7f070834

    invoke-virtual {v1, v12}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 21
    iget v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mDeviceWidth:I

    .line 22
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    iget-object v15, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v15}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v15

    iget-boolean v15, v15, Lcom/android/launcher3/h0;->G0:Z

    if-eqz v15, :cond_0

    const v15, 0x7f070838

    goto :goto_0

    :cond_0
    const v15, 0x7f070837

    :goto_0
    invoke-virtual {v12, v15}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v12

    float-to-int v12, v12

    mul-int/lit8 v12, v12, 0x2

    sub-int/2addr v1, v12

    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    const/16 v1, 0x35

    .line 23
    iput v1, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 24
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v15, 0x7f07083e

    invoke-virtual {v12, v15}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v12

    float-to-int v12, v12

    iput v12, v5, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 25
    iget-object v12, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectWidth:Ljava/lang/Float;

    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v12

    int-to-float v14, v11

    sub-float/2addr v12, v14

    float-to-int v12, v12

    div-int/lit8 v12, v12, 0x2

    iput v12, v5, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 26
    iput v13, v5, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 27
    iput v13, v5, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 28
    iput v1, v6, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 29
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v15}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    add-int/2addr v1, v11

    .line 30
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v15, 0x7f070842

    invoke-virtual {v12, v15}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v12

    float-to-int v12, v12

    add-int/2addr v1, v12

    iput v1, v6, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 31
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v12, 0x7f070832

    invoke-virtual {v1, v12}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    iput v1, v6, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 32
    iput v13, v6, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 33
    iput v13, v6, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 34
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectWidth:Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    .line 35
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    invoke-virtual {v15, v12}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v12

    const/high16 v15, 0x40000000    # 2.0f

    mul-float/2addr v12, v15

    sub-float/2addr v1, v12

    float-to-int v1, v1

    iput v1, v6, Landroid/widget/FrameLayout$LayoutParams;->width:I

    const/4 v1, 0x1

    .line 36
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setGravity(I)V

    const/16 v1, 0x33

    .line 37
    iput v1, v9, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 38
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v12, 0x7f07083e

    invoke-virtual {v1, v12}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    iput v1, v9, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 39
    iput v13, v9, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 40
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectWidth:Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    sub-float/2addr v1, v14

    float-to-int v1, v1

    div-int/lit8 v1, v1, 0x2

    iput v1, v9, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 41
    iput v13, v9, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    const/16 v1, 0x33

    .line 42
    iput v1, v10, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 43
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v12, 0x7f07083e

    invoke-virtual {v1, v12}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    add-int/2addr v1, v11

    .line 44
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f070842

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v11

    float-to-int v11, v11

    add-int/2addr v1, v11

    iput v1, v10, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 45
    iput v13, v10, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 46
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v11, 0x7f070843

    invoke-virtual {v1, v11}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    iput v1, v10, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 47
    iput v13, v10, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 48
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectWidth:Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    .line 49
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v12, v11}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v11

    mul-float/2addr v11, v15

    sub-float/2addr v1, v11

    float-to-int v1, v1

    iput v1, v10, Landroid/widget/FrameLayout$LayoutParams;->width:I

    const/4 v1, 0x1

    .line 50
    invoke-virtual {v8, v1}, Landroid/widget/TextView;->setGravity(I)V

    move v1, v13

    goto/16 :goto_2

    .line 51
    :cond_1
    iget v14, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mDeviceWidth:I

    .line 52
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    const v13, 0x7f070833

    invoke-virtual {v15, v13}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v15

    float-to-int v15, v15

    div-int/lit8 v15, v15, 0x2

    sub-int/2addr v14, v15

    iget v15, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mDeviceHeight:I

    div-int/lit8 v16, v15, 0x2

    sub-int v14, v14, v16

    const/4 v13, 0x0

    .line 53
    iput v13, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    const/4 v13, 0x1

    if-ne v1, v13, :cond_2

    const v1, 0x800013

    .line 54
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 55
    iput v14, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    const/4 v13, 0x0

    .line 56
    iput v13, v2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    goto :goto_1

    :cond_2
    const/4 v13, 0x0

    const v1, 0x800015

    .line 57
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 58
    iput v13, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 59
    iput v14, v2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 60
    :goto_1
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v13, 0x7f070837

    invoke-virtual {v1, v13}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    mul-int/lit8 v1, v1, 0x2

    sub-int/2addr v15, v1

    iput v15, v2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 61
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v13, 0x7f070833

    invoke-virtual {v1, v13}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    const/16 v1, 0x33

    .line 62
    iput v1, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 63
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v13, 0x7f07083d

    invoke-virtual {v1, v13}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    iput v1, v5, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    const/4 v1, 0x0

    .line 64
    iput v1, v5, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 65
    iget v1, v2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    sub-int/2addr v1, v11

    .line 66
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f070831

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v14

    float-to-int v14, v14

    sub-int/2addr v1, v14

    .line 67
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f07083f

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v14

    float-to-int v14, v14

    sub-int/2addr v1, v14

    iput v1, v5, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    const/4 v1, 0x0

    .line 68
    iput v1, v5, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    const/16 v14, 0x33

    .line 69
    iput v14, v6, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 70
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    invoke-virtual {v14, v13}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v14

    float-to-int v14, v14

    sub-int v12, v11, v12

    div-int/lit8 v12, v12, 0x2

    add-int/2addr v14, v12

    iput v14, v6, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 71
    iput v1, v6, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 72
    iget v14, v5, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    add-int/2addr v14, v11

    .line 73
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    invoke-virtual {v13, v15}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v13

    float-to-int v13, v13

    add-int/2addr v14, v13

    iput v14, v6, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 74
    iput v1, v6, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    const/4 v13, -0x2

    .line 75
    iput v13, v6, Landroid/widget/FrameLayout$LayoutParams;->width:I

    const/16 v14, 0x33

    .line 76
    iput v14, v9, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 77
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v13, 0x7f07083d

    invoke-virtual {v14, v13}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v14

    float-to-int v13, v14

    iput v13, v9, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 78
    iput v1, v9, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 79
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    const v14, 0x7f070841

    invoke-virtual {v13, v14}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v13

    float-to-int v13, v13

    iput v13, v9, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 80
    iput v1, v9, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    const/16 v14, 0x33

    .line 81
    iput v14, v10, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 82
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    const v14, 0x7f07083d

    invoke-virtual {v13, v14}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v13

    float-to-int v13, v13

    add-int/2addr v13, v12

    iput v13, v10, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 83
    iput v1, v10, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 84
    iget v12, v9, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    add-int/2addr v12, v11

    .line 85
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v11, v15}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v11

    float-to-int v11, v11

    add-int/2addr v12, v11

    iput v12, v10, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 86
    iput v1, v10, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    const/4 v11, -0x2

    .line 87
    iput v11, v10, Landroid/widget/FrameLayout$LayoutParams;->width:I

    const v11, 0x800003

    .line 88
    invoke-virtual {v8, v11}, Landroid/widget/TextView;->setGravity(I)V

    .line 89
    :goto_2
    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 90
    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 91
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 92
    sget-object v2, Lx1/r;->H:Lcom/android/launcher3/util/I;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 93
    invoke-virtual {v8, v10}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lx1/r;

    invoke-virtual {v2}, Lx1/r;->s0()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRelayDeviceName:Ljava/lang/String;

    .line 96
    :cond_3
    invoke-interface/range {p1 .. p1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getDegreesRotated()F

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setRotation(F)V

    .line 97
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    move-result v5

    const v6, 0x7f040781

    invoke-static {v2, v6, v5}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    move-result v2

    iput v2, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentWorkspaceTextColor:I

    const/4 v5, -0x1

    if-ne v2, v5, :cond_4

    .line 98
    iget v2, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectTransferInitColorLight:I

    goto :goto_3

    :cond_4
    iget v2, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectTransferInitColorDark:I

    :goto_3
    iput v2, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectTransferInitColor:I

    .line 99
    invoke-virtual {v3}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 100
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 101
    iget v5, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentWorkspaceTextColor:I

    invoke-virtual {v2, v5}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 102
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 103
    iget v2, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentWorkspaceTextColor:I

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 104
    iget-object v2, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    iget-boolean v2, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportMiniWindow:Z

    const/4 v13, 0x4

    if-eqz v2, :cond_5

    move v2, v1

    goto :goto_4

    :cond_5
    move v2, v13

    :goto_4
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 105
    iget-object v2, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    iget-boolean v2, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportMiniWindow:Z

    if-eqz v2, :cond_6

    move v2, v1

    goto :goto_5

    :cond_6
    move v2, v13

    :goto_5
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 106
    iget-object v2, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    iget-boolean v2, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportMiniWindow:Z

    if-eqz v2, :cond_7

    const v2, 0x7f140265

    goto :goto_6

    :cond_7
    const v2, 0x7f140267

    :goto_6
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(I)V

    .line 107
    invoke-virtual {v7}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 108
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 109
    iget v3, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentWorkspaceTextColor:I

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 110
    invoke-virtual {v7, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 111
    iget-object v2, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    iget-boolean v2, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportCasting:Z

    if-eqz v2, :cond_8

    move v2, v1

    goto :goto_7

    :cond_8
    move v2, v13

    :goto_7
    invoke-virtual {v7, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 112
    iget-object v2, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    iget-boolean v2, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportCasting:Z

    if-eqz v2, :cond_9

    move v13, v1

    :cond_9
    invoke-virtual {v8, v13}, Landroid/widget/TextView;->setVisibility(I)V

    .line 113
    iget v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentWorkspaceTextColor:I

    invoke-virtual {v8, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 114
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    iget-boolean v1, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportCasting:Z

    if-eqz v1, :cond_a

    .line 115
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRelayDeviceName:Ljava/lang/String;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f140263

    invoke-virtual {v1, v3, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_8

    .line 116
    :cond_a
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f140266

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 117
    :goto_8
    iget-object v0, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCastAppMessageView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private setupMiniWindowTipsView(Landroid/view/View;Lcom/android/quickstep/util/RecentsOrientedState;II)V
    .locals 6

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget p1, p1, Lcom/android/launcher3/h0;->T0:I

    .line 8
    .line 9
    iput p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mDeviceWidth:I

    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget p1, p1, Lcom/android/launcher3/h0;->U0:I

    .line 18
    .line 19
    iput p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mDeviceHeight:I

    .line 20
    .line 21
    invoke-virtual {p2}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getRotation()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mDeviceOrientation:I

    .line 30
    .line 31
    const/4 p3, 0x0

    .line 32
    const/4 p4, 0x3

    .line 33
    const/4 v0, 0x1

    .line 34
    if-eq p1, v0, :cond_1

    .line 35
    .line 36
    if-ne p1, p4, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    move p1, p3

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    :goto_0
    move p1, v0

    .line 42
    :goto_1
    iput-boolean p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->misLand:Z

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const v1, 0x7f070849

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const v2, 0x7f070848

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    const v3, 0x7f07084c

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    const v4, 0x7f07084b

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    const v5, 0x7f070847

    .line 93
    .line 94
    .line 95
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimension(I)F

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    iget v5, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mDeviceOrientation:I

    .line 100
    .line 101
    if-eq v5, v0, :cond_3

    .line 102
    .line 103
    if-ne v5, p4, :cond_2

    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_2
    iput v2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRealTriggerMiniWindowSlop:F

    .line 107
    .line 108
    iput p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRealTipsViewMovingSlop:F

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :cond_3
    :goto_2
    iput v3, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRealTriggerMiniWindowSlop:F

    .line 112
    .line 113
    iput v1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRealTipsViewMovingSlop:F

    .line 114
    .line 115
    :goto_3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    const v1, 0x7f07084a

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getFloat(I)F

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    iget v1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mDeviceOrientation:I

    .line 127
    .line 128
    if-eq v1, v0, :cond_5

    .line 129
    .line 130
    if-ne v1, p4, :cond_4

    .line 131
    .line 132
    goto :goto_5

    .line 133
    :cond_4
    iget v1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mDeviceWidth:I

    .line 134
    .line 135
    :goto_4
    int-to-float v1, v1

    .line 136
    mul-float/2addr v1, p1

    .line 137
    goto :goto_6

    .line 138
    :cond_5
    :goto_5
    iget v1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mDeviceHeight:I

    .line 139
    .line 140
    goto :goto_4

    .line 141
    :goto_6
    iput v1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mLeftSlop:F

    .line 142
    .line 143
    iget-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 144
    .line 145
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 150
    .line 151
    if-eqz p1, :cond_6

    .line 152
    .line 153
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    const p4, 0x7f070845

    .line 158
    .line 159
    .line 160
    invoke-virtual {p1, p4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    goto :goto_9

    .line 165
    :cond_6
    iget p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mDeviceOrientation:I

    .line 166
    .line 167
    const v1, 0x7f070846

    .line 168
    .line 169
    .line 170
    const v2, 0x7f070837

    .line 171
    .line 172
    .line 173
    const/high16 v3, 0x40000000    # 2.0f

    .line 174
    .line 175
    if-eq p1, v0, :cond_8

    .line 176
    .line 177
    if-ne p1, p4, :cond_7

    .line 178
    .line 179
    goto :goto_8

    .line 180
    :cond_7
    iget p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mDeviceWidth:I

    .line 181
    .line 182
    int-to-float p1, p1

    .line 183
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 184
    .line 185
    .line 186
    move-result-object p4

    .line 187
    invoke-virtual {p4, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 188
    .line 189
    .line 190
    move-result p4

    .line 191
    mul-float/2addr p4, v3

    .line 192
    sub-float/2addr p1, p4

    .line 193
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 194
    .line 195
    .line 196
    move-result-object p4

    .line 197
    invoke-virtual {p4, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 198
    .line 199
    .line 200
    move-result p4

    .line 201
    :goto_7
    sub-float/2addr p1, p4

    .line 202
    div-float/2addr p1, v3

    .line 203
    goto :goto_9

    .line 204
    :cond_8
    :goto_8
    iget p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mDeviceHeight:I

    .line 205
    .line 206
    int-to-float p1, p1

    .line 207
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 208
    .line 209
    .line 210
    move-result-object p4

    .line 211
    invoke-virtual {p4, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 212
    .line 213
    .line 214
    move-result p4

    .line 215
    mul-float/2addr p4, v3

    .line 216
    sub-float/2addr p1, p4

    .line 217
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 218
    .line 219
    .line 220
    move-result-object p4

    .line 221
    invoke-virtual {p4, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 222
    .line 223
    .line 224
    move-result p4

    .line 225
    goto :goto_7

    .line 226
    :goto_9
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    iput-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectWidth:Ljava/lang/Float;

    .line 231
    .line 232
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    const p4, 0x7f070844

    .line 237
    .line 238
    .line 239
    invoke-virtual {p1, p4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 240
    .line 241
    .line 242
    move-result p1

    .line 243
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 244
    .line 245
    .line 246
    move-result-object p1

    .line 247
    iput-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectCornerRadius:Ljava/lang/Float;

    .line 248
    .line 249
    invoke-virtual {p2}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/MiniWindowTipsView;->setupChildView(Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)V

    .line 254
    .line 255
    .line 256
    iget-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectAlphaAnim:Landroid/animation/ObjectAnimator;

    .line 257
    .line 258
    if-eqz p1, :cond_9

    .line 259
    .line 260
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->end()V

    .line 261
    .line 262
    .line 263
    :cond_9
    iget-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mHideTipsViewAnim:Landroid/animation/ObjectAnimator;

    .line 264
    .line 265
    if-eqz p1, :cond_a

    .line 266
    .line 267
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->end()V

    .line 268
    .line 269
    .line 270
    :cond_a
    const/high16 p1, 0x3f800000    # 1.0f

    .line 271
    .line 272
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 273
    .line 274
    .line 275
    sget-object p1, Lcom/android/quickstep/views/MiniWindowTipsView;->VIEW_RECT_COLOR:Landroid/util/IntProperty;

    .line 276
    .line 277
    iget p2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectTransferInitColor:I

    .line 278
    .line 279
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 280
    .line 281
    .line 282
    move-result-object p2

    .line 283
    invoke-virtual {p1, p0, p2}, Landroid/util/IntProperty;->set(Ljava/lang/Object;Ljava/lang/Integer;)V

    .line 284
    .line 285
    .line 286
    const/4 p1, 0x0

    .line 287
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 288
    .line 289
    .line 290
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 291
    .line 292
    .line 293
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 294
    .line 295
    .line 296
    iget p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRealTipsViewMovingSlop:F

    .line 297
    .line 298
    iget p2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRealTriggerMiniWindowSlop:F

    .line 299
    .line 300
    sub-float/2addr p1, p2

    .line 301
    float-to-int p1, p1

    .line 302
    int-to-long p1, p1

    .line 303
    invoke-virtual {p0, p1, p2, v4}, Lcom/android/quickstep/views/MiniWindowTipsView;->setupTranslationYAnimation(JF)V

    .line 304
    .line 305
    .line 306
    iput-boolean p3, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectShown:Z

    .line 307
    .line 308
    const-string p0, "MiniWindowTipsView"

    .line 309
    .line 310
    const-string p1, "setupMiniWindowTipsView"

    .line 311
    .line 312
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    .line 314
    .line 315
    return-void
.end method

.method private updateIconTextColor(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCastAppIconView:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCastAppIconView:Landroid/widget/ImageView;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCastAppMessageView:Landroid/widget/TextView;

    .line 19
    .line 20
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 21
    .line 22
    .line 23
    iget-object p2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mIconView:Landroid/widget/ImageView;

    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mIconView:Landroid/widget/ImageView;

    .line 36
    .line 37
    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mMessageView:Landroid/widget/TextView;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 43
    .line 44
    .line 45
    return-void
.end method


# virtual methods
.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mPaint:Landroid/graphics/Paint;

    .line 4
    .line 5
    iget v2, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectCurrentColor:I

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 8
    .line 9
    .line 10
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 11
    .line 12
    if-eqz v1, :cond_3

    .line 13
    .line 14
    iget-boolean v2, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mIfLeftHang:Z

    .line 15
    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    iget-boolean v1, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportCasting:Z

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectWidth:Ljava/lang/Float;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    int-to-float v6, v1

    .line 33
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectCornerRadius:Ljava/lang/Float;

    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 36
    .line 37
    .line 38
    move-result v7

    .line 39
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectCornerRadius:Ljava/lang/Float;

    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 42
    .line 43
    .line 44
    move-result v8

    .line 45
    iget-object v9, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mPaint:Landroid/graphics/Paint;

    .line 46
    .line 47
    const/4 v3, 0x0

    .line 48
    const/4 v4, 0x0

    .line 49
    move-object/from16 v2, p1

    .line 50
    .line 51
    invoke-virtual/range {v2 .. v9}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 55
    .line 56
    iget-boolean v1, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportMiniWindow:Z

    .line 57
    .line 58
    if-eqz v1, :cond_3

    .line 59
    .line 60
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mPaint:Landroid/graphics/Paint;

    .line 61
    .line 62
    iget v2, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectTransferInitColor:I

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 65
    .line 66
    .line 67
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    int-to-float v1, v1

    .line 72
    iget-object v2, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectWidth:Ljava/lang/Float;

    .line 73
    .line 74
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    sub-float v11, v1, v2

    .line 79
    .line 80
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    int-to-float v13, v1

    .line 85
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    int-to-float v14, v1

    .line 90
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectCornerRadius:Ljava/lang/Float;

    .line 91
    .line 92
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 93
    .line 94
    .line 95
    move-result v15

    .line 96
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectCornerRadius:Ljava/lang/Float;

    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 99
    .line 100
    .line 101
    move-result v16

    .line 102
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mPaint:Landroid/graphics/Paint;

    .line 103
    .line 104
    const/4 v12, 0x0

    .line 105
    move-object/from16 v10, p1

    .line 106
    .line 107
    move-object/from16 v17, v1

    .line 108
    .line 109
    invoke-virtual/range {v10 .. v17}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_1
    iget-boolean v1, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportMiniWindow:Z

    .line 114
    .line 115
    if-eqz v1, :cond_2

    .line 116
    .line 117
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    int-to-float v1, v1

    .line 122
    iget-object v2, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectWidth:Ljava/lang/Float;

    .line 123
    .line 124
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    sub-float v11, v1, v2

    .line 129
    .line 130
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    int-to-float v13, v1

    .line 135
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    int-to-float v14, v1

    .line 140
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectCornerRadius:Ljava/lang/Float;

    .line 141
    .line 142
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 143
    .line 144
    .line 145
    move-result v15

    .line 146
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectCornerRadius:Ljava/lang/Float;

    .line 147
    .line 148
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 149
    .line 150
    .line 151
    move-result v16

    .line 152
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mPaint:Landroid/graphics/Paint;

    .line 153
    .line 154
    const/4 v12, 0x0

    .line 155
    move-object/from16 v10, p1

    .line 156
    .line 157
    move-object/from16 v17, v1

    .line 158
    .line 159
    invoke-virtual/range {v10 .. v17}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 160
    .line 161
    .line 162
    :cond_2
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 163
    .line 164
    iget-boolean v1, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportCasting:Z

    .line 165
    .line 166
    if-eqz v1, :cond_3

    .line 167
    .line 168
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mPaint:Landroid/graphics/Paint;

    .line 169
    .line 170
    iget v2, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectTransferInitColor:I

    .line 171
    .line 172
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 173
    .line 174
    .line 175
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectWidth:Ljava/lang/Float;

    .line 176
    .line 177
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 178
    .line 179
    .line 180
    move-result v13

    .line 181
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    int-to-float v14, v1

    .line 186
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectCornerRadius:Ljava/lang/Float;

    .line 187
    .line 188
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 189
    .line 190
    .line 191
    move-result v15

    .line 192
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mTransferAppRectCornerRadius:Ljava/lang/Float;

    .line 193
    .line 194
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 195
    .line 196
    .line 197
    move-result v16

    .line 198
    iget-object v1, v0, Lcom/android/quickstep/views/MiniWindowTipsView;->mPaint:Landroid/graphics/Paint;

    .line 199
    .line 200
    const/4 v11, 0x0

    .line 201
    const/4 v12, 0x0

    .line 202
    move-object/from16 v10, p1

    .line 203
    .line 204
    move-object/from16 v17, v1

    .line 205
    .line 206
    invoke-virtual/range {v10 .. v17}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 207
    .line 208
    .line 209
    :cond_3
    :goto_0
    invoke-super/range {p0 .. p1}, Landroid/widget/FrameLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 210
    .line 211
    .line 212
    return-void
.end method

.method public getViewRect(Landroid/graphics/RectF;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/view/ViewGroup;

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    new-array v1, v1, [F

    .line 15
    .line 16
    const v2, 0x7f0b03b9

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-static {p0, v0, v1, v2}, Lcom/android/launcher3/N5;->m(Landroid/view/View;Landroid/view/View;[FZ)F

    .line 25
    .line 26
    .line 27
    aget p0, v1, v2

    .line 28
    .line 29
    iput p0, p1, Landroid/graphics/RectF;->left:F

    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    aget v0, v1, v0

    .line 33
    .line 34
    iput v0, p1, Landroid/graphics/RectF;->top:F

    .line 35
    .line 36
    const/high16 v1, 0x3f800000    # 1.0f

    .line 37
    .line 38
    add-float/2addr v0, v1

    .line 39
    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    .line 40
    .line 41
    add-float/2addr p0, v1

    .line 42
    iput p0, p1, Landroid/graphics/RectF;->right:F

    .line 43
    .line 44
    return-void
.end method

.method public hideMiniWindowTipsView()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mHideTipsViewAnim:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->end()V

    .line 6
    .line 7
    .line 8
    :cond_0
    sget-object v0, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 9
    .line 10
    const/4 v1, 0x2

    .line 11
    new-array v1, v1, [F

    .line 12
    .line 13
    fill-array-data v1, :array_0

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mHideTipsViewAnim:Landroid/animation/ObjectAnimator;

    .line 21
    .line 22
    new-instance v1, Lcom/android/quickstep/views/MiniWindowTipsView$2;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Lcom/android/quickstep/views/MiniWindowTipsView$2;-><init>(Lcom/android/quickstep/views/MiniWindowTipsView;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mHideTipsViewAnim:Landroid/animation/ObjectAnimator;

    .line 31
    .line 32
    const-wide/16 v1, 0x96

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mHideTipsViewAnim:Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mYOverviewAnim:Lcom/android/launcher3/anim/q;

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 51
    .line 52
    .line 53
    :cond_1
    const/4 v0, 0x0

    .line 54
    iput-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 55
    .line 56
    iget v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectTransferInitColor:I

    .line 57
    .line 58
    iput v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectCurrentColor:I

    .line 59
    .line 60
    const/4 v0, 0x0

    .line 61
    iput v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentState:I

    .line 62
    .line 63
    return-void

    .line 64
    nop

    .line 65
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public hideRect()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mMessageView:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-boolean v1, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportMiniWindow:Z

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const v1, 0x7f140265

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const v1, 0x7f140267

    .line 16
    .line 17
    .line 18
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-boolean v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportCasting:Z

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRelayDeviceName:Ljava/lang/String;

    .line 34
    .line 35
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const v2, 0x7f140263

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v2, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    goto :goto_1

    .line 47
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const v1, 0x7f140266

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    :goto_1
    iget-object v1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCastAppMessageView:Landroid/widget/TextView;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectCurrentColor:I

    .line 64
    .line 65
    iget v1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectTransferInitColor:I

    .line 66
    .line 67
    invoke-direct {p0, v0, v1}, Lcom/android/quickstep/views/MiniWindowTipsView;->playRectAlphaAnimation(II)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b03c0

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/TextView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mMessageView:Landroid/widget/TextView;

    .line 14
    .line 15
    const v0, 0x7f0b03b8

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/widget/TextView;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCastAppMessageView:Landroid/widget/TextView;

    .line 25
    .line 26
    const v0, 0x7f0b03bf

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Landroid/widget/ImageView;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mIconView:Landroid/widget/ImageView;

    .line 36
    .line 37
    const v0, 0x7f0b03b9

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Landroid/widget/ImageView;

    .line 45
    .line 46
    iput-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCastAppIconView:Landroid/widget/ImageView;

    .line 47
    .line 48
    return-void
.end method

.method public setCastAppMessage(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCastAppMessageView:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setCurrentState(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentState:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/views/MiniWindowTipsView;->showRect()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setLauncher(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    return-void
.end method

.method public setSwipeUpHandler(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    return-void
.end method

.method public setupTranslationYAnimation(JF)V
    .locals 6

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/V;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 4
    .line 5
    .line 6
    iget p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mDeviceOrientation:I

    .line 7
    .line 8
    const/4 p2, 0x1

    .line 9
    if-eq p1, p2, :cond_1

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    if-ne p1, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    sget-object p1, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 16
    .line 17
    check-cast p1, Landroid/util/FloatProperty;

    .line 18
    .line 19
    move-object v2, p1

    .line 20
    move v4, p3

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    sget-object v1, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 23
    .line 24
    check-cast v1, Landroid/util/FloatProperty;

    .line 25
    .line 26
    if-ne p1, p2, :cond_2

    .line 27
    .line 28
    neg-float p3, p3

    .line 29
    :cond_2
    move v4, p3

    .line 30
    move-object v2, v1

    .line 31
    :goto_1
    const/4 v3, 0x0

    .line 32
    sget-object v5, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 33
    .line 34
    move-object v1, p0

    .line 35
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iput-object p0, v1, Lcom/android/quickstep/views/MiniWindowTipsView;->mYOverviewAnim:Lcom/android/launcher3/anim/q;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public showRect()V
    .locals 5

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectCurrentColor:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentState:I

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    const/4 v3, 0x1

    .line 7
    if-eq v1, v3, :cond_2

    .line 8
    .line 9
    if-eq v1, v2, :cond_2

    .line 10
    .line 11
    const/4 v2, 0x3

    .line 12
    if-eq v1, v2, :cond_1

    .line 13
    .line 14
    const/4 v2, 0x4

    .line 15
    if-eq v1, v2, :cond_0

    .line 16
    .line 17
    iget v1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectTransferInitColor:I

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCastAppMessageView:Landroid/widget/TextView;

    .line 21
    .line 22
    const v2, 0x7f140268

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectTransferSuccessColor:I

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    iget-object v1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCastAppMessageView:Landroid/widget/TextView;

    .line 32
    .line 33
    const v2, 0x7f140269

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 37
    .line 38
    .line 39
    iget v1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectTransferFailureColor:I

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    if-ne v1, v2, :cond_3

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const v2, 0x7f140264

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    goto :goto_0

    .line 56
    :cond_3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget-object v2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCastAppMessageView:Landroid/widget/TextView;

    .line 61
    .line 62
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    const v4, 0x7f14026a

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, v4, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    :goto_0
    iget-object v2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCastAppMessageView:Landroid/widget/TextView;

    .line 74
    .line 75
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    iget v1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectTransferingColor:I

    .line 79
    .line 80
    :goto_1
    invoke-direct {p0, v0, v1}, Lcom/android/quickstep/views/MiniWindowTipsView;->playRectAlphaAnimation(II)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 84
    .line 85
    if-eqz v0, :cond_4

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->performHapticFeedback()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-static {p0, v3}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->setMiniWindowWeakenMode(Landroid/content/Context;Z)V

    .line 99
    .line 100
    .line 101
    :cond_4
    return-void
.end method

.method public updateChildViewVisiblity(Z)V
    .locals 4

    .line 1
    const-string v0, "MiniWindowTipsView"

    .line 2
    .line 3
    const-string v1, "updateChildViewVisiblity"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCastAppIconView:Landroid/widget/ImageView;

    .line 9
    .line 10
    const/4 v1, 0x4

    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    move v3, v2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v3, v1

    .line 17
    :goto_0
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCastAppMessageView:Landroid/widget/TextView;

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    move v1, v2

    .line 25
    :cond_1
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public updateDisplacement(Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/RectF;Lcom/android/quickstep/views/MiniWindowTipsView$UpdateDisplacementCallback;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "MiniWindowTipsView"

    .line 6
    .line 7
    const-string p1, "swipeup handler is null"

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 14
    .line 15
    iget v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRealTipsViewMovingSlop:F

    .line 16
    .line 17
    sub-float v1, v0, p1

    .line 18
    .line 19
    iget v2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRealTriggerMiniWindowSlop:F

    .line 20
    .line 21
    sub-float v2, v0, v2

    .line 22
    .line 23
    div-float/2addr v1, v2

    .line 24
    cmpg-float v0, p1, v0

    .line 25
    .line 26
    const/4 v2, -0x1

    .line 27
    if-gtz v0, :cond_1

    .line 28
    .line 29
    invoke-direct {p0, p3}, Lcom/android/quickstep/views/MiniWindowTipsView;->getTiggerType(Landroid/graphics/RectF;)I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    move p3, v2

    .line 35
    :goto_0
    const/4 v0, 0x0

    .line 36
    const/4 v3, 0x1

    .line 37
    if-eq p3, v2, :cond_4

    .line 38
    .line 39
    const/4 v4, 0x2

    .line 40
    if-ne p3, v4, :cond_2

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_2
    if-nez p3, :cond_3

    .line 44
    .line 45
    :goto_1
    move p2, v3

    .line 46
    goto :goto_3

    .line 47
    :cond_3
    move p2, v0

    .line 48
    goto :goto_3

    .line 49
    :cond_4
    :goto_2
    iget v4, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mDeviceOrientation:I

    .line 50
    .line 51
    if-ne v4, v3, :cond_5

    .line 52
    .line 53
    iget p2, p2, Landroid/graphics/PointF;->y:F

    .line 54
    .line 55
    iget v4, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mLeftSlop:F

    .line 56
    .line 57
    cmpg-float p2, p2, v4

    .line 58
    .line 59
    if-gez p2, :cond_3

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_5
    const/4 v5, 0x3

    .line 63
    if-ne v4, v5, :cond_6

    .line 64
    .line 65
    iget p2, p2, Landroid/graphics/PointF;->y:F

    .line 66
    .line 67
    iget v4, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mLeftSlop:F

    .line 68
    .line 69
    cmpl-float p2, p2, v4

    .line 70
    .line 71
    if-lez p2, :cond_3

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_6
    iget p2, p2, Landroid/graphics/PointF;->x:F

    .line 75
    .line 76
    iget v4, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mLeftSlop:F

    .line 77
    .line 78
    cmpg-float p2, p2, v4

    .line 79
    .line 80
    if-gez p2, :cond_3

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :goto_3
    iget v4, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRealTipsViewMovingSlop:F

    .line 84
    .line 85
    cmpl-float v5, p1, v4

    .line 86
    .line 87
    if-lez v5, :cond_8

    .line 88
    .line 89
    iput-boolean v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mPassedTipsViewMovingSlop:Z

    .line 90
    .line 91
    iget-boolean p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectShown:Z

    .line 92
    .line 93
    if-eqz p1, :cond_18

    .line 94
    .line 95
    iput v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentState:I

    .line 96
    .line 97
    iget p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentWorkspaceTextColor:I

    .line 98
    .line 99
    if-eq p1, v2, :cond_7

    .line 100
    .line 101
    invoke-direct {p0, p1, p1}, Lcom/android/quickstep/views/MiniWindowTipsView;->updateIconTextColor(II)V

    .line 102
    .line 103
    .line 104
    :cond_7
    invoke-virtual {p0}, Lcom/android/quickstep/views/MiniWindowTipsView;->hideRect()V

    .line 105
    .line 106
    .line 107
    iput-boolean v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectShown:Z

    .line 108
    .line 109
    goto/16 :goto_a

    .line 110
    .line 111
    :cond_8
    cmpg-float p1, p1, v4

    .line 112
    .line 113
    const v4, 0x7f140263

    .line 114
    .line 115
    .line 116
    const v5, 0x7f140265

    .line 117
    .line 118
    .line 119
    const v6, 0x7f140266

    .line 120
    .line 121
    .line 122
    const v7, 0x7f140267

    .line 123
    .line 124
    .line 125
    if-gtz p1, :cond_d

    .line 126
    .line 127
    if-gez p3, :cond_d

    .line 128
    .line 129
    iget-boolean p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mPassedTipsViewMovingSlop:Z

    .line 130
    .line 131
    if-nez p1, :cond_b

    .line 132
    .line 133
    iput-boolean v3, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mPassedTipsViewMovingSlop:Z

    .line 134
    .line 135
    iget-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mMessageView:Landroid/widget/TextView;

    .line 136
    .line 137
    iget-object p3, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 138
    .line 139
    iget-boolean p3, p3, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportMiniWindow:Z

    .line 140
    .line 141
    if-eqz p3, :cond_9

    .line 142
    .line 143
    goto :goto_4

    .line 144
    :cond_9
    move v5, v7

    .line 145
    :goto_4
    invoke-virtual {p1, v5}, Landroid/widget/TextView;->setText(I)V

    .line 146
    .line 147
    .line 148
    iget-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 149
    .line 150
    iget-boolean p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportCasting:Z

    .line 151
    .line 152
    if-eqz p1, :cond_a

    .line 153
    .line 154
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    iget-object p3, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRelayDeviceName:Ljava/lang/String;

    .line 159
    .line 160
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object p3

    .line 164
    invoke-virtual {p1, v4, p3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    goto :goto_5

    .line 169
    :cond_a
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    invoke-virtual {p1, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    :goto_5
    iget-object p3, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCastAppMessageView:Landroid/widget/TextView;

    .line 178
    .line 179
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 180
    .line 181
    .line 182
    :cond_b
    iget-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mYOverviewAnim:Lcom/android/launcher3/anim/q;

    .line 183
    .line 184
    invoke-virtual {p1, v1}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 185
    .line 186
    .line 187
    iget-boolean p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectShown:Z

    .line 188
    .line 189
    if-eqz p1, :cond_18

    .line 190
    .line 191
    iput v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentState:I

    .line 192
    .line 193
    iget p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentWorkspaceTextColor:I

    .line 194
    .line 195
    if-eq p1, v2, :cond_c

    .line 196
    .line 197
    invoke-direct {p0, p1, p1}, Lcom/android/quickstep/views/MiniWindowTipsView;->updateIconTextColor(II)V

    .line 198
    .line 199
    .line 200
    :cond_c
    invoke-virtual {p0}, Lcom/android/quickstep/views/MiniWindowTipsView;->hideRect()V

    .line 201
    .line 202
    .line 203
    iput-boolean v0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectShown:Z

    .line 204
    .line 205
    goto/16 :goto_a

    .line 206
    .line 207
    :cond_d
    if-ltz p3, :cond_18

    .line 208
    .line 209
    iget-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mYOverviewAnim:Lcom/android/launcher3/anim/q;

    .line 210
    .line 211
    invoke-virtual {p1, v1}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 212
    .line 213
    .line 214
    iput-boolean v3, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mPassedTipsViewMovingSlop:Z

    .line 215
    .line 216
    iget-boolean p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectShown:Z

    .line 217
    .line 218
    if-eqz p1, :cond_e

    .line 219
    .line 220
    iget-boolean p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mIfLeftHang:Z

    .line 221
    .line 222
    if-eq p1, p2, :cond_18

    .line 223
    .line 224
    :cond_e
    if-eqz p2, :cond_12

    .line 225
    .line 226
    iget-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 227
    .line 228
    iget-boolean p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportCasting:Z

    .line 229
    .line 230
    if-eqz p1, :cond_f

    .line 231
    .line 232
    invoke-virtual {p0, v3}, Lcom/android/quickstep/views/MiniWindowTipsView;->setCurrentState(I)V

    .line 233
    .line 234
    .line 235
    :cond_f
    iget-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 236
    .line 237
    iget-boolean p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportCasting:Z

    .line 238
    .line 239
    if-eqz p1, :cond_10

    .line 240
    .line 241
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    iget-object p3, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRelayDeviceName:Ljava/lang/String;

    .line 246
    .line 247
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object p3

    .line 251
    const v0, 0x7f14026a

    .line 252
    .line 253
    .line 254
    invoke-virtual {p1, v0, p3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object p1

    .line 258
    goto :goto_6

    .line 259
    :cond_10
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    invoke-virtual {p1, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    :goto_6
    iget-object p3, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCastAppMessageView:Landroid/widget/TextView;

    .line 268
    .line 269
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 270
    .line 271
    .line 272
    iget-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mMessageView:Landroid/widget/TextView;

    .line 273
    .line 274
    iget-object p3, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 275
    .line 276
    iget-boolean p3, p3, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportMiniWindow:Z

    .line 277
    .line 278
    if-eqz p3, :cond_11

    .line 279
    .line 280
    goto :goto_7

    .line 281
    :cond_11
    move v5, v7

    .line 282
    :goto_7
    invoke-virtual {p1, v5}, Landroid/widget/TextView;->setText(I)V

    .line 283
    .line 284
    .line 285
    iget p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentWorkspaceTextColor:I

    .line 286
    .line 287
    if-eq p1, v2, :cond_16

    .line 288
    .line 289
    invoke-direct {p0, p1, v2}, Lcom/android/quickstep/views/MiniWindowTipsView;->updateIconTextColor(II)V

    .line 290
    .line 291
    .line 292
    goto :goto_9

    .line 293
    :cond_12
    iget-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 294
    .line 295
    iget-boolean p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportMiniWindow:Z

    .line 296
    .line 297
    if-eqz p1, :cond_13

    .line 298
    .line 299
    invoke-virtual {p0, v3}, Lcom/android/quickstep/views/MiniWindowTipsView;->setCurrentState(I)V

    .line 300
    .line 301
    .line 302
    :cond_13
    iget-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mMessageView:Landroid/widget/TextView;

    .line 303
    .line 304
    iget-object p3, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 305
    .line 306
    iget-boolean p3, p3, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportMiniWindow:Z

    .line 307
    .line 308
    if-eqz p3, :cond_14

    .line 309
    .line 310
    const v7, 0x7f14026b

    .line 311
    .line 312
    .line 313
    :cond_14
    invoke-virtual {p1, v7}, Landroid/widget/TextView;->setText(I)V

    .line 314
    .line 315
    .line 316
    iget-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mSwipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 317
    .line 318
    iget-boolean p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportCasting:Z

    .line 319
    .line 320
    if-eqz p1, :cond_15

    .line 321
    .line 322
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 323
    .line 324
    .line 325
    move-result-object p1

    .line 326
    iget-object p3, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRelayDeviceName:Ljava/lang/String;

    .line 327
    .line 328
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    move-result-object p3

    .line 332
    invoke-virtual {p1, v4, p3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object p1

    .line 336
    goto :goto_8

    .line 337
    :cond_15
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    invoke-virtual {p1, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object p1

    .line 345
    :goto_8
    iget-object p3, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCastAppMessageView:Landroid/widget/TextView;

    .line 346
    .line 347
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 348
    .line 349
    .line 350
    iget p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mCurrentWorkspaceTextColor:I

    .line 351
    .line 352
    if-eq p1, v2, :cond_16

    .line 353
    .line 354
    invoke-direct {p0, v2, p1}, Lcom/android/quickstep/views/MiniWindowTipsView;->updateIconTextColor(II)V

    .line 355
    .line 356
    .line 357
    :cond_16
    :goto_9
    iget-boolean p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mIfLeftHang:Z

    .line 358
    .line 359
    if-eq p1, p2, :cond_17

    .line 360
    .line 361
    iput-boolean p2, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mIfLeftHang:Z

    .line 362
    .line 363
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 364
    .line 365
    .line 366
    :cond_17
    iget-boolean p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectShown:Z

    .line 367
    .line 368
    if-nez p1, :cond_18

    .line 369
    .line 370
    iput-boolean v3, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectShown:Z

    .line 371
    .line 372
    :cond_18
    :goto_a
    iget-boolean p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mPassedTipsViewMovingSlop:Z

    .line 373
    .line 374
    iget-boolean p0, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mRectShown:Z

    .line 375
    .line 376
    invoke-interface {p4, p1, p0, p2}, Lcom/android/quickstep/views/MiniWindowTipsView$UpdateDisplacementCallback;->get(ZZZ)V

    .line 377
    .line 378
    .line 379
    return-void
.end method
