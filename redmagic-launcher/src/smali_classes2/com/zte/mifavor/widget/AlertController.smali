.class public Lcom/zte/mifavor/widget/AlertController;
.super Ljava/lang/Object;
.source "AlertController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/mifavor/widget/AlertController$g;,
        Lcom/zte/mifavor/widget/AlertController$h;,
        Lcom/zte/mifavor/widget/AlertController$f;,
        Lcom/zte/mifavor/widget/AlertController$RecycleListView;
    }
.end annotation


# static fields
.field private static q0:I = -0x1

.field private static r0:I = 0x1010074


# instance fields
.field private A:Landroid/view/View$OnClickListener;

.field private B:Landroid/widget/ImageView;

.field private C:Landroid/widget/ImageView;

.field private D:Landroid/widget/Space;

.field private E:Landroid/widget/Space;

.field private F:Landroid/widget/Space;

.field private G:Landroid/widget/Space;

.field private H:Landroid/widget/ScrollView;

.field private I:I

.field private J:Landroid/graphics/drawable/Drawable;

.field private K:Landroid/widget/ImageView;

.field private L:Landroid/widget/ImageView;

.field private M:Lcom/zte/mifavor/widget/TextViewZTE;

.field private N:Z

.field private O:Z

.field private P:Landroid/widget/TextView;

.field private Q:Landroid/widget/TextView;

.field private R:Landroid/view/View;

.field private S:Z

.field private T:Landroid/widget/ListAdapter;

.field private U:I

.field private V:I

.field private W:I

.field private X:I

.field private Y:I

.field private Z:I

.field private final a:Landroid/content/Context;

.field private a0:I

.field private final b:Landroid/content/DialogInterface;

.field private b0:I

.field private final c:Landroid/view/Window;

.field private c0:Landroid/os/Handler;

.field private d:Ljava/lang/CharSequence;

.field private d0:Z

.field private e:Ljava/lang/CharSequence;

.field private e0:Z

.field private f:Ljava/lang/CharSequence;

.field private f0:Z

.field private g:Lcom/zte/mifavor/widget/ListView;

.field private g0:I

.field private h:Landroid/view/View;

.field private h0:Z

.field private i:Landroid/view/View;

.field private i0:Z

.field private j:I

.field private j0:I

.field private k:I

.field private k0:Z

.field private l:I

.field private final l0:Landroid/view/View$OnClickListener;

.field private m:I

.field private m0:I

.field private n:I

.field private n0:I

.field private o:Z

.field o0:Landroid/view/View$OnLayoutChangeListener;

.field public p:Landroid/widget/Button;

.field p0:Landroid/view/View$OnLayoutChangeListener;

.field private q:Ljava/lang/CharSequence;

.field private r:Landroid/os/Message;

.field public s:Landroid/widget/Button;

.field private t:Ljava/lang/CharSequence;

.field private u:Landroid/os/Message;

.field public v:Landroid/widget/Button;

.field private w:Ljava/lang/CharSequence;

.field private x:Landroid/os/Message;

.field private y:Landroid/widget/TextView;

.field private z:Ljava/lang/CharSequence;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/content/DialogInterface;Landroid/view/Window;)V
    .locals 6

    .line 1
    const-string v0, "Z#AlertController"

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/AlertController;->o:Z

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    iput-object v2, p0, Lcom/zte/mifavor/widget/AlertController;->H:Landroid/widget/ScrollView;

    .line 11
    .line 12
    iput v1, p0, Lcom/zte/mifavor/widget/AlertController;->I:I

    .line 13
    .line 14
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/AlertController;->N:Z

    .line 15
    .line 16
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/AlertController;->O:Z

    .line 17
    .line 18
    const/4 v3, -0x1

    .line 19
    iput v3, p0, Lcom/zte/mifavor/widget/AlertController;->U:I

    .line 20
    .line 21
    iput v1, p0, Lcom/zte/mifavor/widget/AlertController;->b0:I

    .line 22
    .line 23
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/AlertController;->d0:Z

    .line 24
    .line 25
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/AlertController;->e0:Z

    .line 26
    .line 27
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/AlertController;->f0:Z

    .line 28
    .line 29
    iput v1, p0, Lcom/zte/mifavor/widget/AlertController;->g0:I

    .line 30
    .line 31
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/AlertController;->h0:Z

    .line 32
    .line 33
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/AlertController;->i0:Z

    .line 34
    .line 35
    iput v1, p0, Lcom/zte/mifavor/widget/AlertController;->j0:I

    .line 36
    .line 37
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/AlertController;->k0:Z

    .line 38
    .line 39
    new-instance v4, Lcom/zte/mifavor/widget/AlertController$a;

    .line 40
    .line 41
    invoke-direct {v4, p0}, Lcom/zte/mifavor/widget/AlertController$a;-><init>(Lcom/zte/mifavor/widget/AlertController;)V

    .line 42
    .line 43
    .line 44
    iput-object v4, p0, Lcom/zte/mifavor/widget/AlertController;->l0:Landroid/view/View$OnClickListener;

    .line 45
    .line 46
    iput v1, p0, Lcom/zte/mifavor/widget/AlertController;->m0:I

    .line 47
    .line 48
    sget v4, LR3/c;->b:I

    .line 49
    .line 50
    iput v4, p0, Lcom/zte/mifavor/widget/AlertController;->n0:I

    .line 51
    .line 52
    new-instance v4, Lcom/zte/mifavor/widget/AlertController$d;

    .line 53
    .line 54
    invoke-direct {v4, p0}, Lcom/zte/mifavor/widget/AlertController$d;-><init>(Lcom/zte/mifavor/widget/AlertController;)V

    .line 55
    .line 56
    .line 57
    iput-object v4, p0, Lcom/zte/mifavor/widget/AlertController;->o0:Landroid/view/View$OnLayoutChangeListener;

    .line 58
    .line 59
    new-instance v4, Lcom/zte/mifavor/widget/AlertController$e;

    .line 60
    .line 61
    invoke-direct {v4, p0}, Lcom/zte/mifavor/widget/AlertController$e;-><init>(Lcom/zte/mifavor/widget/AlertController;)V

    .line 62
    .line 63
    .line 64
    iput-object v4, p0, Lcom/zte/mifavor/widget/AlertController;->p0:Landroid/view/View$OnLayoutChangeListener;

    .line 65
    .line 66
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 67
    .line 68
    invoke-static {p1}, Lb4/g;->h(Landroid/content/Context;)Z

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    iput-boolean v4, p0, Lcom/zte/mifavor/widget/AlertController;->k0:Z

    .line 73
    .line 74
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getDisplay()Landroid/view/Display;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    invoke-virtual {v4}, Landroid/view/Display;->getType()I

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    iput v4, p0, Lcom/zte/mifavor/widget/AlertController;->m0:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :catch_0
    move-exception v4

    .line 86
    const-string v5, "get Type or get Display error, e = "

    .line 87
    .line 88
    invoke-static {v0, v5, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 89
    .line 90
    .line 91
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .line 95
    .line 96
    const-string v5, "AlertController in. mDisplayType = "

    .line 97
    .line 98
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    iget v5, p0, Lcom/zte/mifavor/widget/AlertController;->m0:I

    .line 102
    .line 103
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string v5, ", mIsOutScreen="

    .line 107
    .line 108
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    iget-boolean v5, p0, Lcom/zte/mifavor/widget/AlertController;->k0:Z

    .line 112
    .line 113
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    invoke-static {v0, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    iput-object p2, p0, Lcom/zte/mifavor/widget/AlertController;->b:Landroid/content/DialogInterface;

    .line 124
    .line 125
    iput-object p3, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 126
    .line 127
    new-instance v4, Lcom/zte/mifavor/widget/AlertController$g;

    .line 128
    .line 129
    invoke-direct {v4, p2}, Lcom/zte/mifavor/widget/AlertController$g;-><init>(Landroid/content/DialogInterface;)V

    .line 130
    .line 131
    .line 132
    iput-object v4, p0, Lcom/zte/mifavor/widget/AlertController;->c0:Landroid/os/Handler;

    .line 133
    .line 134
    const p2, 0x1010074

    .line 135
    .line 136
    .line 137
    sput p2, Lcom/zte/mifavor/widget/AlertController;->r0:I

    .line 138
    .line 139
    sput v3, Lcom/zte/mifavor/widget/AlertController;->q0:I

    .line 140
    .line 141
    iget p2, p0, Lcom/zte/mifavor/widget/AlertController;->m0:I

    .line 142
    .line 143
    const/4 v3, 0x3

    .line 144
    if-ne p2, v3, :cond_0

    .line 145
    .line 146
    sget p2, LR3/c;->a:I

    .line 147
    .line 148
    iput p2, p0, Lcom/zte/mifavor/widget/AlertController;->n0:I

    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_0
    sget p2, LR3/c;->b:I

    .line 152
    .line 153
    iput p2, p0, Lcom/zte/mifavor/widget/AlertController;->n0:I

    .line 154
    .line 155
    :goto_1
    sget-object p2, LR3/m;->h:[I

    .line 156
    .line 157
    iget v4, p0, Lcom/zte/mifavor/widget/AlertController;->n0:I

    .line 158
    .line 159
    invoke-virtual {p1, v2, p2, v4, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    sget p2, LR3/m;->r:I

    .line 164
    .line 165
    sget v2, LR3/i;->e:I

    .line 166
    .line 167
    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 168
    .line 169
    .line 170
    move-result p2

    .line 171
    iput p2, p0, Lcom/zte/mifavor/widget/AlertController;->V:I

    .line 172
    .line 173
    sget p2, LR3/m;->l:I

    .line 174
    .line 175
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 176
    .line 177
    .line 178
    move-result p2

    .line 179
    iput p2, p0, Lcom/zte/mifavor/widget/AlertController;->W:I

    .line 180
    .line 181
    sget p2, LR3/m;->t:I

    .line 182
    .line 183
    sget v1, LR3/i;->m:I

    .line 184
    .line 185
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 186
    .line 187
    .line 188
    move-result p2

    .line 189
    iput p2, p0, Lcom/zte/mifavor/widget/AlertController;->X:I

    .line 190
    .line 191
    sget p2, LR3/m;->u:I

    .line 192
    .line 193
    sget v1, LR3/i;->o:I

    .line 194
    .line 195
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 196
    .line 197
    .line 198
    move-result p2

    .line 199
    iput p2, p0, Lcom/zte/mifavor/widget/AlertController;->Y:I

    .line 200
    .line 201
    sget p2, LR3/m;->x:I

    .line 202
    .line 203
    sget v1, LR3/i;->q:I

    .line 204
    .line 205
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 206
    .line 207
    .line 208
    move-result p2

    .line 209
    iput p2, p0, Lcom/zte/mifavor/widget/AlertController;->Z:I

    .line 210
    .line 211
    sget p2, LR3/m;->s:I

    .line 212
    .line 213
    sget v1, LR3/i;->k:I

    .line 214
    .line 215
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 216
    .line 217
    .line 218
    move-result p2

    .line 219
    iput p2, p0, Lcom/zte/mifavor/widget/AlertController;->a0:I

    .line 220
    .line 221
    new-instance p2, Ljava/lang/StringBuilder;

    .line 222
    .line 223
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 224
    .line 225
    .line 226
    const-string v1, "AlertController out. mIsShowTitle="

    .line 227
    .line 228
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    iget-boolean v1, p0, Lcom/zte/mifavor/widget/AlertController;->N:Z

    .line 232
    .line 233
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object p2

    .line 240
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    .line 242
    .line 243
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 244
    .line 245
    .line 246
    iget p1, p0, Lcom/zte/mifavor/widget/AlertController;->m0:I

    .line 247
    .line 248
    if-eq p1, v3, :cond_1

    .line 249
    .line 250
    invoke-direct {p0}, Lcom/zte/mifavor/widget/AlertController;->F()V

    .line 251
    .line 252
    .line 253
    goto :goto_2

    .line 254
    :cond_1
    const/16 p0, 0x11

    .line 255
    .line 256
    invoke-virtual {p3, p0}, Landroid/view/Window;->setGravity(I)V

    .line 257
    .line 258
    .line 259
    :goto_2
    return-void
.end method

.method private D()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/zte/mifavor/widget/AlertController;->W:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/zte/mifavor/widget/AlertController;->V:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    iget v1, p0, Lcom/zte/mifavor/widget/AlertController;->b0:I

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    if-ne v1, v2, :cond_1

    .line 12
    .line 13
    return v0

    .line 14
    :cond_1
    iget p0, p0, Lcom/zte/mifavor/widget/AlertController;->V:I

    .line 15
    .line 16
    return p0
.end method

.method private E(Landroid/content/res/TypedArray;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;ZZZ)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    sget v2, LR3/m;->v:I

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 9
    .line 10
    .line 11
    sget v2, LR3/m;->y:I

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    sget v5, LR3/m;->z:I

    .line 19
    .line 20
    invoke-virtual {v1, v5, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    sget v6, LR3/m;->m:I

    .line 25
    .line 26
    invoke-virtual {v1, v6, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 27
    .line 28
    .line 29
    move-result v6

    .line 30
    sget v7, LR3/m;->n:I

    .line 31
    .line 32
    invoke-virtual {v1, v7, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 33
    .line 34
    .line 35
    move-result v7

    .line 36
    const/4 v8, 0x4

    .line 37
    new-array v9, v8, [Landroid/view/View;

    .line 38
    .line 39
    new-array v10, v8, [Z

    .line 40
    .line 41
    if-eqz p6, :cond_0

    .line 42
    .line 43
    aput-object p2, v9, v4

    .line 44
    .line 45
    aput-boolean v4, v10, v4

    .line 46
    .line 47
    move v11, v3

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    move v11, v4

    .line 50
    :goto_0
    invoke-virtual/range {p3 .. p3}, Landroid/view/View;->getVisibility()I

    .line 51
    .line 52
    .line 53
    move-result v12

    .line 54
    const/16 v13, 0x8

    .line 55
    .line 56
    const/4 v14, 0x0

    .line 57
    if-ne v12, v13, :cond_1

    .line 58
    .line 59
    move-object v12, v14

    .line 60
    goto :goto_1

    .line 61
    :cond_1
    move-object/from16 v12, p3

    .line 62
    .line 63
    :goto_1
    aput-object v12, v9, v11

    .line 64
    .line 65
    iget-object v12, v0, Lcom/zte/mifavor/widget/AlertController;->g:Lcom/zte/mifavor/widget/ListView;

    .line 66
    .line 67
    if-eqz v12, :cond_2

    .line 68
    .line 69
    move v12, v3

    .line 70
    goto :goto_2

    .line 71
    :cond_2
    move v12, v4

    .line 72
    :goto_2
    aput-boolean v12, v10, v11

    .line 73
    .line 74
    add-int/lit8 v12, v11, 0x1

    .line 75
    .line 76
    if-eqz p7, :cond_3

    .line 77
    .line 78
    aput-object p4, v9, v12

    .line 79
    .line 80
    iget-boolean v13, v0, Lcom/zte/mifavor/widget/AlertController;->S:Z

    .line 81
    .line 82
    aput-boolean v13, v10, v12

    .line 83
    .line 84
    add-int/lit8 v12, v11, 0x2

    .line 85
    .line 86
    :cond_3
    if-eqz p8, :cond_4

    .line 87
    .line 88
    aput-object p5, v9, v12

    .line 89
    .line 90
    aput-boolean v3, v10, v12

    .line 91
    .line 92
    :cond_4
    move v11, v4

    .line 93
    move v12, v11

    .line 94
    move v13, v12

    .line 95
    :goto_3
    if-ge v11, v8, :cond_a

    .line 96
    .line 97
    aget-object v15, v9, v11

    .line 98
    .line 99
    if-nez v15, :cond_5

    .line 100
    .line 101
    goto :goto_7

    .line 102
    :cond_5
    if-eqz v14, :cond_9

    .line 103
    .line 104
    if-nez v12, :cond_7

    .line 105
    .line 106
    if-eqz v13, :cond_6

    .line 107
    .line 108
    move v12, v2

    .line 109
    goto :goto_4

    .line 110
    :cond_6
    move v12, v5

    .line 111
    :goto_4
    invoke-virtual {v14, v12}, Landroid/view/View;->setBackgroundResource(I)V

    .line 112
    .line 113
    .line 114
    goto :goto_6

    .line 115
    :cond_7
    if-eqz v13, :cond_8

    .line 116
    .line 117
    move v12, v6

    .line 118
    goto :goto_5

    .line 119
    :cond_8
    move v12, v7

    .line 120
    :goto_5
    invoke-virtual {v14, v12}, Landroid/view/View;->setBackgroundResource(I)V

    .line 121
    .line 122
    .line 123
    :goto_6
    move v12, v3

    .line 124
    :cond_9
    aget-boolean v13, v10, v11

    .line 125
    .line 126
    move-object v14, v15

    .line 127
    :goto_7
    add-int/lit8 v11, v11, 0x1

    .line 128
    .line 129
    goto :goto_3

    .line 130
    :cond_a
    if-eqz v14, :cond_f

    .line 131
    .line 132
    if-eqz v12, :cond_d

    .line 133
    .line 134
    sget v2, LR3/m;->i:I

    .line 135
    .line 136
    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    sget v5, LR3/m;->k:I

    .line 141
    .line 142
    invoke-virtual {v1, v5, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 143
    .line 144
    .line 145
    move-result v5

    .line 146
    sget v6, LR3/m;->j:I

    .line 147
    .line 148
    invoke-virtual {v1, v6, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    if-eqz v13, :cond_b

    .line 153
    .line 154
    if-eqz p8, :cond_c

    .line 155
    .line 156
    move v2, v5

    .line 157
    goto :goto_8

    .line 158
    :cond_b
    move v2, v1

    .line 159
    :cond_c
    :goto_8
    invoke-virtual {v14, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 160
    .line 161
    .line 162
    goto :goto_a

    .line 163
    :cond_d
    sget v2, LR3/m;->o:I

    .line 164
    .line 165
    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    sget v5, LR3/m;->p:I

    .line 170
    .line 171
    invoke-virtual {v1, v5, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    if-eqz v13, :cond_e

    .line 176
    .line 177
    goto :goto_9

    .line 178
    :cond_e
    move v2, v1

    .line 179
    :goto_9
    invoke-virtual {v14, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 180
    .line 181
    .line 182
    :cond_f
    :goto_a
    iget-object v1, v0, Lcom/zte/mifavor/widget/AlertController;->g:Lcom/zte/mifavor/widget/ListView;

    .line 183
    .line 184
    if-eqz v1, :cond_10

    .line 185
    .line 186
    iget-object v2, v0, Lcom/zte/mifavor/widget/AlertController;->T:Landroid/widget/ListAdapter;

    .line 187
    .line 188
    if-eqz v2, :cond_10

    .line 189
    .line 190
    invoke-virtual {v1, v2}, Lcom/zte/mifavor/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 191
    .line 192
    .line 193
    iget v0, v0, Lcom/zte/mifavor/widget/AlertController;->U:I

    .line 194
    .line 195
    const/4 v2, -0x1

    .line 196
    if-le v0, v2, :cond_10

    .line 197
    .line 198
    invoke-virtual {v1, v0, v3}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setSelection(I)V

    .line 202
    .line 203
    .line 204
    :cond_10
    return-void
.end method

.method private F()V
    .locals 2

    .line 1
    const-string v0, "Z#AlertController"

    .line 2
    .line 3
    const-string v1, "setBottomOnZteTheme setGravity BOTTOM."

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 9
    .line 10
    const/16 v0, 0x50

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/Window;->setGravity(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method static bridge synthetic a(Lcom/zte/mifavor/widget/AlertController;)Landroid/os/Message;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->u:Landroid/os/Message;

    .line 2
    .line 3
    return-object p0
.end method

.method private a0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 2
    .line 3
    sget v1, LR3/g;->k:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/widget/TextView;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->y:Landroid/widget/TextView;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->A:Landroid/view/View$OnClickListener;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->z:Ljava/lang/CharSequence;

    .line 19
    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->y:Landroid/widget/TextView;

    .line 28
    .line 29
    const/16 v0, 0x8

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    return v1

    .line 35
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->y:Landroid/widget/TextView;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->y:Landroid/widget/TextView;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->z:Ljava/lang/CharSequence;

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    return p0
.end method

.method static bridge synthetic b(Lcom/zte/mifavor/widget/AlertController;)Landroid/os/Message;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->x:Landroid/os/Message;

    .line 2
    .line 3
    return-object p0
.end method

.method private b0()Z
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 2
    .line 3
    const v1, 0x1020019

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/Button;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 15
    .line 16
    const v1, 0x102001a

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Landroid/widget/Button;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 26
    .line 27
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 28
    .line 29
    const v2, 0x102001b

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Landroid/widget/Button;

    .line 37
    .line 38
    iput-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->v:Landroid/widget/Button;

    .line 39
    .line 40
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 41
    .line 42
    iget-object v3, p0, Lcom/zte/mifavor/widget/AlertController;->l0:Landroid/view/View$OnClickListener;

    .line 43
    .line 44
    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->q:Ljava/lang/CharSequence;

    .line 48
    .line 49
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    const/4 v3, 0x1

    .line 54
    const/16 v4, 0x8

    .line 55
    .line 56
    const/4 v5, 0x0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 60
    .line 61
    invoke-virtual {v0, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 62
    .line 63
    .line 64
    move v0, v5

    .line 65
    goto :goto_0

    .line 66
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 67
    .line 68
    iget-object v6, p0, Lcom/zte/mifavor/widget/AlertController;->q:Ljava/lang/CharSequence;

    .line 69
    .line 70
    invoke-virtual {v0, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 74
    .line 75
    invoke-virtual {v0, v5}, Landroid/widget/Button;->setVisibility(I)V

    .line 76
    .line 77
    .line 78
    move v0, v3

    .line 79
    :goto_0
    new-instance v6, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    const-string v7, "setup Buttons, mIsRecommendTxt="

    .line 85
    .line 86
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    iget-boolean v7, p0, Lcom/zte/mifavor/widget/AlertController;->e0:Z

    .line 90
    .line 91
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v7, ", mRecommendTxtColor="

    .line 95
    .line 96
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    iget v7, p0, Lcom/zte/mifavor/widget/AlertController;->g0:I

    .line 100
    .line 101
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v7, ", mIsRecommendBackground="

    .line 105
    .line 106
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget-boolean v7, p0, Lcom/zte/mifavor/widget/AlertController;->f0:Z

    .line 110
    .line 111
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string v7, " mIsNegativeTxt="

    .line 115
    .line 116
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    iget-boolean v7, p0, Lcom/zte/mifavor/widget/AlertController;->h0:Z

    .line 120
    .line 121
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string v7, ", mNegativeTxtColor="

    .line 125
    .line 126
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    iget v7, p0, Lcom/zte/mifavor/widget/AlertController;->j0:I

    .line 130
    .line 131
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string v7, ", mIsNegativeBackground="

    .line 135
    .line 136
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    iget-boolean v7, p0, Lcom/zte/mifavor/widget/AlertController;->i0:Z

    .line 140
    .line 141
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v6

    .line 148
    const-string v7, "Z#AlertController"

    .line 149
    .line 150
    invoke-static {v7, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    iget-boolean v6, p0, Lcom/zte/mifavor/widget/AlertController;->e0:Z

    .line 154
    .line 155
    if-eqz v6, :cond_2

    .line 156
    .line 157
    iget-object v6, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 158
    .line 159
    if-eqz v6, :cond_2

    .line 160
    .line 161
    iget v8, p0, Lcom/zte/mifavor/widget/AlertController;->g0:I

    .line 162
    .line 163
    if-eqz v8, :cond_1

    .line 164
    .line 165
    invoke-virtual {v6, v8}, Landroid/widget/Button;->setTextColor(I)V

    .line 166
    .line 167
    .line 168
    goto :goto_1

    .line 169
    :cond_1
    iget-object v8, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 170
    .line 171
    sget v9, LR3/d;->y:I

    .line 172
    .line 173
    invoke-virtual {v8, v9}, Landroid/content/Context;->getColor(I)I

    .line 174
    .line 175
    .line 176
    move-result v8

    .line 177
    invoke-virtual {v6, v8}, Landroid/widget/Button;->setTextColor(I)V

    .line 178
    .line 179
    .line 180
    :goto_1
    sget-boolean v6, Lcom/zte/mifavor/widget/u;->b:Z

    .line 181
    .line 182
    if-eqz v6, :cond_2

    .line 183
    .line 184
    iget-object v6, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 185
    .line 186
    invoke-virtual {v6, v5}, Landroid/widget/Button;->setForceDarkAllowed(Z)V

    .line 187
    .line 188
    .line 189
    :cond_2
    iget-boolean v6, p0, Lcom/zte/mifavor/widget/AlertController;->h0:Z

    .line 190
    .line 191
    if-eqz v6, :cond_4

    .line 192
    .line 193
    iget-object v6, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 194
    .line 195
    if-eqz v6, :cond_4

    .line 196
    .line 197
    iget v8, p0, Lcom/zte/mifavor/widget/AlertController;->j0:I

    .line 198
    .line 199
    if-eqz v8, :cond_3

    .line 200
    .line 201
    invoke-virtual {v6, v8}, Landroid/widget/Button;->setTextColor(I)V

    .line 202
    .line 203
    .line 204
    goto :goto_2

    .line 205
    :cond_3
    iget-object v8, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 206
    .line 207
    sget v9, LR3/d;->y:I

    .line 208
    .line 209
    invoke-virtual {v8, v9}, Landroid/content/Context;->getColor(I)I

    .line 210
    .line 211
    .line 212
    move-result v8

    .line 213
    invoke-virtual {v6, v8}, Landroid/widget/Button;->setTextColor(I)V

    .line 214
    .line 215
    .line 216
    :goto_2
    sget-boolean v6, Lcom/zte/mifavor/widget/u;->b:Z

    .line 217
    .line 218
    if-eqz v6, :cond_4

    .line 219
    .line 220
    iget-object v6, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 221
    .line 222
    invoke-virtual {v6, v5}, Landroid/widget/Button;->setForceDarkAllowed(Z)V

    .line 223
    .line 224
    .line 225
    :cond_4
    iget-object v6, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 226
    .line 227
    invoke-virtual {v6, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    check-cast v1, Landroid/widget/Button;

    .line 232
    .line 233
    iput-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 234
    .line 235
    iget-object v6, p0, Lcom/zte/mifavor/widget/AlertController;->l0:Landroid/view/View$OnClickListener;

    .line 236
    .line 237
    invoke-virtual {v1, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 238
    .line 239
    .line 240
    iget-boolean v1, p0, Lcom/zte/mifavor/widget/AlertController;->f0:Z

    .line 241
    .line 242
    const-string v6, "setup Buttons, mButtonNegative is null."

    .line 243
    .line 244
    if-eqz v1, :cond_8

    .line 245
    .line 246
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 247
    .line 248
    if-eqz v1, :cond_5

    .line 249
    .line 250
    iget-object v8, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 251
    .line 252
    sget v9, LR3/l;->m:I

    .line 253
    .line 254
    invoke-virtual {v1, v8, v9}, Landroid/widget/Button;->setTextAppearance(Landroid/content/Context;I)V

    .line 255
    .line 256
    .line 257
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 258
    .line 259
    sget v8, LR3/f;->b:I

    .line 260
    .line 261
    invoke-virtual {v1, v8}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 262
    .line 263
    .line 264
    sget-boolean v1, Lcom/zte/mifavor/widget/u;->b:Z

    .line 265
    .line 266
    if-eqz v1, :cond_6

    .line 267
    .line 268
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 269
    .line 270
    invoke-virtual {v1, v5}, Landroid/widget/Button;->setForceDarkAllowed(Z)V

    .line 271
    .line 272
    .line 273
    goto :goto_3

    .line 274
    :cond_5
    const-string v1, "setup Buttons, mButtonPositive is null."

    .line 275
    .line 276
    invoke-static {v7, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    .line 278
    .line 279
    :cond_6
    :goto_3
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 280
    .line 281
    if-eqz v1, :cond_7

    .line 282
    .line 283
    sget v8, LR3/f;->c:I

    .line 284
    .line 285
    invoke-virtual {v1, v8}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 286
    .line 287
    .line 288
    sget-boolean v1, Lcom/zte/mifavor/widget/u;->b:Z

    .line 289
    .line 290
    if-eqz v1, :cond_8

    .line 291
    .line 292
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 293
    .line 294
    invoke-virtual {v1, v5}, Landroid/widget/Button;->setForceDarkAllowed(Z)V

    .line 295
    .line 296
    .line 297
    goto :goto_4

    .line 298
    :cond_7
    invoke-static {v7, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 299
    .line 300
    .line 301
    :cond_8
    :goto_4
    iget-boolean v1, p0, Lcom/zte/mifavor/widget/AlertController;->i0:Z

    .line 302
    .line 303
    if-eqz v1, :cond_a

    .line 304
    .line 305
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 306
    .line 307
    if-eqz v1, :cond_9

    .line 308
    .line 309
    iget-object v6, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 310
    .line 311
    sget v8, LR3/l;->m:I

    .line 312
    .line 313
    invoke-virtual {v1, v6, v8}, Landroid/widget/Button;->setTextAppearance(Landroid/content/Context;I)V

    .line 314
    .line 315
    .line 316
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 317
    .line 318
    sget v6, LR3/f;->b:I

    .line 319
    .line 320
    invoke-virtual {v1, v6}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 321
    .line 322
    .line 323
    sget-boolean v1, Lcom/zte/mifavor/widget/u;->b:Z

    .line 324
    .line 325
    if-eqz v1, :cond_a

    .line 326
    .line 327
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 328
    .line 329
    invoke-virtual {v1, v5}, Landroid/widget/Button;->setForceDarkAllowed(Z)V

    .line 330
    .line 331
    .line 332
    goto :goto_5

    .line 333
    :cond_9
    invoke-static {v7, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 334
    .line 335
    .line 336
    :cond_a
    :goto_5
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->t:Ljava/lang/CharSequence;

    .line 337
    .line 338
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 339
    .line 340
    .line 341
    move-result v1

    .line 342
    if-eqz v1, :cond_b

    .line 343
    .line 344
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 345
    .line 346
    invoke-virtual {v1, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 347
    .line 348
    .line 349
    goto :goto_6

    .line 350
    :cond_b
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 351
    .line 352
    iget-object v6, p0, Lcom/zte/mifavor/widget/AlertController;->t:Ljava/lang/CharSequence;

    .line 353
    .line 354
    invoke-virtual {v1, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 355
    .line 356
    .line 357
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 358
    .line 359
    invoke-virtual {v1, v5}, Landroid/widget/Button;->setVisibility(I)V

    .line 360
    .line 361
    .line 362
    or-int/lit8 v0, v0, 0x2

    .line 363
    .line 364
    :goto_6
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 365
    .line 366
    invoke-virtual {v1, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 367
    .line 368
    .line 369
    move-result-object v1

    .line 370
    check-cast v1, Landroid/widget/Button;

    .line 371
    .line 372
    iput-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->v:Landroid/widget/Button;

    .line 373
    .line 374
    iget-object v2, p0, Lcom/zte/mifavor/widget/AlertController;->l0:Landroid/view/View$OnClickListener;

    .line 375
    .line 376
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 377
    .line 378
    .line 379
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->w:Ljava/lang/CharSequence;

    .line 380
    .line 381
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 382
    .line 383
    .line 384
    move-result v1

    .line 385
    if-eqz v1, :cond_c

    .line 386
    .line 387
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->v:Landroid/widget/Button;

    .line 388
    .line 389
    invoke-virtual {v1, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 390
    .line 391
    .line 392
    goto :goto_7

    .line 393
    :cond_c
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->v:Landroid/widget/Button;

    .line 394
    .line 395
    iget-object v2, p0, Lcom/zte/mifavor/widget/AlertController;->w:Ljava/lang/CharSequence;

    .line 396
    .line 397
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 398
    .line 399
    .line 400
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->v:Landroid/widget/Button;

    .line 401
    .line 402
    invoke-virtual {v1, v5}, Landroid/widget/Button;->setVisibility(I)V

    .line 403
    .line 404
    .line 405
    or-int/lit8 v0, v0, 0x4

    .line 406
    .line 407
    :goto_7
    sput v0, Lcom/zte/mifavor/widget/AlertController;->q0:I

    .line 408
    .line 409
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 410
    .line 411
    invoke-static {v1}, Lcom/zte/mifavor/widget/AlertController;->h0(Landroid/content/Context;)Z

    .line 412
    .line 413
    .line 414
    move-result v1

    .line 415
    const/4 v2, 0x2

    .line 416
    const/4 v6, 0x3

    .line 417
    const/4 v8, 0x4

    .line 418
    if-eqz v1, :cond_f

    .line 419
    .line 420
    iget v1, p0, Lcom/zte/mifavor/widget/AlertController;->m0:I

    .line 421
    .line 422
    if-eq v1, v6, :cond_f

    .line 423
    .line 424
    if-ne v0, v3, :cond_d

    .line 425
    .line 426
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 427
    .line 428
    invoke-direct {p0, v1}, Lcom/zte/mifavor/widget/AlertController;->u(Landroid/widget/Button;)V

    .line 429
    .line 430
    .line 431
    goto :goto_8

    .line 432
    :cond_d
    if-ne v0, v2, :cond_e

    .line 433
    .line 434
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 435
    .line 436
    invoke-direct {p0, v1}, Lcom/zte/mifavor/widget/AlertController;->u(Landroid/widget/Button;)V

    .line 437
    .line 438
    .line 439
    goto :goto_8

    .line 440
    :cond_e
    if-ne v0, v8, :cond_f

    .line 441
    .line 442
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->v:Landroid/widget/Button;

    .line 443
    .line 444
    invoke-direct {p0, v1}, Lcom/zte/mifavor/widget/AlertController;->u(Landroid/widget/Button;)V

    .line 445
    .line 446
    .line 447
    :cond_f
    :goto_8
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 448
    .line 449
    sget v9, LR3/g;->x:I

    .line 450
    .line 451
    invoke-virtual {v1, v9}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 452
    .line 453
    .line 454
    move-result-object v1

    .line 455
    check-cast v1, Landroid/widget/ImageView;

    .line 456
    .line 457
    iput-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->B:Landroid/widget/ImageView;

    .line 458
    .line 459
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 460
    .line 461
    sget v10, LR3/g;->y:I

    .line 462
    .line 463
    invoke-virtual {v1, v10}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 464
    .line 465
    .line 466
    move-result-object v1

    .line 467
    check-cast v1, Landroid/widget/ImageView;

    .line 468
    .line 469
    iput-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->C:Landroid/widget/ImageView;

    .line 470
    .line 471
    iget v1, p0, Lcom/zte/mifavor/widget/AlertController;->m0:I

    .line 472
    .line 473
    const/4 v11, 0x7

    .line 474
    const/4 v12, 0x5

    .line 475
    const/4 v13, 0x6

    .line 476
    if-eq v1, v6, :cond_14

    .line 477
    .line 478
    if-eq v0, v6, :cond_12

    .line 479
    .line 480
    if-ne v0, v13, :cond_10

    .line 481
    .line 482
    goto :goto_9

    .line 483
    :cond_10
    if-ne v0, v12, :cond_11

    .line 484
    .line 485
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->B:Landroid/widget/ImageView;

    .line 486
    .line 487
    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 488
    .line 489
    .line 490
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->C:Landroid/widget/ImageView;

    .line 491
    .line 492
    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 493
    .line 494
    .line 495
    goto :goto_a

    .line 496
    :cond_11
    if-ne v0, v11, :cond_13

    .line 497
    .line 498
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->B:Landroid/widget/ImageView;

    .line 499
    .line 500
    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 501
    .line 502
    .line 503
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->C:Landroid/widget/ImageView;

    .line 504
    .line 505
    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 506
    .line 507
    .line 508
    goto :goto_a

    .line 509
    :cond_12
    :goto_9
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->B:Landroid/widget/ImageView;

    .line 510
    .line 511
    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 512
    .line 513
    .line 514
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->C:Landroid/widget/ImageView;

    .line 515
    .line 516
    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 517
    .line 518
    .line 519
    :cond_13
    :goto_a
    if-eq v0, v3, :cond_1a

    .line 520
    .line 521
    if-eq v0, v2, :cond_1a

    .line 522
    .line 523
    if-eq v0, v8, :cond_1a

    .line 524
    .line 525
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 526
    .line 527
    sget v2, LR3/g;->J:I

    .line 528
    .line 529
    invoke-virtual {v1, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 530
    .line 531
    .line 532
    move-result-object v1

    .line 533
    check-cast v1, Landroid/widget/Space;

    .line 534
    .line 535
    iput-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->D:Landroid/widget/Space;

    .line 536
    .line 537
    invoke-virtual {v1, v5}, Landroid/widget/Space;->setVisibility(I)V

    .line 538
    .line 539
    .line 540
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 541
    .line 542
    sget v2, LR3/g;->i0:I

    .line 543
    .line 544
    invoke-virtual {v1, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 545
    .line 546
    .line 547
    move-result-object v1

    .line 548
    check-cast v1, Landroid/widget/Space;

    .line 549
    .line 550
    iput-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->E:Landroid/widget/Space;

    .line 551
    .line 552
    invoke-virtual {v1, v5}, Landroid/widget/Space;->setVisibility(I)V

    .line 553
    .line 554
    .line 555
    goto/16 :goto_d

    .line 556
    .line 557
    :cond_14
    if-ne v1, v6, :cond_1a

    .line 558
    .line 559
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 560
    .line 561
    invoke-virtual {v1, v9}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 562
    .line 563
    .line 564
    move-result-object v1

    .line 565
    check-cast v1, Landroid/widget/ImageView;

    .line 566
    .line 567
    iput-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->B:Landroid/widget/ImageView;

    .line 568
    .line 569
    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 570
    .line 571
    .line 572
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 573
    .line 574
    invoke-virtual {v1, v10}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 575
    .line 576
    .line 577
    move-result-object v1

    .line 578
    check-cast v1, Landroid/widget/ImageView;

    .line 579
    .line 580
    iput-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->C:Landroid/widget/ImageView;

    .line 581
    .line 582
    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 583
    .line 584
    .line 585
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 586
    .line 587
    sget v9, LR3/g;->l:I

    .line 588
    .line 589
    invoke-virtual {v1, v9}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 590
    .line 591
    .line 592
    move-result-object v1

    .line 593
    check-cast v1, Landroid/widget/Space;

    .line 594
    .line 595
    iput-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->F:Landroid/widget/Space;

    .line 596
    .line 597
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 598
    .line 599
    sget v9, LR3/g;->m:I

    .line 600
    .line 601
    invoke-virtual {v1, v9}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 602
    .line 603
    .line 604
    move-result-object v1

    .line 605
    check-cast v1, Landroid/widget/Space;

    .line 606
    .line 607
    iput-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->G:Landroid/widget/Space;

    .line 608
    .line 609
    if-eq v0, v3, :cond_19

    .line 610
    .line 611
    if-eq v0, v2, :cond_19

    .line 612
    .line 613
    if-ne v0, v8, :cond_15

    .line 614
    .line 615
    goto :goto_c

    .line 616
    :cond_15
    if-ne v0, v13, :cond_16

    .line 617
    .line 618
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->F:Landroid/widget/Space;

    .line 619
    .line 620
    invoke-virtual {v1, v5}, Landroid/widget/Space;->setVisibility(I)V

    .line 621
    .line 622
    .line 623
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->G:Landroid/widget/Space;

    .line 624
    .line 625
    invoke-virtual {v1, v4}, Landroid/widget/Space;->setVisibility(I)V

    .line 626
    .line 627
    .line 628
    goto :goto_d

    .line 629
    :cond_16
    if-eq v0, v12, :cond_18

    .line 630
    .line 631
    if-ne v0, v6, :cond_17

    .line 632
    .line 633
    goto :goto_b

    .line 634
    :cond_17
    if-ne v0, v11, :cond_1a

    .line 635
    .line 636
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->F:Landroid/widget/Space;

    .line 637
    .line 638
    invoke-virtual {v1, v5}, Landroid/widget/Space;->setVisibility(I)V

    .line 639
    .line 640
    .line 641
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->G:Landroid/widget/Space;

    .line 642
    .line 643
    invoke-virtual {v1, v5}, Landroid/widget/Space;->setVisibility(I)V

    .line 644
    .line 645
    .line 646
    goto :goto_d

    .line 647
    :cond_18
    :goto_b
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->F:Landroid/widget/Space;

    .line 648
    .line 649
    invoke-virtual {v1, v4}, Landroid/widget/Space;->setVisibility(I)V

    .line 650
    .line 651
    .line 652
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->G:Landroid/widget/Space;

    .line 653
    .line 654
    invoke-virtual {v1, v5}, Landroid/widget/Space;->setVisibility(I)V

    .line 655
    .line 656
    .line 657
    goto :goto_d

    .line 658
    :cond_19
    :goto_c
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->F:Landroid/widget/Space;

    .line 659
    .line 660
    invoke-virtual {v1, v4}, Landroid/widget/Space;->setVisibility(I)V

    .line 661
    .line 662
    .line 663
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->G:Landroid/widget/Space;

    .line 664
    .line 665
    invoke-virtual {v1, v4}, Landroid/widget/Space;->setVisibility(I)V

    .line 666
    .line 667
    .line 668
    :cond_1a
    :goto_d
    new-instance v1, Ljava/lang/StringBuilder;

    .line 669
    .line 670
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 671
    .line 672
    .line 673
    const-string v2, "hide divider mIsRecommendBackground = "

    .line 674
    .line 675
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 676
    .line 677
    .line 678
    iget-boolean v2, p0, Lcom/zte/mifavor/widget/AlertController;->f0:Z

    .line 679
    .line 680
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 681
    .line 682
    .line 683
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 684
    .line 685
    .line 686
    move-result-object v1

    .line 687
    invoke-static {v7, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 688
    .line 689
    .line 690
    iget-boolean v1, p0, Lcom/zte/mifavor/widget/AlertController;->f0:Z

    .line 691
    .line 692
    if-eqz v1, :cond_1b

    .line 693
    .line 694
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->B:Landroid/widget/ImageView;

    .line 695
    .line 696
    invoke-virtual {v1, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 697
    .line 698
    .line 699
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->C:Landroid/widget/ImageView;

    .line 700
    .line 701
    invoke-virtual {v1, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 702
    .line 703
    .line 704
    iget-boolean v1, p0, Lcom/zte/mifavor/widget/AlertController;->k0:Z

    .line 705
    .line 706
    if-eqz v1, :cond_1b

    .line 707
    .line 708
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->B:Landroid/widget/ImageView;

    .line 709
    .line 710
    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 711
    .line 712
    .line 713
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->C:Landroid/widget/ImageView;

    .line 714
    .line 715
    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 716
    .line 717
    .line 718
    invoke-direct {p0}, Lcom/zte/mifavor/widget/AlertController;->w()V

    .line 719
    .line 720
    .line 721
    :cond_1b
    if-eqz v0, :cond_1c

    .line 722
    .line 723
    return v3

    .line 724
    :cond_1c
    return v5
.end method

.method static bridge synthetic c(Lcom/zte/mifavor/widget/AlertController;)Landroid/os/Message;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->r:Landroid/os/Message;

    .line 2
    .line 3
    return-object p0
.end method

.method private c0(Landroid/widget/LinearLayout;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 2
    .line 3
    sget v1, LR3/g;->j0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/widget/ScrollView;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->H:Landroid/widget/ScrollView;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/widget/ScrollView;->setFocusable(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 20
    .line 21
    const v3, 0x102000b

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v3}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Landroid/widget/TextView;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->P:Landroid/widget/TextView;

    .line 31
    .line 32
    const-string v3, "Z#AlertController"

    .line 33
    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    const-string p0, "setup Content. mMessageView is null."

    .line 37
    .line 38
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget-object v4, p0, Lcom/zte/mifavor/widget/AlertController;->e:Ljava/lang/CharSequence;

    .line 43
    .line 44
    const/16 v5, 0x8

    .line 45
    .line 46
    if-eqz v4, :cond_2

    .line 47
    .line 48
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->H:Landroid/widget/ScrollView;

    .line 56
    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    iget-object v4, p0, Lcom/zte/mifavor/widget/AlertController;->P:Landroid/widget/TextView;

    .line 60
    .line 61
    invoke-virtual {v0, v4}, Landroid/widget/ScrollView;->removeView(Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    const-string v4, "setup Content. addView mListView="

    .line 70
    .line 71
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    iget-object v4, p0, Lcom/zte/mifavor/widget/AlertController;->g:Lcom/zte/mifavor/widget/ListView;

    .line 75
    .line 76
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->g:Lcom/zte/mifavor/widget/ListView;

    .line 87
    .line 88
    if-eqz v0, :cond_4

    .line 89
    .line 90
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->g:Lcom/zte/mifavor/widget/ListView;

    .line 100
    .line 101
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 102
    .line 103
    const/4 v4, -0x1

    .line 104
    invoke-direct {v1, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 108
    .line 109
    .line 110
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 111
    .line 112
    const/high16 v1, 0x3f800000    # 1.0f

    .line 113
    .line 114
    invoke-direct {v0, v4, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_4
    invoke-virtual {p1, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 122
    .line 123
    .line 124
    :goto_0
    iget-object p1, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 125
    .line 126
    sget v0, LR3/g;->q0:I

    .line 127
    .line 128
    invoke-virtual {p1, v0}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    check-cast p1, Landroid/widget/TextView;

    .line 133
    .line 134
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController;->Q:Landroid/widget/TextView;

    .line 135
    .line 136
    if-nez p1, :cond_5

    .line 137
    .line 138
    const-string p0, "setup Content. mSubTitleView is null."

    .line 139
    .line 140
    invoke-static {v3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_5
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->f:Ljava/lang/CharSequence;

    .line 145
    .line 146
    if-eqz v0, :cond_6

    .line 147
    .line 148
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 149
    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_6
    invoke-virtual {p1, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 153
    .line 154
    .line 155
    iget-object p1, p0, Lcom/zte/mifavor/widget/AlertController;->H:Landroid/widget/ScrollView;

    .line 156
    .line 157
    if-eqz p1, :cond_7

    .line 158
    .line 159
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->Q:Landroid/widget/TextView;

    .line 160
    .line 161
    invoke-virtual {p1, v0}, Landroid/widget/ScrollView;->removeView(Landroid/view/View;)V

    .line 162
    .line 163
    .line 164
    :cond_7
    :goto_1
    iget-object p1, p0, Lcom/zte/mifavor/widget/AlertController;->Q:Landroid/widget/TextView;

    .line 165
    .line 166
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->o0:Landroid/view/View$OnLayoutChangeListener;

    .line 167
    .line 168
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 169
    .line 170
    .line 171
    iget-object p1, p0, Lcom/zte/mifavor/widget/AlertController;->P:Landroid/widget/TextView;

    .line 172
    .line 173
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->p0:Landroid/view/View$OnLayoutChangeListener;

    .line 174
    .line 175
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 176
    .line 177
    .line 178
    return-void
.end method

.method static bridge synthetic d(Lcom/zte/mifavor/widget/AlertController;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method private d0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 8
    .line 9
    sget v2, LR3/g;->V:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    new-instance v2, Lcom/zte/mifavor/widget/AlertController$b;

    .line 20
    .line 21
    invoke-direct {v2, p0, v1}, Lcom/zte/mifavor/widget/AlertController$b;-><init>(Lcom/zte/mifavor/widget/AlertController;Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    invoke-virtual {v0, p0}, Landroid/view/View;->setFitsSystemWindows(Z)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/view/View;->requestApplyInsets()V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method static bridge synthetic e(Lcom/zte/mifavor/widget/AlertController;)Landroid/content/DialogInterface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->b:Landroid/content/DialogInterface;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/zte/mifavor/widget/AlertController;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->c0:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method private f0(Landroid/widget/LinearLayout;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->R:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/16 v2, 0x8

    .line 5
    .line 6
    const/4 v3, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 10
    .line 11
    const/4 v4, -0x1

    .line 12
    const/4 v5, -0x2

    .line 13
    invoke-direct {v0, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 14
    .line 15
    .line 16
    iget-object v4, p0, Lcom/zte/mifavor/widget/AlertController;->R:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {p1, v4, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 22
    .line 23
    sget v0, LR3/g;->D0:I

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    goto/16 :goto_1

    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 35
    .line 36
    sget v4, LR3/g;->E:I

    .line 37
    .line 38
    invoke-virtual {v0, v4}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Landroid/widget/ImageView;

    .line 43
    .line 44
    iput-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->K:Landroid/widget/ImageView;

    .line 45
    .line 46
    iget v0, p0, Lcom/zte/mifavor/widget/AlertController;->m0:I

    .line 47
    .line 48
    const/4 v4, 0x3

    .line 49
    if-ne v0, v4, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 52
    .line 53
    sget v4, LR3/g;->n:I

    .line 54
    .line 55
    invoke-virtual {v0, v4}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Landroid/widget/ImageView;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->L:Landroid/widget/ImageView;

    .line 62
    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    new-instance v4, Lcom/zte/mifavor/widget/AlertController$c;

    .line 66
    .line 67
    invoke-direct {v4, p0}, Lcom/zte/mifavor/widget/AlertController$c;-><init>(Lcom/zte/mifavor/widget/AlertController;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->d:Ljava/lang/CharSequence;

    .line 74
    .line 75
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    xor-int/2addr v0, v3

    .line 80
    iget-boolean v4, p0, Lcom/zte/mifavor/widget/AlertController;->N:Z

    .line 81
    .line 82
    and-int/2addr v0, v4

    .line 83
    if-eqz v0, :cond_5

    .line 84
    .line 85
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 86
    .line 87
    sget v1, LR3/g;->a:I

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Lcom/zte/mifavor/widget/TextViewZTE;

    .line 94
    .line 95
    iput-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->M:Lcom/zte/mifavor/widget/TextViewZTE;

    .line 96
    .line 97
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->d:Ljava/lang/CharSequence;

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    iget v0, p0, Lcom/zte/mifavor/widget/AlertController;->I:I

    .line 103
    .line 104
    if-eqz v0, :cond_2

    .line 105
    .line 106
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->K:Landroid/widget/ImageView;

    .line 107
    .line 108
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_2
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->J:Landroid/graphics/drawable/Drawable;

    .line 113
    .line 114
    if-eqz v0, :cond_3

    .line 115
    .line 116
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->K:Landroid/widget/ImageView;

    .line 117
    .line 118
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 119
    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_3
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->M:Lcom/zte/mifavor/widget/TextViewZTE;

    .line 123
    .line 124
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->K:Landroid/widget/ImageView;

    .line 125
    .line 126
    invoke-virtual {v1}, Landroid/widget/ImageView;->getPaddingLeft()I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    iget-object v4, p0, Lcom/zte/mifavor/widget/AlertController;->K:Landroid/widget/ImageView;

    .line 131
    .line 132
    invoke-virtual {v4}, Landroid/widget/ImageView;->getPaddingTop()I

    .line 133
    .line 134
    .line 135
    move-result v4

    .line 136
    iget-object v5, p0, Lcom/zte/mifavor/widget/AlertController;->K:Landroid/widget/ImageView;

    .line 137
    .line 138
    invoke-virtual {v5}, Landroid/widget/ImageView;->getPaddingRight()I

    .line 139
    .line 140
    .line 141
    move-result v5

    .line 142
    iget-object v6, p0, Lcom/zte/mifavor/widget/AlertController;->K:Landroid/widget/ImageView;

    .line 143
    .line 144
    invoke-virtual {v6}, Landroid/widget/ImageView;->getPaddingBottom()I

    .line 145
    .line 146
    .line 147
    move-result v6

    .line 148
    invoke-virtual {v0, v1, v4, v5, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->K:Landroid/widget/ImageView;

    .line 152
    .line 153
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 154
    .line 155
    .line 156
    :goto_0
    if-eqz p1, :cond_4

    .line 157
    .line 158
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 159
    .line 160
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    sget v1, LR3/e;->u:I

    .line 165
    .line 166
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    float-to-int v0, v0

    .line 171
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 172
    .line 173
    .line 174
    :cond_4
    :goto_1
    move v1, v3

    .line 175
    goto :goto_2

    .line 176
    :cond_5
    iget-object p1, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 177
    .line 178
    sget v0, LR3/g;->D0:I

    .line 179
    .line 180
    invoke-virtual {p1, v0}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 185
    .line 186
    .line 187
    iget-object p1, p0, Lcom/zte/mifavor/widget/AlertController;->K:Landroid/widget/ImageView;

    .line 188
    .line 189
    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 190
    .line 191
    .line 192
    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 193
    .line 194
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 195
    .line 196
    .line 197
    const-string v0, "setup Title out. hasTitle="

    .line 198
    .line 199
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    const-string v0, ", mIsShowTitle="

    .line 206
    .line 207
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/AlertController;->N:Z

    .line 211
    .line 212
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    const-string p1, "Z#AlertController"

    .line 220
    .line 221
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    .line 223
    .line 224
    return v1
.end method

.method static bridge synthetic g(Lcom/zte/mifavor/widget/AlertController;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/AlertController;->a0:I

    .line 2
    .line 3
    return p0
.end method

.method private g0()V
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 2
    .line 3
    sget v1, LR3/g;->p:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    move-object v4, v0

    .line 10
    check-cast v4, Landroid/widget/LinearLayout;

    .line 11
    .line 12
    invoke-direct {p0, v4}, Lcom/zte/mifavor/widget/AlertController;->c0(Landroid/widget/LinearLayout;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0}, Lcom/zte/mifavor/widget/AlertController;->b0()Z

    .line 16
    .line 17
    .line 18
    move-result v9

    .line 19
    invoke-direct {p0}, Lcom/zte/mifavor/widget/AlertController;->a0()Z

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 23
    .line 24
    sget v1, LR3/g;->E0:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    move-object v3, v0

    .line 31
    check-cast v3, Landroid/widget/LinearLayout;

    .line 32
    .line 33
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 34
    .line 35
    sget-object v1, LR3/m;->h:[I

    .line 36
    .line 37
    iget v2, p0, Lcom/zte/mifavor/widget/AlertController;->n0:I

    .line 38
    .line 39
    const/4 v5, 0x0

    .line 40
    const/4 v6, 0x0

    .line 41
    invoke-virtual {v0, v5, v1, v2, v6}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-direct {p0, v3}, Lcom/zte/mifavor/widget/AlertController;->f0(Landroid/widget/LinearLayout;)Z

    .line 46
    .line 47
    .line 48
    move-result v7

    .line 49
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 50
    .line 51
    sget v1, LR3/g;->j:I

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->i:Landroid/view/View;

    .line 58
    .line 59
    const/4 v1, 0x1

    .line 60
    const/16 v8, 0x8

    .line 61
    .line 62
    if-nez v9, :cond_1

    .line 63
    .line 64
    invoke-virtual {v0, v8}, Landroid/view/View;->setVisibility(I)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 68
    .line 69
    sget v10, LR3/g;->w0:I

    .line 70
    .line 71
    invoke-virtual {v0, v10}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    if-eqz v0, :cond_0

    .line 76
    .line 77
    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    .line 78
    .line 79
    .line 80
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/view/Window;->setCloseOnTouchOutsideIfNotSet(Z)V

    .line 83
    .line 84
    .line 85
    :cond_1
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 86
    .line 87
    sget v10, LR3/g;->r:I

    .line 88
    .line 89
    invoke-virtual {v0, v10}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Landroid/widget/FrameLayout;

    .line 94
    .line 95
    iget-object v10, p0, Lcom/zte/mifavor/widget/AlertController;->h:Landroid/view/View;

    .line 96
    .line 97
    if-eqz v10, :cond_2

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_2
    iget v10, p0, Lcom/zte/mifavor/widget/AlertController;->j:I

    .line 101
    .line 102
    if-eqz v10, :cond_3

    .line 103
    .line 104
    iget-object v10, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 105
    .line 106
    invoke-static {v10}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 107
    .line 108
    .line 109
    move-result-object v10

    .line 110
    iget v11, p0, Lcom/zte/mifavor/widget/AlertController;->j:I

    .line 111
    .line 112
    invoke-virtual {v10, v11, v0, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v10

    .line 116
    goto :goto_0

    .line 117
    :cond_3
    move-object v10, v5

    .line 118
    :goto_0
    if-eqz v10, :cond_4

    .line 119
    .line 120
    move v6, v1

    .line 121
    :cond_4
    if-eqz v6, :cond_5

    .line 122
    .line 123
    invoke-static {v10}, Lcom/zte/mifavor/widget/AlertController;->t(Landroid/view/View;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-nez v1, :cond_6

    .line 128
    .line 129
    :cond_5
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 130
    .line 131
    const/high16 v11, 0x20000

    .line 132
    .line 133
    invoke-virtual {v1, v11, v11}, Landroid/view/Window;->setFlags(II)V

    .line 134
    .line 135
    .line 136
    :cond_6
    if-eqz v6, :cond_8

    .line 137
    .line 138
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 139
    .line 140
    sget v11, LR3/g;->q:I

    .line 141
    .line 142
    invoke-virtual {v1, v11}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    check-cast v1, Landroid/widget/FrameLayout;

    .line 147
    .line 148
    new-instance v11, Landroid/view/ViewGroup$LayoutParams;

    .line 149
    .line 150
    const/4 v12, -0x1

    .line 151
    invoke-direct {v11, v12, v12}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v1, v10, v11}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 155
    .line 156
    .line 157
    iget-boolean v10, p0, Lcom/zte/mifavor/widget/AlertController;->o:Z

    .line 158
    .line 159
    if-eqz v10, :cond_7

    .line 160
    .line 161
    iget v10, p0, Lcom/zte/mifavor/widget/AlertController;->k:I

    .line 162
    .line 163
    iget v11, p0, Lcom/zte/mifavor/widget/AlertController;->l:I

    .line 164
    .line 165
    iget v12, p0, Lcom/zte/mifavor/widget/AlertController;->m:I

    .line 166
    .line 167
    iget v13, p0, Lcom/zte/mifavor/widget/AlertController;->n:I

    .line 168
    .line 169
    invoke-virtual {v1, v10, v11, v12, v13}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 170
    .line 171
    .line 172
    :cond_7
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->g:Lcom/zte/mifavor/widget/ListView;

    .line 173
    .line 174
    if-eqz v1, :cond_9

    .line 175
    .line 176
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 181
    .line 182
    const/4 v10, 0x0

    .line 183
    iput v10, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 184
    .line 185
    goto :goto_1

    .line 186
    :cond_8
    invoke-virtual {v0, v8}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 187
    .line 188
    .line 189
    :cond_9
    :goto_1
    if-eqz v7, :cond_b

    .line 190
    .line 191
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->g:Lcom/zte/mifavor/widget/ListView;

    .line 192
    .line 193
    if-eqz v1, :cond_a

    .line 194
    .line 195
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 196
    .line 197
    sget v5, LR3/g;->z0:I

    .line 198
    .line 199
    invoke-virtual {v1, v5}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 200
    .line 201
    .line 202
    move-result-object v5

    .line 203
    :cond_a
    if-eqz v5, :cond_b

    .line 204
    .line 205
    invoke-virtual {v5, v8}, Landroid/view/View;->setVisibility(I)V

    .line 206
    .line 207
    .line 208
    :cond_b
    move v8, v6

    .line 209
    iget-object v6, p0, Lcom/zte/mifavor/widget/AlertController;->i:Landroid/view/View;

    .line 210
    .line 211
    move-object v1, p0

    .line 212
    move-object v5, v0

    .line 213
    invoke-direct/range {v1 .. v9}, Lcom/zte/mifavor/widget/AlertController;->E(Landroid/content/res/TypedArray;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;ZZZ)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 217
    .line 218
    .line 219
    return-void
.end method

.method static bridge synthetic h(Lcom/zte/mifavor/widget/AlertController;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/AlertController;->X:I

    .line 2
    .line 3
    return p0
.end method

.method private static h0(Landroid/content/Context;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method static bridge synthetic i(Lcom/zte/mifavor/widget/AlertController;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->P:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic j(Lcom/zte/mifavor/widget/AlertController;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/AlertController;->Y:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic k(Lcom/zte/mifavor/widget/AlertController;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/AlertController;->Z:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic l(Lcom/zte/mifavor/widget/AlertController;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->Q:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic m(Lcom/zte/mifavor/widget/AlertController;Landroid/widget/ListAdapter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController;->T:Landroid/widget/ListAdapter;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic n(Lcom/zte/mifavor/widget/AlertController;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/AlertController;->U:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic o(Lcom/zte/mifavor/widget/AlertController;Lcom/zte/mifavor/widget/ListView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController;->g:Lcom/zte/mifavor/widget/ListView;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic p()I
    .locals 1

    .line 1
    sget v0, Lcom/zte/mifavor/widget/AlertController;->r0:I

    .line 2
    .line 3
    return v0
.end method

.method static bridge synthetic q()I
    .locals 1

    .line 1
    sget v0, Lcom/zte/mifavor/widget/AlertController;->q0:I

    .line 2
    .line 3
    return v0
.end method

.method static bridge synthetic r(I)V
    .locals 0

    .line 1
    sput p0, Lcom/zte/mifavor/widget/AlertController;->r0:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic s(I)V
    .locals 0

    .line 1
    sput p0, Lcom/zte/mifavor/widget/AlertController;->q0:I

    .line 2
    .line 3
    return-void
.end method

.method static t(Landroid/view/View;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->onCheckIsTextEditor()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    return v2

    .line 15
    :cond_1
    check-cast p0, Landroid/view/ViewGroup;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    :cond_2
    if-lez v0, :cond_3

    .line 22
    .line 23
    add-int/lit8 v0, v0, -0x1

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-static {v3}, Lcom/zte/mifavor/widget/AlertController;->t(Landroid/view/View;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_2

    .line 34
    .line 35
    return v1

    .line 36
    :cond_3
    return v2
.end method

.method private u(Landroid/widget/Button;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 2
    .line 3
    sget v1, LR3/g;->j:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->i:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 16
    .line 17
    const/16 v1, 0x11

    .line 18
    .line 19
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 23
    .line 24
    const/4 v2, -0x2

    .line 25
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->i:Landroid/view/View;

    .line 31
    .line 32
    check-cast p0, Landroid/widget/LinearLayout;

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private w()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 2
    .line 3
    sget v1, LR3/g;->j:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->i:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget v2, LR3/e;->q:I

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 30
    .line 31
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->i:Landroid/view/View;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->i:Landroid/view/View;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    iget-object v2, p0, Lcom/zte/mifavor/widget/AlertController;->i:Landroid/view/View;

    .line 43
    .line 44
    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    add-int/lit8 v2, v2, -0x6

    .line 49
    .line 50
    iget-object v3, p0, Lcom/zte/mifavor/widget/AlertController;->i:Landroid/view/View;

    .line 51
    .line 52
    invoke-virtual {v3}, Landroid/view/View;->getPaddingRight()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    add-int/lit8 v3, v3, 0x6

    .line 57
    .line 58
    iget-object v4, p0, Lcom/zte/mifavor/widget/AlertController;->i:Landroid/view/View;

    .line 59
    .line 60
    invoke-virtual {v4}, Landroid/view/View;->getPaddingBottom()I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 68
    .line 69
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    sget v1, LR3/e;->r:I

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 80
    .line 81
    sget v2, LR3/g;->J:I

    .line 82
    .line 83
    invoke-virtual {v1, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    check-cast v1, Landroid/widget/Space;

    .line 88
    .line 89
    iput-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->D:Landroid/widget/Space;

    .line 90
    .line 91
    invoke-virtual {v1}, Landroid/widget/Space;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 96
    .line 97
    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 98
    .line 99
    iget-object v2, p0, Lcom/zte/mifavor/widget/AlertController;->D:Landroid/widget/Space;

    .line 100
    .line 101
    invoke-virtual {v2, v1}, Landroid/widget/Space;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 102
    .line 103
    .line 104
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 105
    .line 106
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    sget v2, LR3/e;->p:I

    .line 111
    .line 112
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    iget-object v2, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 117
    .line 118
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    sget v3, LR3/e;->t:I

    .line 123
    .line 124
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    iget-object v3, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 129
    .line 130
    const/4 v4, 0x0

    .line 131
    const/4 v5, 0x0

    .line 132
    if-eqz v3, :cond_0

    .line 133
    .line 134
    invoke-virtual {v3}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 139
    .line 140
    iput v1, v3, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 141
    .line 142
    add-int/lit8 v6, v2, -0x1

    .line 143
    .line 144
    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 145
    .line 146
    iput v5, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 147
    .line 148
    iget-object v6, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 149
    .line 150
    invoke-virtual {v6, v3}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 151
    .line 152
    .line 153
    iget-object v3, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 154
    .line 155
    iget-object v6, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 156
    .line 157
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 158
    .line 159
    .line 160
    move-result-object v6

    .line 161
    sget v7, LR3/e;->s:I

    .line 162
    .line 163
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 164
    .line 165
    .line 166
    move-result v6

    .line 167
    int-to-float v6, v6

    .line 168
    invoke-virtual {v3, v4, v6}, Landroid/widget/Button;->setTextSize(IF)V

    .line 169
    .line 170
    .line 171
    :cond_0
    iget-object v3, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 172
    .line 173
    if-eqz v3, :cond_1

    .line 174
    .line 175
    invoke-virtual {v3}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 180
    .line 181
    iput v1, v3, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 182
    .line 183
    add-int/lit8 v1, v2, -0x1

    .line 184
    .line 185
    iput v1, v3, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 186
    .line 187
    iput v5, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 188
    .line 189
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 190
    .line 191
    invoke-virtual {v1, v3}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 192
    .line 193
    .line 194
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 195
    .line 196
    iget-object v3, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 197
    .line 198
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 199
    .line 200
    .line 201
    move-result-object v3

    .line 202
    sget v6, LR3/e;->s:I

    .line 203
    .line 204
    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    int-to-float v3, v3

    .line 209
    invoke-virtual {v1, v4, v3}, Landroid/widget/Button;->setTextSize(IF)V

    .line 210
    .line 211
    .line 212
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 213
    .line 214
    invoke-virtual {v1}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    check-cast v1, Landroid/view/View;

    .line 219
    .line 220
    if-eqz v1, :cond_1

    .line 221
    .line 222
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 223
    .line 224
    .line 225
    move-result-object v3

    .line 226
    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 227
    .line 228
    mul-int/lit8 v2, v2, 0x2

    .line 229
    .line 230
    iput v2, v3, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 231
    .line 232
    iput v5, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 233
    .line 234
    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 235
    .line 236
    .line 237
    :cond_1
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 238
    .line 239
    sget v2, LR3/g;->i0:I

    .line 240
    .line 241
    invoke-virtual {v1, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    check-cast v1, Landroid/widget/Space;

    .line 246
    .line 247
    iput-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->E:Landroid/widget/Space;

    .line 248
    .line 249
    invoke-virtual {v1}, Landroid/widget/Space;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 254
    .line 255
    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 256
    .line 257
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->E:Landroid/widget/Space;

    .line 258
    .line 259
    invoke-virtual {p0, v1}, Landroid/widget/Space;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 260
    .line 261
    .line 262
    return-void
.end method


# virtual methods
.method public A()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/Window;->requestFeature(I)Z

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/zte/mifavor/widget/AlertController;->D()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroid/view/Window;->setContentView(I)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Lcom/zte/mifavor/widget/AlertController;->g0()V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Lcom/zte/mifavor/widget/AlertController;->d0()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catch_0
    move-exception p0

    .line 24
    const-string v0, "Z#AlertController"

    .line 25
    .line 26
    const-string v1, "install Content error, e = "

    .line 27
    .line 28
    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public B(ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->H:Landroid/widget/ScrollView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p2}, Landroid/widget/ScrollView;->executeKeyEvent(Landroid/view/KeyEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public C(ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->H:Landroid/widget/ScrollView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p2}, Landroid/widget/ScrollView;->executeKeyEvent(Landroid/view/KeyEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public G(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;Landroid/os/Message;)V
    .locals 0

    .line 1
    if-nez p4, :cond_0

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    iget-object p4, p0, Lcom/zte/mifavor/widget/AlertController;->c0:Landroid/os/Handler;

    .line 6
    .line 7
    invoke-virtual {p4, p1, p3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 8
    .line 9
    .line 10
    move-result-object p4

    .line 11
    :cond_0
    const/4 p3, -0x3

    .line 12
    if-eq p1, p3, :cond_3

    .line 13
    .line 14
    const/4 p3, -0x2

    .line 15
    if-eq p1, p3, :cond_2

    .line 16
    .line 17
    const/4 p3, -0x1

    .line 18
    if-ne p1, p3, :cond_1

    .line 19
    .line 20
    iput-object p2, p0, Lcom/zte/mifavor/widget/AlertController;->q:Ljava/lang/CharSequence;

    .line 21
    .line 22
    iput-object p4, p0, Lcom/zte/mifavor/widget/AlertController;->r:Landroid/os/Message;

    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 26
    .line 27
    const-string p1, "Button does not exist"

    .line 28
    .line 29
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    throw p0

    .line 33
    :cond_2
    iput-object p2, p0, Lcom/zte/mifavor/widget/AlertController;->t:Ljava/lang/CharSequence;

    .line 34
    .line 35
    iput-object p4, p0, Lcom/zte/mifavor/widget/AlertController;->u:Landroid/os/Message;

    .line 36
    .line 37
    return-void

    .line 38
    :cond_3
    iput-object p2, p0, Lcom/zte/mifavor/widget/AlertController;->w:Ljava/lang/CharSequence;

    .line 39
    .line 40
    iput-object p4, p0, Lcom/zte/mifavor/widget/AlertController;->x:Landroid/os/Message;

    .line 41
    .line 42
    return-void
.end method

.method public H(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/AlertController;->b0:I

    .line 2
    .line 3
    return-void
.end method

.method public I(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController;->R:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method public J(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->J:Landroid/graphics/drawable/Drawable;

    .line 3
    .line 4
    iput p1, p0, Lcom/zte/mifavor/widget/AlertController;->I:I

    .line 5
    .line 6
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->K:Landroid/widget/ImageView;

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/16 p1, 0x8

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public K(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController;->J:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput v0, p0, Lcom/zte/mifavor/widget/AlertController;->I:I

    .line 5
    .line 6
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->K:Landroid/widget/ImageView;

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/16 p1, 0x8

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public L(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController;->z:Ljava/lang/CharSequence;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/zte/mifavor/widget/AlertController;->A:Landroid/view/View$OnClickListener;

    .line 4
    .line 5
    return-void
.end method

.method public M(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/AlertController;->S:Z

    .line 2
    .line 3
    return-void
.end method

.method public N()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->M:Lcom/zte/mifavor/widget/TextViewZTE;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController;->N:Z

    .line 11
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v1, "set Is Show Title out. mIsShowTitle="

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/zte/mifavor/widget/AlertController;->N:Z

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, ", mTitleView="

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->M:Lcom/zte/mifavor/widget/TextViewZTE;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string v0, "Z#AlertController"

    .line 42
    .line 43
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public O(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController;->e:Ljava/lang/CharSequence;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->P:Landroid/widget/TextView;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public P()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "set Negative Button Background in, mButtonNegative="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "Z#AlertController"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    sget v1, LR3/f;->b:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 32
    .line 33
    .line 34
    sget-boolean v0, Lcom/zte/mifavor/widget/u;->b:Z

    .line 35
    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setForceDarkAllowed(Z)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->B:Landroid/widget/ImageView;

    .line 45
    .line 46
    const/4 v1, 0x4

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 50
    .line 51
    .line 52
    :cond_1
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->C:Landroid/widget/ImageView;

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 57
    .line 58
    .line 59
    :cond_2
    const/4 v0, 0x1

    .line 60
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController;->i0:Z

    .line 61
    .line 62
    return-void
.end method

.method public Q(I)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "set Negative Button Text Color in. mButtonNegative="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", color="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "Z#AlertController"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextColor(I)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 44
    .line 45
    sget v2, LR3/d;->y:I

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 52
    .line 53
    .line 54
    :goto_0
    sget-boolean v0, Lcom/zte/mifavor/widget/u;->b:Z

    .line 55
    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 59
    .line 60
    const/4 v1, 0x0

    .line 61
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setForceDarkAllowed(Z)V

    .line 62
    .line 63
    .line 64
    :cond_1
    const/4 v0, 0x1

    .line 65
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController;->h0:Z

    .line 66
    .line 67
    iput p1, p0, Lcom/zte/mifavor/widget/AlertController;->j0:I

    .line 68
    .line 69
    return-void
.end method

.method public R()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "set Recommend Button Background in. mButtonPositive="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", mButtonNegative="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "Z#AlertController"

    .line 39
    .line 40
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    iget-object v2, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 49
    .line 50
    sget v3, LR3/l;->m:I

    .line 51
    .line 52
    invoke-virtual {v0, v2, v3}, Landroid/widget/Button;->setTextAppearance(Landroid/content/Context;I)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 56
    .line 57
    sget v2, LR3/f;->b:I

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 60
    .line 61
    .line 62
    sget-boolean v0, Lcom/zte/mifavor/widget/u;->b:Z

    .line 63
    .line 64
    if-eqz v0, :cond_0

    .line 65
    .line 66
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setForceDarkAllowed(Z)V

    .line 69
    .line 70
    .line 71
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 72
    .line 73
    if-eqz v0, :cond_1

    .line 74
    .line 75
    sget v2, LR3/f;->c:I

    .line 76
    .line 77
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 78
    .line 79
    .line 80
    sget-boolean v0, Lcom/zte/mifavor/widget/u;->b:Z

    .line 81
    .line 82
    if-eqz v0, :cond_1

    .line 83
    .line 84
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setForceDarkAllowed(Z)V

    .line 87
    .line 88
    .line 89
    :cond_1
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->B:Landroid/widget/ImageView;

    .line 90
    .line 91
    const/4 v1, 0x4

    .line 92
    if-eqz v0, :cond_2

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 95
    .line 96
    .line 97
    :cond_2
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->C:Landroid/widget/ImageView;

    .line 98
    .line 99
    if-eqz v0, :cond_3

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 102
    .line 103
    .line 104
    :cond_3
    const/4 v0, 0x1

    .line 105
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController;->f0:Z

    .line 106
    .line 107
    return-void
.end method

.method public S(I)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "set Recommend Button Text Color in ... mButtonPositive = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "Z#AlertController"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextColor(I)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 36
    .line 37
    sget v2, LR3/d;->y:I

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 44
    .line 45
    .line 46
    :goto_0
    sget-boolean v0, Lcom/zte/mifavor/widget/u;->b:Z

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setForceDarkAllowed(Z)V

    .line 54
    .line 55
    .line 56
    :cond_1
    const/4 v0, 0x1

    .line 57
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController;->e0:Z

    .line 58
    .line 59
    iput p1, p0, Lcom/zte/mifavor/widget/AlertController;->g0:I

    .line 60
    .line 61
    return-void
.end method

.method public T()V
    .locals 1

    .line 1
    const-string p0, "Z#AlertController"

    .line 2
    .line 3
    const-string v0, "set Service Dialog. do nothing."

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public U(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController;->f:Ljava/lang/CharSequence;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->Q:Landroid/widget/TextView;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public V(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController;->d:Ljava/lang/CharSequence;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->M:Lcom/zte/mifavor/widget/TextViewZTE;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public W(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->M:Lcom/zte/mifavor/widget/TextViewZTE;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public X(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->h:Landroid/view/View;

    .line 3
    .line 4
    iput p1, p0, Lcom/zte/mifavor/widget/AlertController;->j:I

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/AlertController;->o:Z

    .line 8
    .line 9
    return-void
.end method

.method public Y(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController;->h:Landroid/view/View;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Lcom/zte/mifavor/widget/AlertController;->j:I

    .line 5
    .line 6
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/AlertController;->o:Z

    .line 7
    .line 8
    return-void
.end method

.method public Z(Landroid/view/View;IIII)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/AlertController;->h:Landroid/view/View;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Lcom/zte/mifavor/widget/AlertController;->j:I

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/AlertController;->o:Z

    .line 8
    .line 9
    iput p2, p0, Lcom/zte/mifavor/widget/AlertController;->k:I

    .line 10
    .line 11
    iput p3, p0, Lcom/zte/mifavor/widget/AlertController;->l:I

    .line 12
    .line 13
    iput p4, p0, Lcom/zte/mifavor/widget/AlertController;->m:I

    .line 14
    .line 15
    iput p5, p0, Lcom/zte/mifavor/widget/AlertController;->n:I

    .line 16
    .line 17
    return-void
.end method

.method public e0()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 2
    .line 3
    const-string v1, "Z#AlertController"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "setup Title in. mWindow=null."

    .line 8
    .line 9
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget v2, LR3/g;->E0:I

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/widget/LinearLayout;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/zte/mifavor/widget/AlertController;->d:Ljava/lang/CharSequence;

    .line 22
    .line 23
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    xor-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    iget-boolean v3, p0, Lcom/zte/mifavor/widget/AlertController;->N:Z

    .line 30
    .line 31
    and-int/2addr v3, v2

    .line 32
    if-eqz v3, :cond_2

    .line 33
    .line 34
    iget-object v2, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 35
    .line 36
    sget v3, LR3/g;->a:I

    .line 37
    .line 38
    invoke-virtual {v2, v3}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Lcom/zte/mifavor/widget/TextViewZTE;

    .line 43
    .line 44
    iput-object v2, p0, Lcom/zte/mifavor/widget/AlertController;->M:Lcom/zte/mifavor/widget/TextViewZTE;

    .line 45
    .line 46
    const/4 v3, 0x0

    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    const-string v2, "setup Title. set Text and visible."

    .line 50
    .line 51
    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    iget-object v2, p0, Lcom/zte/mifavor/widget/AlertController;->M:Lcom/zte/mifavor/widget/TextViewZTE;

    .line 55
    .line 56
    iget-object v4, p0, Lcom/zte/mifavor/widget/AlertController;->d:Ljava/lang/CharSequence;

    .line 57
    .line 58
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Lcom/zte/mifavor/widget/AlertController;->M:Lcom/zte/mifavor/widget/TextViewZTE;

    .line 62
    .line 63
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 64
    .line 65
    .line 66
    iget-object v2, p0, Lcom/zte/mifavor/widget/AlertController;->M:Lcom/zte/mifavor/widget/TextViewZTE;

    .line 67
    .line 68
    iget-object v4, p0, Lcom/zte/mifavor/widget/AlertController;->K:Landroid/widget/ImageView;

    .line 69
    .line 70
    invoke-virtual {v4}, Landroid/widget/ImageView;->getPaddingLeft()I

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    iget-object v5, p0, Lcom/zte/mifavor/widget/AlertController;->K:Landroid/widget/ImageView;

    .line 75
    .line 76
    invoke-virtual {v5}, Landroid/widget/ImageView;->getPaddingTop()I

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    iget-object v6, p0, Lcom/zte/mifavor/widget/AlertController;->K:Landroid/widget/ImageView;

    .line 81
    .line 82
    invoke-virtual {v6}, Landroid/widget/ImageView;->getPaddingRight()I

    .line 83
    .line 84
    .line 85
    move-result v6

    .line 86
    iget-object v7, p0, Lcom/zte/mifavor/widget/AlertController;->K:Landroid/widget/ImageView;

    .line 87
    .line 88
    invoke-virtual {v7}, Landroid/widget/ImageView;->getPaddingBottom()I

    .line 89
    .line 90
    .line 91
    move-result v7

    .line 92
    invoke-virtual {v2, v4, v5, v6, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 93
    .line 94
    .line 95
    :cond_1
    iget-object v2, p0, Lcom/zte/mifavor/widget/AlertController;->c:Landroid/view/Window;

    .line 96
    .line 97
    sget v4, LR3/g;->D0:I

    .line 98
    .line 99
    invoke-virtual {v2, v4}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    if-eqz v2, :cond_3

    .line 104
    .line 105
    const-string v4, "setup Title. set titleTemplate visible."

    .line 106
    .line 107
    invoke-static {v1, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 117
    .line 118
    .line 119
    const-string v4, "setup Title warning. hasTextTitle="

    .line 120
    .line 121
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    .line 133
    .line 134
    :cond_3
    :goto_0
    if-eqz v0, :cond_4

    .line 135
    .line 136
    iget-object v2, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 137
    .line 138
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    sget v3, LR3/e;->u:I

    .line 143
    .line 144
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    float-to-int v2, v2

    .line 149
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 150
    .line 151
    .line 152
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 153
    .line 154
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 155
    .line 156
    .line 157
    const-string v2, "setup Title out. mIsShowTitle="

    .line 158
    .line 159
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    iget-boolean v2, p0, Lcom/zte/mifavor/widget/AlertController;->N:Z

    .line 163
    .line 164
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    const-string v2, ", mTitle="

    .line 168
    .line 169
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->d:Ljava/lang/CharSequence;

    .line 173
    .line 174
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-static {v1, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    .line 183
    .line 184
    return-void
.end method

.method public i0()V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "sync Gravity in. mCloseSync="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/zte/mifavor/widget/AlertController;->O:Z

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "Z#AlertController"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController;->O:Z

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->f:Ljava/lang/CharSequence;

    .line 30
    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/lang/CharSequence;->isEmpty()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_3

    .line 38
    .line 39
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->Q:Landroid/widget/TextView;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/widget/TextView;->getTextAlignment()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iget-object v2, p0, Lcom/zte/mifavor/widget/AlertController;->P:Landroid/widget/TextView;

    .line 46
    .line 47
    invoke-virtual {v2}, Landroid/widget/TextView;->getTextAlignment()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    iget-object v3, p0, Lcom/zte/mifavor/widget/AlertController;->Q:Landroid/widget/TextView;

    .line 52
    .line 53
    check-cast v3, Lcom/zte/mifavor/widget/DialogMessage;

    .line 54
    .line 55
    invoke-virtual {v3}, Lcom/zte/mifavor/widget/DialogMessage;->c()Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    iget-object v4, p0, Lcom/zte/mifavor/widget/AlertController;->P:Landroid/widget/TextView;

    .line 60
    .line 61
    check-cast v4, Lcom/zte/mifavor/widget/DialogMessage;

    .line 62
    .line 63
    invoke-virtual {v4}, Lcom/zte/mifavor/widget/DialogMessage;->c()Z

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    new-instance v5, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    const-string v6, "sync Gravity. need to set Multiple lines. isMultipleTitle="

    .line 73
    .line 74
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string v3, ", isMultipleMessage="

    .line 81
    .line 82
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string v3, ", alignSubtitle="

    .line 89
    .line 90
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v3, ", alignMessage="

    .line 97
    .line 98
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    if-ne v0, v2, :cond_0

    .line 112
    .line 113
    const-string v0, "sync Gravity. the same gravity and do nothing."

    .line 114
    .line 115
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_0
    const v3, 0x800003

    .line 120
    .line 121
    .line 122
    const/4 v4, 0x1

    .line 123
    const/4 v5, 0x2

    .line 124
    if-eq v0, v5, :cond_1

    .line 125
    .line 126
    const-string v0, "sync Gravity. set mSubTitleView to TEXT_ALIGNMENT_TEXT_START."

    .line 127
    .line 128
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->Q:Landroid/widget/TextView;

    .line 132
    .line 133
    check-cast v0, Lcom/zte/mifavor/widget/DialogMessage;

    .line 134
    .line 135
    invoke-virtual {v0, v4}, Lcom/zte/mifavor/widget/DialogMessage;->setIsMultiplelines(Z)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->Q:Landroid/widget/TextView;

    .line 139
    .line 140
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextAlignment(I)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->Q:Landroid/widget/TextView;

    .line 144
    .line 145
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 146
    .line 147
    .line 148
    :cond_1
    if-eq v2, v5, :cond_2

    .line 149
    .line 150
    const-string v0, "sync Gravity. set mMessageView to TEXT_ALIGNMENT_TEXT_START."

    .line 151
    .line 152
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->P:Landroid/widget/TextView;

    .line 156
    .line 157
    check-cast v0, Lcom/zte/mifavor/widget/DialogMessage;

    .line 158
    .line 159
    invoke-virtual {v0, v4}, Lcom/zte/mifavor/widget/DialogMessage;->setIsMultiplelines(Z)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->P:Landroid/widget/TextView;

    .line 163
    .line 164
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextAlignment(I)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->P:Landroid/widget/TextView;

    .line 168
    .line 169
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 170
    .line 171
    .line 172
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->Q:Landroid/widget/TextView;

    .line 173
    .line 174
    iget-object v1, p0, Lcom/zte/mifavor/widget/AlertController;->o0:Landroid/view/View$OnLayoutChangeListener;

    .line 175
    .line 176
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Lcom/zte/mifavor/widget/AlertController;->P:Landroid/widget/TextView;

    .line 180
    .line 181
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->p0:Landroid/view/View$OnLayoutChangeListener;

    .line 182
    .line 183
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 184
    .line 185
    .line 186
    return-void

    .line 187
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 190
    .line 191
    .line 192
    const-string v2, "sync Gravity do nothing. mSubTitle="

    .line 193
    .line 194
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->f:Ljava/lang/CharSequence;

    .line 198
    .line 199
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    .line 208
    .line 209
    return-void
.end method

.method public v()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/AlertController;->O:Z

    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "close Sync Gravity out. mCloseSync="

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/AlertController;->O:Z

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "Z#AlertController"

    .line 24
    .line 25
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public x(I)Landroid/widget/Button;
    .locals 1

    .line 1
    const/4 v0, -0x3

    .line 2
    if-eq p1, v0, :cond_2

    .line 3
    .line 4
    const/4 v0, -0x2

    .line 5
    if-eq p1, v0, :cond_1

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->p:Landroid/widget/Button;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->s:Landroid/widget/Button;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_2
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->v:Landroid/widget/Button;

    .line 19
    .line 20
    return-object p0
.end method

.method public y(I)I
    .locals 2

    .line 1
    new-instance v0, Landroid/util/TypedValue;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->a:Landroid/content/Context;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p0, p1, v0, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 14
    .line 15
    .line 16
    iget p0, v0, Landroid/util/TypedValue;->resourceId:I

    .line 17
    .line 18
    return p0
.end method

.method public z()Lcom/zte/mifavor/widget/ListView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/AlertController;->g:Lcom/zte/mifavor/widget/ListView;

    .line 2
    .line 3
    return-object p0
.end method
