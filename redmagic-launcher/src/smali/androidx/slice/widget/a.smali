.class public Landroidx/slice/widget/a;
.super Landroid/widget/FrameLayout;
.source "ActionRow.java"


# instance fields
.field private final g:I

.field private final h:I

.field private final i:Landroid/widget/LinearLayout;

.field private j:I


# direct methods
.method private a(Landroidx/core/graphics/drawable/IconCompat;Z)Landroid/widget/ImageView;
    .locals 2

    .line 1
    new-instance v0, Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iget v1, p0, Landroidx/slice/widget/a;->h:I

    .line 11
    .line 12
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 13
    .line 14
    .line 15
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {p1, v1}, Landroidx/core/graphics/drawable/IconCompat;->j(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 29
    .line 30
    .line 31
    if-eqz p2, :cond_0

    .line 32
    .line 33
    iget p1, p0, Landroidx/slice/widget/a;->j:I

    .line 34
    .line 35
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {v0, p1}, Landroidx/core/widget/e;->c(Landroid/widget/ImageView;Landroid/content/res/ColorStateList;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const v1, 0x101030e

    .line 47
    .line 48
    .line 49
    invoke-static {p1, v1}, Landroidx/slice/widget/o;->d(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 54
    .line 55
    .line 56
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    invoke-direct {p0, v0}, Landroidx/slice/widget/a;->b(Landroid/view/View;)V

    .line 64
    .line 65
    .line 66
    return-object v0
.end method

.method private b(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/a;->i:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 4
    .line 5
    iget p0, p0, Landroidx/slice/widget/a;->g:I

    .line 6
    .line 7
    const/high16 v2, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-direct {v1, p0, p0, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private c(ILandroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p2, p0}, Landroidx/slice/widget/RemoteInputView;->c(Landroid/content/Context;Landroid/view/ViewGroup;)Landroidx/slice/widget/RemoteInputView;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const/4 v0, 0x4

    .line 6
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private d(Landroid/view/View;)Landroidx/slice/widget/RemoteInputView;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    sget-object p0, Landroidx/slice/widget/RemoteInputView;->q:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroidx/slice/widget/RemoteInputView;

    .line 12
    .line 13
    return-object p0
.end method

.method private f(Landroidx/slice/SliceItem;Landroidx/slice/SliceItem;Landroidx/slice/SliceItem;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->l()Landroid/app/RemoteInput;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/app/RemoteInput;->getAllowFreeFormInput()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "no_tint"

    .line 12
    .line 13
    invoke-virtual {p2, v0}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    xor-int/lit8 v0, v0, 0x1

    .line 18
    .line 19
    invoke-virtual {p2}, Landroidx/slice/SliceItem;->i()Landroidx/core/graphics/drawable/IconCompat;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-direct {p0, p2, v0}, Landroidx/slice/widget/a;->a(Landroidx/core/graphics/drawable/IconCompat;Z)Landroid/widget/ImageView;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    new-instance v0, Landroidx/slice/widget/a$b;

    .line 28
    .line 29
    invoke-direct {v0, p0, p3, p1}, Landroidx/slice/widget/a$b;-><init>(Landroidx/slice/widget/a;Landroidx/slice/SliceItem;Landroidx/slice/SliceItem;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    iget p1, p0, Landroidx/slice/widget/a;->j:I

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-direct {p0, p1, p2}, Landroidx/slice/widget/a;->c(ILandroid/content/Context;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method private setColor(I)V
    .locals 2

    .line 1
    iput p1, p0, Landroidx/slice/widget/a;->j:I

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    :goto_0
    iget-object v0, p0, Landroidx/slice/widget/a;->i:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-ge p1, v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Landroidx/slice/widget/a;->i:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    check-cast v0, Landroid/widget/ImageView;

    .line 31
    .line 32
    iget v1, p0, Landroidx/slice/widget/a;->j:I

    .line 33
    .line 34
    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v0, v1}, Landroidx/core/widget/e;->c(Landroid/widget/ImageView;Landroid/content/res/ColorStateList;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    return-void
.end method


# virtual methods
.method e(Landroid/view/View;Landroidx/slice/SliceItem;Landroid/app/RemoteInput;)Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p3, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x0

    .line 14
    :goto_0
    if-eqz v1, :cond_2

    .line 15
    .line 16
    instance-of v3, v1, Landroid/view/View;

    .line 17
    .line 18
    if-eqz v3, :cond_1

    .line 19
    .line 20
    move-object v2, v1

    .line 21
    check-cast v2, Landroid/view/View;

    .line 22
    .line 23
    invoke-direct {p0, v2}, Landroidx/slice/widget/a;->d(Landroid/view/View;)Landroidx/slice/widget/RemoteInputView;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    invoke-interface {v1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    goto :goto_0

    .line 35
    :cond_2
    :goto_1
    if-nez v2, :cond_3

    .line 36
    .line 37
    return v0

    .line 38
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    instance-of v1, p1, Landroid/widget/TextView;

    .line 43
    .line 44
    if-eqz v1, :cond_4

    .line 45
    .line 46
    move-object v1, p1

    .line 47
    check-cast v1, Landroid/widget/TextView;

    .line 48
    .line 49
    invoke-virtual {v1}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    if-eqz v3, :cond_4

    .line 54
    .line 55
    invoke-virtual {v1}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v3, v0}, Landroid/text/Layout;->getLineWidth(I)F

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    float-to-int v0, v0

    .line 64
    invoke-virtual {v1}, Landroid/widget/TextView;->getCompoundPaddingLeft()I

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    invoke-virtual {v1}, Landroid/widget/TextView;->getCompoundPaddingRight()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    add-int/2addr v3, v1

    .line 73
    add-int/2addr v0, v3

    .line 74
    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    div-int/lit8 p0, p0, 0x2

    .line 83
    .line 84
    add-int/2addr v0, p0

    .line 85
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    div-int/lit8 p1, p1, 0x2

    .line 94
    .line 95
    add-int/2addr p0, p1

    .line 96
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getWidth()I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getHeight()I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    add-int v3, v0, p0

    .line 105
    .line 106
    sub-int/2addr v1, p0

    .line 107
    add-int v4, v0, v1

    .line 108
    .line 109
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    sub-int/2addr p1, v0

    .line 114
    add-int v4, p1, p0

    .line 115
    .line 116
    add-int/2addr p1, v1

    .line 117
    invoke-static {v4, p1}, Ljava/lang/Math;->max(II)I

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    invoke-static {v3, p1}, Ljava/lang/Math;->max(II)I

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    invoke-virtual {v2, v0, p0, p1}, Landroidx/slice/widget/RemoteInputView;->i(III)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v2, p2}, Landroidx/slice/widget/RemoteInputView;->setAction(Landroidx/slice/SliceItem;)V

    .line 129
    .line 130
    .line 131
    filled-new-array {p3}, [Landroid/app/RemoteInput;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {v2, p0, p3}, Landroidx/slice/widget/RemoteInputView;->h([Landroid/app/RemoteInput;Landroid/app/RemoteInput;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v2}, Landroidx/slice/widget/RemoteInputView;->b()V

    .line 139
    .line 140
    .line 141
    const/4 p0, 0x1

    .line 142
    return p0
.end method

.method public g(Ljava/util/List;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lh0/d;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/slice/widget/a;->i:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Landroidx/slice/widget/a;->i:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, -0x1

    .line 15
    if-eq p2, v0, :cond_0

    .line 16
    .line 17
    invoke-direct {p0, p2}, Landroidx/slice/widget/a;->setColor(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    const/4 v0, 0x0

    .line 29
    if-eqz p2, :cond_5

    .line 30
    .line 31
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    check-cast p2, Lh0/d;

    .line 36
    .line 37
    iget-object v1, p0, Landroidx/slice/widget/a;->i:Landroid/widget/LinearLayout;

    .line 38
    .line 39
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    const/4 v2, 0x5

    .line 44
    if-lt v1, v2, :cond_2

    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    move-object v1, p2

    .line 48
    check-cast v1, Lh0/e;

    .line 49
    .line 50
    invoke-virtual {v1}, Lh0/e;->e()Landroidx/slice/SliceItem;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v1}, Lh0/e;->d()Landroidx/slice/SliceItem;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const-string v3, "input"

    .line 59
    .line 60
    invoke-static {v2, v3}, Lh0/f;->f(Landroidx/slice/SliceItem;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    const-string v4, "image"

    .line 65
    .line 66
    invoke-static {v2, v4}, Lh0/f;->f(Landroidx/slice/SliceItem;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    if-eqz v3, :cond_3

    .line 71
    .line 72
    if-eqz v2, :cond_3

    .line 73
    .line 74
    invoke-direct {p0, v3, v2, v1}, Landroidx/slice/widget/a;->f(Landroidx/slice/SliceItem;Landroidx/slice/SliceItem;Landroidx/slice/SliceItem;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_3
    invoke-interface {p2}, Lh0/d;->getIcon()Landroidx/core/graphics/drawable/IconCompat;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    if-eqz v2, :cond_1

    .line 83
    .line 84
    invoke-interface {p2}, Lh0/d;->getIcon()Landroidx/core/graphics/drawable/IconCompat;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    if-eqz v2, :cond_1

    .line 89
    .line 90
    if-eqz v1, :cond_1

    .line 91
    .line 92
    invoke-interface {p2}, Lh0/d;->b()I

    .line 93
    .line 94
    .line 95
    move-result p2

    .line 96
    if-nez p2, :cond_4

    .line 97
    .line 98
    const/4 v0, 0x1

    .line 99
    :cond_4
    invoke-direct {p0, v2, v0}, Landroidx/slice/widget/a;->a(Landroidx/core/graphics/drawable/IconCompat;Z)Landroid/widget/ImageView;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    new-instance v0, Landroidx/slice/widget/a$a;

    .line 104
    .line 105
    invoke-direct {v0, p0, v1}, Landroidx/slice/widget/a$a;-><init>(Landroidx/slice/widget/a;Landroidx/slice/SliceItem;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-eqz p1, :cond_6

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_6
    const/16 v0, 0x8

    .line 120
    .line 121
    :goto_1
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 122
    .line 123
    .line 124
    return-void
.end method
