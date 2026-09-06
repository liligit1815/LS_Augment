.class public final LZ0/g;
.super LF3/e;
.source "BackupProtos.java"


# instance fields
.field public b:I

.field public c:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, LF3/e;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, LZ0/g;->k()LZ0/g;

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method protected b()I
    .locals 3

    .line 1
    invoke-super {p0}, LF3/e;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    iget v2, p0, LZ0/g;->b:I

    .line 7
    .line 8
    invoke-static {v1, v2}, LF3/b;->h(II)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    add-int/2addr v0, v1

    .line 13
    const/4 v1, 0x2

    .line 14
    iget-object p0, p0, LZ0/g;->c:[B

    .line 15
    .line 16
    invoke-static {v1, p0}, LF3/b;->d(I[B)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    add-int/2addr v0, p0

    .line 21
    return v0
.end method

.method public bridge synthetic e(LF3/a;)LF3/e;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, LZ0/g;->l(LF3/a;)LZ0/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(LF3/b;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iget v1, p0, LZ0/g;->b:I

    .line 3
    .line 4
    invoke-virtual {p1, v0, v1}, LF3/b;->F(II)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    iget-object v1, p0, LZ0/g;->c:[B

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1}, LF3/b;->B(I[B)V

    .line 11
    .line 12
    .line 13
    invoke-super {p0, p1}, LF3/e;->j(LF3/b;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public k()LZ0/g;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, LZ0/g;->b:I

    .line 3
    .line 4
    sget-object v0, LF3/g;->h:[B

    .line 5
    .line 6
    iput-object v0, p0, LZ0/g;->c:[B

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, LF3/e;->a:I

    .line 10
    .line 11
    return-object p0
.end method

.method public l(LF3/a;)LZ0/g;
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
    if-eqz v0, :cond_3

    .line 6
    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    if-eq v0, v1, :cond_2

    .line 10
    .line 11
    const/16 v1, 0x12

    .line 12
    .line 13
    if-eq v0, v1, :cond_1

    .line 14
    .line 15
    invoke-static {p1, v0}, LF3/g;->e(LF3/a;I)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    invoke-virtual {p1}, LF3/a;->h()[B

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, LZ0/g;->c:[B

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    invoke-virtual {p1}, LF3/a;->j()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iput v0, p0, LZ0/g;->b:I

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_3
    :goto_1
    return-object p0
.end method
