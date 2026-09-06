.class Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$Companion$1;
.super Ljava/lang/Object;
.source "CloseAppFadeInAnimUpdater.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$Companion;->startCloseAppFadeInAnim(Landroid/view/View;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$Companion;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const-string p0, "animator"

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
    const-string p0, "animator"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->a(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const-string p1, "CloseAppFadeInAnimUpdater"

    .line 15
    .line 16
    const-string v0, "closeAppFadeInAnim.onAnimationEnd called, animationId: "

    .line 17
    .line 18
    invoke-static {v0, p0, p1}, Lcom/android/quickstep/util/MFVStringUtils;->logInfos(Ljava/lang/String;ILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    sget-object p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->INSTANCE:Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$Companion;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$Companion;->onAnimActualEndAction()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const-string p0, "animator"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    const-string p0, "animator"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->a(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const-string p1, "CloseAppFadeInAnimUpdater"

    .line 15
    .line 16
    const-string v0, "closeAppFadeInAnim.onAnimationStart called, animationId: "

    .line 17
    .line 18
    invoke-static {v0, p0, p1}, Lcom/android/quickstep/util/MFVStringUtils;->logInfos(Ljava/lang/String;ILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
