.class public Lcom/android/launcher3/taskbar/TaskbarDragLayer;
.super Lcom/android/launcher3/views/BaseDragLayer;
.source "TaskbarDragLayer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/views/BaseDragLayer<",
        "Lcom/android/launcher3/taskbar/I1;",
        ">;"
    }
.end annotation


# static fields
.field private static final o:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/taskbar/TaskbarDragLayer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final g:Lcom/android/launcher3/taskbar/L1;

.field private final h:Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;

.field private i:Lcom/android/launcher3/taskbar/s2$a;

.field private j:Landroid/media/permission/SafeCloseable;

.field private k:F

.field private l:F

.field private m:Z

.field private final n:Lcom/android/launcher3/util/v1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/v1<",
            "Lcom/android/launcher3/taskbar/TaskbarDragLayer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/TaskbarDragLayer$a;

    .line 2
    .line 3
    const-string v1, "taskbarBgAlpha"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/TaskbarDragLayer$a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->o:Landroid/util/FloatProperty;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/taskbar/TaskbarDragLayer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/launcher3/taskbar/TaskbarDragLayer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 6

    const/4 p3, 0x1

    .line 3
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/views/BaseDragLayer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance p1, Lcom/android/launcher3/taskbar/l2;

    invoke-direct {p1, p0}, Lcom/android/launcher3/taskbar/l2;-><init>(Lcom/android/launcher3/taskbar/TaskbarDragLayer;)V

    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->h:Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;

    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->m:Z

    .line 6
    new-instance p2, Lcom/android/launcher3/taskbar/L1;

    iget-object p3, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    check-cast p3, Lcom/android/launcher3/taskbar/I1;

    invoke-direct {p2, p3}, Lcom/android/launcher3/taskbar/L1;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    iput-object p2, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->g:Lcom/android/launcher3/taskbar/L1;

    .line 7
    new-instance v0, Lcom/android/launcher3/util/v1;

    sget-object v2, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->o:Landroid/util/FloatProperty;

    new-instance v4, Lcom/android/launcher3/taskbar/m2;

    invoke-direct {v4}, Lcom/android/launcher3/taskbar/m2;-><init>()V

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v3, 0x2

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/util/v1;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;ILcom/android/launcher3/util/v1$b;F)V

    iput-object v0, v1, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->n:Lcom/android/launcher3/util/v1;

    .line 8
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/taskbar/TaskbarDragLayer;Landroid/view/ViewTreeObserver$InternalInsetsInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->g(Landroid/view/ViewTreeObserver$InternalInsetsInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(FF)F
    .locals 0

    .line 1
    mul-float/2addr p0, p1

    .line 2
    return p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/taskbar/TaskbarDragLayer;)Lcom/android/launcher3/taskbar/L1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->g:Lcom/android/launcher3/taskbar/L1;

    .line 2
    .line 3
    return-object p0
.end method

.method private g(Landroid/view/ViewTreeObserver$InternalInsetsInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->i:Lcom/android/launcher3/taskbar/s2$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/s2$a;->g(Landroid/view/ViewTreeObserver$InternalInsetsInfo;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method protected canFindActiveController()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->Q0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->i:Lcom/android/launcher3/taskbar/s2$a;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/s2$a;->b()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    int-to-float v0, v0

    .line 19
    const/high16 v1, 0x3f800000    # 1.0f

    .line 20
    .line 21
    iget v2, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->k:F

    .line 22
    .line 23
    sub-float/2addr v1, v2

    .line 24
    mul-float/2addr v0, v1

    .line 25
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->g:Lcom/android/launcher3/taskbar/L1;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/L1;->i(F)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->g:Lcom/android/launcher3/taskbar/L1;

    .line 31
    .line 32
    iget v1, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->l:F

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/L1;->k(F)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->g:Lcom/android/launcher3/taskbar/L1;

    .line 38
    .line 39
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/L1;->a(Landroid/graphics/Canvas;)V

    .line 40
    .line 41
    .line 42
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->i:Lcom/android/launcher3/taskbar/s2$a;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/s2$a;->a(Landroid/graphics/Canvas;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v2, 0x4

    .line 13
    if-ne v0, v2, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 16
    .line 17
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/android/launcher3/a;->getTopOpenView(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/a;->canHandleBack()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/android/launcher3/a;->onBackInvoked()V

    .line 32
    .line 33
    .line 34
    return v1

    .line 35
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    const-string v0, "Main"

    .line 2
    .line 3
    const-string v1, "Touch event"

    .line 4
    .line 5
    invoke-static {v0, v1, p1}, Lcom/android/launcher3/testing/K;->e(Ljava/lang/String;Ljava/lang/String;Landroid/view/MotionEvent;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->i:Lcom/android/launcher3/taskbar/s2$a;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/s2$a;->d(Landroid/view/MotionEvent;)V

    .line 11
    .line 12
    .line 13
    invoke-super {p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public f(Lcom/android/launcher3/taskbar/s2$a;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->i:Lcom/android/launcher3/taskbar/s2$a;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->g:Lcom/android/launcher3/taskbar/L1;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 6
    .line 7
    check-cast v0, Lcom/android/launcher3/taskbar/I1;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/taskbar/L1;->p(Lcom/android/launcher3/taskbar/I1;Landroid/content/res/Resources;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->recreateControllers()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method protected getBackgroundRendererAlpha()Lcom/android/launcher3/util/v1$c;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->n:Lcom/android/launcher3/util/v1;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method protected getBackgroundRendererAlphaForStash()Lcom/android/launcher3/util/v1$c;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->n:Lcom/android/launcher3/util/v1;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method protected getLastDrawnTransientRect()Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->g:Lcom/android/launcher3/taskbar/L1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/L1;->d()Landroid/graphics/RectF;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method protected h()V
    .locals 1

    .line 1
    sget-boolean v0, Lf1/a;->g:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->i(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method protected i(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->h:Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->removeOnComputeInternalInsetsListener(Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method protected isEventWithinSystemGestureRegion(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object v1, p0, Lcom/android/launcher3/views/BaseDragLayer;->mSystemGestureRegion:Landroid/graphics/RectF;

    .line 10
    .line 11
    iget v1, v1, Landroid/graphics/RectF;->left:F

    .line 12
    .line 13
    cmpl-float v1, v0, v1

    .line 14
    .line 15
    if-ltz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    int-to-float v1, v1

    .line 22
    iget-object p0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mSystemGestureRegion:Landroid/graphics/RectF;

    .line 23
    .line 24
    iget v2, p0, Landroid/graphics/RectF;->right:F

    .line 25
    .line 26
    sub-float/2addr v1, v2

    .line 27
    cmpg-float v0, v0, v1

    .line 28
    .line 29
    if-gez v0, :cond_0

    .line 30
    .line 31
    iget p0, p0, Landroid/graphics/RectF;->top:F

    .line 32
    .line 33
    cmpl-float p0, p1, p0

    .line 34
    .line 35
    if-ltz p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p1, p0}, LJ/Y;->w(Landroid/view/WindowInsets;Landroid/view/View;)LJ/Y;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, LJ/Y$k;->c()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, LJ/Y;->f(I)LB/b;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->i:Lcom/android/launcher3/taskbar/s2$a;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/s2$a;->f()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-object p1
.end method

.method protected onAttachedToWindow()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->h:Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnComputeInternalInsetsListener(Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, LL0/u;->d(Landroid/content/Context;)LL0/n;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getRootView()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, ".Taskbar"

    .line 26
    .line 27
    invoke-virtual {v0, v1, v2}, LL0/n;->q(Landroid/view/View;Ljava/lang/String;)Landroid/media/permission/SafeCloseable;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->j:Landroid/media/permission/SafeCloseable;

    .line 32
    .line 33
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->j:Landroid/media/permission/SafeCloseable;

    .line 5
    .line 6
    invoke-interface {v0}, Landroid/media/permission/SafeCloseable;->close()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->i(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onViewRemoved(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->onViewRemoved(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->i:Lcom/android/launcher3/taskbar/s2$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/s2$a;->e()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public recreateControllers()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->i:Lcom/android/launcher3/taskbar/s2$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/s2$a;->c()[Lcom/android/launcher3/util/G2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mControllers:[Lcom/android/launcher3/util/G2;

    .line 8
    .line 9
    return-void
.end method

.method public setAnimatingTaskbarPinning(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->m:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->g:Lcom/android/launcher3/taskbar/L1;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/L1;->g(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setBackgroundHorizontalInsets(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->g:Lcom/android/launcher3/taskbar/L1;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/L1;->j(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected setBackgroundTranslationXForBubbleBar(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->g:Lcom/android/launcher3/taskbar/L1;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/L1;->m(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected setBackgroundTranslationYForStash(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->g:Lcom/android/launcher3/taskbar/L1;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/L1;->n(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected setBackgroundTranslationYForSwipe(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->g:Lcom/android/launcher3/taskbar/L1;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/L1;->o(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected setCornerRoundness(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->g:Lcom/android/launcher3/taskbar/L1;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/L1;->l(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setIsAnimatingPersistentTaskbarBackground(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->g:Lcom/android/launcher3/taskbar/L1;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/L1;->f(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setIsAnimatingTransientTaskbarBackground(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->g:Lcom/android/launcher3/taskbar/L1;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/L1;->h(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected setTaskbarBackgroundOffset(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->k:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected setTaskbarBackgroundProgress(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->l:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
