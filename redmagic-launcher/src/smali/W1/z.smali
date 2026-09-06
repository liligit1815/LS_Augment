.class public final LW1/z;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "BubbleBarFlyoutView.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LW1/z$b;
    }
.end annotation


# static fields
.field public static final H:LW1/z$b;


# instance fields
.field private A:F

.field private B:F

.field private C:I

.field private D:F

.field private E:F

.field private final F:Landroid/graphics/Paint;

.field private final G:Landroid/graphics/Rect;

.field private final g:LW1/n;

.field private final h:LW1/B;

.field private final i:Lh4/e;

.field private final j:Lh4/e;

.field private final k:Lh4/e;

.field private final l:Lh4/e;

.field private final m:Lh4/e;

.field private final n:Lh4/e;

.field private final o:Lh4/e;

.field private final p:Lh4/e;

.field private final q:Lh4/e;

.field private final r:Lh4/e;

.field private final s:Lh4/e;

.field private final t:Landroid/graphics/RectF;

.field private final u:F

.field private final v:Landroid/graphics/Path;

.field private final w:Landroid/graphics/Outline;

.field private x:I

.field private y:F

.field private z:Landroid/graphics/PointF;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LW1/z$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LW1/z$b;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LW1/z;->H:LW1/z$b;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;LW1/n;LW1/B;)V
    .locals 9

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "positioner"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object p2, p0, LW1/z;->g:LW1/n;

    .line 15
    .line 16
    if-nez p3, :cond_0

    .line 17
    .line 18
    new-instance p3, LW1/D;

    .line 19
    .line 20
    invoke-direct {p3, p0}, LW1/D;-><init>(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iput-object p3, p0, LW1/z;->h:LW1/B;

    .line 24
    .line 25
    sget-object p2, Lh4/i;->i:Lh4/i;

    .line 26
    .line 27
    new-instance p3, LW1/o;

    .line 28
    .line 29
    invoke-direct {p3, p0}, LW1/o;-><init>(LW1/z;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p2, p3}, Lh4/f;->a(Lh4/i;Lu4/a;)Lh4/e;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    iput-object p3, p0, LW1/z;->i:Lh4/e;

    .line 37
    .line 38
    new-instance p3, LW1/r;

    .line 39
    .line 40
    invoke-direct {p3, p0}, LW1/r;-><init>(LW1/z;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p2, p3}, Lh4/f;->a(Lh4/i;Lu4/a;)Lh4/e;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    iput-object p3, p0, LW1/z;->j:Lh4/e;

    .line 48
    .line 49
    new-instance p3, LW1/s;

    .line 50
    .line 51
    invoke-direct {p3, p0}, LW1/s;-><init>(LW1/z;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p2, p3}, Lh4/f;->a(Lh4/i;Lu4/a;)Lh4/e;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    iput-object p3, p0, LW1/z;->k:Lh4/e;

    .line 59
    .line 60
    new-instance p3, LW1/t;

    .line 61
    .line 62
    invoke-direct {p3, p1}, LW1/t;-><init>(Landroid/content/Context;)V

    .line 63
    .line 64
    .line 65
    invoke-static {p2, p3}, Lh4/f;->a(Lh4/i;Lu4/a;)Lh4/e;

    .line 66
    .line 67
    .line 68
    move-result-object p3

    .line 69
    iput-object p3, p0, LW1/z;->l:Lh4/e;

    .line 70
    .line 71
    new-instance p3, LW1/u;

    .line 72
    .line 73
    invoke-direct {p3, p1}, LW1/u;-><init>(Landroid/content/Context;)V

    .line 74
    .line 75
    .line 76
    invoke-static {p2, p3}, Lh4/f;->a(Lh4/i;Lu4/a;)Lh4/e;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    iput-object p3, p0, LW1/z;->m:Lh4/e;

    .line 81
    .line 82
    new-instance p3, LW1/v;

    .line 83
    .line 84
    invoke-direct {p3, p1}, LW1/v;-><init>(Landroid/content/Context;)V

    .line 85
    .line 86
    .line 87
    invoke-static {p2, p3}, Lh4/f;->a(Lh4/i;Lu4/a;)Lh4/e;

    .line 88
    .line 89
    .line 90
    move-result-object p3

    .line 91
    iput-object p3, p0, LW1/z;->n:Lh4/e;

    .line 92
    .line 93
    new-instance p3, LW1/w;

    .line 94
    .line 95
    invoke-direct {p3, p1}, LW1/w;-><init>(Landroid/content/Context;)V

    .line 96
    .line 97
    .line 98
    invoke-static {p2, p3}, Lh4/f;->a(Lh4/i;Lu4/a;)Lh4/e;

    .line 99
    .line 100
    .line 101
    move-result-object p3

    .line 102
    iput-object p3, p0, LW1/z;->o:Lh4/e;

    .line 103
    .line 104
    new-instance p3, LW1/x;

    .line 105
    .line 106
    invoke-direct {p3, p1}, LW1/x;-><init>(Landroid/content/Context;)V

    .line 107
    .line 108
    .line 109
    invoke-static {p2, p3}, Lh4/f;->a(Lh4/i;Lu4/a;)Lh4/e;

    .line 110
    .line 111
    .line 112
    move-result-object p3

    .line 113
    iput-object p3, p0, LW1/z;->p:Lh4/e;

    .line 114
    .line 115
    new-instance p3, LW1/y;

    .line 116
    .line 117
    invoke-direct {p3, p1}, LW1/y;-><init>(Landroid/content/Context;)V

    .line 118
    .line 119
    .line 120
    invoke-static {p2, p3}, Lh4/f;->a(Lh4/i;Lu4/a;)Lh4/e;

    .line 121
    .line 122
    .line 123
    move-result-object p3

    .line 124
    iput-object p3, p0, LW1/z;->q:Lh4/e;

    .line 125
    .line 126
    new-instance p3, LW1/p;

    .line 127
    .line 128
    invoke-direct {p3, p1}, LW1/p;-><init>(Landroid/content/Context;)V

    .line 129
    .line 130
    .line 131
    invoke-static {p2, p3}, Lh4/f;->a(Lh4/i;Lu4/a;)Lh4/e;

    .line 132
    .line 133
    .line 134
    move-result-object p3

    .line 135
    iput-object p3, p0, LW1/z;->r:Lh4/e;

    .line 136
    .line 137
    new-instance p3, LW1/q;

    .line 138
    .line 139
    invoke-direct {p3, p1}, LW1/q;-><init>(Landroid/content/Context;)V

    .line 140
    .line 141
    .line 142
    invoke-static {p2, p3}, Lh4/f;->a(Lh4/i;Lu4/a;)Lh4/e;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    iput-object p2, p0, LW1/z;->s:Lh4/e;

    .line 147
    .line 148
    new-instance p2, Landroid/graphics/RectF;

    .line 149
    .line 150
    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    .line 151
    .line 152
    .line 153
    iput-object p2, p0, LW1/z;->t:Landroid/graphics/RectF;

    .line 154
    .line 155
    new-instance p2, Landroid/graphics/Path;

    .line 156
    .line 157
    invoke-direct {p2}, Landroid/graphics/Path;-><init>()V

    .line 158
    .line 159
    .line 160
    iput-object p2, p0, LW1/z;->v:Landroid/graphics/Path;

    .line 161
    .line 162
    new-instance p3, Landroid/graphics/Outline;

    .line 163
    .line 164
    invoke-direct {p3}, Landroid/graphics/Outline;-><init>()V

    .line 165
    .line 166
    .line 167
    iput-object p3, p0, LW1/z;->w:Landroid/graphics/Outline;

    .line 168
    .line 169
    const/high16 v0, -0x1000000

    .line 170
    .line 171
    iput v0, p0, LW1/z;->x:I

    .line 172
    .line 173
    new-instance v0, Landroid/graphics/PointF;

    .line 174
    .line 175
    const/4 v1, 0x0

    .line 176
    invoke-direct {v0, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 177
    .line 178
    .line 179
    iput-object v0, p0, LW1/z;->z:Landroid/graphics/PointF;

    .line 180
    .line 181
    new-instance v0, Landroid/graphics/Paint;

    .line 182
    .line 183
    const/4 v1, 0x3

    .line 184
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 185
    .line 186
    .line 187
    iput-object v0, p0, LW1/z;->F:Landroid/graphics/Paint;

    .line 188
    .line 189
    new-instance v0, Landroid/graphics/Rect;

    .line 190
    .line 191
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 192
    .line 193
    .line 194
    iput-object v0, p0, LW1/z;->G:Landroid/graphics/Rect;

    .line 195
    .line 196
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    const v1, 0x7f0e0080

    .line 201
    .line 202
    .line 203
    const/4 v2, 0x1

    .line 204
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 205
    .line 206
    .line 207
    const v0, 0x7f0b0128

    .line 208
    .line 209
    .line 210
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/widget/ConstraintLayout;->setId(I)V

    .line 211
    .line 212
    .line 213
    sget-object v3, Lcom/android/wm/shell/shared/o;->a:Lcom/android/wm/shell/shared/o$a;

    .line 214
    .line 215
    invoke-direct {p0}, LW1/z;->getTitle()Landroid/widget/TextView;

    .line 216
    .line 217
    .line 218
    move-result-object v4

    .line 219
    sget-object v5, Lcom/android/wm/shell/shared/o$b;->q:Lcom/android/wm/shell/shared/o$b;

    .line 220
    .line 221
    const/4 v7, 0x4

    .line 222
    const/4 v8, 0x0

    .line 223
    const/4 v6, 0x0

    .line 224
    invoke-static/range {v3 .. v8}, Lcom/android/wm/shell/shared/o$a;->c(Lcom/android/wm/shell/shared/o$a;Landroid/widget/TextView;Lcom/android/wm/shell/shared/o$b;IILjava/lang/Object;)V

    .line 225
    .line 226
    .line 227
    invoke-direct {p0}, LW1/z;->getMessage()Landroid/widget/TextView;

    .line 228
    .line 229
    .line 230
    move-result-object v4

    .line 231
    sget-object v5, Lcom/android/wm/shell/shared/o$b;->u:Lcom/android/wm/shell/shared/o$b;

    .line 232
    .line 233
    invoke-static/range {v3 .. v8}, Lcom/android/wm/shell/shared/o$a;->c(Lcom/android/wm/shell/shared/o$a;Landroid/widget/TextView;Lcom/android/wm/shell/shared/o$b;IILjava/lang/Object;)V

    .line 234
    .line 235
    .line 236
    const v0, 0x1010571

    .line 237
    .line 238
    .line 239
    filled-new-array {v0}, [I

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-virtual {p1, v0}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    const-string v1, "obtainStyledAttributes(...)"

    .line 248
    .line 249
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    const/4 v1, 0x0

    .line 253
    invoke-virtual {v0, v1, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 254
    .line 255
    .line 256
    move-result v3

    .line 257
    int-to-float v3, v3

    .line 258
    iput v3, p0, LW1/z;->u:F

    .line 259
    .line 260
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 261
    .line 262
    .line 263
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setWillNotDraw(Z)V

    .line 264
    .line 265
    .line 266
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 267
    .line 268
    .line 269
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 270
    .line 271
    .line 272
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 273
    .line 274
    .line 275
    move-result-object p1

    .line 276
    const v0, 0x7f070165

    .line 277
    .line 278
    .line 279
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 280
    .line 281
    .line 282
    move-result p1

    .line 283
    invoke-direct {p0}, LW1/z;->getTriangleHeight()I

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    add-int/2addr v0, p1

    .line 288
    invoke-direct {p0}, LW1/z;->getTriangleOverlap()I

    .line 289
    .line 290
    .line 291
    move-result v1

    .line 292
    sub-int/2addr v0, v1

    .line 293
    invoke-virtual {p0, p1, p1, p1, v0}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 294
    .line 295
    .line 296
    invoke-direct {p0}, LW1/z;->getFlyoutElevation()F

    .line 297
    .line 298
    .line 299
    move-result p1

    .line 300
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setTranslationZ(F)V

    .line 301
    .line 302
    .line 303
    invoke-direct {p0}, LW1/z;->getTriangleWidth()I

    .line 304
    .line 305
    .line 306
    move-result p1

    .line 307
    int-to-float p1, p1

    .line 308
    invoke-direct {p0}, LW1/z;->getTriangleHeight()I

    .line 309
    .line 310
    .line 311
    move-result v0

    .line 312
    int-to-float v0, v0

    .line 313
    invoke-direct {p0}, LW1/z;->getTriangleRadius()I

    .line 314
    .line 315
    .line 316
    move-result v1

    .line 317
    int-to-float v1, v1

    .line 318
    invoke-static {p1, v0, v1, p2}, Lcom/android/launcher3/popup/A;->a(FFFLandroid/graphics/Path;)V

    .line 319
    .line 320
    .line 321
    invoke-virtual {p3, p2}, Landroid/graphics/Outline;->setPath(Landroid/graphics/Path;)V

    .line 322
    .line 323
    .line 324
    new-instance p1, LW1/z$a;

    .line 325
    .line 326
    invoke-direct {p1, p0}, LW1/z$a;-><init>(LW1/z;)V

    .line 327
    .line 328
    .line 329
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->setClipToOutline(Z)V

    .line 333
    .line 334
    .line 335
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 336
    .line 337
    .line 338
    move-result-object p1

    .line 339
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 340
    .line 341
    .line 342
    move-result-object p1

    .line 343
    const-string p2, "getConfiguration(...)"

    .line 344
    .line 345
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    invoke-direct {p0, p1}, LW1/z;->t(Landroid/content/res/Configuration;)V

    .line 349
    .line 350
    .line 351
    return-void
.end method

.method private static final A(LW1/z;)Landroid/widget/TextView;
    .locals 1

    .line 1
    const v0, 0x7f0b012a

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Landroid/widget/TextView;

    .line 9
    .line 10
    return-object p0
.end method

.method private static final B(Landroid/content/Context;)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7f070164

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private static final D(LW1/z;)Landroid/widget/TextView;
    .locals 1

    .line 1
    const v0, 0x7f0b012b

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Landroid/widget/TextView;

    .line 9
    .line 10
    return-object p0
.end method

.method private static final E(Landroid/content/Context;)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7f070166

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private static final F(Landroid/content/Context;)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7f070167

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private static final G(Landroid/content/Context;)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7f070168

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private static final H(Landroid/content/Context;)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7f070169

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private final K(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object v0, p0, LW1/z;->g:LW1/n;

    .line 2
    .line 3
    invoke-interface {v0}, LW1/n;->a()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, LW1/z;->z:Landroid/graphics/PointF;

    .line 10
    .line 11
    iget v0, v0, Landroid/graphics/PointF;->x:F

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    int-to-float v1, v1

    .line 18
    :goto_0
    sub-float/2addr v0, v1

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    sub-int/2addr v0, v1

    .line 29
    int-to-float v0, v0

    .line 30
    iget-object v1, p0, LW1/z;->z:Landroid/graphics/PointF;

    .line 31
    .line 32
    iget v1, v1, Landroid/graphics/PointF;->x:F

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    sub-int/2addr v1, v2

    .line 44
    int-to-float v1, v1

    .line 45
    iget-object v2, p0, LW1/z;->z:Landroid/graphics/PointF;

    .line 46
    .line 47
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 48
    .line 49
    add-float/2addr v1, v2

    .line 50
    iget v2, p0, LW1/z;->y:F

    .line 51
    .line 52
    const/high16 v3, 0x3f800000    # 1.0f

    .line 53
    .line 54
    sub-float v2, v3, v2

    .line 55
    .line 56
    mul-float/2addr v0, v2

    .line 57
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 58
    .line 59
    .line 60
    iget p0, p0, LW1/z;->y:F

    .line 61
    .line 62
    sub-float/2addr v3, p0

    .line 63
    mul-float/2addr v1, v3

    .line 64
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static synthetic a(Landroid/content/Context;)I
    .locals 0

    .line 1
    invoke-static {p0}, LW1/z;->H(Landroid/content/Context;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private final getBackgroundRectTx()F
    .locals 2

    .line 1
    iget-object v0, p0, LW1/z;->z:Landroid/graphics/PointF;

    .line 2
    .line 3
    iget v0, v0, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    int-to-float v1, v1

    .line 7
    iget p0, p0, LW1/z;->y:F

    .line 8
    .line 9
    sub-float/2addr v1, p0

    .line 10
    mul-float/2addr v0, v1

    .line 11
    return v0
.end method

.method private final getBackgroundRectTy()F
    .locals 2

    .line 1
    iget-object v0, p0, LW1/z;->z:Landroid/graphics/PointF;

    .line 2
    .line 3
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    int-to-float v1, v1

    .line 7
    iget p0, p0, LW1/z;->y:F

    .line 8
    .line 9
    sub-float/2addr v1, p0

    .line 10
    mul-float/2addr v0, v1

    .line 11
    return v0
.end method

.method private final getCurrentCornerRadius()F
    .locals 2

    .line 1
    iget v0, p0, LW1/z;->B:F

    .line 2
    .line 3
    iget v1, p0, LW1/z;->u:F

    .line 4
    .line 5
    sub-float/2addr v1, v0

    .line 6
    iget p0, p0, LW1/z;->y:F

    .line 7
    .line 8
    mul-float/2addr v1, p0

    .line 9
    add-float/2addr v0, v1

    .line 10
    return v0
.end method

.method private final getFlyoutElevation()F
    .locals 0

    .line 1
    iget-object p0, p0, LW1/z;->s:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Number;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private final getFlyoutPadding()I
    .locals 0

    .line 1
    iget-object p0, p0, LW1/z;->l:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Number;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private final getIcon()Landroid/widget/ImageView;
    .locals 1

    .line 1
    iget-object p0, p0, LW1/z;->j:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "getValue(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    check-cast p0, Landroid/widget/ImageView;

    .line 13
    .line 14
    return-object p0
.end method

.method private final getMaxFlyoutWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, LW1/z;->r:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Number;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private final getMessage()Landroid/widget/TextView;
    .locals 1

    .line 1
    iget-object p0, p0, LW1/z;->k:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "getValue(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    check-cast p0, Landroid/widget/TextView;

    .line 13
    .line 14
    return-object p0
.end method

.method private final getMinFlyoutWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, LW1/z;->q:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Number;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private final getTitle()Landroid/widget/TextView;
    .locals 1

    .line 1
    iget-object p0, p0, LW1/z;->i:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "getValue(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    check-cast p0, Landroid/widget/TextView;

    .line 13
    .line 14
    return-object p0
.end method

.method private final getTriangleHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, LW1/z;->m:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Number;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private final getTriangleOverlap()I
    .locals 0

    .line 1
    iget-object p0, p0, LW1/z;->n:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Number;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private final getTriangleRadius()I
    .locals 0

    .line 1
    iget-object p0, p0, LW1/z;->p:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Number;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private final getTriangleWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, LW1/z;->o:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Number;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static synthetic i(Landroid/content/Context;)I
    .locals 0

    .line 1
    invoke-static {p0}, LW1/z;->w(Landroid/content/Context;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic j(Landroid/content/Context;)I
    .locals 0

    .line 1
    invoke-static {p0}, LW1/z;->B(Landroid/content/Context;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic k(LW1/z;)Landroid/widget/TextView;
    .locals 0

    .line 1
    invoke-static {p0}, LW1/z;->A(LW1/z;)Landroid/widget/TextView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic l(Landroid/content/Context;)I
    .locals 0

    .line 1
    invoke-static {p0}, LW1/z;->F(Landroid/content/Context;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic m(Landroid/content/Context;)I
    .locals 0

    .line 1
    invoke-static {p0}, LW1/z;->z(Landroid/content/Context;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic n(Landroid/content/Context;)F
    .locals 0

    .line 1
    invoke-static {p0}, LW1/z;->v(Landroid/content/Context;)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic o(Landroid/content/Context;)I
    .locals 0

    .line 1
    invoke-static {p0}, LW1/z;->G(Landroid/content/Context;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic p(Landroid/content/Context;)I
    .locals 0

    .line 1
    invoke-static {p0}, LW1/z;->E(Landroid/content/Context;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic q(LW1/z;)Landroid/widget/ImageView;
    .locals 0

    .line 1
    invoke-static {p0}, LW1/z;->y(LW1/z;)Landroid/widget/ImageView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic r(LW1/z;)Landroid/widget/TextView;
    .locals 0

    .line 1
    invoke-static {p0}, LW1/z;->D(LW1/z;)Landroid/widget/TextView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic s(LW1/z;Landroid/graphics/Outline;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LW1/z;->x(Landroid/graphics/Outline;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final setData(LW1/m;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, LW1/m;->a()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, LW1/z;->getIcon()Landroid/widget/ImageView;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, LW1/z;->getIcon()Landroid/widget/ImageView;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1}, LW1/m;->a()Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-direct {p0}, LW1/z;->getIcon()Landroid/widget/ImageView;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    :goto_0
    invoke-direct {p0}, LW1/z;->getIcon()Landroid/widget/ImageView;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    invoke-direct {p0}, LW1/z;->getMinFlyoutWidth()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-direct {p0}, LW1/z;->getIcon()Landroid/widget/ImageView;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v3}, Landroid/widget/ImageView;->getWidth()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    sub-int/2addr v0, v3

    .line 59
    invoke-direct {p0}, LW1/z;->getFlyoutPadding()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    mul-int/lit8 v3, v3, 0x2

    .line 64
    .line 65
    sub-int/2addr v0, v3

    .line 66
    invoke-direct {p0}, LW1/z;->getMaxFlyoutWidth()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    invoke-direct {p0}, LW1/z;->getIcon()Landroid/widget/ImageView;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-virtual {v4}, Landroid/widget/ImageView;->getWidth()I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    sub-int/2addr v3, v4

    .line 79
    invoke-direct {p0}, LW1/z;->getFlyoutPadding()I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    mul-int/lit8 v4, v4, 0x2

    .line 84
    .line 85
    sub-int/2addr v3, v4

    .line 86
    goto :goto_1

    .line 87
    :cond_1
    invoke-direct {p0}, LW1/z;->getMinFlyoutWidth()I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    invoke-direct {p0}, LW1/z;->getFlyoutPadding()I

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    mul-int/lit8 v3, v3, 0x2

    .line 96
    .line 97
    sub-int/2addr v0, v3

    .line 98
    move v3, v0

    .line 99
    :goto_1
    invoke-virtual {p1}, LW1/m;->c()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    if-nez v4, :cond_2

    .line 108
    .line 109
    invoke-direct {p0}, LW1/z;->getTitle()Landroid/widget/TextView;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 114
    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_2
    invoke-direct {p0}, LW1/z;->getTitle()Landroid/widget/TextView;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setMinWidth(I)V

    .line 122
    .line 123
    .line 124
    invoke-direct {p0}, LW1/z;->getTitle()Landroid/widget/TextView;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 129
    .line 130
    .line 131
    invoke-direct {p0}, LW1/z;->getTitle()Landroid/widget/TextView;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-virtual {p1}, LW1/m;->c()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    .line 141
    .line 142
    invoke-direct {p0}, LW1/z;->getTitle()Landroid/widget/TextView;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 147
    .line 148
    .line 149
    :goto_2
    invoke-direct {p0}, LW1/z;->getMessage()Landroid/widget/TextView;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setMinWidth(I)V

    .line 154
    .line 155
    .line 156
    invoke-direct {p0}, LW1/z;->getMessage()Landroid/widget/TextView;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 161
    .line 162
    .line 163
    invoke-direct {p0}, LW1/z;->getMessage()Landroid/widget/TextView;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-virtual {p1}, LW1/m;->b()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 172
    .line 173
    .line 174
    return-void
.end method

.method private final t(Landroid/content/res/Configuration;)V
    .locals 2

    .line 1
    iget p1, p1, Landroid/content/res/Configuration;->uiMode:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const v0, 0x10602cd

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/content/Context;->getColor(I)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput p1, p0, LW1/z;->x:I

    .line 15
    .line 16
    invoke-direct {p0}, LW1/z;->getTitle()Landroid/widget/TextView;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const v1, 0x10602b4

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0}, LW1/z;->getMessage()Landroid/widget/TextView;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const v1, 0x10602b5

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, LW1/z;->F:Landroid/graphics/Paint;

    .line 53
    .line 54
    iget p0, p0, LW1/z;->x:I

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method private final u(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LW1/z;->g:LW1/n;

    .line 5
    .line 6
    invoke-interface {v0}, LW1/n;->a()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-direct {p0}, LW1/z;->getCurrentCornerRadius()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    int-to-float v0, v0

    .line 22
    invoke-direct {p0}, LW1/z;->getCurrentCornerRadius()F

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    sub-float/2addr v0, v1

    .line 27
    invoke-direct {p0}, LW1/z;->getTriangleWidth()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    int-to-float v1, v1

    .line 32
    sub-float/2addr v0, v1

    .line 33
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-direct {p0}, LW1/z;->getTriangleHeight()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    sub-int/2addr v1, v2

    .line 42
    invoke-direct {p0}, LW1/z;->getTriangleHeight()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-direct {p0}, LW1/z;->getTriangleOverlap()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    sub-int/2addr v2, v3

    .line 51
    sub-int/2addr v1, v2

    .line 52
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-direct {p0}, LW1/z;->getTriangleHeight()I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    sub-int/2addr v2, v3

    .line 61
    iget v3, p0, LW1/z;->y:F

    .line 62
    .line 63
    iget v4, p0, LW1/z;->E:F

    .line 64
    .line 65
    sub-float/2addr v3, v4

    .line 66
    const/4 v5, 0x1

    .line 67
    int-to-float v5, v5

    .line 68
    sub-float/2addr v5, v4

    .line 69
    div-float/2addr v3, v5

    .line 70
    const/4 v4, 0x0

    .line 71
    const/high16 v5, 0x3f800000    # 1.0f

    .line 72
    .line 73
    invoke-static {v3, v4, v5}, LA4/d;->g(FFF)F

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    int-to-float v4, v1

    .line 78
    sub-int/2addr v2, v1

    .line 79
    int-to-float v1, v2

    .line 80
    mul-float/2addr v1, v3

    .line 81
    add-float/2addr v4, v1

    .line 82
    invoke-virtual {p1, v0, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, LW1/z;->v:Landroid/graphics/Path;

    .line 86
    .line 87
    iget-object v2, p0, LW1/z;->F:Landroid/graphics/Paint;

    .line 88
    .line 89
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 90
    .line 91
    .line 92
    iget-object v1, p0, LW1/z;->w:Landroid/graphics/Outline;

    .line 93
    .line 94
    iget-object v2, p0, LW1/z;->v:Landroid/graphics/Path;

    .line 95
    .line 96
    invoke-virtual {v1, v2}, Landroid/graphics/Outline;->setPath(Landroid/graphics/Path;)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, LW1/z;->w:Landroid/graphics/Outline;

    .line 100
    .line 101
    float-to-int v0, v0

    .line 102
    float-to-int v1, v4

    .line 103
    invoke-virtual {p0, v0, v1}, Landroid/graphics/Outline;->offset(II)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method private static final v(Landroid/content/Context;)F
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7f070162

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    int-to-float p0, p0

    .line 13
    return p0
.end method

.method private static final w(Landroid/content/Context;)I
    .locals 1

    .line 1
    sget-object v0, LW1/z;->H:LW1/z$b;

    .line 2
    .line 3
    invoke-static {v0, p0}, LW1/z$b;->a(LW1/z$b;Landroid/content/Context;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private final x(Landroid/graphics/Outline;)V
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, LW1/z;->t:Landroid/graphics/RectF;

    .line 7
    .line 8
    invoke-direct {p0}, LW1/z;->getCurrentCornerRadius()F

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    invoke-direct {p0}, LW1/z;->getCurrentCornerRadius()F

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 19
    .line 20
    .line 21
    iget v1, p0, LW1/z;->y:F

    .line 22
    .line 23
    iget v2, p0, LW1/z;->E:F

    .line 24
    .line 25
    cmpl-float v1, v1, v2

    .line 26
    .line 27
    if-ltz v1, :cond_0

    .line 28
    .line 29
    iget-object v1, p0, LW1/z;->w:Landroid/graphics/Outline;

    .line 30
    .line 31
    iget-object v1, v1, Landroid/graphics/Outline;->mPath:Landroid/graphics/Path;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-virtual {p1, v0}, Landroid/graphics/Outline;->setPath(Landroid/graphics/Path;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0}, LW1/z;->getBackgroundRectTx()F

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    float-to-int v0, v0

    .line 44
    invoke-direct {p0}, LW1/z;->getBackgroundRectTy()F

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    float-to-int p0, p0

    .line 49
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Outline;->offset(II)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method private static final y(LW1/z;)Landroid/widget/ImageView;
    .locals 1

    .line 1
    const v0, 0x7f0b0129

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Landroid/widget/ImageView;

    .line 9
    .line 10
    return-object p0
.end method

.method private static final z(Landroid/content/Context;)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7f070163

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method


# virtual methods
.method public final C(LW1/m;Lu4/a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LW1/m;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "flyoutMessage"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "expandAnimation"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, LW1/z;->getIcon()Landroid/widget/ImageView;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, LW1/z;->getTitle()Landroid/widget/TextView;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, LW1/z;->getMessage()Landroid/widget/TextView;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 31
    .line 32
    .line 33
    invoke-direct {p0, p1}, LW1/z;->setData(LW1/m;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, LW1/z;->L()V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, LW1/z;->g:LW1/n;

    .line 40
    .line 41
    invoke-interface {p1}, LW1/n;->e()F

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iput p1, p0, LW1/z;->A:F

    .line 46
    .line 47
    const/4 v0, 0x2

    .line 48
    int-to-float v0, v0

    .line 49
    div-float/2addr p1, v0

    .line 50
    iput p1, p0, LW1/z;->B:F

    .line 51
    .line 52
    iget-object p1, p0, LW1/z;->g:LW1/n;

    .line 53
    .line 54
    invoke-interface {p1}, LW1/n;->c()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    iput p1, p0, LW1/z;->C:I

    .line 59
    .line 60
    iget-object p1, p0, LW1/z;->g:LW1/n;

    .line 61
    .line 62
    invoke-interface {p1}, LW1/n;->d()F

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    iput p1, p0, LW1/z;->D:F

    .line 67
    .line 68
    iget-object p1, p0, LW1/z;->g:LW1/n;

    .line 69
    .line 70
    invoke-interface {p1}, LW1/n;->f()F

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    iget-object v0, p0, LW1/z;->z:Landroid/graphics/PointF;

    .line 75
    .line 76
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 77
    .line 78
    div-float/2addr p1, v0

    .line 79
    iput p1, p0, LW1/z;->E:F

    .line 80
    .line 81
    iget-object p1, p0, LW1/z;->F:Landroid/graphics/Paint;

    .line 82
    .line 83
    iget v0, p0, LW1/z;->C:I

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, LW1/z;->h:LW1/B;

    .line 89
    .line 90
    invoke-interface {p0, p2}, LW1/B;->a(Lu4/a;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public final I(LW1/m;Lu4/a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LW1/m;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "flyoutMessage"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "afterLayout"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1}, LW1/z;->setData(LW1/m;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, LW1/z;->h:LW1/B;

    .line 15
    .line 16
    invoke-interface {p0, p2}, LW1/B;->a(Lu4/a;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final J(F)V
    .locals 2

    .line 1
    iput p1, p0, LW1/z;->y:F

    .line 2
    .line 3
    invoke-direct {p0}, LW1/z;->getMessage()Landroid/widget/TextView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0, p1}, LW1/z;->K(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, LW1/z;->getTitle()Landroid/widget/TextView;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-direct {p0, p1}, LW1/z;->K(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, LW1/z;->getIcon()Landroid/widget/ImageView;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-direct {p0, p1}, LW1/z;->K(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    iget p1, p0, LW1/z;->y:F

    .line 25
    .line 26
    const/high16 v0, 0x3f400000    # 0.75f

    .line 27
    .line 28
    sub-float/2addr p1, v0

    .line 29
    const/high16 v0, 0x3e800000    # 0.25f

    .line 30
    .line 31
    div-float/2addr p1, v0

    .line 32
    const/4 v0, 0x0

    .line 33
    const/high16 v1, 0x3f800000    # 1.0f

    .line 34
    .line 35
    invoke-static {p1, v0, v1}, LA4/d;->g(FFF)F

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-direct {p0}, LW1/z;->getTitle()Landroid/widget/TextView;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0}, LW1/z;->getMessage()Landroid/widget/TextView;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 51
    .line 52
    .line 53
    invoke-direct {p0}, LW1/z;->getIcon()Landroid/widget/ImageView;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 58
    .line 59
    .line 60
    iget p1, p0, LW1/z;->D:F

    .line 61
    .line 62
    invoke-direct {p0}, LW1/z;->getFlyoutElevation()F

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iget v1, p0, LW1/z;->D:F

    .line 67
    .line 68
    sub-float/2addr v0, v1

    .line 69
    iget v1, p0, LW1/z;->y:F

    .line 70
    .line 71
    mul-float/2addr v0, v1

    .line 72
    add-float/2addr p1, v0

    .line 73
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setTranslationZ(F)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final L()V
    .locals 3

    .line 1
    iget-object v0, p0, LW1/z;->g:LW1/n;

    .line 2
    .line 3
    invoke-interface {v0}, LW1/n;->a()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, LW1/z;->g:LW1/n;

    .line 10
    .line 11
    invoke-interface {v0}, LW1/n;->b()Landroid/graphics/PointF;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget v0, v0, Landroid/graphics/PointF;->x:F

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, LW1/z;->g:LW1/n;

    .line 19
    .line 20
    invoke-interface {v0}, LW1/n;->b()Landroid/graphics/PointF;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget v0, v0, Landroid/graphics/PointF;->x:F

    .line 25
    .line 26
    neg-float v0, v0

    .line 27
    :goto_0
    iget-object v1, p0, LW1/z;->g:LW1/n;

    .line 28
    .line 29
    invoke-interface {v1}, LW1/n;->b()Landroid/graphics/PointF;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 34
    .line 35
    invoke-direct {p0}, LW1/z;->getTriangleHeight()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    int-to-float v2, v2

    .line 40
    add-float/2addr v1, v2

    .line 41
    invoke-direct {p0}, LW1/z;->getTriangleOverlap()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    int-to-float v2, v2

    .line 46
    sub-float/2addr v1, v2

    .line 47
    new-instance v2, Landroid/graphics/PointF;

    .line 48
    .line 49
    invoke-direct {v2, v0, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 50
    .line 51
    .line 52
    iput-object v2, p0, LW1/z;->z:Landroid/graphics/PointF;

    .line 53
    .line 54
    return-void
.end method

.method public final getBounds()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, LW1/z;->G:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    const-string v0, "canvas"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, LW1/z;->A:F

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    iget v2, p0, LW1/z;->A:F

    .line 14
    .line 15
    sub-float/2addr v1, v2

    .line 16
    iget v2, p0, LW1/z;->y:F

    .line 17
    .line 18
    mul-float/2addr v1, v2

    .line 19
    add-float/2addr v0, v1

    .line 20
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-direct {p0}, LW1/z;->getTriangleHeight()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    sub-int/2addr v1, v2

    .line 29
    invoke-direct {p0}, LW1/z;->getTriangleOverlap()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    add-int/2addr v1, v2

    .line 34
    iget v2, p0, LW1/z;->A:F

    .line 35
    .line 36
    int-to-float v1, v1

    .line 37
    sub-float/2addr v1, v2

    .line 38
    iget v3, p0, LW1/z;->y:F

    .line 39
    .line 40
    mul-float/2addr v1, v3

    .line 41
    add-float/2addr v2, v1

    .line 42
    iget-object v1, p0, LW1/z;->t:Landroid/graphics/RectF;

    .line 43
    .line 44
    iget-object v3, p0, LW1/z;->g:LW1/n;

    .line 45
    .line 46
    invoke-interface {v3}, LW1/n;->a()Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-eqz v3, :cond_0

    .line 51
    .line 52
    const/4 v3, 0x0

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    int-to-float v3, v3

    .line 59
    sub-float/2addr v3, v0

    .line 60
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    int-to-float v4, v4

    .line 65
    invoke-direct {p0}, LW1/z;->getTriangleHeight()I

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    int-to-float v5, v5

    .line 70
    sub-float/2addr v4, v5

    .line 71
    invoke-direct {p0}, LW1/z;->getTriangleOverlap()I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    int-to-float v5, v5

    .line 76
    add-float/2addr v4, v5

    .line 77
    sub-float/2addr v4, v2

    .line 78
    iget-object v2, p0, LW1/z;->g:LW1/n;

    .line 79
    .line 80
    invoke-interface {v2}, LW1/n;->a()Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-eqz v2, :cond_1

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    int-to-float v0, v0

    .line 92
    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    int-to-float v2, v2

    .line 97
    invoke-direct {p0}, LW1/z;->getTriangleHeight()I

    .line 98
    .line 99
    .line 100
    move-result v5

    .line 101
    int-to-float v5, v5

    .line 102
    sub-float/2addr v2, v5

    .line 103
    invoke-direct {p0}, LW1/z;->getTriangleOverlap()I

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    int-to-float v5, v5

    .line 108
    add-float/2addr v2, v5

    .line 109
    invoke-virtual {v1, v3, v4, v0, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, LW1/z;->F:Landroid/graphics/Paint;

    .line 113
    .line 114
    invoke-static {}, Ly/f;->b()Ly/f;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    iget v2, p0, LW1/z;->y:F

    .line 119
    .line 120
    const/4 v3, 0x5

    .line 121
    int-to-float v3, v3

    .line 122
    mul-float/2addr v2, v3

    .line 123
    const/high16 v3, 0x3f800000    # 1.0f

    .line 124
    .line 125
    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    iget v3, p0, LW1/z;->C:I

    .line 130
    .line 131
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    iget v4, p0, LW1/z;->x:I

    .line 136
    .line 137
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    invoke-virtual {v1, v2, v3, v4}, Ly/f;->a(FLjava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 153
    .line 154
    .line 155
    invoke-direct {p0}, LW1/z;->getBackgroundRectTx()F

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    invoke-direct {p0}, LW1/z;->getBackgroundRectTy()F

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, LW1/z;->t:Landroid/graphics/RectF;

    .line 167
    .line 168
    invoke-direct {p0}, LW1/z;->getCurrentCornerRadius()F

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    invoke-direct {p0}, LW1/z;->getCurrentCornerRadius()F

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    iget-object v3, p0, LW1/z;->F:Landroid/graphics/Paint;

    .line 177
    .line 178
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 179
    .line 180
    .line 181
    iget v0, p0, LW1/z;->y:F

    .line 182
    .line 183
    iget v1, p0, LW1/z;->E:F

    .line 184
    .line 185
    cmpl-float v0, v0, v1

    .line 186
    .line 187
    if-ltz v0, :cond_2

    .line 188
    .line 189
    invoke-direct {p0, p1}, LW1/z;->u(Landroid/graphics/Canvas;)V

    .line 190
    .line 191
    .line 192
    :cond_2
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidateOutline()V

    .line 196
    .line 197
    .line 198
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onDraw(Landroid/graphics/Canvas;)V

    .line 199
    .line 200
    .line 201
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroidx/constraintlayout/widget/ConstraintLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, LW1/z;->G:Landroid/graphics/Rect;

    .line 5
    .line 6
    iput p2, p0, Landroid/graphics/Rect;->left:I

    .line 7
    .line 8
    iput p3, p0, Landroid/graphics/Rect;->top:I

    .line 9
    .line 10
    iput p4, p0, Landroid/graphics/Rect;->right:I

    .line 11
    .line 12
    iput p5, p0, Landroid/graphics/Rect;->bottom:I

    .line 13
    .line 14
    return-void
.end method
