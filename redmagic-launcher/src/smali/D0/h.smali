.class public LD0/h;
.super LD0/b;
.source "SolidLayer.java"


# instance fields
.field private final D:Landroid/graphics/RectF;

.field private final E:Landroid/graphics/Paint;

.field private final F:[F

.field private final G:Landroid/graphics/Path;

.field private final H:LD0/e;

.field private I:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Landroid/graphics/ColorFilter;",
            "Landroid/graphics/ColorFilter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/airbnb/lottie/n;LD0/e;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, LD0/b;-><init>(Lcom/airbnb/lottie/n;LD0/e;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/RectF;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, LD0/h;->D:Landroid/graphics/RectF;

    .line 10
    .line 11
    new-instance p1, Lw0/a;

    .line 12
    .line 13
    invoke-direct {p1}, Lw0/a;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, LD0/h;->E:Landroid/graphics/Paint;

    .line 17
    .line 18
    const/16 v0, 0x8

    .line 19
    .line 20
    new-array v0, v0, [F

    .line 21
    .line 22
    iput-object v0, p0, LD0/h;->F:[F

    .line 23
    .line 24
    new-instance v0, Landroid/graphics/Path;

    .line 25
    .line 26
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, LD0/h;->G:Landroid/graphics/Path;

    .line 30
    .line 31
    iput-object p2, p0, LD0/h;->H:LD0/e;

    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 35
    .line 36
    .line 37
    sget-object p0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 38
    .line 39
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p2}, LD0/e;->o()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public e(Ljava/lang/Object;LI0/c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "LI0/c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, LD0/b;->e(Ljava/lang/Object;LI0/c;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lv0/u;->K:Landroid/graphics/ColorFilter;

    .line 5
    .line 6
    if-ne p1, v0, :cond_1

    .line 7
    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, LD0/h;->I:Ly0/a;

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance p1, Ly0/q;

    .line 15
    .line 16
    invoke-direct {p1, p2}, Ly0/q;-><init>(LI0/c;)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, LD0/h;->I:Ly0/a;

    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Z)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, LD0/b;->g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Z)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, LD0/h;->D:Landroid/graphics/RectF;

    .line 5
    .line 6
    iget-object p3, p0, LD0/h;->H:LD0/e;

    .line 7
    .line 8
    invoke-virtual {p3}, LD0/e;->q()I

    .line 9
    .line 10
    .line 11
    move-result p3

    .line 12
    int-to-float p3, p3

    .line 13
    iget-object v0, p0, LD0/h;->H:LD0/e;

    .line 14
    .line 15
    invoke-virtual {v0}, LD0/e;->p()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    int-to-float v0, v0

    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {p2, v1, v1, p3, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 22
    .line 23
    .line 24
    iget-object p2, p0, LD0/b;->o:Landroid/graphics/Matrix;

    .line 25
    .line 26
    iget-object p3, p0, LD0/h;->D:Landroid/graphics/RectF;

    .line 27
    .line 28
    invoke-virtual {p2, p3}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, LD0/h;->D:Landroid/graphics/RectF;

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public u(Landroid/graphics/Canvas;Landroid/graphics/Matrix;I)V
    .locals 9

    .line 1
    iget-object v0, p0, LD0/h;->H:LD0/e;

    .line 2
    .line 3
    invoke-virtual {v0}, LD0/e;->o()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_1

    .line 14
    .line 15
    :cond_0
    iget-object v1, p0, LD0/b;->x:Ly0/p;

    .line 16
    .line 17
    invoke-virtual {v1}, Ly0/p;->h()Ly0/a;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    const/16 v1, 0x64

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget-object v1, p0, LD0/b;->x:Ly0/p;

    .line 27
    .line 28
    invoke-virtual {v1}, Ly0/p;->h()Ly0/a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1}, Ly0/a;->h()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Ljava/lang/Integer;

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    :goto_0
    int-to-float p3, p3

    .line 43
    const/high16 v2, 0x437f0000    # 255.0f

    .line 44
    .line 45
    div-float/2addr p3, v2

    .line 46
    int-to-float v0, v0

    .line 47
    div-float/2addr v0, v2

    .line 48
    int-to-float v1, v1

    .line 49
    mul-float/2addr v0, v1

    .line 50
    const/high16 v1, 0x42c80000    # 100.0f

    .line 51
    .line 52
    div-float/2addr v0, v1

    .line 53
    mul-float/2addr p3, v0

    .line 54
    mul-float/2addr p3, v2

    .line 55
    float-to-int p3, p3

    .line 56
    iget-object v0, p0, LD0/h;->E:Landroid/graphics/Paint;

    .line 57
    .line 58
    invoke-virtual {v0, p3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, LD0/h;->I:Ly0/a;

    .line 62
    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    iget-object v1, p0, LD0/h;->E:Landroid/graphics/Paint;

    .line 66
    .line 67
    invoke-virtual {v0}, Ly0/a;->h()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Landroid/graphics/ColorFilter;

    .line 72
    .line 73
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 74
    .line 75
    .line 76
    :cond_2
    if-lez p3, :cond_3

    .line 77
    .line 78
    iget-object p3, p0, LD0/h;->F:[F

    .line 79
    .line 80
    const/4 v0, 0x0

    .line 81
    const/4 v1, 0x0

    .line 82
    aput v1, p3, v0

    .line 83
    .line 84
    const/4 v2, 0x1

    .line 85
    aput v1, p3, v2

    .line 86
    .line 87
    iget-object v3, p0, LD0/h;->H:LD0/e;

    .line 88
    .line 89
    invoke-virtual {v3}, LD0/e;->q()I

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    int-to-float v3, v3

    .line 94
    const/4 v4, 0x2

    .line 95
    aput v3, p3, v4

    .line 96
    .line 97
    iget-object p3, p0, LD0/h;->F:[F

    .line 98
    .line 99
    const/4 v3, 0x3

    .line 100
    aput v1, p3, v3

    .line 101
    .line 102
    iget-object v5, p0, LD0/h;->H:LD0/e;

    .line 103
    .line 104
    invoke-virtual {v5}, LD0/e;->q()I

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    int-to-float v5, v5

    .line 109
    const/4 v6, 0x4

    .line 110
    aput v5, p3, v6

    .line 111
    .line 112
    iget-object p3, p0, LD0/h;->F:[F

    .line 113
    .line 114
    iget-object v5, p0, LD0/h;->H:LD0/e;

    .line 115
    .line 116
    invoke-virtual {v5}, LD0/e;->p()I

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    int-to-float v5, v5

    .line 121
    const/4 v7, 0x5

    .line 122
    aput v5, p3, v7

    .line 123
    .line 124
    iget-object p3, p0, LD0/h;->F:[F

    .line 125
    .line 126
    const/4 v5, 0x6

    .line 127
    aput v1, p3, v5

    .line 128
    .line 129
    iget-object v1, p0, LD0/h;->H:LD0/e;

    .line 130
    .line 131
    invoke-virtual {v1}, LD0/e;->p()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    int-to-float v1, v1

    .line 136
    const/4 v8, 0x7

    .line 137
    aput v1, p3, v8

    .line 138
    .line 139
    iget-object p3, p0, LD0/h;->F:[F

    .line 140
    .line 141
    invoke-virtual {p2, p3}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 142
    .line 143
    .line 144
    iget-object p2, p0, LD0/h;->G:Landroid/graphics/Path;

    .line 145
    .line 146
    invoke-virtual {p2}, Landroid/graphics/Path;->reset()V

    .line 147
    .line 148
    .line 149
    iget-object p2, p0, LD0/h;->G:Landroid/graphics/Path;

    .line 150
    .line 151
    iget-object p3, p0, LD0/h;->F:[F

    .line 152
    .line 153
    aget v1, p3, v0

    .line 154
    .line 155
    aget p3, p3, v2

    .line 156
    .line 157
    invoke-virtual {p2, v1, p3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 158
    .line 159
    .line 160
    iget-object p2, p0, LD0/h;->G:Landroid/graphics/Path;

    .line 161
    .line 162
    iget-object p3, p0, LD0/h;->F:[F

    .line 163
    .line 164
    aget v1, p3, v4

    .line 165
    .line 166
    aget p3, p3, v3

    .line 167
    .line 168
    invoke-virtual {p2, v1, p3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 169
    .line 170
    .line 171
    iget-object p2, p0, LD0/h;->G:Landroid/graphics/Path;

    .line 172
    .line 173
    iget-object p3, p0, LD0/h;->F:[F

    .line 174
    .line 175
    aget v1, p3, v6

    .line 176
    .line 177
    aget p3, p3, v7

    .line 178
    .line 179
    invoke-virtual {p2, v1, p3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 180
    .line 181
    .line 182
    iget-object p2, p0, LD0/h;->G:Landroid/graphics/Path;

    .line 183
    .line 184
    iget-object p3, p0, LD0/h;->F:[F

    .line 185
    .line 186
    aget v1, p3, v5

    .line 187
    .line 188
    aget p3, p3, v8

    .line 189
    .line 190
    invoke-virtual {p2, v1, p3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 191
    .line 192
    .line 193
    iget-object p2, p0, LD0/h;->G:Landroid/graphics/Path;

    .line 194
    .line 195
    iget-object p3, p0, LD0/h;->F:[F

    .line 196
    .line 197
    aget v0, p3, v0

    .line 198
    .line 199
    aget p3, p3, v2

    .line 200
    .line 201
    invoke-virtual {p2, v0, p3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 202
    .line 203
    .line 204
    iget-object p2, p0, LD0/h;->G:Landroid/graphics/Path;

    .line 205
    .line 206
    invoke-virtual {p2}, Landroid/graphics/Path;->close()V

    .line 207
    .line 208
    .line 209
    iget-object p2, p0, LD0/h;->G:Landroid/graphics/Path;

    .line 210
    .line 211
    iget-object p0, p0, LD0/h;->E:Landroid/graphics/Paint;

    .line 212
    .line 213
    invoke-virtual {p1, p2, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 214
    .line 215
    .line 216
    :cond_3
    :goto_1
    return-void
.end method
