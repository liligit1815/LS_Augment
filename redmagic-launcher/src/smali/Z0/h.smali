.class public final LZ0/h;
.super LF3/e;
.source "BackupProtos.java"


# instance fields
.field public b:J

.field public c:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, LF3/e;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, LZ0/h;->k()LZ0/h;

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
    iget-wide v2, p0, LZ0/h;->b:J

    .line 7
    .line 8
    invoke-static {v1, v2, v3}, LF3/b;->j(IJ)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    add-int/2addr v0, v1

    .line 13
    iget p0, p0, LZ0/h;->c:I

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    invoke-static {v1, p0}, LF3/b;->h(II)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    add-int/2addr v0, p0

    .line 23
    :cond_0
    return v0
.end method

.method public bridge synthetic e(LF3/a;)LF3/e;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, LZ0/h;->l(LF3/a;)LZ0/h;

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
    iget-wide v1, p0, LZ0/h;->b:J

    .line 3
    .line 4
    invoke-virtual {p1, v0, v1, v2}, LF3/b;->H(IJ)V

    .line 5
    .line 6
    .line 7
    iget v0, p0, LZ0/h;->c:I

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    invoke-virtual {p1, v1, v0}, LF3/b;->F(II)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-super {p0, p1}, LF3/e;->j(LF3/b;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public k()LZ0/h;
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, LZ0/h;->b:J

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, LZ0/h;->c:I

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, LF3/e;->a:I

    .line 10
    .line 11
    return-object p0
.end method

.method public l(LF3/a;)LZ0/h;
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
    const/16 v1, 0x10

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
    invoke-virtual {p1}, LF3/a;->j()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, LZ0/h;->c:I

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    invoke-virtual {p1}, LF3/a;->k()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    iput-wide v0, p0, LZ0/h;->b:J

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_3
    :goto_1
    return-object p0
.end method
