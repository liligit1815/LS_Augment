.class public final LZ0/f;
.super LF3/e;
.source "BackupProtos.java"


# instance fields
.field public b:I

.field public c:I

.field public d:I

.field public e:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, LF3/e;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, LZ0/f;->k()LZ0/f;

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
    iget v2, p0, LZ0/f;->b:I

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
    iget v2, p0, LZ0/f;->c:I

    .line 15
    .line 16
    invoke-static {v1, v2}, LF3/b;->h(II)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    add-int/2addr v0, v1

    .line 21
    const/4 v1, 0x3

    .line 22
    iget v2, p0, LZ0/f;->d:I

    .line 23
    .line 24
    invoke-static {v1, v2}, LF3/b;->h(II)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    add-int/2addr v0, v1

    .line 29
    const/4 v1, 0x4

    .line 30
    iget p0, p0, LZ0/f;->e:I

    .line 31
    .line 32
    invoke-static {v1, p0}, LF3/b;->h(II)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    add-int/2addr v0, p0

    .line 37
    return v0
.end method

.method public bridge synthetic e(LF3/a;)LF3/e;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, LZ0/f;->l(LF3/a;)LZ0/f;

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
    iget v1, p0, LZ0/f;->b:I

    .line 3
    .line 4
    invoke-virtual {p1, v0, v1}, LF3/b;->F(II)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    iget v1, p0, LZ0/f;->c:I

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1}, LF3/b;->F(II)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x3

    .line 14
    iget v1, p0, LZ0/f;->d:I

    .line 15
    .line 16
    invoke-virtual {p1, v0, v1}, LF3/b;->F(II)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x4

    .line 20
    iget v1, p0, LZ0/f;->e:I

    .line 21
    .line 22
    invoke-virtual {p1, v0, v1}, LF3/b;->F(II)V

    .line 23
    .line 24
    .line 25
    invoke-super {p0, p1}, LF3/e;->j(LF3/b;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public k()LZ0/f;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, LZ0/f;->b:I

    .line 3
    .line 4
    iput v0, p0, LZ0/f;->c:I

    .line 5
    .line 6
    iput v0, p0, LZ0/f;->d:I

    .line 7
    .line 8
    iput v0, p0, LZ0/f;->e:I

    .line 9
    .line 10
    const/4 v0, -0x1

    .line 11
    iput v0, p0, LF3/e;->a:I

    .line 12
    .line 13
    return-object p0
.end method

.method public l(LF3/a;)LZ0/f;
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
    if-eqz v0, :cond_5

    .line 6
    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    if-eq v0, v1, :cond_4

    .line 10
    .line 11
    const/16 v1, 0x10

    .line 12
    .line 13
    if-eq v0, v1, :cond_3

    .line 14
    .line 15
    const/16 v1, 0x18

    .line 16
    .line 17
    if-eq v0, v1, :cond_2

    .line 18
    .line 19
    const/16 v1, 0x20

    .line 20
    .line 21
    if-eq v0, v1, :cond_1

    .line 22
    .line 23
    invoke-static {p1, v0}, LF3/g;->e(LF3/a;I)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    invoke-virtual {p1}, LF3/a;->j()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, LZ0/f;->e:I

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    invoke-virtual {p1}, LF3/a;->j()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput v0, p0, LZ0/f;->d:I

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_3
    invoke-virtual {p1}, LF3/a;->j()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iput v0, p0, LZ0/f;->c:I

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_4
    invoke-virtual {p1}, LF3/a;->j()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iput v0, p0, LZ0/f;->b:I

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_5
    :goto_1
    return-object p0
.end method
