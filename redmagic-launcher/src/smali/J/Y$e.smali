.class LJ/Y$e;
.super LJ/Y$j;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LJ/Y;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "e"
.end annotation


# instance fields
.field final c:Landroid/view/WindowInsets;

.field private d:[LB/b;

.field private e:LB/b;

.field private f:LJ/Y;

.field g:LB/b;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method constructor <init>(LJ/Y;LJ/Y$e;)V
    .locals 1

    .line 4
    new-instance v0, Landroid/view/WindowInsets;

    iget-object p2, p2, LJ/Y$e;->c:Landroid/view/WindowInsets;

    invoke-direct {v0, p2}, Landroid/view/WindowInsets;-><init>(Landroid/view/WindowInsets;)V

    invoke-direct {p0, p1, v0}, LJ/Y$e;-><init>(LJ/Y;Landroid/view/WindowInsets;)V

    return-void
.end method

.method constructor <init>(LJ/Y;Landroid/view/WindowInsets;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LJ/Y$j;-><init>(LJ/Y;)V

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, LJ/Y$e;->e:LB/b;

    .line 3
    iput-object p2, p0, LJ/Y$e;->c:Landroid/view/WindowInsets;

    return-void
.end method

.method private t(IZ)LB/b;
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    sget-object v0, LB/b;->e:LB/b;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    :goto_0
    const/16 v2, 0x100

    .line 5
    .line 6
    if-gt v1, v2, :cond_1

    .line 7
    .line 8
    and-int v2, p1, v1

    .line 9
    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    invoke-virtual {p0, v1, p2}, LJ/Y$e;->u(IZ)LB/b;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-static {v0, v2}, LB/b;->a(LB/b;LB/b;)LB/b;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :goto_1
    shl-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    return-object v0
.end method

.method private v()LB/b;
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Y$e;->f:LJ/Y;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, LJ/Y;->g()LB/b;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, LB/b;->e:LB/b;

    .line 11
    .line 12
    return-object p0
.end method

.method private w(Landroid/view/View;)LB/b;
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string p1, "getVisibleInsets() should not be called on API >= 30. Use WindowInsets.isVisible() instead."

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method


# virtual methods
.method d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LJ/Y$e;->w(Landroid/view/View;)LB/b;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    sget-object p1, LB/b;->e:LB/b;

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0, p1}, LJ/Y$e;->r(LB/b;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method e(LJ/Y;)V
    .locals 1

    .line 1
    iget-object v0, p0, LJ/Y$e;->f:LJ/Y;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, LJ/Y;->t(LJ/Y;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LJ/Y$e;->g:LB/b;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, LJ/Y;->s(LB/b;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    invoke-super {p0, p1}, LJ/Y$j;->equals(Ljava/lang/Object;)Z

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
    return p0

    .line 9
    :cond_0
    check-cast p1, LJ/Y$e;

    .line 10
    .line 11
    iget-object p0, p0, LJ/Y$e;->g:LB/b;

    .line 12
    .line 13
    iget-object p1, p1, LJ/Y$e;->g:LB/b;

    .line 14
    .line 15
    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public g(I)LB/b;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, LJ/Y$e;->t(IZ)LB/b;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method final k()LB/b;
    .locals 4

    .line 1
    iget-object v0, p0, LJ/Y$e;->e:LB/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LJ/Y$e;->c:Landroid/view/WindowInsets;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetLeft()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, LJ/Y$e;->c:Landroid/view/WindowInsets;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget-object v2, p0, LJ/Y$e;->c:Landroid/view/WindowInsets;

    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetRight()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    iget-object v3, p0, LJ/Y$e;->c:Landroid/view/WindowInsets;

    .line 24
    .line 25
    invoke-virtual {v3}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    invoke-static {v0, v1, v2, v3}, LB/b;->b(IIII)LB/b;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, LJ/Y$e;->e:LB/b;

    .line 34
    .line 35
    :cond_0
    iget-object p0, p0, LJ/Y$e;->e:LB/b;

    .line 36
    .line 37
    return-object p0
.end method

.method m(IIII)LJ/Y;
    .locals 2

    .line 1
    new-instance v0, LJ/Y$a;

    .line 2
    .line 3
    iget-object v1, p0, LJ/Y$e;->c:Landroid/view/WindowInsets;

    .line 4
    .line 5
    invoke-static {v1}, LJ/Y;->v(Landroid/view/WindowInsets;)LJ/Y;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, LJ/Y$a;-><init>(LJ/Y;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, LJ/Y$e;->k()LB/b;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v1, p1, p2, p3, p4}, LJ/Y;->n(LB/b;IIII)LB/b;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, LJ/Y$a;->c(LB/b;)LJ/Y$a;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, LJ/Y$j;->i()LB/b;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0, p1, p2, p3, p4}, LJ/Y;->n(LB/b;IIII)LB/b;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, LJ/Y$a;->b(LB/b;)LJ/Y$a;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, LJ/Y$a;->a()LJ/Y;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method o()Z
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Y$e;->c:Landroid/view/WindowInsets;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/WindowInsets;->isRound()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method p(I)Z
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    move v1, v0

    .line 3
    :goto_0
    const/16 v2, 0x100

    .line 4
    .line 5
    if-gt v1, v2, :cond_2

    .line 6
    .line 7
    and-int v2, p1, v1

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-virtual {p0, v1}, LJ/Y$e;->x(I)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-nez v2, :cond_1

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_1
    shl-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_2
    return v0
.end method

.method public q([LB/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, LJ/Y$e;->d:[LB/b;

    .line 2
    .line 3
    return-void
.end method

.method r(LB/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, LJ/Y$e;->g:LB/b;

    .line 2
    .line 3
    return-void
.end method

.method s(LJ/Y;)V
    .locals 0

    .line 1
    iput-object p1, p0, LJ/Y$e;->f:LJ/Y;

    .line 2
    .line 3
    return-void
.end method

.method protected u(IZ)LB/b;
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eq p1, v0, :cond_f

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eq p1, v0, :cond_b

    .line 8
    .line 9
    const/16 p2, 0x8

    .line 10
    .line 11
    if-eq p1, p2, :cond_6

    .line 12
    .line 13
    const/16 p2, 0x10

    .line 14
    .line 15
    if-eq p1, p2, :cond_5

    .line 16
    .line 17
    const/16 p2, 0x20

    .line 18
    .line 19
    if-eq p1, p2, :cond_4

    .line 20
    .line 21
    const/16 p2, 0x40

    .line 22
    .line 23
    if-eq p1, p2, :cond_3

    .line 24
    .line 25
    const/16 p2, 0x80

    .line 26
    .line 27
    if-eq p1, p2, :cond_0

    .line 28
    .line 29
    sget-object p0, LB/b;->e:LB/b;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_0
    iget-object p1, p0, LJ/Y$e;->f:LJ/Y;

    .line 33
    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    invoke-virtual {p1}, LJ/Y;->e()LJ/g;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-virtual {p0}, LJ/Y$j;->f()LJ/g;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    :goto_0
    if-eqz p0, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0}, LJ/g;->b()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-virtual {p0}, LJ/g;->d()I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    invoke-virtual {p0}, LJ/g;->c()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    invoke-virtual {p0}, LJ/g;->a()I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    invoke-static {p1, p2, v0, p0}, LB/b;->b(IIII)LB/b;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0

    .line 68
    :cond_2
    sget-object p0, LB/b;->e:LB/b;

    .line 69
    .line 70
    return-object p0

    .line 71
    :cond_3
    invoke-virtual {p0}, LJ/Y$j;->l()LB/b;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_4
    invoke-virtual {p0}, LJ/Y$j;->h()LB/b;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0

    .line 81
    :cond_5
    invoke-virtual {p0}, LJ/Y$j;->j()LB/b;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0

    .line 86
    :cond_6
    iget-object p1, p0, LJ/Y$e;->d:[LB/b;

    .line 87
    .line 88
    if-eqz p1, :cond_7

    .line 89
    .line 90
    invoke-static {p2}, LJ/Y$k;->d(I)I

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    aget-object v2, p1, p2

    .line 95
    .line 96
    :cond_7
    if-eqz v2, :cond_8

    .line 97
    .line 98
    return-object v2

    .line 99
    :cond_8
    invoke-virtual {p0}, LJ/Y$e;->k()LB/b;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-direct {p0}, LJ/Y$e;->v()LB/b;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    iget p1, p1, LB/b;->d:I

    .line 108
    .line 109
    iget v0, p2, LB/b;->d:I

    .line 110
    .line 111
    if-le p1, v0, :cond_9

    .line 112
    .line 113
    invoke-static {v1, v1, v1, p1}, LB/b;->b(IIII)LB/b;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    return-object p0

    .line 118
    :cond_9
    iget-object p1, p0, LJ/Y$e;->g:LB/b;

    .line 119
    .line 120
    if-eqz p1, :cond_a

    .line 121
    .line 122
    sget-object v0, LB/b;->e:LB/b;

    .line 123
    .line 124
    invoke-virtual {p1, v0}, LB/b;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    if-nez p1, :cond_a

    .line 129
    .line 130
    iget-object p0, p0, LJ/Y$e;->g:LB/b;

    .line 131
    .line 132
    iget p0, p0, LB/b;->d:I

    .line 133
    .line 134
    iget p1, p2, LB/b;->d:I

    .line 135
    .line 136
    if-le p0, p1, :cond_a

    .line 137
    .line 138
    invoke-static {v1, v1, v1, p0}, LB/b;->b(IIII)LB/b;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    return-object p0

    .line 143
    :cond_a
    sget-object p0, LB/b;->e:LB/b;

    .line 144
    .line 145
    return-object p0

    .line 146
    :cond_b
    if-eqz p2, :cond_c

    .line 147
    .line 148
    invoke-direct {p0}, LJ/Y$e;->v()LB/b;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p0}, LJ/Y$j;->i()LB/b;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    iget p2, p1, LB/b;->a:I

    .line 157
    .line 158
    iget v0, p0, LB/b;->a:I

    .line 159
    .line 160
    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    .line 161
    .line 162
    .line 163
    move-result p2

    .line 164
    iget v0, p1, LB/b;->c:I

    .line 165
    .line 166
    iget v2, p0, LB/b;->c:I

    .line 167
    .line 168
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    iget p1, p1, LB/b;->d:I

    .line 173
    .line 174
    iget p0, p0, LB/b;->d:I

    .line 175
    .line 176
    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    .line 177
    .line 178
    .line 179
    move-result p0

    .line 180
    invoke-static {p2, v1, v0, p0}, LB/b;->b(IIII)LB/b;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    return-object p0

    .line 185
    :cond_c
    invoke-virtual {p0}, LJ/Y$e;->k()LB/b;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    iget-object p0, p0, LJ/Y$e;->f:LJ/Y;

    .line 190
    .line 191
    if-eqz p0, :cond_d

    .line 192
    .line 193
    invoke-virtual {p0}, LJ/Y;->g()LB/b;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    :cond_d
    iget p0, p1, LB/b;->d:I

    .line 198
    .line 199
    if-eqz v2, :cond_e

    .line 200
    .line 201
    iget p2, v2, LB/b;->d:I

    .line 202
    .line 203
    invoke-static {p0, p2}, Ljava/lang/Math;->min(II)I

    .line 204
    .line 205
    .line 206
    move-result p0

    .line 207
    :cond_e
    iget p2, p1, LB/b;->a:I

    .line 208
    .line 209
    iget p1, p1, LB/b;->c:I

    .line 210
    .line 211
    invoke-static {p2, v1, p1, p0}, LB/b;->b(IIII)LB/b;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    return-object p0

    .line 216
    :cond_f
    if-eqz p2, :cond_10

    .line 217
    .line 218
    invoke-direct {p0}, LJ/Y$e;->v()LB/b;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    iget p1, p1, LB/b;->b:I

    .line 223
    .line 224
    invoke-virtual {p0}, LJ/Y$e;->k()LB/b;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    iget p0, p0, LB/b;->b:I

    .line 229
    .line 230
    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    .line 231
    .line 232
    .line 233
    move-result p0

    .line 234
    invoke-static {v1, p0, v1, v1}, LB/b;->b(IIII)LB/b;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    return-object p0

    .line 239
    :cond_10
    invoke-virtual {p0}, LJ/Y$e;->k()LB/b;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    iget p0, p0, LB/b;->b:I

    .line 244
    .line 245
    invoke-static {v1, p0, v1, v1}, LB/b;->b(IIII)LB/b;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    return-object p0
.end method

.method protected x(I)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eq p1, v1, :cond_1

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-eq p1, v2, :cond_1

    .line 7
    .line 8
    const/4 v2, 0x4

    .line 9
    if-eq p1, v2, :cond_0

    .line 10
    .line 11
    const/16 v2, 0x8

    .line 12
    .line 13
    if-eq p1, v2, :cond_1

    .line 14
    .line 15
    const/16 v2, 0x80

    .line 16
    .line 17
    if-eq p1, v2, :cond_1

    .line 18
    .line 19
    return v1

    .line 20
    :cond_0
    return v0

    .line 21
    :cond_1
    invoke-virtual {p0, p1, v0}, LJ/Y$e;->u(IZ)LB/b;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object p1, LB/b;->e:LB/b;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, LB/b;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    xor-int/2addr p0, v1

    .line 32
    return p0
.end method
