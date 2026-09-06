.class Lcom/android/launcher3/taskbar/X2$f;
.super Landroid/animation/AnimatorListenerAdapter;
.source "TaskbarLauncherStateController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/X2;->c0(Landroid/animation/AnimatorSet;JZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Z

.field final synthetic i:Lcom/android/launcher3/taskbar/X2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/X2;ZZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/X2$f;->i:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/taskbar/X2$f;->g:Z

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/android/launcher3/taskbar/X2$f;->h:Z

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
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/X2$f;->g:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/X2$f;->h:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2$f;->i:Lcom/android/launcher3/taskbar/X2;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/android/launcher3/taskbar/X2;->l(Lcom/android/launcher3/taskbar/X2;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/high16 p1, 0x3f800000    # 1.0f

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/Hotseat;->o1(FI)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2$f;->i:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/taskbar/X2;->l(Lcom/android/launcher3/taskbar/X2;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, v0}, Lcom/android/launcher3/Hotseat;->W0(I)Lcom/android/launcher3/util/v1$c;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Lcom/android/launcher3/util/v1$c;->c()F

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/4 v1, 0x0

    .line 21
    cmpl-float v1, p1, v1

    .line 22
    .line 23
    if-lez v1, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2$f;->i:Lcom/android/launcher3/taskbar/X2;

    .line 26
    .line 27
    invoke-static {p0, p1, v0}, Lcom/android/launcher3/taskbar/X2;->y(Lcom/android/launcher3/taskbar/X2;FI)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
