.class Lcom/android/launcher3/taskbar/E4$c;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "TaskbarViewCallbacks.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/E4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "c"
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/E4;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/taskbar/E4;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/taskbar/E4$c;->g:Lcom/android/launcher3/taskbar/E4;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/taskbar/E4;Lcom/android/launcher3/taskbar/F4;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/E4$c;-><init>(Lcom/android/launcher3/taskbar/E4;)V

    return-void
.end method

.method private a(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/E4$c;->g:Lcom/android/launcher3/taskbar/E4;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/E4;->h(Lcom/android/launcher3/taskbar/E4;)Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->d1()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/taskbar/E4$c;->g:Lcom/android/launcher3/taskbar/E4;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/android/launcher3/taskbar/E4;->j(Lcom/android/launcher3/taskbar/E4;)Lcom/android/launcher3/taskbar/TaskbarView;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/TaskbarView;->q(Landroid/view/MotionEvent;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/E4$c;->g:Lcom/android/launcher3/taskbar/E4;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/android/launcher3/taskbar/E4;->i(Lcom/android/launcher3/taskbar/E4;)Lcom/android/launcher3/taskbar/R1;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->y:Lcom/android/launcher3/taskbar/q3;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4$c;->g:Lcom/android/launcher3/taskbar/E4;

    .line 35
    .line 36
    invoke-static {p0}, Lcom/android/launcher3/taskbar/E4;->j(Lcom/android/launcher3/taskbar/E4;)Lcom/android/launcher3/taskbar/TaskbarView;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/taskbar/q3;->n(Landroid/view/View;F)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 50
    return p0
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    const/16 v0, 0x2002

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->isFromSource(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getButtonState()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x2

    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/E4$c;->a(Landroid/view/MotionEvent;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    const/4 p0, 0x1

    .line 20
    return p0
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/E4$c;->a(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4$c;->g:Lcom/android/launcher3/taskbar/E4;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/taskbar/E4;->j(Lcom/android/launcher3/taskbar/E4;)Lcom/android/launcher3/taskbar/TaskbarView;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->performHapticFeedback(I)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
