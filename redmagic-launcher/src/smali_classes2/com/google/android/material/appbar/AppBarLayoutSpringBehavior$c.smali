.class Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$c;
.super Ljava/lang/Object;
.source "AppBarLayoutSpringBehavior.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->P0(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:I

.field final synthetic i:Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;


# direct methods
.method constructor <init>(Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$c;->i:Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 2
    .line 3
    iput p2, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$c;->g:I

    .line 4
    .line 5
    iput p3, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$c;->h:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
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
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$c;->i:Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->G0(Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;)Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$c;->i:Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

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
    iget v0, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$c;->h:I

    .line 27
    .line 28
    if-ne p1, v0, :cond_0

    .line 29
    .line 30
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$c;->i:Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->F0(Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;)Landroid/animation/ValueAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$c;->i:Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->F0(Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;)Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$c;->i:Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    invoke-static {p1, v0}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->J0(Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;Landroid/animation/ValueAnimator;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$c;->i:Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 54
    .line 55
    invoke-static {p0}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->K0(Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method
