.class final LH4/e$a;
.super Ljava/lang/Object;
.source "BufferedChannel.kt"

# interfaces
.implements LH4/i;
.implements LF4/Y0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LH4/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LH4/i<",
        "TE;>;",
        "LF4/Y0;"
    }
.end annotation


# instance fields
.field private g:Ljava/lang/Object;

.field private h:LF4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LF4/l<",
            "-",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic i:LH4/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LH4/e<",
            "TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(LH4/e;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LH4/e$a;->i:LH4/e;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, LH4/f;->m()LK4/D;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, LH4/e$a;->g:Ljava/lang/Object;

    .line 11
    .line 12
    return-void
.end method

.method public static final synthetic b(LH4/e$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LH4/e$a;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic d(LH4/e$a;LF4/l;)V
    .locals 0

    .line 1
    iput-object p1, p0, LH4/e$a;->h:LF4/l;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic e(LH4/e$a;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, LH4/e$a;->g:Ljava/lang/Object;

    .line 2
    .line 3
    return-void
.end method

.method private final f(LH4/m;IJLl4/d;)Ljava/lang/Object;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH4/m<",
            "TE;>;IJ",
            "Ll4/d<",
            "-",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LH4/e$a;->i:LH4/e;

    .line 2
    .line 3
    invoke-static {p5}, Lm4/b;->c(Ll4/d;)Ll4/d;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, LF4/n;->b(Ll4/d;)LF4/l;

    .line 8
    .line 9
    .line 10
    move-result-object v6

    .line 11
    :try_start_0
    invoke-static {p0, v6}, LH4/e$a;->d(LH4/e$a;LF4/l;)V

    .line 12
    .line 13
    .line 14
    move-object v5, p0

    .line 15
    move-object v1, p1

    .line 16
    move v2, p2

    .line 17
    move-wide v3, p3

    .line 18
    invoke-static/range {v0 .. v5}, LH4/e;->B(LH4/e;LH4/m;IJLjava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {}, LH4/f;->r()LK4/D;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    if-ne p0, p1, :cond_0

    .line 27
    .line 28
    invoke-static {v0, v5, v1, v2}, LH4/e;->y(LH4/e;LF4/Y0;LH4/m;I)V

    .line 29
    .line 30
    .line 31
    goto/16 :goto_4

    .line 32
    .line 33
    :catchall_0
    move-exception v0

    .line 34
    move-object p0, v0

    .line 35
    goto/16 :goto_5

    .line 36
    .line 37
    :cond_0
    invoke-static {}, LH4/f;->h()LK4/D;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 p2, 0x1

    .line 42
    const/4 p3, 0x0

    .line 43
    if-ne p0, p1, :cond_a

    .line 44
    .line 45
    invoke-virtual {v0}, LH4/e;->h0()J

    .line 46
    .line 47
    .line 48
    move-result-wide p0

    .line 49
    cmp-long p0, v3, p0

    .line 50
    .line 51
    if-gez p0, :cond_1

    .line 52
    .line 53
    invoke-virtual {v1}, LK4/b;->c()V

    .line 54
    .line 55
    .line 56
    :cond_1
    invoke-static {}, LH4/e;->n()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p0, LH4/m;

    .line 65
    .line 66
    :goto_0
    invoke-virtual {v0}, LH4/e;->p0()Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_2

    .line 71
    .line 72
    invoke-static {v5}, LH4/e$a;->b(LH4/e$a;)V

    .line 73
    .line 74
    .line 75
    goto/16 :goto_4

    .line 76
    .line 77
    :cond_2
    invoke-static {}, LH4/e;->o()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 82
    .line 83
    .line 84
    move-result-wide v3

    .line 85
    sget p1, LH4/f;->b:I

    .line 86
    .line 87
    int-to-long v1, p1

    .line 88
    div-long v1, v3, v1

    .line 89
    .line 90
    int-to-long v7, p1

    .line 91
    rem-long v7, v3, v7

    .line 92
    .line 93
    long-to-int p1, v7

    .line 94
    iget-wide v7, p0, LK4/A;->i:J

    .line 95
    .line 96
    cmp-long p4, v7, v1

    .line 97
    .line 98
    if-eqz p4, :cond_4

    .line 99
    .line 100
    invoke-static {v0, v1, v2, p0}, LH4/e;->h(LH4/e;JLH4/m;)LH4/m;

    .line 101
    .line 102
    .line 103
    move-result-object p4

    .line 104
    if-nez p4, :cond_3

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_3
    move-object v1, p4

    .line 108
    :goto_1
    move v2, p1

    .line 109
    goto :goto_2

    .line 110
    :cond_4
    move-object v1, p0

    .line 111
    goto :goto_1

    .line 112
    :goto_2
    invoke-static/range {v0 .. v5}, LH4/e;->B(LH4/e;LH4/m;IJLjava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    move-object p4, v1

    .line 117
    invoke-static {}, LH4/f;->r()LK4/D;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    if-ne p0, p1, :cond_5

    .line 122
    .line 123
    invoke-static {v0, v5, p4, v2}, LH4/e;->y(LH4/e;LF4/Y0;LH4/m;I)V

    .line 124
    .line 125
    .line 126
    goto :goto_4

    .line 127
    :cond_5
    invoke-static {}, LH4/f;->h()LK4/D;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    if-ne p0, p1, :cond_7

    .line 132
    .line 133
    invoke-virtual {v0}, LH4/e;->h0()J

    .line 134
    .line 135
    .line 136
    move-result-wide p0

    .line 137
    cmp-long p0, v3, p0

    .line 138
    .line 139
    if-gez p0, :cond_6

    .line 140
    .line 141
    invoke-virtual {p4}, LK4/b;->c()V

    .line 142
    .line 143
    .line 144
    :cond_6
    move-object p0, p4

    .line 145
    goto :goto_0

    .line 146
    :cond_7
    invoke-static {}, LH4/f;->s()LK4/D;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    if-eq p0, p1, :cond_9

    .line 151
    .line 152
    invoke-virtual {p4}, LK4/b;->c()V

    .line 153
    .line 154
    .line 155
    invoke-static {v5, p0}, LH4/e$a;->e(LH4/e$a;Ljava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    invoke-static {v5, p3}, LH4/e$a;->d(LH4/e$a;LF4/l;)V

    .line 159
    .line 160
    .line 161
    invoke-static {p2}, Lkotlin/coroutines/jvm/internal/b;->a(Z)Ljava/lang/Boolean;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    iget-object p2, v0, LH4/e;->h:Lu4/l;

    .line 166
    .line 167
    if-eqz p2, :cond_8

    .line 168
    .line 169
    invoke-static {v0, p2, p0}, LH4/e;->f(LH4/e;Lu4/l;Ljava/lang/Object;)Lu4/q;

    .line 170
    .line 171
    .line 172
    move-result-object p3

    .line 173
    :cond_8
    :goto_3
    invoke-virtual {v6, p1, p3}, LF4/l;->N(Ljava/lang/Object;Lu4/q;)V

    .line 174
    .line 175
    .line 176
    goto :goto_4

    .line 177
    :cond_9
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 178
    .line 179
    const-string p1, "unexpected"

    .line 180
    .line 181
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    throw p0

    .line 185
    :cond_a
    invoke-virtual {v1}, LK4/b;->c()V

    .line 186
    .line 187
    .line 188
    invoke-static {v5, p0}, LH4/e$a;->e(LH4/e$a;Ljava/lang/Object;)V

    .line 189
    .line 190
    .line 191
    invoke-static {v5, p3}, LH4/e$a;->d(LH4/e$a;LF4/l;)V

    .line 192
    .line 193
    .line 194
    invoke-static {p2}, Lkotlin/coroutines/jvm/internal/b;->a(Z)Ljava/lang/Boolean;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    iget-object p2, v0, LH4/e;->h:Lu4/l;

    .line 199
    .line 200
    if-eqz p2, :cond_8

    .line 201
    .line 202
    invoke-static {v0, p2, p0}, LH4/e;->f(LH4/e;Lu4/l;Ljava/lang/Object;)Lu4/q;

    .line 203
    .line 204
    .line 205
    move-result-object p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 206
    goto :goto_3

    .line 207
    :goto_4
    invoke-virtual {v6}, LF4/l;->x()Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    if-ne p0, p1, :cond_b

    .line 216
    .line 217
    invoke-static {p5}, Lkotlin/coroutines/jvm/internal/h;->c(Ll4/d;)V

    .line 218
    .line 219
    .line 220
    :cond_b
    return-object p0

    .line 221
    :goto_5
    invoke-virtual {v6}, LF4/l;->L()V

    .line 222
    .line 223
    .line 224
    throw p0
.end method

.method private final g()Z
    .locals 1

    .line 1
    invoke-static {}, LH4/f;->z()LK4/D;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, LH4/e$a;->g:Ljava/lang/Object;

    .line 6
    .line 7
    iget-object p0, p0, LH4/e$a;->i:LH4/e;

    .line 8
    .line 9
    invoke-virtual {p0}, LH4/e;->X()Ljava/lang/Throwable;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_0
    invoke-static {p0}, LK4/C;->a(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    throw p0
.end method

.method private final h()V
    .locals 2

    .line 1
    iget-object v0, p0, LH4/e$a;->h:LF4/l;

    .line 2
    .line 3
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput-object v1, p0, LH4/e$a;->h:LF4/l;

    .line 8
    .line 9
    invoke-static {}, LH4/f;->z()LK4/D;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, p0, LH4/e$a;->g:Ljava/lang/Object;

    .line 14
    .line 15
    iget-object p0, p0, LH4/e$a;->i:LH4/e;

    .line 16
    .line 17
    invoke-virtual {p0}, LH4/e;->X()Ljava/lang/Throwable;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    sget-object p0, Lh4/m;->g:Lh4/m$a;

    .line 24
    .line 25
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-static {p0}, Lh4/m;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {v0, p0}, Ll4/d;->resumeWith(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    sget-object v1, Lh4/m;->g:Lh4/m$a;

    .line 36
    .line 37
    invoke-static {p0}, Lh4/n;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0}, Lh4/m;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-interface {v0, p0}, Ll4/d;->resumeWith(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method


# virtual methods
.method public a(Ll4/d;)Ljava/lang/Object;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/d<",
            "-",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LH4/e$a;->g:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {}, LH4/f;->m()LK4/D;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x1

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, LH4/e$a;->g:Ljava/lang/Object;

    .line 11
    .line 12
    invoke-static {}, LH4/f;->z()LK4/D;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-eq v0, v1, :cond_0

    .line 17
    .line 18
    goto/16 :goto_1

    .line 19
    .line 20
    :cond_0
    iget-object v3, p0, LH4/e$a;->i:LH4/e;

    .line 21
    .line 22
    invoke-static {}, LH4/e;->n()Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, LH4/m;

    .line 31
    .line 32
    :goto_0
    invoke-virtual {v3}, LH4/e;->p0()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    invoke-direct {p0}, LH4/e$a;->g()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    invoke-static {}, LH4/e;->o()Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1, v3}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 48
    .line 49
    .line 50
    move-result-wide v6

    .line 51
    sget v1, LH4/f;->b:I

    .line 52
    .line 53
    int-to-long v4, v1

    .line 54
    div-long v4, v6, v4

    .line 55
    .line 56
    int-to-long v8, v1

    .line 57
    rem-long v8, v6, v8

    .line 58
    .line 59
    long-to-int v1, v8

    .line 60
    iget-wide v8, v0, LK4/A;->i:J

    .line 61
    .line 62
    cmp-long v8, v8, v4

    .line 63
    .line 64
    if-eqz v8, :cond_2

    .line 65
    .line 66
    invoke-static {v3, v4, v5, v0}, LH4/e;->h(LH4/e;JLH4/m;)LH4/m;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    if-nez v4, :cond_3

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    move-object v4, v0

    .line 74
    :cond_3
    const/4 v8, 0x0

    .line 75
    move v5, v1

    .line 76
    invoke-static/range {v3 .. v8}, LH4/e;->B(LH4/e;LH4/m;IJLjava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {}, LH4/f;->r()LK4/D;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    if-eq v0, v1, :cond_7

    .line 85
    .line 86
    invoke-static {}, LH4/f;->h()LK4/D;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    if-ne v0, v1, :cond_5

    .line 91
    .line 92
    invoke-virtual {v3}, LH4/e;->h0()J

    .line 93
    .line 94
    .line 95
    move-result-wide v0

    .line 96
    cmp-long v0, v6, v0

    .line 97
    .line 98
    if-gez v0, :cond_4

    .line 99
    .line 100
    invoke-virtual {v4}, LK4/b;->c()V

    .line 101
    .line 102
    .line 103
    :cond_4
    move-object v0, v4

    .line 104
    goto :goto_0

    .line 105
    :cond_5
    invoke-static {}, LH4/f;->s()LK4/D;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    if-ne v0, v1, :cond_6

    .line 110
    .line 111
    move-object v9, p1

    .line 112
    move-wide v7, v6

    .line 113
    move v6, v5

    .line 114
    move-object v5, v4

    .line 115
    move-object v4, p0

    .line 116
    invoke-direct/range {v4 .. v9}, LH4/e$a;->f(LH4/m;IJLl4/d;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    return-object p0

    .line 121
    :cond_6
    move-object v5, v4

    .line 122
    move-object v4, p0

    .line 123
    invoke-virtual {v5}, LK4/b;->c()V

    .line 124
    .line 125
    .line 126
    iput-object v0, v4, LH4/e$a;->g:Ljava/lang/Object;

    .line 127
    .line 128
    :goto_1
    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/b;->a(Z)Ljava/lang/Boolean;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    return-object p0

    .line 133
    :cond_7
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 134
    .line 135
    const-string p1, "unreachable"

    .line 136
    .line 137
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    throw p0
.end method

.method public c(LK4/A;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LK4/A<",
            "*>;I)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LH4/e$a;->h:LF4/l;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, LF4/l;->c(LK4/A;I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final i(Ljava/lang/Object;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LH4/e$a;->h:LF4/l;

    .line 2
    .line 3
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput-object v1, p0, LH4/e$a;->h:LF4/l;

    .line 8
    .line 9
    iput-object p1, p0, LH4/e$a;->g:Ljava/lang/Object;

    .line 10
    .line 11
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    iget-object p0, p0, LH4/e$a;->i:LH4/e;

    .line 14
    .line 15
    iget-object v3, p0, LH4/e;->h:Lu4/l;

    .line 16
    .line 17
    if-eqz v3, :cond_0

    .line 18
    .line 19
    invoke-static {p0, v3, p1}, LH4/e;->f(LH4/e;Lu4/l;Ljava/lang/Object;)Lu4/q;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    :cond_0
    invoke-static {v0, v2, v1}, LH4/f;->u(LF4/k;Ljava/lang/Object;Lu4/q;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public final j()V
    .locals 2

    .line 1
    iget-object v0, p0, LH4/e$a;->h:LF4/l;

    .line 2
    .line 3
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput-object v1, p0, LH4/e$a;->h:LF4/l;

    .line 8
    .line 9
    invoke-static {}, LH4/f;->z()LK4/D;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, p0, LH4/e$a;->g:Ljava/lang/Object;

    .line 14
    .line 15
    iget-object p0, p0, LH4/e$a;->i:LH4/e;

    .line 16
    .line 17
    invoke-virtual {p0}, LH4/e;->X()Ljava/lang/Throwable;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    sget-object p0, Lh4/m;->g:Lh4/m$a;

    .line 24
    .line 25
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-static {p0}, Lh4/m;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {v0, p0}, Ll4/d;->resumeWith(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    sget-object v1, Lh4/m;->g:Lh4/m$a;

    .line 36
    .line 37
    invoke-static {p0}, Lh4/n;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0}, Lh4/m;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-interface {v0, p0}, Ll4/d;->resumeWith(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public next()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LH4/e$a;->g:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {}, LH4/f;->m()LK4/D;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-eq v0, v1, :cond_1

    .line 8
    .line 9
    invoke-static {}, LH4/f;->m()LK4/D;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, p0, LH4/e$a;->g:Ljava/lang/Object;

    .line 14
    .line 15
    invoke-static {}, LH4/f;->z()LK4/D;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_0
    iget-object p0, p0, LH4/e$a;->i:LH4/e;

    .line 23
    .line 24
    invoke-static {p0}, LH4/e;->j(LH4/e;)Ljava/lang/Throwable;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, LK4/C;->a(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    throw p0

    .line 33
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 34
    .line 35
    const-string v0, "`hasNext()` has not been invoked"

    .line 36
    .line 37
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw p0
.end method
