.class public Lw1/a;
.super Ljava/lang/Object;
.source "SpringChain.java"

# interfaces
.implements LW2/i;


# instance fields
.field public a:Z

.field private final b:LW2/k;

.field private final c:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "LW2/i;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "LW2/e;",
            ">;"
        }
    .end annotation
.end field

.field private e:I

.field private final f:LW2/g;

.field private final g:LW2/g;


# direct methods
.method private constructor <init>(IIII)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, LW2/k;->j()LW2/k;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lw1/a;->b:LW2/k;

    .line 9
    .line 10
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lw1/a;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 16
    .line 17
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lw1/a;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 23
    .line 24
    const/4 v0, -0x1

    .line 25
    iput v0, p0, Lw1/a;->e:I

    .line 26
    .line 27
    int-to-double v0, p1

    .line 28
    int-to-double p1, p2

    .line 29
    invoke-static {v0, v1, p1, p2}, LW2/g;->a(DD)LW2/g;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lw1/a;->f:LW2/g;

    .line 34
    .line 35
    int-to-double p1, p3

    .line 36
    int-to-double p3, p4

    .line 37
    invoke-static {p1, p2, p3, p4}, LW2/g;->a(DD)LW2/g;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lw1/a;->g:LW2/g;

    .line 42
    .line 43
    return-void
.end method

.method public static g(IIII)Lw1/a;
    .locals 1

    .line 1
    new-instance v0, Lw1/a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lw1/a;-><init>(IIII)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a(LW2/e;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lw1/a;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

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
    iget-object p0, p0, Lw1/a;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

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
    iget-object v0, p0, Lw1/a;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

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
    iget-object v2, p0, Lw1/a;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 12
    .line 13
    invoke-virtual {v2, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, LW2/i;

    .line 18
    .line 19
    iget v3, p0, Lw1/a;->e:I

    .line 20
    .line 21
    if-ne v0, v3, :cond_1

    .line 22
    .line 23
    add-int/lit8 v3, v0, -0x1

    .line 24
    .line 25
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    if-ge v0, v3, :cond_2

    .line 29
    .line 30
    add-int/lit8 v3, v0, -0x1

    .line 31
    .line 32
    move v0, v1

    .line 33
    goto :goto_0

    .line 34
    :cond_2
    if-le v0, v3, :cond_3

    .line 35
    .line 36
    add-int/lit8 v0, v0, 0x1

    .line 37
    .line 38
    move v3, v1

    .line 39
    goto :goto_0

    .line 40
    :cond_3
    move v0, v1

    .line 41
    move v3, v0

    .line 42
    :goto_0
    const/4 v4, 0x0

    .line 43
    const-wide/16 v5, 0x0

    .line 44
    .line 45
    if-le v0, v1, :cond_6

    .line 46
    .line 47
    iget-object v7, p0, Lw1/a;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 48
    .line 49
    invoke-virtual {v7}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 50
    .line 51
    .line 52
    move-result v7

    .line 53
    if-ge v0, v7, :cond_6

    .line 54
    .line 55
    add-int/lit8 v7, v0, 0x1

    .line 56
    .line 57
    iget v8, p0, Lw1/a;->e:I

    .line 58
    .line 59
    sub-int/2addr v7, v8

    .line 60
    iget-object v8, p0, Lw1/a;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 61
    .line 62
    invoke-virtual {v8, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v8

    .line 66
    check-cast v8, LW2/e;

    .line 67
    .line 68
    const/16 v9, 0x9

    .line 69
    .line 70
    if-gt v0, v9, :cond_5

    .line 71
    .line 72
    iget-boolean v0, p0, Lw1/a;->a:Z

    .line 73
    .line 74
    if-nez v0, :cond_4

    .line 75
    .line 76
    invoke-virtual {p1}, LW2/e;->e()D

    .line 77
    .line 78
    .line 79
    move-result-wide v9

    .line 80
    cmpl-double v0, v9, v5

    .line 81
    .line 82
    if-eqz v0, :cond_4

    .line 83
    .line 84
    invoke-virtual {p1}, LW2/e;->e()D

    .line 85
    .line 86
    .line 87
    move-result-wide v9

    .line 88
    double-to-float v0, v9

    .line 89
    mul-int/lit8 v7, v7, 0x1e

    .line 90
    .line 91
    int-to-float v7, v7

    .line 92
    add-float/2addr v0, v7

    .line 93
    goto :goto_1

    .line 94
    :cond_4
    invoke-virtual {p1}, LW2/e;->e()D

    .line 95
    .line 96
    .line 97
    move-result-wide v9

    .line 98
    double-to-float v0, v9

    .line 99
    goto :goto_1

    .line 100
    :cond_5
    move v0, v4

    .line 101
    :goto_1
    float-to-double v9, v0

    .line 102
    invoke-virtual {v8, v9, v10}, LW2/e;->n(D)LW2/e;

    .line 103
    .line 104
    .line 105
    :cond_6
    if-le v3, v1, :cond_9

    .line 106
    .line 107
    iget-object v0, p0, Lw1/a;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-ge v3, v0, :cond_9

    .line 114
    .line 115
    iget v0, p0, Lw1/a;->e:I

    .line 116
    .line 117
    add-int/lit8 v0, v0, 0x1

    .line 118
    .line 119
    sub-int/2addr v0, v3

    .line 120
    iget-object v1, p0, Lw1/a;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 121
    .line 122
    invoke-virtual {v1, v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    check-cast v1, LW2/e;

    .line 127
    .line 128
    iget-object v7, p0, Lw1/a;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 129
    .line 130
    invoke-virtual {v7}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 131
    .line 132
    .line 133
    move-result v7

    .line 134
    add-int/lit8 v7, v7, -0xa

    .line 135
    .line 136
    if-lt v3, v7, :cond_8

    .line 137
    .line 138
    iget-boolean p0, p0, Lw1/a;->a:Z

    .line 139
    .line 140
    if-nez p0, :cond_7

    .line 141
    .line 142
    invoke-virtual {p1}, LW2/e;->e()D

    .line 143
    .line 144
    .line 145
    move-result-wide v3

    .line 146
    cmpl-double p0, v3, v5

    .line 147
    .line 148
    if-eqz p0, :cond_7

    .line 149
    .line 150
    invoke-virtual {p1}, LW2/e;->e()D

    .line 151
    .line 152
    .line 153
    move-result-wide v3

    .line 154
    double-to-float p0, v3

    .line 155
    mul-int/lit8 v0, v0, 0x1e

    .line 156
    .line 157
    int-to-float v0, v0

    .line 158
    sub-float v4, p0, v0

    .line 159
    .line 160
    goto :goto_2

    .line 161
    :cond_7
    invoke-virtual {p1}, LW2/e;->e()D

    .line 162
    .line 163
    .line 164
    move-result-wide v3

    .line 165
    double-to-float v4, v3

    .line 166
    :cond_8
    :goto_2
    float-to-double v3, v4

    .line 167
    invoke-virtual {v1, v3, v4}, LW2/e;->n(D)LW2/e;

    .line 168
    .line 169
    .line 170
    :cond_9
    invoke-interface {v2, p1}, LW2/i;->b(LW2/e;)V

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public c(LW2/e;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lw1/a;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

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
    iget-object p0, p0, Lw1/a;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

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
    iget-object v0, p0, Lw1/a;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

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
    iget-object p0, p0, Lw1/a;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

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

.method public e(LW2/i;)Lw1/a;
    .locals 2

    .line 1
    iget-object v0, p0, Lw1/a;->b:LW2/k;

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
    iget-object v1, p0, Lw1/a;->g:LW2/g;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, LW2/e;->q(LW2/g;)LW2/e;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lw1/a;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lw1/a;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    return-object p0
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lw1/a;->b:LW2/k;

    .line 2
    .line 3
    invoke-virtual {v0}, LW2/b;->i()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lw1/a;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lw1/a;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public h()Ljava/util/List;
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
    iget-object p0, p0, Lw1/a;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()LW2/e;
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
    iget v1, p0, Lw1/a;->e:I

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
    const-string v1, "SpringLinearLayout"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget v0, p0, Lw1/a;->e:I

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
    iget-object p0, p0, Lw1/a;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

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

.method public j(I)Lw1/a;
    .locals 2

    .line 1
    iput p1, p0, Lw1/a;->e:I

    .line 2
    .line 3
    iget-object v0, p0, Lw1/a;->d:Ljava/util/concurrent/CopyOnWriteArrayList;

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
    iget-object p1, p0, Lw1/a;->b:LW2/k;

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
    iget-object v1, p0, Lw1/a;->g:LW2/g;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, LW2/e;->q(LW2/g;)LW2/e;

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {p0}, Lw1/a;->i()LW2/e;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    if-eqz p1, :cond_2

    .line 48
    .line 49
    iget-object v0, p0, Lw1/a;->f:LW2/g;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, LW2/e;->q(LW2/g;)LW2/e;

    .line 52
    .line 53
    .line 54
    :cond_2
    return-object p0
.end method
