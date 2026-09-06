.class Lcom/android/launcher3/widget/suggest/m$e;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SuggestWidgetHostView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/suggest/m;->t0(ZLjava/util/ArrayList;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Ljava/lang/Runnable;

.field final synthetic i:Lcom/android/launcher3/widget/suggest/m;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/suggest/m;ZLjava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/m$e;->i:Lcom/android/launcher3/widget/suggest/m;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/widget/suggest/m$e;->g:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/widget/suggest/m$e;->h:Ljava/lang/Runnable;

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
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/widget/suggest/m$e;->i:Lcom/android/launcher3/widget/suggest/m;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/widget/suggest/m;->getSuggestWidgetHostViewTag()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, "doAlphaShowOrHideAnim onAnimationEnd alphaShow="

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-boolean v0, p0, Lcom/android/launcher3/widget/suggest/m$e;->g:Z

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v0, " skip="

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/widget/suggest/m$e;->i:Lcom/android/launcher3/widget/suggest/m;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/android/launcher3/widget/suggest/m;->d0(Lcom/android/launcher3/widget/suggest/m;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string v0, "SuggestWidgetHostView"

    .line 47
    .line 48
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    iget-boolean p1, p0, Lcom/android/launcher3/widget/suggest/m$e;->g:Z

    .line 52
    .line 53
    if-eqz p1, :cond_0

    .line 54
    .line 55
    iget-object p1, p0, Lcom/android/launcher3/widget/suggest/m$e;->i:Lcom/android/launcher3/widget/suggest/m;

    .line 56
    .line 57
    const/4 v0, 0x0

    .line 58
    invoke-static {p1, v0}, Lcom/android/launcher3/widget/suggest/m;->g0(Lcom/android/launcher3/widget/suggest/m;Landroid/animation/Animator;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/android/launcher3/widget/suggest/m$e;->i:Lcom/android/launcher3/widget/suggest/m;

    .line 62
    .line 63
    invoke-static {p1}, Lcom/android/launcher3/widget/suggest/m;->d0(Lcom/android/launcher3/widget/suggest/m;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_0

    .line 68
    .line 69
    iget-object p1, p0, Lcom/android/launcher3/widget/suggest/m$e;->i:Lcom/android/launcher3/widget/suggest/m;

    .line 70
    .line 71
    const/4 v0, 0x0

    .line 72
    invoke-static {p1, v0}, Lcom/android/launcher3/widget/suggest/m;->f0(Lcom/android/launcher3/widget/suggest/m;Z)V

    .line 73
    .line 74
    .line 75
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/m$e;->h:Ljava/lang/Runnable;

    .line 76
    .line 77
    if-eqz p0, :cond_1

    .line 78
    .line 79
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/widget/suggest/m$e;->i:Lcom/android/launcher3/widget/suggest/m;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/android/launcher3/widget/suggest/m;->getSuggestWidgetHostViewTag()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "doAlphaShowOrHideAnim onAnimationStart alphaShow="

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-boolean v1, p0, Lcom/android/launcher3/widget/suggest/m$e;->g:Z

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, " skip="

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/android/launcher3/widget/suggest/m$e;->i:Lcom/android/launcher3/widget/suggest/m;

    .line 31
    .line 32
    invoke-static {v1}, Lcom/android/launcher3/widget/suggest/m;->d0(Lcom/android/launcher3/widget/suggest/m;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "SuggestWidgetHostView"

    .line 44
    .line 45
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/android/launcher3/widget/suggest/m$e;->i:Lcom/android/launcher3/widget/suggest/m;

    .line 49
    .line 50
    invoke-static {v0, p1}, Lcom/android/launcher3/widget/suggest/m;->g0(Lcom/android/launcher3/widget/suggest/m;Landroid/animation/Animator;)V

    .line 51
    .line 52
    .line 53
    iget-boolean v0, p0, Lcom/android/launcher3/widget/suggest/m$e;->g:Z

    .line 54
    .line 55
    if-nez v0, :cond_0

    .line 56
    .line 57
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/m$e;->i:Lcom/android/launcher3/widget/suggest/m;

    .line 58
    .line 59
    invoke-static {p0}, Lcom/android/launcher3/widget/suggest/m;->d0(Lcom/android/launcher3/widget/suggest/m;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_0

    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/animation/Animator;->end()V

    .line 66
    .line 67
    .line 68
    :cond_0
    return-void
.end method
