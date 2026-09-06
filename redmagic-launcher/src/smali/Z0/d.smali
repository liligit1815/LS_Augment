.class public final LZ0/d;
.super LF3/e;
.source "BackupProtos.java"


# instance fields
.field public b:I

.field public c:J

.field public d:J

.field public e:I

.field public f:[LZ0/e;

.field public g:I

.field public h:LZ0/b;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, LF3/e;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, LZ0/d;->k()LZ0/d;

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method protected b()I
    .locals 7

    .line 1
    invoke-super {p0}, LF3/e;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, LZ0/d;->b:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-static {v2, v1}, LF3/b;->h(II)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    add-int/2addr v0, v1

    .line 13
    const/4 v1, 0x2

    .line 14
    iget-wide v3, p0, LZ0/d;->c:J

    .line 15
    .line 16
    invoke-static {v1, v3, v4}, LF3/b;->j(IJ)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    add-int/2addr v0, v1

    .line 21
    iget-wide v3, p0, LZ0/d;->d:J

    .line 22
    .line 23
    const-wide/16 v5, 0x0

    .line 24
    .line 25
    cmp-long v1, v3, v5

    .line 26
    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    const/4 v1, 0x3

    .line 30
    invoke-static {v1, v3, v4}, LF3/b;->j(IJ)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    add-int/2addr v0, v1

    .line 35
    :cond_0
    iget v1, p0, LZ0/d;->e:I

    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    const/4 v3, 0x4

    .line 40
    invoke-static {v3, v1}, LF3/b;->h(II)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    add-int/2addr v0, v1

    .line 45
    :cond_1
    iget-object v1, p0, LZ0/d;->f:[LZ0/e;

    .line 46
    .line 47
    if-eqz v1, :cond_3

    .line 48
    .line 49
    array-length v1, v1

    .line 50
    if-lez v1, :cond_3

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    :goto_0
    iget-object v3, p0, LZ0/d;->f:[LZ0/e;

    .line 54
    .line 55
    array-length v4, v3

    .line 56
    if-ge v1, v4, :cond_3

    .line 57
    .line 58
    aget-object v3, v3, v1

    .line 59
    .line 60
    if-eqz v3, :cond_2

    .line 61
    .line 62
    const/4 v4, 0x5

    .line 63
    invoke-static {v4, v3}, LF3/b;->l(ILF3/e;)I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    add-int/2addr v0, v3

    .line 68
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    iget v1, p0, LZ0/d;->g:I

    .line 72
    .line 73
    if-eq v1, v2, :cond_4

    .line 74
    .line 75
    const/4 v2, 0x6

    .line 76
    invoke-static {v2, v1}, LF3/b;->h(II)I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    add-int/2addr v0, v1

    .line 81
    :cond_4
    iget-object p0, p0, LZ0/d;->h:LZ0/b;

    .line 82
    .line 83
    if-eqz p0, :cond_5

    .line 84
    .line 85
    const/4 v1, 0x7

    .line 86
    invoke-static {v1, p0}, LF3/b;->l(ILF3/e;)I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    add-int/2addr v0, p0

    .line 91
    :cond_5
    return v0
.end method

.method public bridge synthetic e(LF3/a;)LF3/e;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, LZ0/d;->l(LF3/a;)LZ0/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(LF3/b;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget v0, p0, LZ0/d;->b:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p1, v1, v0}, LF3/b;->F(II)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    iget-wide v2, p0, LZ0/d;->c:J

    .line 9
    .line 10
    invoke-virtual {p1, v0, v2, v3}, LF3/b;->H(IJ)V

    .line 11
    .line 12
    .line 13
    iget-wide v2, p0, LZ0/d;->d:J

    .line 14
    .line 15
    const-wide/16 v4, 0x0

    .line 16
    .line 17
    cmp-long v0, v2, v4

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p1, v0, v2, v3}, LF3/b;->H(IJ)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget v0, p0, LZ0/d;->e:I

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const/4 v2, 0x4

    .line 30
    invoke-virtual {p1, v2, v0}, LF3/b;->F(II)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, LZ0/d;->f:[LZ0/e;

    .line 34
    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    array-length v0, v0

    .line 38
    if-lez v0, :cond_3

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    :goto_0
    iget-object v2, p0, LZ0/d;->f:[LZ0/e;

    .line 42
    .line 43
    array-length v3, v2

    .line 44
    if-ge v0, v3, :cond_3

    .line 45
    .line 46
    aget-object v2, v2, v0

    .line 47
    .line 48
    if-eqz v2, :cond_2

    .line 49
    .line 50
    const/4 v3, 0x5

    .line 51
    invoke-virtual {p1, v3, v2}, LF3/b;->J(ILF3/e;)V

    .line 52
    .line 53
    .line 54
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    iget v0, p0, LZ0/d;->g:I

    .line 58
    .line 59
    if-eq v0, v1, :cond_4

    .line 60
    .line 61
    const/4 v1, 0x6

    .line 62
    invoke-virtual {p1, v1, v0}, LF3/b;->F(II)V

    .line 63
    .line 64
    .line 65
    :cond_4
    iget-object v0, p0, LZ0/d;->h:LZ0/b;

    .line 66
    .line 67
    if-eqz v0, :cond_5

    .line 68
    .line 69
    const/4 v1, 0x7

    .line 70
    invoke-virtual {p1, v1, v0}, LF3/b;->J(ILF3/e;)V

    .line 71
    .line 72
    .line 73
    :cond_5
    invoke-super {p0, p1}, LF3/e;->j(LF3/b;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public k()LZ0/d;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, LZ0/d;->b:I

    .line 3
    .line 4
    const-wide/16 v1, 0x0

    .line 5
    .line 6
    iput-wide v1, p0, LZ0/d;->c:J

    .line 7
    .line 8
    iput-wide v1, p0, LZ0/d;->d:J

    .line 9
    .line 10
    iput v0, p0, LZ0/d;->e:I

    .line 11
    .line 12
    invoke-static {}, LZ0/e;->l()[LZ0/e;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, LZ0/d;->f:[LZ0/e;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    iput v0, p0, LZ0/d;->g:I

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, LZ0/d;->h:LZ0/b;

    .line 23
    .line 24
    const/4 v0, -0x1

    .line 25
    iput v0, p0, LF3/e;->a:I

    .line 26
    .line 27
    return-object p0
.end method

.method public l(LF3/a;)LZ0/d;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    :cond_0
    :goto_0
    invoke-virtual {p1}, LF3/a;->t()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_c

    .line 6
    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    if-eq v0, v1, :cond_b

    .line 10
    .line 11
    const/16 v1, 0x10

    .line 12
    .line 13
    if-eq v0, v1, :cond_a

    .line 14
    .line 15
    const/16 v1, 0x18

    .line 16
    .line 17
    if-eq v0, v1, :cond_9

    .line 18
    .line 19
    const/16 v1, 0x20

    .line 20
    .line 21
    if-eq v0, v1, :cond_8

    .line 22
    .line 23
    const/16 v1, 0x2a

    .line 24
    .line 25
    if-eq v0, v1, :cond_4

    .line 26
    .line 27
    const/16 v1, 0x30

    .line 28
    .line 29
    if-eq v0, v1, :cond_3

    .line 30
    .line 31
    const/16 v1, 0x3a

    .line 32
    .line 33
    if-eq v0, v1, :cond_1

    .line 34
    .line 35
    invoke-static {p1, v0}, LF3/g;->e(LF3/a;I)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    goto/16 :goto_3

    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, LZ0/d;->h:LZ0/b;

    .line 44
    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    new-instance v0, LZ0/b;

    .line 48
    .line 49
    invoke-direct {v0}, LZ0/b;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, LZ0/d;->h:LZ0/b;

    .line 53
    .line 54
    :cond_2
    iget-object v0, p0, LZ0/d;->h:LZ0/b;

    .line 55
    .line 56
    invoke-virtual {p1, v0}, LF3/a;->l(LF3/e;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    invoke-virtual {p1}, LF3/a;->j()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iput v0, p0, LZ0/d;->g:I

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_4
    invoke-static {p1, v1}, LF3/g;->a(LF3/a;I)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iget-object v1, p0, LZ0/d;->f:[LZ0/e;

    .line 72
    .line 73
    const/4 v2, 0x0

    .line 74
    if-nez v1, :cond_5

    .line 75
    .line 76
    move v3, v2

    .line 77
    goto :goto_1

    .line 78
    :cond_5
    array-length v3, v1

    .line 79
    :goto_1
    add-int/2addr v0, v3

    .line 80
    new-array v4, v0, [LZ0/e;

    .line 81
    .line 82
    if-eqz v3, :cond_6

    .line 83
    .line 84
    invoke-static {v1, v2, v4, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 85
    .line 86
    .line 87
    :cond_6
    :goto_2
    add-int/lit8 v1, v0, -0x1

    .line 88
    .line 89
    if-ge v3, v1, :cond_7

    .line 90
    .line 91
    new-instance v1, LZ0/e;

    .line 92
    .line 93
    invoke-direct {v1}, LZ0/e;-><init>()V

    .line 94
    .line 95
    .line 96
    aput-object v1, v4, v3

    .line 97
    .line 98
    invoke-virtual {p1, v1}, LF3/a;->l(LF3/e;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1}, LF3/a;->t()I

    .line 102
    .line 103
    .line 104
    add-int/lit8 v3, v3, 0x1

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_7
    new-instance v0, LZ0/e;

    .line 108
    .line 109
    invoke-direct {v0}, LZ0/e;-><init>()V

    .line 110
    .line 111
    .line 112
    aput-object v0, v4, v3

    .line 113
    .line 114
    invoke-virtual {p1, v0}, LF3/a;->l(LF3/e;)V

    .line 115
    .line 116
    .line 117
    iput-object v4, p0, LZ0/d;->f:[LZ0/e;

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_8
    invoke-virtual {p1}, LF3/a;->j()I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    iput v0, p0, LZ0/d;->e:I

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_9
    invoke-virtual {p1}, LF3/a;->k()J

    .line 128
    .line 129
    .line 130
    move-result-wide v0

    .line 131
    iput-wide v0, p0, LZ0/d;->d:J

    .line 132
    .line 133
    goto/16 :goto_0

    .line 134
    .line 135
    :cond_a
    invoke-virtual {p1}, LF3/a;->k()J

    .line 136
    .line 137
    .line 138
    move-result-wide v0

    .line 139
    iput-wide v0, p0, LZ0/d;->c:J

    .line 140
    .line 141
    goto/16 :goto_0

    .line 142
    .line 143
    :cond_b
    invoke-virtual {p1}, LF3/a;->j()I

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    iput v0, p0, LZ0/d;->b:I

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :cond_c
    :goto_3
    return-object p0
.end method
