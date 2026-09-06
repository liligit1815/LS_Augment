.class Landroidx/appcompat/widget/A$h;
.super Landroidx/appcompat/widget/M;
.source "AppCompatSpinner.java"

# interfaces
.implements Landroidx/appcompat/widget/A$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/widget/A;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "h"
.end annotation


# instance fields
.field private M:Ljava/lang/CharSequence;

.field N:Landroid/widget/ListAdapter;

.field private final O:Landroid/graphics/Rect;

.field private P:I

.field final synthetic Q:Landroidx/appcompat/widget/A;


# direct methods
.method public constructor <init>(Landroidx/appcompat/widget/A;Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/A$h;->Q:Landroidx/appcompat/widget/A;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3, p4}, Landroidx/appcompat/widget/M;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, Landroidx/appcompat/widget/A$h;->O:Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/M;->q(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    const/4 p2, 0x1

    .line 17
    invoke-virtual {p0, p2}, Landroidx/appcompat/widget/M;->w(Z)V

    .line 18
    .line 19
    .line 20
    const/4 p2, 0x0

    .line 21
    invoke-virtual {p0, p2}, Landroidx/appcompat/widget/M;->C(I)V

    .line 22
    .line 23
    .line 24
    new-instance p2, Landroidx/appcompat/widget/A$h$a;

    .line 25
    .line 26
    invoke-direct {p2, p0, p1}, Landroidx/appcompat/widget/A$h$a;-><init>(Landroidx/appcompat/widget/A$h;Landroidx/appcompat/widget/A;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p2}, Landroidx/appcompat/widget/M;->y(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method static synthetic F(Landroidx/appcompat/widget/A$h;)V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/appcompat/widget/M;->show()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method G()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v1, p0, Landroidx/appcompat/widget/A$h;->Q:Landroidx/appcompat/widget/A;

    .line 8
    .line 9
    iget-object v1, v1, Landroidx/appcompat/widget/A;->n:Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Landroidx/appcompat/widget/A$h;->Q:Landroidx/appcompat/widget/A;

    .line 15
    .line 16
    invoke-static {v0}, Landroidx/appcompat/widget/h0;->b(Landroid/view/View;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Landroidx/appcompat/widget/A$h;->Q:Landroidx/appcompat/widget/A;

    .line 23
    .line 24
    iget-object v0, v0, Landroidx/appcompat/widget/A;->n:Landroid/graphics/Rect;

    .line 25
    .line 26
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/widget/A$h;->Q:Landroidx/appcompat/widget/A;

    .line 30
    .line 31
    iget-object v0, v0, Landroidx/appcompat/widget/A;->n:Landroid/graphics/Rect;

    .line 32
    .line 33
    iget v0, v0, Landroid/graphics/Rect;->left:I

    .line 34
    .line 35
    neg-int v0, v0

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget-object v0, p0, Landroidx/appcompat/widget/A$h;->Q:Landroidx/appcompat/widget/A;

    .line 38
    .line 39
    iget-object v0, v0, Landroidx/appcompat/widget/A;->n:Landroid/graphics/Rect;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 43
    .line 44
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 45
    .line 46
    move v0, v1

    .line 47
    :goto_0
    iget-object v1, p0, Landroidx/appcompat/widget/A$h;->Q:Landroidx/appcompat/widget/A;

    .line 48
    .line 49
    invoke-virtual {v1}, Landroid/widget/Spinner;->getPaddingLeft()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    iget-object v2, p0, Landroidx/appcompat/widget/A$h;->Q:Landroidx/appcompat/widget/A;

    .line 54
    .line 55
    invoke-virtual {v2}, Landroid/widget/Spinner;->getPaddingRight()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    iget-object v3, p0, Landroidx/appcompat/widget/A$h;->Q:Landroidx/appcompat/widget/A;

    .line 60
    .line 61
    invoke-virtual {v3}, Landroid/widget/Spinner;->getWidth()I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    iget-object v4, p0, Landroidx/appcompat/widget/A$h;->Q:Landroidx/appcompat/widget/A;

    .line 66
    .line 67
    iget v5, v4, Landroidx/appcompat/widget/A;->m:I

    .line 68
    .line 69
    const/4 v6, -0x2

    .line 70
    if-ne v5, v6, :cond_3

    .line 71
    .line 72
    iget-object v5, p0, Landroidx/appcompat/widget/A$h;->N:Landroid/widget/ListAdapter;

    .line 73
    .line 74
    check-cast v5, Landroid/widget/SpinnerAdapter;

    .line 75
    .line 76
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    invoke-virtual {v4, v5, v6}, Landroidx/appcompat/widget/A;->a(Landroid/widget/SpinnerAdapter;Landroid/graphics/drawable/Drawable;)I

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    iget-object v5, p0, Landroidx/appcompat/widget/A$h;->Q:Landroidx/appcompat/widget/A;

    .line 85
    .line 86
    invoke-virtual {v5}, Landroid/widget/Spinner;->getContext()Landroid/content/Context;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    iget v5, v5, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 99
    .line 100
    iget-object v6, p0, Landroidx/appcompat/widget/A$h;->Q:Landroidx/appcompat/widget/A;

    .line 101
    .line 102
    iget-object v6, v6, Landroidx/appcompat/widget/A;->n:Landroid/graphics/Rect;

    .line 103
    .line 104
    iget v7, v6, Landroid/graphics/Rect;->left:I

    .line 105
    .line 106
    sub-int/2addr v5, v7

    .line 107
    iget v6, v6, Landroid/graphics/Rect;->right:I

    .line 108
    .line 109
    sub-int/2addr v5, v6

    .line 110
    if-le v4, v5, :cond_2

    .line 111
    .line 112
    move v4, v5

    .line 113
    :cond_2
    sub-int v5, v3, v1

    .line 114
    .line 115
    sub-int/2addr v5, v2

    .line 116
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    .line 117
    .line 118
    .line 119
    move-result v4

    .line 120
    invoke-virtual {p0, v4}, Landroidx/appcompat/widget/M;->s(I)V

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_3
    const/4 v4, -0x1

    .line 125
    if-ne v5, v4, :cond_4

    .line 126
    .line 127
    sub-int v4, v3, v1

    .line 128
    .line 129
    sub-int/2addr v4, v2

    .line 130
    invoke-virtual {p0, v4}, Landroidx/appcompat/widget/M;->s(I)V

    .line 131
    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_4
    invoke-virtual {p0, v5}, Landroidx/appcompat/widget/M;->s(I)V

    .line 135
    .line 136
    .line 137
    :goto_1
    iget-object v4, p0, Landroidx/appcompat/widget/A$h;->Q:Landroidx/appcompat/widget/A;

    .line 138
    .line 139
    invoke-static {v4}, Landroidx/appcompat/widget/h0;->b(Landroid/view/View;)Z

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    if-eqz v4, :cond_5

    .line 144
    .line 145
    sub-int/2addr v3, v2

    .line 146
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->m()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    sub-int/2addr v3, v1

    .line 151
    invoke-virtual {p0}, Landroidx/appcompat/widget/A$h;->H()I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    sub-int/2addr v3, v1

    .line 156
    add-int/2addr v0, v3

    .line 157
    goto :goto_2

    .line 158
    :cond_5
    invoke-virtual {p0}, Landroidx/appcompat/widget/A$h;->H()I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    add-int/2addr v1, v2

    .line 163
    add-int/2addr v0, v1

    .line 164
    :goto_2
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/M;->setHorizontalOffset(I)V

    .line 165
    .line 166
    .line 167
    return-void
.end method

.method public H()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/appcompat/widget/A$h;->P:I

    .line 2
    .line 3
    return p0
.end method

.method I(Landroid/view/View;)Z
    .locals 1

    .line 1
    invoke-static {p1}, LJ/I;->N(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Landroidx/appcompat/widget/A$h;->O:Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public b(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/A$h;->P:I

    .line 2
    .line 3
    return-void
.end method

.method public getHintText()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/A$h;->M:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/widget/M;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/appcompat/widget/A$h;->N:Landroid/widget/ListAdapter;

    .line 5
    .line 6
    return-void
.end method

.method public setPromptText(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/A$h;->M:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-void
.end method

.method public show(II)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/A$h;->G()V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    invoke-virtual {p0, v1}, Landroidx/appcompat/widget/M;->v(I)V

    .line 10
    .line 11
    .line 12
    invoke-super {p0}, Landroidx/appcompat/widget/M;->show()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->getListView()Landroid/widget/ListView;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setChoiceMode(I)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, p1}, Landroidx/appcompat/widget/A$d;->d(Landroid/view/View;I)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1, p2}, Landroidx/appcompat/widget/A$d;->c(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Landroidx/appcompat/widget/A$h;->Q:Landroidx/appcompat/widget/A;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/M;->D(I)V

    .line 36
    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object p1, p0, Landroidx/appcompat/widget/A$h;->Q:Landroidx/appcompat/widget/A;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/widget/Spinner;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    new-instance p2, Landroidx/appcompat/widget/A$h$b;

    .line 50
    .line 51
    invoke-direct {p2, p0}, Landroidx/appcompat/widget/A$h$b;-><init>(Landroidx/appcompat/widget/A$h;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, p2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 55
    .line 56
    .line 57
    new-instance p1, Landroidx/appcompat/widget/A$h$c;

    .line 58
    .line 59
    invoke-direct {p1, p0, p2}, Landroidx/appcompat/widget/A$h$c;-><init>(Landroidx/appcompat/widget/A$h;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/M;->x(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    :goto_0
    return-void
.end method
