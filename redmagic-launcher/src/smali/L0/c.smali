.class public final LL0/c;
.super LL0/n;
.source "PerfettoViewCapture.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LL0/c$a;,
        LL0/c$b;
    }
.end annotation


# static fields
.field public static final o:LL0/c$a;

.field private static final p:I


# instance fields
.field private final i:Landroid/content/Context;

.field private final j:LL0/s;

.field private final k:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final l:LL0/n$a;

.field private m:I

.field private n:LL0/n$b;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LL0/c$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LL0/c$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LL0/c;->o:LL0/c$a;

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    sput v0, LL0/c;->p:I

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/concurrent/Executor;)V
    .locals 3

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "executor"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget v0, LL0/c;->p:I

    .line 12
    .line 13
    const/16 v1, 0x12c

    .line 14
    .line 15
    invoke-direct {p0, v0, v1, p2}, LL0/n;-><init>(IILjava/util/concurrent/Executor;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, LL0/c;->i:Landroid/content/Context;

    .line 19
    .line 20
    new-instance p2, LL0/s;

    .line 21
    .line 22
    new-instance v0, LL0/c$c;

    .line 23
    .line 24
    invoke-direct {v0, p0}, LL0/c$c;-><init>(LL0/c;)V

    .line 25
    .line 26
    .line 27
    sget-object v1, LL0/c$d;->g:LL0/c$d;

    .line 28
    .line 29
    new-instance v2, LL0/c$e;

    .line 30
    .line 31
    invoke-direct {v2, p0}, LL0/c$e;-><init>(LL0/c;)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p2, v0, v1, v2}, LL0/s;-><init>(Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    iput-object p2, p0, LL0/c;->j:LL0/s;

    .line 38
    .line 39
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, LL0/c;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 46
    .line 47
    new-instance v0, LL0/n$a;

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-direct {v0, p1}, LL0/n$a;-><init>(Landroid/content/res/Resources;)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, LL0/c;->l:LL0/n$a;

    .line 57
    .line 58
    invoke-virtual {p0, v1}, LL0/n;->j(Z)V

    .line 59
    .line 60
    .line 61
    sget-object p0, Landroid/tracing/perfetto/InitArguments;->DEFAULTS:Landroid/tracing/perfetto/InitArguments;

    .line 62
    .line 63
    invoke-static {p0}, Landroid/tracing/perfetto/Producer;->init(Landroid/tracing/perfetto/InitArguments;)V

    .line 64
    .line 65
    .line 66
    new-instance p0, Landroid/tracing/perfetto/DataSourceParams$Builder;

    .line 67
    .line 68
    invoke-direct {p0}, Landroid/tracing/perfetto/DataSourceParams$Builder;-><init>()V

    .line 69
    .line 70
    .line 71
    const/4 p1, 0x1

    .line 72
    invoke-virtual {p0, p1}, Landroid/tracing/perfetto/DataSourceParams$Builder;->setBufferExhaustedPolicy(I)Landroid/tracing/perfetto/DataSourceParams$Builder;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0, p1}, Landroid/tracing/perfetto/DataSourceParams$Builder;->setNoFlush(Z)Landroid/tracing/perfetto/DataSourceParams$Builder;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0, v1}, Landroid/tracing/perfetto/DataSourceParams$Builder;->setWillNotifyOnStop(Z)Landroid/tracing/perfetto/DataSourceParams$Builder;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0}, Landroid/tracing/perfetto/DataSourceParams$Builder;->build()Landroid/tracing/perfetto/DataSourceParams;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p2, p0}, Landroid/tracing/perfetto/DataSource;->register(Landroid/tracing/perfetto/DataSourceParams;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method private final C(Landroid/util/proto/ProtoOutputStream;LL0/s$b;LL0/c$b;)V
    .locals 8

    .line 1
    iget-boolean v0, p2, LL0/s$b;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p2, LL0/s$b;->e:Z

    .line 7
    .line 8
    const/4 v0, 0x3

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x2

    .line 11
    :goto_0
    const-wide v2, 0x10d0000000dL

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v2, v3, v0}, Landroid/util/proto/ProtoOutputStream;->write(JI)V

    .line 17
    .line 18
    .line 19
    const-wide v2, 0x10b0000000cL

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v2, v3}, Landroid/util/proto/ProtoOutputStream;->start(J)J

    .line 25
    .line 26
    .line 27
    move-result-wide v6

    .line 28
    iget-object v4, p2, LL0/s$b;->d:Ljava/util/Map;

    .line 29
    .line 30
    const-string v0, "mInternMapClassName"

    .line 31
    .line 32
    invoke-static {v4, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p3}, LL0/c$b;->a()Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    const-wide v2, 0x20b00000029L

    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    move-object v0, p0

    .line 45
    move-object v1, p1

    .line 46
    invoke-direct/range {v0 .. v5}, LL0/c;->D(Landroid/util/proto/ProtoOutputStream;JLjava/util/Map;Ljava/util/List;)V

    .line 47
    .line 48
    .line 49
    iget-object v4, p2, LL0/s$b;->a:Ljava/util/Map;

    .line 50
    .line 51
    const-string v0, "mInternMapPackageName"

    .line 52
    .line 53
    invoke-static {v4, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p3}, LL0/c$b;->b()Ljava/util/List;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    const-wide v2, 0x20b00000026L

    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    move-object v0, p0

    .line 66
    invoke-direct/range {v0 .. v5}, LL0/c;->D(Landroid/util/proto/ProtoOutputStream;JLjava/util/Map;Ljava/util/List;)V

    .line 67
    .line 68
    .line 69
    iget-object v4, p2, LL0/s$b;->c:Ljava/util/Map;

    .line 70
    .line 71
    const-string v0, "mInternMapViewId"

    .line 72
    .line 73
    invoke-static {v4, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p3}, LL0/c$b;->c()Ljava/util/List;

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    const-wide v2, 0x20b00000028L

    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    move-object v0, p0

    .line 86
    invoke-direct/range {v0 .. v5}, LL0/c;->D(Landroid/util/proto/ProtoOutputStream;JLjava/util/Map;Ljava/util/List;)V

    .line 87
    .line 88
    .line 89
    iget-object v4, p2, LL0/s$b;->b:Ljava/util/Map;

    .line 90
    .line 91
    const-string v0, "mInternMapWindowName"

    .line 92
    .line 93
    invoke-static {v4, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p3}, LL0/c$b;->d()Ljava/util/List;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    const-wide v2, 0x20b00000027L

    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    move-object v0, p0

    .line 106
    invoke-direct/range {v0 .. v5}, LL0/c;->D(Landroid/util/proto/ProtoOutputStream;JLjava/util/Map;Ljava/util/List;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1, v6, v7}, Landroid/util/proto/ProtoOutputStream;->end(J)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method private final D(Landroid/util/proto/ProtoOutputStream;JLjava/util/Map;Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/proto/ProtoOutputStream;",
            "J",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p5}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-interface {p4}, Ljava/util/Map;->size()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-interface {p5}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result p4

    .line 16
    sub-int/2addr p0, p4

    .line 17
    add-int/lit8 p0, p0, 0x1

    .line 18
    .line 19
    invoke-interface {p5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    :goto_0
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result p5

    .line 27
    if-eqz p5, :cond_1

    .line 28
    .line 29
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p5

    .line 33
    check-cast p5, Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p1, p2, p3}, Landroid/util/proto/ProtoOutputStream;->start(J)J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    add-int/lit8 v2, p0, 0x1

    .line 40
    .line 41
    const-wide v3, 0x10400000001L

    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v3, v4, p0}, Landroid/util/proto/ProtoOutputStream;->write(JI)V

    .line 47
    .line 48
    .line 49
    sget-object p0, LD4/d;->b:Ljava/nio/charset/Charset;

    .line 50
    .line 51
    invoke-virtual {p5, p0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p5, "getBytes(...)"

    .line 56
    .line 57
    invoke-static {p0, p5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    const-wide v3, 0x10c00000002L

    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v3, v4, p0}, Landroid/util/proto/ProtoOutputStream;->write(J[B)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v0, v1}, Landroid/util/proto/ProtoOutputStream;->end(J)V

    .line 69
    .line 70
    .line 71
    move p0, v2

    .line 72
    goto :goto_0

    .line 73
    :cond_1
    :goto_1
    return-void
.end method

.method private final E(Landroid/util/proto/ProtoOutputStream;LL0/n$b;IILL0/s$b;LL0/c$b;)V
    .locals 4

    .line 1
    const-wide v0, 0x20b00000003L

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0, v1}, Landroid/util/proto/ProtoOutputStream;->start(J)J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    const-wide v2, 0x10500000001L

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v2, v3, p3}, Landroid/util/proto/ProtoOutputStream;->write(JI)V

    .line 16
    .line 17
    .line 18
    const-wide v2, 0x10500000002L

    .line 19
    .line 20
    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v2, v3, p4}, Landroid/util/proto/ProtoOutputStream;->write(JI)V

    .line 24
    .line 25
    .line 26
    iget p3, p2, LL0/n$b;->i:I

    .line 27
    .line 28
    const-wide v2, 0x10500000003L

    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v2, v3, p3}, Landroid/util/proto/ProtoOutputStream;->write(JI)V

    .line 34
    .line 35
    .line 36
    iget-object p3, p0, LL0/c;->l:LL0/n$a;

    .line 37
    .line 38
    iget p4, p2, LL0/n$b;->j:I

    .line 39
    .line 40
    invoke-virtual {p3, p4}, LL0/n$a;->a(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    const-string p4, "getName(...)"

    .line 45
    .line 46
    invoke-static {p3, p4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-direct {p0, p3, p5, p6}, LL0/c;->y(Ljava/lang/String;LL0/s$b;LL0/c$b;)I

    .line 50
    .line 51
    .line 52
    move-result p3

    .line 53
    const-wide v2, 0x10500000004L

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, v2, v3, p3}, Landroid/util/proto/ProtoOutputStream;->write(JI)V

    .line 59
    .line 60
    .line 61
    iget-object p3, p2, LL0/n$b;->h:Ljava/lang/Class;

    .line 62
    .line 63
    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    invoke-static {p3, p4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-direct {p0, p3, p5, p6}, LL0/c;->v(Ljava/lang/String;LL0/s$b;LL0/c$b;)I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    const-wide p3, 0x10500000005L

    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, p3, p4, p0}, Landroid/util/proto/ProtoOutputStream;->write(JI)V

    .line 80
    .line 81
    .line 82
    const-wide p3, 0x10500000006L

    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    iget p0, p2, LL0/n$b;->k:I

    .line 88
    .line 89
    invoke-virtual {p1, p3, p4, p0}, Landroid/util/proto/ProtoOutputStream;->write(JI)V

    .line 90
    .line 91
    .line 92
    const-wide p3, 0x10500000007L

    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    iget p0, p2, LL0/n$b;->l:I

    .line 98
    .line 99
    invoke-virtual {p1, p3, p4, p0}, Landroid/util/proto/ProtoOutputStream;->write(JI)V

    .line 100
    .line 101
    .line 102
    iget p0, p2, LL0/n$b;->m:I

    .line 103
    .line 104
    iget p3, p2, LL0/n$b;->k:I

    .line 105
    .line 106
    sub-int/2addr p0, p3

    .line 107
    const-wide p3, 0x10500000008L

    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    invoke-virtual {p1, p3, p4, p0}, Landroid/util/proto/ProtoOutputStream;->write(JI)V

    .line 113
    .line 114
    .line 115
    iget p0, p2, LL0/n$b;->n:I

    .line 116
    .line 117
    iget p3, p2, LL0/n$b;->l:I

    .line 118
    .line 119
    sub-int/2addr p0, p3

    .line 120
    const-wide p3, 0x10500000009L

    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, p3, p4, p0}, Landroid/util/proto/ProtoOutputStream;->write(JI)V

    .line 126
    .line 127
    .line 128
    const-wide p3, 0x1050000000aL

    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    iget p0, p2, LL0/n$b;->o:I

    .line 134
    .line 135
    invoke-virtual {p1, p3, p4, p0}, Landroid/util/proto/ProtoOutputStream;->write(JI)V

    .line 136
    .line 137
    .line 138
    const-wide p3, 0x1050000000bL

    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    iget p0, p2, LL0/n$b;->p:I

    .line 144
    .line 145
    invoke-virtual {p1, p3, p4, p0}, Landroid/util/proto/ProtoOutputStream;->write(JI)V

    .line 146
    .line 147
    .line 148
    const-wide p3, 0x1020000000cL

    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    iget p0, p2, LL0/n$b;->q:F

    .line 154
    .line 155
    invoke-virtual {p1, p3, p4, p0}, Landroid/util/proto/ProtoOutputStream;->write(JF)V

    .line 156
    .line 157
    .line 158
    const-wide p3, 0x1020000000dL

    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    iget p0, p2, LL0/n$b;->r:F

    .line 164
    .line 165
    invoke-virtual {p1, p3, p4, p0}, Landroid/util/proto/ProtoOutputStream;->write(JF)V

    .line 166
    .line 167
    .line 168
    const-wide p3, 0x1020000000eL

    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    iget p0, p2, LL0/n$b;->s:F

    .line 174
    .line 175
    invoke-virtual {p1, p3, p4, p0}, Landroid/util/proto/ProtoOutputStream;->write(JF)V

    .line 176
    .line 177
    .line 178
    const-wide p3, 0x1020000000fL

    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    iget p0, p2, LL0/n$b;->t:F

    .line 184
    .line 185
    invoke-virtual {p1, p3, p4, p0}, Landroid/util/proto/ProtoOutputStream;->write(JF)V

    .line 186
    .line 187
    .line 188
    const-wide p3, 0x10200000010L

    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    iget p0, p2, LL0/n$b;->u:F

    .line 194
    .line 195
    invoke-virtual {p1, p3, p4, p0}, Landroid/util/proto/ProtoOutputStream;->write(JF)V

    .line 196
    .line 197
    .line 198
    const-wide p3, 0x10800000011L

    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    iget-boolean p0, p2, LL0/n$b;->x:Z

    .line 204
    .line 205
    invoke-virtual {p1, p3, p4, p0}, Landroid/util/proto/ProtoOutputStream;->write(JZ)V

    .line 206
    .line 207
    .line 208
    const-wide p3, 0x10800000012L

    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    iget-boolean p0, p2, LL0/n$b;->y:Z

    .line 214
    .line 215
    invoke-virtual {p1, p3, p4, p0}, Landroid/util/proto/ProtoOutputStream;->write(JZ)V

    .line 216
    .line 217
    .line 218
    const-wide p3, 0x10500000013L

    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    iget p0, p2, LL0/n$b;->w:I

    .line 224
    .line 225
    invoke-virtual {p1, p3, p4, p0}, Landroid/util/proto/ProtoOutputStream;->write(JI)V

    .line 226
    .line 227
    .line 228
    const-wide p3, 0x10200000014L

    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    iget p0, p2, LL0/n$b;->v:F

    .line 234
    .line 235
    invoke-virtual {p1, p3, p4, p0}, Landroid/util/proto/ProtoOutputStream;->write(JF)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {p1, v0, v1}, Landroid/util/proto/ProtoOutputStream;->end(J)V

    .line 239
    .line 240
    .line 241
    return-void
.end method

.method private final F(Landroid/util/proto/ProtoOutputStream;Ljava/lang/String;LL0/n$b;LL0/s$b;LL0/c$b;)V
    .locals 6

    .line 1
    iput-object p3, p0, LL0/c;->n:LL0/n$b;

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    iput p3, p0, LL0/c;->m:I

    .line 5
    .line 6
    const-wide v0, 0x10b00000070L

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v0, v1}, Landroid/util/proto/ProtoOutputStream;->start(J)J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    const-wide v2, 0x10b00000004L

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v2, v3}, Landroid/util/proto/ProtoOutputStream;->start(J)J

    .line 21
    .line 22
    .line 23
    move-result-wide v2

    .line 24
    iget-object p3, p0, LL0/c;->i:Landroid/content/Context;

    .line 25
    .line 26
    invoke-virtual {p3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    const-string v4, "getPackageName(...)"

    .line 31
    .line 32
    invoke-static {p3, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-direct {p0, p3, p4, p5}, LL0/c;->w(Ljava/lang/String;LL0/s$b;LL0/c$b;)I

    .line 36
    .line 37
    .line 38
    move-result p3

    .line 39
    const-wide v4, 0x10500000001L

    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v4, v5, p3}, Landroid/util/proto/ProtoOutputStream;->write(JI)V

    .line 45
    .line 46
    .line 47
    const-wide v4, 0x10500000002L

    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    invoke-direct {p0, p2, p4, p5}, LL0/c;->z(Ljava/lang/String;LL0/s$b;LL0/c$b;)I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    invoke-virtual {p1, v4, v5, p2}, Landroid/util/proto/ProtoOutputStream;->write(JI)V

    .line 57
    .line 58
    .line 59
    const/4 p2, -0x1

    .line 60
    invoke-direct {p0, p1, p2, p4, p5}, LL0/c;->G(Landroid/util/proto/ProtoOutputStream;ILL0/s$b;LL0/c$b;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v2, v3}, Landroid/util/proto/ProtoOutputStream;->end(J)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, v0, v1}, Landroid/util/proto/ProtoOutputStream;->end(J)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method private final G(Landroid/util/proto/ProtoOutputStream;ILL0/s$b;LL0/c$b;)V
    .locals 9

    .line 1
    iget-object v0, p0, LL0/c;->n:LL0/n$b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget v1, p0, LL0/c;->m:I

    .line 7
    .line 8
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget v0, v0, LL0/n$b;->z:I

    .line 12
    .line 13
    iget-object v4, p0, LL0/c;->n:LL0/n$b;

    .line 14
    .line 15
    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget v5, p0, LL0/c;->m:I

    .line 19
    .line 20
    move-object v2, p0

    .line 21
    move-object v3, p1

    .line 22
    move v6, p2

    .line 23
    move-object v7, p3

    .line 24
    move-object v8, p4

    .line 25
    invoke-direct/range {v2 .. v8}, LL0/c;->E(Landroid/util/proto/ProtoOutputStream;LL0/n$b;IILL0/s$b;LL0/c$b;)V

    .line 26
    .line 27
    .line 28
    iget p0, v2, LL0/c;->m:I

    .line 29
    .line 30
    add-int/lit8 p0, p0, 0x1

    .line 31
    .line 32
    iput p0, v2, LL0/c;->m:I

    .line 33
    .line 34
    iget-object p0, v2, LL0/c;->n:LL0/n$b;

    .line 35
    .line 36
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, LL0/n$b;->A:LL0/n$b;

    .line 40
    .line 41
    iput-object p0, v2, LL0/c;->n:LL0/n$b;

    .line 42
    .line 43
    add-int/lit8 v0, v0, -0x1

    .line 44
    .line 45
    if-ltz v0, :cond_1

    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    :goto_0
    invoke-direct {v2, v3, v1, v7, v8}, LL0/c;->G(Landroid/util/proto/ProtoOutputStream;ILL0/s$b;LL0/c$b;)V

    .line 49
    .line 50
    .line 51
    if-eq p0, v0, :cond_1

    .line 52
    .line 53
    add-int/lit8 p0, p0, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    :goto_1
    return-void
.end method

.method public static final synthetic t(LL0/c;Landroid/util/proto/ProtoOutputStream;LL0/s$b;LL0/c$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, LL0/c;->C(Landroid/util/proto/ProtoOutputStream;LL0/s$b;LL0/c$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic u(LL0/c;Landroid/util/proto/ProtoOutputStream;Ljava/lang/String;LL0/n$b;LL0/s$b;LL0/c$b;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, LL0/c;->F(Landroid/util/proto/ProtoOutputStream;Ljava/lang/String;LL0/n$b;LL0/s$b;LL0/c$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final v(Ljava/lang/String;LL0/s$b;LL0/c$b;)I
    .locals 1

    .line 1
    iget-object p2, p2, LL0/s$b;->d:Ljava/util/Map;

    .line 2
    .line 3
    const-string v0, "mInternMapClassName"

    .line 4
    .line 5
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p3}, LL0/c$b;->a()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-direct {p0, p1, p2, p3}, LL0/c;->x(Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method private final w(Ljava/lang/String;LL0/s$b;LL0/c$b;)I
    .locals 1

    .line 1
    iget-object p2, p2, LL0/s$b;->a:Ljava/util/Map;

    .line 2
    .line 3
    const-string v0, "mInternMapPackageName"

    .line 4
    .line 5
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p3}, LL0/c$b;->b()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-direct {p0, p1, p2, p3}, LL0/c;->x(Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method private final x(Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-interface {p2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    check-cast p0, Ljava/lang/Number;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_0
    invoke-interface {p2}, Ljava/util/Map;->size()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    add-int/lit8 p0, p0, 0x1

    .line 26
    .line 27
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    return p0
.end method

.method private final y(Ljava/lang/String;LL0/s$b;LL0/c$b;)I
    .locals 1

    .line 1
    iget-object p2, p2, LL0/s$b;->c:Ljava/util/Map;

    .line 2
    .line 3
    const-string v0, "mInternMapViewId"

    .line 4
    .line 5
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p3}, LL0/c$b;->c()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-direct {p0, p1, p2, p3}, LL0/c;->x(Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method private final z(Ljava/lang/String;LL0/s$b;LL0/c$b;)I
    .locals 1

    .line 1
    iget-object p2, p2, LL0/s$b;->b:Ljava/util/Map;

    .line 2
    .line 3
    const-string v0, "mInternMapWindowName"

    .line 4
    .line 5
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p3}, LL0/c$b;->d()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-direct {p0, p1, p2, p3}, LL0/c;->x(Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method


# virtual methods
.method public final A()V
    .locals 2

    .line 1
    iget-object v0, p0, LL0/c;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v1}, LL0/n;->j(Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final B()V
    .locals 1

    .line 1
    iget-object v0, p0, LL0/c;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, LL0/n;->j(Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method protected o(JLjava/lang/String;LL0/n$b;)V
    .locals 7

    .line 1
    const-string v0, "windowName"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "startFlattenedTree"

    .line 7
    .line 8
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "vc#onCapturedViewPropertiesBg"

    .line 12
    .line 13
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, LL0/c;->j:LL0/s;

    .line 17
    .line 18
    new-instance v1, LL0/c$f;

    .line 19
    .line 20
    move-object v2, p0

    .line 21
    move-wide v3, p1

    .line 22
    move-object v5, p3

    .line 23
    move-object v6, p4

    .line 24
    invoke-direct/range {v1 .. v6}, LL0/c$f;-><init>(LL0/c;JLjava/lang/String;LL0/n$b;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/tracing/perfetto/DataSource;->trace(Landroid/tracing/perfetto/TraceFunction;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 31
    .line 32
    .line 33
    return-void
.end method
