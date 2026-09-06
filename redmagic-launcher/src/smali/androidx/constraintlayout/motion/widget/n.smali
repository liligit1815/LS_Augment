.class public Landroidx/constraintlayout/motion/widget/n;
.super Landroidx/constraintlayout/widget/b;
.source "MotionHelper.java"

# interfaces
.implements Landroidx/constraintlayout/motion/widget/p$h;


# instance fields
.field private p:Z

.field private q:Z

.field private r:F

.field protected s:[Landroid/view/View;


# virtual methods
.method public A(Landroid/view/View;F)V
    .locals 0

    .line 1
    return-void
.end method

.method public a(Landroidx/constraintlayout/motion/widget/p;IIF)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Landroidx/constraintlayout/motion/widget/p;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Landroidx/constraintlayout/motion/widget/p;II)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroidx/constraintlayout/motion/widget/p;IZF)V
    .locals 0

    .line 1
    return-void
.end method

.method public getProgress()F
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/n;->r:F

    .line 2
    .line 3
    return p0
.end method

.method protected n(Landroid/util/AttributeSet;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroidx/constraintlayout/widget/b;->n(Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_3

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Landroidx/constraintlayout/widget/i;->g8:[I

    .line 11
    .line 12
    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x0

    .line 21
    :goto_0
    if-ge v1, v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    sget v3, Landroidx/constraintlayout/widget/i;->i8:I

    .line 28
    .line 29
    if-ne v2, v3, :cond_0

    .line 30
    .line 31
    iget-boolean v3, p0, Landroidx/constraintlayout/motion/widget/n;->p:Z

    .line 32
    .line 33
    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    iput-boolean v2, p0, Landroidx/constraintlayout/motion/widget/n;->p:Z

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_0
    sget v3, Landroidx/constraintlayout/widget/i;->h8:I

    .line 41
    .line 42
    if-ne v2, v3, :cond_1

    .line 43
    .line 44
    iget-boolean v3, p0, Landroidx/constraintlayout/motion/widget/n;->q:Z

    .line 45
    .line 46
    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    iput-boolean v2, p0, Landroidx/constraintlayout/motion/widget/n;->q:Z

    .line 51
    .line 52
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 56
    .line 57
    .line 58
    :cond_3
    return-void
.end method

.method public setProgress(F)V
    .locals 5

    .line 1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/n;->r:F

    .line 2
    .line 3
    iget v0, p0, Landroidx/constraintlayout/widget/b;->h:I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/widget/b;->m(Landroidx/constraintlayout/widget/ConstraintLayout;)[Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/n;->s:[Landroid/view/View;

    .line 19
    .line 20
    :goto_0
    iget v0, p0, Landroidx/constraintlayout/widget/b;->h:I

    .line 21
    .line 22
    if-ge v1, v0, :cond_2

    .line 23
    .line 24
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/n;->s:[Landroid/view/View;

    .line 25
    .line 26
    aget-object v0, v0, v1

    .line 27
    .line 28
    invoke-virtual {p0, v0, p1}, Landroidx/constraintlayout/motion/widget/n;->A(Landroid/view/View;F)V

    .line 29
    .line 30
    .line 31
    add-int/lit8 v1, v1, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Landroid/view/ViewGroup;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    :goto_1
    if-ge v1, v2, :cond_2

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    instance-of v4, v3, Landroidx/constraintlayout/motion/widget/n;

    .line 51
    .line 52
    if-eqz v4, :cond_1

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_1
    invoke-virtual {p0, v3, p1}, Landroidx/constraintlayout/motion/widget/n;->A(Landroid/view/View;F)V

    .line 56
    .line 57
    .line 58
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    return-void
.end method

.method public u()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public v()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/constraintlayout/motion/widget/n;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public w()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/constraintlayout/motion/widget/n;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public x(Landroidx/constraintlayout/motion/widget/p;)V
    .locals 0

    .line 1
    return-void
.end method

.method public y(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    return-void
.end method

.method public z(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    return-void
.end method
