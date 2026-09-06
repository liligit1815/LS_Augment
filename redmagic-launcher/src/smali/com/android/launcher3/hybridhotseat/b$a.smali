.class Lcom/android/launcher3/hybridhotseat/b$a;
.super Lcom/android/launcher3/anim/g;
.source "HotseatPredictionController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/hybridhotseat/b;->p(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Lcom/android/launcher3/hybridhotseat/b;


# direct methods
.method constructor <init>(Lcom/android/launcher3/hybridhotseat/b;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/hybridhotseat/b$a;->h:Lcom/android/launcher3/hybridhotseat/b;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/hybridhotseat/b$a;->g:Z

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/hybridhotseat/b$a;->h:Lcom/android/launcher3/hybridhotseat/b;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/android/launcher3/hybridhotseat/b$a;->g:Z

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/android/launcher3/hybridhotseat/b;->j(Lcom/android/launcher3/hybridhotseat/b;Z)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/hybridhotseat/b$a;->h:Lcom/android/launcher3/hybridhotseat/b;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/android/launcher3/hybridhotseat/b;->i(Lcom/android/launcher3/hybridhotseat/b;)Landroid/animation/AnimatorSet;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
