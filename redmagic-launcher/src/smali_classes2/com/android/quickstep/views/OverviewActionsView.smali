.class public Lcom/android/quickstep/views/OverviewActionsView;
.super Landroid/widget/FrameLayout;
.source "OverviewActionsView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/launcher3/g1;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/OverviewActionsView$SplitButtonHiddenFlags;,
        Lcom/android/quickstep/views/OverviewActionsView$ActionsDisabledFlags;,
        Lcom/android/quickstep/views/OverviewActionsView$ActionsHiddenFlags;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/android/quickstep/TaskOverlayFactory$OverlayUICallbacks;",
        ">",
        "Landroid/widget/FrameLayout;",
        "Landroid/view/View$OnClickListener;",
        "Lcom/android/launcher3/g1;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final ACTIONS_ALPHAS:I = 0x0

.field public static final DISABLED_NO_THUMBNAIL:I = 0x4

.field public static final DISABLED_ROTATED:I = 0x2

.field public static final DISABLED_SCROLLING:I = 0x1

.field public static final FLAG_SMALL_SCREEN_HIDE_SPLIT:I = 0x1

.field private static final GROUP_ACTIONS_ALPHAS:I = 0x1

.field public static final HIDDEN_ACTIONS_IN_MENU:I = 0x20

.field public static final HIDDEN_DESKTOP:I = 0x40

.field public static final HIDDEN_NON_ZERO_ROTATION:I = 0x1

.field public static final HIDDEN_NO_RECENTS:I = 0x4

.field public static final HIDDEN_NO_TASKS:I = 0x2

.field public static final HIDDEN_SPLIT_SCREEN:I = 0x8

.field public static final HIDDEN_SPLIT_SELECT_ACTIVE:I = 0x10

.field private static final INDEX_3P_LAUNCHER:I = 0x7

.field private static final INDEX_CONTENT_ALPHA:I = 0x0

.field private static final INDEX_FULLSCREEN_ALPHA:I = 0x2

.field private static final INDEX_GROUPED_ALPHA:I = 0x6

.field private static final INDEX_HIDDEN_FLAGS_ALPHA:I = 0x3

.field private static final INDEX_SCROLL_ALPHA:I = 0x5

.field private static final INDEX_SHARE_TARGET_ALPHA:I = 0x4

.field private static final INDEX_VISIBILITY_ALPHA:I = 0x1

.field private static final NUM_ALPHAS:I = 0x8

.field public static final TAG:Ljava/lang/String; = "OverviewActionsView"


# instance fields
.field protected mActionButtons:Landroid/widget/RelativeLayout;

.field private final mAlphaProperties:[Lcom/android/launcher3/anim/d;

.field protected mCallbacks:Lcom/android/quickstep/TaskOverlayFactory$OverlayUICallbacks;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private mCanSaveAppPair:Z

.field private mClearAllButton:Landroid/widget/ImageView;

.field private mClearAllButtonLayout:Landroid/widget/LinearLayout;

.field private mColor:I

.field protected mDisabledFlags:I

.field protected mDp:Lcom/android/launcher3/h0;

.field private mHiddenFlags:I

.field private final mInsets:Landroid/graphics/Rect;

.field private mIsGroupedTask:Z

.field private final mMultiValueAlphas:[Lcom/android/launcher3/util/B1;

.field private mOverviewActionsViewMarginBottomTableLand:I

.field private mSaveAppPairButton:Landroid/widget/Button;

.field private mSplitButton:Landroid/widget/Button;

.field private mSplitButtonHiddenFlags:I
    .annotation build Lcom/android/quickstep/views/OverviewActionsView$SplitButtonHiddenFlags;
    .end annotation
.end field

.field private final mTaskSize:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/views/OverviewActionsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/quickstep/views/OverviewActionsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 3
    invoke-direct {p0, p1, p2, p3, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 4
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mInsets:Landroid/graphics/Rect;

    const/16 p1, 0x8

    .line 5
    new-array p1, p1, [Lcom/android/launcher3/anim/d;

    iput-object p1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mAlphaProperties:[Lcom/android/launcher3/anim/d;

    const/4 p1, 0x2

    .line 6
    new-array p1, p1, [Lcom/android/launcher3/util/B1;

    iput-object p1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mMultiValueAlphas:[Lcom/android/launcher3/util/B1;

    .line 7
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mTaskSize:Landroid/graphics/Rect;

    .line 8
    iput-boolean v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mIsGroupedTask:Z

    .line 9
    iput-boolean v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mCanSaveAppPair:Z

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/views/OverviewActionsView;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/OverviewActionsView;->lambda$onFinishInflate$1(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/util/B1;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/B1;->setUpdateVisibility(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private getActionsAlphas()Lcom/android/launcher3/util/B1;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mMultiValueAlphas:[Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    return-object p0
.end method

.method private getBottomMargin()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mDp:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mDp:Lcom/android/launcher3/h0;

    .line 18
    .line 19
    iget p0, p0, Lcom/android/launcher3/h0;->s3:I

    .line 20
    .line 21
    return p0

    .line 22
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mDp:Lcom/android/launcher3/h0;

    .line 23
    .line 24
    iget v1, v0, Lcom/android/launcher3/h0;->U0:I

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mTaskSize:Landroid/graphics/Rect;

    .line 27
    .line 28
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 29
    .line 30
    sub-int/2addr v1, p0

    .line 31
    iget p0, v0, Lcom/android/launcher3/h0;->U2:I

    .line 32
    .line 33
    sub-int/2addr v1, p0

    .line 34
    iget p0, v0, Lcom/android/launcher3/h0;->T2:I

    .line 35
    .line 36
    sub-int/2addr v1, p0

    .line 37
    return v1
.end method

.method private getGroupActionsAlphas()Lcom/android/launcher3/util/B1;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mMultiValueAlphas:[Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    return-object p0
.end method

.method private synthetic lambda$onFinishInflate$1(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mMultiValueAlphas:[Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    :goto_0
    if-ge v2, v1, :cond_0

    .line 6
    .line 7
    aget-object v3, v0, v2

    .line 8
    .line 9
    invoke-virtual {v3, p1}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    iget-object v4, p0, Lcom/android/quickstep/views/OverviewActionsView;->mAlphaProperties:[Lcom/android/launcher3/anim/d;

    .line 14
    .line 15
    aget-object v4, v4, p1

    .line 16
    .line 17
    iget v4, v4, Lcom/android/launcher3/anim/d;->d:F

    .line 18
    .line 19
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 20
    .line 21
    .line 22
    add-int/lit8 v2, v2, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method private updateActionBarPosition(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method private updateActionButtonsVisibility()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mDp:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean v1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mIsGroupedTask:Z

    .line 7
    .line 8
    xor-int/lit8 v2, v1, 0x1

    .line 9
    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-boolean v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mCanSaveAppPair:Z

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 v0, 0x0

    .line 23
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    const-string v4, "updateActionButtonsVisibility() called: showSingleTaskActions = ["

    .line 29
    .line 30
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v2, "], showGroupActions = ["

    .line 37
    .line 38
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v2, "]"

    .line 45
    .line 46
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const-string v3, "OverviewActionsView"

    .line 54
    .line 55
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    invoke-direct {p0}, Lcom/android/quickstep/views/OverviewActionsView;->getActionsAlphas()Lcom/android/launcher3/util/B1;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    const/4 v3, 0x6

    .line 63
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    const/4 v4, 0x0

    .line 68
    const/high16 v5, 0x3f800000    # 1.0f

    .line 69
    .line 70
    if-nez v1, :cond_2

    .line 71
    .line 72
    move v1, v5

    .line 73
    goto :goto_1

    .line 74
    :cond_2
    move v1, v4

    .line 75
    :goto_1
    invoke-virtual {v2, v1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 76
    .line 77
    .line 78
    invoke-direct {p0}, Lcom/android/quickstep/views/OverviewActionsView;->getGroupActionsAlphas()Lcom/android/launcher3/util/B1;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0, v3}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    if-eqz v0, :cond_3

    .line 87
    .line 88
    move v4, v5

    .line 89
    :cond_3
    invoke-virtual {p0, v4}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method private updateBottomMargin()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget-boolean v1, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Lx1/O;->a0(Landroid/content/res/Resources;)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/16 v2, 0x174

    .line 36
    .line 37
    if-lt v1, v2, :cond_0

    .line 38
    .line 39
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 40
    .line 41
    iget v0, v0, Lcom/android/launcher3/r4;->R:I

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 45
    .line 46
    iget v0, v0, Lcom/android/launcher3/r4;->R:I

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const v2, 0x7f070958

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    add-int/2addr v0, v1

    .line 60
    :goto_0
    iput v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mOverviewActionsViewMarginBottomTableLand:I

    .line 61
    .line 62
    :cond_1
    return-void
.end method

.method private updateForIsTablet()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/OverviewActionsView;->updateActionButtonsVisibility()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private updatePadding()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mInsets:Landroid/graphics/Rect;

    .line 2
    .line 3
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 7
    .line 8
    invoke-virtual {p0, v1, v2, v0, v2}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public areActionsButtonsVisible()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mActionButtons:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mSaveAppPairButton:Landroid/widget/Button;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/Button;->getVisibility()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public getContentAlpha()Lcom/android/launcher3/anim/d;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mAlphaProperties:[Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    return-object p0
.end method

.method public getFullscreenAlpha()Lcom/android/launcher3/anim/d;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mAlphaProperties:[Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    return-object p0
.end method

.method public getIndexScrollAlpha()Lcom/android/launcher3/anim/d;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mAlphaProperties:[Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    const/4 v0, 0x5

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    return-object p0
.end method

.method public getShareTargetAlpha()Lcom/android/launcher3/anim/d;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mAlphaProperties:[Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    return-object p0
.end method

.method public getVisibilityAlpha()Lcom/android/launcher3/anim/d;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mAlphaProperties:[Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    return-object p0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mCallbacks:Lcom/android/quickstep/TaskOverlayFactory$OverlayUICallbacks;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const v1, 0x7f0b0064

    .line 11
    .line 12
    .line 13
    if-ne v0, v1, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mCallbacks:Lcom/android/quickstep/TaskOverlayFactory$OverlayUICallbacks;

    .line 16
    .line 17
    invoke-interface {p0}, Lcom/android/quickstep/TaskOverlayFactory$OverlayUICallbacks;->onScreenshot()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    const v1, 0x7f0b04d7

    .line 22
    .line 23
    .line 24
    if-ne v0, v1, :cond_2

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mClearAllButton:Landroid/widget/ImageView;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Landroid/graphics/drawable/AnimatedVectorDrawable;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/graphics/drawable/AnimatedVectorDrawable;->start()V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mCallbacks:Lcom/android/quickstep/TaskOverlayFactory$OverlayUICallbacks;

    .line 38
    .line 39
    invoke-interface {p0, p1}, Lcom/android/quickstep/TaskOverlayFactory$OverlayUICallbacks;->onRemove(Landroid/view/View;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    const p1, 0x7f0b0063

    .line 44
    .line 45
    .line 46
    if-ne v0, p1, :cond_3

    .line 47
    .line 48
    iget-object p0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mCallbacks:Lcom/android/quickstep/TaskOverlayFactory$OverlayUICallbacks;

    .line 49
    .line 50
    invoke-interface {p0}, Lcom/android/quickstep/TaskOverlayFactory$OverlayUICallbacks;->onSaveAppPair()V

    .line 51
    .line 52
    .line 53
    :cond_3
    :goto_0
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/views/OverviewActionsView;->updateBottomMargin()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/OverviewActionsView;->updateVerticalMargin(Lcom/android/launcher3/util/C1;)I

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method protected onFinishInflate()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b0045

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/RelativeLayout;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mActionButtons:Landroid/widget/RelativeLayout;

    .line 14
    .line 15
    const v0, 0x7f0b0063

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/widget/Button;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mSaveAppPairButton:Landroid/widget/Button;

    .line 25
    .line 26
    sget-object v1, Lcom/android/wm/shell/shared/o$b;->q:Lcom/android/wm/shell/shared/o$b;

    .line 27
    .line 28
    invoke-static {v0, v1}, Lcom/android/wm/shell/shared/o;->a(Landroid/widget/TextView;Lcom/android/wm/shell/shared/o$b;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mMultiValueAlphas:[Lcom/android/launcher3/util/B1;

    .line 32
    .line 33
    new-instance v1, Lcom/android/launcher3/util/B1;

    .line 34
    .line 35
    iget-object v2, p0, Lcom/android/quickstep/views/OverviewActionsView;->mActionButtons:Landroid/widget/RelativeLayout;

    .line 36
    .line 37
    const/16 v3, 0x8

    .line 38
    .line 39
    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/util/B1;-><init>(Landroid/view/View;I)V

    .line 40
    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    aput-object v1, v0, v2

    .line 44
    .line 45
    iget-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mMultiValueAlphas:[Lcom/android/launcher3/util/B1;

    .line 46
    .line 47
    new-instance v1, Lcom/android/launcher3/util/B1;

    .line 48
    .line 49
    iget-object v4, p0, Lcom/android/quickstep/views/OverviewActionsView;->mSaveAppPairButton:Landroid/widget/Button;

    .line 50
    .line 51
    invoke-direct {v1, v4, v3}, Lcom/android/launcher3/util/B1;-><init>(Landroid/view/View;I)V

    .line 52
    .line 53
    .line 54
    const/4 v4, 0x1

    .line 55
    aput-object v1, v0, v4

    .line 56
    .line 57
    iget-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mMultiValueAlphas:[Lcom/android/launcher3/util/B1;

    .line 58
    .line 59
    invoke-static {v0}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Lcom/android/quickstep/views/u;

    .line 64
    .line 65
    invoke-direct {v1}, Lcom/android/quickstep/views/u;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 69
    .line 70
    .line 71
    :goto_0
    if-ge v2, v3, :cond_0

    .line 72
    .line 73
    iget-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mAlphaProperties:[Lcom/android/launcher3/anim/d;

    .line 74
    .line 75
    new-instance v1, Lcom/android/launcher3/anim/d;

    .line 76
    .line 77
    new-instance v4, Lcom/android/quickstep/views/v;

    .line 78
    .line 79
    invoke-direct {v4, p0, v2}, Lcom/android/quickstep/views/v;-><init>(Lcom/android/quickstep/views/OverviewActionsView;I)V

    .line 80
    .line 81
    .line 82
    const/high16 v5, 0x3f800000    # 1.0f

    .line 83
    .line 84
    invoke-direct {v1, v4, v5}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;F)V

    .line 85
    .line 86
    .line 87
    aput-object v1, v0, v2

    .line 88
    .line 89
    add-int/lit8 v2, v2, 0x1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_0
    const v0, 0x7f0b0064

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Landroid/widget/ImageView;

    .line 100
    .line 101
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    .line 103
    .line 104
    const v0, 0x7f0b0066

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    check-cast v0, Landroid/widget/Button;

    .line 112
    .line 113
    iput-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mSplitButton:Landroid/widget/Button;

    .line 114
    .line 115
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    .line 117
    .line 118
    const v0, 0x7f0b04d6

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    check-cast v0, Landroid/widget/ImageView;

    .line 126
    .line 127
    iput-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mClearAllButton:Landroid/widget/ImageView;

    .line 128
    .line 129
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eqz v0, :cond_1

    .line 138
    .line 139
    iget-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mClearAllButton:Landroid/widget/ImageView;

    .line 140
    .line 141
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 146
    .line 147
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    const v2, 0x7f07095b

    .line 152
    .line 153
    .line 154
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 159
    .line 160
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 161
    .line 162
    :cond_1
    const v0, 0x7f0b04d7

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    check-cast v0, Landroid/widget/LinearLayout;

    .line 170
    .line 171
    iput-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mClearAllButtonLayout:Landroid/widget/LinearLayout;

    .line 172
    .line 173
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-static {v1}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    const v2, 0x7f040781

    .line 189
    .line 190
    .line 191
    invoke-static {v0, v2, v1}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/OverviewActionsView;->onForeColorChanged(I)V

    .line 196
    .line 197
    .line 198
    invoke-direct {p0}, Lcom/android/quickstep/views/OverviewActionsView;->updateBottomMargin()V

    .line 199
    .line 200
    .line 201
    iget-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mSaveAppPairButton:Landroid/widget/Button;

    .line 202
    .line 203
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 204
    .line 205
    .line 206
    return-void
.end method

.method public onForeColorChanged(I)V
    .locals 3

    .line 1
    const/4 v0, -0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    move p1, v0

    .line 5
    :cond_0
    iput p1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mColor:I

    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v2, "onForeColorChanged: color: "

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "OverviewActionsView"

    .line 29
    .line 30
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    const v1, 0x7f0b0064

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Landroid/widget/ImageView;

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    iget-object v1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mClearAllButton:Landroid/widget/ImageView;

    .line 58
    .line 59
    if-eqz v1, :cond_3

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    if-ne p1, v0, :cond_2

    .line 66
    .line 67
    const p1, 0x7f081149

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    const p1, 0x7f081148

    .line 72
    .line 73
    .line 74
    :goto_0
    invoke-static {v1, p1}, Lz/a;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iget-object p0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mClearAllButton:Landroid/widget/ImageView;

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 81
    .line 82
    .line 83
    :cond_3
    return-void
.end method

.method public setCallbacks(Lcom/android/quickstep/TaskOverlayFactory$OverlayUICallbacks;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mCallbacks:Lcom/android/quickstep/TaskOverlayFactory$OverlayUICallbacks;

    .line 2
    .line 3
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mInsets:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/OverviewActionsView;->updateVerticalMargin(Lcom/android/launcher3/util/C1;)I

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Lcom/android/quickstep/views/OverviewActionsView;->updatePadding()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setOrientationState(Lcom/android/quickstep/util/RecentsOrientedState;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mDp:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p1}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setPivotX(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setPivotY(F)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mDp:Lcom/android/launcher3/h0;

    .line 26
    .line 27
    iget v1, v1, Lcom/android/launcher3/h0;->T2:I

    .line 28
    .line 29
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/OverviewActionsView;->updateVerticalMargin(Lcom/android/launcher3/util/C1;)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iget-object v2, p0, Lcom/android/quickstep/views/OverviewActionsView;->mDp:Lcom/android/launcher3/h0;

    .line 37
    .line 38
    invoke-interface {p1, p0, v0, v1, v2}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setOverviewActionsLayoutParams(Landroid/view/View;Landroid/widget/FrameLayout$LayoutParams;ILcom/android/launcher3/h0;)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    .line 44
    .line 45
    invoke-interface {p1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getDegreesRotated()F

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setRotation(F)V

    .line 50
    .line 51
    .line 52
    int-to-float p1, v1

    .line 53
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setX(F)V

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_0
    return-void
.end method

.method public updateDimension(Lcom/android/launcher3/h0;Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mDp:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mTaskSize:Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-static {p2}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p0, p2}, Lcom/android/quickstep/views/OverviewActionsView;->updateVerticalMargin(Lcom/android/launcher3/util/C1;)I

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Lcom/android/quickstep/views/OverviewActionsView;->updateForIsTablet()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->requestLayout()V

    .line 23
    .line 24
    .line 25
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->Q0:Z

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const p1, 0x7f080d67

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const p1, 0x7f080d68

    .line 34
    .line 35
    .line 36
    :goto_0
    iget-object p0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mSaveAppPairButton:Landroid/widget/Button;

    .line 37
    .line 38
    const/4 p2, 0x0

    .line 39
    invoke-virtual {p0, p1, p2, p2, p2}, Landroid/widget/Button;->setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public updateDisabledFlags(IZ)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget p2, p0, Lcom/android/quickstep/views/OverviewActionsView;->mDisabledFlags:I

    .line 4
    .line 5
    or-int/2addr p1, p2

    .line 6
    iput p1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mDisabledFlags:I

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget p2, p0, Lcom/android/quickstep/views/OverviewActionsView;->mDisabledFlags:I

    .line 10
    .line 11
    not-int p1, p1

    .line 12
    and-int/2addr p1, p2

    .line 13
    iput p1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mDisabledFlags:I

    .line 14
    .line 15
    :goto_0
    iget p1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mDisabledFlags:I

    .line 16
    .line 17
    and-int/lit8 p1, p1, -0x3

    .line 18
    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    goto :goto_1

    .line 23
    :cond_1
    const/4 p1, 0x0

    .line 24
    :goto_1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/LayoutUtils;->setViewEnabled(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public updateFor3pLauncher(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/OverviewActionsView;->getGroupActionsAlphas()Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x7

    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public updateForGroupedTask(ZZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "updateForGroupedTask() called with: isGroupedTask = ["

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, "], canSaveAppPair = ["

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, "]"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "OverviewActionsView"

    .line 32
    .line 33
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iput-boolean p1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mIsGroupedTask:Z

    .line 37
    .line 38
    iput-boolean p2, p0, Lcom/android/quickstep/views/OverviewActionsView;->mCanSaveAppPair:Z

    .line 39
    .line 40
    invoke-direct {p0}, Lcom/android/quickstep/views/OverviewActionsView;->updateActionButtonsVisibility()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public updateHiddenFlags(IZ)V
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget p2, p0, Lcom/android/quickstep/views/OverviewActionsView;->mHiddenFlags:I

    .line 4
    .line 5
    or-int/2addr p1, p2

    .line 6
    iput p1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mHiddenFlags:I

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget p2, p0, Lcom/android/quickstep/views/OverviewActionsView;->mHiddenFlags:I

    .line 10
    .line 11
    not-int p1, p1

    .line 12
    and-int/2addr p1, p2

    .line 13
    iput p1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mHiddenFlags:I

    .line 14
    .line 15
    :goto_0
    iget p1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mHiddenFlags:I

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    const/4 p1, 0x0

    .line 22
    :goto_1
    if-nez p1, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    const v1, 0x7f040781

    .line 37
    .line 38
    .line 39
    invoke-static {p2, v1, v0}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    iget v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mColor:I

    .line 44
    .line 45
    if-eq p2, v0, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0, p2}, Lcom/android/quickstep/views/OverviewActionsView;->onForeColorChanged(I)V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mAlphaProperties:[Lcom/android/launcher3/anim/d;

    .line 51
    .line 52
    const/4 p2, 0x3

    .line 53
    aget-object p0, p0, p2

    .line 54
    .line 55
    if-eqz p1, :cond_3

    .line 56
    .line 57
    const/4 p1, 0x0

    .line 58
    goto :goto_2

    .line 59
    :cond_3
    const/high16 p1, 0x3f800000    # 1.0f

    .line 60
    .line 61
    :goto_2
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method updateSplitButtonHiddenFlags(IZ)V
    .locals 1
    .param p1    # I
        .annotation build Lcom/android/quickstep/views/OverviewActionsView$SplitButtonHiddenFlags;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mSplitButton:Landroid/widget/Button;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    if-eqz p2, :cond_1

    .line 7
    .line 8
    iget p2, p0, Lcom/android/quickstep/views/OverviewActionsView;->mSplitButtonHiddenFlags:I

    .line 9
    .line 10
    or-int/2addr p1, p2

    .line 11
    iput p1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mSplitButtonHiddenFlags:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    iget p2, p0, Lcom/android/quickstep/views/OverviewActionsView;->mSplitButtonHiddenFlags:I

    .line 15
    .line 16
    not-int p1, p1

    .line 17
    and-int/2addr p1, p2

    .line 18
    iput p1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mSplitButtonHiddenFlags:I

    .line 19
    .line 20
    :goto_0
    iget p1, p0, Lcom/android/quickstep/views/OverviewActionsView;->mSplitButtonHiddenFlags:I

    .line 21
    .line 22
    if-nez p1, :cond_2

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    goto :goto_1

    .line 26
    :cond_2
    const/16 p1, 0x8

    .line 27
    .line 28
    :goto_1
    invoke-virtual {v0}, Landroid/widget/Button;->getVisibility()I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-eq p2, p1, :cond_3

    .line 33
    .line 34
    iget-object p2, p0, Lcom/android/quickstep/views/OverviewActionsView;->mSplitButton:Landroid/widget/Button;

    .line 35
    .line 36
    invoke-virtual {p2, p1}, Landroid/widget/Button;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mActionButtons:Landroid/widget/RelativeLayout;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->requestLayout()V

    .line 42
    .line 43
    .line 44
    :cond_3
    :goto_2
    return-void
.end method

.method public updateVerticalMargin(Lcom/android/launcher3/util/C1;)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    iget-object v2, p0, Lcom/android/quickstep/views/OverviewActionsView;->mDp:Lcom/android/launcher3/h0;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/android/launcher3/X3;->b()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const v1, 0x7f0703f2

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-static {v0, p0}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    if-ne v0, v1, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const v1, 0x7f070958

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const v2, 0x7f07095c

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    invoke-static {v1, p0}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 81
    .line 82
    move p0, v0

    .line 83
    goto :goto_0

    .line 84
    :cond_1
    const/4 v1, 0x1

    .line 85
    if-ne v0, v1, :cond_2

    .line 86
    .line 87
    iget-object v0, p0, Lcom/android/quickstep/views/OverviewActionsView;->mDp:Lcom/android/launcher3/h0;

    .line 88
    .line 89
    invoke-virtual {v0}, Lcom/android/launcher3/X3;->b()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_2

    .line 94
    .line 95
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    const v1, 0x7f0703f1

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    invoke-static {v0, p0}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    goto :goto_0

    .line 115
    :cond_2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    const v0, 0x7f070957

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    :goto_0
    iget v0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 127
    .line 128
    iget v1, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 129
    .line 130
    iget v2, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 131
    .line 132
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 133
    .line 134
    .line 135
    return p0
.end method
