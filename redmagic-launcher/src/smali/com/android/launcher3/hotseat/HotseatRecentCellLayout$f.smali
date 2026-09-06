.class Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$f;
.super Landroid/animation/AnimatorListenerAdapter;
.source "HotseatRecentCellLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->d1(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:Ljava/util/ArrayList;

.field final synthetic i:Landroid/view/View;

.field final synthetic j:Landroid/animation/ValueAnimator;

.field final synthetic k:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;ILjava/util/ArrayList;Landroid/view/View;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$f;->k:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$f;->g:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$f;->h:Ljava/util/ArrayList;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$f;->i:Landroid/view/View;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$f;->j:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$f;->k:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 5
    .line 6
    iget v0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$f;->g:I

    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$f;->h:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lcom/android/launcher3/model/data/I;

    .line 15
    .line 16
    iget-object v2, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$f;->i:Landroid/view/View;

    .line 17
    .line 18
    invoke-static {p1, v0, v1, v2}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->K0(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;ILcom/android/launcher3/model/data/I;Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$f;->k:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->J0(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;)Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$f;->j:Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
