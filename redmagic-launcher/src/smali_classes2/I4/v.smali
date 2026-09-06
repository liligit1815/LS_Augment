.class final LI4/v;
.super LJ4/b;
.source "StateFlow.kt"

# interfaces
.implements LI4/r;
.implements LI4/d;
.implements LJ4/p;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "LJ4/b<",
        "LI4/y;",
        ">;",
        "LI4/r<",
        "TT;>;",
        "LI4/d;",
        "LJ4/p<",
        "TT;>;"
    }
.end annotation


# static fields
.field private static final synthetic k:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;


# instance fields
.field private volatile synthetic _state$volatile:Ljava/lang/Object;

.field private j:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-class v0, Ljava/lang/Object;

    .line 2
    .line 3
    const-string v1, "_state$volatile"

    .line 4
    .line 5
    const-class v2, LI4/v;

    .line 6
    .line 7
    invoke-static {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, LI4/v;->k:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LJ4/b;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LI4/v;->_state$volatile:Ljava/lang/Object;

    .line 5
    .line 6
    return-void
.end method

.method private static final synthetic j()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;
    .locals 1

    .line 1
    sget-object v0, LI4/v;->k:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    return-object v0
.end method

.method private final k(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    monitor-enter p0

    .line 3
    :try_start_0
    invoke-static {}, LI4/v;->j()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-static {v1, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    monitor-exit p0

    .line 21
    return v2

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    goto :goto_3

    .line 24
    :cond_0
    :try_start_1
    invoke-static {v1, p2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    monitor-exit p0

    .line 31
    return v0

    .line 32
    :cond_1
    :try_start_2
    invoke-static {}, LI4/v;->j()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1, p0, p2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    iget p1, p0, LI4/v;->j:I

    .line 40
    .line 41
    and-int/lit8 p2, p1, 0x1

    .line 42
    .line 43
    if-nez p2, :cond_5

    .line 44
    .line 45
    add-int/2addr p1, v0

    .line 46
    iput p1, p0, LI4/v;->j:I

    .line 47
    .line 48
    invoke-virtual {p0}, LJ4/b;->g()[LJ4/d;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    sget-object v1, Lh4/t;->a:Lh4/t;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 53
    .line 54
    monitor-exit p0

    .line 55
    :goto_0
    check-cast p2, [LI4/y;

    .line 56
    .line 57
    if-eqz p2, :cond_3

    .line 58
    .line 59
    array-length v1, p2

    .line 60
    move v3, v2

    .line 61
    :goto_1
    if-ge v3, v1, :cond_3

    .line 62
    .line 63
    aget-object v4, p2, v3

    .line 64
    .line 65
    if-eqz v4, :cond_2

    .line 66
    .line 67
    invoke-virtual {v4}, LI4/y;->g()V

    .line 68
    .line 69
    .line 70
    :cond_2
    add-int/2addr v3, v0

    .line 71
    goto :goto_1

    .line 72
    :cond_3
    monitor-enter p0

    .line 73
    :try_start_3
    iget p2, p0, LI4/v;->j:I

    .line 74
    .line 75
    if-ne p2, p1, :cond_4

    .line 76
    .line 77
    add-int/2addr p1, v0

    .line 78
    iput p1, p0, LI4/v;->j:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 79
    .line 80
    monitor-exit p0

    .line 81
    return v0

    .line 82
    :catchall_1
    move-exception p1

    .line 83
    goto :goto_2

    .line 84
    :cond_4
    :try_start_4
    invoke-virtual {p0}, LJ4/b;->g()[LJ4/d;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    sget-object v1, Lh4/t;->a:Lh4/t;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 89
    .line 90
    monitor-exit p0

    .line 91
    move v5, p2

    .line 92
    move-object p2, p1

    .line 93
    move p1, v5

    .line 94
    goto :goto_0

    .line 95
    :goto_2
    monitor-exit p0

    .line 96
    throw p1

    .line 97
    :cond_5
    add-int/lit8 p1, p1, 0x2

    .line 98
    .line 99
    :try_start_5
    iput p1, p0, LI4/v;->j:I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 100
    .line 101
    monitor-exit p0

    .line 102
    return v0

    .line 103
    :goto_3
    monitor-exit p0

    .line 104
    throw p1
.end method


# virtual methods
.method public a(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)Z"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, LJ4/s;->a:LK4/D;

    .line 4
    .line 5
    :cond_0
    if-nez p2, :cond_1

    .line 6
    .line 7
    sget-object p2, LJ4/s;->a:LK4/D;

    .line 8
    .line 9
    :cond_1
    invoke-direct {p0, p1, p2}, LI4/v;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public b(Ll4/g;ILH4/a;)LI4/d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/g;",
            "I",
            "LH4/a;",
            ")",
            "LI4/d<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2, p3}, LI4/w;->d(LI4/u;Ll4/g;ILH4/a;)LI4/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public collect(LI4/e;Ll4/d;)Ljava/lang/Object;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI4/e<",
            "-TT;>;",
            "Ll4/d<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    instance-of v0, p2, LI4/v$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, LI4/v$a;

    .line 7
    .line 8
    iget v1, v0, LI4/v$a;->n:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LI4/v$a;->n:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LI4/v$a;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, LI4/v$a;-><init>(LI4/v;Ll4/d;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, LI4/v$a;->l:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v2, v0, LI4/v$a;->n:I

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    const/4 v4, 0x3

    .line 35
    const/4 v5, 0x2

    .line 36
    const/4 v6, 0x1

    .line 37
    if-eqz v2, :cond_4

    .line 38
    .line 39
    if-eq v2, v6, :cond_3

    .line 40
    .line 41
    if-eq v2, v5, :cond_2

    .line 42
    .line 43
    if-ne v2, v4, :cond_1

    .line 44
    .line 45
    iget-object p0, v0, LI4/v$a;->k:Ljava/lang/Object;

    .line 46
    .line 47
    iget-object p1, v0, LI4/v$a;->j:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast p1, LF4/u0;

    .line 50
    .line 51
    iget-object v2, v0, LI4/v$a;->i:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast v2, LI4/y;

    .line 54
    .line 55
    iget-object v6, v0, LI4/v$a;->h:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v6, LI4/e;

    .line 58
    .line 59
    iget-object v7, v0, LI4/v$a;->g:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast v7, LI4/v;

    .line 62
    .line 63
    :try_start_0
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    .line 65
    .line 66
    move-object p2, p0

    .line 67
    move-object p0, v7

    .line 68
    goto :goto_2

    .line 69
    :catchall_0
    move-exception p0

    .line 70
    goto/16 :goto_6

    .line 71
    .line 72
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 73
    .line 74
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 75
    .line 76
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    throw p0

    .line 80
    :cond_2
    iget-object p0, v0, LI4/v$a;->k:Ljava/lang/Object;

    .line 81
    .line 82
    iget-object p1, v0, LI4/v$a;->j:Ljava/lang/Object;

    .line 83
    .line 84
    check-cast p1, LF4/u0;

    .line 85
    .line 86
    iget-object v2, v0, LI4/v$a;->i:Ljava/lang/Object;

    .line 87
    .line 88
    check-cast v2, LI4/y;

    .line 89
    .line 90
    iget-object v6, v0, LI4/v$a;->h:Ljava/lang/Object;

    .line 91
    .line 92
    check-cast v6, LI4/e;

    .line 93
    .line 94
    iget-object v7, v0, LI4/v$a;->g:Ljava/lang/Object;

    .line 95
    .line 96
    check-cast v7, LI4/v;

    .line 97
    .line 98
    :try_start_1
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    .line 100
    .line 101
    goto/16 :goto_4

    .line 102
    .line 103
    :cond_3
    iget-object p0, v0, LI4/v$a;->i:Ljava/lang/Object;

    .line 104
    .line 105
    move-object v2, p0

    .line 106
    check-cast v2, LI4/y;

    .line 107
    .line 108
    iget-object p0, v0, LI4/v$a;->h:Ljava/lang/Object;

    .line 109
    .line 110
    move-object p1, p0

    .line 111
    check-cast p1, LI4/e;

    .line 112
    .line 113
    iget-object p0, v0, LI4/v$a;->g:Ljava/lang/Object;

    .line 114
    .line 115
    check-cast p0, LI4/v;

    .line 116
    .line 117
    :try_start_2
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 118
    .line 119
    .line 120
    goto :goto_1

    .line 121
    :catchall_1
    move-exception p1

    .line 122
    move-object v7, p0

    .line 123
    move-object p0, p1

    .line 124
    goto/16 :goto_6

    .line 125
    .line 126
    :cond_4
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0}, LJ4/b;->c()LJ4/d;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    move-object v2, p2

    .line 134
    check-cast v2, LI4/y;

    .line 135
    .line 136
    :try_start_3
    instance-of p2, p1, LI4/z;

    .line 137
    .line 138
    if-eqz p2, :cond_5

    .line 139
    .line 140
    move-object p2, p1

    .line 141
    check-cast p2, LI4/z;

    .line 142
    .line 143
    iput-object p0, v0, LI4/v$a;->g:Ljava/lang/Object;

    .line 144
    .line 145
    iput-object p1, v0, LI4/v$a;->h:Ljava/lang/Object;

    .line 146
    .line 147
    iput-object v2, v0, LI4/v$a;->i:Ljava/lang/Object;

    .line 148
    .line 149
    iput v6, v0, LI4/v$a;->n:I

    .line 150
    .line 151
    invoke-virtual {p2, v0}, LI4/z;->b(Ll4/d;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    if-ne p2, v1, :cond_5

    .line 156
    .line 157
    goto :goto_5

    .line 158
    :cond_5
    :goto_1
    invoke-interface {v0}, Ll4/d;->getContext()Ll4/g;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    sget-object v6, LF4/u0;->b:LF4/u0$b;

    .line 163
    .line 164
    invoke-interface {p2, v6}, Ll4/g;->b(Ll4/g$c;)Ll4/g$b;

    .line 165
    .line 166
    .line 167
    move-result-object p2

    .line 168
    check-cast p2, LF4/u0;

    .line 169
    .line 170
    move-object v6, p1

    .line 171
    move-object p1, p2

    .line 172
    move-object p2, v3

    .line 173
    :cond_6
    :goto_2
    invoke-static {}, LI4/v;->j()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 174
    .line 175
    .line 176
    move-result-object v7

    .line 177
    invoke-virtual {v7, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v7

    .line 181
    if-eqz p1, :cond_7

    .line 182
    .line 183
    invoke-static {p1}, LF4/x0;->g(LF4/u0;)V

    .line 184
    .line 185
    .line 186
    :cond_7
    if-eqz p2, :cond_8

    .line 187
    .line 188
    invoke-static {p2, v7}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result v8

    .line 192
    if-nez v8, :cond_b

    .line 193
    .line 194
    :cond_8
    sget-object p2, LJ4/s;->a:LK4/D;

    .line 195
    .line 196
    if-ne v7, p2, :cond_9

    .line 197
    .line 198
    move-object p2, v3

    .line 199
    goto :goto_3

    .line 200
    :cond_9
    move-object p2, v7

    .line 201
    :goto_3
    iput-object p0, v0, LI4/v$a;->g:Ljava/lang/Object;

    .line 202
    .line 203
    iput-object v6, v0, LI4/v$a;->h:Ljava/lang/Object;

    .line 204
    .line 205
    iput-object v2, v0, LI4/v$a;->i:Ljava/lang/Object;

    .line 206
    .line 207
    iput-object p1, v0, LI4/v$a;->j:Ljava/lang/Object;

    .line 208
    .line 209
    iput-object v7, v0, LI4/v$a;->k:Ljava/lang/Object;

    .line 210
    .line 211
    iput v5, v0, LI4/v$a;->n:I

    .line 212
    .line 213
    invoke-interface {v6, p2, v0}, LI4/e;->emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object p2

    .line 217
    if-ne p2, v1, :cond_a

    .line 218
    .line 219
    goto :goto_5

    .line 220
    :cond_a
    move-object v9, v7

    .line 221
    move-object v7, p0

    .line 222
    move-object p0, v9

    .line 223
    :goto_4
    move-object p2, p0

    .line 224
    move-object p0, v7

    .line 225
    :cond_b
    invoke-virtual {v2}, LI4/y;->h()Z

    .line 226
    .line 227
    .line 228
    move-result v7

    .line 229
    if-nez v7, :cond_6

    .line 230
    .line 231
    iput-object p0, v0, LI4/v$a;->g:Ljava/lang/Object;

    .line 232
    .line 233
    iput-object v6, v0, LI4/v$a;->h:Ljava/lang/Object;

    .line 234
    .line 235
    iput-object v2, v0, LI4/v$a;->i:Ljava/lang/Object;

    .line 236
    .line 237
    iput-object p1, v0, LI4/v$a;->j:Ljava/lang/Object;

    .line 238
    .line 239
    iput-object p2, v0, LI4/v$a;->k:Ljava/lang/Object;

    .line 240
    .line 241
    iput v4, v0, LI4/v$a;->n:I

    .line 242
    .line 243
    invoke-virtual {v2, v0}, LI4/y;->e(Ll4/d;)Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 247
    if-ne v7, v1, :cond_6

    .line 248
    .line 249
    :goto_5
    return-object v1

    .line 250
    :goto_6
    invoke-virtual {v7, v2}, LJ4/b;->f(LJ4/d;)V

    .line 251
    .line 252
    .line 253
    throw p0
.end method

.method public bridge synthetic d()LJ4/d;
    .locals 0

    .line 1
    invoke-virtual {p0}, LI4/v;->h()LI4/y;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic e(I)[LJ4/d;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, LI4/v;->i(I)[LI4/y;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, LI4/v;->setValue(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 5
    .line 6
    return-object p0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    sget-object v0, LJ4/s;->a:LK4/D;

    .line 2
    .line 3
    invoke-static {}, LI4/v;->j()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    return-object p0
.end method

.method protected h()LI4/y;
    .locals 0

    .line 1
    new-instance p0, LI4/y;

    .line 2
    .line 3
    invoke-direct {p0}, LI4/y;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method protected i(I)[LI4/y;
    .locals 0

    .line 1
    new-array p0, p1, [LI4/y;

    .line 2
    .line 3
    return-object p0
.end method

.method public setValue(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, LJ4/s;->a:LK4/D;

    .line 4
    .line 5
    :cond_0
    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, v0, p1}, LI4/v;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method
