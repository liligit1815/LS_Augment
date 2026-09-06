.class public Lcom/android/launcher3/menu/MenuItemView;
.super Landroid/view/View;
.source "MenuItemView.java"

# interfaces
.implements Lcom/android/launcher3/menu/MenuScroller$b;


# instance fields
.field private g:Landroid/content/Context;

.field private h:Z

.field private i:I

.field private j:Ljava/lang/String;

.field private k:Ljava/lang/String;

.field private l:I

.field private m:I

.field private n:Landroid/graphics/drawable/Drawable;

.field private o:Z

.field private p:I

.field private q:Z

.field private r:Landroid/graphics/Rect;

.field private s:Landroid/text/TextPaint;

.field private t:Ljava/lang/String;

.field private u:Landroid/graphics/drawable/Drawable;

.field private v:Landroid/graphics/ColorFilter;

.field private w:Landroid/animation/ObjectAnimator;

.field private x:Landroid/animation/TimeInterpolator;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/menu/MenuItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Lcom/android/launcher3/menu/MenuItemView;->q:Z

    .line 4
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/android/launcher3/menu/MenuItemView;->r:Landroid/graphics/Rect;

    .line 5
    new-instance v1, Landroid/text/TextPaint;

    invoke-direct {v1}, Landroid/text/TextPaint;-><init>()V

    iput-object v1, p0, Lcom/android/launcher3/menu/MenuItemView;->s:Landroid/text/TextPaint;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3e800000    # 0.25f

    const v4, 0x3f0ccccd    # 0.55f

    .line 6
    invoke-static {v3, v4, v1, v2}, LL/a;->a(FFFF)Landroid/view/animation/Interpolator;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher3/menu/MenuItemView;->x:Landroid/animation/TimeInterpolator;

    .line 7
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->g:Landroid/content/Context;

    .line 8
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070bd2

    .line 9
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    const v3, 0x7f070bd1

    .line 10
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/android/launcher3/menu/MenuItemView;->m:I

    const v3, 0x7f070bd0

    .line 11
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 12
    iput-boolean v0, p0, Lcom/android/launcher3/menu/MenuItemView;->h:Z

    .line 13
    sget-object v4, Lcom/android/launcher3/x5;->K1:[I

    invoke-virtual {p1, p2, v4, p3, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 14
    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/menu/MenuItemView;->i:I

    const/4 p2, 0x5

    .line 15
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/menu/MenuItemView;->j:Ljava/lang/String;

    const/16 p2, 0x8

    .line 16
    iget p3, p0, Lcom/android/launcher3/menu/MenuItemView;->m:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/menu/MenuItemView;->l:I

    const/4 p2, 0x3

    .line 17
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/menu/MenuItemView;->n:Landroid/graphics/drawable/Drawable;

    const/4 p2, 0x1

    .line 18
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    iput-boolean p3, p0, Lcom/android/launcher3/menu/MenuItemView;->o:Z

    const/4 p3, 0x2

    .line 19
    invoke-virtual {p1, p3, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/android/launcher3/menu/MenuItemView;->p:I

    .line 20
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 21
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->s:Landroid/text/TextPaint;

    const/4 p3, -0x1

    invoke-virtual {p1, p3}, Landroid/text/TextPaint;->setColor(I)V

    .line 22
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->s:Landroid/text/TextPaint;

    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    .line 23
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->s:Landroid/text/TextPaint;

    iget p2, p0, Lcom/android/launcher3/menu/MenuItemView;->l:I

    int-to-float p2, p2

    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 24
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->s:Landroid/text/TextPaint;

    sget-object p2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 25
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->g:Landroid/content/Context;

    invoke-static {p1}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    move-result p1

    const p2, 0x7f1501a5

    if-ne p1, p2, :cond_0

    iget-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->g:Landroid/content/Context;

    const p2, 0x7f080e0e

    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_0

    .line 26
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->g:Landroid/content/Context;

    const p2, 0x7f080e0f

    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->u:Landroid/graphics/drawable/Drawable;

    .line 27
    new-instance p1, Landroid/graphics/PorterDuffColorFilter;

    const p2, 0x7f06018c

    invoke-virtual {v1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    sget-object p3, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2, p3}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->v:Landroid/graphics/ColorFilter;

    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/menu/MenuItemView;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuItemView;->u:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/menu/MenuItemView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/menu/MenuItemView;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method private c(Z)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->w:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/MenuItemView;->d(Landroid/animation/ObjectAnimator;)Landroid/animation/ObjectAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->w:Landroid/animation/ObjectAnimator;

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->u:Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    new-array v0, v0, [F

    .line 13
    .line 14
    fill-array-data v0, :array_0

    .line 15
    .line 16
    .line 17
    const-string v1, "alpha"

    .line 18
    .line 19
    invoke-static {p1, v1, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->w:Landroid/animation/ObjectAnimator;

    .line 24
    .line 25
    const-wide/16 v0, 0x3e8

    .line 26
    .line 27
    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->w:Landroid/animation/ObjectAnimator;

    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuItemView;->x:Landroid/animation/TimeInterpolator;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->w:Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    new-instance v0, Lcom/android/launcher3/menu/MenuItemView$a;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Lcom/android/launcher3/menu/MenuItemView$a;-><init>(Lcom/android/launcher3/menu/MenuItemView;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->w:Landroid/animation/ObjectAnimator;

    .line 48
    .line 49
    new-instance v0, Lcom/android/launcher3/menu/MenuItemView$b;

    .line 50
    .line 51
    invoke-direct {v0, p0}, Lcom/android/launcher3/menu/MenuItemView$b;-><init>(Lcom/android/launcher3/menu/MenuItemView;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuItemView;->w:Landroid/animation/ObjectAnimator;

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :array_0
    .array-data 4
        0x0
        0x437f0000    # 255.0f
    .end array-data
.end method

.method private d(Landroid/animation/ObjectAnimator;)Landroid/animation/ObjectAnimator;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->removeAllListeners()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 7
    .line 8
    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return-object p0
.end method


# virtual methods
.method e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuItemView;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const v1, 0x7f1501a5

    .line 8
    .line 9
    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuItemView;->g:Landroid/content/Context;

    .line 13
    .line 14
    const v1, 0x7f080e0e

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuItemView;->g:Landroid/content/Context;

    .line 23
    .line 24
    const v1, 0x7f080e0f

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :goto_0
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuItemView;->u:Landroid/graphics/drawable/Drawable;

    .line 32
    .line 33
    return-void
.end method

.method public getIsSelected()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/menu/MenuItemView;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public getItemId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuItemView;->t:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuItemView;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 12

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuItemView;->r:Landroid/graphics/Rect;

    .line 13
    .line 14
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->getClipBounds(Landroid/graphics/Rect;)Z

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuItemView;->j:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz v2, :cond_5

    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const-string v3, ""

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_5

    .line 32
    .line 33
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuItemView;->g:Landroid/content/Context;

    .line 34
    .line 35
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget-object v2, v2, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iput-object v2, p0, Lcom/android/launcher3/menu/MenuItemView;->k:Ljava/lang/String;

    .line 50
    .line 51
    div-int/lit8 v3, v0, 0x2

    .line 52
    .line 53
    const-string v4, "zh"

    .line 54
    .line 55
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-nez v2, :cond_0

    .line 60
    .line 61
    iget v2, p0, Lcom/android/launcher3/menu/MenuItemView;->i:I

    .line 62
    .line 63
    sub-int v3, v0, v2

    .line 64
    .line 65
    :cond_0
    move v7, v3

    .line 66
    new-instance v4, Landroid/text/StaticLayout;

    .line 67
    .line 68
    iget-object v5, p0, Lcom/android/launcher3/menu/MenuItemView;->j:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v6, p0, Lcom/android/launcher3/menu/MenuItemView;->s:Landroid/text/TextPaint;

    .line 71
    .line 72
    sget-object v8, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    .line 73
    .line 74
    const/4 v10, 0x0

    .line 75
    const/4 v11, 0x0

    .line 76
    const/high16 v9, 0x3f800000    # 1.0f

    .line 77
    .line 78
    invoke-direct/range {v4 .. v11}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v4}, Landroid/text/StaticLayout;->getWidth()I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    invoke-virtual {v4}, Landroid/text/StaticLayout;->getHeight()I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    sub-int/2addr v0, v2

    .line 90
    div-int/lit8 v0, v0, 0x2

    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getColorFilter()Landroid/graphics/ColorFilter;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    if-nez v2, :cond_1

    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    iget-object v5, p0, Lcom/android/launcher3/menu/MenuItemView;->v:Landroid/graphics/ColorFilter;

    .line 107
    .line 108
    invoke-virtual {v2, v5}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 109
    .line 110
    .line 111
    :cond_1
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuItemView;->n:Landroid/graphics/drawable/Drawable;

    .line 112
    .line 113
    if-eqz v2, :cond_4

    .line 114
    .line 115
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    iget-object v5, p0, Lcom/android/launcher3/menu/MenuItemView;->n:Landroid/graphics/drawable/Drawable;

    .line 120
    .line 121
    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    iget-boolean v6, p0, Lcom/android/launcher3/menu/MenuItemView;->q:Z

    .line 126
    .line 127
    if-eqz v6, :cond_3

    .line 128
    .line 129
    iget-boolean v6, p0, Lcom/android/launcher3/menu/MenuItemView;->o:Z

    .line 130
    .line 131
    if-eqz v6, :cond_2

    .line 132
    .line 133
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 134
    .line 135
    .line 136
    move-result v6

    .line 137
    sub-int/2addr v6, v2

    .line 138
    add-int/2addr v2, v6

    .line 139
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 140
    .line 141
    .line 142
    iget-object v7, p0, Lcom/android/launcher3/menu/MenuItemView;->n:Landroid/graphics/drawable/Drawable;

    .line 143
    .line 144
    const/4 v8, 0x0

    .line 145
    invoke-virtual {v7, v6, v8, v2, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 146
    .line 147
    .line 148
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuItemView;->n:Landroid/graphics/drawable/Drawable;

    .line 149
    .line 150
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 154
    .line 155
    .line 156
    :cond_2
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 157
    .line 158
    .line 159
    sub-int/2addr v1, v3

    .line 160
    div-int/lit8 v1, v1, 0x2

    .line 161
    .line 162
    int-to-float p0, v0

    .line 163
    int-to-float v0, v1

    .line 164
    invoke-virtual {p1, p0, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v4, p1}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_3
    add-int/2addr v3, v5

    .line 175
    iget v1, p0, Lcom/android/launcher3/menu/MenuItemView;->p:I

    .line 176
    .line 177
    add-int/2addr v3, v1

    .line 178
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    sub-int/2addr v1, v2

    .line 183
    div-int/lit8 v1, v1, 0x2

    .line 184
    .line 185
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 186
    .line 187
    .line 188
    move-result v6

    .line 189
    sub-int/2addr v6, v3

    .line 190
    div-int/lit8 v6, v6, 0x2

    .line 191
    .line 192
    add-int/2addr v2, v1

    .line 193
    add-int/2addr v5, v6

    .line 194
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 195
    .line 196
    .line 197
    iget-object v3, p0, Lcom/android/launcher3/menu/MenuItemView;->n:Landroid/graphics/drawable/Drawable;

    .line 198
    .line 199
    invoke-virtual {v3, v1, v6, v2, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 200
    .line 201
    .line 202
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuItemView;->n:Landroid/graphics/drawable/Drawable;

    .line 203
    .line 204
    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 211
    .line 212
    .line 213
    iget p0, p0, Lcom/android/launcher3/menu/MenuItemView;->p:I

    .line 214
    .line 215
    add-int/2addr v5, p0

    .line 216
    int-to-float p0, v0

    .line 217
    int-to-float v0, v5

    .line 218
    invoke-virtual {p1, p0, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v4, p1}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :cond_4
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 229
    .line 230
    .line 231
    sub-int/2addr v1, v3

    .line 232
    div-int/lit8 v1, v1, 0x2

    .line 233
    .line 234
    int-to-float p0, v0

    .line 235
    int-to-float v0, v1

    .line 236
    invoke-virtual {p1, p0, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v4, p1}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 243
    .line 244
    .line 245
    :cond_5
    return-void
.end method

.method protected onMeasure(II)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const p2, 0x7f070bd4

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    const v0, 0x7f070bc8

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public setForeground(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setFrontImage(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuItemView;->n:Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->n:Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuItemView;->n:Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->n:Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->n:Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 30
    .line 31
    .line 32
    :cond_2
    return-void
.end method

.method public setFrontImageIsCornerFlag(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/menu/MenuItemView;->q:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/menu/MenuItemView;->q:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setIsSelected(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/menu/MenuItemView;->h:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/menu/MenuItemView;->h:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/MenuItemView;->c(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 13
    .line 14
    .line 15
    if-nez p1, :cond_2

    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->w:Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 22
    .line 23
    .line 24
    :cond_1
    const/4 p1, 0x0

    .line 25
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/MenuItemView;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    return-void
.end method

.method public setItemId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->t:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setShowCornerFlag(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/menu/MenuItemView;->o:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/menu/MenuItemView;->o:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuItemView;->j:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/android/launcher3/menu/MenuItemView;->j:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    if-nez p1, :cond_1

    .line 10
    .line 11
    move-object p1, v1

    .line 12
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuItemView;->j:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuItemView;->j:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 23
    .line 24
    .line 25
    :cond_2
    return-void
.end method
