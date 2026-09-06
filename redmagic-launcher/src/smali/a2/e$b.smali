.class La2/e$b;
.super Lcom/android/launcher3/a;
.source "TaskbarOverlayController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = La2/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "b"
.end annotation


# instance fields
.field final synthetic g:La2/e;


# direct methods
.method private constructor <init>(La2/e;)V
    .locals 1

    .line 2
    iput-object p1, p0, La2/e$b;->g:La2/e;

    .line 3
    invoke-static {p1}, La2/e;->f(La2/e;)Lcom/android/launcher3/taskbar/I1;

    move-result-object p1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method synthetic constructor <init>(La2/e;La2/g;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, La2/e$b;-><init>(La2/e;)V

    return-void
.end method

.method public static synthetic N(La2/e$b;ZLa2/a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, La2/e$b;->Q(ZLa2/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic O(La2/e$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, La2/e$b;->show()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic Q(ZLa2/a;)V
    .locals 1

    .line 1
    iget-object v0, p0, La2/e$b;->g:La2/e;

    .line 2
    .line 3
    invoke-static {v0}, La2/e;->g(La2/e;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, La2/e$b;->g:La2/e;

    .line 10
    .line 11
    invoke-virtual {p0}, La2/e;->r()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {p2, p1}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private show()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 3
    .line 4
    iget-object v0, p0, La2/e$b;->g:La2/e;

    .line 5
    .line 6
    invoke-static {v0}, La2/e;->f(La2/e;)Lcom/android/launcher3/taskbar/I1;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method protected handleClose(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Lcom/android/launcher3/y0;->G0()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, La2/e$b;->g:La2/e;

    .line 16
    .line 17
    invoke-static {v0}, La2/e;->f(La2/e;)Lcom/android/launcher3/taskbar/I1;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, La2/e$b;->g:La2/e;

    .line 29
    .line 30
    invoke-static {v0}, La2/e;->e(La2/e;)La2/a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, La2/f;

    .line 39
    .line 40
    invoke-direct {v1, p0, p1}, La2/f;-><init>(La2/e$b;Z)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    const/high16 p0, 0x100000

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
