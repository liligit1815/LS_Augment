.class public Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;
.super Lcom/android/launcher3/a;
.source "KeyboardDragAndDropView.java"

# interfaces
.implements Lcom/android/launcher3/g1;
.implements Lcom/android/launcher3/statemanager/d$g;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$a;,
        Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/a;",
        "Lcom/android/launcher3/g1;",
        "Lcom/android/launcher3/statemanager/d$g<",
        "Lcom/android/launcher3/V3;",
        ">;"
    }
.end annotation


# instance fields
.field private final g:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final h:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "LO0/d;",
            ">;"
        }
    .end annotation
.end field

.field private final i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;",
            ">;"
        }
    .end annotation
.end field

.field private final j:Landroid/graphics/Rect;

.field private final k:Landroid/graphics/Rect;

.field private final l:LK/d;

.field private final m:Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$a;

.field private final n:Lcom/android/launcher3/C2;

.field private o:Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->g:Ljava/util/ArrayList;

    .line 4
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->h:Ljava/util/ArrayList;

    .line 5
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->i:Ljava/util/ArrayList;

    .line 6
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->j:Landroid/graphics/Rect;

    .line 7
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->k:Landroid/graphics/Rect;

    .line 8
    invoke-static {}, LK/d;->W()LK/d;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->l:LK/d;

    .line 9
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->n:Lcom/android/launcher3/C2;

    .line 10
    new-instance p1, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$a;

    invoke-direct {p1, p0}, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$a;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->m:Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$a;

    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setWillNotDraw(Z)V

    return-void
.end method

.method public static synthetic N(Landroid/graphics/Rect;Landroid/graphics/Rect;)I
    .locals 0

    .line 1
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 2
    .line 3
    iget p0, p0, Landroid/graphics/Rect;->top:I

    .line 4
    .line 5
    sub-int/2addr p1, p0

    .line 6
    return p1
.end method

.method public static synthetic O(Landroid/graphics/Rect;Landroid/graphics/Rect;)I
    .locals 0

    .line 1
    iget p0, p0, Landroid/graphics/Rect;->left:I

    .line 2
    .line 3
    iget p1, p1, Landroid/graphics/Rect;->left:I

    .line 4
    .line 5
    sub-int/2addr p0, p1

    .line 6
    return p0
.end method

.method public static synthetic Q(Landroid/graphics/Rect;Landroid/graphics/Rect;)I
    .locals 0

    .line 1
    iget p0, p0, Landroid/graphics/Rect;->top:I

    .line 2
    .line 3
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 4
    .line 5
    sub-int/2addr p0, p1

    .line 6
    return p0
.end method

.method public static synthetic R(Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;LO0/d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->W(LO0/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S(Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;LO0/d;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->V(LO0/d;Ljava/lang/Integer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic T(Landroid/graphics/Rect;Landroid/graphics/Rect;)I
    .locals 0

    .line 1
    iget p1, p1, Landroid/graphics/Rect;->left:I

    .line 2
    .line 3
    iget p0, p0, Landroid/graphics/Rect;->left:I

    .line 4
    .line 5
    sub-int/2addr p1, p0

    .line 6
    return p1
.end method

.method private U(I)Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->i:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->n:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->n:Lcom/android/launcher3/C2;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->getContent()Lcom/android/launcher3/folder/FolderPagedView;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    :goto_0
    invoke-virtual {v1}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    const/4 v3, 0x0

    .line 35
    move v4, v3

    .line 36
    :goto_1
    if-ge v4, v2, :cond_1

    .line 37
    .line 38
    iget-object v5, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->h:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v6

    .line 44
    check-cast v6, Lcom/android/launcher3/CellLayout;

    .line 45
    .line 46
    invoke-virtual {v6}, Lcom/android/launcher3/CellLayout;->getDragAndDropAccessibilityDelegate()LO0/d;

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    add-int/lit8 v4, v4, 0x1

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    const/4 v2, 0x1

    .line 57
    if-nez v0, :cond_2

    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->h:Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-virtual {v1}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    add-int/2addr v1, v2

    .line 66
    iget-object v4, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->n:Lcom/android/launcher3/C2;

    .line 67
    .line 68
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    invoke-virtual {v4}, Lcom/android/launcher3/CellLayout;->getDragAndDropAccessibilityDelegate()LO0/d;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-virtual {v0, v1, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->h:Ljava/util/ArrayList;

    .line 80
    .line 81
    new-instance v1, Lv1/c;

    .line 82
    .line 83
    invoke-direct {v1, p0}, Lv1/c;-><init>(Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->i:Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    const/4 v1, 0x0

    .line 96
    if-eqz v0, :cond_3

    .line 97
    .line 98
    return-object v1

    .line 99
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->i:Ljava/util/ArrayList;

    .line 100
    .line 101
    iget-object v4, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->o:Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;

    .line 102
    .line 103
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    iget-object v4, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->o:Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;

    .line 108
    .line 109
    if-eqz v4, :cond_e

    .line 110
    .line 111
    if-gez v0, :cond_4

    .line 112
    .line 113
    goto/16 :goto_5

    .line 114
    .line 115
    :cond_4
    iget-object v4, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->i:Ljava/util/ArrayList;

    .line 116
    .line 117
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 118
    .line 119
    .line 120
    move-result v4

    .line 121
    if-eq p1, v2, :cond_d

    .line 122
    .line 123
    const/4 v5, 0x2

    .line 124
    if-eq p1, v5, :cond_c

    .line 125
    .line 126
    const/16 v0, 0x11

    .line 127
    .line 128
    if-eq p1, v0, :cond_8

    .line 129
    .line 130
    const/16 v0, 0x21

    .line 131
    .line 132
    if-eq p1, v0, :cond_7

    .line 133
    .line 134
    const/16 v0, 0x42

    .line 135
    .line 136
    if-eq p1, v0, :cond_6

    .line 137
    .line 138
    const/16 v0, 0x82

    .line 139
    .line 140
    if-eq p1, v0, :cond_5

    .line 141
    .line 142
    return-object v1

    .line 143
    :cond_5
    new-instance p1, Lv1/i;

    .line 144
    .line 145
    invoke-direct {p1}, Lv1/i;-><init>()V

    .line 146
    .line 147
    .line 148
    new-instance v0, Lv1/h;

    .line 149
    .line 150
    invoke-direct {v0}, Lv1/h;-><init>()V

    .line 151
    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_6
    new-instance p1, Lv1/d;

    .line 155
    .line 156
    invoke-direct {p1}, Lv1/d;-><init>()V

    .line 157
    .line 158
    .line 159
    new-instance v0, Lv1/e;

    .line 160
    .line 161
    invoke-direct {v0}, Lv1/e;-><init>()V

    .line 162
    .line 163
    .line 164
    goto :goto_2

    .line 165
    :cond_7
    new-instance p1, Lv1/g;

    .line 166
    .line 167
    invoke-direct {p1}, Lv1/g;-><init>()V

    .line 168
    .line 169
    .line 170
    new-instance v0, Lv1/h;

    .line 171
    .line 172
    invoke-direct {v0}, Lv1/h;-><init>()V

    .line 173
    .line 174
    .line 175
    goto :goto_2

    .line 176
    :cond_8
    new-instance p1, Lv1/f;

    .line 177
    .line 178
    invoke-direct {p1}, Lv1/f;-><init>()V

    .line 179
    .line 180
    .line 181
    new-instance v0, Lv1/e;

    .line 182
    .line 183
    invoke-direct {v0}, Lv1/e;-><init>()V

    .line 184
    .line 185
    .line 186
    :goto_2
    iget-object v2, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->o:Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;

    .line 187
    .line 188
    iget-object v5, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->l:LK/d;

    .line 189
    .line 190
    invoke-virtual {v2, v5}, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;->a(LK/d;)LK/d;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    iget-object v5, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->j:Landroid/graphics/Rect;

    .line 195
    .line 196
    invoke-virtual {v2, v5}, LK/d;->l(Landroid/graphics/Rect;)V

    .line 197
    .line 198
    .line 199
    const v2, 0x7f7fffff    # Float.MAX_VALUE

    .line 200
    .line 201
    .line 202
    :goto_3
    if-ge v3, v4, :cond_b

    .line 203
    .line 204
    iget-object v5, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->i:Ljava/util/ArrayList;

    .line 205
    .line 206
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object v5

    .line 210
    check-cast v5, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;

    .line 211
    .line 212
    iget-object v6, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->l:LK/d;

    .line 213
    .line 214
    invoke-virtual {v5, v6}, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;->a(LK/d;)LK/d;

    .line 215
    .line 216
    .line 217
    move-result-object v6

    .line 218
    iget-object v7, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->k:Landroid/graphics/Rect;

    .line 219
    .line 220
    invoke-virtual {v6, v7}, LK/d;->l(Landroid/graphics/Rect;)V

    .line 221
    .line 222
    .line 223
    iget-object v6, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->j:Landroid/graphics/Rect;

    .line 224
    .line 225
    iget-object v7, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->k:Landroid/graphics/Rect;

    .line 226
    .line 227
    invoke-interface {p1, v6, v7}, Ljava/util/function/ToIntBiFunction;->applyAsInt(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 228
    .line 229
    .line 230
    move-result v6

    .line 231
    if-gtz v6, :cond_9

    .line 232
    .line 233
    goto :goto_4

    .line 234
    :cond_9
    iget-object v7, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->k:Landroid/graphics/Rect;

    .line 235
    .line 236
    invoke-interface {v0, v7}, Ljava/util/function/ToIntFunction;->applyAsInt(Ljava/lang/Object;)I

    .line 237
    .line 238
    .line 239
    move-result v7

    .line 240
    iget-object v8, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->j:Landroid/graphics/Rect;

    .line 241
    .line 242
    invoke-interface {v0, v8}, Ljava/util/function/ToIntFunction;->applyAsInt(Ljava/lang/Object;)I

    .line 243
    .line 244
    .line 245
    move-result v8

    .line 246
    sub-int/2addr v7, v8

    .line 247
    mul-int/2addr v6, v6

    .line 248
    int-to-long v8, v6

    .line 249
    mul-int/2addr v7, v7

    .line 250
    int-to-long v6, v7

    .line 251
    const-wide/16 v10, 0xd

    .line 252
    .line 253
    mul-long/2addr v6, v10

    .line 254
    add-long/2addr v8, v6

    .line 255
    long-to-float v6, v8

    .line 256
    cmpg-float v7, v6, v2

    .line 257
    .line 258
    if-gez v7, :cond_a

    .line 259
    .line 260
    move-object v1, v5

    .line 261
    move v2, v6

    .line 262
    :cond_a
    :goto_4
    add-int/lit8 v3, v3, 0x1

    .line 263
    .line 264
    goto :goto_3

    .line 265
    :cond_b
    return-object v1

    .line 266
    :cond_c
    iget-object p0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->i:Ljava/util/ArrayList;

    .line 267
    .line 268
    add-int/2addr v0, v2

    .line 269
    rem-int/2addr v0, v4

    .line 270
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    check-cast p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;

    .line 275
    .line 276
    return-object p0

    .line 277
    :cond_d
    iget-object p0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->i:Ljava/util/ArrayList;

    .line 278
    .line 279
    add-int/2addr v0, v4

    .line 280
    sub-int/2addr v0, v2

    .line 281
    rem-int/2addr v0, v4

    .line 282
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    check-cast p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;

    .line 287
    .line 288
    return-object p0

    .line 289
    :cond_e
    :goto_5
    return-object v1
.end method

.method private synthetic V(LO0/d;Ljava/lang/Integer;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->i:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-direct {v0, p1, p2}, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;-><init>(LO0/d;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private synthetic W(LO0/d;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->g:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, LO0/d;->D(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->g:Ljava/util/ArrayList;

    .line 12
    .line 13
    new-instance v1, Lv1/j;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Lv1/j;-><init>(Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;LO0/d;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private setCurrentSelection(Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;)V
    .locals 10

    .line 1
    const/4 v0, 0x3

    .line 2
    const/4 v1, 0x2

    .line 3
    const/4 v2, 0x1

    .line 4
    iput-object p1, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->o:Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;

    .line 5
    .line 6
    const v3, 0x7f0b0334

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    check-cast v3, Landroid/widget/TextView;

    .line 14
    .line 15
    iget-object v4, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->l:LK/d;

    .line 16
    .line 17
    invoke-virtual {p1, v4}, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;->a(LK/d;)LK/d;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    invoke-virtual {v4}, LK/d;->s()Ljava/lang/CharSequence;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    new-instance v3, Landroid/graphics/Rect;

    .line 29
    .line 30
    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 31
    .line 32
    .line 33
    iget-object v4, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->l:LK/d;

    .line 34
    .line 35
    invoke-virtual {v4, v3}, LK/d;->k(Landroid/graphics/Rect;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p1, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;->a:LO0/d;

    .line 39
    .line 40
    invoke-virtual {p1}, LO0/d;->Y()Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    instance-of v5, v4, Lcom/android/launcher3/V4;

    .line 49
    .line 50
    const/4 v6, 0x0

    .line 51
    if-eqz v5, :cond_0

    .line 52
    .line 53
    check-cast v4, Lcom/android/launcher3/V4;

    .line 54
    .line 55
    invoke-virtual {v4, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    invoke-virtual {v4, v5}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getScrollX()I

    .line 63
    .line 64
    .line 65
    move-result v7

    .line 66
    invoke-virtual {v4, v5}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    sub-int/2addr v7, v4

    .line 71
    invoke-virtual {v3, v7, v6}, Landroid/graphics/Rect;->offset(II)V

    .line 72
    .line 73
    .line 74
    :cond_0
    iget v4, v3, Landroid/graphics/Rect;->left:I

    .line 75
    .line 76
    int-to-float v4, v4

    .line 77
    iget v5, v3, Landroid/graphics/Rect;->top:I

    .line 78
    .line 79
    int-to-float v5, v5

    .line 80
    iget v7, v3, Landroid/graphics/Rect;->right:I

    .line 81
    .line 82
    int-to-float v7, v7

    .line 83
    iget v8, v3, Landroid/graphics/Rect;->bottom:I

    .line 84
    .line 85
    int-to-float v8, v8

    .line 86
    const/4 v9, 0x4

    .line 87
    new-array v9, v9, [F

    .line 88
    .line 89
    aput v4, v9, v6

    .line 90
    .line 91
    aput v5, v9, v2

    .line 92
    .line 93
    aput v7, v9, v1

    .line 94
    .line 95
    aput v8, v9, v0

    .line 96
    .line 97
    iget-object v4, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->n:Lcom/android/launcher3/C2;

    .line 98
    .line 99
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    invoke-static {p1, v4, v9, v2}, Lcom/android/launcher3/N5;->m(Landroid/view/View;Landroid/view/View;[FZ)F

    .line 104
    .line 105
    .line 106
    new-instance p1, Landroid/graphics/RectF;

    .line 107
    .line 108
    aget v4, v9, v6

    .line 109
    .line 110
    aget v5, v9, v2

    .line 111
    .line 112
    aget v1, v9, v1

    .line 113
    .line 114
    aget v0, v9, v0

    .line 115
    .line 116
    invoke-direct {p1, v4, v5, v1, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1, v3}, Landroid/graphics/RectF;->roundOut(Landroid/graphics/Rect;)V

    .line 120
    .line 121
    .line 122
    iget-object p0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->m:Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$a;

    .line 123
    .line 124
    invoke-virtual {p0, v3, v2}, Lcom/android/launcher3/keyboard/a;->d(Ljava/lang/Object;Z)V

    .line 125
    .line 126
    .line 127
    return-void
.end method


# virtual methods
.method public X(Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->o:Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->setCurrentSelection(Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Y(Lcom/android/launcher3/V3;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/V3;->q:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/android/launcher3/V3;->r:Lcom/android/launcher3/V3;

    .line 6
    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->close(Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public Z(Landroid/view/View;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/dragndrop/p;)V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->n:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->n:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1, p0}, Lcom/android/launcher3/statemanager/d;->j(Lcom/android/launcher3/statemanager/d$g;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-interface {v1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/android/launcher3/CellLayout;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    const/4 v3, 0x2

    .line 37
    div-int/2addr v2, v3

    .line 38
    int-to-float v2, v2

    .line 39
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    div-int/2addr v4, v3

    .line 44
    int-to-float v4, v4

    .line 45
    new-array v3, v3, [F

    .line 46
    .line 47
    const/4 v5, 0x0

    .line 48
    aput v2, v3, v5

    .line 49
    .line 50
    aput v4, v3, v0

    .line 51
    .line 52
    invoke-static {p1, v1, v3, v5}, Lcom/android/launcher3/N5;->m(Landroid/view/View;Landroid/view/View;[FZ)F

    .line 53
    .line 54
    .line 55
    iget-object v2, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->n:Lcom/android/launcher3/C2;

    .line 56
    .line 57
    invoke-static {p1, v2, p2, p3}, Lcom/android/launcher3/touch/A;->c(Landroid/view/View;Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/dragndrop/p;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getDragAndDropAccessibilityDelegate()LO0/d;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    new-instance p2, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;

    .line 65
    .line 66
    aget p3, v3, v5

    .line 67
    .line 68
    aget v0, v3, v0

    .line 69
    .line 70
    invoke-virtual {p1, p3, v0}, LO0/d;->C(FF)I

    .line 71
    .line 72
    .line 73
    move-result p3

    .line 74
    invoke-direct {p2, p1, p3}, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;-><init>(LO0/d;I)V

    .line 75
    .line 76
    .line 77
    invoke-direct {p0, p2}, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->setCurrentSelection(Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->n:Lcom/android/launcher3/C2;

    .line 81
    .line 82
    invoke-virtual {p1, v5}, Landroid/app/Activity;->setDefaultKeyMode(I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestFocus()Z

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public dispatchUnhandledMove(Landroid/view/View;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->U(I)Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->setCurrentSelection(Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method protected handleClose(Z)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->n:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->n:Lcom/android/launcher3/C2;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1, p0}, Lcom/android/launcher3/statemanager/d;->b0(Lcom/android/launcher3/statemanager/d$g;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->n:Lcom/android/launcher3/C2;

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setDefaultKeyMode(I)V

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    iput-boolean p1, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 27
    .line 28
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    and-int/lit16 p0, p1, 0x400

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->m:Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/keyboard/a;->e(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    const/16 v0, 0x42

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->o:Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, v0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;->a:LO0/d;

    .line 10
    .line 11
    iget p1, v0, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView$b;->b:I

    .line 12
    .line 13
    const/16 p2, 0x10

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, p1, p2, v0}, LO0/d;->K(IILandroid/os/Bundle;)Z

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onKeyUp(ILandroid/view/KeyEvent;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public bridge synthetic onStateTransitionComplete(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->X(Lcom/android/launcher3/V3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onStateTransitionStart(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/keyboard/KeyboardDragAndDropView;->Y(Lcom/android/launcher3/V3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 2
    .line 3
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 4
    .line 5
    iget v2, p1, Landroid/graphics/Rect;->right:I

    .line 6
    .line 7
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1, v2, p1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
