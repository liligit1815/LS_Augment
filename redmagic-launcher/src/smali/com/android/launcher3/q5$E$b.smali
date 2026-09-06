.class Lcom/android/launcher3/q5$E$b;
.super Ljava/lang/Object;
.source "QuickstepTransitionManager.java"

# interfaces
.implements Lcom/android/launcher3/anim/T;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/q5$E;->onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/q5$E;


# direct methods
.method constructor <init>(Lcom/android/launcher3/q5$E;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/q5$E$b;->g:Lcom/android/launcher3/q5$E;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/q5$E$b;->g:Lcom/android/launcher3/q5$E;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    invoke-virtual {p1, v0}, Lcom/android/launcher3/v;->clearForceInvisibleFlag(I)V

    .line 9
    .line 10
    .line 11
    sget-object p1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/q5$E$b;->g:Lcom/android/launcher3/q5$E;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/android/launcher3/anim/C;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lu2/e;->h()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5$E$b;->g:Lcom/android/launcher3/q5$E;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/v;->addForceInvisibleFlag(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
