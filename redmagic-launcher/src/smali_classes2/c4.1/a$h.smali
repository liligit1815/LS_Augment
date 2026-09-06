.class public Lc4/a$h;
.super Ljava/lang/Object;
.source "BaseOverScrollBounceEffectDecorator.java"

# interfaces
.implements Lc4/a$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc4/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "h"
.end annotation


# instance fields
.field final a:Lc4/a$c;

.field b:I

.field final synthetic c:Lc4/a;


# direct methods
.method public constructor <init>(Lc4/a;FF)V
    .locals 1

    .line 1
    iput-object p1, p0, Lc4/a$h;->c:Lc4/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lc4/a;->r()Lc4/a$c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lc4/a$h;->a:Lc4/a$c;

    .line 11
    .line 12
    invoke-static {p1, p2}, Lc4/a;->j(Lc4/a;F)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, p3}, Lc4/a;->i(Lc4/a;F)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lc4/a$h;->c:Lc4/a;

    .line 2
    .line 3
    iget-object p1, p0, Lc4/a;->m:Lc4/a$d;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lc4/a;->z(Lc4/a$e;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public b(Lc4/a$e;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lc4/a$h;->c:Lc4/a;

    .line 2
    .line 3
    iget-object v1, v0, Lc4/a;->i:Lc4/a$g;

    .line 4
    .line 5
    iget-boolean v1, v1, Lc4/a$g;->c:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v1, 0x2

    .line 12
    :goto_0
    iput v1, p0, Lc4/a$h;->b:I

    .line 13
    .line 14
    iget-object v1, v0, Lc4/a;->o:Lc4/d;

    .line 15
    .line 16
    invoke-interface {p1}, Lc4/a$e;->c()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-virtual {p0}, Lc4/a$h;->c()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-interface {v1, v0, p1, p0}, Lc4/d;->a(Lc4/c;II)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Lc4/a$h;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public d(Landroid/view/MotionEvent;)Z
    .locals 9

    .line 1
    iget-object v0, p0, Lc4/a$h;->c:Lc4/a;

    .line 2
    .line 3
    iget-object v0, v0, Lc4/a;->j:Ld4/c;

    .line 4
    .line 5
    invoke-interface {v0}, Ld4/c;->c()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v2, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object v2, p0, Lc4/a$h;->c:Lc4/a;

    .line 27
    .line 28
    iget-object v2, v2, Lc4/a;->i:Lc4/a$g;

    .line 29
    .line 30
    iget v2, v2, Lc4/a$g;->a:I

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-eq v2, v4, :cond_2

    .line 38
    .line 39
    iget-object p0, p0, Lc4/a$h;->c:Lc4/a;

    .line 40
    .line 41
    iget-object p1, p0, Lc4/a;->m:Lc4/a$d;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lc4/a;->z(Lc4/a$e;)V

    .line 44
    .line 45
    .line 46
    return v1

    .line 47
    :cond_2
    iget-object v2, p0, Lc4/a$h;->a:Lc4/a$c;

    .line 48
    .line 49
    invoke-virtual {v2, v0, p1}, Lc4/a$c;->a(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-nez v2, :cond_3

    .line 54
    .line 55
    return v1

    .line 56
    :cond_3
    iget-object v2, p0, Lc4/a$h;->c:Lc4/a;

    .line 57
    .line 58
    invoke-static {v2}, Lc4/a;->a(Lc4/a;)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_4

    .line 63
    .line 64
    iget-object p0, p0, Lc4/a$h;->c:Lc4/a;

    .line 65
    .line 66
    invoke-static {p0, v3}, Lc4/a;->g(Lc4/a;Z)V

    .line 67
    .line 68
    .line 69
    return v3

    .line 70
    :cond_4
    iget-object v2, p0, Lc4/a$h;->a:Lc4/a$c;

    .line 71
    .line 72
    iget v4, v2, Lc4/a$c;->b:F

    .line 73
    .line 74
    iget-boolean v2, v2, Lc4/a$c;->c:Z

    .line 75
    .line 76
    iget-object v5, p0, Lc4/a$h;->c:Lc4/a;

    .line 77
    .line 78
    iget-object v6, v5, Lc4/a;->i:Lc4/a$g;

    .line 79
    .line 80
    iget-boolean v6, v6, Lc4/a$g;->c:Z

    .line 81
    .line 82
    if-ne v2, v6, :cond_5

    .line 83
    .line 84
    invoke-static {v5}, Lc4/a;->e(Lc4/a;)F

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    goto :goto_0

    .line 89
    :cond_5
    invoke-static {v5}, Lc4/a;->d(Lc4/a;)F

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    :goto_0
    div-float/2addr v4, v2

    .line 94
    iget-object v2, p0, Lc4/a$h;->a:Lc4/a$c;

    .line 95
    .line 96
    iget v2, v2, Lc4/a$c;->a:F

    .line 97
    .line 98
    add-float/2addr v2, v4

    .line 99
    iget-object v4, p0, Lc4/a$h;->c:Lc4/a;

    .line 100
    .line 101
    invoke-static {v4, v0}, Lc4/a;->k(Lc4/a;Landroid/view/View;)I

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    if-eqz v4, :cond_e

    .line 106
    .line 107
    iget-object v5, p0, Lc4/a$h;->a:Lc4/a$c;

    .line 108
    .line 109
    iget-boolean v5, v5, Lc4/a$c;->c:Z

    .line 110
    .line 111
    if-eqz v5, :cond_6

    .line 112
    .line 113
    iget-object v6, p0, Lc4/a$h;->c:Lc4/a;

    .line 114
    .line 115
    iget-object v6, v6, Lc4/a;->i:Lc4/a$g;

    .line 116
    .line 117
    iget v6, v6, Lc4/a$g;->b:F

    .line 118
    .line 119
    cmpl-float v6, v2, v6

    .line 120
    .line 121
    if-ltz v6, :cond_6

    .line 122
    .line 123
    const/4 v6, -0x1

    .line 124
    if-eq v6, v4, :cond_e

    .line 125
    .line 126
    :cond_6
    if-nez v5, :cond_7

    .line 127
    .line 128
    iget-object v6, p0, Lc4/a$h;->c:Lc4/a;

    .line 129
    .line 130
    iget-object v6, v6, Lc4/a;->i:Lc4/a$g;

    .line 131
    .line 132
    iget v6, v6, Lc4/a$g;->b:F

    .line 133
    .line 134
    cmpg-float v6, v2, v6

    .line 135
    .line 136
    if-gtz v6, :cond_7

    .line 137
    .line 138
    const/4 v6, -0x2

    .line 139
    if-ne v6, v4, :cond_7

    .line 140
    .line 141
    goto/16 :goto_1

    .line 142
    .line 143
    :cond_7
    iget-object v4, p0, Lc4/a$h;->c:Lc4/a;

    .line 144
    .line 145
    iget-object v6, v4, Lc4/a;->i:Lc4/a$g;

    .line 146
    .line 147
    iget-boolean v7, v6, Lc4/a$g;->c:Z

    .line 148
    .line 149
    if-eqz v7, :cond_8

    .line 150
    .line 151
    if-nez v5, :cond_8

    .line 152
    .line 153
    iget v8, v6, Lc4/a$g;->b:F

    .line 154
    .line 155
    cmpg-float v8, v2, v8

    .line 156
    .line 157
    if-lez v8, :cond_9

    .line 158
    .line 159
    :cond_8
    if-nez v7, :cond_a

    .line 160
    .line 161
    if-eqz v5, :cond_a

    .line 162
    .line 163
    iget v5, v6, Lc4/a$g;->b:F

    .line 164
    .line 165
    cmpl-float v5, v2, v5

    .line 166
    .line 167
    if-ltz v5, :cond_a

    .line 168
    .line 169
    :cond_9
    iget v2, v6, Lc4/a$g;->b:F

    .line 170
    .line 171
    invoke-virtual {v4, v0, v2, p1}, Lc4/a;->D(Landroid/view/View;FLandroid/view/MotionEvent;)V

    .line 172
    .line 173
    .line 174
    iget-object p1, p0, Lc4/a$h;->c:Lc4/a;

    .line 175
    .line 176
    iget-object v0, p1, Lc4/a;->p:Lc4/e;

    .line 177
    .line 178
    iget v2, p0, Lc4/a$h;->b:I

    .line 179
    .line 180
    const/4 v3, 0x0

    .line 181
    invoke-interface {v0, p1, v2, v3}, Lc4/e;->a(Lc4/c;IF)V

    .line 182
    .line 183
    .line 184
    iget-object p0, p0, Lc4/a$h;->c:Lc4/a;

    .line 185
    .line 186
    iget-object p1, p0, Lc4/a;->k:Lc4/a$f;

    .line 187
    .line 188
    invoke-virtual {p0, p1}, Lc4/a;->z(Lc4/a$e;)V

    .line 189
    .line 190
    .line 191
    return v1

    .line 192
    :cond_a
    invoke-static {v4}, Lc4/a;->c(Lc4/a;)Landroidx/dynamicanimation/animation/j;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    if-eqz p1, :cond_b

    .line 197
    .line 198
    iget-object p1, p0, Lc4/a$h;->c:Lc4/a;

    .line 199
    .line 200
    invoke-static {p1}, Lc4/a;->c(Lc4/a;)Landroidx/dynamicanimation/animation/j;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    invoke-virtual {p1}, Landroidx/dynamicanimation/animation/e;->h()Z

    .line 205
    .line 206
    .line 207
    move-result p1

    .line 208
    if-eqz p1, :cond_b

    .line 209
    .line 210
    iget-object p1, p0, Lc4/a$h;->c:Lc4/a;

    .line 211
    .line 212
    invoke-static {p1}, Lc4/a;->c(Lc4/a;)Landroidx/dynamicanimation/animation/j;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-virtual {p1}, Landroidx/dynamicanimation/animation/j;->c()V

    .line 217
    .line 218
    .line 219
    :cond_b
    iget-object p1, p0, Lc4/a$h;->c:Lc4/a;

    .line 220
    .line 221
    invoke-static {p1, v0}, Lc4/a;->l(Lc4/a;Landroid/view/View;)Z

    .line 222
    .line 223
    .line 224
    move-result p1

    .line 225
    iget-object v4, p0, Lc4/a$h;->c:Lc4/a;

    .line 226
    .line 227
    invoke-static {v4, v0}, Lc4/a;->o(Lc4/a;Landroid/view/View;)Z

    .line 228
    .line 229
    .line 230
    move-result v4

    .line 231
    iget-object v5, p0, Lc4/a$h;->c:Lc4/a;

    .line 232
    .line 233
    invoke-static {v5, v0}, Lc4/a;->m(Lc4/a;Landroid/view/View;)Z

    .line 234
    .line 235
    .line 236
    move-result v5

    .line 237
    iget-object v6, p0, Lc4/a$h;->c:Lc4/a;

    .line 238
    .line 239
    invoke-static {v6, v0}, Lc4/a;->n(Lc4/a;Landroid/view/View;)Z

    .line 240
    .line 241
    .line 242
    move-result v6

    .line 243
    if-nez v6, :cond_d

    .line 244
    .line 245
    if-eqz v4, :cond_d

    .line 246
    .line 247
    if-nez v5, :cond_d

    .line 248
    .line 249
    iget-object v4, p0, Lc4/a$h;->c:Lc4/a;

    .line 250
    .line 251
    iget-object v4, v4, Lc4/a;->i:Lc4/a$g;

    .line 252
    .line 253
    iget v4, v4, Lc4/a$g;->b:F

    .line 254
    .line 255
    cmpl-float v4, v2, v4

    .line 256
    .line 257
    if-gez v4, :cond_c

    .line 258
    .line 259
    if-nez p1, :cond_d

    .line 260
    .line 261
    :cond_c
    return v3

    .line 262
    :cond_d
    iget-object p1, p0, Lc4/a$h;->c:Lc4/a;

    .line 263
    .line 264
    invoke-virtual {p1, v0, v2}, Lc4/a;->C(Landroid/view/View;F)V

    .line 265
    .line 266
    .line 267
    iget-object p1, p0, Lc4/a$h;->c:Lc4/a;

    .line 268
    .line 269
    iget-object v0, p1, Lc4/a;->p:Lc4/e;

    .line 270
    .line 271
    iget v4, p0, Lc4/a$h;->b:I

    .line 272
    .line 273
    invoke-interface {v0, p1, v4, v2}, Lc4/e;->a(Lc4/c;IF)V

    .line 274
    .line 275
    .line 276
    iget-object p1, p0, Lc4/a$h;->c:Lc4/a;

    .line 277
    .line 278
    invoke-static {p1, v1}, Lc4/a;->h(Lc4/a;Z)V

    .line 279
    .line 280
    .line 281
    iget-object p0, p0, Lc4/a$h;->c:Lc4/a;

    .line 282
    .line 283
    invoke-static {p0, v3}, Lc4/a;->g(Lc4/a;Z)V

    .line 284
    .line 285
    .line 286
    return v1

    .line 287
    :cond_e
    :goto_1
    return v3
.end method
