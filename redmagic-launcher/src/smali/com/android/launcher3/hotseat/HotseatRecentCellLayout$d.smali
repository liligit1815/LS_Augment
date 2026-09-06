.class Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$d;
.super Landroid/animation/AnimatorListenerAdapter;
.source "HotseatRecentCellLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->b1(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Lcom/android/launcher3/Hotseat;

.field final synthetic i:Landroid/animation/ValueAnimator;

.field final synthetic j:Landroid/view/View;

.field final synthetic k:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;ZLcom/android/launcher3/Hotseat;Landroid/animation/ValueAnimator;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$d;->k:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$d;->g:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$d;->h:Lcom/android/launcher3/Hotseat;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$d;->i:Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$d;->j:Landroid/view/View;

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
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$d;->g:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$d;->h:Lcom/android/launcher3/Hotseat;

    .line 9
    .line 10
    const v0, 0x7f0b04bf

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$d;->h:Lcom/android/launcher3/Hotseat;

    .line 18
    .line 19
    const/high16 v0, 0x3f800000    # 1.0f

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/Hotseat;->u1(FZ)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$d;->k:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->J0(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;)Ljava/util/ArrayList;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object p0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$d;->i:Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$d;->j:Landroid/view/View;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-boolean p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$d;->g:Z

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$d;->h:Lcom/android/launcher3/Hotseat;

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const v0, 0x7f0b04bf

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method
