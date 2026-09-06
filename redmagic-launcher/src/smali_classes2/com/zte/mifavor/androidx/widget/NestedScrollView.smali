.class public Lcom/zte/mifavor/androidx/widget/NestedScrollView;
.super Landroidx/core/widget/NestedScrollView;
.source "NestedScrollView.java"


# instance fields
.field private M:Lb4/e;

.field private N:I

.field private O:Z

.field private P:Z

.field private Q:Z

.field private R:Z

.field private S:Lc4/h;

.field private T:Lc4/c;

.field private U:I

.field private V:Z

.field private W:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/androidx/widget/NestedScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroidx/core/widget/NestedScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 3
    iput p2, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->N:I

    const/4 p3, 0x1

    .line 4
    iput-boolean p3, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->O:Z

    .line 5
    iput-boolean p3, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->P:Z

    .line 6
    iput-boolean p2, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->Q:Z

    .line 7
    iput-boolean p3, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->R:Z

    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->T:Lc4/c;

    .line 9
    iput p3, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->U:I

    .line 10
    iput-boolean p2, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->V:Z

    .line 11
    iput-boolean p2, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->W:Z

    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "NestedScrollView in, context = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Z#View-SpringNSV"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 13
    new-instance v0, Lb4/e;

    invoke-direct {v0}, Lb4/e;-><init>()V

    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 14
    sget-object v1, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    const/4 v2, 0x0

    invoke-virtual {v0, p0, v1, v2}, Lb4/e;->s(Landroid/view/View;Landroidx/dynamicanimation/animation/g;F)V

    .line 15
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lb4/e;->j(Landroid/content/Context;)V

    .line 16
    invoke-static {p1}, Lcom/zte/mifavor/widget/s;->d(Landroid/content/Context;)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->R:Z

    .line 17
    iget-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->O:Z

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    move p2, p3

    :cond_0
    iput-boolean p2, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->O:Z

    .line 18
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    invoke-virtual {p1, p2}, Lb4/e;->B(Z)V

    .line 19
    new-instance p1, Lc4/h;

    invoke-direct {p1, p0}, Lc4/h;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->S:Lc4/h;

    .line 20
    invoke-virtual {p1}, Lc4/h;->b()Lc4/c;

    move-result-object p1

    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->T:Lc4/c;

    return-void
.end method

.method private getAnimIsRunning()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getRootView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget v0, LR3/g;->c:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    instance-of v0, p0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    check-cast p0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->f()Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 30
    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->Q0()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string v1, "get Anim Is Running = "

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v1, "Z#View-SpringNSV"

    .line 57
    .line 58
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    return p0
.end method

.method private getIsFirstDownScroll()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getRootView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget v0, LR3/g;->c:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    instance-of v0, p0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    check-cast p0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->f()Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 30
    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->T0()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method private setApplayoutSpringDistance(I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getRootView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget v0, LR3/g;->c:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v2, "set App layout Spring Distance in, distance="

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v2, ", appBarLayout="

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v2, ", view="

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string v1, "Z#View-SpringNSV"

    .line 47
    .line 48
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    instance-of p0, v0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 52
    .line 53
    if-eqz p0, :cond_0

    .line 54
    .line 55
    check-cast v0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 62
    .line 63
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->f()Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    check-cast p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 68
    .line 69
    if-eqz p0, :cond_0

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->P0(I)V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method


# virtual methods
.method public a0()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->c0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lb4/e;->t()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_1
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public b0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lb4/e;->v()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public c0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lb4/e;->w()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationY()F

    .line 15
    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 21
    .line 22
    invoke-virtual {v0}, Lb4/e;->p()Landroidx/dynamicanimation/animation/j;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/e;->h()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 33
    .line 34
    invoke-virtual {v0}, Lb4/e;->p()Landroidx/dynamicanimation/animation/j;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->C()V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 42
    .line 43
    invoke-virtual {v0}, Lb4/e;->p()Landroidx/dynamicanimation/animation/j;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->c()V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 51
    .line 52
    invoke-virtual {v0}, Lb4/e;->f()V

    .line 53
    .line 54
    .line 55
    const/4 v0, 0x0

    .line 56
    iput v0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->N:I

    .line 57
    .line 58
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    return p0
.end method

.method public getInterruptSlideDirection()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->U:I

    .line 2
    .line 3
    return p0
.end method

.method public getIsBeingDragged()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->T:Lc4/c;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lc4/c;->getIsBeingDragged()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getUseSpring()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->O:Z

    .line 2
    .line 3
    return p0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-super {p0, p1}, Landroidx/core/widget/NestedScrollView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->a0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->V:Z

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->W:Z

    .line 19
    .line 20
    :cond_0
    return p1
.end method

.method protected onOverScrolled(IIZZ)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/core/widget/NestedScrollView;->onOverScrolled(IIZZ)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->P:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->Q:Z

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iput-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->P:Z

    .line 13
    .line 14
    iput-boolean p4, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->Q:Z

    .line 15
    .line 16
    :goto_0
    div-int/lit8 p2, p2, 0x14

    .line 17
    .line 18
    iget-object p3, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 19
    .line 20
    invoke-virtual {p3}, Lb4/e;->k()I

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    invoke-direct {p0}, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->getAnimIsRunning()Z

    .line 25
    .line 26
    .line 27
    move-result p4

    .line 28
    invoke-direct {p0}, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->getIsFirstDownScroll()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget v1, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->N:I

    .line 33
    .line 34
    sub-int/2addr v1, p2

    .line 35
    iput v1, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->N:I

    .line 36
    .line 37
    iget-object p2, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 38
    .line 39
    invoke-virtual {p2, v1}, Lb4/e;->C(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-boolean p2, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->Q:Z

    .line 47
    .line 48
    if-nez p2, :cond_1

    .line 49
    .line 50
    iget-boolean v1, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->P:Z

    .line 51
    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    iget-boolean v1, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->V:Z

    .line 55
    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    iget-boolean v1, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->W:Z

    .line 59
    .line 60
    if-eqz v1, :cond_1

    .line 61
    .line 62
    const/4 v1, 0x3

    .line 63
    if-ne p3, v1, :cond_1

    .line 64
    .line 65
    if-nez v0, :cond_1

    .line 66
    .line 67
    iget-object p2, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 68
    .line 69
    const/16 p3, 0x3ec

    .line 70
    .line 71
    invoke-virtual {p2, p1, p3}, Lb4/e;->l(Landroid/view/View;I)F

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    float-to-int p1, p1

    .line 76
    int-to-float p2, p1

    .line 77
    const/high16 p3, 0x42040000    # 33.0f

    .line 78
    .line 79
    cmpl-float p2, p2, p3

    .line 80
    .line 81
    if-lez p2, :cond_4

    .line 82
    .line 83
    if-nez p4, :cond_4

    .line 84
    .line 85
    invoke-direct {p0, p1}, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->setApplayoutSpringDistance(I)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_1
    if-eqz p2, :cond_2

    .line 90
    .line 91
    iget-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->P:Z

    .line 92
    .line 93
    if-eqz v0, :cond_3

    .line 94
    .line 95
    :cond_2
    if-nez p2, :cond_4

    .line 96
    .line 97
    iget-boolean p2, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->P:Z

    .line 98
    .line 99
    if-eqz p2, :cond_4

    .line 100
    .line 101
    :cond_3
    const/4 p2, 0x2

    .line 102
    if-ne p3, p2, :cond_4

    .line 103
    .line 104
    if-eqz p1, :cond_4

    .line 105
    .line 106
    if-nez p4, :cond_4

    .line 107
    .line 108
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 109
    .line 110
    const/16 p2, 0x3eb

    .line 111
    .line 112
    invoke-virtual {p0, p1, p2}, Lb4/e;->x(Landroid/view/View;I)V

    .line 113
    .line 114
    .line 115
    :cond_4
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-super {p0, p1}, Landroidx/core/widget/NestedScrollView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v1, 0x1

    .line 10
    if-eq v1, v0, :cond_1

    .line 11
    .line 12
    const/4 v2, 0x3

    .line 13
    if-ne v2, v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return p1

    .line 17
    :cond_1
    :goto_0
    iput-boolean v1, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->W:Z

    .line 18
    .line 19
    return p1
.end method

.method public setDampingRatio(Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lb4/e;->y(F)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setDragAmplitude(Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lb4/e;->z(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    move-exception p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setDuration(Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lb4/e;->A(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setInterruptSlideDirection(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->U:I

    .line 2
    .line 3
    return-void
.end method

.method public setSlipAmplitude(Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lb4/e;->D(F)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setStiffness(Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lb4/e;->F(F)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setUseSpring(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->R:Z

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p1, 0x0

    .line 10
    :goto_0
    iput-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->O:Z

    .line 11
    .line 12
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lb4/e;->B(Z)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public v(I)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->canScrollVertically(I)Z

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->canScrollVertically(I)Z

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->getIsBeingDragged()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->O:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->M:Lb4/e;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Lb4/e;->h(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-super {p0, p1}, Landroidx/core/widget/NestedScrollView;->v(I)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method
