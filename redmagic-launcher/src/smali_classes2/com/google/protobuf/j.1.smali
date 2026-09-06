.class final Lcom/google/protobuf/j;
.super Ljava/lang/Object;
.source "CodedInputStreamReader.java"

# interfaces
.implements Lcom/google/protobuf/i0;


# instance fields
.field private final a:Lcom/google/protobuf/i;

.field private b:I

.field private c:I

.field private d:I


# direct methods
.method private constructor <init>(Lcom/google/protobuf/i;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/google/protobuf/j;->d:I

    .line 6
    .line 7
    const-string v0, "input"

    .line 8
    .line 9
    invoke-static {p1, v0}, Lcom/google/protobuf/A;->b(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/google/protobuf/i;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 16
    .line 17
    iput-object p0, p1, Lcom/google/protobuf/i;->d:Lcom/google/protobuf/j;

    .line 18
    .line 19
    return-void
.end method

.method public static P(Lcom/google/protobuf/i;)Lcom/google/protobuf/j;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/i;->d:Lcom/google/protobuf/j;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    new-instance v0, Lcom/google/protobuf/j;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Lcom/google/protobuf/j;-><init>(Lcom/google/protobuf/i;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method private Q(Ljava/lang/Object;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/google/protobuf/j0<",
            "TT;>;",
            "Lcom/google/protobuf/p;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/protobuf/j;->c:I

    .line 2
    .line 3
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 4
    .line 5
    invoke-static {v1}, Lcom/google/protobuf/w0;->a(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x4

    .line 10
    invoke-static {v1, v2}, Lcom/google/protobuf/w0;->c(II)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iput v1, p0, Lcom/google/protobuf/j;->c:I

    .line 15
    .line 16
    :try_start_0
    invoke-interface {p2, p1, p0, p3}, Lcom/google/protobuf/j0;->h(Ljava/lang/Object;Lcom/google/protobuf/i0;Lcom/google/protobuf/p;)V

    .line 17
    .line 18
    .line 19
    iget p1, p0, Lcom/google/protobuf/j;->b:I

    .line 20
    .line 21
    iget p2, p0, Lcom/google/protobuf/j;->c:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    if-ne p1, p2, :cond_0

    .line 24
    .line 25
    iput v0, p0, Lcom/google/protobuf/j;->c:I

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/google/protobuf/B;->h()Lcom/google/protobuf/B;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    :catchall_0
    move-exception p1

    .line 34
    iput v0, p0, Lcom/google/protobuf/j;->c:I

    .line 35
    .line 36
    throw p1
.end method

.method private R(Ljava/lang/Object;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/google/protobuf/j0<",
            "TT;>;",
            "Lcom/google/protobuf/p;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/i;->F()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 8
    .line 9
    iget v2, v1, Lcom/google/protobuf/i;->a:I

    .line 10
    .line 11
    iget v3, v1, Lcom/google/protobuf/i;->b:I

    .line 12
    .line 13
    if-ge v2, v3, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Lcom/google/protobuf/i;->n(I)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 20
    .line 21
    iget v2, v1, Lcom/google/protobuf/i;->a:I

    .line 22
    .line 23
    add-int/lit8 v2, v2, 0x1

    .line 24
    .line 25
    iput v2, v1, Lcom/google/protobuf/i;->a:I

    .line 26
    .line 27
    invoke-interface {p2, p1, p0, p3}, Lcom/google/protobuf/j0;->h(Ljava/lang/Object;Lcom/google/protobuf/i0;Lcom/google/protobuf/p;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 31
    .line 32
    const/4 p2, 0x0

    .line 33
    invoke-virtual {p1, p2}, Lcom/google/protobuf/i;->a(I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 37
    .line 38
    iget p1, p0, Lcom/google/protobuf/i;->a:I

    .line 39
    .line 40
    add-int/lit8 p1, p1, -0x1

    .line 41
    .line 42
    iput p1, p0, Lcom/google/protobuf/i;->a:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Lcom/google/protobuf/i;->m(I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    invoke-static {}, Lcom/google/protobuf/B;->i()Lcom/google/protobuf/B;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    throw p0
.end method

.method private S(Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/j0<",
            "TT;>;",
            "Lcom/google/protobuf/p;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-interface {p1}, Lcom/google/protobuf/j0;->f()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0, p1, p2}, Lcom/google/protobuf/j;->Q(Ljava/lang/Object;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1, v0}, Lcom/google/protobuf/j0;->c(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method private T(Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/j0<",
            "TT;>;",
            "Lcom/google/protobuf/p;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-interface {p1}, Lcom/google/protobuf/j0;->f()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0, p1, p2}, Lcom/google/protobuf/j;->R(Ljava/lang/Object;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1, v0}, Lcom/google/protobuf/j0;->c(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method private V(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/i;->d()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-ne p0, p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Lcom/google/protobuf/B;->m()Lcom/google/protobuf/B;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    throw p0
.end method

.method private W(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget p0, p0, Lcom/google/protobuf/j;->b:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/w0;->b(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-ne p0, p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    throw p0
.end method

.method private X(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    and-int/lit8 p0, p1, 0x3

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Lcom/google/protobuf/B;->h()Lcom/google/protobuf/B;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    throw p0
.end method

.method private Y(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    and-int/lit8 p0, p1, 0x7

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Lcom/google/protobuf/B;->h()Lcom/google/protobuf/B;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    throw p0
.end method


# virtual methods
.method public A(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/protobuf/J;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    move-object v0, p1

    .line 8
    check-cast v0, Lcom/google/protobuf/J;

    .line 9
    .line 10
    iget p1, p0, Lcom/google/protobuf/j;->b:I

    .line 11
    .line 12
    invoke-static {p1}, Lcom/google/protobuf/w0;->b(I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eq p1, v2, :cond_2

    .line 17
    .line 18
    if-ne p1, v1, :cond_1

    .line 19
    .line 20
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/google/protobuf/i;->F()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-direct {p0, p1}, Lcom/google/protobuf/j;->Y(I)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    add-int/2addr v1, p1

    .line 36
    :cond_0
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/google/protobuf/i;->z()J

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    invoke-virtual {v0, v2, v3}, Lcom/google/protobuf/J;->n(J)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/google/protobuf/i;->d()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-lt p1, v1, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    throw p0

    .line 59
    :cond_2
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/google/protobuf/i;->z()J

    .line 62
    .line 63
    .line 64
    move-result-wide v1

    .line 65
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/J;->n(J)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/google/protobuf/i;->e()Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_3

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_3
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/google/protobuf/i;->E()I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 84
    .line 85
    if-eq p1, v1, :cond_2

    .line 86
    .line 87
    iput p1, p0, Lcom/google/protobuf/j;->d:I

    .line 88
    .line 89
    return-void

    .line 90
    :cond_4
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 91
    .line 92
    invoke-static {v0}, Lcom/google/protobuf/w0;->b(I)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eq v0, v2, :cond_7

    .line 97
    .line 98
    if-ne v0, v1, :cond_6

    .line 99
    .line 100
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 101
    .line 102
    invoke-virtual {v0}, Lcom/google/protobuf/i;->F()I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->Y(I)V

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 110
    .line 111
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    add-int/2addr v1, v0

    .line 116
    :cond_5
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 117
    .line 118
    invoke-virtual {v0}, Lcom/google/protobuf/i;->z()J

    .line 119
    .line 120
    .line 121
    move-result-wide v2

    .line 122
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 130
    .line 131
    invoke-virtual {v0}, Lcom/google/protobuf/i;->d()I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-lt v0, v1, :cond_5

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_6
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    throw p0

    .line 143
    :cond_7
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 144
    .line 145
    invoke-virtual {v0}, Lcom/google/protobuf/i;->z()J

    .line 146
    .line 147
    .line 148
    move-result-wide v0

    .line 149
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 157
    .line 158
    invoke-virtual {v0}, Lcom/google/protobuf/i;->e()Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-eqz v0, :cond_8

    .line 163
    .line 164
    :goto_0
    return-void

    .line 165
    :cond_8
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 166
    .line 167
    invoke-virtual {v0}, Lcom/google/protobuf/i;->E()I

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 172
    .line 173
    if-eq v0, v1, :cond_7

    .line 174
    .line 175
    iput v0, p0, Lcom/google/protobuf/j;->d:I

    .line 176
    .line 177
    return-void
.end method

.method public B(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/protobuf/z;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    move-object v0, p1

    .line 7
    check-cast v0, Lcom/google/protobuf/z;

    .line 8
    .line 9
    iget p1, p0, Lcom/google/protobuf/j;->b:I

    .line 10
    .line 11
    invoke-static {p1}, Lcom/google/protobuf/w0;->b(I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    if-ne p1, v1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/google/protobuf/i;->F()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    add-int/2addr v1, p1

    .line 32
    :cond_0
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/google/protobuf/i;->v()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-virtual {v0, p1}, Lcom/google/protobuf/z;->i(I)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/google/protobuf/i;->d()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-lt p1, v1, :cond_0

    .line 48
    .line 49
    invoke-direct {p0, v1}, Lcom/google/protobuf/j;->V(I)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    throw p0

    .line 58
    :cond_2
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/google/protobuf/i;->v()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    invoke-virtual {v0, p1}, Lcom/google/protobuf/z;->i(I)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/google/protobuf/i;->e()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/google/protobuf/i;->E()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 83
    .line 84
    if-eq p1, v1, :cond_2

    .line 85
    .line 86
    iput p1, p0, Lcom/google/protobuf/j;->d:I

    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 90
    .line 91
    invoke-static {v0}, Lcom/google/protobuf/w0;->b(I)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_7

    .line 96
    .line 97
    if-ne v0, v1, :cond_6

    .line 98
    .line 99
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/google/protobuf/i;->F()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr v1, v0

    .line 112
    :cond_5
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/google/protobuf/i;->v()I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 126
    .line 127
    invoke-virtual {v0}, Lcom/google/protobuf/i;->d()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-lt v0, v1, :cond_5

    .line 132
    .line 133
    invoke-direct {p0, v1}, Lcom/google/protobuf/j;->V(I)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_6
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    throw p0

    .line 142
    :cond_7
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/google/protobuf/i;->v()I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/google/protobuf/i;->e()Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_8

    .line 162
    .line 163
    :goto_0
    return-void

    .line 164
    :cond_8
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 165
    .line 166
    invoke-virtual {v0}, Lcom/google/protobuf/i;->E()I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 171
    .line 172
    if-eq v0, v1, :cond_7

    .line 173
    .line 174
    iput v0, p0, Lcom/google/protobuf/j;->d:I

    .line 175
    .line 176
    return-void
.end method

.method public C(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/protobuf/z;

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    const/4 v2, 0x2

    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    move-object v0, p1

    .line 8
    check-cast v0, Lcom/google/protobuf/z;

    .line 9
    .line 10
    iget p1, p0, Lcom/google/protobuf/j;->b:I

    .line 11
    .line 12
    invoke-static {p1}, Lcom/google/protobuf/w0;->b(I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eq p1, v2, :cond_3

    .line 17
    .line 18
    if-ne p1, v1, :cond_2

    .line 19
    .line 20
    :cond_0
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/google/protobuf/i;->s()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {v0, p1}, Lcom/google/protobuf/z;->i(I)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/google/protobuf/i;->e()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :cond_1
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/google/protobuf/i;->E()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 46
    .line 47
    if-eq p1, v1, :cond_0

    .line 48
    .line 49
    iput p1, p0, Lcom/google/protobuf/j;->d:I

    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    throw p0

    .line 57
    :cond_3
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/google/protobuf/i;->F()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    invoke-direct {p0, p1}, Lcom/google/protobuf/j;->X(I)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    add-int v3, v1, p1

    .line 73
    .line 74
    :cond_4
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/google/protobuf/i;->s()I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    invoke-virtual {v0, p1}, Lcom/google/protobuf/z;->i(I)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 84
    .line 85
    invoke-virtual {p1}, Lcom/google/protobuf/i;->d()I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-lt p1, v3, :cond_4

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_5
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 93
    .line 94
    invoke-static {v0}, Lcom/google/protobuf/w0;->b(I)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eq v0, v2, :cond_9

    .line 99
    .line 100
    if-ne v0, v1, :cond_8

    .line 101
    .line 102
    :cond_6
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 103
    .line 104
    invoke-virtual {v0}, Lcom/google/protobuf/i;->s()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 116
    .line 117
    invoke-virtual {v0}, Lcom/google/protobuf/i;->e()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_7

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_7
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 125
    .line 126
    invoke-virtual {v0}, Lcom/google/protobuf/i;->E()I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 131
    .line 132
    if-eq v0, v1, :cond_6

    .line 133
    .line 134
    iput v0, p0, Lcom/google/protobuf/j;->d:I

    .line 135
    .line 136
    return-void

    .line 137
    :cond_8
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    throw p0

    .line 142
    :cond_9
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/google/protobuf/i;->F()I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->X(I)V

    .line 149
    .line 150
    .line 151
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 152
    .line 153
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    add-int/2addr v1, v0

    .line 158
    :cond_a
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 159
    .line 160
    invoke-virtual {v0}, Lcom/google/protobuf/i;->s()I

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 172
    .line 173
    invoke-virtual {v0}, Lcom/google/protobuf/i;->d()I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-lt v0, v1, :cond_a

    .line 178
    .line 179
    :goto_0
    return-void
.end method

.method public D()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/protobuf/i;->B()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public E()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/protobuf/i;->C()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public F()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/protobuf/j;->d:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput v0, p0, Lcom/google/protobuf/j;->b:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/google/protobuf/j;->d:I

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/google/protobuf/i;->E()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Lcom/google/protobuf/j;->b:I

    .line 18
    .line 19
    :goto_0
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget p0, p0, Lcom/google/protobuf/j;->c:I

    .line 24
    .line 25
    if-ne v0, p0, :cond_1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    invoke-static {v0}, Lcom/google/protobuf/w0;->a(I)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :cond_2
    :goto_1
    const p0, 0x7fffffff

    .line 34
    .line 35
    .line 36
    return p0
.end method

.method public G(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/j;->U(Ljava/util/List;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public H(Ljava/lang/Object;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/google/protobuf/j0<",
            "TT;>;",
            "Lcom/google/protobuf/p;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/j;->R(Ljava/lang/Object;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public I(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/protobuf/w;

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    const/4 v2, 0x2

    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    move-object v0, p1

    .line 8
    check-cast v0, Lcom/google/protobuf/w;

    .line 9
    .line 10
    iget p1, p0, Lcom/google/protobuf/j;->b:I

    .line 11
    .line 12
    invoke-static {p1}, Lcom/google/protobuf/w0;->b(I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eq p1, v2, :cond_3

    .line 17
    .line 18
    if-ne p1, v1, :cond_2

    .line 19
    .line 20
    :cond_0
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/google/protobuf/i;->u()F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {v0, p1}, Lcom/google/protobuf/w;->m(F)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/google/protobuf/i;->e()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :cond_1
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/google/protobuf/i;->E()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 46
    .line 47
    if-eq p1, v1, :cond_0

    .line 48
    .line 49
    iput p1, p0, Lcom/google/protobuf/j;->d:I

    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    throw p0

    .line 57
    :cond_3
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/google/protobuf/i;->F()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    invoke-direct {p0, p1}, Lcom/google/protobuf/j;->X(I)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    add-int v3, v1, p1

    .line 73
    .line 74
    :cond_4
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/google/protobuf/i;->u()F

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    invoke-virtual {v0, p1}, Lcom/google/protobuf/w;->m(F)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 84
    .line 85
    invoke-virtual {p1}, Lcom/google/protobuf/i;->d()I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-lt p1, v3, :cond_4

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_5
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 93
    .line 94
    invoke-static {v0}, Lcom/google/protobuf/w0;->b(I)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eq v0, v2, :cond_9

    .line 99
    .line 100
    if-ne v0, v1, :cond_8

    .line 101
    .line 102
    :cond_6
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 103
    .line 104
    invoke-virtual {v0}, Lcom/google/protobuf/i;->u()F

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 116
    .line 117
    invoke-virtual {v0}, Lcom/google/protobuf/i;->e()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_7

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_7
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 125
    .line 126
    invoke-virtual {v0}, Lcom/google/protobuf/i;->E()I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 131
    .line 132
    if-eq v0, v1, :cond_6

    .line 133
    .line 134
    iput v0, p0, Lcom/google/protobuf/j;->d:I

    .line 135
    .line 136
    return-void

    .line 137
    :cond_8
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    throw p0

    .line 142
    :cond_9
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/google/protobuf/i;->F()I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->X(I)V

    .line 149
    .line 150
    .line 151
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 152
    .line 153
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    add-int/2addr v1, v0

    .line 158
    :cond_a
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 159
    .line 160
    invoke-virtual {v0}, Lcom/google/protobuf/i;->u()F

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 172
    .line 173
    invoke-virtual {v0}, Lcom/google/protobuf/i;->d()I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-lt v0, v1, :cond_a

    .line 178
    .line 179
    :goto_0
    return-void
.end method

.method public J()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/i;->e()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 10
    .line 11
    iget v1, p0, Lcom/google/protobuf/j;->c:I

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lcom/google/protobuf/i;->H(I)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public K()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/protobuf/i;->y()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public L(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/protobuf/h;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/protobuf/w0;->b(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-ne v0, v1, :cond_2

    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/google/protobuf/j;->r()Lcom/google/protobuf/h;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/google/protobuf/i;->e()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/google/protobuf/i;->E()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 33
    .line 34
    if-eq v0, v1, :cond_0

    .line 35
    .line 36
    iput v0, p0, Lcom/google/protobuf/j;->d:I

    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    throw p0
.end method

.method public M(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/protobuf/m;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    move-object v0, p1

    .line 8
    check-cast v0, Lcom/google/protobuf/m;

    .line 9
    .line 10
    iget p1, p0, Lcom/google/protobuf/j;->b:I

    .line 11
    .line 12
    invoke-static {p1}, Lcom/google/protobuf/w0;->b(I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eq p1, v2, :cond_2

    .line 17
    .line 18
    if-ne p1, v1, :cond_1

    .line 19
    .line 20
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/google/protobuf/i;->F()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-direct {p0, p1}, Lcom/google/protobuf/j;->Y(I)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    add-int/2addr v1, p1

    .line 36
    :cond_0
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/google/protobuf/i;->q()D

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    invoke-virtual {v0, v2, v3}, Lcom/google/protobuf/m;->m(D)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/google/protobuf/i;->d()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-lt p1, v1, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    throw p0

    .line 59
    :cond_2
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/google/protobuf/i;->q()D

    .line 62
    .line 63
    .line 64
    move-result-wide v1

    .line 65
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/m;->m(D)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/google/protobuf/i;->e()Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_3

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_3
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/google/protobuf/i;->E()I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 84
    .line 85
    if-eq p1, v1, :cond_2

    .line 86
    .line 87
    iput p1, p0, Lcom/google/protobuf/j;->d:I

    .line 88
    .line 89
    return-void

    .line 90
    :cond_4
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 91
    .line 92
    invoke-static {v0}, Lcom/google/protobuf/w0;->b(I)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eq v0, v2, :cond_7

    .line 97
    .line 98
    if-ne v0, v1, :cond_6

    .line 99
    .line 100
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 101
    .line 102
    invoke-virtual {v0}, Lcom/google/protobuf/i;->F()I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->Y(I)V

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 110
    .line 111
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    add-int/2addr v1, v0

    .line 116
    :cond_5
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 117
    .line 118
    invoke-virtual {v0}, Lcom/google/protobuf/i;->q()D

    .line 119
    .line 120
    .line 121
    move-result-wide v2

    .line 122
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 130
    .line 131
    invoke-virtual {v0}, Lcom/google/protobuf/i;->d()I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-lt v0, v1, :cond_5

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_6
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    throw p0

    .line 143
    :cond_7
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 144
    .line 145
    invoke-virtual {v0}, Lcom/google/protobuf/i;->q()D

    .line 146
    .line 147
    .line 148
    move-result-wide v0

    .line 149
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 157
    .line 158
    invoke-virtual {v0}, Lcom/google/protobuf/i;->e()Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-eqz v0, :cond_8

    .line 163
    .line 164
    :goto_0
    return-void

    .line 165
    :cond_8
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 166
    .line 167
    invoke-virtual {v0}, Lcom/google/protobuf/i;->E()I

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 172
    .line 173
    if-eq v0, v1, :cond_7

    .line 174
    .line 175
    iput v0, p0, Lcom/google/protobuf/j;->d:I

    .line 176
    .line 177
    return-void
.end method

.method public N()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/protobuf/i;->w()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public O()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/protobuf/i;->D()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public U(Ljava/util/List;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/protobuf/w0;->b(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-ne v0, v1, :cond_5

    .line 9
    .line 10
    instance-of v0, p1, Lcom/google/protobuf/H;

    .line 11
    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    if-nez p2, :cond_2

    .line 15
    .line 16
    move-object v0, p1

    .line 17
    check-cast v0, Lcom/google/protobuf/H;

    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/google/protobuf/j;->r()Lcom/google/protobuf/h;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {v0, p1}, Lcom/google/protobuf/H;->d(Lcom/google/protobuf/h;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/google/protobuf/i;->e()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/google/protobuf/i;->E()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iget p2, p0, Lcom/google/protobuf/j;->b:I

    .line 42
    .line 43
    if-eq p1, p2, :cond_0

    .line 44
    .line 45
    iput p1, p0, Lcom/google/protobuf/j;->d:I

    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    if-eqz p2, :cond_3

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/google/protobuf/j;->O()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    goto :goto_0

    .line 55
    :cond_3
    invoke-virtual {p0}, Lcom/google/protobuf/j;->E()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    :goto_0
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/google/protobuf/i;->e()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_4

    .line 69
    .line 70
    :goto_1
    return-void

    .line 71
    :cond_4
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/google/protobuf/i;->E()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 78
    .line 79
    if-eq v0, v1, :cond_2

    .line 80
    .line 81
    iput v0, p0, Lcom/google/protobuf/j;->d:I

    .line 82
    .line 83
    return-void

    .line 84
    :cond_5
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    throw p0
.end method

.method public a()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/protobuf/i;->t()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public b(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/protobuf/z;

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    const/4 v2, 0x2

    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    move-object v0, p1

    .line 8
    check-cast v0, Lcom/google/protobuf/z;

    .line 9
    .line 10
    iget p1, p0, Lcom/google/protobuf/j;->b:I

    .line 11
    .line 12
    invoke-static {p1}, Lcom/google/protobuf/w0;->b(I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eq p1, v2, :cond_3

    .line 17
    .line 18
    if-ne p1, v1, :cond_2

    .line 19
    .line 20
    :cond_0
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/google/protobuf/i;->y()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {v0, p1}, Lcom/google/protobuf/z;->i(I)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/google/protobuf/i;->e()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :cond_1
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/google/protobuf/i;->E()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 46
    .line 47
    if-eq p1, v1, :cond_0

    .line 48
    .line 49
    iput p1, p0, Lcom/google/protobuf/j;->d:I

    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    throw p0

    .line 57
    :cond_3
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/google/protobuf/i;->F()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    invoke-direct {p0, p1}, Lcom/google/protobuf/j;->X(I)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    add-int v3, v1, p1

    .line 73
    .line 74
    :cond_4
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/google/protobuf/i;->y()I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    invoke-virtual {v0, p1}, Lcom/google/protobuf/z;->i(I)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 84
    .line 85
    invoke-virtual {p1}, Lcom/google/protobuf/i;->d()I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-lt p1, v3, :cond_4

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_5
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 93
    .line 94
    invoke-static {v0}, Lcom/google/protobuf/w0;->b(I)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eq v0, v2, :cond_9

    .line 99
    .line 100
    if-ne v0, v1, :cond_8

    .line 101
    .line 102
    :cond_6
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 103
    .line 104
    invoke-virtual {v0}, Lcom/google/protobuf/i;->y()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 116
    .line 117
    invoke-virtual {v0}, Lcom/google/protobuf/i;->e()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_7

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_7
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 125
    .line 126
    invoke-virtual {v0}, Lcom/google/protobuf/i;->E()I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 131
    .line 132
    if-eq v0, v1, :cond_6

    .line 133
    .line 134
    iput v0, p0, Lcom/google/protobuf/j;->d:I

    .line 135
    .line 136
    return-void

    .line 137
    :cond_8
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    throw p0

    .line 142
    :cond_9
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/google/protobuf/i;->F()I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->X(I)V

    .line 149
    .line 150
    .line 151
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 152
    .line 153
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    add-int/2addr v1, v0

    .line 158
    :cond_a
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 159
    .line 160
    invoke-virtual {v0}, Lcom/google/protobuf/i;->y()I

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 172
    .line 173
    invoke-virtual {v0}, Lcom/google/protobuf/i;->d()I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-lt v0, v1, :cond_a

    .line 178
    .line 179
    :goto_0
    return-void
.end method

.method public c(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/protobuf/J;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    move-object v0, p1

    .line 7
    check-cast v0, Lcom/google/protobuf/J;

    .line 8
    .line 9
    iget p1, p0, Lcom/google/protobuf/j;->b:I

    .line 10
    .line 11
    invoke-static {p1}, Lcom/google/protobuf/w0;->b(I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    if-ne p1, v1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/google/protobuf/i;->F()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    add-int/2addr v1, p1

    .line 32
    :cond_0
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/google/protobuf/i;->B()J

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    invoke-virtual {v0, v2, v3}, Lcom/google/protobuf/J;->n(J)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/google/protobuf/i;->d()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-lt p1, v1, :cond_0

    .line 48
    .line 49
    invoke-direct {p0, v1}, Lcom/google/protobuf/j;->V(I)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    throw p0

    .line 58
    :cond_2
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/google/protobuf/i;->B()J

    .line 61
    .line 62
    .line 63
    move-result-wide v1

    .line 64
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/J;->n(J)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/google/protobuf/i;->e()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/google/protobuf/i;->E()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 83
    .line 84
    if-eq p1, v1, :cond_2

    .line 85
    .line 86
    iput p1, p0, Lcom/google/protobuf/j;->d:I

    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 90
    .line 91
    invoke-static {v0}, Lcom/google/protobuf/w0;->b(I)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_7

    .line 96
    .line 97
    if-ne v0, v1, :cond_6

    .line 98
    .line 99
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/google/protobuf/i;->F()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr v1, v0

    .line 112
    :cond_5
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/google/protobuf/i;->B()J

    .line 115
    .line 116
    .line 117
    move-result-wide v2

    .line 118
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 126
    .line 127
    invoke-virtual {v0}, Lcom/google/protobuf/i;->d()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-lt v0, v1, :cond_5

    .line 132
    .line 133
    invoke-direct {p0, v1}, Lcom/google/protobuf/j;->V(I)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_6
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    throw p0

    .line 142
    :cond_7
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/google/protobuf/i;->B()J

    .line 145
    .line 146
    .line 147
    move-result-wide v0

    .line 148
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/google/protobuf/i;->e()Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_8

    .line 162
    .line 163
    :goto_0
    return-void

    .line 164
    :cond_8
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 165
    .line 166
    invoke-virtual {v0}, Lcom/google/protobuf/i;->E()I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 171
    .line 172
    if-eq v0, v1, :cond_7

    .line 173
    .line 174
    iput v0, p0, Lcom/google/protobuf/j;->d:I

    .line 175
    .line 176
    return-void
.end method

.method public d(Ljava/util/List;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;",
            "Lcom/google/protobuf/j0<",
            "TT;>;",
            "Lcom/google/protobuf/p;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/protobuf/w0;->b(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x3

    .line 8
    if-ne v0, v1, :cond_3

    .line 9
    .line 10
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 11
    .line 12
    :cond_0
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/j;->S(Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/google/protobuf/i;->e()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_2

    .line 26
    .line 27
    iget v1, p0, Lcom/google/protobuf/j;->d:I

    .line 28
    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/google/protobuf/i;->E()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eq v1, v0, :cond_0

    .line 39
    .line 40
    iput v1, p0, Lcom/google/protobuf/j;->d:I

    .line 41
    .line 42
    :cond_2
    :goto_0
    return-void

    .line 43
    :cond_3
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    throw p0
.end method

.method public e()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/protobuf/i;->o()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public f(Ljava/util/List;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;",
            "Lcom/google/protobuf/j0<",
            "TT;>;",
            "Lcom/google/protobuf/p;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/protobuf/w0;->b(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-ne v0, v1, :cond_3

    .line 9
    .line 10
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 11
    .line 12
    :cond_0
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/j;->T(Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/google/protobuf/i;->e()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_2

    .line 26
    .line 27
    iget v1, p0, Lcom/google/protobuf/j;->d:I

    .line 28
    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/google/protobuf/i;->E()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eq v1, v0, :cond_0

    .line 39
    .line 40
    iput v1, p0, Lcom/google/protobuf/j;->d:I

    .line 41
    .line 42
    :cond_2
    :goto_0
    return-void

    .line 43
    :cond_3
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    throw p0
.end method

.method public g()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/protobuf/i;->z()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public getTag()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/protobuf/j;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public h(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/protobuf/J;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    move-object v0, p1

    .line 7
    check-cast v0, Lcom/google/protobuf/J;

    .line 8
    .line 9
    iget p1, p0, Lcom/google/protobuf/j;->b:I

    .line 10
    .line 11
    invoke-static {p1}, Lcom/google/protobuf/w0;->b(I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    if-ne p1, v1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/google/protobuf/i;->F()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    add-int/2addr v1, p1

    .line 32
    :cond_0
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/google/protobuf/i;->G()J

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    invoke-virtual {v0, v2, v3}, Lcom/google/protobuf/J;->n(J)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/google/protobuf/i;->d()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-lt p1, v1, :cond_0

    .line 48
    .line 49
    invoke-direct {p0, v1}, Lcom/google/protobuf/j;->V(I)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    throw p0

    .line 58
    :cond_2
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/google/protobuf/i;->G()J

    .line 61
    .line 62
    .line 63
    move-result-wide v1

    .line 64
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/J;->n(J)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/google/protobuf/i;->e()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/google/protobuf/i;->E()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 83
    .line 84
    if-eq p1, v1, :cond_2

    .line 85
    .line 86
    iput p1, p0, Lcom/google/protobuf/j;->d:I

    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 90
    .line 91
    invoke-static {v0}, Lcom/google/protobuf/w0;->b(I)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_7

    .line 96
    .line 97
    if-ne v0, v1, :cond_6

    .line 98
    .line 99
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/google/protobuf/i;->F()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr v1, v0

    .line 112
    :cond_5
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/google/protobuf/i;->G()J

    .line 115
    .line 116
    .line 117
    move-result-wide v2

    .line 118
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 126
    .line 127
    invoke-virtual {v0}, Lcom/google/protobuf/i;->d()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-lt v0, v1, :cond_5

    .line 132
    .line 133
    invoke-direct {p0, v1}, Lcom/google/protobuf/j;->V(I)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_6
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    throw p0

    .line 142
    :cond_7
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/google/protobuf/i;->G()J

    .line 145
    .line 146
    .line 147
    move-result-wide v0

    .line 148
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/google/protobuf/i;->e()Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_8

    .line 162
    .line 163
    :goto_0
    return-void

    .line 164
    :cond_8
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 165
    .line 166
    invoke-virtual {v0}, Lcom/google/protobuf/i;->E()I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 171
    .line 172
    if-eq v0, v1, :cond_7

    .line 173
    .line 174
    iput v0, p0, Lcom/google/protobuf/j;->d:I

    .line 175
    .line 176
    return-void
.end method

.method public i()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/protobuf/i;->F()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public j(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/protobuf/J;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    move-object v0, p1

    .line 7
    check-cast v0, Lcom/google/protobuf/J;

    .line 8
    .line 9
    iget p1, p0, Lcom/google/protobuf/j;->b:I

    .line 10
    .line 11
    invoke-static {p1}, Lcom/google/protobuf/w0;->b(I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    if-ne p1, v1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/google/protobuf/i;->F()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    add-int/2addr v1, p1

    .line 32
    :cond_0
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/google/protobuf/i;->w()J

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    invoke-virtual {v0, v2, v3}, Lcom/google/protobuf/J;->n(J)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/google/protobuf/i;->d()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-lt p1, v1, :cond_0

    .line 48
    .line 49
    invoke-direct {p0, v1}, Lcom/google/protobuf/j;->V(I)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    throw p0

    .line 58
    :cond_2
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/google/protobuf/i;->w()J

    .line 61
    .line 62
    .line 63
    move-result-wide v1

    .line 64
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/J;->n(J)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/google/protobuf/i;->e()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/google/protobuf/i;->E()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 83
    .line 84
    if-eq p1, v1, :cond_2

    .line 85
    .line 86
    iput p1, p0, Lcom/google/protobuf/j;->d:I

    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 90
    .line 91
    invoke-static {v0}, Lcom/google/protobuf/w0;->b(I)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_7

    .line 96
    .line 97
    if-ne v0, v1, :cond_6

    .line 98
    .line 99
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/google/protobuf/i;->F()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr v1, v0

    .line 112
    :cond_5
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/google/protobuf/i;->w()J

    .line 115
    .line 116
    .line 117
    move-result-wide v2

    .line 118
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 126
    .line 127
    invoke-virtual {v0}, Lcom/google/protobuf/i;->d()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-lt v0, v1, :cond_5

    .line 132
    .line 133
    invoke-direct {p0, v1}, Lcom/google/protobuf/j;->V(I)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_6
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    throw p0

    .line 142
    :cond_7
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/google/protobuf/i;->w()J

    .line 145
    .line 146
    .line 147
    move-result-wide v0

    .line 148
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/google/protobuf/i;->e()Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_8

    .line 162
    .line 163
    :goto_0
    return-void

    .line 164
    :cond_8
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 165
    .line 166
    invoke-virtual {v0}, Lcom/google/protobuf/i;->E()I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 171
    .line 172
    if-eq v0, v1, :cond_7

    .line 173
    .line 174
    iput v0, p0, Lcom/google/protobuf/j;->d:I

    .line 175
    .line 176
    return-void
.end method

.method public k(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/protobuf/z;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    move-object v0, p1

    .line 7
    check-cast v0, Lcom/google/protobuf/z;

    .line 8
    .line 9
    iget p1, p0, Lcom/google/protobuf/j;->b:I

    .line 10
    .line 11
    invoke-static {p1}, Lcom/google/protobuf/w0;->b(I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    if-ne p1, v1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/google/protobuf/i;->F()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    add-int/2addr v1, p1

    .line 32
    :cond_0
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/google/protobuf/i;->r()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-virtual {v0, p1}, Lcom/google/protobuf/z;->i(I)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/google/protobuf/i;->d()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-lt p1, v1, :cond_0

    .line 48
    .line 49
    invoke-direct {p0, v1}, Lcom/google/protobuf/j;->V(I)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    throw p0

    .line 58
    :cond_2
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/google/protobuf/i;->r()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    invoke-virtual {v0, p1}, Lcom/google/protobuf/z;->i(I)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/google/protobuf/i;->e()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/google/protobuf/i;->E()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 83
    .line 84
    if-eq p1, v1, :cond_2

    .line 85
    .line 86
    iput p1, p0, Lcom/google/protobuf/j;->d:I

    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 90
    .line 91
    invoke-static {v0}, Lcom/google/protobuf/w0;->b(I)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_7

    .line 96
    .line 97
    if-ne v0, v1, :cond_6

    .line 98
    .line 99
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/google/protobuf/i;->F()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr v1, v0

    .line 112
    :cond_5
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/google/protobuf/i;->r()I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 126
    .line 127
    invoke-virtual {v0}, Lcom/google/protobuf/i;->d()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-lt v0, v1, :cond_5

    .line 132
    .line 133
    invoke-direct {p0, v1}, Lcom/google/protobuf/j;->V(I)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_6
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    throw p0

    .line 142
    :cond_7
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/google/protobuf/i;->r()I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/google/protobuf/i;->e()Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_8

    .line 162
    .line 163
    :goto_0
    return-void

    .line 164
    :cond_8
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 165
    .line 166
    invoke-virtual {v0}, Lcom/google/protobuf/i;->E()I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 171
    .line 172
    if-eq v0, v1, :cond_7

    .line 173
    .line 174
    iput v0, p0, Lcom/google/protobuf/j;->d:I

    .line 175
    .line 176
    return-void
.end method

.method public l()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/protobuf/i;->r()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public m()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/protobuf/i;->A()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public n(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/protobuf/f;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    move-object v0, p1

    .line 7
    check-cast v0, Lcom/google/protobuf/f;

    .line 8
    .line 9
    iget p1, p0, Lcom/google/protobuf/j;->b:I

    .line 10
    .line 11
    invoke-static {p1}, Lcom/google/protobuf/w0;->b(I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    if-ne p1, v1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/google/protobuf/i;->F()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    add-int/2addr v1, p1

    .line 32
    :cond_0
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/google/protobuf/i;->o()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-virtual {v0, p1}, Lcom/google/protobuf/f;->n(Z)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/google/protobuf/i;->d()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-lt p1, v1, :cond_0

    .line 48
    .line 49
    invoke-direct {p0, v1}, Lcom/google/protobuf/j;->V(I)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    throw p0

    .line 58
    :cond_2
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/google/protobuf/i;->o()Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    invoke-virtual {v0, p1}, Lcom/google/protobuf/f;->n(Z)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/google/protobuf/i;->e()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/google/protobuf/i;->E()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 83
    .line 84
    if-eq p1, v1, :cond_2

    .line 85
    .line 86
    iput p1, p0, Lcom/google/protobuf/j;->d:I

    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 90
    .line 91
    invoke-static {v0}, Lcom/google/protobuf/w0;->b(I)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_7

    .line 96
    .line 97
    if-ne v0, v1, :cond_6

    .line 98
    .line 99
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/google/protobuf/i;->F()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr v1, v0

    .line 112
    :cond_5
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/google/protobuf/i;->o()Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 126
    .line 127
    invoke-virtual {v0}, Lcom/google/protobuf/i;->d()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-lt v0, v1, :cond_5

    .line 132
    .line 133
    invoke-direct {p0, v1}, Lcom/google/protobuf/j;->V(I)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_6
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    throw p0

    .line 142
    :cond_7
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/google/protobuf/i;->o()Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/google/protobuf/i;->e()Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_8

    .line 162
    .line 163
    :goto_0
    return-void

    .line 164
    :cond_8
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 165
    .line 166
    invoke-virtual {v0}, Lcom/google/protobuf/i;->E()I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 171
    .line 172
    if-eq v0, v1, :cond_7

    .line 173
    .line 174
    iput v0, p0, Lcom/google/protobuf/j;->d:I

    .line 175
    .line 176
    return-void
.end method

.method public o(Ljava/lang/Class;Lcom/google/protobuf/p;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/protobuf/p;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    invoke-static {}, Lcom/google/protobuf/f0;->a()Lcom/google/protobuf/f0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p1}, Lcom/google/protobuf/f0;->c(Ljava/lang/Class;)Lcom/google/protobuf/j0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-direct {p0, p1, p2}, Lcom/google/protobuf/j;->S(Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public p(Ljava/util/Map;Lcom/google/protobuf/L$a;Lcom/google/protobuf/p;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map<",
            "TK;TV;>;",
            "Lcom/google/protobuf/L$a<",
            "TK;TV;>;",
            "Lcom/google/protobuf/p;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 p1, 0x2

    .line 2
    invoke-direct {p0, p1}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/i;->F()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/google/protobuf/i;->n(I)I

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    throw p0
.end method

.method public q(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/j;->U(Ljava/util/List;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public r()Lcom/google/protobuf/h;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/protobuf/i;->p()Lcom/google/protobuf/h;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public readDouble()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/protobuf/i;->q()D

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public readFloat()F
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/protobuf/i;->u()F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public s()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/protobuf/i;->v()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public t(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/protobuf/J;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    move-object v0, p1

    .line 8
    check-cast v0, Lcom/google/protobuf/J;

    .line 9
    .line 10
    iget p1, p0, Lcom/google/protobuf/j;->b:I

    .line 11
    .line 12
    invoke-static {p1}, Lcom/google/protobuf/w0;->b(I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eq p1, v2, :cond_2

    .line 17
    .line 18
    if-ne p1, v1, :cond_1

    .line 19
    .line 20
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/google/protobuf/i;->F()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-direct {p0, p1}, Lcom/google/protobuf/j;->Y(I)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    add-int/2addr v1, p1

    .line 36
    :cond_0
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/google/protobuf/i;->t()J

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    invoke-virtual {v0, v2, v3}, Lcom/google/protobuf/J;->n(J)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/google/protobuf/i;->d()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-lt p1, v1, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    throw p0

    .line 59
    :cond_2
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/google/protobuf/i;->t()J

    .line 62
    .line 63
    .line 64
    move-result-wide v1

    .line 65
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/J;->n(J)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/google/protobuf/i;->e()Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_3

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_3
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/google/protobuf/i;->E()I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 84
    .line 85
    if-eq p1, v1, :cond_2

    .line 86
    .line 87
    iput p1, p0, Lcom/google/protobuf/j;->d:I

    .line 88
    .line 89
    return-void

    .line 90
    :cond_4
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 91
    .line 92
    invoke-static {v0}, Lcom/google/protobuf/w0;->b(I)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eq v0, v2, :cond_7

    .line 97
    .line 98
    if-ne v0, v1, :cond_6

    .line 99
    .line 100
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 101
    .line 102
    invoke-virtual {v0}, Lcom/google/protobuf/i;->F()I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->Y(I)V

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 110
    .line 111
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    add-int/2addr v1, v0

    .line 116
    :cond_5
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 117
    .line 118
    invoke-virtual {v0}, Lcom/google/protobuf/i;->t()J

    .line 119
    .line 120
    .line 121
    move-result-wide v2

    .line 122
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 130
    .line 131
    invoke-virtual {v0}, Lcom/google/protobuf/i;->d()I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-lt v0, v1, :cond_5

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_6
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    throw p0

    .line 143
    :cond_7
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 144
    .line 145
    invoke-virtual {v0}, Lcom/google/protobuf/i;->t()J

    .line 146
    .line 147
    .line 148
    move-result-wide v0

    .line 149
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 157
    .line 158
    invoke-virtual {v0}, Lcom/google/protobuf/i;->e()Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-eqz v0, :cond_8

    .line 163
    .line 164
    :goto_0
    return-void

    .line 165
    :cond_8
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 166
    .line 167
    invoke-virtual {v0}, Lcom/google/protobuf/i;->E()I

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 172
    .line 173
    if-eq v0, v1, :cond_7

    .line 174
    .line 175
    iput v0, p0, Lcom/google/protobuf/j;->d:I

    .line 176
    .line 177
    return-void
.end method

.method public u(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/protobuf/z;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    move-object v0, p1

    .line 7
    check-cast v0, Lcom/google/protobuf/z;

    .line 8
    .line 9
    iget p1, p0, Lcom/google/protobuf/j;->b:I

    .line 10
    .line 11
    invoke-static {p1}, Lcom/google/protobuf/w0;->b(I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    if-ne p1, v1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/google/protobuf/i;->F()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    add-int/2addr v1, p1

    .line 32
    :cond_0
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/google/protobuf/i;->A()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-virtual {v0, p1}, Lcom/google/protobuf/z;->i(I)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/google/protobuf/i;->d()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-lt p1, v1, :cond_0

    .line 48
    .line 49
    invoke-direct {p0, v1}, Lcom/google/protobuf/j;->V(I)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    throw p0

    .line 58
    :cond_2
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/google/protobuf/i;->A()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    invoke-virtual {v0, p1}, Lcom/google/protobuf/z;->i(I)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/google/protobuf/i;->e()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/google/protobuf/i;->E()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 83
    .line 84
    if-eq p1, v1, :cond_2

    .line 85
    .line 86
    iput p1, p0, Lcom/google/protobuf/j;->d:I

    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 90
    .line 91
    invoke-static {v0}, Lcom/google/protobuf/w0;->b(I)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_7

    .line 96
    .line 97
    if-ne v0, v1, :cond_6

    .line 98
    .line 99
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/google/protobuf/i;->F()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr v1, v0

    .line 112
    :cond_5
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/google/protobuf/i;->A()I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 126
    .line 127
    invoke-virtual {v0}, Lcom/google/protobuf/i;->d()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-lt v0, v1, :cond_5

    .line 132
    .line 133
    invoke-direct {p0, v1}, Lcom/google/protobuf/j;->V(I)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_6
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    throw p0

    .line 142
    :cond_7
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/google/protobuf/i;->A()I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/google/protobuf/i;->e()Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_8

    .line 162
    .line 163
    :goto_0
    return-void

    .line 164
    :cond_8
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 165
    .line 166
    invoke-virtual {v0}, Lcom/google/protobuf/i;->E()I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 171
    .line 172
    if-eq v0, v1, :cond_7

    .line 173
    .line 174
    iput v0, p0, Lcom/google/protobuf/j;->d:I

    .line 175
    .line 176
    return-void
.end method

.method public v()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/protobuf/i;->G()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public w(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/protobuf/z;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    move-object v0, p1

    .line 7
    check-cast v0, Lcom/google/protobuf/z;

    .line 8
    .line 9
    iget p1, p0, Lcom/google/protobuf/j;->b:I

    .line 10
    .line 11
    invoke-static {p1}, Lcom/google/protobuf/w0;->b(I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    if-ne p1, v1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/google/protobuf/i;->F()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    add-int/2addr v1, p1

    .line 32
    :cond_0
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/google/protobuf/i;->F()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-virtual {v0, p1}, Lcom/google/protobuf/z;->i(I)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/google/protobuf/i;->d()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-lt p1, v1, :cond_0

    .line 48
    .line 49
    invoke-direct {p0, v1}, Lcom/google/protobuf/j;->V(I)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    throw p0

    .line 58
    :cond_2
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/google/protobuf/i;->F()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    invoke-virtual {v0, p1}, Lcom/google/protobuf/z;->i(I)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/google/protobuf/i;->e()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    iget-object p1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/google/protobuf/i;->E()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 83
    .line 84
    if-eq p1, v1, :cond_2

    .line 85
    .line 86
    iput p1, p0, Lcom/google/protobuf/j;->d:I

    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    iget v0, p0, Lcom/google/protobuf/j;->b:I

    .line 90
    .line 91
    invoke-static {v0}, Lcom/google/protobuf/w0;->b(I)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_7

    .line 96
    .line 97
    if-ne v0, v1, :cond_6

    .line 98
    .line 99
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/google/protobuf/i;->F()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    iget-object v1, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/google/protobuf/i;->d()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr v1, v0

    .line 112
    :cond_5
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/google/protobuf/i;->F()I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 126
    .line 127
    invoke-virtual {v0}, Lcom/google/protobuf/i;->d()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-lt v0, v1, :cond_5

    .line 132
    .line 133
    invoke-direct {p0, v1}, Lcom/google/protobuf/j;->V(I)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_6
    invoke-static {}, Lcom/google/protobuf/B;->e()Lcom/google/protobuf/B$a;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    throw p0

    .line 142
    :cond_7
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/google/protobuf/i;->F()I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/google/protobuf/i;->e()Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_8

    .line 162
    .line 163
    :goto_0
    return-void

    .line 164
    :cond_8
    iget-object v0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 165
    .line 166
    invoke-virtual {v0}, Lcom/google/protobuf/i;->E()I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    iget v1, p0, Lcom/google/protobuf/j;->b:I

    .line 171
    .line 172
    if-eq v0, v1, :cond_7

    .line 173
    .line 174
    iput v0, p0, Lcom/google/protobuf/j;->d:I

    .line 175
    .line 176
    return-void
.end method

.method public x(Ljava/lang/Class;Lcom/google/protobuf/p;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/protobuf/p;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    invoke-static {}, Lcom/google/protobuf/f0;->a()Lcom/google/protobuf/f0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p1}, Lcom/google/protobuf/f0;->c(Ljava/lang/Class;)Lcom/google/protobuf/j0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-direct {p0, p1, p2}, Lcom/google/protobuf/j;->T(Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public y(Ljava/lang/Object;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/google/protobuf/j0<",
            "TT;>;",
            "Lcom/google/protobuf/p;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/j;->Q(Ljava/lang/Object;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public z()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/j;->W(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/protobuf/j;->a:Lcom/google/protobuf/i;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/protobuf/i;->s()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
