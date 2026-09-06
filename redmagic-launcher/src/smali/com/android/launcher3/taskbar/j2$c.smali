.class Lcom/android/launcher3/taskbar/j2$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "TaskbarDragController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/j2;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/dragndrop/v;

.field final synthetic h:Lcom/android/launcher3/taskbar/j2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/j2;Lcom/android/launcher3/dragndrop/v;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j2$c;->h:Lcom/android/launcher3/taskbar/j2;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/taskbar/j2$c;->g:Lcom/android/launcher3/dragndrop/v;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/j2$c;->h:Lcom/android/launcher3/taskbar/j2;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/j2;->j()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/taskbar/j2$c;->g:Lcom/android/launcher3/dragndrop/v;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/v;->D()V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/taskbar/j2$c;->g:Lcom/android/launcher3/dragndrop/v;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->clearAnimation()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j2$c;->h:Lcom/android/launcher3/taskbar/j2;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/j2;->g0(Lcom/android/launcher3/taskbar/j2;Landroid/animation/ValueAnimator;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
