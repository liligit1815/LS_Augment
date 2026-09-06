.class Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$d;
.super Ljava/lang/Object;
.source "AppBarLayoutSpringBehavior.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->a1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;


# direct methods
.method constructor <init>(Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$d;->h:Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 2
    .line 3
    iput p2, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$d;->g:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$d;->h:Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->G0(Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;)Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$d;->h:Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 18
    .line 19
    invoke-static {v2}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->D0(Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;)Lcom/google/android/material/appbar/AppBarLayout;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v0, v1, v2, p1}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->L0(Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$d;->h:Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->H0(Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-ne p1, v0, :cond_0

    .line 33
    .line 34
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$d;->h:Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 35
    .line 36
    invoke-static {p1}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->F0(Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;)Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$d;->h:Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->E0(Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;)Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$d;->h:Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 52
    .line 53
    const/4 p1, 0x0

    .line 54
    invoke-static {p0, p1}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->I0(Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;Landroid/animation/ValueAnimator;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method
