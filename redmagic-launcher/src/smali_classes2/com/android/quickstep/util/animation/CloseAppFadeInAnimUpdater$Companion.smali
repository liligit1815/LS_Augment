.class public final Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$Companion;
.super Ljava/lang/Object;
.source "CloseAppFadeInAnimUpdater.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimActualEndAction()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->d(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;)Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$CloseAppFadeInTarget;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0, v0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$CloseAppFadeInTarget;->fadeIn(F)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->e(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 27
    .line 28
    .line 29
    :cond_1
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-static {p0, v0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->i(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$CloseAppFadeInTarget;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0, v0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->j(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const/4 v0, 0x0

    .line 49
    invoke-static {p0, v0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->f(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;I)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final resetCloseAppFadeInAnim()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->getAnimator()Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->cancel()V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->getAnimator()Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->removeAllListeners()V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 v0, 0x1

    .line 38
    invoke-static {p0, v0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->g(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final startCloseAppFadeInAnim(Landroid/view/View;)V
    .locals 1

    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$Companion;->startCloseAppFadeInAnim(Landroid/view/View;I)V

    return-void
.end method

.method public final startCloseAppFadeInAnim(Landroid/view/View;I)V
    .locals 3

    .line 1
    const-string v0, "startCloseAppFadeInAnim start, animationId: "

    const-string v1, "CloseAppFadeInAnimUpdater"

    invoke-static {v0, p2, v1}, Lcom/android/quickstep/util/MFVStringUtils;->logInfos(Ljava/lang/String;ILjava/lang/String;)V

    if-nez p1, :cond_0

    .line 2
    const-string p0, "startCloseAppFadeInAnim, empty view!"

    invoke-static {v1, p0}, LM3/a;->p(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 3
    :cond_0
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    move-result-object v0

    invoke-static {v0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->a(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;)I

    move-result v0

    if-eqz v0, :cond_1

    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startCloseAppFadeInAnim, old anim still running: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    move-result-object v2

    invoke-static {v2}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->a(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;)I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, LM3/a;->p(Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    :cond_1
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->cancel()V

    .line 6
    instance-of v0, p1, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$CloseAppFadeInTarget;

    if-eqz v0, :cond_2

    .line 7
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    move-result-object v0

    check-cast p1, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$CloseAppFadeInTarget;

    invoke-static {v0, p1}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->i(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$CloseAppFadeInTarget;)V

    goto :goto_0

    .line 8
    :cond_2
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->j(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;Landroid/view/View;)V

    .line 9
    :goto_0
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->k()Landroid/util/Property;

    move-result-object p1

    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/util/Property;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    move-result-object p1

    invoke-static {p1, p2}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->f(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;I)V

    .line 11
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    move-result-object p1

    invoke-static {p1}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->b(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 12
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->getAnimator()Landroid/animation/ValueAnimator;

    move-result-object p1

    new-instance p2, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$Companion$1;

    invoke-direct {p2, p0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$Companion$1;-><init>(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$Companion;)V

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 13
    :cond_3
    invoke-static {}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->animateIn()V

    return-void
.end method
