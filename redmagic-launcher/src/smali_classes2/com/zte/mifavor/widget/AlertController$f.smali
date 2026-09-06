.class public Lcom/zte/mifavor/widget/AlertController$f;
.super Ljava/lang/Object;
.source "AlertController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/AlertController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "f"
.end annotation


# instance fields
.field public A:I

.field public B:I

.field public C:I

.field public D:I

.field public E:Z

.field public F:[Z

.field public G:Z

.field public H:Z

.field public I:I

.field public J:Landroid/content/DialogInterface$OnMultiChoiceClickListener;

.field public K:Landroid/database/Cursor;

.field public L:Ljava/lang/String;

.field public M:Ljava/lang/String;

.field public N:Z

.field public O:Landroid/widget/AdapterView$OnItemSelectedListener;

.field public P:Z

.field public Q:I

.field public R:Z

.field public S:Z

.field public T:Z

.field public U:I

.field public V:Z

.field public W:Z

.field public X:Z

.field public Y:Z

.field public Z:I

.field public final a:Landroid/content/Context;

.field public final b:Landroid/view/LayoutInflater;

.field public c:I

.field public d:Landroid/graphics/drawable/Drawable;

.field public e:I

.field public f:Ljava/lang/CharSequence;

.field public g:Landroid/view/View;

.field public h:Ljava/lang/CharSequence;

.field public i:Ljava/lang/CharSequence;

.field public j:Ljava/lang/CharSequence;

.field public k:Landroid/content/DialogInterface$OnClickListener;

.field public l:Ljava/lang/CharSequence;

.field public m:Landroid/content/DialogInterface$OnClickListener;

.field public n:Ljava/lang/CharSequence;

.field public o:Landroid/view/View$OnClickListener;

.field public p:Ljava/lang/CharSequence;

.field public q:Landroid/content/DialogInterface$OnClickListener;

.field public r:Z

.field public s:Landroid/content/DialogInterface$OnCancelListener;

.field public t:Landroid/content/DialogInterface$OnDismissListener;

.field public u:Landroid/content/DialogInterface$OnKeyListener;

.field public v:[Ljava/lang/CharSequence;

.field public w:Landroid/widget/ListAdapter;

.field public x:Landroid/content/DialogInterface$OnClickListener;

.field public y:I

.field public z:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->c:I

    .line 6
    .line 7
    iput v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->e:I

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->E:Z

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    iput v1, p0, Lcom/zte/mifavor/widget/AlertController$f;->I:I

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    iput-boolean v2, p0, Lcom/zte/mifavor/widget/AlertController$f;->P:Z

    .line 16
    .line 17
    iput v1, p0, Lcom/zte/mifavor/widget/AlertController$f;->Q:I

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->R:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->S:Z

    .line 22
    .line 23
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->T:Z

    .line 24
    .line 25
    iput v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->U:I

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->V:Z

    .line 28
    .line 29
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->W:Z

    .line 30
    .line 31
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->X:Z

    .line 32
    .line 33
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->Y:Z

    .line 34
    .line 35
    iput v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->Z:I

    .line 36
    .line 37
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController$f;->a:Landroid/content/Context;

    .line 38
    .line 39
    iput-boolean v2, p0, Lcom/zte/mifavor/widget/AlertController$f;->r:Z

    .line 40
    .line 41
    const-string v0, "layout_inflater"

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Landroid/view/LayoutInflater;

    .line 48
    .line 49
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController$f;->b:Landroid/view/LayoutInflater;

    .line 50
    .line 51
    return-void
.end method

.method private b(Lcom/zte/mifavor/widget/AlertController;)V
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Lcom/zte/mifavor/widget/AlertController$f;->b:Landroid/view/LayoutInflater;

    .line 4
    .line 5
    invoke-static/range {p1 .. p1}, Lcom/zte/mifavor/widget/AlertController;->h(Lcom/zte/mifavor/widget/AlertController;)I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v3, 0x0

    .line 10
    invoke-virtual {v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    move-object v5, v0

    .line 15
    check-cast v5, Lcom/zte/mifavor/widget/AlertController$RecycleListView;

    .line 16
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v2, "create List View mIsMultiChoice="

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget-boolean v2, v1, Lcom/zte/mifavor/widget/AlertController$f;->G:Z

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v7, ", mIsSingleChoice="

    .line 33
    .line 34
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget-boolean v2, v1, Lcom/zte/mifavor/widget/AlertController$f;->H:Z

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v8, ", listView="

    .line 43
    .line 44
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v9, "Z#AlertController"

    .line 55
    .line 56
    invoke-static {v9, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    iget-boolean v0, v1, Lcom/zte/mifavor/widget/AlertController$f;->G:Z

    .line 60
    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    iget-object v0, v1, Lcom/zte/mifavor/widget/AlertController$f;->K:Landroid/database/Cursor;

    .line 64
    .line 65
    if-nez v0, :cond_0

    .line 66
    .line 67
    new-instance v0, Lcom/zte/mifavor/widget/AlertController$f$a;

    .line 68
    .line 69
    iget-object v2, v1, Lcom/zte/mifavor/widget/AlertController$f;->a:Landroid/content/Context;

    .line 70
    .line 71
    invoke-static/range {p1 .. p1}, Lcom/zte/mifavor/widget/AlertController;->j(Lcom/zte/mifavor/widget/AlertController;)I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    const v4, 0x1020014

    .line 76
    .line 77
    .line 78
    move-object v6, v5

    .line 79
    iget-object v5, v1, Lcom/zte/mifavor/widget/AlertController$f;->v:[Ljava/lang/CharSequence;

    .line 80
    .line 81
    invoke-direct/range {v0 .. v6}, Lcom/zte/mifavor/widget/AlertController$f$a;-><init>(Lcom/zte/mifavor/widget/AlertController$f;Landroid/content/Context;II[Ljava/lang/CharSequence;Lcom/zte/mifavor/widget/AlertController$RecycleListView;)V

    .line 82
    .line 83
    .line 84
    move-object v5, v6

    .line 85
    move-object/from16 v6, p1

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_0
    move-object v6, v5

    .line 89
    new-instance v0, Lcom/zte/mifavor/widget/AlertController$f$b;

    .line 90
    .line 91
    iget-object v2, v1, Lcom/zte/mifavor/widget/AlertController$f;->a:Landroid/content/Context;

    .line 92
    .line 93
    iget-object v3, v1, Lcom/zte/mifavor/widget/AlertController$f;->K:Landroid/database/Cursor;

    .line 94
    .line 95
    const/4 v4, 0x0

    .line 96
    move-object/from16 v6, p1

    .line 97
    .line 98
    invoke-direct/range {v0 .. v6}, Lcom/zte/mifavor/widget/AlertController$f$b;-><init>(Lcom/zte/mifavor/widget/AlertController$f;Landroid/content/Context;Landroid/database/Cursor;ZLcom/zte/mifavor/widget/AlertController$RecycleListView;Lcom/zte/mifavor/widget/AlertController;)V

    .line 99
    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_1
    move-object/from16 v6, p1

    .line 103
    .line 104
    iget-boolean v0, v1, Lcom/zte/mifavor/widget/AlertController$f;->H:Z

    .line 105
    .line 106
    if-eqz v0, :cond_2

    .line 107
    .line 108
    invoke-static {v6}, Lcom/zte/mifavor/widget/AlertController;->k(Lcom/zte/mifavor/widget/AlertController;)I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    :goto_0
    move v12, v0

    .line 113
    goto :goto_1

    .line 114
    :cond_2
    invoke-static {v6}, Lcom/zte/mifavor/widget/AlertController;->g(Lcom/zte/mifavor/widget/AlertController;)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    goto :goto_0

    .line 119
    :goto_1
    iget-object v0, v1, Lcom/zte/mifavor/widget/AlertController$f;->K:Landroid/database/Cursor;

    .line 120
    .line 121
    const v2, 0x1020014

    .line 122
    .line 123
    .line 124
    if-nez v0, :cond_4

    .line 125
    .line 126
    iget-object v0, v1, Lcom/zte/mifavor/widget/AlertController$f;->w:Landroid/widget/ListAdapter;

    .line 127
    .line 128
    if-eqz v0, :cond_3

    .line 129
    .line 130
    goto :goto_2

    .line 131
    :cond_3
    new-instance v0, Lcom/zte/mifavor/widget/AlertController$h;

    .line 132
    .line 133
    iget-object v3, v1, Lcom/zte/mifavor/widget/AlertController$f;->a:Landroid/content/Context;

    .line 134
    .line 135
    iget-object v4, v1, Lcom/zte/mifavor/widget/AlertController$f;->v:[Ljava/lang/CharSequence;

    .line 136
    .line 137
    invoke-direct {v0, v3, v12, v2, v4}, Lcom/zte/mifavor/widget/AlertController$h;-><init>(Landroid/content/Context;II[Ljava/lang/CharSequence;)V

    .line 138
    .line 139
    .line 140
    goto :goto_2

    .line 141
    :cond_4
    new-instance v10, Landroid/widget/SimpleCursorAdapter;

    .line 142
    .line 143
    iget-object v11, v1, Lcom/zte/mifavor/widget/AlertController$f;->a:Landroid/content/Context;

    .line 144
    .line 145
    iget-object v13, v1, Lcom/zte/mifavor/widget/AlertController$f;->K:Landroid/database/Cursor;

    .line 146
    .line 147
    iget-object v0, v1, Lcom/zte/mifavor/widget/AlertController$f;->L:Ljava/lang/String;

    .line 148
    .line 149
    filled-new-array {v0}, [Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v14

    .line 153
    filled-new-array {v2}, [I

    .line 154
    .line 155
    .line 156
    move-result-object v15

    .line 157
    invoke-direct/range {v10 .. v15}, Landroid/widget/SimpleCursorAdapter;-><init>(Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[I)V

    .line 158
    .line 159
    .line 160
    move-object v0, v10

    .line 161
    :goto_2
    invoke-static {v6, v0}, Lcom/zte/mifavor/widget/AlertController;->m(Lcom/zte/mifavor/widget/AlertController;Landroid/widget/ListAdapter;)V

    .line 162
    .line 163
    .line 164
    iget v0, v1, Lcom/zte/mifavor/widget/AlertController$f;->I:I

    .line 165
    .line 166
    invoke-static {v6, v0}, Lcom/zte/mifavor/widget/AlertController;->n(Lcom/zte/mifavor/widget/AlertController;I)V

    .line 167
    .line 168
    .line 169
    iget-object v0, v1, Lcom/zte/mifavor/widget/AlertController$f;->x:Landroid/content/DialogInterface$OnClickListener;

    .line 170
    .line 171
    if-eqz v0, :cond_5

    .line 172
    .line 173
    new-instance v0, Lcom/zte/mifavor/widget/AlertController$f$c;

    .line 174
    .line 175
    invoke-direct {v0, v1, v6}, Lcom/zte/mifavor/widget/AlertController$f$c;-><init>(Lcom/zte/mifavor/widget/AlertController$f;Lcom/zte/mifavor/widget/AlertController;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v5, v0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 179
    .line 180
    .line 181
    goto :goto_3

    .line 182
    :cond_5
    iget-object v0, v1, Lcom/zte/mifavor/widget/AlertController$f;->J:Landroid/content/DialogInterface$OnMultiChoiceClickListener;

    .line 183
    .line 184
    if-eqz v0, :cond_6

    .line 185
    .line 186
    new-instance v0, Lcom/zte/mifavor/widget/AlertController$f$d;

    .line 187
    .line 188
    invoke-direct {v0, v1, v5, v6}, Lcom/zte/mifavor/widget/AlertController$f$d;-><init>(Lcom/zte/mifavor/widget/AlertController$f;Lcom/zte/mifavor/widget/AlertController$RecycleListView;Lcom/zte/mifavor/widget/AlertController;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v5, v0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 192
    .line 193
    .line 194
    :cond_6
    :goto_3
    iget-object v0, v1, Lcom/zte/mifavor/widget/AlertController$f;->O:Landroid/widget/AdapterView$OnItemSelectedListener;

    .line 195
    .line 196
    if-eqz v0, :cond_7

    .line 197
    .line 198
    invoke-virtual {v5, v0}, Landroid/widget/ListView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 199
    .line 200
    .line 201
    :cond_7
    iget-boolean v0, v1, Lcom/zte/mifavor/widget/AlertController$f;->H:Z

    .line 202
    .line 203
    const/4 v2, 0x1

    .line 204
    if-eqz v0, :cond_8

    .line 205
    .line 206
    invoke-virtual {v5, v2}, Landroid/widget/ListView;->setChoiceMode(I)V

    .line 207
    .line 208
    .line 209
    goto :goto_4

    .line 210
    :cond_8
    iget-boolean v0, v1, Lcom/zte/mifavor/widget/AlertController$f;->G:Z

    .line 211
    .line 212
    if-eqz v0, :cond_9

    .line 213
    .line 214
    const/4 v0, 0x2

    .line 215
    invoke-virtual {v5, v0}, Landroid/widget/ListView;->setChoiceMode(I)V

    .line 216
    .line 217
    .line 218
    :cond_9
    :goto_4
    iget-boolean v0, v1, Lcom/zte/mifavor/widget/AlertController$f;->P:Z

    .line 219
    .line 220
    iput-boolean v0, v5, Lcom/zte/mifavor/widget/AlertController$RecycleListView;->q:Z

    .line 221
    .line 222
    invoke-static {v6, v5}, Lcom/zte/mifavor/widget/AlertController;->o(Lcom/zte/mifavor/widget/AlertController;Lcom/zte/mifavor/widget/ListView;)V

    .line 223
    .line 224
    .line 225
    iput-boolean v2, v1, Lcom/zte/mifavor/widget/AlertController$f;->V:Z

    .line 226
    .line 227
    new-instance v0, Ljava/lang/StringBuilder;

    .line 228
    .line 229
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 230
    .line 231
    .line 232
    const-string v2, "create List out. mIsMultiChoice="

    .line 233
    .line 234
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    iget-boolean v2, v1, Lcom/zte/mifavor/widget/AlertController$f;->G:Z

    .line 238
    .line 239
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    iget-boolean v2, v1, Lcom/zte/mifavor/widget/AlertController$f;->H:Z

    .line 246
    .line 247
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    const-string v2, ", mIsShowTitle="

    .line 251
    .line 252
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    iget-boolean v1, v1, Lcom/zte/mifavor/widget/AlertController$f;->V:Z

    .line 256
    .line 257
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    invoke-static {v9, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    .line 272
    .line 273
    return-void
.end method


# virtual methods
.method public a(Lcom/zte/mifavor/widget/AlertController;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->g:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lcom/zte/mifavor/widget/AlertController;->I(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->f:Ljava/lang/CharSequence;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lcom/zte/mifavor/widget/AlertController;->V(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->Q:I

    .line 18
    .line 19
    if-eq v0, v1, :cond_2

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcom/zte/mifavor/widget/AlertController;->W(I)V

    .line 22
    .line 23
    .line 24
    :cond_2
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->d:Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lcom/zte/mifavor/widget/AlertController;->K(Landroid/graphics/drawable/Drawable;)V

    .line 29
    .line 30
    .line 31
    :cond_3
    iget v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->c:I

    .line 32
    .line 33
    if-ltz v0, :cond_4

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Lcom/zte/mifavor/widget/AlertController;->J(I)V

    .line 36
    .line 37
    .line 38
    :cond_4
    iget v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->e:I

    .line 39
    .line 40
    if-lez v0, :cond_5

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Lcom/zte/mifavor/widget/AlertController;->y(I)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-virtual {p1, v0}, Lcom/zte/mifavor/widget/AlertController;->J(I)V

    .line 47
    .line 48
    .line 49
    :cond_5
    :goto_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->h:Ljava/lang/CharSequence;

    .line 50
    .line 51
    if-eqz v0, :cond_6

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Lcom/zte/mifavor/widget/AlertController;->O(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    :cond_6
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->i:Ljava/lang/CharSequence;

    .line 57
    .line 58
    if-eqz v0, :cond_7

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Lcom/zte/mifavor/widget/AlertController;->U(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    :cond_7
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->j:Ljava/lang/CharSequence;

    .line 64
    .line 65
    const/4 v2, 0x0

    .line 66
    if-eqz v0, :cond_8

    .line 67
    .line 68
    iget-object v3, p0, Lcom/zte/mifavor/widget/AlertController$f;->k:Landroid/content/DialogInterface$OnClickListener;

    .line 69
    .line 70
    invoke-virtual {p1, v1, v0, v3, v2}, Lcom/zte/mifavor/widget/AlertController;->G(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;Landroid/os/Message;)V

    .line 71
    .line 72
    .line 73
    :cond_8
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->l:Ljava/lang/CharSequence;

    .line 74
    .line 75
    if-eqz v0, :cond_9

    .line 76
    .line 77
    const/4 v1, -0x2

    .line 78
    iget-object v3, p0, Lcom/zte/mifavor/widget/AlertController$f;->m:Landroid/content/DialogInterface$OnClickListener;

    .line 79
    .line 80
    invoke-virtual {p1, v1, v0, v3, v2}, Lcom/zte/mifavor/widget/AlertController;->G(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;Landroid/os/Message;)V

    .line 81
    .line 82
    .line 83
    :cond_9
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->p:Ljava/lang/CharSequence;

    .line 84
    .line 85
    if-eqz v0, :cond_a

    .line 86
    .line 87
    const/4 v1, -0x3

    .line 88
    iget-object v3, p0, Lcom/zte/mifavor/widget/AlertController$f;->q:Landroid/content/DialogInterface$OnClickListener;

    .line 89
    .line 90
    invoke-virtual {p1, v1, v0, v3, v2}, Lcom/zte/mifavor/widget/AlertController;->G(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;Landroid/os/Message;)V

    .line 91
    .line 92
    .line 93
    :cond_a
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->R:Z

    .line 94
    .line 95
    if-eqz v0, :cond_b

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/AlertController;->N()V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/AlertController;->T()V

    .line 101
    .line 102
    .line 103
    :cond_b
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->S:Z

    .line 104
    .line 105
    if-eqz v0, :cond_c

    .line 106
    .line 107
    iget v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->U:I

    .line 108
    .line 109
    invoke-virtual {p1, v0}, Lcom/zte/mifavor/widget/AlertController;->S(I)V

    .line 110
    .line 111
    .line 112
    :cond_c
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->X:Z

    .line 113
    .line 114
    if-eqz v0, :cond_d

    .line 115
    .line 116
    iget v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->Z:I

    .line 117
    .line 118
    invoke-virtual {p1, v0}, Lcom/zte/mifavor/widget/AlertController;->Q(I)V

    .line 119
    .line 120
    .line 121
    :cond_d
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->T:Z

    .line 122
    .line 123
    if-eqz v0, :cond_e

    .line 124
    .line 125
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/AlertController;->R()V

    .line 126
    .line 127
    .line 128
    :cond_e
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->Y:Z

    .line 129
    .line 130
    if-eqz v0, :cond_f

    .line 131
    .line 132
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/AlertController;->P()V

    .line 133
    .line 134
    .line 135
    :cond_f
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->N:Z

    .line 136
    .line 137
    const/4 v1, 0x1

    .line 138
    if-eqz v0, :cond_10

    .line 139
    .line 140
    invoke-virtual {p1, v1}, Lcom/zte/mifavor/widget/AlertController;->M(Z)V

    .line 141
    .line 142
    .line 143
    :cond_10
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->v:[Ljava/lang/CharSequence;

    .line 144
    .line 145
    if-nez v0, :cond_11

    .line 146
    .line 147
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->K:Landroid/database/Cursor;

    .line 148
    .line 149
    if-nez v0, :cond_11

    .line 150
    .line 151
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->w:Landroid/widget/ListAdapter;

    .line 152
    .line 153
    if-eqz v0, :cond_16

    .line 154
    .line 155
    :cond_11
    const/4 v0, 0x0

    .line 156
    invoke-static {v0}, Lcom/zte/mifavor/widget/AlertController;->s(I)V

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->j:Ljava/lang/CharSequence;

    .line 160
    .line 161
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_12

    .line 166
    .line 167
    invoke-static {}, Lcom/zte/mifavor/widget/AlertController;->q()I

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    or-int/2addr v0, v1

    .line 172
    invoke-static {v0}, Lcom/zte/mifavor/widget/AlertController;->s(I)V

    .line 173
    .line 174
    .line 175
    :cond_12
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->l:Ljava/lang/CharSequence;

    .line 176
    .line 177
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    if-nez v0, :cond_13

    .line 182
    .line 183
    invoke-static {}, Lcom/zte/mifavor/widget/AlertController;->q()I

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    or-int/lit8 v0, v0, 0x2

    .line 188
    .line 189
    invoke-static {v0}, Lcom/zte/mifavor/widget/AlertController;->s(I)V

    .line 190
    .line 191
    .line 192
    :cond_13
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->p:Ljava/lang/CharSequence;

    .line 193
    .line 194
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-nez v0, :cond_14

    .line 199
    .line 200
    invoke-static {}, Lcom/zte/mifavor/widget/AlertController;->q()I

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    or-int/lit8 v0, v0, 0x4

    .line 205
    .line 206
    invoke-static {v0}, Lcom/zte/mifavor/widget/AlertController;->s(I)V

    .line 207
    .line 208
    .line 209
    :cond_14
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->v:[Ljava/lang/CharSequence;

    .line 210
    .line 211
    if-eqz v0, :cond_15

    .line 212
    .line 213
    invoke-static {}, Lcom/zte/mifavor/widget/AlertController;->q()I

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    if-nez v0, :cond_15

    .line 218
    .line 219
    sget v0, LR3/c;->p:I

    .line 220
    .line 221
    invoke-static {v0}, Lcom/zte/mifavor/widget/AlertController;->r(I)V

    .line 222
    .line 223
    .line 224
    :cond_15
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/AlertController$f;->b(Lcom/zte/mifavor/widget/AlertController;)V

    .line 225
    .line 226
    .line 227
    :cond_16
    iget-object v2, p0, Lcom/zte/mifavor/widget/AlertController$f;->z:Landroid/view/View;

    .line 228
    .line 229
    if-eqz v2, :cond_18

    .line 230
    .line 231
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->E:Z

    .line 232
    .line 233
    if-eqz v0, :cond_17

    .line 234
    .line 235
    iget v3, p0, Lcom/zte/mifavor/widget/AlertController$f;->A:I

    .line 236
    .line 237
    iget v4, p0, Lcom/zte/mifavor/widget/AlertController$f;->B:I

    .line 238
    .line 239
    iget v5, p0, Lcom/zte/mifavor/widget/AlertController$f;->C:I

    .line 240
    .line 241
    iget v6, p0, Lcom/zte/mifavor/widget/AlertController$f;->D:I

    .line 242
    .line 243
    move-object v1, p1

    .line 244
    invoke-virtual/range {v1 .. v6}, Lcom/zte/mifavor/widget/AlertController;->Z(Landroid/view/View;IIII)V

    .line 245
    .line 246
    .line 247
    goto :goto_1

    .line 248
    :cond_17
    move-object v1, p1

    .line 249
    invoke-virtual {v1, v2}, Lcom/zte/mifavor/widget/AlertController;->Y(Landroid/view/View;)V

    .line 250
    .line 251
    .line 252
    goto :goto_1

    .line 253
    :cond_18
    move-object v1, p1

    .line 254
    iget p1, p0, Lcom/zte/mifavor/widget/AlertController$f;->y:I

    .line 255
    .line 256
    if-eqz p1, :cond_19

    .line 257
    .line 258
    invoke-virtual {v1, p1}, Lcom/zte/mifavor/widget/AlertController;->X(I)V

    .line 259
    .line 260
    .line 261
    :cond_19
    :goto_1
    iget-object p1, p0, Lcom/zte/mifavor/widget/AlertController$f;->n:Ljava/lang/CharSequence;

    .line 262
    .line 263
    if-eqz p1, :cond_1a

    .line 264
    .line 265
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController$f;->o:Landroid/view/View$OnClickListener;

    .line 266
    .line 267
    invoke-virtual {v1, p1, v0}, Lcom/zte/mifavor/widget/AlertController;->L(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)V

    .line 268
    .line 269
    .line 270
    :cond_1a
    iget-boolean p1, p0, Lcom/zte/mifavor/widget/AlertController$f;->V:Z

    .line 271
    .line 272
    if-eqz p1, :cond_1b

    .line 273
    .line 274
    invoke-virtual {v1}, Lcom/zte/mifavor/widget/AlertController;->N()V

    .line 275
    .line 276
    .line 277
    :cond_1b
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/AlertController$f;->W:Z

    .line 278
    .line 279
    if-eqz p0, :cond_1c

    .line 280
    .line 281
    invoke-virtual {v1}, Lcom/zte/mifavor/widget/AlertController;->v()V

    .line 282
    .line 283
    .line 284
    :cond_1c
    return-void
.end method
