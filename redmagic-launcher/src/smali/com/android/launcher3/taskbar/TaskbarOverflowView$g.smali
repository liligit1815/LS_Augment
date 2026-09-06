.class Lcom/android/launcher3/taskbar/TaskbarOverflowView$g;
.super Landroid/animation/AnimatorListenerAdapter;
.source "TaskbarOverflowView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/TaskbarOverflowView;->setIsActive(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/TaskbarOverflowView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/TaskbarOverflowView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView$g;->g:Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView$g;->g:Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->n(Lcom/android/launcher3/taskbar/TaskbarOverflowView;Landroid/animation/ValueAnimator;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
