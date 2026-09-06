.class public final Lcom/android/launcher3/anim/y$b;
.super Ljava/lang/Object;
.source "AppLaunchAnimUtil.kt"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/anim/y;->b([Lu2/s;ZLcom/android/launcher3/C2;FZ)Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Lcom/android/launcher3/C2;


# direct methods
.method constructor <init>(ZLcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/anim/y$b;->g:Z

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/anim/y$b;->h:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const-string p0, "animator2"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    const-string p0, "animator2"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 7
    .line 8
    const-string p1, "INSTANCE"

    .line 9
    .line 10
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p1, v0}, Lcom/android/quickstep/utils/DefaultAnimationController;->setCloseWidgetRemoteAnim(Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 p1, -0x1

    .line 26
    invoke-virtual {p0, p1}, Lcom/android/quickstep/utils/DefaultAnimationController;->setOpeningRemoteAnimWidgetId(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const-string p0, "animator2"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 6

    .line 1
    const-string v0, "animator2"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "getLightWindowAnimation onAnimationStart"

    .line 7
    .line 8
    const-string v1, "AppLaunchAnimUtil"

    .line 9
    .line 10
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 14
    .line 15
    const-string v2, "INSTANCE"

    .line 16
    .line 17
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iget-boolean v3, p0, Lcom/android/launcher3/anim/y$b;->g:Z

    .line 25
    .line 26
    const/4 v4, 0x0

    .line 27
    if-nez v3, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lcom/android/quickstep/utils/DefaultAnimationController;->getMOpeningRemoteAnimWidgetId()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/4 v3, -0x1

    .line 38
    if-eq v0, v3, :cond_0

    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move v0, v4

    .line 43
    :goto_0
    invoke-virtual {v2, v0}, Lcom/android/quickstep/utils/DefaultAnimationController;->setCloseWidgetRemoteAnim(Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/launcher3/anim/y$b;->h:Lcom/android/launcher3/C2;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lcom/android/launcher3/V3;

    .line 57
    .line 58
    invoke-virtual {p1}, Landroid/animation/Animator;->getDuration()J

    .line 59
    .line 60
    .line 61
    move-result-wide v2

    .line 62
    new-instance p1, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    const-string v5, "getLightWindowAnimation onEnd, state:"

    .line 68
    .line 69
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v0, ", duration: "

    .line 76
    .line 77
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/android/launcher3/anim/y$b;->h:Lcom/android/launcher3/C2;

    .line 91
    .line 92
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 93
    .line 94
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_2

    .line 99
    .line 100
    iget-object p1, p0, Lcom/android/launcher3/anim/y$b;->h:Lcom/android/launcher3/C2;

    .line 101
    .line 102
    invoke-static {p1}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    sget-object v0, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 107
    .line 108
    if-ne p1, v0, :cond_1

    .line 109
    .line 110
    iget-boolean p1, p0, Lcom/android/launcher3/anim/y$b;->g:Z

    .line 111
    .line 112
    if-eqz p1, :cond_1

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_1
    const-string p1, "the state isn\'t NORMAL, so we must change state to NORMAL"

    .line 116
    .line 117
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    iget-object p0, p0, Lcom/android/launcher3/anim/y$b;->h:Lcom/android/launcher3/C2;

    .line 121
    .line 122
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    sget-object p1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 127
    .line 128
    invoke-virtual {p0, p1, v4}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 129
    .line 130
    .line 131
    :cond_2
    :goto_1
    return-void
.end method
