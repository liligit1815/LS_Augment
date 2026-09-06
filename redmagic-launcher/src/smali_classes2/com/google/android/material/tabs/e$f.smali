.class Lcom/google/android/material/tabs/e$f;
.super Landroid/widget/LinearLayout;
.source "TabLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/tabs/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "f"
.end annotation


# instance fields
.field g:Landroid/animation/ValueAnimator;

.field private h:I

.field final synthetic i:Lcom/google/android/material/tabs/e;


# direct methods
.method constructor <init>(Lcom/google/android/material/tabs/e;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, -0x1

    .line 7
    iput p1, p0, Lcom/google/android/material/tabs/e$f;->h:I

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setWillNotDraw(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method static synthetic a(Lcom/google/android/material/tabs/e$f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/tabs/e$f;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic b(Lcom/google/android/material/tabs/e$f;Landroid/view/View;Landroid/view/View;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/material/tabs/e$f;->j(Landroid/view/View;Landroid/view/View;F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 2
    .line 3
    iget v1, v0, Lcom/google/android/material/tabs/e;->g:I

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    if-ne v1, v2, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/android/material/tabs/e;->getSelectedTabPosition()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iput v1, v0, Lcom/google/android/material/tabs/e;->g:I

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 15
    .line 16
    iget v0, v0, Lcom/google/android/material/tabs/e;->g:I

    .line 17
    .line 18
    invoke-direct {p0, v0}, Lcom/google/android/material/tabs/e$f;->f(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private f(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/material/tabs/e;->d(Lcom/google/android/material/tabs/e;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/google/android/material/tabs/e;->getTabSelectedIndicator()Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget v0, v0, Landroid/graphics/Rect;->left:I

    .line 20
    .line 21
    const/4 v1, -0x1

    .line 22
    if-ne v0, v1, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/google/android/material/tabs/e;->getTabSelectedIndicator()Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 35
    .line 36
    if-eq v0, v1, :cond_1

    .line 37
    .line 38
    :cond_0
    return-void

    .line 39
    :cond_1
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v1, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 44
    .line 45
    invoke-static {v1}, Lcom/google/android/material/tabs/e;->e(Lcom/google/android/material/tabs/e;)Lcom/google/android/material/tabs/c;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iget-object v2, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 50
    .line 51
    iget-object v3, v2, Lcom/google/android/material/tabs/e;->u:Landroid/graphics/drawable/Drawable;

    .line 52
    .line 53
    invoke-virtual {v1, v2, v0, v3}, Lcom/google/android/material/tabs/c;->c(Lcom/google/android/material/tabs/e;Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 57
    .line 58
    iput p1, p0, Lcom/google/android/material/tabs/e;->g:I

    .line 59
    .line 60
    return-void
.end method

.method private g()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/material/tabs/e;->getSelectedTabPosition()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-direct {p0, v0}, Lcom/google/android/material/tabs/e$f;->f(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private j(Landroid/view/View;Landroid/view/View;F)V
    .locals 7

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/android/material/tabs/e;->e(Lcom/google/android/material/tabs/e;)Lcom/google/android/material/tabs/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v2, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 16
    .line 17
    iget-object v6, v2, Lcom/google/android/material/tabs/e;->u:Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    move-object v3, p1

    .line 20
    move-object v4, p2

    .line 21
    move v5, p3

    .line 22
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/material/tabs/c;->d(Lcom/google/android/material/tabs/e;Landroid/view/View;Landroid/view/View;FLandroid/graphics/drawable/Drawable;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object p1, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/google/android/material/tabs/e;->u:Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    iget p2, p2, Landroid/graphics/Rect;->top:I

    .line 35
    .line 36
    iget-object p3, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 37
    .line 38
    iget-object p3, p3, Lcom/google/android/material/tabs/e;->u:Landroid/graphics/drawable/Drawable;

    .line 39
    .line 40
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    iget p3, p3, Landroid/graphics/Rect;->bottom:I

    .line 45
    .line 46
    const/4 v0, -0x1

    .line 47
    invoke-virtual {p1, v0, p2, v0, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 48
    .line 49
    .line 50
    :goto_0
    invoke-static {p0}, LJ/I;->Z(Landroid/view/View;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private k(ZII)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 2
    .line 3
    iget v1, v0, Lcom/google/android/material/tabs/e;->g:I

    .line 4
    .line 5
    if-ne v1, p2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {v0}, Lcom/google/android/material/tabs/e;->getSelectedTabPosition()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    invoke-direct {p0}, Lcom/google/android/material/tabs/e$f;->g()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    iget-object v2, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 27
    .line 28
    iput p2, v2, Lcom/google/android/material/tabs/e;->g:I

    .line 29
    .line 30
    new-instance p2, Lcom/google/android/material/tabs/e$f$a;

    .line 31
    .line 32
    invoke-direct {p2, p0, v0, v1}, Lcom/google/android/material/tabs/e$f$a;-><init>(Lcom/google/android/material/tabs/e$f;Landroid/view/View;Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    new-instance p1, Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    invoke-direct {p1}, Landroid/animation/ValueAnimator;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Lcom/google/android/material/tabs/e$f;->g:Landroid/animation/ValueAnimator;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 45
    .line 46
    invoke-static {p0}, Lcom/google/android/material/tabs/e;->f(Lcom/google/android/material/tabs/e;)Landroid/animation/TimeInterpolator;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 51
    .line 52
    .line 53
    int-to-long v0, p3

    .line 54
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 55
    .line 56
    .line 57
    const/4 p0, 0x2

    .line 58
    new-array p0, p0, [F

    .line 59
    .line 60
    fill-array-data p0, :array_0

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_2
    iget-object p1, p0, Lcom/google/android/material/tabs/e$f;->g:Landroid/animation/ValueAnimator;

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/google/android/material/tabs/e$f;->g:Landroid/animation/ValueAnimator;

    .line 79
    .line 80
    invoke-virtual {p0, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    nop

    .line 85
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method c(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->g:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 12
    .line 13
    iget v0, v0, Lcom/google/android/material/tabs/e;->g:I

    .line 14
    .line 15
    if-eq v0, p1, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->g:Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 20
    .line 21
    .line 22
    :cond_0
    const/4 v0, 0x1

    .line 23
    invoke-direct {p0, v0, p1, p2}, Lcom/google/android/material/tabs/e$f;->k(ZII)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method d()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v2, v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-gtz v3, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    return v1
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/google/android/material/tabs/e;->u:Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-gez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/google/android/material/tabs/e;->u:Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    :cond_0
    iget-object v1, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 24
    .line 25
    iget v1, v1, Lcom/google/android/material/tabs/e;->I:I

    .line 26
    .line 27
    if-eqz v1, :cond_3

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    const/4 v3, 0x2

    .line 31
    if-eq v1, v2, :cond_2

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    if-eq v1, v3, :cond_4

    .line 35
    .line 36
    const/4 v0, 0x3

    .line 37
    if-eq v1, v0, :cond_1

    .line 38
    .line 39
    move v0, v2

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    goto :goto_0

    .line 46
    :cond_2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    sub-int/2addr v1, v0

    .line 51
    div-int/lit8 v2, v1, 0x2

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    add-int/2addr v1, v0

    .line 58
    div-int/lit8 v0, v1, 0x2

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    sub-int v2, v1, v0

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    :cond_4
    :goto_0
    iget-object v1, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 72
    .line 73
    iget-object v1, v1, Lcom/google/android/material/tabs/e;->u:Landroid/graphics/drawable/Drawable;

    .line 74
    .line 75
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-lez v1, :cond_5

    .line 84
    .line 85
    iget-object v1, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/google/android/material/tabs/e;->u:Landroid/graphics/drawable/Drawable;

    .line 88
    .line 89
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    iget-object v3, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 94
    .line 95
    iget-object v3, v3, Lcom/google/android/material/tabs/e;->u:Landroid/graphics/drawable/Drawable;

    .line 96
    .line 97
    iget v4, v1, Landroid/graphics/Rect;->left:I

    .line 98
    .line 99
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 100
    .line 101
    invoke-virtual {v3, v4, v2, v1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 105
    .line 106
    iget-object v0, v0, Lcom/google/android/material/tabs/e;->u:Landroid/graphics/drawable/Drawable;

    .line 107
    .line 108
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 109
    .line 110
    .line 111
    :cond_5
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->draw(Landroid/graphics/Canvas;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method h(IF)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 2
    .line 3
    int-to-float v1, p1

    .line 4
    add-float/2addr v1, p2

    .line 5
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iput v1, v0, Lcom/google/android/material/tabs/e;->g:I

    .line 10
    .line 11
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->g:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->g:Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    add-int/lit8 p1, p1, 0x1

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-direct {p0, v0, p1, p2}, Lcom/google/android/material/tabs/e$f;->j(Landroid/view/View;Landroid/view/View;F)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method i(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/google/android/material/tabs/e;->u:Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/google/android/material/tabs/e;->u:Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    iget v2, v0, Landroid/graphics/Rect;->left:I

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 17
    .line 18
    invoke-virtual {v1, v2, v3, v0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/google/android/material/tabs/e$f;->g:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/google/android/material/tabs/e;->getSelectedTabPosition()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/4 p2, -0x1

    .line 21
    const/4 p3, 0x0

    .line 22
    invoke-direct {p0, p3, p1, p2}, Lcom/google/android/material/tabs/e$f;->k(ZII)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-direct {p0}, Lcom/google/android/material/tabs/e$f;->e()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method protected onMeasure(II)V
    .locals 8

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/high16 v1, 0x40000000    # 2.0f

    .line 9
    .line 10
    if-eq v0, v1, :cond_0

    .line 11
    .line 12
    goto/16 :goto_3

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 15
    .line 16
    iget v1, v0, Lcom/google/android/material/tabs/e;->G:I

    .line 17
    .line 18
    const/4 v2, 0x2

    .line 19
    const/4 v3, 0x1

    .line 20
    if-eq v1, v3, :cond_1

    .line 21
    .line 22
    iget v0, v0, Lcom/google/android/material/tabs/e;->J:I

    .line 23
    .line 24
    if-ne v0, v2, :cond_9

    .line 25
    .line 26
    :cond_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, 0x0

    .line 31
    move v4, v1

    .line 32
    move v5, v4

    .line 33
    :goto_0
    if-ge v4, v0, :cond_3

    .line 34
    .line 35
    invoke-virtual {p0, v4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    .line 40
    .line 41
    .line 42
    move-result v7

    .line 43
    if-nez v7, :cond_2

    .line 44
    .line 45
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    if-gtz v5, :cond_4

    .line 57
    .line 58
    goto :goto_3

    .line 59
    :cond_4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    const/16 v6, 0x10

    .line 64
    .line 65
    invoke-static {v4, v6}, Lcom/google/android/material/internal/s;->c(Landroid/content/Context;I)F

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    float-to-int v4, v4

    .line 70
    mul-int v6, v5, v0

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 73
    .line 74
    .line 75
    move-result v7

    .line 76
    mul-int/2addr v4, v2

    .line 77
    sub-int/2addr v7, v4

    .line 78
    if-gt v6, v7, :cond_8

    .line 79
    .line 80
    move v2, v1

    .line 81
    :goto_1
    if-ge v1, v0, :cond_7

    .line 82
    .line 83
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    check-cast v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 92
    .line 93
    iget v6, v4, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 94
    .line 95
    const/4 v7, 0x0

    .line 96
    if-ne v6, v5, :cond_5

    .line 97
    .line 98
    iget v6, v4, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 99
    .line 100
    cmpl-float v6, v6, v7

    .line 101
    .line 102
    if-eqz v6, :cond_6

    .line 103
    .line 104
    :cond_5
    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 105
    .line 106
    iput v7, v4, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 107
    .line 108
    move v2, v3

    .line 109
    :cond_6
    add-int/lit8 v1, v1, 0x1

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_7
    move v3, v2

    .line 113
    goto :goto_2

    .line 114
    :cond_8
    iget-object v0, p0, Lcom/google/android/material/tabs/e$f;->i:Lcom/google/android/material/tabs/e;

    .line 115
    .line 116
    iput v1, v0, Lcom/google/android/material/tabs/e;->G:I

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/e;->U(Z)V

    .line 119
    .line 120
    .line 121
    :goto_2
    if-eqz v3, :cond_9

    .line 122
    .line 123
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 124
    .line 125
    .line 126
    :cond_9
    :goto_3
    return-void
.end method

.method public onRtlPropertiesChanged(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onRtlPropertiesChanged(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
