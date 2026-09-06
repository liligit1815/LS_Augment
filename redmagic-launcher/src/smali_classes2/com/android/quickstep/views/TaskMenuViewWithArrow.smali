.class public final Lcom/android/quickstep/views/TaskMenuViewWithArrow;
.super Lcom/android/launcher3/popup/c;
.source "TaskMenuViewWithArrow.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/TaskMenuViewWithArrow$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/quickstep/views/RecentsViewContainer;",
        ">",
        "Lcom/android/launcher3/popup/c<",
        "TT;>;"
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/views/TaskMenuViewWithArrow$Companion;

.field public static final TAG:Ljava/lang/String; = "TaskMenuViewWithArrow"


# instance fields
.field private alignedOptionIndex:I

.field private iconView:Lcom/android/quickstep/views/IconView;

.field private final menuPaddingEnd:I

.field private onClosedCallback:Ljava/lang/Runnable;

.field private optionLayout:Landroid/widget/LinearLayout;

.field private optionMeasuredHeight:I

.field private scrim:Landroid/view/View;

.field private final scrimAlpha:F

.field private taskContainer:Lcom/android/quickstep/views/TaskContainer;

.field private taskView:Lcom/android/quickstep/views/TaskView;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/views/TaskMenuViewWithArrow$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/TaskMenuViewWithArrow$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->Companion:Lcom/android/quickstep/views/TaskMenuViewWithArrow$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/popup/c;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setClipToOutline(Z)V

    .line 3
    iput-boolean p1, p0, Lcom/android/launcher3/popup/c;->shouldScaleArrow:Z

    .line 4
    iput-boolean p1, p0, Lcom/android/launcher3/popup/c;->mIsArrowRotated:Z

    .line 5
    iget p1, p0, Lcom/android/launcher3/popup/c;->mOpenFadeStartDelay:I

    iput p1, p0, Lcom/android/launcher3/popup/c;->mOpenChildFadeStartDelay:I

    .line 6
    iget p1, p0, Lcom/android/launcher3/popup/c;->mOpenFadeDuration:I

    iput p1, p0, Lcom/android/launcher3/popup/c;->mOpenChildFadeDuration:I

    .line 7
    iget p1, p0, Lcom/android/launcher3/popup/c;->mCloseChildFadeStartDelay:I

    iput p1, p0, Lcom/android/launcher3/popup/c;->mCloseFadeStartDelay:I

    .line 8
    iget p1, p0, Lcom/android/launcher3/popup/c;->mCloseChildFadeDuration:I

    iput p1, p0, Lcom/android/launcher3/popup/c;->mCloseFadeDuration:I

    .line 9
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f070b0d

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->menuPaddingEnd:I

    const p1, 0x3f4ccccd    # 0.8f

    .line 10
    iput p1, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->scrimAlpha:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "attrs"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/popup/c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 12
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setClipToOutline(Z)V

    .line 13
    iput-boolean p1, p0, Lcom/android/launcher3/popup/c;->shouldScaleArrow:Z

    .line 14
    iput-boolean p1, p0, Lcom/android/launcher3/popup/c;->mIsArrowRotated:Z

    .line 15
    iget p1, p0, Lcom/android/launcher3/popup/c;->mOpenFadeStartDelay:I

    iput p1, p0, Lcom/android/launcher3/popup/c;->mOpenChildFadeStartDelay:I

    .line 16
    iget p1, p0, Lcom/android/launcher3/popup/c;->mOpenFadeDuration:I

    iput p1, p0, Lcom/android/launcher3/popup/c;->mOpenChildFadeDuration:I

    .line 17
    iget p1, p0, Lcom/android/launcher3/popup/c;->mCloseChildFadeStartDelay:I

    iput p1, p0, Lcom/android/launcher3/popup/c;->mCloseFadeStartDelay:I

    .line 18
    iget p1, p0, Lcom/android/launcher3/popup/c;->mCloseChildFadeDuration:I

    iput p1, p0, Lcom/android/launcher3/popup/c;->mCloseFadeDuration:I

    .line 19
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070b0d

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->menuPaddingEnd:I

    const p1, 0x3f4ccccd    # 0.8f

    .line 20
    iput p1, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->scrimAlpha:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "attrs"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/popup/c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 22
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setClipToOutline(Z)V

    .line 23
    iput-boolean p1, p0, Lcom/android/launcher3/popup/c;->shouldScaleArrow:Z

    .line 24
    iput-boolean p1, p0, Lcom/android/launcher3/popup/c;->mIsArrowRotated:Z

    .line 25
    iget p1, p0, Lcom/android/launcher3/popup/c;->mOpenFadeStartDelay:I

    iput p1, p0, Lcom/android/launcher3/popup/c;->mOpenChildFadeStartDelay:I

    .line 26
    iget p1, p0, Lcom/android/launcher3/popup/c;->mOpenFadeDuration:I

    iput p1, p0, Lcom/android/launcher3/popup/c;->mOpenChildFadeDuration:I

    .line 27
    iget p1, p0, Lcom/android/launcher3/popup/c;->mCloseChildFadeStartDelay:I

    iput p1, p0, Lcom/android/launcher3/popup/c;->mCloseFadeStartDelay:I

    .line 28
    iget p1, p0, Lcom/android/launcher3/popup/c;->mCloseChildFadeDuration:I

    iput p1, p0, Lcom/android/launcher3/popup/c;->mCloseFadeDuration:I

    .line 29
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070b0d

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->menuPaddingEnd:I

    const p1, 0x3f4ccccd    # 0.8f

    .line 30
    iput p1, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->scrimAlpha:F

    return-void
.end method

.method public static synthetic Q(Lcom/android/launcher3/popup/P;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->addMenuOption$lambda$2(Lcom/android/launcher3/popup/P;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$populateAndShowForTask(Lcom/android/quickstep/views/TaskMenuViewWithArrow;Lcom/android/quickstep/views/TaskContainer;ILjava/lang/Runnable;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->populateAndShowForTask(Lcom/android/quickstep/views/TaskContainer;ILjava/lang/Runnable;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
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
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const v1, 0x7f0e0224

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "null cannot be cast to non-null type android.widget.LinearLayout"

    .line 18
    .line 19
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    check-cast v0, Landroid/widget/LinearLayout;

    .line 23
    .line 24
    const v1, 0x7f0b02fc

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const v2, 0x7f0b05e0

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Landroid/widget/TextView;

    .line 39
    .line 40
    invoke-virtual {p1, v1, v2}, Lcom/android/launcher3/popup/P;->setIconAndLabelFor(Landroid/view/View;Landroid/widget/TextView;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v2, "null cannot be cast to non-null type android.widget.LinearLayout.LayoutParams"

    .line 48
    .line 49
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 53
    .line 54
    const/4 v2, -0x1

    .line 55
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getPaddingStart()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    iget v3, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->menuPaddingEnd:I

    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/LinearLayout;->setPaddingRelative(IIII)V

    .line 72
    .line 73
    .line 74
    new-instance v1, Lcom/android/quickstep/views/W1;

    .line 75
    .line 76
    invoke-direct {v1, p1}, Lcom/android/quickstep/views/W1;-><init>(Lcom/android/launcher3/popup/P;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->optionLayout:Landroid/widget/LinearLayout;

    .line 83
    .line 84
    if-nez p0, :cond_0

    .line 85
    .line 86
    const-string p0, "optionLayout"

    .line 87
    .line 88
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    const/4 p0, 0x0

    .line 92
    :cond_0
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method private static final addMenuOption$lambda$2(Lcom/android/launcher3/popup/P;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final addMenuOptions()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->taskView:Lcom/android/quickstep/views/TaskView;

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
    iget-object v2, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 13
    .line 14
    if-nez v2, :cond_1

    .line 15
    .line 16
    const-string v2, "taskContainer"

    .line 17
    .line 18
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    move-object v2, v1

    .line 22
    :cond_1
    invoke-static {v0, v2}, Lcom/android/quickstep/TaskOverlayFactory;->getEnabledShortcuts(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v2, "getEnabledShortcuts(...)"

    .line 27
    .line 28
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Lcom/android/launcher3/popup/P;

    .line 46
    .line 47
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0, v2}, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->addMenuOption(Lcom/android/launcher3/popup/P;)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    .line 55
    .line 56
    new-instance v2, Landroid/graphics/drawable/shapes/RectShape;

    .line 57
    .line 58
    invoke-direct {v2}, Landroid/graphics/drawable/shapes/RectShape;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-direct {v0, v2}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    iget-object v4, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 73
    .line 74
    invoke-virtual {v4}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    const v5, 0x106000d

    .line 79
    .line 80
    .line 81
    invoke-virtual {v3, v5, v4}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    const v3, 0x7f070b2d

    .line 93
    .line 94
    .line 95
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    float-to-int v2, v2

    .line 100
    iget-object v3, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->optionLayout:Landroid/widget/LinearLayout;

    .line 101
    .line 102
    const-string v4, "optionLayout"

    .line 103
    .line 104
    if-nez v3, :cond_3

    .line 105
    .line 106
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    move-object v3, v1

    .line 110
    :cond_3
    const/4 v5, 0x2

    .line 111
    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setShowDividers(I)V

    .line 112
    .line 113
    .line 114
    iget-object v3, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 115
    .line 116
    check-cast v3, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 117
    .line 118
    invoke-interface {v3}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    const-string v5, "getOverviewPanel(...)"

    .line 123
    .line 124
    invoke-static {v3, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    check-cast v3, Lcom/android/quickstep/views/RecentsView;

    .line 128
    .line 129
    invoke-virtual {v3}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    iget-object v5, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 134
    .line 135
    check-cast v5, Lcom/android/launcher3/views/k;

    .line 136
    .line 137
    invoke-interface {v5}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 138
    .line 139
    .line 140
    move-result-object v5

    .line 141
    const-string v6, "getDeviceProfile(...)"

    .line 142
    .line 143
    invoke-static {v5, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->optionLayout:Landroid/widget/LinearLayout;

    .line 147
    .line 148
    if-nez p0, :cond_4

    .line 149
    .line 150
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    goto :goto_1

    .line 154
    :cond_4
    move-object v1, p0

    .line 155
    :goto_1
    invoke-interface {v3, v5, v1, v2, v0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setTaskOptionsMenuLayoutOrientation(Lcom/android/launcher3/h0;Landroid/widget/LinearLayout;ILandroid/graphics/drawable/ShapeDrawable;)V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method private final addScrim()V
    .locals 3

    .line 1
    new-instance v0, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    const/4 v2, -0x1

    .line 13
    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const v2, 0x7f04052d

    .line 24
    .line 25
    .line 26
    invoke-static {v1, v2}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 31
    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->scrim:Landroid/view/View;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->scrim:Landroid/view/View;

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private final calculateMaxHeight()I
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f070b0d

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    const-string v1, "taskView"

    .line 17
    .line 18
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    :cond_0
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v2, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 27
    .line 28
    check-cast v2, Lcom/android/launcher3/views/k;

    .line 29
    .line 30
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const-string v3, "getDeviceProfile(...)"

    .line 35
    .line 36
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTranslationX()F

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTranslationY()F

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    invoke-interface {v1, v0, v2, v3, p0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getTaskMenuHeight(FLcom/android/launcher3/h0;FF)I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    return p0
.end method

.method private final copyIconToDragLayer(Landroid/graphics/Rect;)V
    .locals 6

    .line 1
    new-instance v0, Lcom/android/quickstep/views/IconView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "getContext(...)"

    .line 8
    .line 9
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/IconView;-><init>(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 16
    .line 17
    iget-object v2, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    const-string v4, "taskContainer"

    .line 21
    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    move-object v2, v3

    .line 28
    :cond_0
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-interface {v2}, Lcom/android/quickstep/views/TaskViewIcon;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    iget-object v5, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 37
    .line 38
    if-nez v5, :cond_1

    .line 39
    .line 40
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    move-object v5, v3

    .line 44
    :cond_1
    invoke-virtual {v5}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    invoke-interface {v5}, Lcom/android/quickstep/views/TaskViewIcon;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    invoke-direct {v1, v2, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/android/launcher3/popup/c;->mTempRect:Landroid/graphics/Rect;

    .line 59
    .line 60
    iget v1, v1, Landroid/graphics/Rect;->left:I

    .line 61
    .line 62
    int-to-float v1, v1

    .line 63
    iget v2, p1, Landroid/graphics/Rect;->left:I

    .line 64
    .line 65
    int-to-float v2, v2

    .line 66
    sub-float/2addr v1, v2

    .line 67
    invoke-virtual {v0, v1}, Landroid/view/View;->setX(F)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Lcom/android/launcher3/popup/c;->mTempRect:Landroid/graphics/Rect;

    .line 71
    .line 72
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 73
    .line 74
    int-to-float v1, v1

    .line 75
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 76
    .line 77
    int-to-float p1, p1

    .line 78
    sub-float/2addr v1, p1

    .line 79
    invoke-virtual {v0, v1}, Landroid/view/View;->setY(F)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 83
    .line 84
    if-nez p1, :cond_2

    .line 85
    .line 86
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    move-object p1, v3

    .line 90
    :cond_2
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-interface {p1}, Lcom/android/quickstep/views/TaskViewIcon;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {v0, p1}, Lcom/android/quickstep/views/IconView;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 102
    .line 103
    if-nez p1, :cond_3

    .line 104
    .line 105
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    move-object p1, v3

    .line 109
    :cond_3
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-interface {p1}, Lcom/android/quickstep/views/TaskViewIcon;->getDrawableWidth()I

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    iget-object v1, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 118
    .line 119
    if-nez v1, :cond_4

    .line 120
    .line 121
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_4
    move-object v3, v1

    .line 126
    :goto_0
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-interface {v1}, Lcom/android/quickstep/views/TaskViewIcon;->getDrawableHeight()I

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    invoke-virtual {v0, p1, v1}, Lcom/android/quickstep/views/IconView;->setDrawableSize(II)V

    .line 135
    .line 136
    .line 137
    iput-object v0, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->iconView:Lcom/android/quickstep/views/IconView;

    .line 138
    .line 139
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->iconView:Lcom/android/quickstep/views/IconView;

    .line 144
    .line 145
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method private final getArrowHorizontalPadding()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "taskView"

    .line 6
    .line 7
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->isLargeTile()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const v0, 0x7f070b1e

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method private final getArrowX()F
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/popup/c;->mIsLeftAligned:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getX()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget p0, p0, Lcom/android/launcher3/popup/c;->mArrowHeight:I

    .line 10
    .line 11
    int-to-float p0, p0

    .line 12
    sub-float/2addr v0, p0

    .line 13
    return v0

    .line 14
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getX()F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-float v1, v1

    .line 23
    add-float/2addr v0, v1

    .line 24
    iget p0, p0, Lcom/android/launcher3/popup/c;->mArrowOffsetVertical:I

    .line 25
    .line 26
    int-to-float p0, p0

    .line 27
    add-float/2addr v0, p0

    .line 28
    return v0
.end method

.method private final getExtraSpaceForRowAlignment()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->optionMeasuredHeight:I

    .line 2
    .line 3
    iget p0, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->alignedOptionIndex:I

    .line 4
    .line 5
    mul-int/2addr v0, p0

    .line 6
    return v0
.end method

.method private final populateAndShowForTask(Lcom/android/quickstep/views/TaskContainer;ILjava/lang/Runnable;)Z
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
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 16
    .line 17
    iput p2, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->alignedOptionIndex:I

    .line 18
    .line 19
    iput-object p3, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->onClosedCallback:Ljava/lang/Runnable;

    .line 20
    .line 21
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->populateMenu()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    return v1

    .line 28
    :cond_1
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->addScrim()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->show()V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method private final populateMenu()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string v0, "taskContainer"

    .line 7
    .line 8
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Lcom/android/quickstep/views/TaskViewIcon;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v2, 0x0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    return v2

    .line 24
    :cond_1
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->addMenuOptions()V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->optionLayout:Landroid/widget/LinearLayout;

    .line 28
    .line 29
    if-nez p0, :cond_2

    .line 30
    .line 31
    const-string p0, "optionLayout"

    .line 32
    .line 33
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    move-object v1, p0

    .line 38
    :goto_0
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-lez p0, :cond_3

    .line 43
    .line 44
    const/4 p0, 0x1

    .line 45
    return p0

    .line 46
    :cond_3
    return v2
.end method


# virtual methods
.method protected addArrow()V
    .locals 3

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
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->getArrowX()F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setX(F)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getY()F

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iget v2, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->optionMeasuredHeight:I

    .line 26
    .line 27
    div-int/lit8 v2, v2, 0x2

    .line 28
    .line 29
    int-to-float v2, v2

    .line 30
    add-float/2addr v1, v2

    .line 31
    iget v2, p0, Lcom/android/launcher3/popup/c;->mArrowHeight:I

    .line 32
    .line 33
    div-int/lit8 v2, v2, 0x2

    .line 34
    .line 35
    int-to-float v2, v2

    .line 36
    sub-float/2addr v1, v2

    .line 37
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->getExtraSpaceForRowAlignment()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    int-to-float v2, v2

    .line 42
    add-float/2addr v1, v2

    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->setY(F)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->updateArrowColor()V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 50
    .line 51
    iget-boolean v1, p0, Lcom/android/launcher3/popup/c;->mIsLeftAligned:Z

    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    if-eqz v1, :cond_0

    .line 55
    .line 56
    move v1, v2

    .line 57
    goto :goto_0

    .line 58
    :cond_0
    iget v1, p0, Lcom/android/launcher3/popup/c;->mArrowHeight:I

    .line 59
    .line 60
    int-to-float v1, v1

    .line 61
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 65
    .line 66
    invoke-virtual {p0, v2}, Landroid/view/View;->setPivotY(F)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public assignMarginsAndBackgrounds(Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    const-string v0, "viewGroup"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const v0, 0x7f040781

    .line 11
    .line 12
    .line 13
    invoke-static {p1, v0}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, p0, p1}, Lcom/android/launcher3/popup/c;->assignMarginsAndBackgrounds(Landroid/view/ViewGroup;I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public bridge synthetic clearLastStatus()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/util/G2;->clearLastStatus()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected closeComplete()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/popup/c;->closeComplete()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->scrim:Landroid/view/View;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->iconView:Lcom/android/quickstep/views/IconView;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->onClosedCallback:Ljava/lang/Runnable;

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
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

.method protected getTargetObjectLocation(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->taskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string p0, "taskContainer"

    .line 10
    .line 11
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Lcom/android/quickstep/views/TaskViewIcon;->asView()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 24
    .line 25
    .line 26
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
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->close(Z)V

    .line 21
    .line 22
    .line 23
    return p1

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method protected onCreateCloseAnimation(Landroid/animation/AnimatorSet;)V
    .locals 5

    .line 1
    const-string v0, "anim"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->scrim:Landroid/view/View;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 11
    .line 12
    iget v2, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->scrimAlpha:F

    .line 13
    .line 14
    const/4 v3, 0x2

    .line 15
    new-array v3, v3, [F

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    aput v2, v3, v4

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    const/4 v4, 0x1

    .line 22
    aput v2, v3, v4

    .line 23
    .line 24
    invoke-static {v0, v1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget p0, p0, Lcom/android/launcher3/popup/c;->mCloseDuration:I

    .line 29
    .line 30
    int-to-long v1, p0

    .line 31
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method protected onCreateOpenAnimation(Landroid/animation/AnimatorSet;)V
    .locals 6

    .line 1
    const-string v0, "anim"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->scrim:Landroid/view/View;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 11
    .line 12
    iget v2, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->scrimAlpha:F

    .line 13
    .line 14
    const/4 v3, 0x2

    .line 15
    new-array v3, v3, [F

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    const/4 v5, 0x0

    .line 19
    aput v4, v3, v5

    .line 20
    .line 21
    const/4 v4, 0x1

    .line 22
    aput v2, v3, v4

    .line 23
    .line 24
    invoke-static {v0, v1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget p0, p0, Lcom/android/launcher3/popup/c;->mOpenDuration:I

    .line 29
    .line 30
    int-to-long v1, p0

    .line 31
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b03ad

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/LinearLayout;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->optionLayout:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    return-void
.end method

.method protected onMeasure(II)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->calculateMaxHeight()I

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

.method protected orientAboutObject()V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, v0}, Landroid/widget/LinearLayout;->measure(II)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->optionLayout:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const-string v1, "optionLayout"

    .line 10
    .line 11
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    :cond_0
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput v1, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->optionMeasuredHeight:I

    .line 24
    .line 25
    iget v1, p0, Lcom/android/launcher3/popup/c;->mArrowHeight:I

    .line 26
    .line 27
    iget v2, p0, Lcom/android/launcher3/popup/c;->mArrowOffsetVertical:I

    .line 28
    .line 29
    add-int/2addr v1, v2

    .line 30
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->getArrowHorizontalPadding()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    add-int/2addr v1, v2

    .line 35
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    add-int/2addr v2, v3

    .line 44
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    add-int/2addr v2, v3

    .line 49
    add-int/2addr v2, v1

    .line 50
    iget-object v3, p0, Lcom/android/launcher3/popup/c;->mTempRect:Landroid/graphics/Rect;

    .line 51
    .line 52
    invoke-virtual {p0, v3}, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->getTargetObjectLocation(Landroid/graphics/Rect;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    const-string v4, "getPopupContainer(...)"

    .line 60
    .line 61
    invoke-static {v3, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v3}, Lcom/android/launcher3/h1;->getInsets()Landroid/graphics/Rect;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    invoke-direct {p0, v4}, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->copyIconToDragLayer(Landroid/graphics/Rect;)V

    .line 72
    .line 73
    .line 74
    iget-object v5, p0, Lcom/android/launcher3/popup/c;->mTempRect:Landroid/graphics/Rect;

    .line 75
    .line 76
    iget v6, v5, Landroid/graphics/Rect;->left:I

    .line 77
    .line 78
    sub-int/2addr v6, v2

    .line 79
    iget v5, v5, Landroid/graphics/Rect;->right:I

    .line 80
    .line 81
    add-int/2addr v5, v1

    .line 82
    iget-boolean v7, p0, Lcom/android/launcher3/popup/c;->mIsRtl:Z

    .line 83
    .line 84
    const/4 v8, 0x1

    .line 85
    if-eqz v7, :cond_1

    .line 86
    .line 87
    iget v1, v4, Landroid/graphics/Rect;->left:I

    .line 88
    .line 89
    add-int/2addr v1, v6

    .line 90
    if-gez v1, :cond_2

    .line 91
    .line 92
    :goto_0
    move v0, v8

    .line 93
    goto :goto_1

    .line 94
    :cond_1
    sub-int/2addr v2, v1

    .line 95
    add-int/2addr v2, v5

    .line 96
    iget v1, v4, Landroid/graphics/Rect;->left:I

    .line 97
    .line 98
    add-int/2addr v2, v1

    .line 99
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getWidth()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    iget v3, v4, Landroid/graphics/Rect;->right:I

    .line 104
    .line 105
    sub-int/2addr v1, v3

    .line 106
    if-ge v2, v1, :cond_2

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_2
    :goto_1
    iput-boolean v0, p0, Lcom/android/launcher3/popup/c;->mIsLeftAligned:Z

    .line 110
    .line 111
    if-eqz v0, :cond_3

    .line 112
    .line 113
    move v6, v5

    .line 114
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mTempRect:Landroid/graphics/Rect;

    .line 115
    .line 116
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    iget v1, p0, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->optionMeasuredHeight:I

    .line 121
    .line 122
    sub-int/2addr v1, v0

    .line 123
    div-int/lit8 v1, v1, 0x2

    .line 124
    .line 125
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mTempRect:Landroid/graphics/Rect;

    .line 126
    .line 127
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 128
    .line 129
    sub-int/2addr v0, v1

    .line 130
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuViewWithArrow;->getExtraSpaceForRowAlignment()I

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    sub-int/2addr v0, v1

    .line 135
    iget v1, v4, Landroid/graphics/Rect;->left:I

    .line 136
    .line 137
    sub-int/2addr v6, v1

    .line 138
    iget v1, v4, Landroid/graphics/Rect;->top:I

    .line 139
    .line 140
    sub-int/2addr v0, v1

    .line 141
    int-to-float v1, v6

    .line 142
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setX(F)V

    .line 143
    .line 144
    .line 145
    int-to-float v0, v0

    .line 146
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setY(F)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    const-string v1, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 154
    .line 155
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 159
    .line 160
    iget-object p0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 161
    .line 162
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-static {p0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 170
    .line 171
    const/16 v1, 0x30

    .line 172
    .line 173
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 174
    .line 175
    iput v1, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 176
    .line 177
    return-void
.end method

.method protected updateArrowColor()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/popup/c;->mArrowWidth:I

    .line 4
    .line 5
    int-to-float v1, v1

    .line 6
    iget v2, p0, Lcom/android/launcher3/popup/c;->mArrowHeight:I

    .line 7
    .line 8
    int-to-float v2, v2

    .line 9
    iget v3, p0, Lcom/android/launcher3/popup/c;->mArrowPointRadius:I

    .line 10
    .line 11
    int-to-float v3, v3

    .line 12
    iget-boolean v4, p0, Lcom/android/launcher3/popup/c;->mIsLeftAligned:Z

    .line 13
    .line 14
    iget v5, p0, Lcom/android/launcher3/popup/c;->mArrowColor:I

    .line 15
    .line 16
    invoke-static {v1, v2, v3, v4, v5}, Lcom/android/launcher3/popup/A;->c(FFFZI)Lcom/android/launcher3/popup/A;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 21
    .line 22
    .line 23
    iget v0, p0, Lcom/android/launcher3/popup/c;->mElevation:F

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setElevation(F)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 29
    .line 30
    iget p0, p0, Lcom/android/launcher3/popup/c;->mElevation:F

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Landroid/view/View;->setElevation(F)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
