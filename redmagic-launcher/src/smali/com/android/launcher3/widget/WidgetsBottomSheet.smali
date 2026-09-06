.class public Lcom/android/launcher3/widget/WidgetsBottomSheet;
.super Lcom/android/launcher3/widget/o;
.source "WidgetsBottomSheet.java"


# instance fields
.field private b0:Lcom/android/launcher3/model/data/y;

.field private c0:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/WidgetsBottomSheet;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/widget/o;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setWillNotDraw(Z)V

    return-void
.end method

.method public static synthetic X0(Lcom/android/launcher3/widget/WidgetsBottomSheet;Lcom/android/launcher3/widget/b1;Lz1/Z4;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/WidgetsBottomSheet;->a1(Lcom/android/launcher3/widget/b1;Lz1/Z4;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y0(Lcom/android/launcher3/widget/WidgetsBottomSheet;Landroid/widget/TableLayout;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/WidgetsBottomSheet;->b1(Landroid/widget/TableLayout;Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic a1(Lcom/android/launcher3/widget/b1;Lz1/Z4;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/WidgetsBottomSheet;->Z0(Lcom/android/launcher3/widget/b1;)Lcom/android/launcher3/widget/WidgetCell;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p2}, Lcom/android/launcher3/widget/WidgetCell;->g(Lz1/Z4;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getLastSelectedWidgetItem()Lz1/Z4;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p1, p0}, Lcom/android/launcher3/widget/WidgetCell;->s(Lz1/Z4;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->callOnClick()Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private animateOpen()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->T0()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-wide/16 v1, 0x64

    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->j0()Lcom/android/launcher3/anim/q;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->x()V

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    return-void
.end method

.method private synthetic b1(Landroid/widget/TableLayout;Ljava/util/ArrayList;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/b1;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/android/launcher3/widget/b1;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/16 v1, 0x30

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TableRow;->setGravity(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/widget/b1;->d(II)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Lcom/android/launcher3/widget/d1;

    .line 24
    .line 25
    invoke-direct {v1, p0, v0}, Lcom/android/launcher3/widget/d1;-><init>(Lcom/android/launcher3/widget/WidgetsBottomSheet;Lcom/android/launcher3/widget/b1;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/widget/TableLayout;->addView(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private d1()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget v2, p0, Lcom/android/launcher3/widget/o;->F:I

    .line 16
    .line 17
    mul-int/lit8 v2, v2, 0x2

    .line 18
    .line 19
    sub-int/2addr v0, v2

    .line 20
    iget v2, p0, Lcom/android/launcher3/widget/WidgetsBottomSheet;->c0:I

    .line 21
    .line 22
    if-eq v2, v0, :cond_1

    .line 23
    .line 24
    iput v0, p0, Lcom/android/launcher3/widget/WidgetsBottomSheet;->c0:I

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetsBottomSheet;->w()V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    return v1
.end method


# virtual methods
.method public L()V
    .locals 0

    .line 1
    return-void
.end method

.method protected N0(I)V
    .locals 1

    .line 1
    const v0, 0x7f0b06a5

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method protected Q0(Lcom/android/launcher3/widget/WidgetCell;I)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    if-eqz p1, :cond_2

    .line 6
    .line 7
    instance-of v0, p1, Landroid/widget/ScrollView;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    check-cast p1, Landroid/widget/ScrollView;

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    invoke-virtual {p1, p0, p2}, Landroid/widget/ScrollView;->smoothScrollBy(II)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    if-ne p1, p0, :cond_1

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    invoke-interface {p1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    goto :goto_0

    .line 26
    :cond_2
    :goto_1
    return-void
.end method

.method protected Z0(Lcom/android/launcher3/widget/b1;)Lcom/android/launcher3/widget/WidgetCell;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const v1, 0x7f0e0258

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/launcher3/widget/WidgetCell;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/android/launcher3/widget/WidgetCell;->e(Lcom/android/launcher3/widget/WidgetCell$c;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    const v1, 0x7f0b068e

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v2}, Lcom/android/launcher3/widget/WidgetCell;->setAnimatePreview(Z)V

    .line 39
    .line 40
    .line 41
    const/16 p0, -0x70

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/WidgetCell;->setSourceContainer(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/widget/TableRow;->addView(Landroid/view/View;)V

    .line 47
    .line 48
    .line 49
    return-object v0
.end method

.method public addHintCloseAnim(FLandroid/view/animation/Interpolator;Lcom/android/launcher3/anim/V;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->v:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    invoke-virtual {p3, p0, p1, v0, p2}, Lcom/android/launcher3/anim/V;->q(Lcom/android/launcher3/anim/d;FFLandroid/animation/TimeInterpolator;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public c1(Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/WidgetsBottomSheet;->b0:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    const p1, 0x7f0b060e

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Landroid/widget/TextView;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetsBottomSheet;->b0:Lcom/android/launcher3/model/data/y;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetsBottomSheet;->w()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->T()V

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    iput-boolean p1, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/android/launcher3/widget/WidgetsBottomSheet;->animateOpen()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method protected getAccessibilityTarget()Landroid/util/Pair;
    .locals 2
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
    const v0, 0x7f0b060e

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-boolean p0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    const p0, 0x7f140493

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const p0, 0x7f140494

    .line 21
    .line 22
    .line 23
    :goto_0
    invoke-virtual {v1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {v0, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method protected handleClose(Z)V
    .locals 2

    .line 1
    const-wide/16 v0, 0xc8

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/views/f;->Y(ZJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    and-int/lit8 p0, p1, 0x4

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
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 10
    .line 11
    const v0, 0x7f0b06a6

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Landroid/widget/ScrollView;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2, v0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_0

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/widget/ScrollView;->getScrollY()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-lez v0, :cond_0

    .line 35
    .line 36
    iput-boolean v1, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    iput-boolean v1, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 59
    .line 60
    :cond_1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/f;->onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    return p0
.end method

.method protected onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b069d

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/view/ViewGroup;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const v1, 0x7f080852

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 27
    .line 28
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/views/f;->g0(Landroid/graphics/drawable/Drawable;Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    sub-int/2addr p4, p2

    .line 2
    sub-int/2addr p5, p3

    .line 3
    iget-object p1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    sub-int/2addr p4, p1

    .line 10
    iget-object p2, p0, Lcom/android/launcher3/widget/o;->E:Landroid/graphics/Rect;

    .line 11
    .line 12
    iget p3, p2, Landroid/graphics/Rect;->left:I

    .line 13
    .line 14
    sub-int/2addr p4, p3

    .line 15
    iget p2, p2, Landroid/graphics/Rect;->right:I

    .line 16
    .line 17
    sub-int/2addr p4, p2

    .line 18
    div-int/lit8 p4, p4, 0x2

    .line 19
    .line 20
    add-int/2addr p4, p3

    .line 21
    iget-object p2, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 22
    .line 23
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 24
    .line 25
    .line 26
    move-result p3

    .line 27
    sub-int p3, p5, p3

    .line 28
    .line 29
    add-int/2addr p1, p4

    .line 30
    invoke-virtual {p2, p4, p3, p1, p5}, Landroid/view/ViewGroup;->layout(IIII)V

    .line 31
    .line 32
    .line 33
    iget p1, p0, Lcom/android/launcher3/views/f;->o:F

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/o;->setTranslationShift(F)V

    .line 36
    .line 37
    .line 38
    const p1, 0x7f0b06a6

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Landroid/widget/ScrollView;

    .line 46
    .line 47
    const p2, 0x7f0b06a5

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    check-cast p2, Landroid/widget/TableLayout;

    .line 55
    .line 56
    invoke-virtual {p2}, Landroid/widget/TableLayout;->getMeasuredHeight()I

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    invoke-virtual {p1}, Landroid/widget/ScrollView;->getMeasuredHeight()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-le p2, p1, :cond_0

    .line 65
    .line 66
    const p1, 0x7f0b016b

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const/4 p1, 0x0

    .line 74
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 75
    .line 76
    .line 77
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/o;->D0(II)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/widget/WidgetsBottomSheet;->d1()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/o;->D0(II)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/o;->setInsets(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 5
    .line 6
    iget v0, p0, Lcom/android/launcher3/widget/o;->H:I

    .line 7
    .line 8
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const v0, 0x7f0b06a5

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    invoke-virtual {v0, v1, v2, v3, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 32
    .line 33
    .line 34
    if-lez p1, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->T0()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->z0()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public w()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/v;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ln2/c;->e()Lo2/a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetsBottomSheet;->b0:Lcom/android/launcher3/model/data/y;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/android/launcher3/util/L1;->a(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/L1;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-static {v0, v1}, Lo2/b;->a(Lo2/a;Lcom/android/launcher3/util/L1;)Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 27
    .line 28
    :goto_0
    const v1, 0x7f0b06a5

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Landroid/widget/TableLayout;

    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/widget/TableLayout;->removeAllViews()V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 41
    .line 42
    move-object v3, v2

    .line 43
    check-cast v3, Lcom/android/launcher3/v;

    .line 44
    .line 45
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    iget v4, p0, Lcom/android/launcher3/widget/WidgetsBottomSheet;->c0:I

    .line 50
    .line 51
    iget v5, p0, Lcom/android/launcher3/widget/o;->G:I

    .line 52
    .line 53
    invoke-static {v0, v2, v3, v4, v5}, Lr2/i;->f(Ljava/util/List;Landroid/content/Context;Lcom/android/launcher3/h0;II)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v2, Lcom/android/launcher3/widget/c1;

    .line 58
    .line 59
    invoke-direct {v2, p0, v1}, Lcom/android/launcher3/widget/c1;-><init>(Lcom/android/launcher3/widget/WidgetsBottomSheet;Landroid/widget/TableLayout;)V

    .line 60
    .line 61
    .line 62
    invoke-interface {v0, v2}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method
