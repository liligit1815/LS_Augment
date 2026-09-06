.class Lcom/android/launcher3/allapps/FloatingHeaderView$a;
.super Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;
.source "FloatingHeaderView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/allapps/FloatingHeaderView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/allapps/FloatingHeaderView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/allapps/FloatingHeaderView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView$a;->g:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/android/launcher3/allapps/FloatingHeaderView$a;->g:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/android/launcher3/allapps/FloatingHeaderView;->b(Lcom/android/launcher3/allapps/FloatingHeaderView;)Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    if-eq p1, p2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView$a;->g:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->a(Lcom/android/launcher3/allapps/FloatingHeaderView;)Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isStarted()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView$a;->g:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 23
    .line 24
    invoke-static {p1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->a(Lcom/android/launcher3/allapps/FloatingHeaderView;)Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView$a;->g:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->b(Lcom/android/launcher3/allapps/FloatingHeaderView;)Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    neg-int p1, p1

    .line 42
    iget-object p2, p0, Lcom/android/launcher3/allapps/FloatingHeaderView$a;->g:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 43
    .line 44
    invoke-static {p2}, Lcom/android/launcher3/allapps/FloatingHeaderView;->c(Lcom/android/launcher3/allapps/FloatingHeaderView;)Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    iget-object p3, p0, Lcom/android/launcher3/allapps/FloatingHeaderView$a;->g:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 49
    .line 50
    invoke-static {p3, p1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->d(Lcom/android/launcher3/allapps/FloatingHeaderView;I)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView$a;->g:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->e()V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView$a;->g:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 59
    .line 60
    invoke-static {p1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->c(Lcom/android/launcher3/allapps/FloatingHeaderView;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eq p2, p1, :cond_2

    .line 65
    .line 66
    iget-object p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView$a;->g:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    check-cast p0, Lcom/android/launcher3/allapps/r;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->U()V

    .line 75
    .line 76
    .line 77
    :cond_2
    :goto_0
    return-void
.end method
