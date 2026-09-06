.class Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$b;
.super Ljava/lang/Object;
.source "AppBarLayoutSpringBehavior.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->a0(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

.field final synthetic h:Lcom/google/android/material/appbar/AppBarLayout;

.field final synthetic i:Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;


# direct methods
.method constructor <init>(Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$b;->i:Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$b;->g:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$b;->h:Lcom/google/android/material/appbar/AppBarLayout;

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
    .locals 2

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
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$b;->i:Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$b;->g:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior$b;->h:Lcom/google/android/material/appbar/AppBarLayout;

    .line 16
    .line 17
    invoke-virtual {v0, v1, p0, p1}, Lcom/google/android/material/appbar/c;->T(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)I

    .line 18
    .line 19
    .line 20
    return-void
.end method
