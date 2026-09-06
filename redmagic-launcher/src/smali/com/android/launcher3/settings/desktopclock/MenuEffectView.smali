.class public Lcom/android/launcher3/settings/desktopclock/MenuEffectView;
.super Landroid/widget/FrameLayout;
.source "MenuEffectView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/settings/desktopclock/MenuEffectView$a;,
        Lcom/android/launcher3/settings/desktopclock/MenuEffectView$b;
    }
.end annotation


# instance fields
.field private g:Lcom/zte/mifavor/widget/MenuScrollerView;

.field private h:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "LL1/a;",
            ">;"
        }
    .end annotation
.end field

.field private i:Lcom/android/launcher3/settings/desktopclock/MenuEffectView$a;

.field private j:I

.field private k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/settings/desktopclock/MenuEffectView$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->k:Ljava/util/List;

    return-void
.end method

.method private c(Ljava/util/ArrayList;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "LL1/a;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->k:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->g:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/MenuScrollerView;->u()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->g:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/HorizontalScrollView;->setHorizontalFadingEdgeEnabled(Z)V

    .line 15
    .line 16
    .line 17
    if-eqz p1, :cond_5

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_5

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_4

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, LL1/a;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    const v4, 0x7f0e00bb

    .line 50
    .line 51
    .line 52
    const/4 v5, 0x0

    .line 53
    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    check-cast v3, Lcom/android/launcher3/settings/desktopclock/FrameLayoutEffect;

    .line 58
    .line 59
    const v4, 0x7f0b0374

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    check-cast v4, Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;

    .line 67
    .line 68
    invoke-virtual {v2}, LL1/a;->a()I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    invoke-virtual {v4, v5}, Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;->b(I)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v4}, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->a(Lcom/android/launcher3/settings/desktopclock/MenuEffectView$b;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2}, LL1/a;->a()I

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    invoke-virtual {v3, v4}, Lcom/android/launcher3/settings/desktopclock/FrameLayoutEffect;->setIndex(I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2}, LL1/a;->b()Z

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    const/4 v5, 0x1

    .line 90
    if-eqz v4, :cond_1

    .line 91
    .line 92
    invoke-virtual {v3, v5}, Lcom/android/launcher3/settings/desktopclock/FrameLayoutEffect;->setIsSelected(Z)V

    .line 93
    .line 94
    .line 95
    const v4, 0x7f0809f2

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setBackgroundResource(I)V

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_1
    invoke-virtual {v3, v1}, Lcom/android/launcher3/settings/desktopclock/FrameLayoutEffect;->setIsSelected(Z)V

    .line 103
    .line 104
    .line 105
    const v4, 0x7f0809f1

    .line 106
    .line 107
    .line 108
    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setBackgroundResource(I)V

    .line 109
    .line 110
    .line 111
    :goto_1
    invoke-virtual {v3, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 112
    .line 113
    .line 114
    new-instance v4, Lb4/b;

    .line 115
    .line 116
    invoke-direct {v4, v3, v5}, Lb4/b;-><init>(Landroid/view/View;Z)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 123
    .line 124
    .line 125
    move-result-object v4

    .line 126
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 127
    .line 128
    .line 129
    move-result-object v6

    .line 130
    const v7, 0x7f0702a6

    .line 131
    .line 132
    .line 133
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 134
    .line 135
    .line 136
    move-result v6

    .line 137
    invoke-static {v4, v6}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    iget-object v6, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->g:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 142
    .line 143
    invoke-virtual {v6, v4}, Lcom/zte/mifavor/widget/MenuScrollerView;->setItemGap(I)V

    .line 144
    .line 145
    .line 146
    iget-object v4, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->g:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 147
    .line 148
    invoke-virtual {v4, v3}, Lcom/zte/mifavor/widget/MenuScrollerView;->j(Lcom/zte/mifavor/widget/MenuScrollerView$b;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 152
    .line 153
    .line 154
    move-result-object v4

    .line 155
    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 156
    .line 157
    if-eqz v4, :cond_0

    .line 158
    .line 159
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 160
    .line 161
    .line 162
    move-result-object v6

    .line 163
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 164
    .line 165
    .line 166
    move-result-object v7

    .line 167
    const v8, 0x7f0701cf

    .line 168
    .line 169
    .line 170
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 171
    .line 172
    .line 173
    move-result v7

    .line 174
    invoke-static {v6, v7}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 175
    .line 176
    .line 177
    move-result v6

    .line 178
    iput v6, v4, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 179
    .line 180
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 181
    .line 182
    .line 183
    move-result-object v6

    .line 184
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 185
    .line 186
    .line 187
    move-result-object v7

    .line 188
    const v8, 0x7f0701ce

    .line 189
    .line 190
    .line 191
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 192
    .line 193
    .line 194
    move-result v7

    .line 195
    invoke-static {v6, v7}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 196
    .line 197
    .line 198
    move-result v6

    .line 199
    iput v6, v4, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 200
    .line 201
    invoke-virtual {v2}, LL1/a;->a()I

    .line 202
    .line 203
    .line 204
    move-result v6

    .line 205
    const v7, 0x7f0702a7

    .line 206
    .line 207
    .line 208
    if-nez v6, :cond_2

    .line 209
    .line 210
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 215
    .line 216
    .line 217
    move-result-object v5

    .line 218
    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    .line 219
    .line 220
    .line 221
    move-result v5

    .line 222
    invoke-static {v2, v5}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    iput v2, v4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 227
    .line 228
    goto :goto_2

    .line 229
    :cond_2
    invoke-virtual {v2}, LL1/a;->a()I

    .line 230
    .line 231
    .line 232
    move-result v2

    .line 233
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 234
    .line 235
    .line 236
    move-result v6

    .line 237
    sub-int/2addr v6, v5

    .line 238
    if-ne v2, v6, :cond_3

    .line 239
    .line 240
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 241
    .line 242
    .line 243
    move-result-object v2

    .line 244
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 245
    .line 246
    .line 247
    move-result-object v5

    .line 248
    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    .line 249
    .line 250
    .line 251
    move-result v5

    .line 252
    invoke-static {v2, v5}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 253
    .line 254
    .line 255
    move-result v2

    .line 256
    iput v2, v4, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 257
    .line 258
    :cond_3
    :goto_2
    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 259
    .line 260
    .line 261
    goto/16 :goto_0

    .line 262
    .line 263
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->g:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 264
    .line 265
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/MenuScrollerView;->r()V

    .line 266
    .line 267
    .line 268
    :cond_5
    return-void
.end method

.method private d(Lcom/android/launcher3/settings/desktopclock/FrameLayoutEffect;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/settings/desktopclock/FrameLayoutEffect;->getIndex()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v2, "onItemClick: itemViewIndex = "

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v2, " mSelectedIndex = "

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget v2, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->j:I

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v2, "MenuEffectView"

    .line 33
    .line 34
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    iget v1, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->j:I

    .line 38
    .line 39
    if-eq v1, v0, :cond_5

    .line 40
    .line 41
    iput v0, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->j:I

    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->g:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 44
    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    iget-object v0, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->h:Lcom/zte/mifavor/widget/MenuScrollerView$b;

    .line 48
    .line 49
    check-cast v0, Lcom/android/launcher3/settings/desktopclock/FrameLayoutEffect;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const/4 v0, 0x0

    .line 53
    :goto_0
    const/4 v1, 0x0

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/android/launcher3/settings/desktopclock/FrameLayoutEffect;->setIsSelected(Z)V

    .line 57
    .line 58
    .line 59
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->g:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 60
    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/MenuScrollerView;->setSelectItem(Lcom/zte/mifavor/widget/MenuScrollerView$b;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    const/4 v0, 0x1

    .line 67
    invoke-virtual {p1, v0}, Lcom/android/launcher3/settings/desktopclock/FrameLayoutEffect;->setIsSelected(Z)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object p1, p1, Lcom/android/launcher3/r4;->m:Ljava/lang/String;

    .line 83
    .line 84
    iget v2, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->j:I

    .line 85
    .line 86
    if-nez v2, :cond_3

    .line 87
    .line 88
    const-string p1, "pointer_clock_default"

    .line 89
    .line 90
    :goto_1
    move v1, v0

    .line 91
    goto :goto_2

    .line 92
    :cond_3
    if-ne v2, v0, :cond_4

    .line 93
    .line 94
    const-string p1, "digital_clock_default"

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_4
    :goto_2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {v0, v2, v1, p1}, Lcom/android/launcher3/r4;->G(Landroid/content/Context;ZLjava/lang/String;)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->i:Lcom/android/launcher3/settings/desktopclock/MenuEffectView$a;

    .line 117
    .line 118
    if-eqz v0, :cond_5

    .line 119
    .line 120
    iget p0, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->j:I

    .line 121
    .line 122
    invoke-interface {v0, p0, v1, p1}, Lcom/android/launcher3/settings/desktopclock/MenuEffectView$a;->a(IZLjava/lang/String;)V

    .line 123
    .line 124
    .line 125
    :cond_5
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/settings/desktopclock/MenuEffectView$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->k:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->k:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView$b;

    .line 18
    .line 19
    invoke-interface {v0}, Lcom/android/launcher3/settings/desktopclock/MenuEffectView$b;->a()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/settings/desktopclock/FrameLayoutEffect;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/settings/desktopclock/FrameLayoutEffect;

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->d(Lcom/android/launcher3/settings/desktopclock/FrameLayoutEffect;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const v1, 0x7f0e00b9

    .line 13
    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    const v0, 0x7f0b03ac

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->g:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 29
    .line 30
    return-void
.end method

.method public setDataList(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "LL1/a;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->g:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/MenuScrollerView;->setControlSpringID(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->h:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->c(Ljava/util/ArrayList;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setOnItemClickListener(Lcom/android/launcher3/settings/desktopclock/MenuEffectView$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->i:Lcom/android/launcher3/settings/desktopclock/MenuEffectView$a;

    .line 2
    .line 3
    return-void
.end method

.method public setSelectedIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->j:I

    .line 2
    .line 3
    return-void
.end method
