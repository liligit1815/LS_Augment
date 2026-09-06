.class public final Lcom/android/quickstep/views/TaskMenuView;
.super Lcom/android/launcher3/a;
.source "TaskMenuView.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/TaskMenuView$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/views/TaskMenuView$Companion;

.field private static final REVEAL_CLOSE_DURATION:J

.field private static final REVEAL_OPEN_DURATION:J


# instance fields
.field private mThumbnailTopMargin:F

.field private final maxMenuBottom$delegate:Lh4/e;

.field private menuTranslationXBeforeOpen:F

.field private menuTranslationYBeforeOpen:F

.field private final minMenuTop$delegate:Lh4/e;

.field private onClosingStartCallback:Ljava/lang/Runnable;

.field private openCloseAnimator:Landroid/animation/AnimatorSet;

.field private final optionLayout$delegate:Lh4/e;

.field private final recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

.field private revealAnimator:Landroid/animation/ValueAnimator;

.field private taskContainer:Lcom/android/quickstep/views/TaskContainer;

.field private taskView:Lcom/android/quickstep/views/TaskView;

.field private final taskbarTop$delegate:Lh4/e;

.field private final tempRect:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/views/TaskMenuView$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/TaskMenuView$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/views/TaskMenuView;->Companion:Lcom/android/quickstep/views/TaskMenuView$Companion;

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-wide/16 v0, 0x1a1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-wide/16 v0, 0x96

    .line 19
    .line 20
    :goto_0
    sput-wide v0, Lcom/android/quickstep/views/TaskMenuView;->REVEAL_OPEN_DURATION:J

    .line 21
    .line 22
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const-wide/16 v0, 0x14d

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    const-wide/16 v0, 0x64

    .line 32
    .line 33
    :goto_1
    sput-wide v0, Lcom/android/quickstep/views/TaskMenuView;->REVEAL_CLOSE_DURATION:J

    .line 34
    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6

    .line 1
    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/views/TaskMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    invoke-static {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->containerFromContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/quickstep/views/RecentsViewContainer;

    iput-object p1, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 5
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/android/quickstep/views/TaskMenuView;->tempRect:Landroid/graphics/Rect;

    .line 6
    new-instance p2, Lcom/android/quickstep/views/R1;

    invoke-direct {p2, p0}, Lcom/android/quickstep/views/R1;-><init>(Lcom/android/quickstep/views/TaskMenuView;)V

    invoke-static {p2}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p2

    iput-object p2, p0, Lcom/android/quickstep/views/TaskMenuView;->optionLayout$delegate:Lh4/e;

    .line 7
    new-instance p2, Lcom/android/quickstep/views/S1;

    invoke-direct {p2, p0}, Lcom/android/quickstep/views/S1;-><init>(Lcom/android/quickstep/views/TaskMenuView;)V

    invoke-static {p2}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p2

    iput-object p2, p0, Lcom/android/quickstep/views/TaskMenuView;->taskbarTop$delegate:Lh4/e;

    .line 8
    new-instance p2, Lcom/android/quickstep/views/T1;

    invoke-direct {p2, p0}, Lcom/android/quickstep/views/T1;-><init>(Lcom/android/quickstep/views/TaskMenuView;)V

    invoke-static {p2}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p2

    iput-object p2, p0, Lcom/android/quickstep/views/TaskMenuView;->minMenuTop$delegate:Lh4/e;

    .line 9
    new-instance p2, Lcom/android/quickstep/views/U1;

    invoke-direct {p2, p0}, Lcom/android/quickstep/views/U1;-><init>(Lcom/android/quickstep/views/TaskMenuView;)V

    invoke-static {p2}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p2

    iput-object p2, p0, Lcom/android/quickstep/views/TaskMenuView;->maxMenuBottom$delegate:Lh4/e;

    .line 10
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f070b5e

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    iput p2, p0, Lcom/android/quickstep/views/TaskMenuView;->mThumbnailTopMargin:F

    .line 11
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    move-result-object p2

    const-string p3, "getOverviewPanel(...)"

    invoke-static {p2, p3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p2, Lcom/android/quickstep/views/RecentsView;

    .line 12
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/android/quickstep/views/RecentsView;->getThumbnailTopMargin(Lcom/android/launcher3/h0;)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/android/quickstep/views/TaskMenuView;->mThumbnailTopMargin:F

    const/4 p1, 0x1

    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setClipToOutline(Z)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    const/4 p3, 0x0

    .line 2
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/views/TaskMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic N(Lcom/android/launcher3/popup/P;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskMenuView;->addMenuOptionMFV$lambda$11(Lcom/android/launcher3/popup/P;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O(Lcom/android/quickstep/views/TaskMenuView;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/views/TaskMenuView;->populateAndShowForTask$lambda$5(Lcom/android/quickstep/views/TaskMenuView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q(Lcom/android/quickstep/views/TaskMenuView;)F
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/views/TaskMenuView;->minMenuTop_delegate$lambda$2(Lcom/android/quickstep/views/TaskMenuView;)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic R(Lcom/android/quickstep/views/TaskMenuView;)Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/views/TaskMenuView;->optionLayout_delegate$lambda$0(Lcom/android/quickstep/views/TaskMenuView;)Landroid/widget/LinearLayout;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic S(Lcom/android/quickstep/views/TaskMenuView;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/views/TaskMenuView;->taskbarTop_delegate$lambda$1(Lcom/android/quickstep/views/TaskMenuView;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic T(Lcom/android/quickstep/views/TaskMenuView;)F
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/views/TaskMenuView;->maxMenuBottom_delegate$lambda$3(Lcom/android/quickstep/views/TaskMenuView;)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic U(ZLcom/android/quickstep/views/TaskMenuView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/views/TaskMenuView;->animateOpenOrClosed$lambda$9(ZLcom/android/quickstep/views/TaskMenuView;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V(Lcom/android/quickstep/views/TaskMenuView;Lcom/android/launcher3/popup/P;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskMenuView;->addMenuOptions$lambda$6(Lcom/android/quickstep/views/TaskMenuView;Lcom/android/launcher3/popup/P;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W(Lcom/android/launcher3/popup/P;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskMenuView;->addMenuOption$lambda$7(Lcom/android/launcher3/popup/P;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X(Lcom/android/quickstep/views/TaskMenuView;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/views/TaskMenuView;->closeComplete$lambda$10(Lcom/android/quickstep/views/TaskMenuView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$closeComplete(Lcom/android/quickstep/views/TaskMenuView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskMenuView;->closeComplete(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$getOnClosingStartCallback$p(Lcom/android/quickstep/views/TaskMenuView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuView;->onClosingStartCallback:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$populateAndShowForTask(Lcom/android/quickstep/views/TaskMenuView;Lcom/android/quickstep/views/TaskContainer;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskMenuView;->populateAndShowForTask(Lcom/android/quickstep/views/TaskContainer;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final synthetic access$setOnClosingStartCallback(Lcom/android/quickstep/views/TaskMenuView;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskMenuView;->setOnClosingStartCallback(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final addMenuOption(Lcom/android/launcher3/popup/P;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/popup/P<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskMenuView;->addMenuOptionMFV(Lcom/android/launcher3/popup/P;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 9
    .line 10
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const v1, 0x7f0e0224

    .line 15
    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "null cannot be cast to non-null type android.widget.LinearLayout"

    .line 23
    .line 24
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    check-cast v0, Landroid/widget/LinearLayout;

    .line 28
    .line 29
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    const v3, 0x7f0807b6

    .line 48
    .line 49
    .line 50
    invoke-static {v1, v3, v2}, LA/h;->e(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    const v3, 0x7f0807b7

    .line 70
    .line 71
    .line 72
    invoke-static {v1, v3, v2}, LA/h;->e(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    const v1, 0x7f0b02fc

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    const v2, 0x7f0b05e0

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    check-cast v2, Landroid/widget/TextView;

    .line 94
    .line 95
    invoke-virtual {p1, v1, v2}, Lcom/android/launcher3/popup/P;->setIconAndLabelFor(Landroid/view/View;Landroid/widget/TextView;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    const-string v2, "null cannot be cast to non-null type android.widget.LinearLayout.LayoutParams"

    .line 103
    .line 104
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 108
    .line 109
    iget-object v2, p0, Lcom/android/quickstep/views/TaskMenuView;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 110
    .line 111
    if-nez v2, :cond_2

    .line 112
    .line 113
    const-string v2, "taskView"

    .line 114
    .line 115
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    const/4 v2, 0x0

    .line 119
    :cond_2
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    iget-object v3, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 124
    .line 125
    invoke-interface {v3}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    const-string v4, "getDeviceProfile(...)"

    .line 130
    .line 131
    invoke-static {v3, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    invoke-interface {v2, v1, v0, v3}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setLayoutParamsForTaskMenuOptionItem(Landroid/widget/LinearLayout$LayoutParams;Landroid/widget/LinearLayout;Lcom/android/launcher3/h0;)V

    .line 135
    .line 136
    .line 137
    new-instance v1, Lcom/android/quickstep/views/N1;

    .line 138
    .line 139
    invoke-direct {v1, p1}, Lcom/android/quickstep/views/N1;-><init>(Lcom/android/launcher3/popup/P;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 143
    .line 144
    .line 145
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->getOptionLayout()Landroid/widget/LinearLayout;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method private static final addMenuOption$lambda$7(Lcom/android/launcher3/popup/P;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final addMenuOptionMFV(Lcom/android/launcher3/popup/P;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/popup/P<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/views/TaskMenuView;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const-string v1, "taskView"

    .line 12
    .line 13
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    :cond_0
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskView;->shouldInflateGridStyle()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    const v1, 0x7f0e0225

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const v1, 0x7f0e0226

    .line 28
    .line 29
    .line 30
    :goto_0
    const/4 v2, 0x0

    .line 31
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "null cannot be cast to non-null type android.widget.LinearLayout"

    .line 36
    .line 37
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    check-cast v0, Landroid/widget/LinearLayout;

    .line 41
    .line 42
    instance-of v1, p1, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;

    .line 43
    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    move-object v1, p1

    .line 47
    check-cast v1, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->init(Landroid/view/ViewGroup;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_3

    .line 57
    .line 58
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    const-string v3, "null cannot be cast to non-null type android.graphics.drawable.GradientDrawable"

    .line 63
    .line 64
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    .line 68
    .line 69
    const/4 v3, 0x0

    .line 70
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 71
    .line 72
    .line 73
    :cond_3
    const v1, 0x7f0b02fc

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    const v4, 0x7f0b05e0

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    check-cast v5, Landroid/widget/TextView;

    .line 88
    .line 89
    invoke-virtual {p1, v3, v5}, Lcom/android/launcher3/popup/P;->setIconAndLabelFor(Landroid/view/View;Landroid/widget/TextView;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/android/launcher3/popup/P;->isEnabled()Z

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Lcom/android/launcher3/popup/P;->isEnabled()Z

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    if-eqz v3, :cond_4

    .line 104
    .line 105
    const/high16 v3, 0x3f800000    # 1.0f

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_4
    const v3, 0x3e99999a    # 0.3f

    .line 109
    .line 110
    .line 111
    :goto_1
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 112
    .line 113
    .line 114
    new-instance v3, Lcom/android/quickstep/views/V1;

    .line 115
    .line 116
    invoke-direct {v3, p1}, Lcom/android/quickstep/views/V1;-><init>(Lcom/android/launcher3/popup/P;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    .line 121
    .line 122
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->getOptionLayout()Landroid/widget/LinearLayout;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    const-string v3, "null cannot be cast to non-null type android.widget.LinearLayout.LayoutParams"

    .line 134
    .line 135
    invoke-static {p1, v3}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 139
    .line 140
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->getTaskMenuItemHeight()I

    .line 141
    .line 142
    .line 143
    move-result v5

    .line 144
    iput v5, p1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 145
    .line 146
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 147
    .line 148
    .line 149
    sget-object p1, Lx1/g;->b:Ljava/lang/String;

    .line 150
    .line 151
    invoke-static {}, Lx1/g;->a()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    if-eqz p1, :cond_5

    .line 160
    .line 161
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-virtual {p1, v2, v2, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 166
    .line 167
    .line 168
    :cond_5
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->s()Z

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-eqz p1, :cond_7

    .line 177
    .line 178
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    check-cast p1, Landroid/widget/TextView;

    .line 183
    .line 184
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-static {v0, v3}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 196
    .line 197
    iget-object v1, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 198
    .line 199
    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    invoke-virtual {v1}, Lcom/android/launcher3/X3;->b()Z

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    const v3, 0x7f070b31

    .line 208
    .line 209
    .line 210
    const v4, 0x7f070b22

    .line 211
    .line 212
    .line 213
    if-eqz v1, :cond_6

    .line 214
    .line 215
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 224
    .line 225
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 226
    .line 227
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 232
    .line 233
    .line 234
    move-result p0

    .line 235
    invoke-virtual {p1, v2, p0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 236
    .line 237
    .line 238
    goto :goto_2

    .line 239
    :cond_6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 248
    .line 249
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 250
    .line 251
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 256
    .line 257
    .line 258
    move-result p0

    .line 259
    invoke-virtual {p1, v2, p0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 260
    .line 261
    .line 262
    :cond_7
    :goto_2
    const/4 p0, 0x1

    .line 263
    return p0
.end method

.method private static final addMenuOptionMFV$lambda$11(Lcom/android/launcher3/popup/P;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final addMenuOptions(Lcom/android/quickstep/views/TaskContainer;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const-string v0, "taskView"

    .line 9
    .line 10
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    :cond_0
    invoke-static {v0, p1}, Lcom/android/quickstep/TaskOverlayFactory;->getEnabledShortcuts(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Lcom/android/quickstep/views/M1;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Lcom/android/quickstep/views/M1;-><init>(Lcom/android/quickstep/views/TaskMenuView;)V

    .line 21
    .line 22
    .line 23
    invoke-interface {p1, v0}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private static final addMenuOptions$lambda$6(Lcom/android/quickstep/views/TaskMenuView;Lcom/android/launcher3/popup/P;)V
    .locals 1

    .line 1
    const-string v0, "menuOption"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskMenuView;->addMenuOption(Lcom/android/launcher3/popup/P;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private final animateOpen()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTranslationY()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/android/quickstep/views/TaskMenuView;->menuTranslationYBeforeOpen:F

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTranslationX()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/android/quickstep/views/TaskMenuView;->menuTranslationXBeforeOpen:F

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    const/4 v1, 0x0

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-static {p0, v2, v2, v0, v1}, Lcom/android/quickstep/views/TaskMenuView;->animateOpenOrClosed$default(Lcom/android/quickstep/views/TaskMenuView;ZZILjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 21
    .line 22
    return-void
.end method

.method private final animateOpenOrCloseAppChip(ZLandroid/animation/AnimatorSet$Builder;)V
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    iget-object v2, p0, Lcom/android/quickstep/views/TaskMenuView;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 4
    .line 5
    const-string v3, "taskContainer"

    .line 6
    .line 7
    const/4 v4, 0x0

    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    move-object v2, v4

    .line 14
    :cond_0
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-interface {v2}, Lcom/android/quickstep/views/TaskViewIcon;->asView()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const-string v5, "null cannot be cast to non-null type com.android.quickstep.views.IconAppChipView"

    .line 23
    .line 24
    invoke-static {v2, v5}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    check-cast v2, Lcom/android/quickstep/views/IconAppChipView;

    .line 28
    .line 29
    iget-object v5, p0, Lcom/android/quickstep/views/TaskMenuView;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 30
    .line 31
    if-nez v5, :cond_1

    .line 32
    .line 33
    const-string v5, "taskView"

    .line 34
    .line 35
    invoke-static {v5}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    move-object v5, v4

    .line 39
    :cond_1
    invoke-direct {p0, v5}, Lcom/android/quickstep/views/TaskMenuView;->isOnGridBottomRow(Lcom/android/quickstep/views/TaskView;)Z

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    const/4 v6, 0x0

    .line 44
    if-eqz v5, :cond_3

    .line 45
    .line 46
    iget v5, p0, Lcom/android/quickstep/views/TaskMenuView;->menuTranslationYBeforeOpen:F

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result v7

    .line 52
    int-to-float v7, v7

    .line 53
    add-float/2addr v5, v7

    .line 54
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->getMaxMenuBottom()F

    .line 55
    .line 56
    .line 57
    move-result v7

    .line 58
    cmpg-float v7, v5, v7

    .line 59
    .line 60
    if-gez v7, :cond_2

    .line 61
    .line 62
    move v7, v6

    .line 63
    goto :goto_0

    .line 64
    :cond_2
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->getMaxMenuBottom()F

    .line 65
    .line 66
    .line 67
    move-result v7

    .line 68
    sub-float/2addr v7, v5

    .line 69
    :goto_0
    iget v5, p0, Lcom/android/quickstep/views/TaskMenuView;->menuTranslationYBeforeOpen:F

    .line 70
    .line 71
    add-float/2addr v5, v7

    .line 72
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->getMinMenuTop()F

    .line 73
    .line 74
    .line 75
    move-result v8

    .line 76
    cmpg-float v5, v5, v8

    .line 77
    .line 78
    if-gez v5, :cond_4

    .line 79
    .line 80
    iget v5, p0, Lcom/android/quickstep/views/TaskMenuView;->menuTranslationYBeforeOpen:F

    .line 81
    .line 82
    neg-float v5, v5

    .line 83
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->getMinMenuTop()F

    .line 84
    .line 85
    .line 86
    move-result v7

    .line 87
    add-float/2addr v7, v5

    .line 88
    goto :goto_1

    .line 89
    :cond_3
    move v7, v6

    .line 90
    :cond_4
    :goto_1
    sget-object v5, Landroid/widget/LinearLayout;->TRANSLATION_Y:Landroid/util/Property;

    .line 91
    .line 92
    if-eqz p1, :cond_5

    .line 93
    .line 94
    iget v8, p0, Lcom/android/quickstep/views/TaskMenuView;->menuTranslationYBeforeOpen:F

    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_5
    iget v8, p0, Lcom/android/quickstep/views/TaskMenuView;->menuTranslationYBeforeOpen:F

    .line 98
    .line 99
    add-float/2addr v8, v7

    .line 100
    :goto_2
    new-array v9, v1, [F

    .line 101
    .line 102
    aput v8, v9, v0

    .line 103
    .line 104
    invoke-static {p0, v5, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    sget-object v8, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 109
    .line 110
    invoke-virtual {v5, v8}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p2, v5}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v2}, Lcom/android/quickstep/views/IconAppChipView;->getMenuTranslationY()Lcom/android/launcher3/util/v1$c;

    .line 117
    .line 118
    .line 119
    move-result-object v5

    .line 120
    sget-object v9, Lcom/android/launcher3/util/v1;->MULTI_PROPERTY_VALUE:Landroid/util/FloatProperty;

    .line 121
    .line 122
    if-eqz p1, :cond_6

    .line 123
    .line 124
    move v7, v6

    .line 125
    :cond_6
    new-array v10, v1, [F

    .line 126
    .line 127
    aput v7, v10, v0

    .line 128
    .line 129
    invoke-static {v5, v9, v10}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    const-string v7, "ofFloat(...)"

    .line 134
    .line 135
    invoke-static {v5, v7}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v5, v8}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p2, v5}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 142
    .line 143
    .line 144
    iget-object v5, p0, Lcom/android/quickstep/views/TaskMenuView;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 145
    .line 146
    if-nez v5, :cond_7

    .line 147
    .line 148
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    goto :goto_3

    .line 152
    :cond_7
    move-object v4, v5

    .line 153
    :goto_3
    invoke-virtual {v4}, Lcom/android/quickstep/views/TaskContainer;->getStagePosition()I

    .line 154
    .line 155
    .line 156
    move-result v3

    .line 157
    if-ne v3, v1, :cond_8

    .line 158
    .line 159
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTranslationX()F

    .line 160
    .line 161
    .line 162
    move-result v3

    .line 163
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 164
    .line 165
    .line 166
    move-result v4

    .line 167
    int-to-float v4, v4

    .line 168
    add-float/2addr v3, v4

    .line 169
    iget-object v4, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 170
    .line 171
    invoke-interface {v4}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 172
    .line 173
    .line 174
    move-result-object v4

    .line 175
    iget v4, v4, Lcom/android/launcher3/h0;->T0:I

    .line 176
    .line 177
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    const v10, 0x7f070b1d

    .line 182
    .line 183
    .line 184
    invoke-virtual {v5, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 185
    .line 186
    .line 187
    move-result v5

    .line 188
    mul-int/lit8 v5, v5, 0x2

    .line 189
    .line 190
    sub-int/2addr v4, v5

    .line 191
    int-to-float v4, v4

    .line 192
    sub-float/2addr v3, v4

    .line 193
    float-to-double v3, v3

    .line 194
    const-wide/16 v10, 0x0

    .line 195
    .line 196
    invoke-static {v3, v4, v10, v11}, Ljava/lang/Math;->max(DD)D

    .line 197
    .line 198
    .line 199
    move-result-wide v3

    .line 200
    double-to-float v3, v3

    .line 201
    goto :goto_4

    .line 202
    :cond_8
    move v3, v6

    .line 203
    :goto_4
    sget-object v4, Landroid/widget/LinearLayout;->TRANSLATION_X:Landroid/util/Property;

    .line 204
    .line 205
    if-eqz p1, :cond_9

    .line 206
    .line 207
    iget v5, p0, Lcom/android/quickstep/views/TaskMenuView;->menuTranslationXBeforeOpen:F

    .line 208
    .line 209
    goto :goto_5

    .line 210
    :cond_9
    iget v5, p0, Lcom/android/quickstep/views/TaskMenuView;->menuTranslationXBeforeOpen:F

    .line 211
    .line 212
    sub-float/2addr v5, v3

    .line 213
    :goto_5
    new-array v10, v1, [F

    .line 214
    .line 215
    aput v5, v10, v0

    .line 216
    .line 217
    invoke-static {p0, v4, v10}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    invoke-virtual {p0, v8}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {p2, p0}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {v2}, Lcom/android/quickstep/views/IconAppChipView;->getMenuTranslationX()Lcom/android/launcher3/util/v1$c;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    if-eqz p1, :cond_a

    .line 232
    .line 233
    goto :goto_6

    .line 234
    :cond_a
    neg-float v6, v3

    .line 235
    :goto_6
    new-array p1, v1, [F

    .line 236
    .line 237
    aput v6, p1, v0

    .line 238
    .line 239
    invoke-static {p0, v9, p1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    invoke-static {p0, v7}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    invoke-virtual {p0, v8}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {p2, p0}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 250
    .line 251
    .line 252
    return-void
.end method

.method private final animateOpenOrClosed(ZZ)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    iget-object v2, p0, Lcom/android/quickstep/views/TaskMenuView;->openCloseAnimator:Landroid/animation/AnimatorSet;

    .line 4
    .line 5
    if-eqz v2, :cond_0

    .line 6
    .line 7
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 17
    .line 18
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v2, p0, Lcom/android/quickstep/views/TaskMenuView;->openCloseAnimator:Landroid/animation/AnimatorSet;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    iget-object v3, p0, Lcom/android/quickstep/views/TaskMenuView;->revealAnimator:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    const/high16 v4, 0x3f800000    # 1.0f

    .line 38
    .line 39
    sub-float/2addr v4, v3

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    move v4, v2

    .line 42
    :goto_0
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->createOpenCloseOutlineProvider()Lcom/android/launcher3/anim/d0;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v3, p0, p1, v4}, Lcom/android/launcher3/anim/c0;->c(Landroid/view/View;ZF)Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    iput-object v3, p0, Lcom/android/quickstep/views/TaskMenuView;->revealAnimator:Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    if-eqz v4, :cond_2

    .line 60
    .line 61
    sget-object v4, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    sget-object v4, LJ0/h;->I:Landroid/view/animation/Interpolator;

    .line 65
    .line 66
    :goto_1
    invoke-virtual {v3, v4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 67
    .line 68
    .line 69
    iget-object v3, p0, Lcom/android/quickstep/views/TaskMenuView;->openCloseAnimator:Landroid/animation/AnimatorSet;

    .line 70
    .line 71
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    iget-object v4, p0, Lcom/android/quickstep/views/TaskMenuView;->revealAnimator:Landroid/animation/ValueAnimator;

    .line 75
    .line 76
    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    if-eqz v4, :cond_3

    .line 85
    .line 86
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    invoke-direct {p0, p1, v3}, Lcom/android/quickstep/views/TaskMenuView;->animateOpenOrCloseAppChip(ZLandroid/animation/AnimatorSet$Builder;)V

    .line 90
    .line 91
    .line 92
    :cond_3
    sget-object v4, Landroid/widget/LinearLayout;->ALPHA:Landroid/util/Property;

    .line 93
    .line 94
    xor-int/lit8 v5, p1, 0x1

    .line 95
    .line 96
    int-to-float v5, v5

    .line 97
    new-array v6, v1, [F

    .line 98
    .line 99
    aput v5, v6, v0

    .line 100
    .line 101
    invoke-static {p0, v4, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 106
    .line 107
    .line 108
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    if-eqz v4, :cond_4

    .line 113
    .line 114
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->revealAnimator:Landroid/animation/ValueAnimator;

    .line 115
    .line 116
    if-eqz v0, :cond_7

    .line 117
    .line 118
    new-instance v1, Lcom/android/quickstep/views/O1;

    .line 119
    .line 120
    invoke-direct {v1, p1, p0}, Lcom/android/quickstep/views/O1;-><init>(ZLcom/android/quickstep/views/TaskMenuView;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 124
    .line 125
    .line 126
    goto :goto_3

    .line 127
    :cond_4
    iget-object v4, p0, Lcom/android/quickstep/views/TaskMenuView;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 128
    .line 129
    if-nez v4, :cond_5

    .line 130
    .line 131
    const-string v4, "taskContainer"

    .line 132
    .line 133
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    const/4 v4, 0x0

    .line 137
    :cond_5
    invoke-virtual {v4}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    sget-object v5, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->DIM_ALPHA:Landroid/util/Property;

    .line 142
    .line 143
    if-eqz p1, :cond_6

    .line 144
    .line 145
    goto :goto_2

    .line 146
    :cond_6
    const v2, 0x3ecccccd    # 0.4f

    .line 147
    .line 148
    .line 149
    :goto_2
    new-array v1, v1, [F

    .line 150
    .line 151
    aput v2, v1, v0

    .line 152
    .line 153
    invoke-static {v4, v5, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {v3, v0}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 158
    .line 159
    .line 160
    :cond_7
    :goto_3
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->openCloseAnimator:Landroid/animation/AnimatorSet;

    .line 161
    .line 162
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    new-instance v1, Lcom/android/quickstep/views/TaskMenuView$animateOpenOrClosed$3;

    .line 166
    .line 167
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/views/TaskMenuView$animateOpenOrClosed$3;-><init>(Lcom/android/quickstep/views/TaskMenuView;Z)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 171
    .line 172
    .line 173
    if-eqz p2, :cond_8

    .line 174
    .line 175
    if-eqz p1, :cond_8

    .line 176
    .line 177
    sget-wide p1, Lcom/android/quickstep/views/TaskMenuView;->REVEAL_CLOSE_DURATION:J

    .line 178
    .line 179
    goto :goto_4

    .line 180
    :cond_8
    if-eqz p2, :cond_9

    .line 181
    .line 182
    if-nez p1, :cond_9

    .line 183
    .line 184
    sget-wide p1, Lcom/android/quickstep/views/TaskMenuView;->REVEAL_OPEN_DURATION:J

    .line 185
    .line 186
    goto :goto_4

    .line 187
    :cond_9
    const-wide/16 p1, 0x0

    .line 188
    .line 189
    :goto_4
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->openCloseAnimator:Landroid/animation/AnimatorSet;

    .line 190
    .line 191
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v0, p1, p2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 195
    .line 196
    .line 197
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuView;->openCloseAnimator:Landroid/animation/AnimatorSet;

    .line 198
    .line 199
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 203
    .line 204
    .line 205
    return-void
.end method

.method static synthetic animateOpenOrClosed$default(Lcom/android/quickstep/views/TaskMenuView;ZZILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x1

    .line 6
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/views/TaskMenuView;->animateOpenOrClosed(ZZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static final animateOpenOrClosed$lambda$9(ZLcom/android/quickstep/views/TaskMenuView;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    const-string v0, "animation"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    int-to-float p0, p0

    .line 14
    sub-float p2, p0, p2

    .line 15
    .line 16
    :cond_0
    iget-object p0, p1, Lcom/android/quickstep/views/TaskMenuView;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 17
    .line 18
    if-nez p0, :cond_1

    .line 19
    .line 20
    const-string p0, "taskContainer"

    .line 21
    .line 22
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    :cond_1
    invoke-virtual {p0, p2}, Lcom/android/quickstep/views/TaskContainer;->updateMenuOpenProgress(F)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private final calculateMaxHeight()I
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "taskView"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    const v4, 0x7f070b0d

    .line 21
    .line 22
    .line 23
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    iget-object v4, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 28
    .line 29
    invoke-interface {v4}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    const-string v5, "getDeviceProfile(...)"

    .line 34
    .line 35
    invoke-static {v4, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTranslationX()F

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 43
    .line 44
    .line 45
    move-result v6

    .line 46
    if-eqz v6, :cond_2

    .line 47
    .line 48
    iget-object v6, p0, Lcom/android/quickstep/views/TaskMenuView;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 49
    .line 50
    if-nez v6, :cond_1

    .line 51
    .line 52
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    move-object v1, v6

    .line 57
    :goto_0
    invoke-direct {p0, v1}, Lcom/android/quickstep/views/TaskMenuView;->isOnGridBottomRow(Lcom/android/quickstep/views/TaskView;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->getMinMenuTop()F

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    goto :goto_1

    .line 68
    :cond_2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTranslationY()F

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    :goto_1
    invoke-interface {v0, v3, v4, v5, p0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getTaskMenuHeight(FLcom/android/launcher3/h0;FF)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    return p0
.end method

.method private final closeComplete(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 7
    .line 8
    new-instance v0, Lcom/android/quickstep/views/Q1;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lcom/android/quickstep/views/Q1;-><init>(Lcom/android/quickstep/views/TaskMenuView;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 18
    .line 19
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    iput-object p1, p0, Lcom/android/quickstep/views/TaskMenuView;->revealAnimator:Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    return-void
.end method

.method private static final closeComplete$lambda$10(Lcom/android/quickstep/views/TaskMenuView;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->revealAnimator:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    return-void
.end method

.method private final createOpenCloseOutlineProvider()Lcom/android/launcher3/anim/d0;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Lcom/android/launcher3/h0;->P2:I

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Lcom/android/launcher3/util/F2;->k(Landroid/content/Context;)F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    new-instance v2, Landroid/graphics/Point;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    div-int/lit8 v0, v0, 0x2

    .line 24
    .line 25
    invoke-direct {v2, v3, v0}, Landroid/graphics/Point;-><init>(II)V

    .line 26
    .line 27
    .line 28
    new-instance v0, Landroid/graphics/Rect;

    .line 29
    .line 30
    iget v3, v2, Landroid/graphics/Point;->x:I

    .line 31
    .line 32
    iget v2, v2, Landroid/graphics/Point;->y:I

    .line 33
    .line 34
    invoke-direct {v0, v3, v2, v3, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 35
    .line 36
    .line 37
    new-instance v2, Landroid/graphics/Rect;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    const/4 v4, 0x0

    .line 48
    invoke-direct {v2, v4, v4, v3, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 49
    .line 50
    .line 51
    new-instance p0, Lcom/android/launcher3/anim/d0;

    .line 52
    .line 53
    invoke-direct {p0, v1, v1, v0, v2}, Lcom/android/launcher3/anim/d0;-><init>(FFLandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 54
    .line 55
    .line 56
    return-object p0
.end method

.method private final getIconView()Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuView;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "taskContainer"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/android/quickstep/views/TaskViewIcon;->asView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "asView(...)"

    .line 20
    .line 21
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-object p0
.end method

.method private final getMaxMenuBottom()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuView;->maxMenuBottom$delegate:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Number;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private final getMinMenuTop()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuView;->minMenuTop$delegate:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Number;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private final getOptionLayout()Landroid/widget/LinearLayout;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuView;->optionLayout$delegate:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "getValue(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    check-cast p0, Landroid/widget/LinearLayout;

    .line 13
    .line 14
    return-object p0
.end method

.method private final getTaskMenuItemHeight()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "null cannot be cast to non-null type com.android.quickstep.views.RecentsView<*, *>"

    .line 8
    .line 9
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const v2, 0x7f070b26

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_1

    .line 30
    .line 31
    iget-object v2, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 32
    .line 33
    invoke-interface {v2}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Lcom/android/launcher3/X3;->b()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const/4 v2, 0x1

    .line 48
    if-gt v0, v2, :cond_0

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const v1, 0x7f070b27

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    invoke-static {v0, p0}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    return p0

    .line 71
    :cond_1
    :goto_0
    return v1
.end method

.method private final getTaskMenuViewWidth()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "null cannot be cast to non-null type com.android.quickstep.views.RecentsView<*, *>"

    .line 8
    .line 9
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const v2, 0x7f070b28

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_1

    .line 30
    .line 31
    iget-object v2, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 32
    .line 33
    invoke-interface {v2}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Lcom/android/launcher3/X3;->b()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const/4 v2, 0x1

    .line 48
    if-gt v0, v2, :cond_0

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const v1, 0x7f070b29

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    invoke-static {v0, p0}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    return p0

    .line 71
    :cond_1
    :goto_0
    return v1
.end method

.method private final getTaskbarTop()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuView;->taskbarTop$delegate:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Number;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private final isOnGridBottomRow(Lcom/android/quickstep/views/TaskView;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "null cannot be cast to non-null type com.android.quickstep.views.RecentsView<*, *>"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->isOnGridBottomRow(Lcom/android/quickstep/views/TaskView;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method private static final maxMenuBottom_delegate$lambda$3(Lcom/android/quickstep/views/TaskMenuView;)F
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->getTaskbarTop()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 6
    .line 7
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget p0, p0, Lcom/android/launcher3/h0;->X2:I

    .line 12
    .line 13
    sub-int/2addr v0, p0

    .line 14
    int-to-float p0, v0

    .line 15
    return p0
.end method

.method private static final minMenuTop_delegate$lambda$2(Lcom/android/quickstep/views/TaskMenuView;)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuView;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "taskContainer"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/android/quickstep/views/TaskViewIcon;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    int-to-float p0, p0

    .line 20
    return p0
.end method

.method private static final optionLayout_delegate$lambda$0(Lcom/android/quickstep/views/TaskMenuView;)Landroid/widget/LinearLayout;
    .locals 1

    .line 1
    const v0, 0x7f0b03ad

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Landroid/widget/LinearLayout;

    .line 9
    .line 10
    return-object p0
.end method

.method private final orientAroundTaskView(Lcom/android/quickstep/views/TaskContainer;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0, v0}, Landroid/widget/LinearLayout;->measure(II)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 17
    .line 18
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 22
    .line 23
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->getIconView()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const v1, 0x7f0b0314

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const-string v1, "findViewById(...)"

    .line 45
    .line 46
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/views/TaskMenuView;->tempRect:Landroid/graphics/Rect;

    .line 55
    .line 56
    invoke-virtual {v0, p1, v1}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 60
    .line 61
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1}, Lcom/android/launcher3/h1;->getInsets()Landroid/graphics/Rect;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const-string v1, "null cannot be cast to non-null type com.android.launcher3.views.BaseDragLayer.LayoutParams"

    .line 74
    .line 75
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    check-cast v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 79
    .line 80
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->getTaskMenuViewWidth()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 85
    .line 86
    const/4 v1, 0x3

    .line 87
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 93
    .line 94
    const/4 v1, 0x0

    .line 95
    const-string v2, "taskView"

    .line 96
    .line 97
    if-nez v0, :cond_1

    .line 98
    .line 99
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    move-object v0, v1

    .line 103
    :cond_1
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getScaleX()F

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 111
    .line 112
    if-nez v0, :cond_2

    .line 113
    .line 114
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_2
    move-object v1, v0

    .line 119
    :goto_1
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getScaleY()F

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->tempRect:Landroid/graphics/Rect;

    .line 127
    .line 128
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 129
    .line 130
    iget v2, p1, Landroid/graphics/Rect;->left:I

    .line 131
    .line 132
    sub-int/2addr v1, v2

    .line 133
    int-to-float v1, v1

    .line 134
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 135
    .line 136
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 137
    .line 138
    sub-int/2addr v0, p1

    .line 139
    int-to-float p1, v0

    .line 140
    invoke-direct {p0, v1, p1}, Lcom/android/quickstep/views/TaskMenuView;->setPosition(FF)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method private final populateAndLayoutMenu()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "taskContainer"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskMenuView;->addMenuOptions(Lcom/android/quickstep/views/TaskContainer;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    move-object v1, v0

    .line 24
    :goto_0
    invoke-direct {p0, v1}, Lcom/android/quickstep/views/TaskMenuView;->orientAroundTaskView(Lcom/android/quickstep/views/TaskContainer;)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0
.end method

.method private final populateAndShowForTask(Lcom/android/quickstep/views/TaskContainer;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isAttachedToWindow()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/android/quickstep/views/TaskMenuView;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 25
    .line 26
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->populateAndLayoutMenu()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    return v1

    .line 33
    :cond_1
    new-instance p1, Lcom/android/quickstep/views/P1;

    .line 34
    .line 35
    invoke-direct {p1, p0}, Lcom/android/quickstep/views/P1;-><init>(Lcom/android/quickstep/views/TaskMenuView;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0
.end method

.method private static final populateAndShowForTask$lambda$5(Lcom/android/quickstep/views/TaskMenuView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->animateOpen()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final setOnClosingStartCallback(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/TaskMenuView;->onClosingStartCallback:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method private final setPosition(FF)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string v0, "taskView"

    .line 7
    .line 8
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setPivotX(F)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setPivotY(F)V

    .line 21
    .line 22
    .line 23
    invoke-interface {v0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getDegreesRotated()F

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setRotation(F)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->getTaskMenuViewWidth()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    const v4, 0x7f070b5b

    .line 39
    .line 40
    .line 41
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    int-to-float v3, v3

    .line 46
    invoke-interface {v0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getRotation()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    const-string v4, "taskContainer"

    .line 51
    .line 52
    if-eqz v0, :cond_8

    .line 53
    .line 54
    const/4 v5, 0x1

    .line 55
    if-eq v0, v5, :cond_5

    .line 56
    .line 57
    const/4 v5, 0x2

    .line 58
    if-eq v0, v5, :cond_3

    .line 59
    .line 60
    const/4 v5, 0x3

    .line 61
    if-eq v0, v5, :cond_2

    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 64
    .line 65
    if-nez v0, :cond_1

    .line 66
    .line 67
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    move-object v1, v0

    .line 72
    :goto_0
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    sub-int/2addr v0, v2

    .line 81
    int-to-float v0, v0

    .line 82
    add-float/2addr p1, v0

    .line 83
    iget v0, p0, Lcom/android/quickstep/views/TaskMenuView;->mThumbnailTopMargin:F

    .line 84
    .line 85
    :goto_1
    sub-float/2addr v0, v3

    .line 86
    sub-float/2addr p2, v0

    .line 87
    goto :goto_6

    .line 88
    :cond_2
    iget v0, p0, Lcom/android/quickstep/views/TaskMenuView;->mThumbnailTopMargin:F

    .line 89
    .line 90
    sub-float/2addr v0, v3

    .line 91
    sub-float/2addr p1, v0

    .line 92
    int-to-float v0, v2

    .line 93
    :goto_2
    add-float/2addr p2, v0

    .line 94
    goto :goto_6

    .line 95
    :cond_3
    int-to-float v0, v2

    .line 96
    add-float/2addr p1, v0

    .line 97
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 98
    .line 99
    if-nez v0, :cond_4

    .line 100
    .line 101
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    goto :goto_3

    .line 105
    :cond_4
    move-object v1, v0

    .line 106
    :goto_3
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    int-to-float v0, v0

    .line 115
    iget v1, p0, Lcom/android/quickstep/views/TaskMenuView;->mThumbnailTopMargin:F

    .line 116
    .line 117
    add-float/2addr v0, v1

    .line 118
    goto :goto_2

    .line 119
    :cond_5
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 120
    .line 121
    if-nez v0, :cond_6

    .line 122
    .line 123
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    move-object v0, v1

    .line 127
    :cond_6
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    int-to-float v0, v0

    .line 136
    iget v3, p0, Lcom/android/quickstep/views/TaskMenuView;->mThumbnailTopMargin:F

    .line 137
    .line 138
    add-float/2addr v0, v3

    .line 139
    add-float/2addr p1, v0

    .line 140
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 141
    .line 142
    if-nez v0, :cond_7

    .line 143
    .line 144
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    goto :goto_4

    .line 148
    :cond_7
    move-object v1, v0

    .line 149
    :goto_4
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    sub-int/2addr v0, v2

    .line 158
    int-to-float v0, v0

    .line 159
    goto :goto_2

    .line 160
    :cond_8
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 161
    .line 162
    if-nez v0, :cond_9

    .line 163
    .line 164
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    goto :goto_5

    .line 168
    :cond_9
    move-object v1, v0

    .line 169
    :goto_5
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    sub-int/2addr v0, v2

    .line 178
    int-to-float v0, v0

    .line 179
    add-float/2addr p1, v0

    .line 180
    iget v0, p0, Lcom/android/quickstep/views/TaskMenuView;->mThumbnailTopMargin:F

    .line 181
    .line 182
    goto :goto_1

    .line 183
    :goto_6
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setX(F)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setY(F)V

    .line 187
    .line 188
    .line 189
    return-void
.end method

.method private static final taskbarTop_delegate$lambda$1(Lcom/android/quickstep/views/TaskMenuView;)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Lcom/android/launcher3/h0;->U0:I

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->F0()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    sub-int/2addr v0, p0

    .line 20
    return v0
.end method


# virtual methods
.method public bridge synthetic clearLastStatus()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/util/G2;->clearLastStatus()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 4

    .line 1
    const-string v0, "event"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_4

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->getOptionLayout()Landroid/widget/LinearLayout;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->getOptionLayout()Landroid/widget/LinearLayout;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getFocusedChild()Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const/4 v1, 0x1

    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    move v0, v1

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const/4 v0, 0x0

    .line 45
    :goto_0
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->getOptionLayout()Landroid/widget/LinearLayout;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->getOptionLayout()Landroid/widget/LinearLayout;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getFocusedChild()Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->getOptionLayout()Landroid/widget/LinearLayout;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    sub-int/2addr v3, v1

    .line 70
    if-ne v2, v3, :cond_2

    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    const/16 v3, 0x14

    .line 77
    .line 78
    if-eq v2, v3, :cond_3

    .line 79
    .line 80
    :cond_2
    if-eqz v0, :cond_4

    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    const/16 v2, 0x13

    .line 87
    .line 88
    if-ne v0, v2, :cond_4

    .line 89
    .line 90
    :cond_3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->getIconView()Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 95
    .line 96
    .line 97
    return v1

    .line 98
    :cond_4
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    return p0
.end method

.method public bridge synthetic dump(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/util/G2;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getOutlineProvider()Landroid/view/ViewOutlineProvider;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/views/TaskMenuView$getOutlineProvider$1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/quickstep/views/TaskMenuView$getOutlineProvider$1;-><init>(Lcom/android/quickstep/views/TaskMenuView;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method protected handleClose(Z)V
    .locals 1

    .line 1
    const/4 p1, 0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/views/TaskMenuView;->animateOpenOrClosed(ZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    and-int/lit16 p0, p1, 0x800

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    const-string v0, "ev"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 14
    .line 15
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    const/4 p1, 0x2

    .line 26
    const/4 v0, 0x0

    .line 27
    const/4 v2, 0x1

    .line 28
    invoke-static {p0, v2, v1, p1, v0}, Lcom/android/quickstep/views/TaskMenuView;->animateOpenOrClosed$default(Lcom/android/quickstep/views/TaskMenuView;ZZILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return v2

    .line 32
    :cond_0
    return v1
.end method

.method protected onMeasure(II)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->calculateMaxHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-le v1, v0, :cond_0

    .line 10
    .line 11
    const/high16 p2, -0x80000000

    .line 12
    .line 13
    invoke-static {v0, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final onRotationChanged()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuView;->openCloseAnimator:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->end()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->getOptionLayout()Landroid/widget/LinearLayout;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView;->populateAndLayoutMenu()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    :cond_1
    const/4 v0, 0x0

    .line 38
    invoke-virtual {p0, v0}, Lcom/android/launcher3/a;->close(Z)V

    .line 39
    .line 40
    .line 41
    :cond_2
    return-void
.end method
