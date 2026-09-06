.class public Lcom/android/launcher3/taskbar/bubbles/t;
.super LJ2/b$a;
.source "BubbleBarController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/bubbles/t$a;,
        Lcom/android/launcher3/taskbar/bubbles/t$b;
    }
.end annotation


# static fields
.field private static v:Z

.field private static final w:Ljava/util/concurrent/Executor;


# instance fields
.field private final g:Landroid/content/Context;

.field private final h:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

.field private final i:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "Lcom/android/launcher3/taskbar/bubbles/b;",
            ">;"
        }
    .end annotation
.end field

.field private final j:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "Lcom/android/launcher3/taskbar/bubbles/b;",
            ">;"
        }
    .end annotation
.end field

.field private final k:Lcom/android/quickstep/SystemUiProxy;

.field private l:Lcom/android/launcher3/taskbar/bubbles/u;

.field private m:Lcom/android/launcher3/taskbar/J3;

.field private n:Lcom/android/launcher3/taskbar/bubbles/g0;

.field private o:LX1/b;

.field private p:Ljava/util/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Optional<",
            "Lcom/android/launcher3/taskbar/bubbles/A0;",
            ">;"
        }
    .end annotation
.end field

.field private q:Lcom/android/launcher3/taskbar/bubbles/y0;

.field private r:Lcom/android/launcher3/taskbar/bubbles/n0;

.field private s:Lcom/android/launcher3/taskbar/bubbles/t$a;

.field private t:I

.field private u:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    invoke-static {}, LH2/c;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "persist.wm.debug.bubble_bar"

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    :cond_0
    const/4 v1, 0x1

    .line 17
    :cond_1
    sput-boolean v1, Lcom/android/launcher3/taskbar/bubbles/t;->v:Z

    .line 18
    .line 19
    new-instance v0, Lcom/android/launcher3/util/m0$a;

    .line 20
    .line 21
    const-string v1, "BubbleStateUpdates-"

    .line 22
    .line 23
    const/16 v2, 0xa

    .line 24
    .line 25
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/util/m0$a;-><init>(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sput-object v0, Lcom/android/launcher3/taskbar/bubbles/t;->w:Ljava/util/concurrent/Executor;

    .line 33
    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, LJ2/b$a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/util/ArrayMap;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 10
    .line 11
    new-instance v0, Landroid/util/ArrayMap;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->j:Landroid/util/ArrayMap;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->u:Z

    .line 20
    .line 21
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->g:Landroid/content/Context;

    .line 22
    .line 23
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/t;->h:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 24
    .line 25
    sget-object p2, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 26
    .line 27
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/android/quickstep/SystemUiProxy;

    .line 32
    .line 33
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->k:Lcom/android/quickstep/SystemUiProxy;

    .line 34
    .line 35
    return-void
.end method

.method public static synthetic A2(Lcom/android/launcher3/taskbar/bubbles/t;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t;->K2(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic B2(Lcom/android/launcher3/taskbar/bubbles/t;Lcom/android/launcher3/taskbar/J3;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t;->L2(Lcom/android/launcher3/taskbar/J3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private C2(Lcom/android/launcher3/taskbar/bubbles/b;ZZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/u;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1, p1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->B(Lcom/android/launcher3/taskbar/bubbles/u;ZZLcom/android/launcher3/taskbar/bubbles/b;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private D2(Lcom/android/launcher3/taskbar/bubbles/t$b;)V
    .locals 14

    .line 1
    iget-boolean v0, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->b:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->c:Z

    .line 8
    .line 9
    if-eqz v3, :cond_1

    .line 10
    .line 11
    :cond_0
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->D0()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    :cond_1
    move v0, v1

    .line 22
    goto :goto_0

    .line 23
    :cond_2
    move v0, v2

    .line 24
    :goto_0
    iget-boolean v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->b:Z

    .line 25
    .line 26
    if-eqz v3, :cond_3

    .line 27
    .line 28
    iget-boolean v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->c:Z

    .line 29
    .line 30
    if-eqz v3, :cond_3

    .line 31
    .line 32
    move v8, v1

    .line 33
    goto :goto_1

    .line 34
    :cond_3
    move v8, v2

    .line 35
    :goto_1
    iget-boolean v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->a:Z

    .line 36
    .line 37
    if-nez v3, :cond_5

    .line 38
    .line 39
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 40
    .line 41
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/bubbles/g0;->F0()Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-nez v3, :cond_5

    .line 46
    .line 47
    iget-boolean v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->u:Z

    .line 48
    .line 49
    if-eqz v3, :cond_4

    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_4
    move v9, v2

    .line 53
    goto :goto_3

    .line 54
    :cond_5
    :goto_2
    move v9, v1

    .line 55
    :goto_3
    iget-boolean v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->a:Z

    .line 56
    .line 57
    if-eqz v3, :cond_6

    .line 58
    .line 59
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->m:Lcom/android/launcher3/taskbar/J3;

    .line 60
    .line 61
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/J3;->b()Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_6

    .line 66
    .line 67
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 68
    .line 69
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/bubbles/g0;->l1()V

    .line 70
    .line 71
    .line 72
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 73
    .line 74
    invoke-virtual {v3}, Landroid/util/ArrayMap;->clear()V

    .line 75
    .line 76
    .line 77
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 78
    .line 79
    iget-boolean v4, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->l:Z

    .line 80
    .line 81
    invoke-virtual {v3, v4}, Lcom/android/launcher3/taskbar/bubbles/g0;->D1(Z)V

    .line 82
    .line 83
    .line 84
    :cond_6
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->n:Lcom/android/launcher3/taskbar/bubbles/b;

    .line 85
    .line 86
    if-eqz v3, :cond_7

    .line 87
    .line 88
    iget-object v4, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 89
    .line 90
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/bubbles/u;->a()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    iget-object v5, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->n:Lcom/android/launcher3/taskbar/bubbles/b;

    .line 95
    .line 96
    invoke-virtual {v4, v3, v5}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    :cond_7
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->e:Ljava/lang/String;

    .line 100
    .line 101
    const/4 v11, 0x0

    .line 102
    const-string v12, "BubbleBarController"

    .line 103
    .line 104
    if-eqz v3, :cond_a

    .line 105
    .line 106
    iget-object v4, p0, Lcom/android/launcher3/taskbar/bubbles/t;->l:Lcom/android/launcher3/taskbar/bubbles/u;

    .line 107
    .line 108
    if-eqz v4, :cond_8

    .line 109
    .line 110
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/bubbles/u;->a()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    if-nez v3, :cond_a

    .line 119
    .line 120
    :cond_8
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 121
    .line 122
    iget-object v4, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->e:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v3, v4}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    check-cast v3, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 129
    .line 130
    if-eqz v3, :cond_9

    .line 131
    .line 132
    move-object v7, v3

    .line 133
    goto :goto_4

    .line 134
    :cond_9
    new-instance v3, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 137
    .line 138
    .line 139
    const-string v4, "trying to select bubble that doesn\'t exist:"

    .line 140
    .line 141
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    iget-object v4, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->e:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    invoke-static {v12, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    .line 155
    .line 156
    :cond_a
    move-object v7, v11

    .line 157
    :goto_4
    invoke-static {}, LH2/c;->k()Z

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    if-eqz v3, :cond_b

    .line 162
    .line 163
    iget-boolean v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->m:Z

    .line 164
    .line 165
    if-eqz v3, :cond_b

    .line 166
    .line 167
    iget-boolean v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->l:Z

    .line 168
    .line 169
    if-nez v3, :cond_b

    .line 170
    .line 171
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->n:Lcom/android/launcher3/taskbar/bubbles/b;

    .line 172
    .line 173
    if-eqz v3, :cond_b

    .line 174
    .line 175
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->i:Ljava/util/List;

    .line 176
    .line 177
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 178
    .line 179
    .line 180
    move-result v3

    .line 181
    if-eqz v3, :cond_b

    .line 182
    .line 183
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 184
    .line 185
    invoke-virtual {v3}, Landroid/util/ArrayMap;->isEmpty()Z

    .line 186
    .line 187
    .line 188
    move-result v3

    .line 189
    if-nez v3, :cond_b

    .line 190
    .line 191
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 192
    .line 193
    iget-object v4, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->n:Lcom/android/launcher3/taskbar/bubbles/b;

    .line 194
    .line 195
    invoke-virtual {v3, v4, v7}, Lcom/android/launcher3/taskbar/bubbles/g0;->o1(Lcom/android/launcher3/taskbar/bubbles/b;Lcom/android/launcher3/taskbar/bubbles/b;)V

    .line 196
    .line 197
    .line 198
    goto/16 :goto_9

    .line 199
    .line 200
    :cond_b
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->n:Lcom/android/launcher3/taskbar/bubbles/b;

    .line 201
    .line 202
    const-string v4, "trying to remove bubble that doesn\'t exist: "

    .line 203
    .line 204
    if-eqz v3, :cond_e

    .line 205
    .line 206
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->i:Ljava/util/List;

    .line 207
    .line 208
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 209
    .line 210
    .line 211
    move-result v3

    .line 212
    if-ne v3, v1, :cond_e

    .line 213
    .line 214
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->i:Ljava/util/List;

    .line 215
    .line 216
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v3

    .line 220
    check-cast v3, LN2/B;

    .line 221
    .line 222
    iget-object v5, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 223
    .line 224
    invoke-virtual {v3}, LN2/B;->a()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v6

    .line 228
    invoke-virtual {v5, v6}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object v5

    .line 232
    move-object v6, v5

    .line 233
    check-cast v6, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 234
    .line 235
    iget-boolean v5, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->m:Z

    .line 236
    .line 237
    if-eqz v5, :cond_c

    .line 238
    .line 239
    iget-boolean v5, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->l:Z

    .line 240
    .line 241
    if-eqz v5, :cond_c

    .line 242
    .line 243
    move v10, v1

    .line 244
    goto :goto_5

    .line 245
    :cond_c
    move v10, v2

    .line 246
    :goto_5
    if-eqz v6, :cond_d

    .line 247
    .line 248
    iget-object v4, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 249
    .line 250
    iget-object v5, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->n:Lcom/android/launcher3/taskbar/bubbles/b;

    .line 251
    .line 252
    invoke-virtual/range {v4 .. v10}, Lcom/android/launcher3/taskbar/bubbles/g0;->C(Lcom/android/launcher3/taskbar/bubbles/b;Lcom/android/launcher3/taskbar/bubbles/b;Lcom/android/launcher3/taskbar/bubbles/b;ZZZ)V

    .line 253
    .line 254
    .line 255
    goto/16 :goto_9

    .line 256
    .line 257
    :cond_d
    iget-object v5, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 258
    .line 259
    iget-object v6, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->n:Lcom/android/launcher3/taskbar/bubbles/b;

    .line 260
    .line 261
    invoke-virtual {v5, v6, v8, v9, v7}, Lcom/android/launcher3/taskbar/bubbles/g0;->B(Lcom/android/launcher3/taskbar/bubbles/u;ZZLcom/android/launcher3/taskbar/bubbles/b;)V

    .line 262
    .line 263
    .line 264
    new-instance v5, Ljava/lang/StringBuilder;

    .line 265
    .line 266
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 267
    .line 268
    .line 269
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {v3}, LN2/B;->a()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v3

    .line 276
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v3

    .line 283
    invoke-static {v12, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    .line 285
    .line 286
    goto/16 :goto_9

    .line 287
    .line 288
    :cond_e
    invoke-static {}, LH2/c;->k()Z

    .line 289
    .line 290
    .line 291
    move-result v3

    .line 292
    if-eqz v3, :cond_f

    .line 293
    .line 294
    iget-boolean v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->m:Z

    .line 295
    .line 296
    if-eqz v3, :cond_f

    .line 297
    .line 298
    iget-boolean v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->l:Z

    .line 299
    .line 300
    if-eqz v3, :cond_f

    .line 301
    .line 302
    move v3, v1

    .line 303
    goto :goto_6

    .line 304
    :cond_f
    move v3, v2

    .line 305
    :goto_6
    iget-object v5, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->i:Ljava/util/List;

    .line 306
    .line 307
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    .line 308
    .line 309
    .line 310
    move-result v5

    .line 311
    if-nez v5, :cond_12

    .line 312
    .line 313
    move v5, v2

    .line 314
    :goto_7
    iget-object v6, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->i:Ljava/util/List;

    .line 315
    .line 316
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 317
    .line 318
    .line 319
    move-result v6

    .line 320
    if-ge v5, v6, :cond_12

    .line 321
    .line 322
    iget-object v6, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->i:Ljava/util/List;

    .line 323
    .line 324
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    move-result-object v6

    .line 328
    check-cast v6, LN2/B;

    .line 329
    .line 330
    iget-object v10, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 331
    .line 332
    invoke-virtual {v6}, LN2/B;->a()Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v13

    .line 336
    invoke-virtual {v10, v13}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    .line 338
    .line 339
    move-result-object v10

    .line 340
    check-cast v10, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 341
    .line 342
    if-eqz v10, :cond_10

    .line 343
    .line 344
    if-eqz v3, :cond_10

    .line 345
    .line 346
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 347
    .line 348
    invoke-virtual {v3, v10, v7}, Lcom/android/launcher3/taskbar/bubbles/g0;->E(Lcom/android/launcher3/taskbar/bubbles/b;Lcom/android/launcher3/taskbar/bubbles/b;)V

    .line 349
    .line 350
    .line 351
    move v3, v2

    .line 352
    goto :goto_8

    .line 353
    :cond_10
    if-eqz v10, :cond_11

    .line 354
    .line 355
    iget-object v6, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 356
    .line 357
    invoke-virtual {v6, v10}, Lcom/android/launcher3/taskbar/bubbles/g0;->m1(Lcom/android/launcher3/taskbar/bubbles/b;)V

    .line 358
    .line 359
    .line 360
    goto :goto_8

    .line 361
    :cond_11
    new-instance v10, Ljava/lang/StringBuilder;

    .line 362
    .line 363
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 364
    .line 365
    .line 366
    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 367
    .line 368
    .line 369
    invoke-virtual {v6}, LN2/B;->a()Ljava/lang/String;

    .line 370
    .line 371
    .line 372
    move-result-object v6

    .line 373
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 374
    .line 375
    .line 376
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object v6

    .line 380
    invoke-static {v12, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    .line 382
    .line 383
    :goto_8
    add-int/lit8 v5, v5, 0x1

    .line 384
    .line 385
    goto :goto_7

    .line 386
    :cond_12
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->n:Lcom/android/launcher3/taskbar/bubbles/b;

    .line 387
    .line 388
    if-eqz v3, :cond_13

    .line 389
    .line 390
    iget-object v4, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 391
    .line 392
    invoke-virtual {v4, v3, v8, v9, v7}, Lcom/android/launcher3/taskbar/bubbles/g0;->B(Lcom/android/launcher3/taskbar/bubbles/u;ZZLcom/android/launcher3/taskbar/bubbles/b;)V

    .line 393
    .line 394
    .line 395
    :cond_13
    invoke-static {}, LH2/c;->k()Z

    .line 396
    .line 397
    .line 398
    move-result v3

    .line 399
    if-eqz v3, :cond_14

    .line 400
    .line 401
    iget-boolean v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->m:Z

    .line 402
    .line 403
    if-eqz v3, :cond_14

    .line 404
    .line 405
    iget-boolean v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->l:Z

    .line 406
    .line 407
    iget-object v4, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 408
    .line 409
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/bubbles/g0;->J0()Z

    .line 410
    .line 411
    .line 412
    move-result v4

    .line 413
    if-eq v3, v4, :cond_14

    .line 414
    .line 415
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 416
    .line 417
    iget-boolean v4, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->l:Z

    .line 418
    .line 419
    invoke-virtual {v3, v4}, Lcom/android/launcher3/taskbar/bubbles/g0;->D1(Z)V

    .line 420
    .line 421
    .line 422
    :cond_14
    :goto_9
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->o:Lcom/android/launcher3/taskbar/bubbles/b;

    .line 423
    .line 424
    if-eqz v3, :cond_15

    .line 425
    .line 426
    iget-object v4, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 427
    .line 428
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/bubbles/u;->a()Ljava/lang/String;

    .line 429
    .line 430
    .line 431
    move-result-object v3

    .line 432
    invoke-virtual {v4, v3}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    .line 433
    .line 434
    .line 435
    move-result v3

    .line 436
    if-nez v3, :cond_15

    .line 437
    .line 438
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->o:Lcom/android/launcher3/taskbar/bubbles/b;

    .line 439
    .line 440
    invoke-direct {p0, v3, v8, v9}, Lcom/android/launcher3/taskbar/bubbles/t;->C2(Lcom/android/launcher3/taskbar/bubbles/b;ZZ)V

    .line 441
    .line 442
    .line 443
    :cond_15
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->n:Lcom/android/launcher3/taskbar/bubbles/b;

    .line 444
    .line 445
    if-eqz v3, :cond_16

    .line 446
    .line 447
    if-eqz v0, :cond_16

    .line 448
    .line 449
    if-nez v7, :cond_16

    .line 450
    .line 451
    move-object v7, v3

    .line 452
    :cond_16
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->p:Ljava/util/List;

    .line 453
    .line 454
    if-eqz v3, :cond_19

    .line 455
    .line 456
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 457
    .line 458
    .line 459
    move-result v3

    .line 460
    if-nez v3, :cond_19

    .line 461
    .line 462
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->p:Ljava/util/List;

    .line 463
    .line 464
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 465
    .line 466
    .line 467
    move-result v3

    .line 468
    sub-int/2addr v3, v1

    .line 469
    :goto_a
    if-ltz v3, :cond_19

    .line 470
    .line 471
    iget-object v4, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->p:Ljava/util/List;

    .line 472
    .line 473
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 474
    .line 475
    .line 476
    move-result-object v4

    .line 477
    check-cast v4, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 478
    .line 479
    if-eqz v4, :cond_17

    .line 480
    .line 481
    invoke-direct {p0, v4, v8, v9}, Lcom/android/launcher3/taskbar/bubbles/t;->C2(Lcom/android/launcher3/taskbar/bubbles/b;ZZ)V

    .line 482
    .line 483
    .line 484
    if-eqz v0, :cond_18

    .line 485
    .line 486
    if-nez v7, :cond_18

    .line 487
    .line 488
    move-object v7, v4

    .line 489
    goto :goto_b

    .line 490
    :cond_17
    new-instance v4, Ljava/lang/StringBuilder;

    .line 491
    .line 492
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 493
    .line 494
    .line 495
    const-string v5, "trying to add bubble but null after loading! "

    .line 496
    .line 497
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 498
    .line 499
    .line 500
    iget-object v5, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->n:Lcom/android/launcher3/taskbar/bubbles/b;

    .line 501
    .line 502
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/bubbles/u;->a()Ljava/lang/String;

    .line 503
    .line 504
    .line 505
    move-result-object v5

    .line 506
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 507
    .line 508
    .line 509
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 510
    .line 511
    .line 512
    move-result-object v4

    .line 513
    invoke-static {v12, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 514
    .line 515
    .line 516
    :cond_18
    :goto_b
    add-int/lit8 v3, v3, -0x1

    .line 517
    .line 518
    goto :goto_a

    .line 519
    :cond_19
    invoke-static {}, LH2/c;->k()Z

    .line 520
    .line 521
    .line 522
    move-result v0

    .line 523
    if-eqz v0, :cond_1a

    .line 524
    .line 525
    iget-boolean v0, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->a:Z

    .line 526
    .line 527
    if-eqz v0, :cond_1a

    .line 528
    .line 529
    iget-boolean v0, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->l:Z

    .line 530
    .line 531
    if-eqz v0, :cond_1a

    .line 532
    .line 533
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 534
    .line 535
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->D1(Z)V

    .line 536
    .line 537
    .line 538
    :cond_1a
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->f:Ljava/lang/String;

    .line 539
    .line 540
    if-eqz v0, :cond_1b

    .line 541
    .line 542
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 543
    .line 544
    invoke-virtual {v3, v0}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 545
    .line 546
    .line 547
    move-result-object v0

    .line 548
    check-cast v0, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 549
    .line 550
    if-eqz v0, :cond_1b

    .line 551
    .line 552
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->j:Landroid/util/ArrayMap;

    .line 553
    .line 554
    iget-object v4, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->f:Ljava/lang/String;

    .line 555
    .line 556
    invoke-virtual {v3, v4, v0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 557
    .line 558
    .line 559
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 560
    .line 561
    invoke-virtual {v3, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->m1(Lcom/android/launcher3/taskbar/bubbles/b;)V

    .line 562
    .line 563
    .line 564
    :cond_1b
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->g:Ljava/lang/String;

    .line 565
    .line 566
    if-eqz v0, :cond_1c

    .line 567
    .line 568
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->j:Landroid/util/ArrayMap;

    .line 569
    .line 570
    invoke-virtual {v3, v0}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 571
    .line 572
    .line 573
    move-result-object v0

    .line 574
    check-cast v0, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 575
    .line 576
    if-eqz v0, :cond_1c

    .line 577
    .line 578
    invoke-direct {p0, v0, v2, v1}, Lcom/android/launcher3/taskbar/bubbles/t;->C2(Lcom/android/launcher3/taskbar/bubbles/b;ZZ)V

    .line 579
    .line 580
    .line 581
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 582
    .line 583
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->E0()Z

    .line 584
    .line 585
    .line 586
    move-result v0

    .line 587
    if-eqz v0, :cond_1c

    .line 588
    .line 589
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 590
    .line 591
    invoke-virtual {v0, v2}, Lcom/android/launcher3/taskbar/bubbles/g0;->x1(Z)V

    .line 592
    .line 593
    .line 594
    :cond_1c
    iget-boolean v0, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->a:Z

    .line 595
    .line 596
    if-nez v0, :cond_1d

    .line 597
    .line 598
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 599
    .line 600
    invoke-virtual {v0}, Landroid/util/ArrayMap;->isEmpty()Z

    .line 601
    .line 602
    .line 603
    move-result v0

    .line 604
    if-nez v0, :cond_1d

    .line 605
    .line 606
    if-eqz v9, :cond_1e

    .line 607
    .line 608
    :cond_1d
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 609
    .line 610
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 611
    .line 612
    invoke-virtual {v3}, Landroid/util/ArrayMap;->isEmpty()Z

    .line 613
    .line 614
    .line 615
    move-result v3

    .line 616
    invoke-virtual {v0, v3}, Lcom/android/launcher3/taskbar/bubbles/g0;->x1(Z)V

    .line 617
    .line 618
    .line 619
    :cond_1e
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->p:Ljava/util/Optional;

    .line 620
    .line 621
    new-instance v3, Lcom/android/launcher3/taskbar/bubbles/r;

    .line 622
    .line 623
    invoke-direct {v3, p0}, Lcom/android/launcher3/taskbar/bubbles/r;-><init>(Lcom/android/launcher3/taskbar/bubbles/t;)V

    .line 624
    .line 625
    .line 626
    invoke-virtual {v0, v3}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 627
    .line 628
    .line 629
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 630
    .line 631
    invoke-virtual {v0}, Landroid/util/ArrayMap;->isEmpty()Z

    .line 632
    .line 633
    .line 634
    move-result v0

    .line 635
    if-eqz v0, :cond_1f

    .line 636
    .line 637
    iput-object v11, p0, Lcom/android/launcher3/taskbar/bubbles/t;->l:Lcom/android/launcher3/taskbar/bubbles/u;

    .line 638
    .line 639
    :cond_1f
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->o:Lcom/android/launcher3/taskbar/bubbles/b;

    .line 640
    .line 641
    if-eqz v0, :cond_21

    .line 642
    .line 643
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 644
    .line 645
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/u;->a()Ljava/lang/String;

    .line 646
    .line 647
    .line 648
    move-result-object v0

    .line 649
    invoke-virtual {v3, v0}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 650
    .line 651
    .line 652
    move-result-object v0

    .line 653
    check-cast v0, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 654
    .line 655
    if-eqz v9, :cond_20

    .line 656
    .line 657
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 658
    .line 659
    .line 660
    move-result-object v0

    .line 661
    invoke-virtual {v0, v2}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->D(Z)V

    .line 662
    .line 663
    .line 664
    goto :goto_c

    .line 665
    :cond_20
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 666
    .line 667
    invoke-virtual {v3, v0, v2, v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->J(Lcom/android/launcher3/taskbar/bubbles/b;ZZ)V

    .line 668
    .line 669
    .line 670
    :cond_21
    :goto_c
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->j:Ljava/util/List;

    .line 671
    .line 672
    if-eqz v0, :cond_22

    .line 673
    .line 674
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 675
    .line 676
    .line 677
    move-result v0

    .line 678
    if-nez v0, :cond_22

    .line 679
    .line 680
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->j:Ljava/util/List;

    .line 681
    .line 682
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 683
    .line 684
    .line 685
    move-result-object v0

    .line 686
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 687
    .line 688
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 689
    .line 690
    .line 691
    new-instance v2, Lcom/android/launcher3/taskbar/bubbles/s;

    .line 692
    .line 693
    invoke-direct {v2, v1}, Lcom/android/launcher3/taskbar/bubbles/s;-><init>(Landroid/util/ArrayMap;)V

    .line 694
    .line 695
    .line 696
    invoke-interface {v0, v2}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 697
    .line 698
    .line 699
    move-result-object v0

    .line 700
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/e;

    .line 701
    .line 702
    invoke-direct {v1}, Lcom/android/launcher3/taskbar/bubbles/e;-><init>()V

    .line 703
    .line 704
    .line 705
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 706
    .line 707
    .line 708
    move-result-object v0

    .line 709
    invoke-interface {v0}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 710
    .line 711
    .line 712
    move-result-object v0

    .line 713
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 714
    .line 715
    .line 716
    move-result v1

    .line 717
    if-nez v1, :cond_22

    .line 718
    .line 719
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 720
    .line 721
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->p1(Ljava/util/List;)V

    .line 722
    .line 723
    .line 724
    :cond_22
    if-eqz v7, :cond_23

    .line 725
    .line 726
    invoke-direct {p0, v7}, Lcom/android/launcher3/taskbar/bubbles/t;->a3(Lcom/android/launcher3/taskbar/bubbles/u;)V

    .line 727
    .line 728
    .line 729
    :cond_23
    iget-boolean v0, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->d:Z

    .line 730
    .line 731
    if-eqz v0, :cond_24

    .line 732
    .line 733
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 734
    .line 735
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->k1()V

    .line 736
    .line 737
    .line 738
    :cond_24
    iget-boolean v0, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->b:Z

    .line 739
    .line 740
    if-eqz v0, :cond_26

    .line 741
    .line 742
    iget-boolean v0, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->c:Z

    .line 743
    .line 744
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 745
    .line 746
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->D0()Z

    .line 747
    .line 748
    .line 749
    move-result v1

    .line 750
    if-eq v0, v1, :cond_25

    .line 751
    .line 752
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 753
    .line 754
    iget-boolean v1, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->c:Z

    .line 755
    .line 756
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->w1(Z)V

    .line 757
    .line 758
    .line 759
    goto :goto_d

    .line 760
    :cond_25
    const-string v0, "expansion was changed but is the same"

    .line 761
    .line 762
    invoke-static {v12, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 763
    .line 764
    .line 765
    :cond_26
    :goto_d
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->h:LN2/h;

    .line 766
    .line 767
    if-eqz v0, :cond_27

    .line 768
    .line 769
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->m:Lcom/android/launcher3/taskbar/J3;

    .line 770
    .line 771
    iput-object v0, v1, Lcom/android/launcher3/taskbar/J3;->o:LN2/h;

    .line 772
    .line 773
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 774
    .line 775
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->d0()LN2/h;

    .line 776
    .line 777
    .line 778
    move-result-object v1

    .line 779
    if-eq v0, v1, :cond_27

    .line 780
    .line 781
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->h:LN2/h;

    .line 782
    .line 783
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/t;->e3(LN2/h;)V

    .line 784
    .line 785
    .line 786
    :cond_27
    iget-object p1, p1, Lcom/android/launcher3/taskbar/bubbles/t$b;->k:Landroid/graphics/Point;

    .line 787
    .line 788
    if-eqz p1, :cond_28

    .line 789
    .line 790
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->q:Lcom/android/launcher3/taskbar/bubbles/y0;

    .line 791
    .line 792
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/y0;->D(Landroid/graphics/Point;)V

    .line 793
    .line 794
    .line 795
    :cond_28
    return-void
.end method

.method public static G2()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/android/launcher3/taskbar/bubbles/t;->v:Z

    .line 2
    .line 3
    return v0
.end method

.method private synthetic H2(LN2/h;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->G(LN2/h;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->s:Lcom/android/launcher3/taskbar/bubbles/t$a;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t$a;->c(LN2/h;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic I2(Lcom/android/launcher3/taskbar/bubbles/A0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/util/ArrayMap;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/bubbles/A0;->u(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic J2(Lcom/android/launcher3/taskbar/bubbles/A0;)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/android/launcher3/taskbar/bubbles/t;->v:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/util/ArrayMap;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    goto :goto_1

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    :goto_1
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/bubbles/A0;->u(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic K2(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/android/launcher3/taskbar/bubbles/u;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t;->a3(Lcom/android/launcher3/taskbar/bubbles/u;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic L2(Lcom/android/launcher3/taskbar/J3;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t;->Y2(Lcom/android/launcher3/taskbar/J3;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 5
    .line 6
    sget-boolean v0, Lcom/android/launcher3/taskbar/bubbles/t;->v:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/util/ArrayMap;->isEmpty()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 22
    :goto_1
    invoke-virtual {p1, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->x1(Z)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->p:Ljava/util/Optional;

    .line 26
    .line 27
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/h;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/bubbles/h;-><init>(Lcom/android/launcher3/taskbar/bubbles/t;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 36
    .line 37
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/i;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/bubbles/i;-><init>(Lcom/android/launcher3/taskbar/bubbles/t;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->C1(Ljava/util/function/Consumer;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 46
    .line 47
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/j;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/bubbles/j;-><init>(Lcom/android/launcher3/taskbar/bubbles/t;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->q1(Lcom/android/launcher3/taskbar/bubbles/g0$g;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->s:Lcom/android/launcher3/taskbar/bubbles/t$a;

    .line 56
    .line 57
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->d0()LN2/h;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-interface {p1, v0}, Lcom/android/launcher3/taskbar/bubbles/t$a;->b(LN2/h;)V

    .line 64
    .line 65
    .line 66
    sget-boolean p1, Lcom/android/launcher3/taskbar/bubbles/t;->v:Z

    .line 67
    .line 68
    if-eqz p1, :cond_2

    .line 69
    .line 70
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->k:Lcom/android/quickstep/SystemUiProxy;

    .line 71
    .line 72
    invoke-virtual {p1, p0}, Lcom/android/quickstep/SystemUiProxy;->setBubblesListener(LJ2/b;)V

    .line 73
    .line 74
    .line 75
    :cond_2
    return-void
.end method

.method private synthetic M2(Lcom/android/launcher3/taskbar/bubbles/t$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t;->D2(Lcom/android/launcher3/taskbar/bubbles/t$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic N2(LN2/i;Lcom/android/launcher3/taskbar/bubbles/t$b;)V
    .locals 7

    .line 1
    iget-object v0, p1, LN2/i;->l:LN2/k;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/t;->r:Lcom/android/launcher3/taskbar/bubbles/n0;

    .line 7
    .line 8
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->g:Landroid/content/Context;

    .line 9
    .line 10
    iget-object v4, p0, Lcom/android/launcher3/taskbar/bubbles/t;->h:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 11
    .line 12
    invoke-virtual {v2, v3, v0, v4, v1}, Lcom/android/launcher3/taskbar/bubbles/n0;->d(Landroid/content/Context;LN2/k;Landroid/view/ViewGroup;Lcom/android/launcher3/taskbar/bubbles/b;)Lcom/android/launcher3/taskbar/bubbles/b;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p2, Lcom/android/launcher3/taskbar/bubbles/t$b;->n:Lcom/android/launcher3/taskbar/bubbles/b;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p1, LN2/i;->m:LN2/k;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 23
    .line 24
    invoke-virtual {v0}, LN2/k;->g()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v2, v0}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/t;->r:Lcom/android/launcher3/taskbar/bubbles/n0;

    .line 35
    .line 36
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->g:Landroid/content/Context;

    .line 37
    .line 38
    iget-object v4, p1, LN2/i;->m:LN2/k;

    .line 39
    .line 40
    iget-object v5, p0, Lcom/android/launcher3/taskbar/bubbles/t;->h:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 41
    .line 42
    invoke-virtual {v2, v3, v4, v5, v0}, Lcom/android/launcher3/taskbar/bubbles/n0;->d(Landroid/content/Context;LN2/k;Landroid/view/ViewGroup;Lcom/android/launcher3/taskbar/bubbles/b;)Lcom/android/launcher3/taskbar/bubbles/b;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p2, Lcom/android/launcher3/taskbar/bubbles/t$b;->o:Lcom/android/launcher3/taskbar/bubbles/b;

    .line 47
    .line 48
    :cond_1
    iget-object v0, p1, LN2/i;->v:Ljava/util/List;

    .line 49
    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_3

    .line 57
    .line 58
    new-instance v0, Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .line 62
    .line 63
    const/4 v2, 0x0

    .line 64
    :goto_0
    iget-object v3, p1, LN2/i;->v:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-ge v2, v3, :cond_2

    .line 71
    .line 72
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->r:Lcom/android/launcher3/taskbar/bubbles/n0;

    .line 73
    .line 74
    iget-object v4, p0, Lcom/android/launcher3/taskbar/bubbles/t;->g:Landroid/content/Context;

    .line 75
    .line 76
    iget-object v5, p1, LN2/i;->v:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    check-cast v5, LN2/k;

    .line 83
    .line 84
    iget-object v6, p0, Lcom/android/launcher3/taskbar/bubbles/t;->h:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 85
    .line 86
    invoke-virtual {v3, v4, v5, v6, v1}, Lcom/android/launcher3/taskbar/bubbles/n0;->d(Landroid/content/Context;LN2/k;Landroid/view/ViewGroup;Lcom/android/launcher3/taskbar/bubbles/b;)Lcom/android/launcher3/taskbar/bubbles/b;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    add-int/lit8 v2, v2, 0x1

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_2
    iput-object v0, p2, Lcom/android/launcher3/taskbar/bubbles/t$b;->p:Ljava/util/List;

    .line 97
    .line 98
    :cond_3
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 99
    .line 100
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/o;

    .line 101
    .line 102
    invoke-direct {v0, p0, p2}, Lcom/android/launcher3/taskbar/bubbles/o;-><init>(Lcom/android/launcher3/taskbar/bubbles/t;Lcom/android/launcher3/taskbar/bubbles/t$b;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method private synthetic O2(Lcom/android/launcher3/taskbar/bubbles/t$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t;->D2(Lcom/android/launcher3/taskbar/bubbles/t$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic P2(Lcom/android/launcher3/taskbar/bubbles/t$b;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/q;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/taskbar/bubbles/q;-><init>(Lcom/android/launcher3/taskbar/bubbles/t;Lcom/android/launcher3/taskbar/bubbles/t$b;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic Q2([LN2/k;Lcom/android/launcher3/taskbar/bubbles/b;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->K(Landroid/view/View;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-ltz p0, :cond_1

    .line 12
    .line 13
    array-length v0, p1

    .line 14
    if-lt p0, v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/b;->h()LN2/k;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    aput-object p2, p1, p0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v0, "Found improper index: "

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string p0, " for "

    .line 38
    .line 39
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p1, "BubbleBarController"

    .line 50
    .line 51
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method private synthetic R2(LN2/h;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->f1(LN2/h;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->H0()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->s:Lcom/android/launcher3/taskbar/bubbles/t$a;

    .line 15
    .line 16
    invoke-interface {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t$a;->c(LN2/h;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method private synthetic S2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->H0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->d0()LN2/h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->s:Lcom/android/launcher3/taskbar/bubbles/t$a;

    .line 16
    .line 17
    invoke-interface {v1, v0}, Lcom/android/launcher3/taskbar/bubbles/t$a;->c(LN2/h;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->i1()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private T2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->h:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getRestingTopPositionOnScreen()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->t:I

    .line 8
    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iput v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->t:I

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->k:Lcom/android/quickstep/SystemUiProxy;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/android/quickstep/SystemUiProxy;->updateBubbleBarTopOnScreen(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static W2()V
    .locals 2

    .line 1
    invoke-static {}, LH2/c;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "persist.wm.debug.bubble_bar"

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    :cond_0
    const/4 v1, 0x1

    .line 17
    :cond_1
    sput-boolean v1, Lcom/android/launcher3/taskbar/bubbles/t;->v:Z

    .line 18
    .line 19
    return-void
.end method

.method private X2(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "LN2/k;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x1

    .line 15
    sub-int/2addr v0, v1

    .line 16
    :goto_0
    if-ltz v0, :cond_2

    .line 17
    .line 18
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/t;->r:Lcom/android/launcher3/taskbar/bubbles/n0;

    .line 19
    .line 20
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->g:Landroid/content/Context;

    .line 21
    .line 22
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    check-cast v4, LN2/k;

    .line 27
    .line 28
    iget-object v5, p0, Lcom/android/launcher3/taskbar/bubbles/t;->h:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 29
    .line 30
    const/4 v6, 0x0

    .line 31
    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/android/launcher3/taskbar/bubbles/n0;->d(Landroid/content/Context;LN2/k;Landroid/view/ViewGroup;Lcom/android/launcher3/taskbar/bubbles/b;)Lcom/android/launcher3/taskbar/bubbles/b;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    if-nez v2, :cond_1

    .line 36
    .line 37
    new-instance v2, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    const-string v3, "Could not instantiate BubbleBarBubble for "

    .line 43
    .line 44
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    const-string v3, "BubbleBarController"

    .line 59
    .line 60
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    const/4 v3, 0x0

    .line 65
    invoke-direct {p0, v2, v3, v1}, Lcom/android/launcher3/taskbar/bubbles/t;->C2(Lcom/android/launcher3/taskbar/bubbles/b;ZZ)V

    .line 66
    .line 67
    .line 68
    :goto_1
    add-int/lit8 v0, v0, -0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    :goto_2
    return-void
.end method

.method private Y2(Lcom/android/launcher3/taskbar/J3;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/taskbar/J3;->o:LN2/h;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/t;->e3(LN2/h;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p1, Lcom/android/launcher3/taskbar/J3;->p:Ljava/util/List;

    .line 9
    .line 10
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/t;->X2(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p1, Lcom/android/launcher3/taskbar/J3;->q:Ljava/util/List;

    .line 14
    .line 15
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t;->Z2(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private Z2(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "LN2/k;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->reversed()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, LN2/k;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->r:Lcom/android/launcher3/taskbar/bubbles/n0;

    .line 31
    .line 32
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/t;->g:Landroid/content/Context;

    .line 33
    .line 34
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->h:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 35
    .line 36
    const/4 v4, 0x0

    .line 37
    invoke-virtual {v1, v2, v0, v3, v4}, Lcom/android/launcher3/taskbar/bubbles/n0;->d(Landroid/content/Context;LN2/k;Landroid/view/ViewGroup;Lcom/android/launcher3/taskbar/bubbles/b;)Lcom/android/launcher3/taskbar/bubbles/b;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->j:Landroid/util/ArrayMap;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/u;->a()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v1, v2, v0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    :goto_1
    return-void
.end method

.method private a3(Lcom/android/launcher3/taskbar/bubbles/u;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->l:Lcom/android/launcher3/taskbar/bubbles/u;

    .line 2
    .line 3
    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->l:Lcom/android/launcher3/taskbar/bubbles/u;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->M1(Lcom/android/launcher3/taskbar/bubbles/u;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private e3(LN2/h;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->r1(LN2/h;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->o:LX1/b;

    .line 7
    .line 8
    invoke-interface {v0, p1}, LX1/b;->I(LN2/h;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->s:Lcom/android/launcher3/taskbar/bubbles/t$a;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t$a;->b(LN2/h;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic o2(Lcom/android/launcher3/taskbar/bubbles/t;Lcom/android/launcher3/taskbar/bubbles/t$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t;->O2(Lcom/android/launcher3/taskbar/bubbles/t$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p2(Lcom/android/launcher3/taskbar/bubbles/t;LN2/h;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t;->R2(LN2/h;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q2(ZLcom/android/launcher3/taskbar/bubbles/A0;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/bubbles/A0;->v(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r2(Lcom/android/launcher3/taskbar/bubbles/t;LN2/i;Lcom/android/launcher3/taskbar/bubbles/t$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/t;->N2(LN2/i;Lcom/android/launcher3/taskbar/bubbles/t$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s2(Lcom/android/launcher3/taskbar/bubbles/t;Lcom/android/launcher3/taskbar/bubbles/A0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t;->J2(Lcom/android/launcher3/taskbar/bubbles/A0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t2(Lcom/android/launcher3/taskbar/bubbles/t;LN2/h;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t;->H2(LN2/h;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u2(Lcom/android/launcher3/taskbar/bubbles/t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/t;->T2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v2(Lcom/android/launcher3/taskbar/bubbles/t;[LN2/k;Lcom/android/launcher3/taskbar/bubbles/b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/t;->Q2([LN2/k;Lcom/android/launcher3/taskbar/bubbles/b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic w2(Lcom/android/launcher3/taskbar/bubbles/t;Lcom/android/launcher3/taskbar/bubbles/t$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t;->M2(Lcom/android/launcher3/taskbar/bubbles/t$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x2(Lcom/android/launcher3/taskbar/bubbles/t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/t;->S2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y2(Lcom/android/launcher3/taskbar/bubbles/t;Lcom/android/launcher3/taskbar/bubbles/A0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t;->I2(Lcom/android/launcher3/taskbar/bubbles/A0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic z2(Lcom/android/launcher3/taskbar/bubbles/t;Lcom/android/launcher3/taskbar/bubbles/t$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t;->P2(Lcom/android/launcher3/taskbar/bubbles/t$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public E2()Ljava/lang/String;
    .locals 0
    .annotation build Landroid/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->l:Lcom/android/launcher3/taskbar/bubbles/u;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/u;->a()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public F2(Lcom/android/launcher3/taskbar/bubbles/m0;Lcom/android/launcher3/taskbar/bubbles/t$a;Lcom/android/launcher3/taskbar/J3;)V
    .locals 1

    .line 1
    iput-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/t;->m:Lcom/android/launcher3/taskbar/J3;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 4
    .line 5
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 6
    .line 7
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->o:LX1/b;

    .line 10
    .line 11
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->d:Ljava/util/Optional;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->p:Ljava/util/Optional;

    .line 14
    .line 15
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->h:Lcom/android/launcher3/taskbar/bubbles/y0;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->q:Lcom/android/launcher3/taskbar/bubbles/y0;

    .line 18
    .line 19
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->j:Lcom/android/launcher3/taskbar/bubbles/n0;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->r:Lcom/android/launcher3/taskbar/bubbles/n0;

    .line 22
    .line 23
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/t;->s:Lcom/android/launcher3/taskbar/bubbles/t$a;

    .line 24
    .line 25
    new-instance p2, Lcom/android/launcher3/taskbar/bubbles/g;

    .line 26
    .line 27
    invoke-direct {p2, p0, p3}, Lcom/android/launcher3/taskbar/bubbles/g;-><init>(Lcom/android/launcher3/taskbar/bubbles/t;Lcom/android/launcher3/taskbar/J3;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, p2}, Lcom/android/launcher3/taskbar/bubbles/m0;->i(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public M1()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/d;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/bubbles/d;-><init>(Lcom/android/launcher3/taskbar/bubbles/t;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public R0(LN2/h;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/m;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/taskbar/bubbles/m;-><init>(Lcom/android/launcher3/taskbar/bubbles/t;LN2/h;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public S1(LN2/h;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/n;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/taskbar/bubbles/n;-><init>(Lcom/android/launcher3/taskbar/bubbles/t;LN2/h;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public U2(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/u;->a()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public V2()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->k:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/android/quickstep/SystemUiProxy;->setBubblesListener(LJ2/b;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/util/ArrayMap;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    new-array v0, v0, [LN2/k;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->i:Landroid/util/ArrayMap;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/util/ArrayMap;->values()Ljava/util/Collection;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Lcom/android/launcher3/taskbar/bubbles/f;

    .line 22
    .line 23
    invoke-direct {v2, p0, v0}, Lcom/android/launcher3/taskbar/bubbles/f;-><init>(Lcom/android/launcher3/taskbar/bubbles/t;[LN2/k;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {v1, v2}, Ljava/util/Collection;->forEach(Ljava/util/function/Consumer;)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->m:Lcom/android/launcher3/taskbar/J3;

    .line 30
    .line 31
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, v1, Lcom/android/launcher3/taskbar/J3;->p:Ljava/util/List;

    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->m:Lcom/android/launcher3/taskbar/J3;

    .line 38
    .line 39
    new-instance v1, Ljava/util/ArrayList;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/t;->j:Landroid/util/ArrayMap;

    .line 42
    .line 43
    invoke-virtual {v2}, Landroid/util/ArrayMap;->size()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 48
    .line 49
    .line 50
    iput-object v1, v0, Lcom/android/launcher3/taskbar/J3;->q:Ljava/util/List;

    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->j:Landroid/util/ArrayMap;

    .line 54
    .line 55
    invoke-virtual {v1}, Landroid/util/ArrayMap;->size()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-ge v0, v1, :cond_0

    .line 60
    .line 61
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->m:Lcom/android/launcher3/taskbar/J3;

    .line 62
    .line 63
    iget-object v1, v1, Lcom/android/launcher3/taskbar/J3;->q:Ljava/util/List;

    .line 64
    .line 65
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/t;->j:Landroid/util/ArrayMap;

    .line 66
    .line 67
    invoke-virtual {v2, v0}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    check-cast v2, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 72
    .line 73
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/bubbles/b;->h()LN2/k;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    add-int/lit8 v0, v0, 0x1

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_0
    return-void
.end method

.method public b3(Lcom/android/launcher3/taskbar/bubbles/u;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t;->a3(Lcom/android/launcher3/taskbar/bubbles/u;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/t;->c3()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public c3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/t;->E2()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->h:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getRestingTopPositionOnScreen()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->t:I

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->k:Lcom/android/quickstep/SystemUiProxy;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/t;->E2()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->t:I

    .line 22
    .line 23
    invoke-virtual {v0, v1, p0}, Lcom/android/quickstep/SystemUiProxy;->showBubble(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-string p0, "BubbleBarController"

    .line 28
    .line 29
    const-string v0, "Trying to show the selected bubble but it\'s null"

    .line 30
    .line 31
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public d3(LN2/h;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t;->e3(LN2/h;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->k:Lcom/android/quickstep/SystemUiProxy;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/SystemUiProxy;->setBubbleBarLocation(LN2/h;I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public f3(J)V
    .locals 8

    .line 1
    const-wide/32 v0, 0x40a4c

    .line 2
    .line 3
    .line 4
    and-long/2addr v0, p1

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v4, 0x1

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    move v0, v4

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v0, v1

    .line 16
    :goto_0
    iget-object v5, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 17
    .line 18
    invoke-virtual {v5, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->z1(Z)V

    .line 19
    .line 20
    .line 21
    const-wide/16 v5, 0x248

    .line 22
    .line 23
    and-long/2addr v5, p1

    .line 24
    cmp-long v0, v5, v2

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    move v5, v4

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move v5, v1

    .line 31
    :goto_1
    iget-object v6, p0, Lcom/android/launcher3/taskbar/bubbles/t;->p:Ljava/util/Optional;

    .line 32
    .line 33
    new-instance v7, Lcom/android/launcher3/taskbar/bubbles/p;

    .line 34
    .line 35
    invoke-direct {v7, v5}, Lcom/android/launcher3/taskbar/bubbles/p;-><init>(Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v6, v7}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 39
    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    move v0, v4

    .line 44
    goto :goto_2

    .line 45
    :cond_2
    move v0, v1

    .line 46
    :goto_2
    iget-object v5, p0, Lcom/android/launcher3/taskbar/bubbles/t;->o:LX1/b;

    .line 47
    .line 48
    invoke-interface {v5, v0}, LX1/b;->f(Z)V

    .line 49
    .line 50
    .line 51
    const-wide/32 v5, 0x40000

    .line 52
    .line 53
    .line 54
    and-long/2addr p1, v5

    .line 55
    cmp-long p1, p1, v2

    .line 56
    .line 57
    if-eqz p1, :cond_3

    .line 58
    .line 59
    move v1, v4

    .line 60
    :cond_3
    iput-boolean v1, p0, Lcom/android/launcher3/taskbar/bubbles/t;->u:Z

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->n:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->g1()V

    .line 67
    .line 68
    .line 69
    :cond_4
    return-void
.end method

.method public l2(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    const-class v0, LN2/i;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 8
    .line 9
    .line 10
    const-string v1, "update"

    .line 11
    .line 12
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, LN2/i;

    .line 17
    .line 18
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/t$b;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Lcom/android/launcher3/taskbar/bubbles/t$b;-><init>(LN2/i;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p1, LN2/i;->l:LN2/k;

    .line 24
    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    iget-object v1, p1, LN2/i;->m:LN2/k;

    .line 28
    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    iget-object v1, p1, LN2/i;->v:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    sget-object p1, Lcom/android/launcher3/taskbar/bubbles/t;->w:Ljava/util/concurrent/Executor;

    .line 41
    .line 42
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/l;

    .line 43
    .line 44
    invoke-direct {v1, p0, v0}, Lcom/android/launcher3/taskbar/bubbles/l;-><init>(Lcom/android/launcher3/taskbar/bubbles/t;Lcom/android/launcher3/taskbar/bubbles/t$b;)V

    .line 45
    .line 46
    .line 47
    invoke-interface {p1, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    :goto_0
    sget-object v1, Lcom/android/launcher3/taskbar/bubbles/t;->w:Ljava/util/concurrent/Executor;

    .line 52
    .line 53
    new-instance v2, Lcom/android/launcher3/taskbar/bubbles/k;

    .line 54
    .line 55
    invoke-direct {v2, p0, p1, v0}, Lcom/android/launcher3/taskbar/bubbles/k;-><init>(Lcom/android/launcher3/taskbar/bubbles/t;LN2/i;Lcom/android/launcher3/taskbar/bubbles/t$b;)V

    .line 56
    .line 57
    .line 58
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method v1()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/t;->k:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->showExpandedView()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
