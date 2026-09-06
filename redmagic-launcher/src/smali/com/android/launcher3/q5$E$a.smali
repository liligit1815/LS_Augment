.class Lcom/android/launcher3/q5$E$a;
.super Lcom/android/launcher3/anim/g;
.source "QuickstepTransitionManager.java"


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
    iput-object p1, p0, Lcom/android/launcher3/q5$E$a;->g:Lcom/android/launcher3/q5$E;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/q5$E$a;->g:Lcom/android/launcher3/q5$E;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/android/launcher3/anim/C;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Lu2/e;->h()V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/launcher3/q5$E$a;->g:Lcom/android/launcher3/q5$E;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-static {p0, p1}, Lcom/android/launcher3/q5;->z(Lcom/android/launcher3/q5;Landroid/animation/AnimatorSet;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
