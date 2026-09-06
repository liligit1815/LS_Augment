.class final Lcom/google/protobuf/k$e;
.super Lcom/google/protobuf/k$b;
.source "CodedOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "e"
.end annotation


# instance fields
.field private final i:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(Ljava/io/OutputStream;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Lcom/google/protobuf/k$b;-><init>(I)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Lcom/google/protobuf/k$e;->i:Ljava/io/OutputStream;

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    .line 10
    .line 11
    const-string p1, "out"

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    throw p0
.end method

.method private b1()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/k$e;->i:Ljava/io/OutputStream;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/protobuf/k$b;->e:[B

    .line 4
    .line 5
    iget v2, p0, Lcom/google/protobuf/k$b;->g:I

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 9
    .line 10
    .line 11
    iput v3, p0, Lcom/google/protobuf/k$b;->g:I

    .line 12
    .line 13
    return-void
.end method

.method private c1(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/protobuf/k$b;->f:I

    .line 2
    .line 3
    iget v1, p0, Lcom/google/protobuf/k$b;->g:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    if-ge v0, p1, :cond_0

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/google/protobuf/k$e;->b1()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method


# virtual methods
.method public A0(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/protobuf/k$e;->R0(I)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    int-to-long v0, p1

    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/google/protobuf/k$e;->T0(J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method D0(ILcom/google/protobuf/T;Lcom/google/protobuf/j0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/k$e;->P0(II)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p2, p3}, Lcom/google/protobuf/k$e;->i1(Lcom/google/protobuf/T;Lcom/google/protobuf/j0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public E0(ILcom/google/protobuf/T;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x3

    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/google/protobuf/k$e;->P0(II)V

    .line 4
    .line 5
    .line 6
    const/4 v2, 0x2

    .line 7
    invoke-virtual {p0, v2, p1}, Lcom/google/protobuf/k$e;->Q0(II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v1, p2}, Lcom/google/protobuf/k$e;->g1(ILcom/google/protobuf/T;)V

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x4

    .line 14
    invoke-virtual {p0, v0, p1}, Lcom/google/protobuf/k$e;->P0(II)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public F0(ILcom/google/protobuf/h;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x3

    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/google/protobuf/k$e;->P0(II)V

    .line 4
    .line 5
    .line 6
    const/4 v2, 0x2

    .line 7
    invoke-virtual {p0, v2, p1}, Lcom/google/protobuf/k$e;->Q0(II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v1, p2}, Lcom/google/protobuf/k$e;->m0(ILcom/google/protobuf/h;)V

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x4

    .line 14
    invoke-virtual {p0, v0, p1}, Lcom/google/protobuf/k$e;->P0(II)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public O0(ILjava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/k$e;->P0(II)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p2}, Lcom/google/protobuf/k$e;->j1(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public P0(II)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-static {p1, p2}, Lcom/google/protobuf/w0;->c(II)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/google/protobuf/k$e;->R0(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Q0(II)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/16 v0, 0x14

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/google/protobuf/k$e;->c1(I)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/k$b;->Y0(II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p2}, Lcom/google/protobuf/k$b;->Z0(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public R0(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/k$e;->c1(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/google/protobuf/k$b;->Z0(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public S0(IJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/16 v0, 0x14

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/google/protobuf/k$e;->c1(I)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/k$b;->Y0(II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p2, p3}, Lcom/google/protobuf/k$b;->a1(J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public T0(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/google/protobuf/k$e;->c1(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/google/protobuf/k$b;->a1(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public a(Ljava/nio/ByteBuffer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/protobuf/k$e;->d1(Ljava/nio/ByteBuffer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b([BII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/protobuf/k$e;->e1([BII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c0()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/protobuf/k$b;->g:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/google/protobuf/k$e;->b1()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d1(Ljava/nio/ByteBuffer;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/google/protobuf/k$b;->f:I

    .line 6
    .line 7
    iget v2, p0, Lcom/google/protobuf/k$b;->g:I

    .line 8
    .line 9
    sub-int v3, v1, v2

    .line 10
    .line 11
    if-lt v3, v0, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/google/protobuf/k$b;->e:[B

    .line 14
    .line 15
    invoke-virtual {p1, v1, v2, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    .line 18
    iget p1, p0, Lcom/google/protobuf/k$b;->g:I

    .line 19
    .line 20
    add-int/2addr p1, v0

    .line 21
    iput p1, p0, Lcom/google/protobuf/k$b;->g:I

    .line 22
    .line 23
    iget p1, p0, Lcom/google/protobuf/k$b;->h:I

    .line 24
    .line 25
    add-int/2addr p1, v0

    .line 26
    iput p1, p0, Lcom/google/protobuf/k$b;->h:I

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    sub-int/2addr v1, v2

    .line 30
    iget-object v3, p0, Lcom/google/protobuf/k$b;->e:[B

    .line 31
    .line 32
    invoke-virtual {p1, v3, v2, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    .line 35
    sub-int/2addr v0, v1

    .line 36
    iget v2, p0, Lcom/google/protobuf/k$b;->f:I

    .line 37
    .line 38
    iput v2, p0, Lcom/google/protobuf/k$b;->g:I

    .line 39
    .line 40
    iget v2, p0, Lcom/google/protobuf/k$b;->h:I

    .line 41
    .line 42
    add-int/2addr v2, v1

    .line 43
    iput v2, p0, Lcom/google/protobuf/k$b;->h:I

    .line 44
    .line 45
    invoke-direct {p0}, Lcom/google/protobuf/k$e;->b1()V

    .line 46
    .line 47
    .line 48
    :goto_0
    iget v1, p0, Lcom/google/protobuf/k$b;->f:I

    .line 49
    .line 50
    const/4 v2, 0x0

    .line 51
    if-le v0, v1, :cond_1

    .line 52
    .line 53
    iget-object v3, p0, Lcom/google/protobuf/k$b;->e:[B

    .line 54
    .line 55
    invoke-virtual {p1, v3, v2, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/google/protobuf/k$e;->i:Ljava/io/OutputStream;

    .line 59
    .line 60
    iget-object v3, p0, Lcom/google/protobuf/k$b;->e:[B

    .line 61
    .line 62
    iget v4, p0, Lcom/google/protobuf/k$b;->f:I

    .line 63
    .line 64
    invoke-virtual {v1, v3, v2, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 65
    .line 66
    .line 67
    iget v1, p0, Lcom/google/protobuf/k$b;->f:I

    .line 68
    .line 69
    sub-int/2addr v0, v1

    .line 70
    iget v2, p0, Lcom/google/protobuf/k$b;->h:I

    .line 71
    .line 72
    add-int/2addr v2, v1

    .line 73
    iput v2, p0, Lcom/google/protobuf/k$b;->h:I

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    iget-object v1, p0, Lcom/google/protobuf/k$b;->e:[B

    .line 77
    .line 78
    invoke-virtual {p1, v1, v2, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 79
    .line 80
    .line 81
    iput v0, p0, Lcom/google/protobuf/k$b;->g:I

    .line 82
    .line 83
    iget p1, p0, Lcom/google/protobuf/k$b;->h:I

    .line 84
    .line 85
    add-int/2addr p1, v0

    .line 86
    iput p1, p0, Lcom/google/protobuf/k$b;->h:I

    .line 87
    .line 88
    return-void
.end method

.method public e1([BII)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/protobuf/k$b;->f:I

    .line 2
    .line 3
    iget v1, p0, Lcom/google/protobuf/k$b;->g:I

    .line 4
    .line 5
    sub-int v2, v0, v1

    .line 6
    .line 7
    if-lt v2, p3, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/protobuf/k$b;->e:[B

    .line 10
    .line 11
    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 12
    .line 13
    .line 14
    iget p1, p0, Lcom/google/protobuf/k$b;->g:I

    .line 15
    .line 16
    add-int/2addr p1, p3

    .line 17
    iput p1, p0, Lcom/google/protobuf/k$b;->g:I

    .line 18
    .line 19
    iget p1, p0, Lcom/google/protobuf/k$b;->h:I

    .line 20
    .line 21
    add-int/2addr p1, p3

    .line 22
    iput p1, p0, Lcom/google/protobuf/k$b;->h:I

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    sub-int/2addr v0, v1

    .line 26
    iget-object v2, p0, Lcom/google/protobuf/k$b;->e:[B

    .line 27
    .line 28
    invoke-static {p1, p2, v2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 29
    .line 30
    .line 31
    add-int/2addr p2, v0

    .line 32
    sub-int/2addr p3, v0

    .line 33
    iget v1, p0, Lcom/google/protobuf/k$b;->f:I

    .line 34
    .line 35
    iput v1, p0, Lcom/google/protobuf/k$b;->g:I

    .line 36
    .line 37
    iget v1, p0, Lcom/google/protobuf/k$b;->h:I

    .line 38
    .line 39
    add-int/2addr v1, v0

    .line 40
    iput v1, p0, Lcom/google/protobuf/k$b;->h:I

    .line 41
    .line 42
    invoke-direct {p0}, Lcom/google/protobuf/k$e;->b1()V

    .line 43
    .line 44
    .line 45
    iget v0, p0, Lcom/google/protobuf/k$b;->f:I

    .line 46
    .line 47
    if-gt p3, v0, :cond_1

    .line 48
    .line 49
    iget-object v0, p0, Lcom/google/protobuf/k$b;->e:[B

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 53
    .line 54
    .line 55
    iput p3, p0, Lcom/google/protobuf/k$b;->g:I

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    iget-object v0, p0, Lcom/google/protobuf/k$e;->i:Ljava/io/OutputStream;

    .line 59
    .line 60
    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 61
    .line 62
    .line 63
    :goto_0
    iget p1, p0, Lcom/google/protobuf/k$b;->h:I

    .line 64
    .line 65
    add-int/2addr p1, p3

    .line 66
    iput p1, p0, Lcom/google/protobuf/k$b;->h:I

    .line 67
    .line 68
    return-void
.end method

.method public f1(Lcom/google/protobuf/h;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/h;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/google/protobuf/k$e;->R0(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lcom/google/protobuf/h;->J(Lcom/google/protobuf/g;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public g1(ILcom/google/protobuf/T;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/k$e;->P0(II)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p2}, Lcom/google/protobuf/k$e;->h1(Lcom/google/protobuf/T;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public h1(Lcom/google/protobuf/T;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-interface {p1}, Lcom/google/protobuf/T;->getSerializedSize()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/google/protobuf/k$e;->R0(I)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1, p0}, Lcom/google/protobuf/T;->writeTo(Lcom/google/protobuf/k;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method i1(Lcom/google/protobuf/T;Lcom/google/protobuf/j0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/google/protobuf/a;

    .line 3
    .line 4
    invoke-virtual {v0, p2}, Lcom/google/protobuf/a;->getSerializedSize(Lcom/google/protobuf/j0;)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0, v0}, Lcom/google/protobuf/k$e;->R0(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/google/protobuf/k;->a:Lcom/google/protobuf/l;

    .line 12
    .line 13
    invoke-interface {p2, p1, p0}, Lcom/google/protobuf/j0;->b(Ljava/lang/Object;Lcom/google/protobuf/x0;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public j0(B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/protobuf/k$b;->g:I

    .line 2
    .line 3
    iget v1, p0, Lcom/google/protobuf/k$b;->f:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/google/protobuf/k$e;->b1()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/protobuf/k$b;->U0(B)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public j1(Ljava/lang/String;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    mul-int/lit8 v0, v0, 0x3

    .line 6
    .line 7
    invoke-static {v0}, Lcom/google/protobuf/k;->X(I)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    add-int v2, v1, v0

    .line 12
    .line 13
    iget v3, p0, Lcom/google/protobuf/k$b;->f:I

    .line 14
    .line 15
    if-le v2, v3, :cond_0

    .line 16
    .line 17
    new-array v1, v0, [B

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-static {p1, v1, v2, v0}, Lcom/google/protobuf/v0;->i(Ljava/lang/CharSequence;[BII)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p0, v0}, Lcom/google/protobuf/k$e;->R0(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v1, v2, v0}, Lcom/google/protobuf/k$e;->b([BII)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :catch_0
    move-exception v0

    .line 32
    goto :goto_3

    .line 33
    :cond_0
    iget v0, p0, Lcom/google/protobuf/k$b;->g:I

    .line 34
    .line 35
    sub-int/2addr v3, v0

    .line 36
    if-le v2, v3, :cond_1

    .line 37
    .line 38
    invoke-direct {p0}, Lcom/google/protobuf/k$e;->b1()V

    .line 39
    .line 40
    .line 41
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-static {v0}, Lcom/google/protobuf/k;->X(I)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iget v2, p0, Lcom/google/protobuf/k$b;->g:I
    :try_end_0
    .catch Lcom/google/protobuf/v0$d; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    if-ne v0, v1, :cond_2

    .line 52
    .line 53
    add-int v1, v2, v0

    .line 54
    .line 55
    :try_start_1
    iput v1, p0, Lcom/google/protobuf/k$b;->g:I

    .line 56
    .line 57
    iget-object v3, p0, Lcom/google/protobuf/k$b;->e:[B

    .line 58
    .line 59
    iget v4, p0, Lcom/google/protobuf/k$b;->f:I

    .line 60
    .line 61
    sub-int/2addr v4, v1

    .line 62
    invoke-static {p1, v3, v1, v4}, Lcom/google/protobuf/v0;->i(Ljava/lang/CharSequence;[BII)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    iput v2, p0, Lcom/google/protobuf/k$b;->g:I

    .line 67
    .line 68
    sub-int v3, v1, v2

    .line 69
    .line 70
    sub-int/2addr v3, v0

    .line 71
    invoke-virtual {p0, v3}, Lcom/google/protobuf/k$b;->Z0(I)V

    .line 72
    .line 73
    .line 74
    iput v1, p0, Lcom/google/protobuf/k$b;->g:I

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :catch_1
    move-exception v0

    .line 78
    goto :goto_1

    .line 79
    :catch_2
    move-exception v0

    .line 80
    goto :goto_2

    .line 81
    :cond_2
    invoke-static {p1}, Lcom/google/protobuf/v0;->j(Ljava/lang/CharSequence;)I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    invoke-virtual {p0, v3}, Lcom/google/protobuf/k$b;->Z0(I)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/google/protobuf/k$b;->e:[B

    .line 89
    .line 90
    iget v1, p0, Lcom/google/protobuf/k$b;->g:I

    .line 91
    .line 92
    invoke-static {p1, v0, v1, v3}, Lcom/google/protobuf/v0;->i(Ljava/lang/CharSequence;[BII)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    iput v0, p0, Lcom/google/protobuf/k$b;->g:I

    .line 97
    .line 98
    :goto_0
    iget v0, p0, Lcom/google/protobuf/k$b;->h:I

    .line 99
    .line 100
    add-int/2addr v0, v3

    .line 101
    iput v0, p0, Lcom/google/protobuf/k$b;->h:I
    :try_end_1
    .catch Lcom/google/protobuf/v0$d; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_1

    .line 102
    .line 103
    return-void

    .line 104
    :goto_1
    :try_start_2
    new-instance v1, Lcom/google/protobuf/k$d;

    .line 105
    .line 106
    invoke-direct {v1, v0}, Lcom/google/protobuf/k$d;-><init>(Ljava/lang/Throwable;)V

    .line 107
    .line 108
    .line 109
    throw v1

    .line 110
    :goto_2
    iget v1, p0, Lcom/google/protobuf/k$b;->h:I

    .line 111
    .line 112
    iget v3, p0, Lcom/google/protobuf/k$b;->g:I

    .line 113
    .line 114
    sub-int/2addr v3, v2

    .line 115
    sub-int/2addr v1, v3

    .line 116
    iput v1, p0, Lcom/google/protobuf/k$b;->h:I

    .line 117
    .line 118
    iput v2, p0, Lcom/google/protobuf/k$b;->g:I

    .line 119
    .line 120
    throw v0
    :try_end_2
    .catch Lcom/google/protobuf/v0$d; {:try_start_2 .. :try_end_2} :catch_0

    .line 121
    :goto_3
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/k;->d0(Ljava/lang/String;Lcom/google/protobuf/v0$d;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public k0(IZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/16 v0, 0xb

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/google/protobuf/k$e;->c1(I)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/k$b;->Y0(II)V

    .line 8
    .line 9
    .line 10
    int-to-byte p1, p2

    .line 11
    invoke-virtual {p0, p1}, Lcom/google/protobuf/k$b;->U0(B)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public m0(ILcom/google/protobuf/h;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/k$e;->P0(II)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p2}, Lcom/google/protobuf/k$e;->f1(Lcom/google/protobuf/h;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public r0(II)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/16 v0, 0xe

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/google/protobuf/k$e;->c1(I)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x5

    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/k$b;->Y0(II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p2}, Lcom/google/protobuf/k$b;->V0(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public s0(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-direct {p0, v0}, Lcom/google/protobuf/k$e;->c1(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/google/protobuf/k$b;->V0(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public t0(IJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/16 v0, 0x12

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/google/protobuf/k$e;->c1(I)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/k$b;->Y0(II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p2, p3}, Lcom/google/protobuf/k$b;->W0(J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public u0(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/google/protobuf/k$e;->c1(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/google/protobuf/k$b;->W0(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public z0(II)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/16 v0, 0x14

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/google/protobuf/k$e;->c1(I)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/k$b;->Y0(II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p2}, Lcom/google/protobuf/k$b;->X0(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
