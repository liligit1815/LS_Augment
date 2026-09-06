.class public final LO4/A;
.super LO4/F;
.source "MultipartBody.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LO4/A$a;,
        LO4/A$b;
    }
.end annotation


# static fields
.field public static final f:LO4/z;

.field public static final g:LO4/z;

.field public static final h:LO4/z;

.field public static final i:LO4/z;

.field public static final j:LO4/z;

.field private static final k:[B

.field private static final l:[B

.field private static final m:[B


# instance fields
.field private final a:Lokio/h;

.field private final b:LO4/z;

.field private final c:LO4/z;

.field private final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LO4/A$b;",
            ">;"
        }
    .end annotation
.end field

.field private e:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "multipart/mixed"

    .line 2
    .line 3
    invoke-static {v0}, LO4/z;->c(Ljava/lang/String;)LO4/z;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, LO4/A;->f:LO4/z;

    .line 8
    .line 9
    const-string v0, "multipart/alternative"

    .line 10
    .line 11
    invoke-static {v0}, LO4/z;->c(Ljava/lang/String;)LO4/z;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, LO4/A;->g:LO4/z;

    .line 16
    .line 17
    const-string v0, "multipart/digest"

    .line 18
    .line 19
    invoke-static {v0}, LO4/z;->c(Ljava/lang/String;)LO4/z;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, LO4/A;->h:LO4/z;

    .line 24
    .line 25
    const-string v0, "multipart/parallel"

    .line 26
    .line 27
    invoke-static {v0}, LO4/z;->c(Ljava/lang/String;)LO4/z;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, LO4/A;->i:LO4/z;

    .line 32
    .line 33
    const-string v0, "multipart/form-data"

    .line 34
    .line 35
    invoke-static {v0}, LO4/z;->c(Ljava/lang/String;)LO4/z;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sput-object v0, LO4/A;->j:LO4/z;

    .line 40
    .line 41
    const/4 v0, 0x2

    .line 42
    new-array v1, v0, [B

    .line 43
    .line 44
    fill-array-data v1, :array_0

    .line 45
    .line 46
    .line 47
    sput-object v1, LO4/A;->k:[B

    .line 48
    .line 49
    new-array v1, v0, [B

    .line 50
    .line 51
    fill-array-data v1, :array_1

    .line 52
    .line 53
    .line 54
    sput-object v1, LO4/A;->l:[B

    .line 55
    .line 56
    new-array v0, v0, [B

    .line 57
    .line 58
    fill-array-data v0, :array_2

    .line 59
    .line 60
    .line 61
    sput-object v0, LO4/A;->m:[B

    .line 62
    .line 63
    return-void

    .line 64
    nop

    .line 65
    :array_0
    .array-data 1
        0x3at
        0x20t
    .end array-data

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    nop

    .line 71
    :array_1
    .array-data 1
        0xdt
        0xat
    .end array-data

    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    nop

    .line 77
    :array_2
    .array-data 1
        0x2dt
        0x2dt
    .end array-data
.end method

.method constructor <init>(Lokio/h;LO4/z;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokio/h;",
            "LO4/z;",
            "Ljava/util/List<",
            "LO4/A$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, LO4/F;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, LO4/A;->e:J

    .line 7
    .line 8
    iput-object p1, p0, LO4/A;->a:Lokio/h;

    .line 9
    .line 10
    iput-object p2, p0, LO4/A;->b:LO4/z;

    .line 11
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string p2, "; boundary="

    .line 21
    .line 22
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Lokio/h;->D()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p1}, LO4/z;->c(Ljava/lang/String;)LO4/z;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, LO4/A;->c:LO4/z;

    .line 41
    .line 42
    invoke-static {p3}, Lokhttp3/internal/Util;->immutableList(Ljava/util/List;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, p0, LO4/A;->d:Ljava/util/List;

    .line 47
    .line 48
    return-void
.end method

.method private a(Lokio/f;Z)J
    .locals 12
    .param p1    # Lokio/f;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    new-instance p1, Lokio/e;

    .line 4
    .line 5
    invoke-direct {p1}, Lokio/e;-><init>()V

    .line 6
    .line 7
    .line 8
    move-object v0, p1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    iget-object v1, p0, LO4/A;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x0

    .line 18
    const-wide/16 v3, 0x0

    .line 19
    .line 20
    move v5, v2

    .line 21
    :goto_1
    if-ge v5, v1, :cond_6

    .line 22
    .line 23
    iget-object v6, p0, LO4/A;->d:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    check-cast v6, LO4/A$b;

    .line 30
    .line 31
    iget-object v7, v6, LO4/A$b;->a:LO4/w;

    .line 32
    .line 33
    iget-object v6, v6, LO4/A$b;->b:LO4/F;

    .line 34
    .line 35
    sget-object v8, LO4/A;->m:[B

    .line 36
    .line 37
    invoke-interface {p1, v8}, Lokio/f;->write([B)Lokio/f;

    .line 38
    .line 39
    .line 40
    iget-object v8, p0, LO4/A;->a:Lokio/h;

    .line 41
    .line 42
    invoke-interface {p1, v8}, Lokio/f;->V(Lokio/h;)Lokio/f;

    .line 43
    .line 44
    .line 45
    sget-object v8, LO4/A;->l:[B

    .line 46
    .line 47
    invoke-interface {p1, v8}, Lokio/f;->write([B)Lokio/f;

    .line 48
    .line 49
    .line 50
    if-eqz v7, :cond_1

    .line 51
    .line 52
    invoke-virtual {v7}, LO4/w;->h()I

    .line 53
    .line 54
    .line 55
    move-result v8

    .line 56
    move v9, v2

    .line 57
    :goto_2
    if-ge v9, v8, :cond_1

    .line 58
    .line 59
    invoke-virtual {v7, v9}, LO4/w;->e(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v10

    .line 63
    invoke-interface {p1, v10}, Lokio/f;->q(Ljava/lang/String;)Lokio/f;

    .line 64
    .line 65
    .line 66
    move-result-object v10

    .line 67
    sget-object v11, LO4/A;->k:[B

    .line 68
    .line 69
    invoke-interface {v10, v11}, Lokio/f;->write([B)Lokio/f;

    .line 70
    .line 71
    .line 72
    move-result-object v10

    .line 73
    invoke-virtual {v7, v9}, LO4/w;->i(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v11

    .line 77
    invoke-interface {v10, v11}, Lokio/f;->q(Ljava/lang/String;)Lokio/f;

    .line 78
    .line 79
    .line 80
    move-result-object v10

    .line 81
    sget-object v11, LO4/A;->l:[B

    .line 82
    .line 83
    invoke-interface {v10, v11}, Lokio/f;->write([B)Lokio/f;

    .line 84
    .line 85
    .line 86
    add-int/lit8 v9, v9, 0x1

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_1
    invoke-virtual {v6}, LO4/F;->contentType()LO4/z;

    .line 90
    .line 91
    .line 92
    move-result-object v7

    .line 93
    if-eqz v7, :cond_2

    .line 94
    .line 95
    const-string v8, "Content-Type: "

    .line 96
    .line 97
    invoke-interface {p1, v8}, Lokio/f;->q(Ljava/lang/String;)Lokio/f;

    .line 98
    .line 99
    .line 100
    move-result-object v8

    .line 101
    invoke-virtual {v7}, LO4/z;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v7

    .line 105
    invoke-interface {v8, v7}, Lokio/f;->q(Ljava/lang/String;)Lokio/f;

    .line 106
    .line 107
    .line 108
    move-result-object v7

    .line 109
    sget-object v8, LO4/A;->l:[B

    .line 110
    .line 111
    invoke-interface {v7, v8}, Lokio/f;->write([B)Lokio/f;

    .line 112
    .line 113
    .line 114
    :cond_2
    invoke-virtual {v6}, LO4/F;->contentLength()J

    .line 115
    .line 116
    .line 117
    move-result-wide v7

    .line 118
    const-wide/16 v9, -0x1

    .line 119
    .line 120
    cmp-long v11, v7, v9

    .line 121
    .line 122
    if-eqz v11, :cond_3

    .line 123
    .line 124
    const-string v9, "Content-Length: "

    .line 125
    .line 126
    invoke-interface {p1, v9}, Lokio/f;->q(Ljava/lang/String;)Lokio/f;

    .line 127
    .line 128
    .line 129
    move-result-object v9

    .line 130
    invoke-interface {v9, v7, v8}, Lokio/f;->H(J)Lokio/f;

    .line 131
    .line 132
    .line 133
    move-result-object v9

    .line 134
    sget-object v10, LO4/A;->l:[B

    .line 135
    .line 136
    invoke-interface {v9, v10}, Lokio/f;->write([B)Lokio/f;

    .line 137
    .line 138
    .line 139
    goto :goto_3

    .line 140
    :cond_3
    if-eqz p2, :cond_4

    .line 141
    .line 142
    invoke-virtual {v0}, Lokio/e;->b()V

    .line 143
    .line 144
    .line 145
    return-wide v9

    .line 146
    :cond_4
    :goto_3
    sget-object v9, LO4/A;->l:[B

    .line 147
    .line 148
    invoke-interface {p1, v9}, Lokio/f;->write([B)Lokio/f;

    .line 149
    .line 150
    .line 151
    if-eqz p2, :cond_5

    .line 152
    .line 153
    add-long/2addr v3, v7

    .line 154
    goto :goto_4

    .line 155
    :cond_5
    invoke-virtual {v6, p1}, LO4/F;->writeTo(Lokio/f;)V

    .line 156
    .line 157
    .line 158
    :goto_4
    invoke-interface {p1, v9}, Lokio/f;->write([B)Lokio/f;

    .line 159
    .line 160
    .line 161
    add-int/lit8 v5, v5, 0x1

    .line 162
    .line 163
    goto/16 :goto_1

    .line 164
    .line 165
    :cond_6
    sget-object v1, LO4/A;->m:[B

    .line 166
    .line 167
    invoke-interface {p1, v1}, Lokio/f;->write([B)Lokio/f;

    .line 168
    .line 169
    .line 170
    iget-object p0, p0, LO4/A;->a:Lokio/h;

    .line 171
    .line 172
    invoke-interface {p1, p0}, Lokio/f;->V(Lokio/h;)Lokio/f;

    .line 173
    .line 174
    .line 175
    invoke-interface {p1, v1}, Lokio/f;->write([B)Lokio/f;

    .line 176
    .line 177
    .line 178
    sget-object p0, LO4/A;->l:[B

    .line 179
    .line 180
    invoke-interface {p1, p0}, Lokio/f;->write([B)Lokio/f;

    .line 181
    .line 182
    .line 183
    if-eqz p2, :cond_7

    .line 184
    .line 185
    invoke-virtual {v0}, Lokio/e;->size()J

    .line 186
    .line 187
    .line 188
    move-result-wide p0

    .line 189
    add-long/2addr v3, p0

    .line 190
    invoke-virtual {v0}, Lokio/e;->b()V

    .line 191
    .line 192
    .line 193
    :cond_7
    return-wide v3
.end method


# virtual methods
.method public contentLength()J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-wide v0, p0, LO4/A;->e:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-direct {p0, v0, v1}, LO4/A;->a(Lokio/f;Z)J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    iput-wide v0, p0, LO4/A;->e:J

    .line 17
    .line 18
    return-wide v0
.end method

.method public contentType()LO4/z;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/A;->c:LO4/z;

    .line 2
    .line 3
    return-object p0
.end method

.method public writeTo(Lokio/f;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, LO4/A;->a(Lokio/f;Z)J

    .line 3
    .line 4
    .line 5
    return-void
.end method
