.class public LS0/b;
.super LS0/a;
.source "ExplodeParticleFactory.java"


# static fields
.field public static final b:F

.field public static final c:F

.field public static final d:F

.field public static final e:F


# instance fields
.field private a:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-static {v0}, Lcom/android/launcher3/anim/H;->c(I)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    int-to-float v0, v0

    .line 7
    sput v0, LS0/b;->b:F

    .line 8
    .line 9
    const/16 v0, 0x14

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/launcher3/anim/H;->c(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-float v0, v0

    .line 16
    sput v0, LS0/b;->c:F

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    invoke-static {v0}, Lcom/android/launcher3/anim/H;->c(I)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    int-to-float v0, v0

    .line 24
    sput v0, LS0/b;->d:F

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-static {v0}, Lcom/android/launcher3/anim/H;->c(I)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    int-to-float v0, v0

    .line 32
    sput v0, LS0/b;->e:F

    .line 33
    .line 34
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, LS0/a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b(ILjava/util/Random;)LV0/a;
    .locals 5

    .line 1
    new-instance v0, LV0/b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p1, v1, v1}, LV0/b;-><init>(IFF)V

    .line 5
    .line 6
    .line 7
    iput p1, v0, LV0/b;->f:I

    .line 8
    .line 9
    sget p1, LS0/b;->d:F

    .line 10
    .line 11
    iput p1, v0, LV0/b;->d:F

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/util/Random;->nextFloat()F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const v2, 0x3e4ccccd    # 0.2f

    .line 18
    .line 19
    .line 20
    cmpg-float v1, v1, v2

    .line 21
    .line 22
    if-gez v1, :cond_0

    .line 23
    .line 24
    sget v1, LS0/b;->b:F

    .line 25
    .line 26
    sub-float/2addr v1, p1

    .line 27
    invoke-virtual {p2}, Ljava/util/Random;->nextFloat()F

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    mul-float/2addr v1, v3

    .line 32
    add-float/2addr p1, v1

    .line 33
    iput p1, v0, LV0/b;->k:F

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    sget v1, LS0/b;->e:F

    .line 37
    .line 38
    sub-float/2addr p1, v1

    .line 39
    invoke-virtual {p2}, Ljava/util/Random;->nextFloat()F

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    mul-float/2addr p1, v3

    .line 44
    add-float/2addr v1, p1

    .line 45
    iput v1, v0, LV0/b;->k:F

    .line 46
    .line 47
    :goto_0
    invoke-virtual {p2}, Ljava/util/Random;->nextFloat()F

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    iget-object v1, p0, LS0/b;->a:Landroid/graphics/Rect;

    .line 52
    .line 53
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    int-to-float v1, v1

    .line 58
    const v3, 0x3e3851ec    # 0.18f

    .line 59
    .line 60
    .line 61
    invoke-virtual {p2}, Ljava/util/Random;->nextFloat()F

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    mul-float/2addr v4, v3

    .line 66
    add-float/2addr v4, v2

    .line 67
    mul-float/2addr v1, v4

    .line 68
    iput v1, v0, LV0/b;->l:F

    .line 69
    .line 70
    cmpg-float v3, p1, v2

    .line 71
    .line 72
    if-gez v3, :cond_1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_1
    mul-float/2addr v2, v1

    .line 76
    invoke-virtual {p2}, Ljava/util/Random;->nextFloat()F

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    mul-float/2addr v2, v4

    .line 81
    add-float/2addr v1, v2

    .line 82
    :goto_1
    iput v1, v0, LV0/b;->l:F

    .line 83
    .line 84
    iget-object v1, p0, LS0/b;->a:Landroid/graphics/Rect;

    .line 85
    .line 86
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    int-to-float v1, v1

    .line 91
    invoke-virtual {p2}, Ljava/util/Random;->nextFloat()F

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    const/high16 v4, 0x3f000000    # 0.5f

    .line 96
    .line 97
    sub-float/2addr v2, v4

    .line 98
    mul-float/2addr v1, v2

    .line 99
    const v2, 0x3fe66666    # 1.8f

    .line 100
    .line 101
    .line 102
    mul-float/2addr v1, v2

    .line 103
    iput v1, v0, LV0/b;->m:F

    .line 104
    .line 105
    if-gez v3, :cond_2

    .line 106
    .line 107
    goto :goto_3

    .line 108
    :cond_2
    const v2, 0x3f4ccccd    # 0.8f

    .line 109
    .line 110
    .line 111
    cmpg-float p1, p1, v2

    .line 112
    .line 113
    if-gez p1, :cond_3

    .line 114
    .line 115
    const p1, 0x3f19999a    # 0.6f

    .line 116
    .line 117
    .line 118
    :goto_2
    mul-float/2addr v1, p1

    .line 119
    goto :goto_3

    .line 120
    :cond_3
    const p1, 0x3e99999a    # 0.3f

    .line 121
    .line 122
    .line 123
    goto :goto_2

    .line 124
    :goto_3
    iput v1, v0, LV0/b;->m:F

    .line 125
    .line 126
    const/high16 p1, 0x40800000    # 4.0f

    .line 127
    .line 128
    iget v2, v0, LV0/b;->l:F

    .line 129
    .line 130
    mul-float/2addr v2, p1

    .line 131
    div-float/2addr v2, v1

    .line 132
    iput v2, v0, LV0/b;->n:F

    .line 133
    .line 134
    neg-float p1, v2

    .line 135
    div-float/2addr p1, v1

    .line 136
    iput p1, v0, LV0/b;->o:F

    .line 137
    .line 138
    iget-object p1, p0, LS0/b;->a:Landroid/graphics/Rect;

    .line 139
    .line 140
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    int-to-float p1, p1

    .line 145
    sget v1, LS0/b;->c:F

    .line 146
    .line 147
    invoke-virtual {p2}, Ljava/util/Random;->nextFloat()F

    .line 148
    .line 149
    .line 150
    move-result v2

    .line 151
    sub-float/2addr v2, v4

    .line 152
    mul-float/2addr v2, v1

    .line 153
    add-float/2addr p1, v2

    .line 154
    iput p1, v0, LV0/b;->i:F

    .line 155
    .line 156
    iput p1, v0, LV0/b;->g:F

    .line 157
    .line 158
    iget-object p0, p0, LS0/b;->a:Landroid/graphics/Rect;

    .line 159
    .line 160
    invoke-virtual {p0}, Landroid/graphics/Rect;->centerY()I

    .line 161
    .line 162
    .line 163
    move-result p0

    .line 164
    int-to-float p0, p0

    .line 165
    invoke-virtual {p2}, Ljava/util/Random;->nextFloat()F

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    sub-float/2addr p1, v4

    .line 170
    mul-float/2addr v1, p1

    .line 171
    add-float/2addr p0, v1

    .line 172
    iput p0, v0, LV0/b;->j:F

    .line 173
    .line 174
    iput p0, v0, LV0/b;->h:F

    .line 175
    .line 176
    const p0, 0x3dcccccd    # 0.1f

    .line 177
    .line 178
    .line 179
    invoke-virtual {p2}, Ljava/util/Random;->nextFloat()F

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    mul-float/2addr p1, p0

    .line 184
    iput p1, v0, LV0/b;->p:F

    .line 185
    .line 186
    const p0, 0x3ecccccd    # 0.4f

    .line 187
    .line 188
    .line 189
    invoke-virtual {p2}, Ljava/util/Random;->nextFloat()F

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    mul-float/2addr p1, p0

    .line 194
    iput p1, v0, LV0/b;->q:F

    .line 195
    .line 196
    const/high16 p0, 0x3f800000    # 1.0f

    .line 197
    .line 198
    iput p0, v0, LV0/b;->e:F

    .line 199
    .line 200
    return-object v0
.end method


# virtual methods
.method public a(Landroid/graphics/Bitmap;Landroid/graphics/Rect;)[[LV0/a;
    .locals 10

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, LS0/b;->a:Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    new-instance v1, Ljava/util/Random;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    .line 19
    .line 20
    .line 21
    div-int/lit8 v0, v0, 0xf

    .line 22
    .line 23
    div-int/lit8 p2, p2, 0xf

    .line 24
    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    div-int/lit8 v0, p2, 0xf

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    div-int/lit8 p2, p2, 0xf

    .line 40
    .line 41
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    div-int/2addr v2, v0

    .line 46
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    div-int/2addr v3, p2

    .line 51
    const/4 v4, 0x2

    .line 52
    new-array v4, v4, [I

    .line 53
    .line 54
    const/4 v5, 0x1

    .line 55
    aput v0, v4, v5

    .line 56
    .line 57
    const/4 v5, 0x0

    .line 58
    aput p2, v4, v5

    .line 59
    .line 60
    const-class v6, LV0/a;

    .line 61
    .line 62
    invoke-static {v6, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    check-cast v4, [[LV0/a;

    .line 67
    .line 68
    move v6, v5

    .line 69
    :goto_0
    if-ge v6, p2, :cond_3

    .line 70
    .line 71
    move v7, v5

    .line 72
    :goto_1
    if-ge v7, v0, :cond_2

    .line 73
    .line 74
    mul-int v8, v7, v2

    .line 75
    .line 76
    mul-int v9, v6, v3

    .line 77
    .line 78
    invoke-virtual {p1, v8, v9}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 79
    .line 80
    .line 81
    move-result v8

    .line 82
    aget-object v9, v4, v6

    .line 83
    .line 84
    invoke-direct {p0, v8, v1}, LS0/b;->b(ILjava/util/Random;)LV0/a;

    .line 85
    .line 86
    .line 87
    move-result-object v8

    .line 88
    aput-object v8, v9, v7

    .line 89
    .line 90
    add-int/lit8 v7, v7, 0x1

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_2
    add-int/lit8 v6, v6, 0x1

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_3
    return-object v4
.end method
