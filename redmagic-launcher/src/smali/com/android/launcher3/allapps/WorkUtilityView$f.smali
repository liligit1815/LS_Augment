.class Lcom/android/launcher3/allapps/WorkUtilityView$f;
.super Landroid/animation/AnimatorListenerAdapter;
.source "WorkUtilityView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/allapps/WorkUtilityView;->u(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Lcom/android/launcher3/allapps/WorkUtilityView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/allapps/WorkUtilityView;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$f;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/allapps/WorkUtilityView$f;->g:Z

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
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$f;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/allapps/WorkUtilityView;->j(Lcom/android/launcher3/allapps/WorkUtilityView;)Lcom/android/launcher3/logging/StatsLogManager;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-boolean v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView$f;->g:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->U3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->W3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 19
    .line 20
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView$f;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->n(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/LinearLayout;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p1, v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->sendToInteractionJankMonitor(Lcom/android/launcher3/logging/StatsLogManager$d;Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$f;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/allapps/WorkUtilityView;->j(Lcom/android/launcher3/allapps/WorkUtilityView;)Lcom/android/launcher3/logging/StatsLogManager;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-boolean v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView$f;->g:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->T3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->V3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 19
    .line 20
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView$f;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->n(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/LinearLayout;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p1, v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->sendToInteractionJankMonitor(Lcom/android/launcher3/logging/StatsLogManager$d;Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
