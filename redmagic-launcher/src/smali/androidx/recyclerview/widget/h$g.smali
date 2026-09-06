.class Landroidx/recyclerview/widget/h$g;
.super Ljava/lang/Object;
.source "ItemTouchHelper.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "g"
.end annotation


# instance fields
.field final g:F

.field final h:F

.field final i:F

.field final j:F

.field final k:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

.field final l:I

.field final m:Landroid/animation/ValueAnimator;

.field final n:I

.field o:Z

.field p:F

.field q:F

.field r:Z

.field s:Z

.field private t:F


# direct methods
.method constructor <init>(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;IIFFFF)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Landroidx/recyclerview/widget/h$g;->r:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Landroidx/recyclerview/widget/h$g;->s:Z

    .line 8
    .line 9
    iput p3, p0, Landroidx/recyclerview/widget/h$g;->l:I

    .line 10
    .line 11
    iput p2, p0, Landroidx/recyclerview/widget/h$g;->n:I

    .line 12
    .line 13
    iput-object p1, p0, Landroidx/recyclerview/widget/h$g;->k:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 14
    .line 15
    iput p4, p0, Landroidx/recyclerview/widget/h$g;->g:F

    .line 16
    .line 17
    iput p5, p0, Landroidx/recyclerview/widget/h$g;->h:F

    .line 18
    .line 19
    iput p6, p0, Landroidx/recyclerview/widget/h$g;->i:F

    .line 20
    .line 21
    iput p7, p0, Landroidx/recyclerview/widget/h$g;->j:F

    .line 22
    .line 23
    const/4 p2, 0x0

    .line 24
    const/4 p3, 0x2

    .line 25
    new-array p3, p3, [F

    .line 26
    .line 27
    fill-array-data p3, :array_0

    .line 28
    .line 29
    .line 30
    invoke-static {p3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    iput-object p3, p0, Landroidx/recyclerview/widget/h$g;->m:Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    new-instance p4, Landroidx/recyclerview/widget/h$g$a;

    .line 37
    .line 38
    invoke-direct {p4, p0}, Landroidx/recyclerview/widget/h$g$a;-><init>(Landroidx/recyclerview/widget/h$g;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p3, p4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 45
    .line 46
    invoke-virtual {p3, p1}, Landroid/animation/ValueAnimator;->setTarget(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p3, p0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/h$g;->c(F)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    nop

    .line 57
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/h$g;->m:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/h$g;->m:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(F)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/recyclerview/widget/h$g;->t:F

    .line 2
    .line 3
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/h$g;->k:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->setIsRecyclable(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Landroidx/recyclerview/widget/h$g;->m:Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public e()V
    .locals 3

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/h$g;->g:F

    .line 2
    .line 3
    iget v1, p0, Landroidx/recyclerview/widget/h$g;->i:F

    .line 4
    .line 5
    cmpl-float v2, v0, v1

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Landroidx/recyclerview/widget/h$g;->k:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 10
    .line 11
    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Landroidx/recyclerview/widget/h$g;->p:F

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget v2, p0, Landroidx/recyclerview/widget/h$g;->t:F

    .line 21
    .line 22
    sub-float/2addr v1, v0

    .line 23
    mul-float/2addr v2, v1

    .line 24
    add-float/2addr v0, v2

    .line 25
    iput v0, p0, Landroidx/recyclerview/widget/h$g;->p:F

    .line 26
    .line 27
    :goto_0
    iget v0, p0, Landroidx/recyclerview/widget/h$g;->h:F

    .line 28
    .line 29
    iget v1, p0, Landroidx/recyclerview/widget/h$g;->j:F

    .line 30
    .line 31
    cmpl-float v2, v0, v1

    .line 32
    .line 33
    if-nez v2, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Landroidx/recyclerview/widget/h$g;->k:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 36
    .line 37
    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iput v0, p0, Landroidx/recyclerview/widget/h$g;->q:F

    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    iget v2, p0, Landroidx/recyclerview/widget/h$g;->t:F

    .line 47
    .line 48
    sub-float/2addr v1, v0

    .line 49
    mul-float/2addr v2, v1

    .line 50
    add-float/2addr v0, v2

    .line 51
    iput v0, p0, Landroidx/recyclerview/widget/h$g;->q:F

    .line 52
    .line 53
    return-void
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/high16 p1, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/h$g;->c(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Landroidx/recyclerview/widget/h$g;->s:Z

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Landroidx/recyclerview/widget/h$g;->k:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->setIsRecyclable(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iput-boolean v0, p0, Landroidx/recyclerview/widget/h$g;->s:Z

    .line 12
    .line 13
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method
