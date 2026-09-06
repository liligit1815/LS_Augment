.class public final Lokio/t;
.super Ljava/lang/Object;
.source "PeekSource.kt"

# interfaces
.implements Lokio/B;


# instance fields
.field private final g:Lokio/g;

.field private final h:Lokio/e;

.field private i:Lokio/w;

.field private j:I

.field private k:Z

.field private l:J


# direct methods
.method public constructor <init>(Lokio/g;)V
    .locals 1

    .line 1
    const-string v0, "upstream"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lokio/t;->g:Lokio/g;

    .line 10
    .line 11
    invoke-interface {p1}, Lokio/g;->i()Lokio/e;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lokio/t;->h:Lokio/e;

    .line 16
    .line 17
    iget-object p1, p1, Lokio/e;->g:Lokio/w;

    .line 18
    .line 19
    iput-object p1, p0, Lokio/t;->i:Lokio/w;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget p1, p1, Lokio/w;->b:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p1, -0x1

    .line 27
    :goto_0
    iput p1, p0, Lokio/t;->j:I

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lokio/t;->k:Z

    .line 3
    .line 4
    return-void
.end method

.method public read(Lokio/e;J)J
    .locals 8

    .line 1
    const-string v0, "sink"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    cmp-long v2, p2, v0

    .line 9
    .line 10
    if-ltz v2, :cond_6

    .line 11
    .line 12
    iget-boolean v3, p0, Lokio/t;->k:Z

    .line 13
    .line 14
    if-nez v3, :cond_5

    .line 15
    .line 16
    iget-object v3, p0, Lokio/t;->i:Lokio/w;

    .line 17
    .line 18
    if-eqz v3, :cond_1

    .line 19
    .line 20
    iget-object v4, p0, Lokio/t;->h:Lokio/e;

    .line 21
    .line 22
    iget-object v4, v4, Lokio/e;->g:Lokio/w;

    .line 23
    .line 24
    if-ne v3, v4, :cond_0

    .line 25
    .line 26
    iget v3, p0, Lokio/t;->j:I

    .line 27
    .line 28
    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iget v4, v4, Lokio/w;->b:I

    .line 32
    .line 33
    if-ne v3, v4, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 37
    .line 38
    const-string p1, "Peek source is invalid because upstream source was used"

    .line 39
    .line 40
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    throw p0

    .line 44
    :cond_1
    :goto_0
    if-nez v2, :cond_2

    .line 45
    .line 46
    return-wide v0

    .line 47
    :cond_2
    iget-object v0, p0, Lokio/t;->g:Lokio/g;

    .line 48
    .line 49
    iget-wide v1, p0, Lokio/t;->l:J

    .line 50
    .line 51
    const-wide/16 v3, 0x1

    .line 52
    .line 53
    add-long/2addr v1, v3

    .line 54
    invoke-interface {v0, v1, v2}, Lokio/g;->request(J)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_3

    .line 59
    .line 60
    const-wide/16 p0, -0x1

    .line 61
    .line 62
    return-wide p0

    .line 63
    :cond_3
    iget-object v0, p0, Lokio/t;->i:Lokio/w;

    .line 64
    .line 65
    if-nez v0, :cond_4

    .line 66
    .line 67
    iget-object v0, p0, Lokio/t;->h:Lokio/e;

    .line 68
    .line 69
    iget-object v0, v0, Lokio/e;->g:Lokio/w;

    .line 70
    .line 71
    if-eqz v0, :cond_4

    .line 72
    .line 73
    iput-object v0, p0, Lokio/t;->i:Lokio/w;

    .line 74
    .line 75
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    iget v0, v0, Lokio/w;->b:I

    .line 79
    .line 80
    iput v0, p0, Lokio/t;->j:I

    .line 81
    .line 82
    :cond_4
    iget-object v0, p0, Lokio/t;->h:Lokio/e;

    .line 83
    .line 84
    invoke-virtual {v0}, Lokio/e;->size()J

    .line 85
    .line 86
    .line 87
    move-result-wide v0

    .line 88
    iget-wide v2, p0, Lokio/t;->l:J

    .line 89
    .line 90
    sub-long/2addr v0, v2

    .line 91
    invoke-static {p2, p3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 92
    .line 93
    .line 94
    move-result-wide v6

    .line 95
    iget-object v2, p0, Lokio/t;->h:Lokio/e;

    .line 96
    .line 97
    iget-wide v4, p0, Lokio/t;->l:J

    .line 98
    .line 99
    move-object v3, p1

    .line 100
    invoke-virtual/range {v2 .. v7}, Lokio/e;->t(Lokio/e;JJ)Lokio/e;

    .line 101
    .line 102
    .line 103
    iget-wide p1, p0, Lokio/t;->l:J

    .line 104
    .line 105
    add-long/2addr p1, v6

    .line 106
    iput-wide p1, p0, Lokio/t;->l:J

    .line 107
    .line 108
    return-wide v6

    .line 109
    :cond_5
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 110
    .line 111
    const-string p1, "closed"

    .line 112
    .line 113
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    throw p0

    .line 117
    :cond_6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .line 121
    .line 122
    const-string p1, "byteCount < 0: "

    .line 123
    .line 124
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 135
    .line 136
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    throw p1
.end method

.method public timeout()Lokio/C;
    .locals 0

    .line 1
    iget-object p0, p0, Lokio/t;->g:Lokio/g;

    .line 2
    .line 3
    invoke-interface {p0}, Lokio/B;->timeout()Lokio/C;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
