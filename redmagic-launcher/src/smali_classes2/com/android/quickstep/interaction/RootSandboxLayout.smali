.class public Lcom/android/quickstep/interaction/RootSandboxLayout;
.super Landroid/widget/RelativeLayout;
.source "RootSandboxLayout.java"


# instance fields
.field final mColorOnSurfaceBack:I

.field final mColorOnSurfaceHome:I

.field final mColorOnSurfaceOverview:I

.field final mColorSecondaryBack:I

.field final mColorSecondaryHome:I

.field final mColorSecondaryOverview:I

.field final mColorSurfaceBack:I

.field final mColorSurfaceContainer:I

.field final mColorSurfaceHome:I

.field final mColorSurfaceOverview:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/interaction/RootSandboxLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/quickstep/interaction/RootSandboxLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 3
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/quickstep/interaction/RootSandboxLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1

    .line 4
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 5
    sget-object v0, Lcom/android/launcher3/x5;->D2:[I

    invoke-virtual {p1, p2, v0, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 6
    invoke-static {p1}, Lcom/android/launcher3/N5;->x(Landroid/content/Context;)Z

    move-result p1

    const/4 p3, -0x1

    const/high16 p4, -0x1000000

    if-eqz p1, :cond_0

    move v0, p4

    goto :goto_0

    :cond_0
    move v0, p3

    :goto_0
    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    move p3, p4

    :goto_1
    const/4 p1, 0x7

    .line 7
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSurfaceContainer:I

    const/4 p1, 0x1

    .line 8
    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorOnSurfaceHome:I

    const/16 p1, 0x8

    .line 9
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSurfaceHome:I

    const/4 p1, 0x4

    const p4, -0x777778

    .line 10
    invoke-virtual {p2, p1, p4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSecondaryHome:I

    const/4 p1, 0x0

    .line 11
    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorOnSurfaceBack:I

    const/4 p1, 0x6

    .line 12
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSurfaceBack:I

    const/4 p1, 0x3

    .line 13
    invoke-virtual {p2, p1, p4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSecondaryBack:I

    const/4 p1, 0x2

    .line 14
    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorOnSurfaceOverview:I

    const/16 p1, 0x9

    .line 15
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSurfaceOverview:I

    const/4 p1, 0x5

    .line 16
    invoke-virtual {p2, p1, p4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSecondaryOverview:I

    .line 17
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public getFullscreenHeight()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getRootWindowInsets()Landroid/view/WindowInsets;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemBars()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    iget v1, v0, Landroid/graphics/Insets;->top:I

    .line 18
    .line 19
    add-int/2addr p0, v1

    .line 20
    iget v0, v0, Landroid/graphics/Insets;->bottom:I

    .line 21
    .line 22
    add-int/2addr p0, v0

    .line 23
    return p0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Landroidx/fragment/app/F;->g0(Landroid/view/View;)Landroidx/fragment/app/n;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/android/quickstep/interaction/TutorialFragment;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/quickstep/interaction/TutorialFragment;->onInterceptTouch(Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
