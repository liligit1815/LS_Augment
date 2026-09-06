.class public Landroidx/appcompat/widget/M;
.super Ljava/lang/Object;
.source "ListPopupWindow.java"

# interfaces
.implements Landroidx/appcompat/view/menu/p;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/appcompat/widget/M$c;,
        Landroidx/appcompat/widget/M$d;,
        Landroidx/appcompat/widget/M$g;,
        Landroidx/appcompat/widget/M$h;,
        Landroidx/appcompat/widget/M$i;,
        Landroidx/appcompat/widget/M$e;,
        Landroidx/appcompat/widget/M$f;
    }
.end annotation


# instance fields
.field private A:Landroid/widget/AdapterView$OnItemClickListener;

.field private B:Landroid/widget/AdapterView$OnItemSelectedListener;

.field final C:Landroidx/appcompat/widget/M$i;

.field private final D:Landroidx/appcompat/widget/M$h;

.field private final E:Landroidx/appcompat/widget/M$g;

.field private final F:Landroidx/appcompat/widget/M$e;

.field private G:Ljava/lang/Runnable;

.field final H:Landroid/os/Handler;

.field private final I:Landroid/graphics/Rect;

.field private J:Landroid/graphics/Rect;

.field private K:Z

.field L:Landroid/widget/PopupWindow;

.field private g:Landroid/content/Context;

.field private h:Landroid/widget/ListAdapter;

.field i:Landroidx/appcompat/widget/I;

.field private j:I

.field private k:I

.field private l:I

.field private m:I

.field private n:I

.field private o:Z

.field private p:Z

.field private q:Z

.field private r:I

.field private s:Z

.field private t:Z

.field u:I

.field private v:Landroid/view/View;

.field private w:I

.field private x:Landroid/database/DataSetObserver;

.field private y:Landroid/view/View;

.field private z:Landroid/graphics/drawable/Drawable;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v0, 0x0

    .line 1
    sget v1, Lf/a;->E:I

    invoke-direct {p0, p1, v0, v1}, Landroidx/appcompat/widget/M;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/appcompat/widget/M;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 3

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x2

    .line 4
    iput v0, p0, Landroidx/appcompat/widget/M;->j:I

    .line 5
    iput v0, p0, Landroidx/appcompat/widget/M;->k:I

    const/16 v0, 0x3ea

    .line 6
    iput v0, p0, Landroidx/appcompat/widget/M;->n:I

    const/4 v0, 0x0

    .line 7
    iput v0, p0, Landroidx/appcompat/widget/M;->r:I

    .line 8
    iput-boolean v0, p0, Landroidx/appcompat/widget/M;->s:Z

    .line 9
    iput-boolean v0, p0, Landroidx/appcompat/widget/M;->t:Z

    const v1, 0x7fffffff

    .line 10
    iput v1, p0, Landroidx/appcompat/widget/M;->u:I

    .line 11
    iput v0, p0, Landroidx/appcompat/widget/M;->w:I

    .line 12
    new-instance v1, Landroidx/appcompat/widget/M$i;

    invoke-direct {v1, p0}, Landroidx/appcompat/widget/M$i;-><init>(Landroidx/appcompat/widget/M;)V

    iput-object v1, p0, Landroidx/appcompat/widget/M;->C:Landroidx/appcompat/widget/M$i;

    .line 13
    new-instance v1, Landroidx/appcompat/widget/M$h;

    invoke-direct {v1, p0}, Landroidx/appcompat/widget/M$h;-><init>(Landroidx/appcompat/widget/M;)V

    iput-object v1, p0, Landroidx/appcompat/widget/M;->D:Landroidx/appcompat/widget/M$h;

    .line 14
    new-instance v1, Landroidx/appcompat/widget/M$g;

    invoke-direct {v1, p0}, Landroidx/appcompat/widget/M$g;-><init>(Landroidx/appcompat/widget/M;)V

    iput-object v1, p0, Landroidx/appcompat/widget/M;->E:Landroidx/appcompat/widget/M$g;

    .line 15
    new-instance v1, Landroidx/appcompat/widget/M$e;

    invoke-direct {v1, p0}, Landroidx/appcompat/widget/M$e;-><init>(Landroidx/appcompat/widget/M;)V

    iput-object v1, p0, Landroidx/appcompat/widget/M;->F:Landroidx/appcompat/widget/M$e;

    .line 16
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Landroidx/appcompat/widget/M;->I:Landroid/graphics/Rect;

    .line 17
    iput-object p1, p0, Landroidx/appcompat/widget/M;->g:Landroid/content/Context;

    .line 18
    new-instance v1, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Landroidx/appcompat/widget/M;->H:Landroid/os/Handler;

    .line 19
    sget-object v1, Lf/j;->l1:[I

    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 20
    sget v2, Lf/j;->m1:I

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, p0, Landroidx/appcompat/widget/M;->l:I

    .line 21
    sget v2, Lf/j;->n1:I

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v0

    iput v0, p0, Landroidx/appcompat/widget/M;->m:I

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 22
    iput-boolean v2, p0, Landroidx/appcompat/widget/M;->o:Z

    .line 23
    :cond_0
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 24
    new-instance v0, Landroidx/appcompat/widget/t;

    invoke-direct {v0, p1, p2, p3, p4}, Landroidx/appcompat/widget/t;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iput-object v0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 25
    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    return-void
.end method

.method private B(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroidx/appcompat/widget/M$d;->b(Landroid/widget/PopupWindow;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private d()I
    .locals 12

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 2
    .line 3
    const/high16 v1, -0x80000000

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    const/4 v3, 0x1

    .line 7
    const/4 v4, 0x0

    .line 8
    if-nez v0, :cond_6

    .line 9
    .line 10
    iget-object v0, p0, Landroidx/appcompat/widget/M;->g:Landroid/content/Context;

    .line 11
    .line 12
    new-instance v5, Landroidx/appcompat/widget/M$a;

    .line 13
    .line 14
    invoke-direct {v5, p0}, Landroidx/appcompat/widget/M$a;-><init>(Landroidx/appcompat/widget/M;)V

    .line 15
    .line 16
    .line 17
    iput-object v5, p0, Landroidx/appcompat/widget/M;->G:Ljava/lang/Runnable;

    .line 18
    .line 19
    iget-boolean v5, p0, Landroidx/appcompat/widget/M;->K:Z

    .line 20
    .line 21
    xor-int/2addr v5, v3

    .line 22
    invoke-virtual {p0, v0, v5}, Landroidx/appcompat/widget/M;->f(Landroid/content/Context;Z)Landroidx/appcompat/widget/I;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    iput-object v5, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 27
    .line 28
    iget-object v6, p0, Landroidx/appcompat/widget/M;->z:Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    if-eqz v6, :cond_0

    .line 31
    .line 32
    invoke-virtual {v5, v6}, Landroidx/appcompat/widget/I;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v5, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 36
    .line 37
    iget-object v6, p0, Landroidx/appcompat/widget/M;->h:Landroid/widget/ListAdapter;

    .line 38
    .line 39
    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 40
    .line 41
    .line 42
    iget-object v5, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 43
    .line 44
    iget-object v6, p0, Landroidx/appcompat/widget/M;->A:Landroid/widget/AdapterView$OnItemClickListener;

    .line 45
    .line 46
    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 47
    .line 48
    .line 49
    iget-object v5, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 50
    .line 51
    invoke-virtual {v5, v3}, Landroid/widget/ListView;->setFocusable(Z)V

    .line 52
    .line 53
    .line 54
    iget-object v5, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 55
    .line 56
    invoke-virtual {v5, v3}, Landroid/widget/ListView;->setFocusableInTouchMode(Z)V

    .line 57
    .line 58
    .line 59
    iget-object v5, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 60
    .line 61
    new-instance v6, Landroidx/appcompat/widget/M$b;

    .line 62
    .line 63
    invoke-direct {v6, p0}, Landroidx/appcompat/widget/M$b;-><init>(Landroidx/appcompat/widget/M;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 67
    .line 68
    .line 69
    iget-object v5, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 70
    .line 71
    iget-object v6, p0, Landroidx/appcompat/widget/M;->E:Landroidx/appcompat/widget/M$g;

    .line 72
    .line 73
    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 74
    .line 75
    .line 76
    iget-object v5, p0, Landroidx/appcompat/widget/M;->B:Landroid/widget/AdapterView$OnItemSelectedListener;

    .line 77
    .line 78
    if-eqz v5, :cond_1

    .line 79
    .line 80
    iget-object v6, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 81
    .line 82
    invoke-virtual {v6, v5}, Landroid/widget/ListView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 83
    .line 84
    .line 85
    :cond_1
    iget-object v5, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 86
    .line 87
    iget-object v6, p0, Landroidx/appcompat/widget/M;->v:Landroid/view/View;

    .line 88
    .line 89
    if-eqz v6, :cond_5

    .line 90
    .line 91
    new-instance v7, Landroid/widget/LinearLayout;

    .line 92
    .line 93
    invoke-direct {v7, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v7, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 97
    .line 98
    .line 99
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 100
    .line 101
    const/high16 v8, 0x3f800000    # 1.0f

    .line 102
    .line 103
    invoke-direct {v0, v2, v4, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 104
    .line 105
    .line 106
    iget v8, p0, Landroidx/appcompat/widget/M;->w:I

    .line 107
    .line 108
    if-eqz v8, :cond_3

    .line 109
    .line 110
    if-eq v8, v3, :cond_2

    .line 111
    .line 112
    new-instance v0, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    const-string v5, "Invalid hint position "

    .line 118
    .line 119
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    iget v5, p0, Landroidx/appcompat/widget/M;->w:I

    .line 123
    .line 124
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    const-string v5, "ListPopupWindow"

    .line 132
    .line 133
    invoke-static {v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_2
    invoke-virtual {v7, v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 141
    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_3
    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v7, v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 148
    .line 149
    .line 150
    :goto_0
    iget v0, p0, Landroidx/appcompat/widget/M;->k:I

    .line 151
    .line 152
    if-ltz v0, :cond_4

    .line 153
    .line 154
    move v5, v1

    .line 155
    goto :goto_1

    .line 156
    :cond_4
    move v0, v4

    .line 157
    move v5, v0

    .line 158
    :goto_1
    invoke-static {v0, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    invoke-virtual {v6, v0, v4}, Landroid/view/View;->measure(II)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 170
    .line 171
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    .line 172
    .line 173
    .line 174
    move-result v5

    .line 175
    iget v6, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 176
    .line 177
    add-int/2addr v5, v6

    .line 178
    iget v0, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 179
    .line 180
    add-int/2addr v5, v0

    .line 181
    move v0, v5

    .line 182
    move-object v5, v7

    .line 183
    goto :goto_2

    .line 184
    :cond_5
    move v0, v4

    .line 185
    :goto_2
    iget-object v6, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 186
    .line 187
    invoke-virtual {v6, v5}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 188
    .line 189
    .line 190
    goto :goto_3

    .line 191
    :cond_6
    iget-object v0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 192
    .line 193
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    check-cast v0, Landroid/view/ViewGroup;

    .line 198
    .line 199
    iget-object v0, p0, Landroidx/appcompat/widget/M;->v:Landroid/view/View;

    .line 200
    .line 201
    if-eqz v0, :cond_7

    .line 202
    .line 203
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 204
    .line 205
    .line 206
    move-result-object v5

    .line 207
    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 208
    .line 209
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    iget v6, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 214
    .line 215
    add-int/2addr v0, v6

    .line 216
    iget v5, v5, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 217
    .line 218
    add-int/2addr v0, v5

    .line 219
    goto :goto_3

    .line 220
    :cond_7
    move v0, v4

    .line 221
    :goto_3
    iget-object v5, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 222
    .line 223
    invoke-virtual {v5}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 224
    .line 225
    .line 226
    move-result-object v5

    .line 227
    if-eqz v5, :cond_8

    .line 228
    .line 229
    iget-object v6, p0, Landroidx/appcompat/widget/M;->I:Landroid/graphics/Rect;

    .line 230
    .line 231
    invoke-virtual {v5, v6}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 232
    .line 233
    .line 234
    iget-object v5, p0, Landroidx/appcompat/widget/M;->I:Landroid/graphics/Rect;

    .line 235
    .line 236
    iget v6, v5, Landroid/graphics/Rect;->top:I

    .line 237
    .line 238
    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    .line 239
    .line 240
    add-int/2addr v5, v6

    .line 241
    iget-boolean v7, p0, Landroidx/appcompat/widget/M;->o:Z

    .line 242
    .line 243
    if-nez v7, :cond_9

    .line 244
    .line 245
    neg-int v6, v6

    .line 246
    iput v6, p0, Landroidx/appcompat/widget/M;->m:I

    .line 247
    .line 248
    goto :goto_4

    .line 249
    :cond_8
    iget-object v5, p0, Landroidx/appcompat/widget/M;->I:Landroid/graphics/Rect;

    .line 250
    .line 251
    invoke-virtual {v5}, Landroid/graphics/Rect;->setEmpty()V

    .line 252
    .line 253
    .line 254
    move v5, v4

    .line 255
    :cond_9
    :goto_4
    iget-object v6, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 256
    .line 257
    invoke-virtual {v6}, Landroid/widget/PopupWindow;->getInputMethodMode()I

    .line 258
    .line 259
    .line 260
    move-result v6

    .line 261
    const/4 v7, 0x2

    .line 262
    if-ne v6, v7, :cond_a

    .line 263
    .line 264
    goto :goto_5

    .line 265
    :cond_a
    move v3, v4

    .line 266
    :goto_5
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->g()Landroid/view/View;

    .line 267
    .line 268
    .line 269
    move-result-object v4

    .line 270
    iget v6, p0, Landroidx/appcompat/widget/M;->m:I

    .line 271
    .line 272
    invoke-direct {p0, v4, v6, v3}, Landroidx/appcompat/widget/M;->h(Landroid/view/View;IZ)I

    .line 273
    .line 274
    .line 275
    move-result v3

    .line 276
    iget-boolean v4, p0, Landroidx/appcompat/widget/M;->s:Z

    .line 277
    .line 278
    if-nez v4, :cond_f

    .line 279
    .line 280
    iget v4, p0, Landroidx/appcompat/widget/M;->j:I

    .line 281
    .line 282
    if-ne v4, v2, :cond_b

    .line 283
    .line 284
    goto :goto_8

    .line 285
    :cond_b
    iget v4, p0, Landroidx/appcompat/widget/M;->k:I

    .line 286
    .line 287
    const/4 v6, -0x2

    .line 288
    if-eq v4, v6, :cond_d

    .line 289
    .line 290
    const/high16 v1, 0x40000000    # 2.0f

    .line 291
    .line 292
    if-eq v4, v2, :cond_c

    .line 293
    .line 294
    invoke-static {v4, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 295
    .line 296
    .line 297
    move-result v1

    .line 298
    :goto_6
    move v7, v1

    .line 299
    goto :goto_7

    .line 300
    :cond_c
    iget-object v2, p0, Landroidx/appcompat/widget/M;->g:Landroid/content/Context;

    .line 301
    .line 302
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 303
    .line 304
    .line 305
    move-result-object v2

    .line 306
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 307
    .line 308
    .line 309
    move-result-object v2

    .line 310
    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 311
    .line 312
    iget-object v4, p0, Landroidx/appcompat/widget/M;->I:Landroid/graphics/Rect;

    .line 313
    .line 314
    iget v6, v4, Landroid/graphics/Rect;->left:I

    .line 315
    .line 316
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 317
    .line 318
    add-int/2addr v6, v4

    .line 319
    sub-int/2addr v2, v6

    .line 320
    invoke-static {v2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 321
    .line 322
    .line 323
    move-result v1

    .line 324
    goto :goto_6

    .line 325
    :cond_d
    iget-object v2, p0, Landroidx/appcompat/widget/M;->g:Landroid/content/Context;

    .line 326
    .line 327
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 328
    .line 329
    .line 330
    move-result-object v2

    .line 331
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 332
    .line 333
    .line 334
    move-result-object v2

    .line 335
    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 336
    .line 337
    iget-object v4, p0, Landroidx/appcompat/widget/M;->I:Landroid/graphics/Rect;

    .line 338
    .line 339
    iget v6, v4, Landroid/graphics/Rect;->left:I

    .line 340
    .line 341
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 342
    .line 343
    add-int/2addr v6, v4

    .line 344
    sub-int/2addr v2, v6

    .line 345
    invoke-static {v2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 346
    .line 347
    .line 348
    move-result v1

    .line 349
    goto :goto_6

    .line 350
    :goto_7
    iget-object v6, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 351
    .line 352
    sub-int v10, v3, v0

    .line 353
    .line 354
    const/4 v11, -0x1

    .line 355
    const/4 v8, 0x0

    .line 356
    const/4 v9, -0x1

    .line 357
    invoke-virtual/range {v6 .. v11}, Landroidx/appcompat/widget/I;->d(IIIII)I

    .line 358
    .line 359
    .line 360
    move-result v1

    .line 361
    if-lez v1, :cond_e

    .line 362
    .line 363
    iget-object v2, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 364
    .line 365
    invoke-virtual {v2}, Landroid/widget/ListView;->getPaddingTop()I

    .line 366
    .line 367
    .line 368
    move-result v2

    .line 369
    iget-object p0, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 370
    .line 371
    invoke-virtual {p0}, Landroid/widget/ListView;->getPaddingBottom()I

    .line 372
    .line 373
    .line 374
    move-result p0

    .line 375
    add-int/2addr v2, p0

    .line 376
    add-int/2addr v5, v2

    .line 377
    add-int/2addr v0, v5

    .line 378
    :cond_e
    add-int/2addr v1, v0

    .line 379
    return v1

    .line 380
    :cond_f
    :goto_8
    add-int/2addr v3, v5

    .line 381
    return v3
.end method

.method private h(Landroid/view/View;IZ)I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-static {p0, p1, p2, p3}, Landroidx/appcompat/widget/M$c;->a(Landroid/widget/PopupWindow;Landroid/view/View;IZ)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private p()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/M;->v:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    instance-of v1, v0, Landroid/view/ViewGroup;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    check-cast v0, Landroid/view/ViewGroup;

    .line 14
    .line 15
    iget-object p0, p0, Landroidx/appcompat/widget/M;->v:Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method


# virtual methods
.method public A(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/appcompat/widget/M;->q:Z

    .line 3
    .line 4
    iput-boolean p1, p0, Landroidx/appcompat/widget/M;->p:Z

    .line 5
    .line 6
    return-void
.end method

.method public C(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/M;->w:I

    .line 2
    .line 3
    return-void
.end method

.method public D(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/I;->setListSelectionHidden(Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Landroid/widget/ListView;->setSelection(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/widget/ListView;->getChoiceMode()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    invoke-virtual {v0, p1, p0}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public E(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/M;->k:I

    .line 2
    .line 3
    return-void
.end method

.method public dismiss()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Landroidx/appcompat/widget/M;->p()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 16
    .line 17
    iget-object v0, p0, Landroidx/appcompat/widget/M;->H:Landroid/os/Handler;

    .line 18
    .line 19
    iget-object p0, p0, Landroidx/appcompat/widget/M;->C:Landroidx/appcompat/widget/M$i;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/I;->setListSelectionHidden(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/ListView;->requestLayout()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method f(Landroid/content/Context;Z)Landroidx/appcompat/widget/I;
    .locals 0

    .line 1
    new-instance p0, Landroidx/appcompat/widget/I;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/I;-><init>(Landroid/content/Context;Z)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public g()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/M;->y:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBackground()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getHorizontalOffset()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/appcompat/widget/M;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public getListView()Landroid/widget/ListView;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVerticalOffset()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/widget/M;->o:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Landroidx/appcompat/widget/M;->m:I

    .line 8
    .line 9
    return p0
.end method

.method public i()Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object p0, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/ListView;->getSelectedItem()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public isShowing()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-wide/high16 v0, -0x8000000000000000L

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    iget-object p0, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/widget/ListView;->getSelectedItemId()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    return-wide v0
.end method

.method public k()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, -0x1

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object p0, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/ListView;->getSelectedItemPosition()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public l()Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object p0, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/ListView;->getSelectedView()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public m()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/appcompat/widget/M;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public n()Z
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getInputMethodMode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x2

    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/appcompat/widget/M;->K:Z

    .line 2
    .line 3
    return p0
.end method

.method public q(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/M;->y:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method public r(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Landroidx/appcompat/widget/M;->I:Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Landroidx/appcompat/widget/M;->I:Landroid/graphics/Rect;

    .line 15
    .line 16
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 17
    .line 18
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 19
    .line 20
    add-int/2addr v1, v0

    .line 21
    add-int/2addr v1, p1

    .line 22
    iput v1, p0, Landroidx/appcompat/widget/M;->k:I

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/M;->E(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/M;->x:Landroid/database/DataSetObserver;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/appcompat/widget/M$f;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Landroidx/appcompat/widget/M$f;-><init>(Landroidx/appcompat/widget/M;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Landroidx/appcompat/widget/M;->x:Landroid/database/DataSetObserver;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v1, p0, Landroidx/appcompat/widget/M;->h:Landroid/widget/ListAdapter;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-interface {v1, v0}, Landroid/widget/ListAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    :goto_0
    iput-object p1, p0, Landroidx/appcompat/widget/M;->h:Landroid/widget/ListAdapter;

    .line 21
    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    iget-object v0, p0, Landroidx/appcompat/widget/M;->x:Landroid/database/DataSetObserver;

    .line 25
    .line 26
    invoke-interface {p1, v0}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object p1, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 30
    .line 31
    if-eqz p1, :cond_3

    .line 32
    .line 33
    iget-object p0, p0, Landroidx/appcompat/widget/M;->h:Landroid/widget/ListAdapter;

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 36
    .line 37
    .line 38
    :cond_3
    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setHorizontalOffset(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/M;->l:I

    .line 2
    .line 3
    return-void
.end method

.method public setVerticalOffset(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/M;->m:I

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Landroidx/appcompat/widget/M;->o:Z

    .line 5
    .line 6
    return-void
.end method

.method public show()V
    .locals 13

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/widget/M;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->n()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    iget v3, p0, Landroidx/appcompat/widget/M;->n:I

    .line 12
    .line 13
    invoke-static {v2, v3}, Landroidx/core/widget/g;->b(Landroid/widget/PopupWindow;I)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/4 v3, 0x1

    .line 23
    const/4 v4, -0x2

    .line 24
    const/4 v5, 0x0

    .line 25
    const/4 v6, -0x1

    .line 26
    if-eqz v2, :cond_c

    .line 27
    .line 28
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->g()Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-static {v2}, LJ/I;->N(Landroid/view/View;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_0

    .line 37
    .line 38
    goto/16 :goto_b

    .line 39
    .line 40
    :cond_0
    iget v2, p0, Landroidx/appcompat/widget/M;->k:I

    .line 41
    .line 42
    if-ne v2, v6, :cond_1

    .line 43
    .line 44
    move v2, v6

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    if-ne v2, v4, :cond_2

    .line 47
    .line 48
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->g()Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    :cond_2
    :goto_0
    iget v7, p0, Landroidx/appcompat/widget/M;->j:I

    .line 57
    .line 58
    if-ne v7, v6, :cond_7

    .line 59
    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_3
    move v0, v6

    .line 64
    :goto_1
    if-eqz v1, :cond_5

    .line 65
    .line 66
    iget-object v1, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 67
    .line 68
    iget v4, p0, Landroidx/appcompat/widget/M;->k:I

    .line 69
    .line 70
    if-ne v4, v6, :cond_4

    .line 71
    .line 72
    move v4, v6

    .line 73
    goto :goto_2

    .line 74
    :cond_4
    move v4, v5

    .line 75
    :goto_2
    invoke-virtual {v1, v4}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 79
    .line 80
    invoke-virtual {v1, v5}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 81
    .line 82
    .line 83
    goto :goto_4

    .line 84
    :cond_5
    iget-object v1, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 85
    .line 86
    iget v4, p0, Landroidx/appcompat/widget/M;->k:I

    .line 87
    .line 88
    if-ne v4, v6, :cond_6

    .line 89
    .line 90
    move v4, v6

    .line 91
    goto :goto_3

    .line 92
    :cond_6
    move v4, v5

    .line 93
    :goto_3
    invoke-virtual {v1, v4}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 97
    .line 98
    invoke-virtual {v1, v6}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 99
    .line 100
    .line 101
    goto :goto_4

    .line 102
    :cond_7
    if-ne v7, v4, :cond_8

    .line 103
    .line 104
    goto :goto_4

    .line 105
    :cond_8
    move v0, v7

    .line 106
    :goto_4
    iget-object v1, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 107
    .line 108
    iget-boolean v4, p0, Landroidx/appcompat/widget/M;->t:Z

    .line 109
    .line 110
    if-nez v4, :cond_9

    .line 111
    .line 112
    iget-boolean v4, p0, Landroidx/appcompat/widget/M;->s:Z

    .line 113
    .line 114
    if-nez v4, :cond_9

    .line 115
    .line 116
    goto :goto_5

    .line 117
    :cond_9
    move v3, v5

    .line 118
    :goto_5
    invoke-virtual {v1, v3}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 119
    .line 120
    .line 121
    iget-object v7, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 122
    .line 123
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->g()Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v8

    .line 127
    iget v9, p0, Landroidx/appcompat/widget/M;->l:I

    .line 128
    .line 129
    iget v10, p0, Landroidx/appcompat/widget/M;->m:I

    .line 130
    .line 131
    if-gez v2, :cond_a

    .line 132
    .line 133
    move v11, v6

    .line 134
    goto :goto_6

    .line 135
    :cond_a
    move v11, v2

    .line 136
    :goto_6
    if-gez v0, :cond_b

    .line 137
    .line 138
    move v12, v6

    .line 139
    goto :goto_7

    .line 140
    :cond_b
    move v12, v0

    .line 141
    :goto_7
    invoke-virtual/range {v7 .. v12}, Landroid/widget/PopupWindow;->update(Landroid/view/View;IIII)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_c
    iget v1, p0, Landroidx/appcompat/widget/M;->k:I

    .line 146
    .line 147
    if-ne v1, v6, :cond_d

    .line 148
    .line 149
    move v1, v6

    .line 150
    goto :goto_8

    .line 151
    :cond_d
    if-ne v1, v4, :cond_e

    .line 152
    .line 153
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->g()Landroid/view/View;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    :cond_e
    :goto_8
    iget v2, p0, Landroidx/appcompat/widget/M;->j:I

    .line 162
    .line 163
    if-ne v2, v6, :cond_f

    .line 164
    .line 165
    move v0, v6

    .line 166
    goto :goto_9

    .line 167
    :cond_f
    if-ne v2, v4, :cond_10

    .line 168
    .line 169
    goto :goto_9

    .line 170
    :cond_10
    move v0, v2

    .line 171
    :goto_9
    iget-object v2, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 172
    .line 173
    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 174
    .line 175
    .line 176
    iget-object v1, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 177
    .line 178
    invoke-virtual {v1, v0}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 179
    .line 180
    .line 181
    invoke-direct {p0, v3}, Landroidx/appcompat/widget/M;->B(Z)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 185
    .line 186
    iget-boolean v1, p0, Landroidx/appcompat/widget/M;->t:Z

    .line 187
    .line 188
    if-nez v1, :cond_11

    .line 189
    .line 190
    iget-boolean v1, p0, Landroidx/appcompat/widget/M;->s:Z

    .line 191
    .line 192
    if-nez v1, :cond_11

    .line 193
    .line 194
    goto :goto_a

    .line 195
    :cond_11
    move v3, v5

    .line 196
    :goto_a
    invoke-virtual {v0, v3}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 200
    .line 201
    iget-object v1, p0, Landroidx/appcompat/widget/M;->D:Landroidx/appcompat/widget/M$h;

    .line 202
    .line 203
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setTouchInterceptor(Landroid/view/View$OnTouchListener;)V

    .line 204
    .line 205
    .line 206
    iget-boolean v0, p0, Landroidx/appcompat/widget/M;->q:Z

    .line 207
    .line 208
    if-eqz v0, :cond_12

    .line 209
    .line 210
    iget-object v0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 211
    .line 212
    iget-boolean v1, p0, Landroidx/appcompat/widget/M;->p:Z

    .line 213
    .line 214
    invoke-static {v0, v1}, Landroidx/core/widget/g;->a(Landroid/widget/PopupWindow;Z)V

    .line 215
    .line 216
    .line 217
    :cond_12
    iget-object v0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 218
    .line 219
    iget-object v1, p0, Landroidx/appcompat/widget/M;->J:Landroid/graphics/Rect;

    .line 220
    .line 221
    invoke-static {v0, v1}, Landroidx/appcompat/widget/M$d;->a(Landroid/widget/PopupWindow;Landroid/graphics/Rect;)V

    .line 222
    .line 223
    .line 224
    iget-object v0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 225
    .line 226
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->g()Landroid/view/View;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    iget v2, p0, Landroidx/appcompat/widget/M;->l:I

    .line 231
    .line 232
    iget v3, p0, Landroidx/appcompat/widget/M;->m:I

    .line 233
    .line 234
    iget v4, p0, Landroidx/appcompat/widget/M;->r:I

    .line 235
    .line 236
    invoke-static {v0, v1, v2, v3, v4}, Landroidx/core/widget/g;->c(Landroid/widget/PopupWindow;Landroid/view/View;III)V

    .line 237
    .line 238
    .line 239
    iget-object v0, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 240
    .line 241
    invoke-virtual {v0, v6}, Landroid/widget/ListView;->setSelection(I)V

    .line 242
    .line 243
    .line 244
    iget-boolean v0, p0, Landroidx/appcompat/widget/M;->K:Z

    .line 245
    .line 246
    if-eqz v0, :cond_13

    .line 247
    .line 248
    iget-object v0, p0, Landroidx/appcompat/widget/M;->i:Landroidx/appcompat/widget/I;

    .line 249
    .line 250
    invoke-virtual {v0}, Landroidx/appcompat/widget/I;->isInTouchMode()Z

    .line 251
    .line 252
    .line 253
    move-result v0

    .line 254
    if-eqz v0, :cond_14

    .line 255
    .line 256
    :cond_13
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->e()V

    .line 257
    .line 258
    .line 259
    :cond_14
    iget-boolean v0, p0, Landroidx/appcompat/widget/M;->K:Z

    .line 260
    .line 261
    if-nez v0, :cond_15

    .line 262
    .line 263
    iget-object v0, p0, Landroidx/appcompat/widget/M;->H:Landroid/os/Handler;

    .line 264
    .line 265
    iget-object p0, p0, Landroidx/appcompat/widget/M;->F:Landroidx/appcompat/widget/M$e;

    .line 266
    .line 267
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 268
    .line 269
    .line 270
    :cond_15
    :goto_b
    return-void
.end method

.method public t(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/M;->r:I

    .line 2
    .line 3
    return-void
.end method

.method public u(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    iput-object v0, p0, Landroidx/appcompat/widget/M;->J:Landroid/graphics/Rect;

    .line 11
    .line 12
    return-void
.end method

.method public v(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/appcompat/widget/M;->K:Z

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public x(Landroid/widget/PopupWindow$OnDismissListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/M;->L:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public y(Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/M;->A:Landroid/widget/AdapterView$OnItemClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public z(Landroid/widget/AdapterView$OnItemSelectedListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/M;->B:Landroid/widget/AdapterView$OnItemSelectedListener;

    .line 2
    .line 3
    return-void
.end method
