.class public Lcom/android/launcher3/widget/C;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "ComponentsListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/C$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/android/launcher3/widget/i;",
        ">;"
    }
.end annotation


# instance fields
.field protected final a:Landroid/view/LayoutInflater;

.field protected b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lm2/g;",
            ">;"
        }
    .end annotation
.end field

.field protected c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/v;",
            ">;"
        }
    .end annotation
.end field

.field protected d:Landroid/content/Context;

.field protected final e:Landroid/view/View$OnClickListener;

.field protected final f:Landroid/view/View$OnLongClickListener;

.field protected g:Landroid/graphics/drawable/Drawable;

.field private h:I

.field protected i:Ls1/P;

.field public j:Lcom/android/launcher3/widget/ComponentsFullSheet;

.field private k:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/LayoutInflater;Ls1/P;Lcom/android/launcher3/widget/ComponentsFullSheet;Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/widget/C;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/android/launcher3/widget/C;->a:Landroid/view/LayoutInflater;

    .line 12
    .line 13
    new-instance p2, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p2, p0, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 19
    .line 20
    iput-object p5, p0, Lcom/android/launcher3/widget/C;->e:Landroid/view/View$OnClickListener;

    .line 21
    .line 22
    iput-object p6, p0, Lcom/android/launcher3/widget/C;->f:Landroid/view/View$OnLongClickListener;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/android/launcher3/widget/C;->d:Landroid/content/Context;

    .line 25
    .line 26
    iput-object p3, p0, Lcom/android/launcher3/widget/C;->i:Ls1/P;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const p2, 0x7f0701f5

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iput p1, p0, Lcom/android/launcher3/widget/C;->h:I

    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/launcher3/widget/C;->d:Landroid/content/Context;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const p2, 0x7f0809e0

    .line 48
    .line 49
    .line 50
    const/4 p3, 0x0

    .line 51
    invoke-virtual {p1, p2, p3}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p0, Lcom/android/launcher3/widget/C;->g:Landroid/graphics/drawable/Drawable;

    .line 56
    .line 57
    iget-object p2, p0, Lcom/android/launcher3/widget/C;->d:Landroid/content/Context;

    .line 58
    .line 59
    const p3, 0x7f06026c

    .line 60
    .line 61
    .line 62
    invoke-static {p2, p3}, Lz/a;->c(Landroid/content/Context;I)I

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/android/launcher3/widget/C;->g:Landroid/graphics/drawable/Drawable;

    .line 70
    .line 71
    const/4 p2, 0x0

    .line 72
    iget p3, p0, Lcom/android/launcher3/widget/C;->h:I

    .line 73
    .line 74
    invoke-virtual {p1, p2, p2, p3, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 75
    .line 76
    .line 77
    iput-object p4, p0, Lcom/android/launcher3/widget/C;->j:Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 78
    .line 79
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/widget/C;Lm2/g;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/C;->k(Lm2/g;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/launcher3/widget/C;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Lm2/g;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/android/launcher3/widget/C;->j(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Lm2/g;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/android/launcher3/widget/C;Lm2/g;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/C;->l(Lm2/g;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private i(Ljava/util/ArrayList;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lm2/g;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 13
    .line 14
    new-instance v0, Lcom/android/launcher3/widget/v;

    .line 15
    .line 16
    const/4 v1, 0x4

    .line 17
    invoke-direct {v0, v1}, Lcom/android/launcher3/widget/v;-><init>(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    new-instance v8, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance v7, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    new-instance v5, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .line 46
    .line 47
    new-instance v6, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    new-instance v2, Lcom/android/launcher3/widget/z;

    .line 53
    .line 54
    move-object v3, p0

    .line 55
    invoke-direct/range {v2 .. v8}, Lcom/android/launcher3/widget/z;-><init>(Lcom/android/launcher3/widget/C;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    const/4 p1, 0x0

    .line 66
    if-nez p0, :cond_3

    .line 67
    .line 68
    move p0, p1

    .line 69
    :goto_0
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-ge p0, v0, :cond_3

    .line 74
    .line 75
    add-int/lit8 v0, p0, 0x1

    .line 76
    .line 77
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-ge v0, v1, :cond_2

    .line 82
    .line 83
    new-instance v0, Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 86
    .line 87
    .line 88
    move v1, p1

    .line 89
    :goto_1
    iget v2, v3, Lcom/android/launcher3/widget/C;->k:I

    .line 90
    .line 91
    if-ge v1, v2, :cond_1

    .line 92
    .line 93
    add-int v2, p0, v1

    .line 94
    .line 95
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 96
    .line 97
    .line 98
    move-result v9

    .line 99
    if-ge v2, v9, :cond_1

    .line 100
    .line 101
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    check-cast v2, Lm2/g;

    .line 106
    .line 107
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    add-int/lit8 v1, v1, 0x1

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_1
    iget-object v1, v3, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 114
    .line 115
    new-instance v2, Lcom/android/launcher3/widget/v;

    .line 116
    .line 117
    invoke-direct {v2, v0}, Lcom/android/launcher3/widget/v;-><init>(Ljava/util/ArrayList;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_2
    iget-object v0, v3, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 125
    .line 126
    new-instance v1, Lcom/android/launcher3/widget/v;

    .line 127
    .line 128
    invoke-virtual {v4, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    check-cast v2, Lm2/g;

    .line 133
    .line 134
    invoke-direct {v1, v2}, Lcom/android/launcher3/widget/v;-><init>(Lm2/g;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    :goto_2
    iget v0, v3, Lcom/android/launcher3/widget/C;->k:I

    .line 141
    .line 142
    add-int/2addr p0, v0

    .line 143
    goto :goto_0

    .line 144
    :cond_3
    new-instance p0, Lcom/android/launcher3/widget/A;

    .line 145
    .line 146
    invoke-direct {p0, v3}, Lcom/android/launcher3/widget/A;-><init>(Lcom/android/launcher3/widget/C;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v8, p0}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    if-nez p0, :cond_6

    .line 157
    .line 158
    move p0, p1

    .line 159
    :goto_3
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-ge p0, v0, :cond_6

    .line 164
    .line 165
    add-int/lit8 v0, p0, 0x1

    .line 166
    .line 167
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    if-ge v0, v1, :cond_5

    .line 172
    .line 173
    new-instance v0, Ljava/util/ArrayList;

    .line 174
    .line 175
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 176
    .line 177
    .line 178
    move v1, p1

    .line 179
    :goto_4
    iget v2, v3, Lcom/android/launcher3/widget/C;->k:I

    .line 180
    .line 181
    if-ge v1, v2, :cond_4

    .line 182
    .line 183
    add-int v2, p0, v1

    .line 184
    .line 185
    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    check-cast v2, Lm2/g;

    .line 190
    .line 191
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    add-int/lit8 v1, v1, 0x1

    .line 195
    .line 196
    goto :goto_4

    .line 197
    :cond_4
    iget-object v1, v3, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 198
    .line 199
    new-instance v2, Lcom/android/launcher3/widget/v;

    .line 200
    .line 201
    invoke-direct {v2, v0}, Lcom/android/launcher3/widget/v;-><init>(Ljava/util/ArrayList;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    goto :goto_5

    .line 208
    :cond_5
    iget-object v0, v3, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 209
    .line 210
    new-instance v1, Lcom/android/launcher3/widget/v;

    .line 211
    .line 212
    invoke-virtual {v7, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v2

    .line 216
    check-cast v2, Lm2/g;

    .line 217
    .line 218
    invoke-direct {v1, v2}, Lcom/android/launcher3/widget/v;-><init>(Lm2/g;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    :goto_5
    iget v0, v3, Lcom/android/launcher3/widget/C;->k:I

    .line 225
    .line 226
    add-int/2addr p0, v0

    .line 227
    goto :goto_3

    .line 228
    :cond_6
    new-instance p0, Lcom/android/launcher3/widget/B;

    .line 229
    .line 230
    invoke-direct {p0, v3}, Lcom/android/launcher3/widget/B;-><init>(Lcom/android/launcher3/widget/C;)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {v5, p0}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    .line 237
    .line 238
    .line 239
    move-result p0

    .line 240
    if-nez p0, :cond_7

    .line 241
    .line 242
    iget-object p0, v3, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 243
    .line 244
    new-instance p1, Lcom/android/launcher3/widget/v;

    .line 245
    .line 246
    const/4 v0, 0x3

    .line 247
    invoke-direct {p1, v6, v0}, Lcom/android/launcher3/widget/v;-><init>(Ljava/util/ArrayList;I)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    :cond_7
    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 254
    .line 255
    .line 256
    return-void
.end method

.method private synthetic j(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Lm2/g;)V
    .locals 1

    .line 1
    iget-object v0, p6, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Lf1/d;->j(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 12
    .line 13
    new-instance p1, Lcom/android/launcher3/widget/v;

    .line 14
    .line 15
    invoke-direct {p1, p6}, Lcom/android/launcher3/widget/v;-><init>(Lm2/g;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget v0, p6, Lm2/g;->d:I

    .line 23
    .line 24
    if-lez v0, :cond_3

    .line 25
    .line 26
    invoke-virtual {p6}, Lm2/g;->e()Lz1/Z4;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-direct {p0, p2}, Lcom/android/launcher3/widget/C;->r(Lz1/Z4;)V

    .line 31
    .line 32
    .line 33
    iget p0, p2, Lz1/Z4;->i:I

    .line 34
    .line 35
    const/4 p3, 0x2

    .line 36
    if-gt p0, p3, :cond_2

    .line 37
    .line 38
    iget p0, p2, Lz1/Z4;->j:I

    .line 39
    .line 40
    if-gt p0, p3, :cond_1

    .line 41
    .line 42
    invoke-virtual {p1, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    const-string p1, "createComponentEntry: add long items , widgetItem = "

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget-object p1, p2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string p1, " , spanX = "

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget p1, p2, Lz1/Z4;->i:I

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string p1, ", spanY = "

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget p1, p2, Lz1/Z4;->j:I

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    const-string p1, "ComponentsListAdapter"

    .line 86
    .line 87
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    invoke-virtual {p4, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_2
    invoke-virtual {p5, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_3
    invoke-virtual {p6}, Lm2/g;->e()Lz1/Z4;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    iget-object p0, p0, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 103
    .line 104
    invoke-static {p0}, Lf1/d;->a(Landroid/content/ComponentName;)Z

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-eqz p0, :cond_4

    .line 109
    .line 110
    invoke-virtual {p2, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_4
    instance-of p0, p6, Lm2/o;

    .line 115
    .line 116
    if-eqz p0, :cond_5

    .line 117
    .line 118
    move-object p0, p6

    .line 119
    check-cast p0, Lm2/o;

    .line 120
    .line 121
    invoke-virtual {p0}, Lm2/o;->t()Z

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    if-eqz p0, :cond_5

    .line 126
    .line 127
    invoke-virtual {p2, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_5
    invoke-virtual {p6}, Lm2/g;->m()Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    if-eqz p0, :cond_7

    .line 136
    .line 137
    invoke-virtual {p2, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    invoke-virtual {p6}, Lm2/g;->g()Z

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    if-eqz p0, :cond_6

    .line 145
    .line 146
    invoke-virtual {p3, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    :cond_6
    return-void

    .line 150
    :cond_7
    invoke-virtual {p3, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method private synthetic k(Lm2/g;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v0, Lcom/android/launcher3/widget/v;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Lcom/android/launcher3/widget/v;-><init>(Lm2/g;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic l(Lm2/g;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v0, Lcom/android/launcher3/widget/v;

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    invoke-direct {v0, p1, v1}, Lcom/android/launcher3/widget/v;-><init>(Lm2/g;I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private r(Lz1/Z4;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    :try_start_0
    iget-object v0, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/widget/C;->d:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/widget/U;->clone()Landroid/appwidget/AppWidgetProviderInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0, v0}, Lcom/android/launcher3/widget/U;->j(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)Lcom/android/launcher3/widget/U;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    iget v0, p1, Lz1/Z4;->i:I

    .line 20
    .line 21
    iget v1, p0, Lcom/android/launcher3/widget/U;->g:I

    .line 22
    .line 23
    if-eq v0, v1, :cond_0

    .line 24
    .line 25
    iget v0, p1, Lz1/Z4;->j:I

    .line 26
    .line 27
    iget p0, p0, Lcom/android/launcher3/widget/U;->h:I

    .line 28
    .line 29
    if-eq v0, p0, :cond_0

    .line 30
    .line 31
    iput v1, p1, Lz1/Z4;->i:I

    .line 32
    .line 33
    iput p0, p1, Lz1/Z4;->j:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    return-void

    .line 36
    :catch_0
    move-exception p0

    .line 37
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/widget/v;

    .line 8
    .line 9
    iget p0, p0, Lcom/android/launcher3/widget/v;->b:I

    .line 10
    .line 11
    return p0
.end method

.method public m(Lcom/android/launcher3/widget/i;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/widget/v;

    .line 8
    .line 9
    add-int/lit8 v1, p2, -0x1

    .line 10
    .line 11
    if-lez v1, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-ge p2, v2, :cond_0

    .line 20
    .line 21
    iget-object p2, p0, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    check-cast p2, Lcom/android/launcher3/widget/v;

    .line 28
    .line 29
    iget p2, p2, Lcom/android/launcher3/widget/v;->b:I

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    if-ne p2, v1, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v1, 0x0

    .line 36
    :goto_0
    invoke-virtual {p1, v0, p0, v1}, Lcom/android/launcher3/widget/i;->b(Lcom/android/launcher3/widget/v;Lcom/android/launcher3/widget/C;Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public n(Landroid/view/ViewGroup;I)Lcom/android/launcher3/widget/i;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eq p2, v0, :cond_2

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    if-eq p2, v0, :cond_1

    .line 7
    .line 8
    const/4 v0, 0x4

    .line 9
    if-eq p2, v0, :cond_0

    .line 10
    .line 11
    new-instance p2, Lcom/android/launcher3/widget/w0;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/widget/C;->a:Landroid/view/LayoutInflater;

    .line 14
    .line 15
    const v0, 0x7f0e014e

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-direct {p2, p0}, Lcom/android/launcher3/widget/w0;-><init>(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    return-object p2

    .line 26
    :cond_0
    new-instance p2, Lcom/android/launcher3/widget/J0;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/widget/C;->a:Landroid/view/LayoutInflater;

    .line 29
    .line 30
    const v0, 0x7f0e008f

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-direct {p2, p0}, Lcom/android/launcher3/widget/J0;-><init>(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    return-object p2

    .line 41
    :cond_1
    new-instance p2, Lcom/android/launcher3/widget/M0;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/android/launcher3/widget/C;->a:Landroid/view/LayoutInflater;

    .line 44
    .line 45
    const v0, 0x7f0e023d

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-direct {p2, p0}, Lcom/android/launcher3/widget/M0;-><init>(Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    return-object p2

    .line 56
    :cond_2
    new-instance p2, Lcom/android/launcher3/widget/J;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/android/launcher3/widget/C;->a:Landroid/view/LayoutInflater;

    .line 59
    .line 60
    const v0, 0x7f0e0088

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-direct {p2, p0}, Lcom/android/launcher3/widget/J;-><init>(Landroid/view/View;)V

    .line 68
    .line 69
    .line 70
    return-object p2
.end method

.method public o(Lcom/android/launcher3/widget/i;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/widget/i;->a()Landroid/view/ViewGroup;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-ge p1, v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    instance-of v1, v0, Lcom/android/launcher3/widget/WidgetCell;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    check-cast v0, Lcom/android/launcher3/widget/WidgetCell;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/widget/WidgetCell;->j()V

    .line 25
    .line 26
    .line 27
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/widget/i;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/C;->m(Lcom/android/launcher3/widget/i;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/C;->n(Landroid/view/ViewGroup;I)Lcom/android/launcher3/widget/i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic onViewRecycled(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/widget/i;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/C;->o(Lcom/android/launcher3/widget/i;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lm2/g;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/C;->b:Ljava/util/ArrayList;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/C;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/android/launcher3/widget/C;->b:Ljava/util/ArrayList;

    .line 19
    .line 20
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 26
    .line 27
    :cond_1
    new-instance v0, Lcom/android/launcher3/widget/C$a;

    .line 28
    .line 29
    invoke-direct {v0}, Lcom/android/launcher3/widget/C$a;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 33
    .line 34
    .line 35
    new-instance v0, Lcom/android/launcher3/widget/picker/k;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/launcher3/widget/C;->b:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {v0, v1, p1}, Lcom/android/launcher3/widget/picker/k;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-static {v0, v1}, Landroidx/recyclerview/widget/e;->b(Landroidx/recyclerview/widget/e$b;Z)Landroidx/recyclerview/widget/e$e;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v1, p0, Lcom/android/launcher3/widget/C;->b:Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/android/launcher3/widget/C;->b:Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/e$e;->c(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/android/launcher3/widget/C;->d:Landroid/content/Context;

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/C;->q(Landroid/content/Context;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/android/launcher3/widget/C;->b:Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/C;->i(Ljava/util/ArrayList;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public q(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 10
    .line 11
    const v1, 0x7f0c0023

    .line 12
    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {p1, v0}, Lx1/O;->W(Landroid/content/Context;Z)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lcom/android/launcher3/widget/C;->k:I

    .line 22
    .line 23
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 32
    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    iget v0, p0, Lcom/android/launcher3/widget/C;->k:I

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-ge v0, v2, :cond_2

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iput p1, p0, Lcom/android/launcher3/widget/C;->k:I

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_0
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 67
    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    const v0, 0x7f0c0024

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    goto :goto_0

    .line 82
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    :goto_0
    iput p1, p0, Lcom/android/launcher3/widget/C;->k:I

    .line 91
    .line 92
    :cond_2
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string v0, "updateFullListCount: listCount = "

    .line 98
    .line 99
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    iget p0, p0, Lcom/android/launcher3/widget/C;->k:I

    .line 103
    .line 104
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    const-string p1, "ComponentsListAdapter"

    .line 112
    .line 113
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    return-void
.end method
