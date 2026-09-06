.class Landroidx/appcompat/widget/z;
.super Landroidx/appcompat/widget/u;
.source "AppCompatSeekBarHelper.java"


# instance fields
.field private final d:Landroid/widget/SeekBar;

.field private e:Landroid/graphics/drawable/Drawable;

.field private f:Landroid/content/res/ColorStateList;

.field private g:Landroid/graphics/PorterDuff$Mode;

.field private h:Z

.field private i:Z


# direct methods
.method constructor <init>(Landroid/widget/SeekBar;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/u;-><init>(Landroid/widget/ProgressBar;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Landroidx/appcompat/widget/z;->f:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    iput-object v0, p0, Landroidx/appcompat/widget/z;->g:Landroid/graphics/PorterDuff$Mode;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Landroidx/appcompat/widget/z;->h:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Landroidx/appcompat/widget/z;->i:Z

    .line 13
    .line 14
    iput-object p1, p0, Landroidx/appcompat/widget/z;->d:Landroid/widget/SeekBar;

    .line 15
    .line 16
    return-void
.end method

.method private f()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/z;->e:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-boolean v1, p0, Landroidx/appcompat/widget/z;->h:Z

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    iget-boolean v1, p0, Landroidx/appcompat/widget/z;->i:Z

    .line 10
    .line 11
    if-eqz v1, :cond_3

    .line 12
    .line 13
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, LC/a;->r(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Landroidx/appcompat/widget/z;->e:Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    iget-boolean v1, p0, Landroidx/appcompat/widget/z;->h:Z

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    iget-object v1, p0, Landroidx/appcompat/widget/z;->f:Landroid/content/res/ColorStateList;

    .line 28
    .line 29
    invoke-static {v0, v1}, LC/a;->o(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-boolean v0, p0, Landroidx/appcompat/widget/z;->i:Z

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-object v0, p0, Landroidx/appcompat/widget/z;->e:Landroid/graphics/drawable/Drawable;

    .line 37
    .line 38
    iget-object v1, p0, Landroidx/appcompat/widget/z;->g:Landroid/graphics/PorterDuff$Mode;

    .line 39
    .line 40
    invoke-static {v0, v1}, LC/a;->p(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object v0, p0, Landroidx/appcompat/widget/z;->e:Landroid/graphics/drawable/Drawable;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_3

    .line 50
    .line 51
    iget-object v0, p0, Landroidx/appcompat/widget/z;->e:Landroid/graphics/drawable/Drawable;

    .line 52
    .line 53
    iget-object p0, p0, Landroidx/appcompat/widget/z;->d:Landroid/widget/SeekBar;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getDrawableState()[I

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 60
    .line 61
    .line 62
    :cond_3
    return-void
.end method


# virtual methods
.method c(Landroid/util/AttributeSet;I)V
    .locals 8

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/appcompat/widget/u;->c(Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/appcompat/widget/z;->d:Landroid/widget/SeekBar;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/widget/SeekBar;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v3, Lf/j;->T:[I

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {v0, p1, v3, p2, v1}, Landroidx/appcompat/widget/a0;->v(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroidx/appcompat/widget/a0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Landroidx/appcompat/widget/z;->d:Landroid/widget/SeekBar;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/widget/SeekBar;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v0}, Landroidx/appcompat/widget/a0;->r()Landroid/content/res/TypedArray;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    const/4 v7, 0x0

    .line 28
    move-object v4, p1

    .line 29
    move v6, p2

    .line 30
    invoke-static/range {v1 .. v7}, LJ/I;->h0(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 31
    .line 32
    .line 33
    sget p1, Lf/j;->U:I

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/a0;->h(I)Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    iget-object p2, p0, Landroidx/appcompat/widget/z;->d:Landroid/widget/SeekBar;

    .line 42
    .line 43
    invoke-virtual {p2, p1}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    sget p1, Lf/j;->V:I

    .line 47
    .line 48
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/a0;->g(I)Landroid/graphics/drawable/Drawable;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/z;->j(Landroid/graphics/drawable/Drawable;)V

    .line 53
    .line 54
    .line 55
    sget p1, Lf/j;->X:I

    .line 56
    .line 57
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    const/4 v1, 0x1

    .line 62
    if-eqz p2, :cond_1

    .line 63
    .line 64
    const/4 p2, -0x1

    .line 65
    invoke-virtual {v0, p1, p2}, Landroidx/appcompat/widget/a0;->k(II)I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iget-object p2, p0, Landroidx/appcompat/widget/z;->g:Landroid/graphics/PorterDuff$Mode;

    .line 70
    .line 71
    invoke-static {p1, p2}, Landroidx/appcompat/widget/H;->d(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iput-object p1, p0, Landroidx/appcompat/widget/z;->g:Landroid/graphics/PorterDuff$Mode;

    .line 76
    .line 77
    iput-boolean v1, p0, Landroidx/appcompat/widget/z;->i:Z

    .line 78
    .line 79
    :cond_1
    sget p1, Lf/j;->W:I

    .line 80
    .line 81
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    if-eqz p2, :cond_2

    .line 86
    .line 87
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/a0;->c(I)Landroid/content/res/ColorStateList;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iput-object p1, p0, Landroidx/appcompat/widget/z;->f:Landroid/content/res/ColorStateList;

    .line 92
    .line 93
    iput-boolean v1, p0, Landroidx/appcompat/widget/z;->h:Z

    .line 94
    .line 95
    :cond_2
    invoke-virtual {v0}, Landroidx/appcompat/widget/a0;->w()V

    .line 96
    .line 97
    .line 98
    invoke-direct {p0}, Landroidx/appcompat/widget/z;->f()V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method g(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/z;->e:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Landroidx/appcompat/widget/z;->d:Landroid/widget/SeekBar;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/widget/SeekBar;->getMax()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-le v0, v1, :cond_3

    .line 13
    .line 14
    iget-object v2, p0, Landroidx/appcompat/widget/z;->e:Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    iget-object v3, p0, Landroidx/appcompat/widget/z;->e:Landroid/graphics/drawable/Drawable;

    .line 21
    .line 22
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-ltz v2, :cond_0

    .line 27
    .line 28
    div-int/lit8 v2, v2, 0x2

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move v2, v1

    .line 32
    :goto_0
    if-ltz v3, :cond_1

    .line 33
    .line 34
    div-int/lit8 v1, v3, 0x2

    .line 35
    .line 36
    :cond_1
    iget-object v3, p0, Landroidx/appcompat/widget/z;->e:Landroid/graphics/drawable/Drawable;

    .line 37
    .line 38
    neg-int v4, v2

    .line 39
    neg-int v5, v1

    .line 40
    invoke-virtual {v3, v4, v5, v2, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Landroidx/appcompat/widget/z;->d:Landroid/widget/SeekBar;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/widget/SeekBar;->getWidth()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iget-object v2, p0, Landroidx/appcompat/widget/z;->d:Landroid/widget/SeekBar;

    .line 50
    .line 51
    invoke-virtual {v2}, Landroid/widget/SeekBar;->getPaddingLeft()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    sub-int/2addr v1, v2

    .line 56
    iget-object v2, p0, Landroidx/appcompat/widget/z;->d:Landroid/widget/SeekBar;

    .line 57
    .line 58
    invoke-virtual {v2}, Landroid/widget/SeekBar;->getPaddingRight()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    sub-int/2addr v1, v2

    .line 63
    int-to-float v1, v1

    .line 64
    int-to-float v2, v0

    .line 65
    div-float/2addr v1, v2

    .line 66
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    iget-object v3, p0, Landroidx/appcompat/widget/z;->d:Landroid/widget/SeekBar;

    .line 71
    .line 72
    invoke-virtual {v3}, Landroid/widget/SeekBar;->getPaddingLeft()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    int-to-float v3, v3

    .line 77
    iget-object v4, p0, Landroidx/appcompat/widget/z;->d:Landroid/widget/SeekBar;

    .line 78
    .line 79
    invoke-virtual {v4}, Landroid/widget/SeekBar;->getHeight()I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    div-int/lit8 v4, v4, 0x2

    .line 84
    .line 85
    int-to-float v4, v4

    .line 86
    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 87
    .line 88
    .line 89
    const/4 v3, 0x0

    .line 90
    :goto_1
    if-gt v3, v0, :cond_2

    .line 91
    .line 92
    iget-object v4, p0, Landroidx/appcompat/widget/z;->e:Landroid/graphics/drawable/Drawable;

    .line 93
    .line 94
    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 95
    .line 96
    .line 97
    const/4 v4, 0x0

    .line 98
    invoke-virtual {p1, v1, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 99
    .line 100
    .line 101
    add-int/lit8 v3, v3, 0x1

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_2
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 105
    .line 106
    .line 107
    :cond_3
    return-void
.end method

.method h()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/z;->e:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Landroidx/appcompat/widget/z;->d:Landroid/widget/SeekBar;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/widget/SeekBar;->getDrawableState()[I

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Landroidx/appcompat/widget/z;->d:Landroid/widget/SeekBar;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/widget/SeekBar;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method i()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/z;->e:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method j(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/z;->e:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iput-object p1, p0, Landroidx/appcompat/widget/z;->e:Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    if-eqz p1, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Landroidx/appcompat/widget/z;->d:Landroid/widget/SeekBar;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Landroidx/appcompat/widget/z;->d:Landroid/widget/SeekBar;

    .line 19
    .line 20
    invoke-static {v0}, LJ/I;->v(Landroid/view/View;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-static {p1, v0}, LC/a;->m(Landroid/graphics/drawable/Drawable;I)Z

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Landroidx/appcompat/widget/z;->d:Landroid/widget/SeekBar;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/widget/SeekBar;->getDrawableState()[I

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 40
    .line 41
    .line 42
    :cond_1
    invoke-direct {p0}, Landroidx/appcompat/widget/z;->f()V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-object p0, p0, Landroidx/appcompat/widget/z;->d:Landroid/widget/SeekBar;

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/widget/SeekBar;->invalidate()V

    .line 48
    .line 49
    .line 50
    return-void
.end method
