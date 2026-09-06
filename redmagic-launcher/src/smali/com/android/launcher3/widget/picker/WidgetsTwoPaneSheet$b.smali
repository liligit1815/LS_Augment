.class Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;
.super Ljava/lang/Object;
.source "WidgetsTwoPaneSheet.java"

# interfaces
.implements Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->getHeaderChangeListener()Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/widget/picker/e0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/e0;->a:Lcom/android/launcher3/widget/picker/WidgetsListTableView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->l2(Landroid/view/ViewGroup;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;Lcom/android/launcher3/widget/picker/e0;Lm2/h;ZLandroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->d(Lcom/android/launcher3/widget/picker/e0;Lm2/h;ZLandroid/util/Pair;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic d(Lcom/android/launcher3/widget/picker/e0;Lm2/h;ZLandroid/util/Pair;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->i2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Lcom/android/launcher3/widget/picker/d0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x3

    .line 8
    invoke-static {p4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p4

    .line 12
    invoke-virtual {v0, p1, p2, v1, p4}, Lcom/android/launcher3/widget/picker/d0;->e(Lcom/android/launcher3/widget/picker/e0;Lm2/h;ILjava/util/List;)V

    .line 13
    .line 14
    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    iget-object p1, p1, Lcom/android/launcher3/widget/picker/e0;->a:Lcom/android/launcher3/widget/picker/WidgetsListTableView;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->s2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Lz1/Z4;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p1, p0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->m2(Landroid/view/ViewGroup;Lz1/Z4;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/util/L1;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->g2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Lcom/android/launcher3/util/L1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->g2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Lcom/android/launcher3/util/L1;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/L1;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    move v0, v1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v0, v2

    .line 26
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 27
    .line 28
    invoke-static {v3}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->g2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Lcom/android/launcher3/util/L1;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    if-eqz v3, :cond_1

    .line 33
    .line 34
    iget-object v3, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 35
    .line 36
    invoke-static {v3}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->o2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Lcom/android/launcher3/anim/q;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v3}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-nez v3, :cond_1

    .line 49
    .line 50
    iget-object v3, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 51
    .line 52
    invoke-virtual {v3}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->getAccessibilityInitialFocusView()Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v3}, Landroid/view/View;->isAccessibilityFocused()Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-nez v3, :cond_1

    .line 61
    .line 62
    move v3, v1

    .line 63
    goto :goto_1

    .line 64
    :cond_1
    move v3, v2

    .line 65
    :goto_1
    iget-object v4, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 66
    .line 67
    invoke-static {v4, p1}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->j2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;Lcom/android/launcher3/util/L1;)V

    .line 68
    .line 69
    .line 70
    invoke-static {}, Lcom/android/launcher3/y0;->f0()Z

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    if-eqz v4, :cond_2

    .line 75
    .line 76
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 77
    .line 78
    iget-object v4, v1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 79
    .line 80
    invoke-virtual {v1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->getCurrentAdapterHolderType()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-virtual {v4, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    check-cast v1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 89
    .line 90
    iget-object v1, v1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 91
    .line 92
    invoke-virtual {v1, p1}, Lcom/android/launcher3/widget/picker/T;->z(Lcom/android/launcher3/util/L1;)Lm2/h;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    goto :goto_3

    .line 97
    :cond_2
    iget-object v4, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 98
    .line 99
    iget-object v5, v4, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->V0:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$e;

    .line 100
    .line 101
    if-eqz v5, :cond_3

    .line 102
    .line 103
    iget-boolean v5, v5, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$e;->a:Z

    .line 104
    .line 105
    if-nez v5, :cond_3

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_3
    move v1, v2

    .line 109
    :goto_2
    invoke-static {v4}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->p2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Landroid/content/Context;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    check-cast v4, Lcom/android/launcher3/v;

    .line 114
    .line 115
    invoke-interface {v4}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    invoke-virtual {v4}, Ln2/c;->e()Lo2/a;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    invoke-static {v4, p1, v1}, Lo2/b;->b(Lo2/a;Lcom/android/launcher3/util/L1;Z)Lm2/h;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    :goto_3
    if-eqz v1, :cond_9

    .line 128
    .line 129
    iget-object v4, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 130
    .line 131
    invoke-static {v4}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->f2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Landroid/widget/LinearLayout;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    if-nez v4, :cond_4

    .line 136
    .line 137
    goto/16 :goto_4

    .line 138
    .line 139
    :cond_4
    iget-object v4, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 140
    .line 141
    invoke-static {v4}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->h2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Lcom/android/launcher3/widget/picker/WidgetsListHeader;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    if-eqz v4, :cond_5

    .line 146
    .line 147
    iget-object v4, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 148
    .line 149
    invoke-static {v4}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->h2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Lcom/android/launcher3/widget/picker/WidgetsListHeader;

    .line 150
    .line 151
    .line 152
    move-result-object v4

    .line 153
    invoke-virtual {v4, v2}, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->setExpanded(Z)V

    .line 154
    .line 155
    .line 156
    :cond_5
    iget-object v4, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 157
    .line 158
    invoke-static {v4}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->q2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Landroid/content/Context;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    check-cast v4, Lcom/android/launcher3/v;

    .line 163
    .line 164
    invoke-interface {v4}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 165
    .line 166
    .line 167
    move-result-object v4

    .line 168
    invoke-virtual {v4, p1}, Ln2/c;->f(Lcom/android/launcher3/util/L1;)Lm2/o;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    if-eqz p1, :cond_6

    .line 173
    .line 174
    iget-object v4, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 175
    .line 176
    iget-object v4, v4, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->W0:Landroid/widget/TextView;

    .line 177
    .line 178
    if-eqz v4, :cond_6

    .line 179
    .line 180
    iget-object p1, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 181
    .line 182
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 183
    .line 184
    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 185
    .line 186
    .line 187
    :cond_6
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 188
    .line 189
    iget p1, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->v0:I

    .line 190
    .line 191
    invoke-virtual {v1, p1}, Lm2/h;->o(I)Lm2/h;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    iget-object v4, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 196
    .line 197
    invoke-static {v4}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->i2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Lcom/android/launcher3/widget/picker/d0;

    .line 198
    .line 199
    .line 200
    move-result-object v4

    .line 201
    iget-object v5, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 202
    .line 203
    invoke-static {v5}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->f2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Landroid/widget/LinearLayout;

    .line 204
    .line 205
    .line 206
    move-result-object v5

    .line 207
    invoke-virtual {v4, v5}, Lcom/android/launcher3/widget/picker/d0;->f(Landroid/view/ViewGroup;)Lcom/android/launcher3/widget/picker/e0;

    .line 208
    .line 209
    .line 210
    move-result-object v4

    .line 211
    iget-object v5, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 212
    .line 213
    invoke-static {v5}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->i2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Lcom/android/launcher3/widget/picker/d0;

    .line 214
    .line 215
    .line 216
    move-result-object v5

    .line 217
    const/4 v6, 0x3

    .line 218
    sget-object v7, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 219
    .line 220
    invoke-virtual {v5, v4, p1, v6, v7}, Lcom/android/launcher3/widget/picker/d0;->e(Lcom/android/launcher3/widget/picker/e0;Lm2/h;ILjava/util/List;)V

    .line 221
    .line 222
    .line 223
    if-eqz v0, :cond_7

    .line 224
    .line 225
    iget-object v5, v4, Lcom/android/launcher3/widget/picker/e0;->a:Lcom/android/launcher3/widget/picker/WidgetsListTableView;

    .line 226
    .line 227
    iget-object v6, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 228
    .line 229
    invoke-static {v6}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->r2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Lz1/Z4;

    .line 230
    .line 231
    .line 232
    move-result-object v6

    .line 233
    invoke-static {v5, v6}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->m2(Landroid/view/ViewGroup;Lz1/Z4;)V

    .line 234
    .line 235
    .line 236
    :cond_7
    new-instance v5, Lcom/android/launcher3/widget/picker/o0;

    .line 237
    .line 238
    invoke-direct {v5, p0, v4, p1, v0}, Lcom/android/launcher3/widget/picker/o0;-><init>(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;Lcom/android/launcher3/widget/picker/e0;Lm2/h;Z)V

    .line 239
    .line 240
    .line 241
    iput-object v5, v4, Lcom/android/launcher3/widget/picker/e0;->c:Ljava/util/function/Consumer;

    .line 242
    .line 243
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 244
    .line 245
    invoke-static {p1}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->f2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Landroid/widget/LinearLayout;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 250
    .line 251
    .line 252
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 253
    .line 254
    invoke-static {p1}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->f2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Landroid/widget/LinearLayout;

    .line 255
    .line 256
    .line 257
    move-result-object p1

    .line 258
    iget-object v0, v4, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 259
    .line 260
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 261
    .line 262
    .line 263
    if-eqz v3, :cond_8

    .line 264
    .line 265
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 266
    .line 267
    iget-object v0, p1, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->O0:Landroid/widget/ScrollView;

    .line 268
    .line 269
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    iget-object v1, v1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 274
    .line 275
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 276
    .line 277
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object v1

    .line 281
    const v3, 0x7f140486

    .line 282
    .line 283
    .line 284
    invoke-virtual {p1, v3, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object p1

    .line 288
    invoke-virtual {v0, p1}, Landroid/widget/ScrollView;->setAccessibilityPaneTitle(Ljava/lang/CharSequence;)V

    .line 289
    .line 290
    .line 291
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 292
    .line 293
    new-instance v0, Lcom/android/launcher3/widget/picker/p0;

    .line 294
    .line 295
    invoke-direct {v0, v4}, Lcom/android/launcher3/widget/picker/p0;-><init>(Lcom/android/launcher3/widget/picker/e0;)V

    .line 296
    .line 297
    .line 298
    sget v1, Lcom/android/launcher3/widget/picker/c0;->b:I

    .line 299
    .line 300
    int-to-long v3, v1

    .line 301
    invoke-virtual {p1, v0, v3, v4}, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 302
    .line 303
    .line 304
    :cond_8
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 305
    .line 306
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->O0:Landroid/widget/ScrollView;

    .line 307
    .line 308
    invoke-virtual {p0, v2}, Landroid/widget/ScrollView;->setScrollY(I)V

    .line 309
    .line 310
    .line 311
    :cond_9
    :goto_4
    return-void
.end method
