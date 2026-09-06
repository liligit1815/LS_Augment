.class Landroidx/appcompat/widget/T$d;
.super Landroid/widget/LinearLayout;
.source "ScrollingTabContainerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/widget/T;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "d"
.end annotation


# instance fields
.field private final g:[I

.field private h:Landroidx/appcompat/app/a$c;

.field private i:Landroid/widget/TextView;

.field private j:Landroid/widget/ImageView;

.field private k:Landroid/view/View;

.field final synthetic l:Landroidx/appcompat/widget/T;


# direct methods
.method public constructor <init>(Landroidx/appcompat/widget/T;Landroid/content/Context;Landroidx/appcompat/app/a$c;Z)V
    .locals 2

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/T$d;->l:Landroidx/appcompat/widget/T;

    .line 2
    .line 3
    sget p1, Lf/a;->d:I

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p2, v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 7
    .line 8
    .line 9
    const v1, 0x10100d4

    .line 10
    .line 11
    .line 12
    filled-new-array {v1}, [I

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, p0, Landroidx/appcompat/widget/T$d;->g:[I

    .line 17
    .line 18
    iput-object p3, p0, Landroidx/appcompat/widget/T$d;->h:Landroidx/appcompat/app/a$c;

    .line 19
    .line 20
    const/4 p3, 0x0

    .line 21
    invoke-static {p2, v0, v1, p1, p3}, Landroidx/appcompat/widget/a0;->v(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroidx/appcompat/widget/a0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1, p3}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-eqz p2, :cond_0

    .line 30
    .line 31
    invoke-virtual {p1, p3}, Landroidx/appcompat/widget/a0;->g(I)Landroid/graphics/drawable/Drawable;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    invoke-virtual {p1}, Landroidx/appcompat/widget/a0;->w()V

    .line 39
    .line 40
    .line 41
    if-eqz p4, :cond_1

    .line 42
    .line 43
    const p1, 0x800013

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-virtual {p0}, Landroidx/appcompat/widget/T$d;->c()V

    .line 50
    .line 51
    .line 52
    return-void
.end method


# virtual methods
.method public a(Landroidx/appcompat/app/a$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/T$d;->h:Landroidx/appcompat/app/a$c;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/T$d;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b()Landroidx/appcompat/app/a$c;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/T$d;->h:Landroidx/appcompat/app/a$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()V
    .locals 10

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/T$d;->h:Landroidx/appcompat/app/a$c;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/app/a$c;->b()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/16 v2, 0x8

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-eqz v1, :cond_4

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eq v0, p0, :cond_1

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    check-cast v0, Landroid/view/ViewGroup;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    iput-object v1, p0, Landroidx/appcompat/widget/T$d;->k:Landroid/view/View;

    .line 29
    .line 30
    iget-object v0, p0, Landroidx/appcompat/widget/T$d;->i:Landroid/widget/TextView;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object v0, p0, Landroidx/appcompat/widget/T$d;->j:Landroid/widget/ImageView;

    .line 38
    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Landroidx/appcompat/widget/T$d;->j:Landroid/widget/ImageView;

    .line 45
    .line 46
    invoke-virtual {p0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 47
    .line 48
    .line 49
    :cond_3
    return-void

    .line 50
    :cond_4
    iget-object v1, p0, Landroidx/appcompat/widget/T$d;->k:Landroid/view/View;

    .line 51
    .line 52
    if-eqz v1, :cond_5

    .line 53
    .line 54
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 55
    .line 56
    .line 57
    iput-object v3, p0, Landroidx/appcompat/widget/T$d;->k:Landroid/view/View;

    .line 58
    .line 59
    :cond_5
    invoke-virtual {v0}, Landroidx/appcompat/app/a$c;->c()Landroid/graphics/drawable/Drawable;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0}, Landroidx/appcompat/app/a$c;->d()Ljava/lang/CharSequence;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    const/16 v5, 0x10

    .line 68
    .line 69
    const/4 v6, 0x0

    .line 70
    const/4 v7, -0x2

    .line 71
    if-eqz v1, :cond_7

    .line 72
    .line 73
    iget-object v8, p0, Landroidx/appcompat/widget/T$d;->j:Landroid/widget/ImageView;

    .line 74
    .line 75
    if-nez v8, :cond_6

    .line 76
    .line 77
    new-instance v8, Landroidx/appcompat/widget/r;

    .line 78
    .line 79
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 80
    .line 81
    .line 82
    move-result-object v9

    .line 83
    invoke-direct {v8, v9}, Landroidx/appcompat/widget/r;-><init>(Landroid/content/Context;)V

    .line 84
    .line 85
    .line 86
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    .line 87
    .line 88
    invoke-direct {v9, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 89
    .line 90
    .line 91
    iput v5, v9, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 92
    .line 93
    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, v8, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 97
    .line 98
    .line 99
    iput-object v8, p0, Landroidx/appcompat/widget/T$d;->j:Landroid/widget/ImageView;

    .line 100
    .line 101
    :cond_6
    iget-object v8, p0, Landroidx/appcompat/widget/T$d;->j:Landroid/widget/ImageView;

    .line 102
    .line 103
    invoke-virtual {v8, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 104
    .line 105
    .line 106
    iget-object v1, p0, Landroidx/appcompat/widget/T$d;->j:Landroid/widget/ImageView;

    .line 107
    .line 108
    invoke-virtual {v1, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_7
    iget-object v1, p0, Landroidx/appcompat/widget/T$d;->j:Landroid/widget/ImageView;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 117
    .line 118
    .line 119
    iget-object v1, p0, Landroidx/appcompat/widget/T$d;->j:Landroid/widget/ImageView;

    .line 120
    .line 121
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 122
    .line 123
    .line 124
    :cond_8
    :goto_0
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-nez v1, :cond_a

    .line 129
    .line 130
    iget-object v2, p0, Landroidx/appcompat/widget/T$d;->i:Landroid/widget/TextView;

    .line 131
    .line 132
    if-nez v2, :cond_9

    .line 133
    .line 134
    new-instance v2, Landroidx/appcompat/widget/AppCompatTextView;

    .line 135
    .line 136
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 137
    .line 138
    .line 139
    move-result-object v8

    .line 140
    sget v9, Lf/a;->e:I

    .line 141
    .line 142
    invoke-direct {v2, v8, v3, v9}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 143
    .line 144
    .line 145
    sget-object v8, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 146
    .line 147
    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 148
    .line 149
    .line 150
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    .line 151
    .line 152
    invoke-direct {v8, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 153
    .line 154
    .line 155
    iput v5, v8, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 156
    .line 157
    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 161
    .line 162
    .line 163
    iput-object v2, p0, Landroidx/appcompat/widget/T$d;->i:Landroid/widget/TextView;

    .line 164
    .line 165
    :cond_9
    iget-object v2, p0, Landroidx/appcompat/widget/T$d;->i:Landroid/widget/TextView;

    .line 166
    .line 167
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 168
    .line 169
    .line 170
    iget-object v2, p0, Landroidx/appcompat/widget/T$d;->i:Landroid/widget/TextView;

    .line 171
    .line 172
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 173
    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_a
    iget-object v4, p0, Landroidx/appcompat/widget/T$d;->i:Landroid/widget/TextView;

    .line 177
    .line 178
    if-eqz v4, :cond_b

    .line 179
    .line 180
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 181
    .line 182
    .line 183
    iget-object v2, p0, Landroidx/appcompat/widget/T$d;->i:Landroid/widget/TextView;

    .line 184
    .line 185
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 186
    .line 187
    .line 188
    :cond_b
    :goto_1
    iget-object v2, p0, Landroidx/appcompat/widget/T$d;->j:Landroid/widget/ImageView;

    .line 189
    .line 190
    if-eqz v2, :cond_c

    .line 191
    .line 192
    invoke-virtual {v0}, Landroidx/appcompat/app/a$c;->a()Ljava/lang/CharSequence;

    .line 193
    .line 194
    .line 195
    move-result-object v4

    .line 196
    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 197
    .line 198
    .line 199
    :cond_c
    if-nez v1, :cond_d

    .line 200
    .line 201
    goto :goto_2

    .line 202
    :cond_d
    invoke-virtual {v0}, Landroidx/appcompat/app/a$c;->a()Ljava/lang/CharSequence;

    .line 203
    .line 204
    .line 205
    move-result-object v3

    .line 206
    :goto_2
    invoke-static {p0, v3}, Landroidx/appcompat/widget/f0;->a(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 207
    .line 208
    .line 209
    return-void
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    .line 3
    .line 4
    const-string p0, "androidx.appcompat.app.ActionBar$Tab"

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    const-string p0, "androidx.appcompat.app.ActionBar$Tab"

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Landroidx/appcompat/widget/T$d;->l:Landroidx/appcompat/widget/T;

    .line 5
    .line 6
    iget p1, p1, Landroidx/appcompat/widget/T;->l:I

    .line 7
    .line 8
    if-lez p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iget-object v0, p0, Landroidx/appcompat/widget/T$d;->l:Landroidx/appcompat/widget/T;

    .line 15
    .line 16
    iget v0, v0, Landroidx/appcompat/widget/T;->l:I

    .line 17
    .line 18
    if-le p1, v0, :cond_0

    .line 19
    .line 20
    const/high16 p1, 0x40000000    # 2.0f

    .line 21
    .line 22
    invoke-static {v0, p1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public setSelected(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isSelected()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eq v0, p1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setSelected(Z)V

    .line 11
    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    const/4 p1, 0x4

    .line 18
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->sendAccessibilityEvent(I)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method
