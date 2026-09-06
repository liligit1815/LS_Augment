.class public Lcom/zte/mifavor/widget/q;
.super Ljava/lang/Object;
.source "SpringChain.java"

# interfaces
.implements LW2/i;


# instance fields
.field public a:Z

.field private b:I

.field private final c:LW2/k;

.field private final d:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "LW2/i;",
            ">;"
        }
    .end annotation
.end field

.field private final e:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "LW2/e;",
            ">;"
        }
    .end annotation
.end field

.field private f:I

.field private final g:LW2/g;

.field private final h:LW2/g;

.field private i:Ljava/lang/String;


# direct methods
.method private constructor <init>(IIII)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xa

    .line 5
    .line 6
    iput v0, p0, Lcom/zte/mifavor/widget/q;->b:I

    .line 7
    .line 8
    invoke-static {}, LW2/k;->j()LW2/k;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/zte/mifavor/widget/q;->c:LW2/k;

    .line 13
    .line 14
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/zte/mifavor/widget/q;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 20
    .line 21
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/zte/mifavor/widget/q;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 27
    .line 28
    const/4 v0, -0x1

    .line 29
    iput v0, p0, Lcom/zte/mifavor/widget/q;->f:I

    .line 30
    .line 31
    const-string v0, ""

    .line 32
    .line 33
    iput-object v0, p0, Lcom/zte/mifavor/widget/q;->i:Ljava/lang/String;

    .line 34
    .line 35
    int-to-double v0, p1

    .line 36
    int-to-double p1, p2

    .line 37
    invoke-static {v0, v1, p1, p2}, LW2/g;->a(DD)LW2/g;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/zte/mifavor/widget/q;->g:LW2/g;

    .line 42
    .line 43
    int-to-double p1, p3

    .line 44
    int-to-double p3, p4

    .line 45
    invoke-static {p1, p2, p3, p4}, LW2/g;->a(DD)LW2/g;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Lcom/zte/mifavor/widget/q;->h:LW2/g;

    .line 50
    .line 51
    return-void
.end method

.method public static f(IIII)Lcom/zte/mifavor/widget/q;
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/mifavor/widget/q;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/zte/mifavor/widget/q;-><init>(IIII)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a(LW2/e;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/q;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/zte/mifavor/widget/q;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, LW2/i;

    .line 18
    .line 19
    invoke-interface {p0, p1}, LW2/i;->a(LW2/e;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public b(LW2/e;)V
    .locals 11

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v2, "["

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    add-int/lit8 v2, v2, -0x4

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v0, "] "

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/zte/mifavor/widget/q;->i:Ljava/lang/String;

    .line 40
    .line 41
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/q;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->indexOf(Ljava/lang/Object;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const/4 v1, -0x1

    .line 48
    if-ne v0, v1, :cond_1

    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    iget-object v2, p0, Lcom/zte/mifavor/widget/q;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 52
    .line 53
    invoke-virtual {v2, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, LW2/i;

    .line 58
    .line 59
    iget v3, p0, Lcom/zte/mifavor/widget/q;->f:I

    .line 60
    .line 61
    if-ne v0, v3, :cond_2

    .line 62
    .line 63
    add-int/lit8 v3, v0, -0x1

    .line 64
    .line 65
    add-int/lit8 v0, v0, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    if-ge v0, v3, :cond_3

    .line 69
    .line 70
    add-int/lit8 v3, v0, -0x1

    .line 71
    .line 72
    move v0, v1

    .line 73
    goto :goto_0

    .line 74
    :cond_3
    if-le v0, v3, :cond_4

    .line 75
    .line 76
    add-int/lit8 v0, v0, 0x1

    .line 77
    .line 78
    move v3, v1

    .line 79
    goto :goto_0

    .line 80
    :cond_4
    move v0, v1

    .line 81
    move v3, v0

    .line 82
    :goto_0
    const/4 v4, 0x0

    .line 83
    const-wide/16 v5, 0x0

    .line 84
    .line 85
    if-le v0, v1, :cond_7

    .line 86
    .line 87
    iget-object v7, p0, Lcom/zte/mifavor/widget/q;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 88
    .line 89
    invoke-virtual {v7}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 90
    .line 91
    .line 92
    move-result v7

    .line 93
    if-ge v0, v7, :cond_7

    .line 94
    .line 95
    add-int/lit8 v7, v0, 0x1

    .line 96
    .line 97
    iget v8, p0, Lcom/zte/mifavor/widget/q;->f:I

    .line 98
    .line 99
    sub-int/2addr v7, v8

    .line 100
    iget-object v8, p0, Lcom/zte/mifavor/widget/q;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 101
    .line 102
    invoke-virtual {v8, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v8

    .line 106
    check-cast v8, LW2/e;

    .line 107
    .line 108
    iget v9, p0, Lcom/zte/mifavor/widget/q;->b:I

    .line 109
    .line 110
    if-gt v0, v9, :cond_6

    .line 111
    .line 112
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/q;->a:Z

    .line 113
    .line 114
    if-nez v0, :cond_5

    .line 115
    .line 116
    invoke-virtual {p1}, LW2/e;->e()D

    .line 117
    .line 118
    .line 119
    move-result-wide v9

    .line 120
    cmpl-double v0, v9, v5

    .line 121
    .line 122
    if-eqz v0, :cond_5

    .line 123
    .line 124
    invoke-virtual {p1}, LW2/e;->e()D

    .line 125
    .line 126
    .line 127
    move-result-wide v9

    .line 128
    double-to-float v0, v9

    .line 129
    mul-int/lit8 v7, v7, 0x1e

    .line 130
    .line 131
    int-to-float v7, v7

    .line 132
    add-float/2addr v0, v7

    .line 133
    goto :goto_1

    .line 134
    :cond_5
    invoke-virtual {p1}, LW2/e;->e()D

    .line 135
    .line 136
    .line 137
    move-result-wide v9

    .line 138
    double-to-float v0, v9

    .line 139
    goto :goto_1

    .line 140
    :cond_6
    move v0, v4

    .line 141
    :goto_1
    float-to-double v9, v0

    .line 142
    invoke-virtual {v8, v9, v10}, LW2/e;->n(D)LW2/e;

    .line 143
    .line 144
    .line 145
    :cond_7
    if-le v3, v1, :cond_a

    .line 146
    .line 147
    iget-object v0, p0, Lcom/zte/mifavor/widget/q;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-ge v3, v0, :cond_a

    .line 154
    .line 155
    iget v0, p0, Lcom/zte/mifavor/widget/q;->f:I

    .line 156
    .line 157
    add-int/lit8 v0, v0, 0x1

    .line 158
    .line 159
    sub-int/2addr v0, v3

    .line 160
    iget-object v1, p0, Lcom/zte/mifavor/widget/q;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 161
    .line 162
    invoke-virtual {v1, v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    check-cast v1, LW2/e;

    .line 167
    .line 168
    iget-object v7, p0, Lcom/zte/mifavor/widget/q;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 169
    .line 170
    invoke-virtual {v7}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 171
    .line 172
    .line 173
    move-result v7

    .line 174
    add-int/lit8 v7, v7, -0x1

    .line 175
    .line 176
    iget v8, p0, Lcom/zte/mifavor/widget/q;->b:I

    .line 177
    .line 178
    sub-int/2addr v7, v8

    .line 179
    if-lt v3, v7, :cond_9

    .line 180
    .line 181
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/q;->a:Z

    .line 182
    .line 183
    if-nez p0, :cond_8

    .line 184
    .line 185
    invoke-virtual {p1}, LW2/e;->e()D

    .line 186
    .line 187
    .line 188
    move-result-wide v3

    .line 189
    cmpl-double p0, v3, v5

    .line 190
    .line 191
    if-eqz p0, :cond_8

    .line 192
    .line 193
    invoke-virtual {p1}, LW2/e;->e()D

    .line 194
    .line 195
    .line 196
    move-result-wide v3

    .line 197
    double-to-float p0, v3

    .line 198
    mul-int/lit8 v0, v0, 0x1e

    .line 199
    .line 200
    int-to-float v0, v0

    .line 201
    sub-float v4, p0, v0

    .line 202
    .line 203
    goto :goto_2

    .line 204
    :cond_8
    invoke-virtual {p1}, LW2/e;->e()D

    .line 205
    .line 206
    .line 207
    move-result-wide v3

    .line 208
    double-to-float v4, v3

    .line 209
    :cond_9
    :goto_2
    float-to-double v3, v4

    .line 210
    invoke-virtual {v1, v3, v4}, LW2/e;->n(D)LW2/e;

    .line 211
    .line 212
    .line 213
    :cond_a
    invoke-interface {v2, p1}, LW2/i;->b(LW2/e;)V

    .line 214
    .line 215
    .line 216
    return-void
.end method

.method public c(LW2/e;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/q;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/zte/mifavor/widget/q;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, LW2/i;

    .line 18
    .line 19
    invoke-interface {p0, p1}, LW2/i;->c(LW2/e;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public d(LW2/e;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/q;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/zte/mifavor/widget/q;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, LW2/i;

    .line 18
    .line 19
    invoke-interface {p0, p1}, LW2/i;->d(LW2/e;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public e(LW2/i;)Lcom/zte/mifavor/widget/q;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/q;->c:LW2/k;

    .line 2
    .line 3
    invoke-virtual {v0}, LW2/b;->c()LW2/e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, LW2/e;->a(LW2/i;)LW2/e;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/zte/mifavor/widget/q;->h:LW2/g;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, LW2/e;->q(LW2/g;)LW2/e;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/zte/mifavor/widget/q;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/zte/mifavor/widget/q;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    new-instance p1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v1, "add Spring, spring = "

    .line 33
    .line 34
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const-string v0, "Scroll#SpringChain"

    .line 45
    .line 46
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    return-object p0
.end method

.method public g()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LW2/e;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/q;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()LW2/e;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "getControlSpring mControlSpringIndex="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lcom/zte/mifavor/widget/q;->f:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "Scroll#SpringChain"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget v0, p0, Lcom/zte/mifavor/widget/q;->f:I

    .line 26
    .line 27
    const/4 v1, -0x1

    .line 28
    if-ne v0, v1, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return-object p0

    .line 32
    :cond_0
    iget-object p0, p0, Lcom/zte/mifavor/widget/q;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, LW2/e;

    .line 39
    .line 40
    return-object p0
.end method

.method public i()I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "get Max Spring ID = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lcom/zte/mifavor/widget/q;->b:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "Scroll#SpringChain"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget p0, p0, Lcom/zte/mifavor/widget/q;->b:I

    .line 26
    .line 27
    return p0
.end method

.method public j(I)Lcom/zte/mifavor/widget/q;
    .locals 2

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/q;->f:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/zte/mifavor/widget/q;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, LW2/e;

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object p1, p0, Lcom/zte/mifavor/widget/q;->c:LW2/k;

    .line 16
    .line 17
    invoke-virtual {p1}, LW2/b;->e()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, LW2/e;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/zte/mifavor/widget/q;->h:LW2/g;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, LW2/e;->q(LW2/g;)LW2/e;

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/q;->h()LW2/e;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    if-eqz p1, :cond_2

    .line 48
    .line 49
    iget-object v0, p0, Lcom/zte/mifavor/widget/q;->g:LW2/g;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, LW2/e;->q(LW2/g;)LW2/e;

    .line 52
    .line 53
    .line 54
    :cond_2
    return-object p0
.end method

.method public k(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/q;->b:I

    .line 2
    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v0, "set Max Spring ID = "

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget p0, p0, Lcom/zte/mifavor/widget/q;->b:I

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "Scroll#SpringChain"

    .line 23
    .line 24
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    return-void
.end method
