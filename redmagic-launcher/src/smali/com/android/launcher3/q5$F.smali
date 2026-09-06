.class public Lcom/android/launcher3/q5$F;
.super Lcom/android/launcher3/anim/U;
.source "QuickstepTransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/q5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "F"
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/q5;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/q5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/q5$F;->g:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/anim/U;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Ljava/lang/Runnable;)Z
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/anim/U;->getAnimationId()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/android/launcher3/q5$F;->g:Lcom/android/launcher3/q5;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/android/launcher3/q5;->q(Lcom/android/launcher3/q5;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    const-string p1, "All app transition ended."

    .line 14
    .line 15
    const-string v0, "QuickstepTransitionManager"

    .line 16
    .line 17
    invoke-static {v0, p1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/launcher3/q5$F;->g:Lcom/android/launcher3/q5;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-static {p1, v1}, Lcom/android/launcher3/q5;->w(Lcom/android/launcher3/q5;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/launcher3/q5$F;->g:Lcom/android/launcher3/q5;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/android/launcher3/q5;->v(Lcom/android/launcher3/q5;)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v1, Lcom/android/launcher3/t5;

    .line 37
    .line 38
    invoke-direct {v1}, Lcom/android/launcher3/t5;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v1, Lcom/android/launcher3/q5$F$a;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Lcom/android/launcher3/q5$F$a;-><init>(Lcom/android/launcher3/q5$F;)V

    .line 48
    .line 49
    .line 50
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/android/launcher3/q5$F;->g:Lcom/android/launcher3/q5;

    .line 54
    .line 55
    invoke-static {p1}, Lcom/android/launcher3/q5;->v(Lcom/android/launcher3/q5;)Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/android/launcher3/q5$F;->g:Lcom/android/launcher3/q5;

    .line 63
    .line 64
    iget-object p1, p1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 65
    .line 66
    if-eqz p1, :cond_0

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    if-eqz p1, :cond_0

    .line 73
    .line 74
    iget-object p0, p0, Lcom/android/launcher3/q5$F;->g:Lcom/android/launcher3/q5;

    .line 75
    .line 76
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 77
    .line 78
    sget-object p1, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 79
    .line 80
    invoke-interface {p0, p1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-eqz p0, :cond_0

    .line 85
    .line 86
    const-string p0, "tryAndUpdatePredictedApps when floating anim end!"

    .line 87
    .line 88
    invoke-static {v0, p0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_0
    return-void
.end method
