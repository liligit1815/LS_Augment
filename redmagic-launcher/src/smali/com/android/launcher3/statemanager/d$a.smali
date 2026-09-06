.class Lcom/android/launcher3/statemanager/d$a;
.super Lcom/android/launcher3/anim/g;
.source "StateManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/statemanager/d;->s(Lcom/android/launcher3/statemanager/a;)Landroid/animation/Animator$AnimatorListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/statemanager/a;

.field final synthetic h:Lcom/android/launcher3/statemanager/d;


# direct methods
.method constructor <init>(Lcom/android/launcher3/statemanager/d;Lcom/android/launcher3/statemanager/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/statemanager/d$a;->h:Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/statemanager/d$a;->g:Lcom/android/launcher3/statemanager/a;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 6
    .line 7
    .line 8
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
    const-string p0, "StateManager"

    .line 5
    .line 6
    const-string p1, "onAnimationCancel: "

    .line 7
    .line 8
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/anim/g;->onAnimationEnd(Landroid/animation/Animator;)V

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
    const-string v0, "onAnimationEnd: mCancelled = "

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    iget-boolean v0, p0, Lcom/android/launcher3/anim/g;->mCancelled:Z

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v0, " old mAnimingFromToState="

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d$a;->h:Lcom/android/launcher3/statemanager/d;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/android/launcher3/statemanager/d;->c(Lcom/android/launcher3/statemanager/d;)Landroid/util/Pair;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string v0, "StateManager"

    .line 38
    .line 39
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d$a;->h:Lcom/android/launcher3/statemanager/d;

    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    invoke-static {p0, p1}, Lcom/android/launcher3/statemanager/d;->g(Lcom/android/launcher3/statemanager/d;Landroid/util/Pair;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 4

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "onAnimationStart: "

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d$a;->g:Lcom/android/launcher3/statemanager/a;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v0, "StateManager"

    .line 21
    .line 22
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/launcher3/statemanager/d$a;->h:Lcom/android/launcher3/statemanager/d;

    .line 26
    .line 27
    new-instance v1, Landroid/util/Pair;

    .line 28
    .line 29
    iget-object v2, p0, Lcom/android/launcher3/statemanager/d$a;->h:Lcom/android/launcher3/statemanager/d;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/android/launcher3/statemanager/d;->l:Lcom/android/launcher3/statemanager/a;

    .line 32
    .line 33
    iget-object v3, p0, Lcom/android/launcher3/statemanager/d$a;->g:Lcom/android/launcher3/statemanager/a;

    .line 34
    .line 35
    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p1, v1}, Lcom/android/launcher3/statemanager/d;->g(Lcom/android/launcher3/statemanager/d;Landroid/util/Pair;)V

    .line 39
    .line 40
    .line 41
    new-instance p1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    const-string v1, "onAnimationStart: mAnimingFromToState="

    .line 47
    .line 48
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d$a;->h:Lcom/android/launcher3/statemanager/d;

    .line 52
    .line 53
    invoke-static {v1}, Lcom/android/launcher3/statemanager/d;->c(Lcom/android/launcher3/statemanager/d;)Landroid/util/Pair;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/android/launcher3/statemanager/d$a;->h:Lcom/android/launcher3/statemanager/d;

    .line 68
    .line 69
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d$a;->g:Lcom/android/launcher3/statemanager/a;

    .line 70
    .line 71
    invoke-static {p1, p0}, Lcom/android/launcher3/statemanager/d;->i(Lcom/android/launcher3/statemanager/d;Lcom/android/launcher3/statemanager/a;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/statemanager/d$a;->h:Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d$a;->g:Lcom/android/launcher3/statemanager/a;

    .line 4
    .line 5
    invoke-static {p1, p0}, Lcom/android/launcher3/statemanager/d;->h(Lcom/android/launcher3/statemanager/d;Lcom/android/launcher3/statemanager/a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
