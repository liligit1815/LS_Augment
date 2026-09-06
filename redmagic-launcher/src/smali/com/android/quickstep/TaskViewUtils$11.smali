.class Lcom/android/quickstep/TaskViewUtils$11;
.super Landroid/animation/AnimatorListenerAdapter;
.source "TaskViewUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/TaskViewUtils;->createSplitAuxiliarySurfacesAnimator([Landroid/view/RemoteAnimationTarget;ZLjava/util/function/Consumer;)Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$auxiliarySurfaces:Ljava/util/List;

.field final synthetic val$shown:Z

.field final synthetic val$t:Landroid/view/SurfaceControl$Transaction;


# direct methods
.method constructor <init>(ZLjava/util/List;Landroid/view/SurfaceControl$Transaction;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/TaskViewUtils$11;->val$shown:Z

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/TaskViewUtils$11;->val$auxiliarySurfaces:Ljava/util/List;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/TaskViewUtils$11;->val$t:Landroid/view/SurfaceControl$Transaction;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Lcom/android/quickstep/TaskViewUtils$11;->val$shown:Z

    .line 2
    .line 3
    if-nez p1, :cond_2

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/quickstep/TaskViewUtils$11;->val$auxiliarySurfaces:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroid/view/SurfaceControl;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/SurfaceControl;->isValid()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/quickstep/TaskViewUtils$11;->val$t:Landroid/view/SurfaceControl$Transaction;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Landroid/view/SurfaceControl$Transaction;->hide(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/TaskViewUtils$11;->val$t:Landroid/view/SurfaceControl$Transaction;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 40
    .line 41
    .line 42
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/TaskViewUtils$11;->val$t:Landroid/view/SurfaceControl$Transaction;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/SurfaceControl$Transaction;->close()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-boolean p1, p0, Lcom/android/quickstep/TaskViewUtils$11;->val$shown:Z

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/quickstep/TaskViewUtils$11;->val$auxiliarySurfaces:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroid/view/SurfaceControl;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/SurfaceControl;->isValid()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    iget-object v1, p0, Lcom/android/quickstep/TaskViewUtils$11;->val$t:Landroid/view/SurfaceControl$Transaction;

    .line 30
    .line 31
    const v2, 0x7fffffff

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v0, v2}, Landroid/view/SurfaceControl$Transaction;->setLayer(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/quickstep/TaskViewUtils$11;->val$t:Landroid/view/SurfaceControl$Transaction;

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-virtual {v1, v0, v2}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/android/quickstep/TaskViewUtils$11;->val$t:Landroid/view/SurfaceControl$Transaction;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroid/view/SurfaceControl$Transaction;->show(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/TaskViewUtils$11;->val$t:Landroid/view/SurfaceControl$Transaction;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 52
    .line 53
    .line 54
    :cond_2
    return-void
.end method
