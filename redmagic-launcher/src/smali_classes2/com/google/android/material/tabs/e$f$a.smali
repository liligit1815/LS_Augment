.class Lcom/google/android/material/tabs/e$f$a;
.super Ljava/lang/Object;
.source "TabLayout.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/tabs/e$f;->k(ZII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/view/View;

.field final synthetic h:Landroid/view/View;

.field final synthetic i:Lcom/google/android/material/tabs/e$f;


# direct methods
.method constructor <init>(Lcom/google/android/material/tabs/e$f;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/tabs/e$f$a;->i:Lcom/google/android/material/tabs/e$f;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/google/android/material/tabs/e$f$a;->g:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/google/android/material/tabs/e$f$a;->h:Landroid/view/View;

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
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f$a;->i:Lcom/google/android/material/tabs/e$f;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/material/tabs/e$f$a;->g:Landroid/view/View;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/material/tabs/e$f$a;->h:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {v0, v1, p0, p1}, Lcom/google/android/material/tabs/e$f;->b(Lcom/google/android/material/tabs/e$f;Landroid/view/View;Landroid/view/View;F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
