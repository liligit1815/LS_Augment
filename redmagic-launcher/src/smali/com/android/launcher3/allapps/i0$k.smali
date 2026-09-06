.class Lcom/android/launcher3/allapps/i0$k;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PrivateProfileManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/allapps/i0;->I0(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Lcom/android/launcher3/allapps/i0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/allapps/i0;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/i0$k;->h:Lcom/android/launcher3/allapps/i0;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/allapps/i0$k;->g:Z

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
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0$k;->h:Lcom/android/launcher3/allapps/i0;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/allapps/i0;->L(Lcom/android/launcher3/allapps/i0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "updatePrivateStateAnimator: Private space animation expanding: "

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/android/launcher3/allapps/i0$k;->g:Z

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v0, "PrivateProfileManager"

    .line 21
    .line 22
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/launcher3/allapps/i0$k;->h:Lcom/android/launcher3/allapps/i0;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/android/launcher3/allapps/v0;->g:Lcom/android/launcher3/logging/StatsLogManager;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-boolean v0, p0, Lcom/android/launcher3/allapps/i0$k;->g:Z

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->w3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->u3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 41
    .line 42
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0$k;->h:Lcom/android/launcher3/allapps/i0;

    .line 43
    .line 44
    invoke-static {v1}, Lcom/android/launcher3/allapps/i0;->D(Lcom/android/launcher3/allapps/i0;)Lcom/android/launcher3/allapps/r;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-interface {p1, v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->sendToInteractionJankMonitor(Lcom/android/launcher3/logging/StatsLogManager$d;Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0$k;->h:Lcom/android/launcher3/allapps/i0;

    .line 56
    .line 57
    const/4 p1, 0x1

    .line 58
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/i0;->B0(Z)V

    .line 59
    .line 60
    .line 61
    return-void
.end method
