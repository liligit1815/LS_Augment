.class Lcom/android/launcher3/taskbar/a4$d;
.super Lcom/android/launcher3/anim/g;
.source "TaskbarStashController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/a4;->B(Landroid/animation/AnimatorSet;ZLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:Landroid/view/View;

.field final synthetic i:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/a4;ILandroid/view/View;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput p2, p0, Lcom/android/launcher3/taskbar/a4$d;->g:I

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/launcher3/taskbar/a4$d;->h:Landroid/view/View;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/android/launcher3/taskbar/a4$d;->i:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/anim/g;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/internal/jank/InteractionJankMonitor;->getInstance()Lcom/android/internal/jank/InteractionJankMonitor;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget p0, p0, Lcom/android/launcher3/taskbar/a4$d;->g:I

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Lcom/android/internal/jank/InteractionJankMonitor;->cancel(I)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget p1, p0, Lcom/android/launcher3/taskbar/a4$d;->g:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4$d;->h:Landroid/view/View;

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/android/internal/jank/InteractionJankMonitor$Configuration$Builder;->withView(ILandroid/view/View;)Lcom/android/internal/jank/InteractionJankMonitor$Configuration$Builder;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4$d;->i:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Lcom/android/internal/jank/InteractionJankMonitor$Configuration$Builder;->setTag(Ljava/lang/String;)Lcom/android/internal/jank/InteractionJankMonitor$Configuration$Builder;

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {}, Lcom/android/internal/jank/InteractionJankMonitor;->getInstance()Lcom/android/internal/jank/InteractionJankMonitor;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, p1}, Lcom/android/internal/jank/InteractionJankMonitor;->begin(Lcom/android/internal/jank/InteractionJankMonitor$Configuration$Builder;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/internal/jank/InteractionJankMonitor;->getInstance()Lcom/android/internal/jank/InteractionJankMonitor;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget p0, p0, Lcom/android/launcher3/taskbar/a4$d;->g:I

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/android/internal/jank/InteractionJankMonitor;->end(I)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method
