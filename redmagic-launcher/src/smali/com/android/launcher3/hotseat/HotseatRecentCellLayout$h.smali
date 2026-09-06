.class Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$h;
.super Landroid/animation/AnimatorListenerAdapter;
.source "HotseatRecentCellLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->P0(ILcom/android/launcher3/model/data/I;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/animation/ValueAnimator;

.field final synthetic h:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$h;->h:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$h;->g:Landroid/animation/ValueAnimator;

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
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$h;->h:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->J0(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$h;->g:Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
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
