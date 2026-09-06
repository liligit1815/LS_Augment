.class LV3/a$d;
.super Landroid/animation/AnimatorListenerAdapter;
.source "DefineItemAnimator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LV3/a;->animateRemoveImpl(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

.field final synthetic h:Landroid/view/ViewPropertyAnimator;

.field final synthetic i:Landroid/view/View;

.field final synthetic j:LV3/a;


# direct methods
.method constructor <init>(LV3/a;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Landroid/view/ViewPropertyAnimator;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, LV3/a$d;->j:LV3/a;

    .line 2
    .line 3
    iput-object p2, p0, LV3/a$d;->g:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 4
    .line 5
    iput-object p3, p0, LV3/a$d;->h:Landroid/view/ViewPropertyAnimator;

    .line 6
    .line 7
    iput-object p4, p0, LV3/a$d;->i:Landroid/view/View;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, LV3/a$d;->h:Landroid/view/ViewPropertyAnimator;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, LV3/a$d;->i:Landroid/view/View;

    .line 8
    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, LV3/a$d;->j:LV3/a;

    .line 15
    .line 16
    iget-object v0, p0, LV3/a$d;->g:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/s;->dispatchRemoveFinished(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, LV3/a$d;->j:LV3/a;

    .line 22
    .line 23
    iget-object p1, p1, LV3/a;->j:Ljava/util/ArrayList;

    .line 24
    .line 25
    iget-object v0, p0, LV3/a$d;->g:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, LV3/a$d;->j:LV3/a;

    .line 31
    .line 32
    invoke-virtual {p0}, LV3/a;->dispatchFinishedWhenDone()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, LV3/a$d;->j:LV3/a;

    .line 2
    .line 3
    iget-object p0, p0, LV3/a$d;->g:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/s;->dispatchRemoveStarting(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
