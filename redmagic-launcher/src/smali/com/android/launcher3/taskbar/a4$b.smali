.class Lcom/android/launcher3/taskbar/a4$b;
.super Ljava/lang/Object;
.source "TaskbarStashController.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/a4;->U(J)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private g:Z

.field final synthetic h:Lcom/android/launcher3/taskbar/a4;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/a4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/a4$b;->h:Lcom/android/launcher3/taskbar/a4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/a4$b;->g:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/a4$b;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    const/high16 v0, 0x3e800000    # 0.25f

    .line 11
    .line 12
    cmpl-float p1, p1, v0

    .line 13
    .line 14
    if-ltz p1, :cond_1

    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4$b;->h:Lcom/android/launcher3/taskbar/a4;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/android/launcher3/taskbar/a4;->r(Lcom/android/launcher3/taskbar/a4;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4$b;->h:Lcom/android/launcher3/taskbar/a4;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/a4;->C0()V

    .line 27
    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/a4$b;->g:Z

    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method
