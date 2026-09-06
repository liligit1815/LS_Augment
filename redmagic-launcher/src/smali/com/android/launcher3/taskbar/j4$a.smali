.class Lcom/android/launcher3/taskbar/j4$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "TaskbarTranslationController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/j4;->o(J)Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/j4;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/j4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j4$a;->g:Lcom/android/launcher3/taskbar/j4;

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
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/j4$a;->g:Lcom/android/launcher3/taskbar/j4;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Lcom/android/launcher3/taskbar/j4;->j(Lcom/android/launcher3/taskbar/j4;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j4$a;->g:Lcom/android/launcher3/taskbar/j4;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/taskbar/j4;->m(Lcom/android/launcher3/taskbar/j4;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/j4$a;->g:Lcom/android/launcher3/taskbar/j4;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/j4;->n()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/taskbar/j4$a;->g:Lcom/android/launcher3/taskbar/j4;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/android/launcher3/taskbar/j4;->m(Lcom/android/launcher3/taskbar/j4;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j4$a;->g:Lcom/android/launcher3/taskbar/j4;

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/j4;->j(Lcom/android/launcher3/taskbar/j4;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
