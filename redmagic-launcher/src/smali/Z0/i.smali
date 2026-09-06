.class public final LZ0/i;
.super LF3/e;
.source "BackupProtos.java"


# instance fields
.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Z

.field public e:LZ0/g;

.field public f:LZ0/g;

.field public g:I

.field public h:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, LF3/e;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, LZ0/i;->k()LZ0/i;

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method protected b()I
    .locals 4

    .line 1
    invoke-super {p0}, LF3/e;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    iget-object v2, p0, LZ0/i;->b:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v1, v2}, LF3/b;->p(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    add-int/2addr v0, v1

    .line 13
    iget-object v1, p0, LZ0/i;->c:Ljava/lang/String;

    .line 14
    .line 15
    const-string v2, ""

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/4 v2, 0x2

    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, LZ0/i;->c:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v2, v1}, LF3/b;->p(ILjava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    add-int/2addr v0, v1

    .line 31
    :cond_0
    iget-boolean v1, p0, LZ0/i;->d:Z

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    const/4 v3, 0x3

    .line 36
    invoke-static {v3, v1}, LF3/b;->b(IZ)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    add-int/2addr v0, v1

    .line 41
    :cond_1
    iget-object v1, p0, LZ0/i;->e:LZ0/g;

    .line 42
    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    const/4 v3, 0x4

    .line 46
    invoke-static {v3, v1}, LF3/b;->l(ILF3/e;)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    add-int/2addr v0, v1

    .line 51
    :cond_2
    iget-object v1, p0, LZ0/i;->f:LZ0/g;

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    const/4 v3, 0x5

    .line 56
    invoke-static {v3, v1}, LF3/b;->l(ILF3/e;)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    add-int/2addr v0, v1

    .line 61
    :cond_3
    iget v1, p0, LZ0/i;->g:I

    .line 62
    .line 63
    if-eq v1, v2, :cond_4

    .line 64
    .line 65
    const/4 v3, 0x6

    .line 66
    invoke-static {v3, v1}, LF3/b;->h(II)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    add-int/2addr v0, v1

    .line 71
    :cond_4
    iget p0, p0, LZ0/i;->h:I

    .line 72
    .line 73
    if-eq p0, v2, :cond_5

    .line 74
    .line 75
    const/4 v1, 0x7

    .line 76
    invoke-static {v1, p0}, LF3/b;->h(II)I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    add-int/2addr v0, p0

    .line 81
    :cond_5
    return v0
.end method

.method public bridge synthetic e(LF3/a;)LF3/e;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, LZ0/i;->l(LF3/a;)LZ0/i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(LF3/b;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iget-object v1, p0, LZ0/i;->b:Ljava/lang/String;

    .line 3
    .line 4
    invoke-virtual {p1, v0, v1}, LF3/b;->S(ILjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, LZ0/i;->c:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, ""

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x2

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, LZ0/i;->c:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p1, v1, v0}, LF3/b;->S(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-boolean v0, p0, LZ0/i;->d:Z

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    const/4 v2, 0x3

    .line 28
    invoke-virtual {p1, v2, v0}, LF3/b;->z(IZ)V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object v0, p0, LZ0/i;->e:LZ0/g;

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    const/4 v2, 0x4

    .line 36
    invoke-virtual {p1, v2, v0}, LF3/b;->J(ILF3/e;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object v0, p0, LZ0/i;->f:LZ0/g;

    .line 40
    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    const/4 v2, 0x5

    .line 44
    invoke-virtual {p1, v2, v0}, LF3/b;->J(ILF3/e;)V

    .line 45
    .line 46
    .line 47
    :cond_3
    iget v0, p0, LZ0/i;->g:I

    .line 48
    .line 49
    if-eq v0, v1, :cond_4

    .line 50
    .line 51
    const/4 v2, 0x6

    .line 52
    invoke-virtual {p1, v2, v0}, LF3/b;->F(II)V

    .line 53
    .line 54
    .line 55
    :cond_4
    iget v0, p0, LZ0/i;->h:I

    .line 56
    .line 57
    if-eq v0, v1, :cond_5

    .line 58
    .line 59
    const/4 v1, 0x7

    .line 60
    invoke-virtual {p1, v1, v0}, LF3/b;->F(II)V

    .line 61
    .line 62
    .line 63
    :cond_5
    invoke-super {p0, p1}, LF3/e;->j(LF3/b;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public k()LZ0/i;
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, LZ0/i;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object v0, p0, LZ0/i;->c:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, LZ0/i;->d:Z

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, LZ0/i;->e:LZ0/g;

    .line 12
    .line 13
    iput-object v0, p0, LZ0/i;->f:LZ0/g;

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    iput v0, p0, LZ0/i;->g:I

    .line 17
    .line 18
    iput v0, p0, LZ0/i;->h:I

    .line 19
    .line 20
    const/4 v0, -0x1

    .line 21
    iput v0, p0, LF3/e;->a:I

    .line 22
    .line 23
    return-object p0
.end method

.method public l(LF3/a;)LZ0/i;
    .locals 2
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
    if-eqz v0, :cond_a

    .line 6
    .line 7
    const/16 v1, 0xa

    .line 8
    .line 9
    if-eq v0, v1, :cond_9

    .line 10
    .line 11
    const/16 v1, 0x12

    .line 12
    .line 13
    if-eq v0, v1, :cond_8

    .line 14
    .line 15
    const/16 v1, 0x18

    .line 16
    .line 17
    if-eq v0, v1, :cond_7

    .line 18
    .line 19
    const/16 v1, 0x22

    .line 20
    .line 21
    if-eq v0, v1, :cond_5

    .line 22
    .line 23
    const/16 v1, 0x2a

    .line 24
    .line 25
    if-eq v0, v1, :cond_3

    .line 26
    .line 27
    const/16 v1, 0x30

    .line 28
    .line 29
    if-eq v0, v1, :cond_2

    .line 30
    .line 31
    const/16 v1, 0x38

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
    goto :goto_1

    .line 42
    :cond_1
    invoke-virtual {p1}, LF3/a;->j()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iput v0, p0, LZ0/i;->h:I

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    invoke-virtual {p1}, LF3/a;->j()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iput v0, p0, LZ0/i;->g:I

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    iget-object v0, p0, LZ0/i;->f:LZ0/g;

    .line 57
    .line 58
    if-nez v0, :cond_4

    .line 59
    .line 60
    new-instance v0, LZ0/g;

    .line 61
    .line 62
    invoke-direct {v0}, LZ0/g;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, LZ0/i;->f:LZ0/g;

    .line 66
    .line 67
    :cond_4
    iget-object v0, p0, LZ0/i;->f:LZ0/g;

    .line 68
    .line 69
    invoke-virtual {p1, v0}, LF3/a;->l(LF3/e;)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_5
    iget-object v0, p0, LZ0/i;->e:LZ0/g;

    .line 74
    .line 75
    if-nez v0, :cond_6

    .line 76
    .line 77
    new-instance v0, LZ0/g;

    .line 78
    .line 79
    invoke-direct {v0}, LZ0/g;-><init>()V

    .line 80
    .line 81
    .line 82
    iput-object v0, p0, LZ0/i;->e:LZ0/g;

    .line 83
    .line 84
    :cond_6
    iget-object v0, p0, LZ0/i;->e:LZ0/g;

    .line 85
    .line 86
    invoke-virtual {p1, v0}, LF3/a;->l(LF3/e;)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_7
    invoke-virtual {p1}, LF3/a;->g()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    iput-boolean v0, p0, LZ0/i;->d:Z

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_8
    invoke-virtual {p1}, LF3/a;->s()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iput-object v0, p0, LZ0/i;->c:Ljava/lang/String;

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_9
    invoke-virtual {p1}, LF3/a;->s()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iput-object v0, p0, LZ0/i;->b:Ljava/lang/String;

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_a
    :goto_1
    return-object p0
.end method
