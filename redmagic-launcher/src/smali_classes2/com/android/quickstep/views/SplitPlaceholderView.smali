.class public Lcom/android/quickstep/views/SplitPlaceholderView;
.super Landroid/widget/FrameLayout;
.source "SplitPlaceholderView.java"


# instance fields
.field private mIconView:Lcom/android/quickstep/views/IconView;

.field private final mPaint:Landroid/graphics/Paint;

.field private final mTempRect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Landroid/graphics/Paint;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-direct {p2, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object p2, p0, Lcom/android/quickstep/views/SplitPlaceholderView;->mPaint:Landroid/graphics/Paint;

    .line 11
    .line 12
    new-instance v0, Landroid/graphics/Rect;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/quickstep/views/SplitPlaceholderView;->mTempRect:Landroid/graphics/Rect;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/android/quickstep/views/SplitPlaceholderView;->getThemeBackgroundColor(Landroid/content/Context;)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 24
    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setWillNotDraw(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private drawBackground(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/quickstep/views/FloatingTaskView;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/views/SplitPlaceholderView;->mPaint:Landroid/graphics/Paint;

    .line 8
    .line 9
    invoke-virtual {v0, p1, p0}, Lcom/android/quickstep/views/FloatingTaskView;->drawRoundedRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private static getThemeBackgroundColor(Landroid/content/Context;)I
    .locals 3

    .line 1
    new-instance v0, Landroid/util/TypedValue;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const v1, 0x1010031

    .line 11
    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    invoke-virtual {p0, v1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 15
    .line 16
    .line 17
    iget p0, v0, Landroid/util/TypedValue;->data:I

    .line 18
    .line 19
    return p0
.end method


# virtual methods
.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/SplitPlaceholderView;->drawBackground(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/quickstep/views/SplitPlaceholderView;->mIconView:Lcom/android/quickstep/views/IconView;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/quickstep/views/SplitPlaceholderView;->mTempRect:Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/android/quickstep/views/FloatingTaskView;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/quickstep/views/SplitPlaceholderView;->mIconView:Lcom/android/quickstep/views/IconView;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/quickstep/views/SplitPlaceholderView;->mTempRect:Landroid/graphics/Rect;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/graphics/Rect;->centerX()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    int-to-float v1, v1

    .line 31
    iget-object p0, p0, Lcom/android/quickstep/views/SplitPlaceholderView;->mTempRect:Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/graphics/Rect;->centerY()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    int-to-float p0, p0

    .line 38
    invoke-virtual {p1, v0, v1, p0}, Lcom/android/quickstep/views/FloatingTaskView;->centerIconView(Lcom/android/quickstep/views/IconView;FF)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public getIconView()Lcom/android/quickstep/views/IconView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/SplitPlaceholderView;->mIconView:Lcom/android/quickstep/views/IconView;

    .line 2
    .line 3
    return-object p0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/SplitPlaceholderView;->mIconView:Lcom/android/quickstep/views/IconView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/android/quickstep/views/IconView;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/IconView;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/quickstep/views/SplitPlaceholderView;->mIconView:Lcom/android/quickstep/views/IconView;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/SplitPlaceholderView;->mIconView:Lcom/android/quickstep/views/IconView;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Lcom/android/quickstep/views/IconView;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/quickstep/views/SplitPlaceholderView;->mIconView:Lcom/android/quickstep/views/IconView;

    .line 25
    .line 26
    invoke-virtual {p1, p2, p2}, Lcom/android/quickstep/views/IconView;->setDrawableSize(II)V

    .line 27
    .line 28
    .line 29
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 30
    .line 31
    invoke-direct {p1, p2, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/quickstep/views/SplitPlaceholderView;->mIconView:Lcom/android/quickstep/views/IconView;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
