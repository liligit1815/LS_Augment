.class Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$1;
.super Landroid/util/Property;
.source "CloseAppFadeInAnimUpdater.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/Property<",
        "Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;",
        "Ljava/lang/Float;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/util/Property;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public get(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;)Ljava/lang/Float;
    .locals 0

    .line 2
    const-string p0, "anim"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    invoke-static {p1}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->c(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;)F

    move-result p0

    .line 4
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$1;->get(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method

.method public set(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;F)V
    .locals 0

    .line 3
    const-string p0, "anim"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    invoke-static {p1, p2}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->h(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;F)V

    .line 5
    invoke-static {p1}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->d(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;)Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$CloseAppFadeInTarget;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 6
    invoke-interface {p0, p2}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$CloseAppFadeInTarget;->fadeIn(F)V

    .line 7
    :cond_0
    invoke-static {p1}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->e(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;)Landroid/view/View;

    move-result-object p0

    if-nez p0, :cond_1

    return-void

    .line 8
    :cond_1
    invoke-virtual {p0, p2}, Landroid/view/View;->setAlpha(F)V

    return-void
.end method

.method public set(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;Ljava/lang/Float;)V
    .locals 0

    .line 2
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$1;->set(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;F)V

    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    check-cast p2, Ljava/lang/Float;

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$1;->set(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;Ljava/lang/Float;)V

    return-void
.end method
