.class public final Lcom/android/launcher3/taskbar/L1;
.super Ljava/lang/Object;
.source "TaskbarBackgroundRenderer.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/L1$a;
    }
.end annotation


# static fields
.field public static final E:Lcom/android/launcher3/taskbar/L1$a;


# instance fields
.field private final A:Landroid/graphics/Path;

.field private final B:Landroid/graphics/Path;

.field private C:I

.field private final D:I

.field private final a:Lcom/android/launcher3/taskbar/I1;

.field private final b:Z

.field private final c:F

.field private final d:F

.field private e:F

.field private f:Z

.field private g:Z

.field private h:Z

.field private final i:Landroid/graphics/Paint;

.field private final j:Landroid/graphics/Paint;

.field private final k:Landroid/graphics/RectF;

.field private l:F

.field private m:F

.field private n:F

.field private o:F

.field private final p:Landroid/graphics/Rect;

.field private final q:F

.field private final r:I

.field private s:F

.field private t:F

.field private u:I

.field private final v:F

.field private w:F

.field private x:F

.field private final y:Landroid/graphics/Path;

.field private final z:Landroid/graphics/Path;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/L1$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/L1$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/taskbar/L1;->E:Lcom/android/launcher3/taskbar/L1$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;)V
    .locals 6

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/taskbar/L1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->k1()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    xor-int/2addr v0, v1

    .line 17
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/L1;->b:Z

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->I0()Lcom/android/launcher3/h0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget v0, v0, Lcom/android/launcher3/h0;->r3:I

    .line 24
    .line 25
    int-to-float v0, v0

    .line 26
    iput v0, p0, Lcom/android/launcher3/taskbar/L1;->c:F

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->A0()Lcom/android/launcher3/h0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget v0, v0, Lcom/android/launcher3/h0;->r3:I

    .line 33
    .line 34
    int-to-float v0, v0

    .line 35
    iput v0, p0, Lcom/android/launcher3/taskbar/L1;->d:F

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const/high16 v2, 0x3f800000    # 1.0f

    .line 42
    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    move v0, v2

    .line 48
    :goto_0
    iput v0, p0, Lcom/android/launcher3/taskbar/L1;->e:F

    .line 49
    .line 50
    new-instance v0, Landroid/graphics/Paint;

    .line 51
    .line 52
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Lcom/android/launcher3/taskbar/L1;->i:Landroid/graphics/Paint;

    .line 56
    .line 57
    new-instance v3, Landroid/graphics/Paint;

    .line 58
    .line 59
    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v3, p0, Lcom/android/launcher3/taskbar/L1;->j:Landroid/graphics/Paint;

    .line 63
    .line 64
    new-instance v4, Landroid/graphics/RectF;

    .line 65
    .line 66
    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v4, p0, Lcom/android/launcher3/taskbar/L1;->k:Landroid/graphics/RectF;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    iget v4, v4, Lcom/android/launcher3/h0;->r3:I

    .line 76
    .line 77
    int-to-float v4, v4

    .line 78
    iput v4, p0, Lcom/android/launcher3/taskbar/L1;->l:F

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->H0()Landroid/graphics/Rect;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    iput-object v4, p0, Lcom/android/launcher3/taskbar/L1;->p:Landroid/graphics/Rect;

    .line 85
    .line 86
    new-instance v4, Landroid/graphics/Path;

    .line 87
    .line 88
    invoke-direct {v4}, Landroid/graphics/Path;-><init>()V

    .line 89
    .line 90
    .line 91
    iput-object v4, p0, Lcom/android/launcher3/taskbar/L1;->y:Landroid/graphics/Path;

    .line 92
    .line 93
    new-instance v4, Landroid/graphics/Path;

    .line 94
    .line 95
    invoke-direct {v4}, Landroid/graphics/Path;-><init>()V

    .line 96
    .line 97
    .line 98
    iput-object v4, p0, Lcom/android/launcher3/taskbar/L1;->z:Landroid/graphics/Path;

    .line 99
    .line 100
    new-instance v4, Landroid/graphics/Path;

    .line 101
    .line 102
    invoke-direct {v4}, Landroid/graphics/Path;-><init>()V

    .line 103
    .line 104
    .line 105
    iput-object v4, p0, Lcom/android/launcher3/taskbar/L1;->A:Landroid/graphics/Path;

    .line 106
    .line 107
    new-instance v4, Landroid/graphics/Path;

    .line 108
    .line 109
    invoke-direct {v4}, Landroid/graphics/Path;-><init>()V

    .line 110
    .line 111
    .line 112
    iput-object v4, p0, Lcom/android/launcher3/taskbar/L1;->B:Landroid/graphics/Path;

    .line 113
    .line 114
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    const v5, 0x7f070bb4

    .line 119
    .line 120
    .line 121
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 122
    .line 123
    .line 124
    move-result v4

    .line 125
    iput v4, p0, Lcom/android/launcher3/taskbar/L1;->C:I

    .line 126
    .line 127
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    const v5, 0x7f070bb3

    .line 132
    .line 133
    .line 134
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    iput v4, p0, Lcom/android/launcher3/taskbar/L1;->D:I

    .line 139
    .line 140
    const v4, 0x7f0607e2

    .line 141
    .line 142
    .line 143
    invoke-virtual {p1, v4}, Landroid/view/ContextThemeWrapper;->getColor(I)I

    .line 144
    .line 145
    .line 146
    move-result v4

    .line 147
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFlags(I)V

    .line 151
    .line 152
    .line 153
    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 154
    .line 155
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 156
    .line 157
    .line 158
    const v0, 0x7f0607ef

    .line 159
    .line 160
    .line 161
    invoke-virtual {p1, v0}, Landroid/view/ContextThemeWrapper;->getColor(I)I

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setFlags(I)V

    .line 169
    .line 170
    .line 171
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 172
    .line 173
    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    const v1, 0x7f070c25

    .line 181
    .line 182
    .line 183
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 188
    .line 189
    .line 190
    invoke-static {p1}, Lcom/android/launcher3/N5;->x(Landroid/content/Context;)Z

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    if-eqz v0, :cond_1

    .line 195
    .line 196
    const/16 v0, 0x33

    .line 197
    .line 198
    iput v0, p0, Lcom/android/launcher3/taskbar/L1;->r:I

    .line 199
    .line 200
    const/high16 v0, 0x424c0000    # 51.0f

    .line 201
    .line 202
    iput v0, p0, Lcom/android/launcher3/taskbar/L1;->q:F

    .line 203
    .line 204
    goto :goto_1

    .line 205
    :cond_1
    const/16 v0, 0x29

    .line 206
    .line 207
    iput v0, p0, Lcom/android/launcher3/taskbar/L1;->r:I

    .line 208
    .line 209
    const/high16 v0, 0x41c80000    # 25.0f

    .line 210
    .line 211
    iput v0, p0, Lcom/android/launcher3/taskbar/L1;->q:F

    .line 212
    .line 213
    :goto_1
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->s0()I

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    int-to-float v0, v0

    .line 218
    iput v0, p0, Lcom/android/launcher3/taskbar/L1;->v:F

    .line 219
    .line 220
    iput v0, p0, Lcom/android/launcher3/taskbar/L1;->w:F

    .line 221
    .line 222
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->V0()Z

    .line 223
    .line 224
    .line 225
    move-result p1

    .line 226
    if-nez p1, :cond_2

    .line 227
    .line 228
    invoke-virtual {p0, v2}, Lcom/android/launcher3/taskbar/L1;->l(F)V

    .line 229
    .line 230
    .line 231
    :cond_2
    return-void
.end method

.method private final b(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    iget-boolean v2, p0, Lcom/android/launcher3/taskbar/L1;->f:Z

    .line 2
    .line 3
    const/4 v7, 0x0

    .line 4
    if-nez v2, :cond_1

    .line 5
    .line 6
    iget-boolean v2, p0, Lcom/android/launcher3/taskbar/L1;->g:Z

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget v2, p0, Lcom/android/launcher3/taskbar/L1;->d:F

    .line 12
    .line 13
    iget v3, p0, Lcom/android/launcher3/taskbar/L1;->l:F

    .line 14
    .line 15
    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    int-to-float v2, v2

    .line 24
    sub-float/2addr v2, v5

    .line 25
    invoke-virtual {p1, v7, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    int-to-float v4, v2

    .line 33
    iget-object v6, p0, Lcom/android/launcher3/taskbar/L1;->i:Landroid/graphics/Paint;

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    const/4 v3, 0x0

    .line 37
    move-object v1, p1

    .line 38
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    :goto_0
    iget v2, p0, Lcom/android/launcher3/taskbar/L1;->d:F

    .line 43
    .line 44
    iget v3, p0, Lcom/android/launcher3/taskbar/L1;->e:F

    .line 45
    .line 46
    mul-float v5, v2, v3

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    int-to-float v2, v2

    .line 53
    sub-float/2addr v2, v5

    .line 54
    invoke-virtual {p1, v7, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    int-to-float v4, v2

    .line 62
    iget-object v6, p0, Lcom/android/launcher3/taskbar/L1;->i:Landroid/graphics/Paint;

    .line 63
    .line 64
    const/4 v2, 0x0

    .line 65
    const/4 v3, 0x0

    .line 66
    move-object v1, p1

    .line 67
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 68
    .line 69
    .line 70
    :goto_1
    iget v2, p0, Lcom/android/launcher3/taskbar/L1;->w:F

    .line 71
    .line 72
    neg-float v2, v2

    .line 73
    invoke-virtual {p1, v7, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 74
    .line 75
    .line 76
    iget-object v2, p0, Lcom/android/launcher3/taskbar/L1;->A:Landroid/graphics/Path;

    .line 77
    .line 78
    iget-object v3, p0, Lcom/android/launcher3/taskbar/L1;->i:Landroid/graphics/Paint;

    .line 79
    .line 80
    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 81
    .line 82
    .line 83
    iget v2, p0, Lcom/android/launcher3/taskbar/L1;->w:F

    .line 84
    .line 85
    invoke-virtual {p1, v7, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    int-to-float v2, v2

    .line 93
    iget v3, p0, Lcom/android/launcher3/taskbar/L1;->w:F

    .line 94
    .line 95
    sub-float/2addr v2, v3

    .line 96
    neg-float v3, v3

    .line 97
    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 98
    .line 99
    .line 100
    iget-object v2, p0, Lcom/android/launcher3/taskbar/L1;->B:Landroid/graphics/Path;

    .line 101
    .line 102
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L1;->i:Landroid/graphics/Paint;

    .line 103
    .line 104
    invoke-virtual {p1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method private final c(Landroid/graphics/Canvas;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/android/launcher3/taskbar/L1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    invoke-virtual {v2}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget v3, v0, Lcom/android/launcher3/taskbar/L1;->c:F

    .line 12
    .line 13
    iget v4, v0, Lcom/android/launcher3/taskbar/L1;->e:F

    .line 14
    .line 15
    const/high16 v5, 0x3f800000    # 1.0f

    .line 16
    .line 17
    sub-float v4, v5, v4

    .line 18
    .line 19
    mul-float/2addr v4, v3

    .line 20
    iget-boolean v6, v0, Lcom/android/launcher3/taskbar/L1;->f:Z

    .line 21
    .line 22
    if-nez v6, :cond_1

    .line 23
    .line 24
    iget-boolean v6, v0, Lcom/android/launcher3/taskbar/L1;->h:Z

    .line 25
    .line 26
    if-eqz v6, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 v6, 0x0

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    :goto_0
    const/4 v6, 0x1

    .line 32
    :goto_1
    if-eqz v6, :cond_2

    .line 33
    .line 34
    move v7, v4

    .line 35
    goto :goto_2

    .line 36
    :cond_2
    iget v7, v0, Lcom/android/launcher3/taskbar/L1;->l:F

    .line 37
    .line 38
    :goto_2
    div-float/2addr v7, v3

    .line 39
    const/high16 v3, 0x42c80000    # 100.0f

    .line 40
    .line 41
    mul-float/2addr v7, v3

    .line 42
    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    int-to-float v7, v7

    .line 47
    div-float/2addr v7, v3

    .line 48
    const v8, 0x7f070c1f

    .line 49
    .line 50
    .line 51
    const v9, 0x7f070c22

    .line 52
    .line 53
    .line 54
    const v10, 0x7f070c1d

    .line 55
    .line 56
    .line 57
    const/4 v11, 0x0

    .line 58
    if-eqz v6, :cond_3

    .line 59
    .line 60
    iget v6, v0, Lcom/android/launcher3/taskbar/L1;->c:F

    .line 61
    .line 62
    div-float/2addr v4, v6

    .line 63
    mul-float/2addr v4, v3

    .line 64
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    int-to-float v4, v4

    .line 69
    div-float/2addr v4, v3

    .line 70
    invoke-virtual {v2, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    int-to-float v3, v3

    .line 75
    invoke-static {v4, v11, v3}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    float-to-int v3, v3

    .line 80
    iput v3, v0, Lcom/android/launcher3/taskbar/L1;->u:I

    .line 81
    .line 82
    invoke-virtual {v2, v9}, Landroid/content/res/Resources;->getDimension(I)F

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    invoke-static {v4, v11, v3}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    iput v3, v0, Lcom/android/launcher3/taskbar/L1;->s:F

    .line 91
    .line 92
    invoke-virtual {v2, v8}, Landroid/content/res/Resources;->getDimension(I)F

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    invoke-static {v4, v11, v2}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    iput v2, v0, Lcom/android/launcher3/taskbar/L1;->t:F

    .line 101
    .line 102
    goto :goto_3

    .line 103
    :cond_3
    invoke-virtual {v2, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    iput v3, v0, Lcom/android/launcher3/taskbar/L1;->u:I

    .line 108
    .line 109
    invoke-virtual {v2, v9}, Landroid/content/res/Resources;->getDimension(I)F

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    iput v3, v0, Lcom/android/launcher3/taskbar/L1;->s:F

    .line 114
    .line 115
    invoke-virtual {v2, v8}, Landroid/content/res/Resources;->getDimension(I)F

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    iput v2, v0, Lcom/android/launcher3/taskbar/L1;->t:F

    .line 120
    .line 121
    :goto_3
    iget-boolean v2, v0, Lcom/android/launcher3/taskbar/L1;->f:Z

    .line 122
    .line 123
    if-eqz v2, :cond_4

    .line 124
    .line 125
    iget v2, v0, Lcom/android/launcher3/taskbar/L1;->d:F

    .line 126
    .line 127
    goto :goto_4

    .line 128
    :cond_4
    iget v2, v0, Lcom/android/launcher3/taskbar/L1;->D:I

    .line 129
    .line 130
    int-to-float v2, v2

    .line 131
    :goto_4
    iget v3, v0, Lcom/android/launcher3/taskbar/L1;->c:F

    .line 132
    .line 133
    invoke-static {v7, v2, v3}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    iget-object v3, v0, Lcom/android/launcher3/taskbar/L1;->p:Landroid/graphics/Rect;

    .line 138
    .line 139
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    iget-object v4, v0, Lcom/android/launcher3/taskbar/L1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 144
    .line 145
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/I1;->t0()F

    .line 146
    .line 147
    .line 148
    move-result v4

    .line 149
    iget-boolean v6, v0, Lcom/android/launcher3/taskbar/L1;->f:Z

    .line 150
    .line 151
    if-eqz v6, :cond_5

    .line 152
    .line 153
    goto :goto_5

    .line 154
    :cond_5
    iget v4, v0, Lcom/android/launcher3/taskbar/L1;->C:I

    .line 155
    .line 156
    int-to-float v4, v4

    .line 157
    :goto_5
    int-to-float v3, v3

    .line 158
    invoke-static {v7, v4, v3}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 159
    .line 160
    .line 161
    move-result v4

    .line 162
    sub-float v4, v3, v4

    .line 163
    .line 164
    const/high16 v6, 0x40000000    # 2.0f

    .line 165
    .line 166
    div-float/2addr v4, v6

    .line 167
    div-float v8, v2, v6

    .line 168
    .line 169
    iget v9, v0, Lcom/android/launcher3/taskbar/L1;->u:I

    .line 170
    .line 171
    int-to-float v9, v9

    .line 172
    sub-float/2addr v5, v7

    .line 173
    div-float v10, v5, v6

    .line 174
    .line 175
    mul-float/2addr v9, v10

    .line 176
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    .line 177
    .line 178
    .line 179
    move-result v10

    .line 180
    iget v12, v0, Lcom/android/launcher3/taskbar/L1;->u:I

    .line 181
    .line 182
    sub-int/2addr v10, v12

    .line 183
    int-to-float v10, v10

    .line 184
    add-float/2addr v10, v9

    .line 185
    iget v9, v0, Lcom/android/launcher3/taskbar/L1;->m:F

    .line 186
    .line 187
    add-float/2addr v10, v9

    .line 188
    iget v9, v0, Lcom/android/launcher3/taskbar/L1;->n:F

    .line 189
    .line 190
    add-float/2addr v10, v9

    .line 191
    iget-boolean v9, v0, Lcom/android/launcher3/taskbar/L1;->f:Z

    .line 192
    .line 193
    if-eqz v9, :cond_6

    .line 194
    .line 195
    move v9, v11

    .line 196
    goto :goto_6

    .line 197
    :cond_6
    iget v9, v0, Lcom/android/launcher3/taskbar/L1;->D:I

    .line 198
    .line 199
    int-to-float v9, v9

    .line 200
    div-float/2addr v9, v6

    .line 201
    :goto_6
    invoke-static {v5, v11, v9}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 202
    .line 203
    .line 204
    move-result v5

    .line 205
    neg-float v5, v5

    .line 206
    add-float/2addr v10, v5

    .line 207
    iget-object v5, v0, Lcom/android/launcher3/taskbar/L1;->i:Landroid/graphics/Paint;

    .line 208
    .line 209
    invoke-virtual {v5}, Landroid/graphics/Paint;->getAlpha()I

    .line 210
    .line 211
    .line 212
    move-result v5

    .line 213
    int-to-float v12, v5

    .line 214
    iget v5, v0, Lcom/android/launcher3/taskbar/L1;->q:F

    .line 215
    .line 216
    sget-object v17, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 217
    .line 218
    const/4 v13, 0x0

    .line 219
    const/high16 v14, 0x437f0000    # 255.0f

    .line 220
    .line 221
    const/4 v15, 0x0

    .line 222
    move/from16 v16, v5

    .line 223
    .line 224
    invoke-static/range {v12 .. v17}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 225
    .line 226
    .line 227
    move-result v5

    .line 228
    iget-object v6, v0, Lcom/android/launcher3/taskbar/L1;->i:Landroid/graphics/Paint;

    .line 229
    .line 230
    iget v9, v0, Lcom/android/launcher3/taskbar/L1;->s:F

    .line 231
    .line 232
    iget v12, v0, Lcom/android/launcher3/taskbar/L1;->t:F

    .line 233
    .line 234
    const/high16 v13, -0x1000000

    .line 235
    .line 236
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 237
    .line 238
    .line 239
    move-result v5

    .line 240
    invoke-static {v13, v5}, Ls1/q;->h(II)I

    .line 241
    .line 242
    .line 243
    move-result v5

    .line 244
    invoke-virtual {v6, v9, v11, v12, v5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 245
    .line 246
    .line 247
    iget-object v5, v0, Lcom/android/launcher3/taskbar/L1;->j:Landroid/graphics/Paint;

    .line 248
    .line 249
    iget-object v6, v0, Lcom/android/launcher3/taskbar/L1;->i:Landroid/graphics/Paint;

    .line 250
    .line 251
    invoke-virtual {v6}, Landroid/graphics/Paint;->getAlpha()I

    .line 252
    .line 253
    .line 254
    move-result v6

    .line 255
    iget v9, v0, Lcom/android/launcher3/taskbar/L1;->r:I

    .line 256
    .line 257
    mul-int/2addr v6, v9

    .line 258
    div-int/lit16 v6, v6, 0xff

    .line 259
    .line 260
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 261
    .line 262
    .line 263
    iget v5, v0, Lcom/android/launcher3/taskbar/L1;->o:F

    .line 264
    .line 265
    mul-float/2addr v5, v7

    .line 266
    iget-object v6, v0, Lcom/android/launcher3/taskbar/L1;->k:Landroid/graphics/RectF;

    .line 267
    .line 268
    iget-object v7, v0, Lcom/android/launcher3/taskbar/L1;->p:Landroid/graphics/Rect;

    .line 269
    .line 270
    iget v9, v7, Landroid/graphics/Rect;->left:I

    .line 271
    .line 272
    int-to-float v9, v9

    .line 273
    add-float/2addr v9, v4

    .line 274
    add-float/2addr v9, v5

    .line 275
    sub-float v2, v10, v2

    .line 276
    .line 277
    iget v7, v7, Landroid/graphics/Rect;->right:I

    .line 278
    .line 279
    int-to-float v7, v7

    .line 280
    sub-float/2addr v7, v4

    .line 281
    add-float/2addr v7, v5

    .line 282
    invoke-virtual {v6, v9, v2, v7, v10}, Landroid/graphics/RectF;->set(FFFF)V

    .line 283
    .line 284
    .line 285
    iget v2, v0, Lcom/android/launcher3/taskbar/L1;->x:F

    .line 286
    .line 287
    mul-float/2addr v3, v2

    .line 288
    iget-object v2, v0, Lcom/android/launcher3/taskbar/L1;->k:Landroid/graphics/RectF;

    .line 289
    .line 290
    invoke-virtual {v2, v3, v11}, Landroid/graphics/RectF;->inset(FF)V

    .line 291
    .line 292
    .line 293
    iget-object v2, v0, Lcom/android/launcher3/taskbar/L1;->k:Landroid/graphics/RectF;

    .line 294
    .line 295
    iget-object v3, v0, Lcom/android/launcher3/taskbar/L1;->i:Landroid/graphics/Paint;

    .line 296
    .line 297
    invoke-virtual {v1, v2, v8, v8, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 298
    .line 299
    .line 300
    iget-object v2, v0, Lcom/android/launcher3/taskbar/L1;->k:Landroid/graphics/RectF;

    .line 301
    .line 302
    iget-object v0, v0, Lcom/android/launcher3/taskbar/L1;->j:Landroid/graphics/Paint;

    .line 303
    .line 304
    invoke-virtual {v1, v2, v8, v8, v0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 305
    .line 306
    .line 307
    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    const-string v0, "canvas"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/L1;->b:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 18
    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v1, p0, Lcom/android/launcher3/taskbar/L1;->p:Landroid/graphics/Rect;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/graphics/Rect;->isEmpty()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/L1;->f:Z

    .line 31
    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/L1;->b(Landroid/graphics/Canvas;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 41
    .line 42
    .line 43
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/L1;->f:Z

    .line 44
    .line 45
    if-nez v1, :cond_3

    .line 46
    .line 47
    if-eqz v0, :cond_4

    .line 48
    .line 49
    :cond_3
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/L1;->c(Landroid/graphics/Canvas;)V

    .line 50
    .line 51
    .line 52
    :cond_4
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final d()Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L1;->k:Landroid/graphics/RectF;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()Landroid/graphics/Paint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L1;->i:Landroid/graphics/Paint;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/L1;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public final g(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/L1;->f:Z

    .line 2
    .line 3
    return-void
.end method

.method public final h(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/L1;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public final i(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/L1;->l:F

    .line 2
    .line 3
    return-void
.end method

.method public final j(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/L1;->x:F

    .line 2
    .line 3
    return-void
.end method

.method public final k(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/L1;->e:F

    .line 2
    .line 3
    return-void
.end method

.method public final l(F)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L1;->p:Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget v0, p0, Lcom/android/launcher3/taskbar/L1;->v:F

    .line 19
    .line 20
    mul-float/2addr v0, p1

    .line 21
    iput v0, p0, Lcom/android/launcher3/taskbar/L1;->w:F

    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/launcher3/taskbar/L1;->y:Landroid/graphics/Path;

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L1;->y:Landroid/graphics/Path;

    .line 29
    .line 30
    iget v3, p0, Lcom/android/launcher3/taskbar/L1;->w:F

    .line 31
    .line 32
    sget-object v5, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    const/4 v2, 0x0

    .line 36
    move v4, v3

    .line 37
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/android/launcher3/taskbar/L1;->z:Landroid/graphics/Path;

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/android/launcher3/taskbar/L1;->z:Landroid/graphics/Path;

    .line 46
    .line 47
    iget v0, p0, Lcom/android/launcher3/taskbar/L1;->w:F

    .line 48
    .line 49
    invoke-virtual {p1, v0, v1, v0, v5}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/android/launcher3/taskbar/L1;->A:Landroid/graphics/Path;

    .line 53
    .line 54
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L1;->y:Landroid/graphics/Path;

    .line 55
    .line 56
    iget-object v2, p0, Lcom/android/launcher3/taskbar/L1;->z:Landroid/graphics/Path;

    .line 57
    .line 58
    sget-object v3, Landroid/graphics/Path$Op;->DIFFERENCE:Landroid/graphics/Path$Op;

    .line 59
    .line 60
    invoke-virtual {p1, v0, v2, v3}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/android/launcher3/taskbar/L1;->z:Landroid/graphics/Path;

    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/android/launcher3/taskbar/L1;->z:Landroid/graphics/Path;

    .line 69
    .line 70
    iget v0, p0, Lcom/android/launcher3/taskbar/L1;->w:F

    .line 71
    .line 72
    invoke-virtual {p1, v1, v1, v0, v5}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/android/launcher3/taskbar/L1;->B:Landroid/graphics/Path;

    .line 76
    .line 77
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L1;->y:Landroid/graphics/Path;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L1;->z:Landroid/graphics/Path;

    .line 80
    .line 81
    invoke-virtual {p1, v0, p0, v3}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final m(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/L1;->o:F

    .line 2
    .line 3
    return-void
.end method

.method public final n(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/L1;->n:F

    .line 2
    .line 3
    return-void
.end method

.method public final o(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/L1;->m:F

    .line 2
    .line 3
    return-void
.end method

.method public final p(Lcom/android/launcher3/taskbar/I1;Landroid/content/res/Resources;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "res"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->j1()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->P0()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const p1, 0x7f070bb4

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    :goto_0
    const p1, 0x7f070bb7

    .line 35
    .line 36
    .line 37
    :goto_1
    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iput p1, p0, Lcom/android/launcher3/taskbar/L1;->C:I

    .line 42
    .line 43
    return-void
.end method
