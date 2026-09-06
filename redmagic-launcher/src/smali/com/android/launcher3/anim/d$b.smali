.class Lcom/android/launcher3/anim/d$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AnimatedFloat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/anim/d;->g(FF)Landroid/animation/ObjectAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:F

.field final synthetic h:Lcom/android/launcher3/anim/d;


# direct methods
.method constructor <init>(Lcom/android/launcher3/anim/d;F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/d$b;->h:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/anim/d$b;->g:F

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
    iget-object v0, p0, Lcom/android/launcher3/anim/d$b;->h:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/anim/d;->c(Lcom/android/launcher3/anim/d;)Landroid/animation/ObjectAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-ne v0, p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/anim/d$b;->h:Lcom/android/launcher3/anim/d;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p1, v0}, Lcom/android/launcher3/anim/d;->e(Lcom/android/launcher3/anim/d;Landroid/animation/ObjectAnimator;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/anim/d$b;->h:Lcom/android/launcher3/anim/d;

    .line 16
    .line 17
    invoke-static {p0, v0}, Lcom/android/launcher3/anim/d;->d(Lcom/android/launcher3/anim/d;Ljava/lang/Float;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/d$b;->h:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/anim/d;->c(Lcom/android/launcher3/anim/d;)Landroid/animation/ObjectAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-ne v0, p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/anim/d$b;->h:Lcom/android/launcher3/anim/d;

    .line 10
    .line 11
    iget p0, p0, Lcom/android/launcher3/anim/d$b;->g:F

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p1, p0}, Lcom/android/launcher3/anim/d;->d(Lcom/android/launcher3/anim/d;Ljava/lang/Float;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
