.class Lcom/android/launcher3/taskbar/g3$e;
.super Landroid/widget/FrameLayout;
.source "TaskbarManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/g3;->K(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:Lcom/android/launcher3/taskbar/g3;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/g3;Landroid/content/Context;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/g3$e;->h:Lcom/android/launcher3/taskbar/g3;

    .line 2
    .line 3
    iput p3, p0, Lcom/android/launcher3/taskbar/g3$e;->g:I

    .line 4
    .line 5
    invoke-direct {p0, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3$e;->h:Lcom/android/launcher3/taskbar/g3;

    .line 2
    .line 3
    const-string v1, "dispatchTouchEvent: "

    .line 4
    .line 5
    iget v2, p0, Lcom/android/launcher3/taskbar/g3$e;->g:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3$e;->h:Lcom/android/launcher3/taskbar/g3;

    .line 11
    .line 12
    iget v1, p0, Lcom/android/launcher3/taskbar/g3$e;->g:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->isAttachedToWindow()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0
.end method
