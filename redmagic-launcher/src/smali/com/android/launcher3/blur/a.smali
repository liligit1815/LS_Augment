.class public Lcom/android/launcher3/blur/a;
.super Landroid/widget/ImageView;
.source "BgBlurImageView.java"

# interfaces
.implements Lcom/android/launcher3/blur/c;


# instance fields
.field private g:I

.field protected h:Landroid/view/View;

.field private i:Landroid/graphics/Rect;

.field private j:Z

.field private k:Landroid/graphics/drawable/Drawable;

.field private l:LU1/a;

.field protected m:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/blur/a;->i:Landroid/graphics/Rect;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/android/launcher3/blur/a;->m:Z

    .line 9
    .line 10
    iput-object p2, p0, Lcom/android/launcher3/blur/a;->h:Landroid/view/View;

    .line 11
    .line 12
    instance-of v0, p2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    instance-of v0, p0, Lcom/android/launcher3/blur/b;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    instance-of p2, p2, Lcom/android/launcher3/CellLayout;

    .line 21
    .line 22
    if-eqz p2, :cond_1

    .line 23
    .line 24
    :cond_0
    const p2, 0x7f0819ac

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const p2, -0x7f0e0e0f

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/android/launcher3/blur/a;->setBlurBgTopColorDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 41
    .line 42
    const/4 p2, -0x1

    .line 43
    invoke-direct {p1, p2, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/blur/a;->j:Z

    .line 3
    .line 4
    return-void
.end method

.method public getBgBlurDrawable()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/blur/a;->k:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBgBlurImageView()Lcom/android/launcher3/blur/a;
    .locals 0

    .line 1
    return-object p0
.end method

.method public getOriginView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/blur/a;->h:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method protected onAttachedToWindow()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroid/widget/ImageView;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/blur/a;->k:Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/blur/a;->h:Landroid/view/View;

    .line 14
    .line 15
    instance-of v2, v0, Lcom/android/launcher3/blur/c;

    .line 16
    .line 17
    if-nez v2, :cond_1

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget-boolean v2, p0, Lcom/android/launcher3/blur/a;->m:Z

    .line 22
    .line 23
    if-eqz v2, :cond_2

    .line 24
    .line 25
    :cond_1
    invoke-static {v0}, Lcom/android/launcher3/blur/f;->c(Landroid/view/View;)Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/android/launcher3/blur/a;->k:Landroid/graphics/drawable/Drawable;

    .line 30
    .line 31
    new-instance v0, LU1/a;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/android/launcher3/blur/a;->k:Landroid/graphics/drawable/Drawable;

    .line 34
    .line 35
    invoke-direct {v0, v2}, LU1/a;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/android/launcher3/blur/a;->l:LU1/a;

    .line 39
    .line 40
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/blur/a;->i:Landroid/graphics/Rect;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    iget-object v2, p0, Lcom/android/launcher3/blur/a;->l:LU1/a;

    .line 45
    .line 46
    if-eqz v2, :cond_3

    .line 47
    .line 48
    iget v3, v0, Landroid/graphics/Rect;->left:I

    .line 49
    .line 50
    iget v4, v0, Landroid/graphics/Rect;->top:I

    .line 51
    .line 52
    iget v5, v0, Landroid/graphics/Rect;->right:I

    .line 53
    .line 54
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 55
    .line 56
    invoke-virtual {v2, v3, v4, v5, v0}, LU1/a;->e(IIII)LU1/a;

    .line 57
    .line 58
    .line 59
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/blur/a;->l:LU1/a;

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Lcom/android/launcher3/blur/a;->setBottomBgBlurDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 62
    .line 63
    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    invoke-static {p0}, Lcom/android/launcher3/blur/f;->m(Landroid/view/View;)V

    .line 67
    .line 68
    .line 69
    :cond_4
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/blur/a;->setBottomBgBlurDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setBlurBgOffsetRect(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/blur/a;->i:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-void
.end method

.method public setBlurBgTopColorDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/blur/a;->g:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setBlurBgTopColorTintColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/blur/a;->g:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method protected setBottomBgBlurDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setDragViewContentImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setOriginViewInDragView(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/blur/a;->j:Z

    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/blur/a;->h:Landroid/view/View;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/blur/a;->setBlurBgTopColorDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const v0, 0x7f070144

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const/high16 v0, 0x40000000    # 2.0f

    .line 26
    .line 27
    div-float/2addr p1, v0

    .line 28
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    new-instance v0, Landroid/graphics/Rect;

    .line 33
    .line 34
    invoke-direct {v0, p1, p1, p1, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/android/launcher3/blur/a;->setBlurBgOffsetRect(Landroid/graphics/Rect;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
