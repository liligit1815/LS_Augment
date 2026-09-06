.class public Lcom/android/launcher3/bestie/UpperRightCornerFamilyVideo;
.super Landroid/widget/LinearLayout;
.source "UpperRightCornerFamilyVideo.java"


# instance fields
.field private g:Lx1/v;

.field private h:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/bestie/UpperRightCornerFamilyVideo;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private a(FF)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/bestie/UpperRightCornerFamilyVideo;->h:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->animate()Landroid/view/ViewPropertyAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p2}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-wide/16 p1, 0xc8

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Lx1/v;->u(Landroid/view/View;Z)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/bestie/UpperRightCornerFamilyVideo;->g:Lx1/v;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Lx1/v;

    .line 13
    .line 14
    const-string v1, "UpperRightCornerFamilyVideo"

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-direct {v0, p0, v1, v2}, Lx1/v;-><init>(Landroid/view/View;Ljava/lang/String;Z)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/android/launcher3/bestie/UpperRightCornerFamilyVideo;->g:Lx1/v;

    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/bestie/UpperRightCornerFamilyVideo;->g:Lx1/v;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lx1/v;->g(Landroid/view/MotionEvent;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setDefaultFocusHighlightEnabled(Z)V

    .line 6
    .line 7
    .line 8
    const v0, 0x7f0b0663

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroid/widget/LinearLayout;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/launcher3/bestie/UpperRightCornerFamilyVideo;->h:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    return-void
.end method

.method protected onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/widget/LinearLayout;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lcom/android/launcher3/bestie/UpperRightCornerFamilyVideo;->h:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    int-to-float p2, p2

    .line 11
    const p3, 0x3cf5c28f    # 0.03f

    .line 12
    .line 13
    .line 14
    mul-float/2addr p2, p3

    .line 15
    iget-object p3, p0, Lcom/android/launcher3/bestie/UpperRightCornerFamilyVideo;->h:Landroid/widget/LinearLayout;

    .line 16
    .line 17
    invoke-virtual {p3}, Landroid/widget/LinearLayout;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    int-to-float p3, p3

    .line 22
    div-float/2addr p2, p3

    .line 23
    const/high16 p3, 0x3f800000    # 1.0f

    .line 24
    .line 25
    add-float/2addr p2, p3

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move p2, p3

    .line 30
    :goto_0
    if-eqz p1, :cond_1

    .line 31
    .line 32
    const p3, 0x3f83d70a    # 1.03f

    .line 33
    .line 34
    .line 35
    :cond_1
    invoke-direct {p0, p2, p3}, Lcom/android/launcher3/bestie/UpperRightCornerFamilyVideo;->a(FF)V

    .line 36
    .line 37
    .line 38
    if-eqz p1, :cond_3

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const p2, 0x7f0819e4

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p2}, Lcom/android/launcher3/H5;->Y()Lcom/android/launcher3/H5$g;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-virtual {p2}, Lcom/android/launcher3/H5$g;->a()I

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    const/4 v0, -0x1

    .line 68
    if-ne p2, v0, :cond_2

    .line 69
    .line 70
    const p2, 0x7f06020a

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    const p2, 0x7f060209

    .line 75
    .line 76
    .line 77
    :goto_1
    invoke-virtual {p3, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_3
    const/4 p1, 0x0

    .line 89
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method
