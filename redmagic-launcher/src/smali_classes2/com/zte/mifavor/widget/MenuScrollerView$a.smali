.class Lcom/zte/mifavor/widget/MenuScrollerView$a;
.super LW2/d;
.source "MenuScrollerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/MenuScrollerView;->k(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/view/View;

.field final synthetic b:Lcom/zte/mifavor/widget/MenuScrollerView;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/MenuScrollerView;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a;->b:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a;->a:Landroid/view/View;

    .line 4
    .line 5
    invoke-direct {p0}, LW2/d;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(LW2/e;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(LW2/e;)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    iget-object v3, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a;->b:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 10
    .line 11
    new-instance v4, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v5, "["

    .line 17
    .line 18
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    add-int/lit8 v5, v5, -0x4

    .line 26
    .line 27
    invoke-virtual {v2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v2, "] "

    .line 35
    .line 36
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-static {v3, v2}, Lcom/zte/mifavor/widget/MenuScrollerView;->h(Lcom/zte/mifavor/widget/MenuScrollerView;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    invoke-virtual {p1}, LW2/e;->e()D

    .line 47
    .line 48
    .line 49
    move-result-wide v2

    .line 50
    double-to-float p1, v2

    .line 51
    iget-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a;->a:Landroid/view/View;

    .line 52
    .line 53
    invoke-virtual {v2, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 54
    .line 55
    .line 56
    iget-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a;->b:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 57
    .line 58
    invoke-static {v2}, Lcom/zte/mifavor/widget/MenuScrollerView;->a(Lcom/zte/mifavor/widget/MenuScrollerView;)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_2

    .line 63
    .line 64
    iget-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a;->b:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 65
    .line 66
    invoke-static {v2}, Lcom/zte/mifavor/widget/MenuScrollerView;->b(Lcom/zte/mifavor/widget/MenuScrollerView;)Lcom/zte/mifavor/widget/q;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    if-eqz v2, :cond_2

    .line 71
    .line 72
    iget-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a;->b:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 73
    .line 74
    iget-object v3, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a;->a:Landroid/view/View;

    .line 75
    .line 76
    invoke-static {v2, v3}, Lcom/zte/mifavor/widget/MenuScrollerView;->i(Lcom/zte/mifavor/widget/MenuScrollerView;Landroid/view/View;)Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-eqz v2, :cond_2

    .line 81
    .line 82
    new-instance v2, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 85
    .line 86
    .line 87
    const-string v3, "do Edge Animation touch edge, rebound item("

    .line 88
    .line 89
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    iget-object v3, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a;->b:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 93
    .line 94
    invoke-static {v3}, Lcom/zte/mifavor/widget/MenuScrollerView;->c(Lcom/zte/mifavor/widget/MenuScrollerView;)Ljava/util/List;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    iget-object v4, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a;->a:Landroid/view/View;

    .line 99
    .line 100
    invoke-interface {v3, v4}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string v3, ").value="

    .line 108
    .line 109
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    const-string v2, "Scroll#MenuScrollerView"

    .line 120
    .line 121
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a;->b:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 125
    .line 126
    invoke-static {p1}, Lcom/zte/mifavor/widget/MenuScrollerView;->b(Lcom/zte/mifavor/widget/MenuScrollerView;)Lcom/zte/mifavor/widget/q;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    iput-boolean v1, p1, Lcom/zte/mifavor/widget/q;->a:Z

    .line 131
    .line 132
    iget-object p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a;->b:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 133
    .line 134
    invoke-static {p1}, Lcom/zte/mifavor/widget/MenuScrollerView;->b(Lcom/zte/mifavor/widget/MenuScrollerView;)Lcom/zte/mifavor/widget/q;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/q;->h()LW2/e;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    if-eqz p1, :cond_1

    .line 143
    .line 144
    iget-object p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a;->b:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 145
    .line 146
    invoke-static {p1}, Lcom/zte/mifavor/widget/MenuScrollerView;->b(Lcom/zte/mifavor/widget/MenuScrollerView;)Lcom/zte/mifavor/widget/q;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/q;->h()LW2/e;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-virtual {p1}, LW2/e;->e()D

    .line 155
    .line 156
    .line 157
    move-result-wide v3

    .line 158
    new-instance p1, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .line 162
    .line 163
    iget-object v5, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a;->b:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 164
    .line 165
    invoke-static {v5}, Lcom/zte/mifavor/widget/MenuScrollerView;->d(Lcom/zte/mifavor/widget/MenuScrollerView;)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    const-string v5, "onSpringUpdate. set End Value 0. currentValue = "

    .line 173
    .line 174
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    .line 186
    .line 187
    double-to-float p1, v3

    .line 188
    const/4 v5, 0x2

    .line 189
    new-array v5, v5, [F

    .line 190
    .line 191
    aput p1, v5, v0

    .line 192
    .line 193
    const/4 p1, 0x0

    .line 194
    aput p1, v5, v1

    .line 195
    .line 196
    invoke-static {v5}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    if-eqz p1, :cond_1

    .line 201
    .line 202
    const-wide/16 v5, 0x32

    .line 203
    .line 204
    invoke-virtual {p1, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 205
    .line 206
    .line 207
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 208
    .line 209
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 213
    .line 214
    .line 215
    new-instance v1, Lcom/zte/mifavor/widget/MenuScrollerView$a$a;

    .line 216
    .line 217
    invoke-direct {v1, p0}, Lcom/zte/mifavor/widget/MenuScrollerView$a$a;-><init>(Lcom/zte/mifavor/widget/MenuScrollerView$a;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 221
    .line 222
    .line 223
    new-instance v1, Ljava/lang/StringBuilder;

    .line 224
    .line 225
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 226
    .line 227
    .line 228
    const-string v5, "+++++++++++ Start valueAnimator. from = "

    .line 229
    .line 230
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    const-string v3, ", to = "

    .line 237
    .line 238
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    .line 250
    .line 251
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 252
    .line 253
    .line 254
    :cond_1
    iget-object p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a;->b:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 255
    .line 256
    invoke-static {p1, v0}, Lcom/zte/mifavor/widget/MenuScrollerView;->g(Lcom/zte/mifavor/widget/MenuScrollerView;Z)V

    .line 257
    .line 258
    .line 259
    iget-object p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a;->b:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 260
    .line 261
    invoke-static {p1, v0}, Lcom/zte/mifavor/widget/MenuScrollerView;->f(Lcom/zte/mifavor/widget/MenuScrollerView;Z)V

    .line 262
    .line 263
    .line 264
    iget-object p0, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a;->b:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 265
    .line 266
    invoke-static {p0, v0}, Lcom/zte/mifavor/widget/MenuScrollerView;->e(Lcom/zte/mifavor/widget/MenuScrollerView;Z)V

    .line 267
    .line 268
    .line 269
    :cond_2
    return-void
.end method

.method public c(LW2/e;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(LW2/e;)V
    .locals 0

    .line 1
    return-void
.end method
