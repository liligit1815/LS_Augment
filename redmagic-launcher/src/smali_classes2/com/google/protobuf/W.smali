.class final Lcom/google/protobuf/W;
.super Ljava/lang/Object;
.source "MessageSchema.java"

# interfaces
.implements Lcom/google/protobuf/j0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/protobuf/j0<",
        "TT;>;"
    }
.end annotation


# static fields
.field private static final r:[I

.field private static final s:Lsun/misc/Unsafe;


# instance fields
.field private final a:[I

.field private final b:[Ljava/lang/Object;

.field private final c:I

.field private final d:I

.field private final e:Lcom/google/protobuf/T;

.field private final f:Z

.field private final g:Z

.field private final h:Lcom/google/protobuf/e0;

.field private final i:Z

.field private final j:[I

.field private final k:I

.field private final l:I

.field private final m:Lcom/google/protobuf/Y;

.field private final n:Lcom/google/protobuf/I;

.field private final o:Lcom/google/protobuf/q0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/q0<",
            "**>;"
        }
    .end annotation
.end field

.field private final p:Lcom/google/protobuf/q;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/q<",
            "*>;"
        }
    .end annotation
.end field

.field private final q:Lcom/google/protobuf/N;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    sput-object v0, Lcom/google/protobuf/W;->r:[I

    .line 5
    .line 6
    invoke-static {}, Lcom/google/protobuf/u0;->H()Lsun/misc/Unsafe;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Lcom/google/protobuf/W;->s:Lsun/misc/Unsafe;

    .line 11
    .line 12
    return-void
.end method

.method private constructor <init>([I[Ljava/lang/Object;IILcom/google/protobuf/T;Lcom/google/protobuf/e0;Z[IIILcom/google/protobuf/Y;Lcom/google/protobuf/I;Lcom/google/protobuf/q0;Lcom/google/protobuf/q;Lcom/google/protobuf/N;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I[",
            "Ljava/lang/Object;",
            "II",
            "Lcom/google/protobuf/T;",
            "Lcom/google/protobuf/e0;",
            "Z[III",
            "Lcom/google/protobuf/Y;",
            "Lcom/google/protobuf/I;",
            "Lcom/google/protobuf/q0<",
            "**>;",
            "Lcom/google/protobuf/q<",
            "*>;",
            "Lcom/google/protobuf/N;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/protobuf/W;->a:[I

    .line 3
    iput-object p2, p0, Lcom/google/protobuf/W;->b:[Ljava/lang/Object;

    .line 4
    iput p3, p0, Lcom/google/protobuf/W;->c:I

    .line 5
    iput p4, p0, Lcom/google/protobuf/W;->d:I

    .line 6
    instance-of p1, p5, Lcom/google/protobuf/y;

    iput-boolean p1, p0, Lcom/google/protobuf/W;->g:Z

    .line 7
    iput-object p6, p0, Lcom/google/protobuf/W;->h:Lcom/google/protobuf/e0;

    if-eqz p14, :cond_0

    .line 8
    invoke-virtual {p14, p5}, Lcom/google/protobuf/q;->e(Lcom/google/protobuf/T;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/google/protobuf/W;->f:Z

    .line 9
    iput-boolean p7, p0, Lcom/google/protobuf/W;->i:Z

    .line 10
    iput-object p8, p0, Lcom/google/protobuf/W;->j:[I

    .line 11
    iput p9, p0, Lcom/google/protobuf/W;->k:I

    .line 12
    iput p10, p0, Lcom/google/protobuf/W;->l:I

    .line 13
    iput-object p11, p0, Lcom/google/protobuf/W;->m:Lcom/google/protobuf/Y;

    .line 14
    iput-object p12, p0, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 15
    iput-object p13, p0, Lcom/google/protobuf/W;->o:Lcom/google/protobuf/q0;

    .line 16
    iput-object p14, p0, Lcom/google/protobuf/W;->p:Lcom/google/protobuf/q;

    .line 17
    iput-object p5, p0, Lcom/google/protobuf/W;->e:Lcom/google/protobuf/T;

    move-object p1, p15

    .line 18
    iput-object p1, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    return-void
.end method

.method private A(Ljava/lang/Object;I)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)Z"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2}, Lcom/google/protobuf/W;->i0(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0xfffff

    .line 6
    .line 7
    .line 8
    and-int/2addr v1, v0

    .line 9
    int-to-long v1, v1

    .line 10
    const-wide/32 v3, 0xfffff

    .line 11
    .line 12
    .line 13
    cmp-long v3, v1, v3

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    const/4 v5, 0x1

    .line 17
    if-nez v3, :cond_11

    .line 18
    .line 19
    invoke-direct {p0, p2}, Lcom/google/protobuf/W;->u0(I)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-static {p0}, Lcom/google/protobuf/W;->W(I)J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    invoke-static {p0}, Lcom/google/protobuf/W;->t0(I)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    const-wide/16 v2, 0x0

    .line 32
    .line 33
    packed-switch p0, :pswitch_data_0

    .line 34
    .line 35
    .line 36
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 37
    .line 38
    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 39
    .line 40
    .line 41
    throw p0

    .line 42
    :pswitch_0
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    if-eqz p0, :cond_0

    .line 47
    .line 48
    return v5

    .line 49
    :cond_0
    return v4

    .line 50
    :pswitch_1
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 51
    .line 52
    .line 53
    move-result-wide p0

    .line 54
    cmp-long p0, p0, v2

    .line 55
    .line 56
    if-eqz p0, :cond_1

    .line 57
    .line 58
    return v5

    .line 59
    :cond_1
    return v4

    .line 60
    :pswitch_2
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-eqz p0, :cond_2

    .line 65
    .line 66
    return v5

    .line 67
    :cond_2
    return v4

    .line 68
    :pswitch_3
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 69
    .line 70
    .line 71
    move-result-wide p0

    .line 72
    cmp-long p0, p0, v2

    .line 73
    .line 74
    if-eqz p0, :cond_3

    .line 75
    .line 76
    return v5

    .line 77
    :cond_3
    return v4

    .line 78
    :pswitch_4
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-eqz p0, :cond_4

    .line 83
    .line 84
    return v5

    .line 85
    :cond_4
    return v4

    .line 86
    :pswitch_5
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-eqz p0, :cond_5

    .line 91
    .line 92
    return v5

    .line 93
    :cond_5
    return v4

    .line 94
    :pswitch_6
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    if-eqz p0, :cond_6

    .line 99
    .line 100
    return v5

    .line 101
    :cond_6
    return v4

    .line 102
    :pswitch_7
    sget-object p0, Lcom/google/protobuf/h;->h:Lcom/google/protobuf/h;

    .line 103
    .line 104
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p0, p1}, Lcom/google/protobuf/h;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    xor-int/2addr p0, v5

    .line 113
    return p0

    .line 114
    :pswitch_8
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    if-eqz p0, :cond_7

    .line 119
    .line 120
    return v5

    .line 121
    :cond_7
    return v4

    .line 122
    :pswitch_9
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    instance-of p1, p0, Ljava/lang/String;

    .line 127
    .line 128
    if-eqz p1, :cond_8

    .line 129
    .line 130
    check-cast p0, Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    xor-int/2addr p0, v5

    .line 137
    return p0

    .line 138
    :cond_8
    instance-of p1, p0, Lcom/google/protobuf/h;

    .line 139
    .line 140
    if-eqz p1, :cond_9

    .line 141
    .line 142
    sget-object p1, Lcom/google/protobuf/h;->h:Lcom/google/protobuf/h;

    .line 143
    .line 144
    invoke-virtual {p1, p0}, Lcom/google/protobuf/h;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    xor-int/2addr p0, v5

    .line 149
    return p0

    .line 150
    :cond_9
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 151
    .line 152
    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 153
    .line 154
    .line 155
    throw p0

    .line 156
    :pswitch_a
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->t(Ljava/lang/Object;J)Z

    .line 157
    .line 158
    .line 159
    move-result p0

    .line 160
    return p0

    .line 161
    :pswitch_b
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    if-eqz p0, :cond_a

    .line 166
    .line 167
    return v5

    .line 168
    :cond_a
    return v4

    .line 169
    :pswitch_c
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 170
    .line 171
    .line 172
    move-result-wide p0

    .line 173
    cmp-long p0, p0, v2

    .line 174
    .line 175
    if-eqz p0, :cond_b

    .line 176
    .line 177
    return v5

    .line 178
    :cond_b
    return v4

    .line 179
    :pswitch_d
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 180
    .line 181
    .line 182
    move-result p0

    .line 183
    if-eqz p0, :cond_c

    .line 184
    .line 185
    return v5

    .line 186
    :cond_c
    return v4

    .line 187
    :pswitch_e
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 188
    .line 189
    .line 190
    move-result-wide p0

    .line 191
    cmp-long p0, p0, v2

    .line 192
    .line 193
    if-eqz p0, :cond_d

    .line 194
    .line 195
    return v5

    .line 196
    :cond_d
    return v4

    .line 197
    :pswitch_f
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 198
    .line 199
    .line 200
    move-result-wide p0

    .line 201
    cmp-long p0, p0, v2

    .line 202
    .line 203
    if-eqz p0, :cond_e

    .line 204
    .line 205
    return v5

    .line 206
    :cond_e
    return v4

    .line 207
    :pswitch_10
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->B(Ljava/lang/Object;J)F

    .line 208
    .line 209
    .line 210
    move-result p0

    .line 211
    invoke-static {p0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    .line 212
    .line 213
    .line 214
    move-result p0

    .line 215
    if-eqz p0, :cond_f

    .line 216
    .line 217
    return v5

    .line 218
    :cond_f
    return v4

    .line 219
    :pswitch_11
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->A(Ljava/lang/Object;J)D

    .line 220
    .line 221
    .line 222
    move-result-wide p0

    .line 223
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    .line 224
    .line 225
    .line 226
    move-result-wide p0

    .line 227
    cmp-long p0, p0, v2

    .line 228
    .line 229
    if-eqz p0, :cond_10

    .line 230
    .line 231
    return v5

    .line 232
    :cond_10
    return v4

    .line 233
    :cond_11
    ushr-int/lit8 p0, v0, 0x14

    .line 234
    .line 235
    shl-int p0, v5, p0

    .line 236
    .line 237
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    and-int/2addr p0, p1

    .line 242
    if-eqz p0, :cond_12

    .line 243
    .line 244
    return v5

    .line 245
    :cond_12
    return v4

    .line 246
    nop

    .line 247
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private B(Ljava/lang/Object;IIII)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;IIII)Z"
        }
    .end annotation

    .line 1
    const v0, 0xfffff

    .line 2
    .line 3
    .line 4
    if-ne p3, v0, :cond_0

    .line 5
    .line 6
    invoke-direct {p0, p1, p2}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0

    .line 11
    :cond_0
    and-int p0, p4, p5

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private static C(Ljava/lang/Object;ILcom/google/protobuf/j0;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/google/protobuf/W;->W(I)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p2, p0}, Lcom/google/protobuf/j0;->d(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private static D(I)Z
    .locals 1

    .line 1
    const/high16 v0, -0x80000000

    .line 2
    .line 3
    and-int/2addr p0, v0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method private E(Ljava/lang/Object;II)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "II)Z"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Lcom/google/protobuf/W;->W(I)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    const/4 v0, 0x1

    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    return v0

    .line 19
    :cond_0
    invoke-direct {p0, p3}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 p2, 0x0

    .line 24
    move p3, p2

    .line 25
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-ge p3, v1, :cond_2

    .line 30
    .line 31
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {p0, v1}, Lcom/google/protobuf/j0;->d(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_1

    .line 40
    .line 41
    return p2

    .line 42
    :cond_1
    add-int/lit8 p3, p3, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    return v0
.end method

.method private F(Ljava/lang/Object;II)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;II)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/google/protobuf/W;->W(I)J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {v0, p1}, Lcom/google/protobuf/N;->e(Ljava/lang/Object;)Ljava/util/Map;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    invoke-direct {p0, p3}, Lcom/google/protobuf/W;->u(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p0, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 28
    .line 29
    invoke-interface {p0, p1}, Lcom/google/protobuf/N;->b(Ljava/lang/Object;)Lcom/google/protobuf/L$a;

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    throw p0
.end method

.method private static G(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p0, Lcom/google/protobuf/y;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    check-cast p0, Lcom/google/protobuf/y;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/google/protobuf/y;->isMutable()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_1
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method private H(Ljava/lang/Object;Ljava/lang/Object;I)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;I)Z"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p3}, Lcom/google/protobuf/W;->i0(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const p3, 0xfffff

    .line 6
    .line 7
    .line 8
    and-int/2addr p0, p3

    .line 9
    int-to-long v0, p0

    .line 10
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-static {p2, v0, v1}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-ne p0, p1, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method private I(Ljava/lang/Object;II)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;II)Z"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p3}, Lcom/google/protobuf/W;->i0(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const p3, 0xfffff

    .line 6
    .line 7
    .line 8
    and-int/2addr p0, p3

    .line 9
    int-to-long v0, p0

    .line 10
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-ne p0, p2, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method private static J(I)Z
    .locals 1

    .line 1
    const/high16 v0, 0x10000000

    .line 2
    .line 3
    and-int/2addr p0, v0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method private static K(Ljava/lang/Object;J)J
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)J"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method private L(Lcom/google/protobuf/q0;Lcom/google/protobuf/q;Ljava/lang/Object;Lcom/google/protobuf/i0;Lcom/google/protobuf/p;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<UT:",
            "Ljava/lang/Object;",
            "UB:",
            "Ljava/lang/Object;",
            "ET::",
            "Lcom/google/protobuf/u$b<",
            "TET;>;>(",
            "Lcom/google/protobuf/q0<",
            "TUT;TUB;>;",
            "Lcom/google/protobuf/q<",
            "TET;>;TT;",
            "Lcom/google/protobuf/i0;",
            "Lcom/google/protobuf/p;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v4, p5

    const/4 v8, 0x0

    move-object v0, v8

    move-object v5, v0

    .line 1
    :goto_0
    :try_start_0
    invoke-interface/range {p4 .. p4}, Lcom/google/protobuf/i0;->F()I

    move-result v2

    .line 2
    invoke-direct {v1, v2}, Lcom/google/protobuf/W;->g0(I)I

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_13

    if-gez v3, :cond_9

    const v3, 0x7fffffff

    if-ne v2, v3, :cond_1

    .line 3
    iget v0, v1, Lcom/google/protobuf/W;->k:I

    move-object v4, v5

    :goto_1
    iget v2, v1, Lcom/google/protobuf/W;->l:I

    if-ge v0, v2, :cond_0

    .line 4
    iget-object v2, v1, Lcom/google/protobuf/W;->j:[I

    aget v3, v2, v0

    move-object/from16 v6, p3

    move-object/from16 v5, p1

    move-object/from16 v2, p3

    .line 5
    invoke-direct/range {v1 .. v6}, Lcom/google/protobuf/W;->q(Ljava/lang/Object;ILjava/lang/Object;Lcom/google/protobuf/q0;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v9, v1

    move-object v1, v2

    move-object v6, v5

    add-int/lit8 v0, v0, 0x1

    move-object v1, v9

    goto :goto_1

    :cond_0
    move-object/from16 v6, p1

    move-object/from16 v1, p3

    if-eqz v4, :cond_15

    .line 6
    invoke-virtual {v6, v1, v4}, Lcom/google/protobuf/q0;->o(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_24

    :cond_1
    move-object/from16 v6, p1

    move-object v9, v1

    move-object/from16 v1, p3

    .line 7
    :try_start_1
    iget-boolean v3, v9, Lcom/google/protobuf/W;->f:Z

    if-nez v3, :cond_2

    move-object/from16 v7, p2

    move-object v3, v8

    goto :goto_2

    .line 8
    :cond_2
    iget-object v3, v9, Lcom/google/protobuf/W;->e:Lcom/google/protobuf/T;

    move-object/from16 v7, p2

    invoke-virtual {v7, v4, v3, v2}, Lcom/google/protobuf/q;->b(Lcom/google/protobuf/p;Lcom/google/protobuf/T;I)Ljava/lang/Object;

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    move-object v3, v2

    :goto_2
    if-eqz v3, :cond_4

    if-nez v0, :cond_3

    .line 9
    :try_start_2
    invoke-virtual/range {p2 .. p3}, Lcom/google/protobuf/q;->d(Ljava/lang/Object;)Lcom/google/protobuf/u;

    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_3
    move-object v2, v5

    move-object v5, v0

    move-object v0, v7

    move-object v7, v6

    move-object v6, v2

    move-object/from16 v2, p4

    goto :goto_3

    :catchall_0
    move-exception v0

    move-object v2, v1

    move-object v11, v6

    move-object v1, v9

    goto/16 :goto_26

    .line 10
    :goto_3
    :try_start_3
    invoke-virtual/range {v0 .. v7}, Lcom/google/protobuf/q;->g(Ljava/lang/Object;Lcom/google/protobuf/i0;Ljava/lang/Object;Lcom/google/protobuf/p;Lcom/google/protobuf/u;Ljava/lang/Object;Lcom/google/protobuf/q0;)Ljava/lang/Object;

    move-result-object v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-object v6, v4

    move-object v0, v5

    move-object v5, v7

    move-object v4, v2

    move-object v2, v1

    move-object v5, v3

    move-object v4, v6

    move-object v1, v9

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object v2, v1

    move-object v10, v6

    move-object v5, v7

    :goto_4
    move-object v11, v5

    move-object v1, v9

    :goto_5
    move-object v5, v10

    goto/16 :goto_26

    :cond_4
    move-object v2, v1

    move-object v10, v5

    move-object v5, v6

    move-object v6, v4

    move-object/from16 v4, p4

    .line 11
    :try_start_4
    invoke-virtual {v5, v4}, Lcom/google/protobuf/q0;->q(Lcom/google/protobuf/i0;)Z

    move-result v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    if-eqz v1, :cond_5

    .line 12
    :try_start_5
    invoke-interface {v4}, Lcom/google/protobuf/i0;->J()Z

    move-result v1

    if-eqz v1, :cond_7

    :goto_6
    move-object v4, v6

    move-object v1, v9

    move-object v5, v10

    goto/16 :goto_0

    :catchall_2
    move-exception v0

    goto :goto_4

    :cond_5
    if-nez v10, :cond_6

    .line 13
    invoke-virtual {v5, v2}, Lcom/google/protobuf/q0;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    move-object v10, v1

    .line 14
    :cond_6
    :try_start_6
    invoke-virtual {v5, v10, v4}, Lcom/google/protobuf/q0;->m(Ljava/lang/Object;Lcom/google/protobuf/i0;)Z

    move-result v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    if-eqz v1, :cond_7

    goto :goto_6

    .line 15
    :cond_7
    iget v0, v9, Lcom/google/protobuf/W;->k:I

    move-object v4, v10

    :goto_7
    iget v1, v9, Lcom/google/protobuf/W;->l:I

    if-ge v0, v1, :cond_8

    .line 16
    iget-object v1, v9, Lcom/google/protobuf/W;->j:[I

    aget v3, v1, v0

    move-object/from16 v6, p3

    move-object v1, v9

    .line 17
    invoke-direct/range {v1 .. v6}, Lcom/google/protobuf/W;->q(Ljava/lang/Object;ILjava/lang/Object;Lcom/google/protobuf/q0;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v7, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_8
    move-object v7, v2

    if-eqz v4, :cond_15

    .line 18
    invoke-virtual {v5, v7, v4}, Lcom/google/protobuf/q0;->o(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_24

    :catchall_3
    move-exception v0

    move-object v7, v2

    move-object v1, v9

    move-object v11, v5

    goto :goto_5

    :catchall_4
    move-exception v0

    move-object v7, v1

    move-object v10, v5

    move-object v5, v6

    move-object v1, v9

    :goto_8
    move-object v11, v5

    :goto_9
    move-object v2, v7

    goto :goto_5

    :cond_9
    move-object/from16 v7, p3

    move-object v6, v4

    move-object v10, v5

    move-object/from16 v5, p1

    move-object/from16 v4, p4

    .line 19
    :try_start_7
    invoke-direct {v1, v3}, Lcom/google/protobuf/W;->u0(I)I

    move-result v9
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    .line 20
    :try_start_8
    invoke-static {v9}, Lcom/google/protobuf/W;->t0(I)I

    move-result v11

    packed-switch v11, :pswitch_data_0

    if-nez v10, :cond_a

    .line 21
    invoke-virtual {v5, v7}, Lcom/google/protobuf/q0;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v10, v2

    goto :goto_b

    :catchall_5
    move-exception v0

    goto :goto_8

    :catch_0
    move-object v11, v5

    :catch_1
    move-object v2, v7

    :catch_2
    :goto_a
    move-object v5, v10

    goto/16 :goto_20

    .line 22
    :cond_a
    :goto_b
    invoke-virtual {v5, v10, v4}, Lcom/google/protobuf/q0;->m(Ljava/lang/Object;Lcom/google/protobuf/i0;)Z

    move-result v2
    :try_end_8
    .catch Lcom/google/protobuf/B$a; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    if-nez v2, :cond_c

    .line 23
    iget v0, v1, Lcom/google/protobuf/W;->k:I

    move-object v4, v10

    :goto_c
    iget v2, v1, Lcom/google/protobuf/W;->l:I

    if-ge v0, v2, :cond_b

    .line 24
    iget-object v2, v1, Lcom/google/protobuf/W;->j:[I

    aget v3, v2, v0

    move-object/from16 v6, p3

    move-object v2, v7

    .line 25
    invoke-direct/range {v1 .. v6}, Lcom/google/protobuf/W;->q(Ljava/lang/Object;ILjava/lang/Object;Lcom/google/protobuf/q0;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v11, v5

    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    :cond_b
    move-object v11, v5

    if-eqz v4, :cond_15

    .line 26
    invoke-virtual {v11, v7, v4}, Lcom/google/protobuf/q0;->o(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_24

    :cond_c
    move-object v11, v5

    :goto_d
    move-object v2, v7

    :goto_e
    move-object v5, v10

    goto/16 :goto_25

    :pswitch_0
    move-object v11, v5

    .line 27
    :try_start_9
    invoke-direct {v1, v7, v2, v3}, Lcom/google/protobuf/W;->R(Ljava/lang/Object;II)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/protobuf/T;

    .line 28
    invoke-direct {v1, v3}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v9

    .line 29
    invoke-interface {v4, v5, v9, v6}, Lcom/google/protobuf/i0;->y(Ljava/lang/Object;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V

    .line 30
    invoke-direct {v1, v7, v2, v3, v5}, Lcom/google/protobuf/W;->s0(Ljava/lang/Object;IILjava/lang/Object;)V

    goto :goto_d

    :catchall_6
    move-exception v0

    goto :goto_9

    :pswitch_1
    move-object v11, v5

    .line 31
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->D()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    .line 32
    invoke-static {v7, v12, v13, v5}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 33
    invoke-direct {v1, v7, v2, v3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V

    goto :goto_d

    :pswitch_2
    move-object v11, v5

    .line 34
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->m()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 35
    invoke-static {v7, v12, v13, v5}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 36
    invoke-direct {v1, v7, v2, v3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V

    goto :goto_d

    :pswitch_3
    move-object v11, v5

    .line 37
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->g()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    .line 38
    invoke-static {v7, v12, v13, v5}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 39
    invoke-direct {v1, v7, v2, v3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V

    goto :goto_d

    :pswitch_4
    move-object v11, v5

    .line 40
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->K()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 41
    invoke-static {v7, v12, v13, v5}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 42
    invoke-direct {v1, v7, v2, v3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V

    goto :goto_d

    :pswitch_5
    move-object v11, v5

    .line 43
    invoke-interface {v4}, Lcom/google/protobuf/i0;->l()I

    move-result v5

    .line 44
    invoke-direct {v1, v3}, Lcom/google/protobuf/W;->t(I)Lcom/google/protobuf/A$e;

    move-result-object v12

    if-eqz v12, :cond_e

    .line 45
    invoke-interface {v12, v5}, Lcom/google/protobuf/A$e;->isInRange(I)Z

    move-result v12

    if-eqz v12, :cond_d

    goto :goto_f

    .line 46
    :cond_d
    invoke-static {v7, v2, v5, v10, v11}, Lcom/google/protobuf/l0;->J(Ljava/lang/Object;IILjava/lang/Object;Lcom/google/protobuf/q0;)Ljava/lang/Object;

    move-result-object v5

    move-object v2, v7

    goto/16 :goto_25

    .line 47
    :cond_e
    :goto_f
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v7, v12, v13, v5}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 48
    invoke-direct {v1, v7, v2, v3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_6
    move-object v11, v5

    .line 49
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->i()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 50
    invoke-static {v7, v12, v13, v5}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 51
    invoke-direct {v1, v7, v2, v3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_7
    move-object v11, v5

    .line 52
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->r()Lcom/google/protobuf/h;

    move-result-object v5

    invoke-static {v7, v12, v13, v5}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 53
    invoke-direct {v1, v7, v2, v3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_8
    move-object v11, v5

    .line 54
    invoke-direct {v1, v7, v2, v3}, Lcom/google/protobuf/W;->R(Ljava/lang/Object;II)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/protobuf/T;

    .line 55
    invoke-direct {v1, v3}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v9

    .line 56
    invoke-interface {v4, v5, v9, v6}, Lcom/google/protobuf/i0;->H(Ljava/lang/Object;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V

    .line 57
    invoke-direct {v1, v7, v2, v3, v5}, Lcom/google/protobuf/W;->s0(Ljava/lang/Object;IILjava/lang/Object;)V

    goto/16 :goto_d

    :pswitch_9
    move-object v11, v5

    .line 58
    invoke-direct {v1, v7, v9, v4}, Lcom/google/protobuf/W;->l0(Ljava/lang/Object;ILcom/google/protobuf/i0;)V

    .line 59
    invoke-direct {v1, v7, v2, v3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_a
    move-object v11, v5

    .line 60
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->e()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    .line 61
    invoke-static {v7, v12, v13, v5}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 62
    invoke-direct {v1, v7, v2, v3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_b
    move-object v11, v5

    .line 63
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->z()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 64
    invoke-static {v7, v12, v13, v5}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 65
    invoke-direct {v1, v7, v2, v3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_c
    move-object v11, v5

    .line 66
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->a()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    .line 67
    invoke-static {v7, v12, v13, v5}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 68
    invoke-direct {v1, v7, v2, v3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_d
    move-object v11, v5

    .line 69
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->s()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 70
    invoke-static {v7, v12, v13, v5}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 71
    invoke-direct {v1, v7, v2, v3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_e
    move-object v11, v5

    .line 72
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->v()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    .line 73
    invoke-static {v7, v12, v13, v5}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 74
    invoke-direct {v1, v7, v2, v3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_f
    move-object v11, v5

    .line 75
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->N()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    .line 76
    invoke-static {v7, v12, v13, v5}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 77
    invoke-direct {v1, v7, v2, v3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_10
    move-object v11, v5

    .line 78
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->readFloat()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    .line 79
    invoke-static {v7, v12, v13, v5}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 80
    invoke-direct {v1, v7, v2, v3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_d

    :pswitch_11
    move-object v11, v5

    .line 81
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->readDouble()D

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    .line 82
    invoke-static {v7, v12, v13, v5}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 83
    invoke-direct {v1, v7, v2, v3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V
    :try_end_9
    .catch Lcom/google/protobuf/B$a; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_6

    goto/16 :goto_d

    :pswitch_12
    move-object v11, v5

    .line 84
    :try_start_a
    invoke-direct {v1, v3}, Lcom/google/protobuf/W;->u(I)Ljava/lang/Object;

    move-result-object v4

    move-object v5, v6

    move-object v2, v7

    move-object/from16 v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/google/protobuf/W;->M(Ljava/lang/Object;ILjava/lang/Object;Lcom/google/protobuf/p;Lcom/google/protobuf/i0;)V
    :try_end_a
    .catch Lcom/google/protobuf/B$a; {:try_start_a .. :try_end_a} :catch_3
    .catchall {:try_start_a .. :try_end_a} :catchall_7

    move-object/from16 v2, p3

    move-object/from16 v4, p4

    move-object/from16 v6, p5

    goto/16 :goto_e

    :catchall_7
    move-exception v0

    move-object/from16 v2, p3

    goto/16 :goto_5

    :catch_3
    move-object/from16 v2, p3

    move-object/from16 v4, p4

    move-object/from16 v6, p5

    goto/16 :goto_a

    :pswitch_13
    move-object v11, v5

    .line 85
    :try_start_b
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v4

    .line 86
    invoke-direct {v1, v3}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v6
    :try_end_b
    .catch Lcom/google/protobuf/B$a; {:try_start_b .. :try_end_b} :catch_3
    .catchall {:try_start_b .. :try_end_b} :catchall_9

    move-object/from16 v2, p3

    move-object/from16 v7, p5

    move-wide v3, v4

    move-object/from16 v5, p4

    .line 87
    :try_start_c
    invoke-direct/range {v1 .. v7}, Lcom/google/protobuf/W;->j0(Ljava/lang/Object;JLcom/google/protobuf/i0;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V
    :try_end_c
    .catch Lcom/google/protobuf/B$a; {:try_start_c .. :try_end_c} :catch_4
    .catchall {:try_start_c .. :try_end_c} :catchall_8

    move-object v7, v1

    move-object v1, v2

    move-object v12, v5

    :goto_10
    move-object/from16 v6, p5

    move-object v2, v1

    :goto_11
    move-object v1, v7

    move-object v4, v12

    goto/16 :goto_e

    :catchall_8
    move-exception v0

    move-object v7, v1

    move-object v1, v2

    :goto_12
    move-object v1, v7

    goto/16 :goto_5

    :catch_4
    move-object/from16 v6, p5

    move-object v4, v5

    goto/16 :goto_a

    :catchall_9
    move-exception v0

    move-object v7, v1

    move-object/from16 v1, p3

    :goto_13
    move-object v2, v1

    goto :goto_12

    :pswitch_14
    move-object v11, v7

    move-object v7, v1

    move-object v1, v11

    move-object v12, v4

    move-object v11, v5

    .line 88
    :try_start_d
    iget-object v2, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 89
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    invoke-virtual {v2, v1, v3, v4}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 90
    invoke-interface {v12, v2}, Lcom/google/protobuf/i0;->c(Ljava/util/List;)V

    goto :goto_10

    :catchall_a
    move-exception v0

    goto :goto_13

    :catch_5
    move-object/from16 v6, p5

    move-object v2, v1

    :goto_14
    move-object v1, v7

    move-object v5, v10

    :goto_15
    move-object v4, v12

    goto/16 :goto_20

    :pswitch_15
    move-object v11, v7

    move-object v7, v1

    move-object v1, v11

    move-object v12, v4

    move-object v11, v5

    .line 91
    iget-object v2, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 92
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    invoke-virtual {v2, v1, v3, v4}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 93
    invoke-interface {v12, v2}, Lcom/google/protobuf/i0;->u(Ljava/util/List;)V

    goto :goto_10

    :pswitch_16
    move-object v11, v7

    move-object v7, v1

    move-object v1, v11

    move-object v12, v4

    move-object v11, v5

    .line 94
    iget-object v2, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 95
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    invoke-virtual {v2, v1, v3, v4}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 96
    invoke-interface {v12, v2}, Lcom/google/protobuf/i0;->A(Ljava/util/List;)V

    goto :goto_10

    :pswitch_17
    move-object v11, v7

    move-object v7, v1

    move-object v1, v11

    move-object v12, v4

    move-object v11, v5

    .line 97
    iget-object v2, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 98
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    invoke-virtual {v2, v1, v3, v4}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 99
    invoke-interface {v12, v2}, Lcom/google/protobuf/i0;->b(Ljava/util/List;)V
    :try_end_d
    .catch Lcom/google/protobuf/B$a; {:try_start_d .. :try_end_d} :catch_5
    .catchall {:try_start_d .. :try_end_d} :catchall_a

    goto :goto_10

    :pswitch_18
    move-object v11, v7

    move-object v7, v1

    move-object v1, v11

    move-object v12, v4

    move-object v11, v5

    .line 100
    :try_start_e
    iget-object v4, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 101
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v5

    invoke-virtual {v4, v1, v5, v6}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v4

    .line 102
    invoke-interface {v12, v4}, Lcom/google/protobuf/i0;->k(Ljava/util/List;)V

    move-object v5, v4

    .line 103
    invoke-direct {v7, v3}, Lcom/google/protobuf/W;->t(I)Lcom/google/protobuf/A$e;

    move-result-object v4
    :try_end_e
    .catch Lcom/google/protobuf/B$a; {:try_start_e .. :try_end_e} :catch_7
    .catchall {:try_start_e .. :try_end_e} :catchall_c

    move-object v3, v5

    move-object v5, v10

    move-object v6, v11

    .line 104
    :try_start_f
    invoke-static/range {v1 .. v6}, Lcom/google/protobuf/l0;->A(Ljava/lang/Object;ILjava/util/List;Lcom/google/protobuf/A$e;Ljava/lang/Object;Lcom/google/protobuf/q0;)Ljava/lang/Object;

    move-result-object v5
    :try_end_f
    .catch Lcom/google/protobuf/B$a; {:try_start_f .. :try_end_f} :catch_6
    .catchall {:try_start_f .. :try_end_f} :catchall_b

    move-object v2, v1

    move-object/from16 v11, p1

    :goto_16
    move-object/from16 v6, p5

    move-object v1, v7

    move-object v4, v12

    goto/16 :goto_25

    :catchall_b
    move-exception v0

    move-object v2, v1

    :goto_17
    move-object/from16 v11, p1

    :goto_18
    move-object v1, v7

    goto/16 :goto_26

    :catch_6
    :goto_19
    move-object/from16 v11, p1

    :goto_1a
    move-object/from16 v6, p5

    move-object v2, v1

    :goto_1b
    move-object v1, v7

    goto :goto_15

    :catchall_c
    move-exception v0

    move-object v2, v1

    move-object v5, v10

    goto :goto_17

    :catch_7
    move-object v5, v10

    goto :goto_19

    :pswitch_19
    move-object v12, v4

    move-object v2, v7

    move-object v5, v10

    move-object v7, v1

    .line 105
    :try_start_10
    iget-object v1, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 106
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v1

    .line 107
    invoke-interface {v12, v1}, Lcom/google/protobuf/i0;->w(Ljava/util/List;)V

    :goto_1c
    move-object/from16 v11, p1

    move-object/from16 v6, p5

    move-object v10, v5

    goto/16 :goto_11

    :catchall_d
    move-exception v0

    goto :goto_17

    :catch_8
    move-object/from16 v11, p1

    :goto_1d
    move-object/from16 v6, p5

    goto :goto_1b

    :pswitch_1a
    move-object v12, v4

    move-object v2, v7

    move-object v5, v10

    move-object v7, v1

    .line 108
    iget-object v1, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 109
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v1

    .line 110
    invoke-interface {v12, v1}, Lcom/google/protobuf/i0;->n(Ljava/util/List;)V

    goto :goto_1c

    :pswitch_1b
    move-object v12, v4

    move-object v2, v7

    move-object v5, v10

    move-object v7, v1

    .line 111
    iget-object v1, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 112
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v1

    .line 113
    invoke-interface {v12, v1}, Lcom/google/protobuf/i0;->C(Ljava/util/List;)V

    goto :goto_1c

    :pswitch_1c
    move-object v12, v4

    move-object v2, v7

    move-object v5, v10

    move-object v7, v1

    .line 114
    iget-object v1, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 115
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v1

    .line 116
    invoke-interface {v12, v1}, Lcom/google/protobuf/i0;->t(Ljava/util/List;)V

    goto :goto_1c

    :pswitch_1d
    move-object v12, v4

    move-object v2, v7

    move-object v5, v10

    move-object v7, v1

    .line 117
    iget-object v1, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 118
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v1

    .line 119
    invoke-interface {v12, v1}, Lcom/google/protobuf/i0;->B(Ljava/util/List;)V

    goto :goto_1c

    :pswitch_1e
    move-object v12, v4

    move-object v2, v7

    move-object v5, v10

    move-object v7, v1

    .line 120
    iget-object v1, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 121
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v1

    .line 122
    invoke-interface {v12, v1}, Lcom/google/protobuf/i0;->h(Ljava/util/List;)V

    goto :goto_1c

    :pswitch_1f
    move-object v12, v4

    move-object v2, v7

    move-object v5, v10

    move-object v7, v1

    .line 123
    iget-object v1, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 124
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v1

    .line 125
    invoke-interface {v12, v1}, Lcom/google/protobuf/i0;->j(Ljava/util/List;)V

    goto :goto_1c

    :pswitch_20
    move-object v12, v4

    move-object v2, v7

    move-object v5, v10

    move-object v7, v1

    .line 126
    iget-object v1, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 127
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v1

    .line 128
    invoke-interface {v12, v1}, Lcom/google/protobuf/i0;->I(Ljava/util/List;)V

    goto/16 :goto_1c

    :pswitch_21
    move-object v12, v4

    move-object v2, v7

    move-object v5, v10

    move-object v7, v1

    .line 129
    iget-object v1, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 130
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v1

    .line 131
    invoke-interface {v12, v1}, Lcom/google/protobuf/i0;->M(Ljava/util/List;)V

    goto/16 :goto_1c

    :pswitch_22
    move-object v12, v4

    move-object v2, v7

    move-object v5, v10

    move-object v7, v1

    .line 132
    iget-object v1, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 133
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v1

    .line 134
    invoke-interface {v12, v1}, Lcom/google/protobuf/i0;->c(Ljava/util/List;)V

    goto/16 :goto_1c

    :pswitch_23
    move-object v12, v4

    move-object v2, v7

    move-object v5, v10

    move-object v7, v1

    .line 135
    iget-object v1, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 136
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v1

    .line 137
    invoke-interface {v12, v1}, Lcom/google/protobuf/i0;->u(Ljava/util/List;)V

    goto/16 :goto_1c

    :pswitch_24
    move-object v12, v4

    move-object v2, v7

    move-object v5, v10

    move-object v7, v1

    .line 138
    iget-object v1, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 139
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v1

    .line 140
    invoke-interface {v12, v1}, Lcom/google/protobuf/i0;->A(Ljava/util/List;)V

    goto/16 :goto_1c

    :pswitch_25
    move-object v12, v4

    move-object v2, v7

    move-object v5, v10

    move-object v7, v1

    .line 141
    iget-object v1, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 142
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v1

    .line 143
    invoke-interface {v12, v1}, Lcom/google/protobuf/i0;->b(Ljava/util/List;)V
    :try_end_10
    .catch Lcom/google/protobuf/B$a; {:try_start_10 .. :try_end_10} :catch_8
    .catchall {:try_start_10 .. :try_end_10} :catchall_d

    goto/16 :goto_1c

    :pswitch_26
    move-object v5, v7

    move-object v7, v1

    move v1, v2

    move-object v2, v5

    move-object v12, v4

    move-object v5, v10

    .line 144
    :try_start_11
    iget-object v4, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 145
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v9

    invoke-virtual {v4, v2, v9, v10}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v4

    .line 146
    invoke-interface {v12, v4}, Lcom/google/protobuf/i0;->k(Ljava/util/List;)V

    move-object v6, v4

    .line 147
    invoke-direct {v7, v3}, Lcom/google/protobuf/W;->t(I)Lcom/google/protobuf/A$e;

    move-result-object v4
    :try_end_11
    .catch Lcom/google/protobuf/B$a; {:try_start_11 .. :try_end_11} :catch_a
    .catchall {:try_start_11 .. :try_end_11} :catchall_f

    move-object v3, v2

    move v2, v1

    move-object v1, v3

    move-object v3, v6

    move-object/from16 v6, p1

    .line 148
    :try_start_12
    invoke-static/range {v1 .. v6}, Lcom/google/protobuf/l0;->A(Ljava/lang/Object;ILjava/util/List;Lcom/google/protobuf/A$e;Ljava/lang/Object;Lcom/google/protobuf/q0;)Ljava/lang/Object;

    move-result-object v5
    :try_end_12
    .catch Lcom/google/protobuf/B$a; {:try_start_12 .. :try_end_12} :catch_9
    .catchall {:try_start_12 .. :try_end_12} :catchall_e

    move-object v2, v1

    move-object v11, v6

    goto/16 :goto_16

    :catchall_e
    move-exception v0

    move-object v2, v1

    move-object v10, v5

    move-object v11, v6

    goto/16 :goto_18

    :catch_9
    move-object v10, v5

    move-object v11, v6

    goto/16 :goto_1a

    :catchall_f
    move-exception v0

    move-object/from16 v11, p1

    move-object v10, v5

    goto/16 :goto_18

    :catch_a
    move-object/from16 v11, p1

    move-object v10, v5

    goto/16 :goto_1d

    :pswitch_27
    move-object v12, v4

    move-object v11, v5

    move-object v2, v7

    move-object v7, v1

    .line 149
    :try_start_13
    iget-object v1, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 150
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v1

    .line 151
    invoke-interface {v12, v1}, Lcom/google/protobuf/i0;->w(Ljava/util/List;)V

    :goto_1e
    move-object/from16 v6, p5

    goto/16 :goto_11

    :catchall_10
    move-exception v0

    goto/16 :goto_12

    :catch_b
    move-object/from16 v6, p5

    goto/16 :goto_14

    :pswitch_28
    move-object v12, v4

    move-object v11, v5

    move-object v2, v7

    move-object v7, v1

    .line 152
    iget-object v1, v7, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 153
    invoke-static {v9}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v1

    .line 154
    invoke-interface {v12, v1}, Lcom/google/protobuf/i0;->L(Ljava/util/List;)V
    :try_end_13
    .catch Lcom/google/protobuf/B$a; {:try_start_13 .. :try_end_13} :catch_b
    .catchall {:try_start_13 .. :try_end_13} :catchall_10

    goto :goto_1e

    :pswitch_29
    move-object v12, v4

    move-object v11, v5

    move-object v2, v7

    move-object v7, v1

    .line 155
    :try_start_14
    invoke-direct {v7, v3}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v5
    :try_end_14
    .catch Lcom/google/protobuf/B$a; {:try_start_14 .. :try_end_14} :catch_c
    .catchall {:try_start_14 .. :try_end_14} :catchall_10

    move-object/from16 v6, p5

    move v3, v9

    .line 156
    :try_start_15
    invoke-direct/range {v1 .. v6}, Lcom/google/protobuf/W;->k0(Ljava/lang/Object;ILcom/google/protobuf/i0;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V

    goto/16 :goto_e

    :catchall_11
    move-exception v0

    goto/16 :goto_5

    :catch_c
    move-object/from16 v6, p5

    move-object v1, v7

    move-object v4, v12

    goto/16 :goto_a

    :pswitch_2a
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 157
    invoke-direct {v1, v2, v5, v4}, Lcom/google/protobuf/W;->m0(Ljava/lang/Object;ILcom/google/protobuf/i0;)V

    goto/16 :goto_e

    :pswitch_2b
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 158
    iget-object v3, v1, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 159
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-virtual {v3, v2, v12, v13}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v3

    .line 160
    invoke-interface {v4, v3}, Lcom/google/protobuf/i0;->n(Ljava/util/List;)V

    goto/16 :goto_e

    :pswitch_2c
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 161
    iget-object v3, v1, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 162
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-virtual {v3, v2, v12, v13}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v3

    .line 163
    invoke-interface {v4, v3}, Lcom/google/protobuf/i0;->C(Ljava/util/List;)V

    goto/16 :goto_e

    :pswitch_2d
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 164
    iget-object v3, v1, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 165
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-virtual {v3, v2, v12, v13}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v3

    .line 166
    invoke-interface {v4, v3}, Lcom/google/protobuf/i0;->t(Ljava/util/List;)V

    goto/16 :goto_e

    :pswitch_2e
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 167
    iget-object v3, v1, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 168
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-virtual {v3, v2, v12, v13}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v3

    .line 169
    invoke-interface {v4, v3}, Lcom/google/protobuf/i0;->B(Ljava/util/List;)V

    goto/16 :goto_e

    :pswitch_2f
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 170
    iget-object v3, v1, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 171
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-virtual {v3, v2, v12, v13}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v3

    .line 172
    invoke-interface {v4, v3}, Lcom/google/protobuf/i0;->h(Ljava/util/List;)V

    goto/16 :goto_e

    :pswitch_30
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 173
    iget-object v3, v1, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 174
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-virtual {v3, v2, v12, v13}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v3

    .line 175
    invoke-interface {v4, v3}, Lcom/google/protobuf/i0;->j(Ljava/util/List;)V

    goto/16 :goto_e

    :pswitch_31
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 176
    iget-object v3, v1, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 177
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-virtual {v3, v2, v12, v13}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v3

    .line 178
    invoke-interface {v4, v3}, Lcom/google/protobuf/i0;->I(Ljava/util/List;)V

    goto/16 :goto_e

    :pswitch_32
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 179
    iget-object v3, v1, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 180
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-virtual {v3, v2, v12, v13}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v3

    .line 181
    invoke-interface {v4, v3}, Lcom/google/protobuf/i0;->M(Ljava/util/List;)V

    goto/16 :goto_e

    :pswitch_33
    move-object v11, v5

    move-object v2, v7

    .line 182
    invoke-direct {v1, v2, v3}, Lcom/google/protobuf/W;->Q(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/protobuf/T;

    .line 183
    invoke-direct {v1, v3}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v7

    .line 184
    invoke-interface {v4, v5, v7, v6}, Lcom/google/protobuf/i0;->y(Ljava/lang/Object;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V

    .line 185
    invoke-direct {v1, v2, v3, v5}, Lcom/google/protobuf/W;->r0(Ljava/lang/Object;ILjava/lang/Object;)V

    goto/16 :goto_e

    :pswitch_34
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 186
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->D()J

    move-result-wide v14

    invoke-static {v2, v12, v13, v14, v15}, Lcom/google/protobuf/u0;->U(Ljava/lang/Object;JJ)V

    .line 187
    invoke-direct {v1, v2, v3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_e

    :pswitch_35
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 188
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->m()I

    move-result v5

    invoke-static {v2, v12, v13, v5}, Lcom/google/protobuf/u0;->T(Ljava/lang/Object;JI)V

    .line 189
    invoke-direct {v1, v2, v3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_e

    :pswitch_36
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 190
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->g()J

    move-result-wide v14

    invoke-static {v2, v12, v13, v14, v15}, Lcom/google/protobuf/u0;->U(Ljava/lang/Object;JJ)V

    .line 191
    invoke-direct {v1, v2, v3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_e

    :pswitch_37
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 192
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->K()I

    move-result v5

    invoke-static {v2, v12, v13, v5}, Lcom/google/protobuf/u0;->T(Ljava/lang/Object;JI)V

    .line 193
    invoke-direct {v1, v2, v3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_e

    :pswitch_38
    move-object v11, v7

    move v7, v2

    move-object v2, v11

    move-object v11, v5

    move v5, v9

    .line 194
    invoke-interface {v4}, Lcom/google/protobuf/i0;->l()I

    move-result v9

    .line 195
    invoke-direct {v1, v3}, Lcom/google/protobuf/W;->t(I)Lcom/google/protobuf/A$e;

    move-result-object v12

    if-eqz v12, :cond_10

    .line 196
    invoke-interface {v12, v9}, Lcom/google/protobuf/A$e;->isInRange(I)Z

    move-result v12

    if-eqz v12, :cond_f

    goto :goto_1f

    .line 197
    :cond_f
    invoke-static {v2, v7, v9, v10, v11}, Lcom/google/protobuf/l0;->J(Ljava/lang/Object;IILjava/lang/Object;Lcom/google/protobuf/q0;)Ljava/lang/Object;

    move-result-object v5

    goto/16 :goto_25

    .line 198
    :cond_10
    :goto_1f
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-static {v2, v12, v13, v9}, Lcom/google/protobuf/u0;->T(Ljava/lang/Object;JI)V

    .line 199
    invoke-direct {v1, v2, v3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_e

    :pswitch_39
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 200
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->i()I

    move-result v5

    invoke-static {v2, v12, v13, v5}, Lcom/google/protobuf/u0;->T(Ljava/lang/Object;JI)V

    .line 201
    invoke-direct {v1, v2, v3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_e

    :pswitch_3a
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 202
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->r()Lcom/google/protobuf/h;

    move-result-object v5

    invoke-static {v2, v12, v13, v5}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 203
    invoke-direct {v1, v2, v3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_e

    :pswitch_3b
    move-object v11, v5

    move-object v2, v7

    .line 204
    invoke-direct {v1, v2, v3}, Lcom/google/protobuf/W;->Q(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/protobuf/T;

    .line 205
    invoke-direct {v1, v3}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v7

    .line 206
    invoke-interface {v4, v5, v7, v6}, Lcom/google/protobuf/i0;->H(Ljava/lang/Object;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V

    .line 207
    invoke-direct {v1, v2, v3, v5}, Lcom/google/protobuf/W;->r0(Ljava/lang/Object;ILjava/lang/Object;)V

    goto/16 :goto_e

    :pswitch_3c
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 208
    invoke-direct {v1, v2, v5, v4}, Lcom/google/protobuf/W;->l0(Ljava/lang/Object;ILcom/google/protobuf/i0;)V

    .line 209
    invoke-direct {v1, v2, v3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_e

    :pswitch_3d
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 210
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->e()Z

    move-result v5

    invoke-static {v2, v12, v13, v5}, Lcom/google/protobuf/u0;->L(Ljava/lang/Object;JZ)V

    .line 211
    invoke-direct {v1, v2, v3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_e

    :pswitch_3e
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 212
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->z()I

    move-result v5

    invoke-static {v2, v12, v13, v5}, Lcom/google/protobuf/u0;->T(Ljava/lang/Object;JI)V

    .line 213
    invoke-direct {v1, v2, v3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_e

    :pswitch_3f
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 214
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->a()J

    move-result-wide v14

    invoke-static {v2, v12, v13, v14, v15}, Lcom/google/protobuf/u0;->U(Ljava/lang/Object;JJ)V

    .line 215
    invoke-direct {v1, v2, v3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_e

    :pswitch_40
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 216
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->s()I

    move-result v5

    invoke-static {v2, v12, v13, v5}, Lcom/google/protobuf/u0;->T(Ljava/lang/Object;JI)V

    .line 217
    invoke-direct {v1, v2, v3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_e

    :pswitch_41
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 218
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->v()J

    move-result-wide v14

    invoke-static {v2, v12, v13, v14, v15}, Lcom/google/protobuf/u0;->U(Ljava/lang/Object;JJ)V

    .line 219
    invoke-direct {v1, v2, v3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_e

    :pswitch_42
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 220
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->N()J

    move-result-wide v14

    invoke-static {v2, v12, v13, v14, v15}, Lcom/google/protobuf/u0;->U(Ljava/lang/Object;JJ)V

    .line 221
    invoke-direct {v1, v2, v3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_e

    :pswitch_43
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 222
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->readFloat()F

    move-result v5

    invoke-static {v2, v12, v13, v5}, Lcom/google/protobuf/u0;->S(Ljava/lang/Object;JF)V

    .line 223
    invoke-direct {v1, v2, v3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_e

    :pswitch_44
    move-object v11, v5

    move-object v2, v7

    move v5, v9

    .line 224
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    invoke-interface {v4}, Lcom/google/protobuf/i0;->readDouble()D

    move-result-wide v14

    invoke-static {v2, v12, v13, v14, v15}, Lcom/google/protobuf/u0;->R(Ljava/lang/Object;JD)V

    .line 225
    invoke-direct {v1, v2, v3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V
    :try_end_15
    .catch Lcom/google/protobuf/B$a; {:try_start_15 .. :try_end_15} :catch_2
    .catchall {:try_start_15 .. :try_end_15} :catchall_11

    goto/16 :goto_e

    .line 226
    :goto_20
    :try_start_16
    invoke-virtual {v11, v4}, Lcom/google/protobuf/q0;->q(Lcom/google/protobuf/i0;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 227
    invoke-interface {v4}, Lcom/google/protobuf/i0;->J()Z

    move-result v3
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_12

    if-nez v3, :cond_16

    .line 228
    iget v0, v1, Lcom/google/protobuf/W;->k:I

    move-object v4, v5

    :goto_21
    iget v3, v1, Lcom/google/protobuf/W;->l:I

    if-ge v0, v3, :cond_11

    .line 229
    iget-object v3, v1, Lcom/google/protobuf/W;->j:[I

    aget v3, v3, v0

    move-object/from16 v6, p3

    move-object v5, v11

    .line 230
    invoke-direct/range {v1 .. v6}, Lcom/google/protobuf/W;->q(Ljava/lang/Object;ILjava/lang/Object;Lcom/google/protobuf/q0;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_21

    :cond_11
    if-eqz v4, :cond_15

    .line 231
    :goto_22
    invoke-virtual {v11, v2, v4}, Lcom/google/protobuf/q0;->o(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_24

    :catchall_12
    move-exception v0

    goto :goto_26

    :cond_12
    if-nez v5, :cond_13

    .line 232
    :try_start_17
    invoke-virtual {v11, v2}, Lcom/google/protobuf/q0;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v5, v3

    .line 233
    :cond_13
    invoke-virtual {v11, v5, v4}, Lcom/google/protobuf/q0;->m(Ljava/lang/Object;Lcom/google/protobuf/i0;)Z

    move-result v3
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_12

    if-nez v3, :cond_16

    .line 234
    iget v0, v1, Lcom/google/protobuf/W;->k:I

    move-object v4, v5

    :goto_23
    iget v3, v1, Lcom/google/protobuf/W;->l:I

    if-ge v0, v3, :cond_14

    .line 235
    iget-object v3, v1, Lcom/google/protobuf/W;->j:[I

    aget v3, v3, v0

    move-object/from16 v6, p3

    move-object v5, v11

    .line 236
    invoke-direct/range {v1 .. v6}, Lcom/google/protobuf/W;->q(Ljava/lang/Object;ILjava/lang/Object;Lcom/google/protobuf/q0;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_23

    :cond_14
    if-eqz v4, :cond_15

    goto :goto_22

    :cond_15
    :goto_24
    return-void

    :cond_16
    :goto_25
    move-object v4, v6

    goto/16 :goto_0

    :catchall_13
    move-exception v0

    move-object/from16 v11, p1

    move-object/from16 v2, p3

    move-object v10, v5

    .line 237
    :goto_26
    iget v3, v1, Lcom/google/protobuf/W;->k:I

    move v7, v3

    move-object v4, v5

    :goto_27
    iget v3, v1, Lcom/google/protobuf/W;->l:I

    if-ge v7, v3, :cond_17

    .line 238
    iget-object v3, v1, Lcom/google/protobuf/W;->j:[I

    aget v3, v3, v7

    move-object/from16 v6, p3

    move-object v5, v11

    .line 239
    invoke-direct/range {v1 .. v6}, Lcom/google/protobuf/W;->q(Ljava/lang/Object;ILjava/lang/Object;Lcom/google/protobuf/q0;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v7, v7, 0x1

    move-object/from16 v1, p0

    goto :goto_27

    :cond_17
    move-object v5, v11

    if-eqz v4, :cond_18

    .line 240
    invoke-virtual {v5, v2, v4}, Lcom/google/protobuf/q0;->o(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 241
    :cond_18
    throw v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private final M(Ljava/lang/Object;ILjava/lang/Object;Lcom/google/protobuf/p;Lcom/google/protobuf/i0;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "I",
            "Ljava/lang/Object;",
            "Lcom/google/protobuf/p;",
            "Lcom/google/protobuf/i0;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-direct {p0, p2}, Lcom/google/protobuf/W;->u0(I)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-static {p2}, Lcom/google/protobuf/W;->W(I)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    iget-object p2, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 16
    .line 17
    invoke-interface {p2, p3}, Lcom/google/protobuf/N;->d(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-static {p1, v0, v1, p2}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v2, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 26
    .line 27
    invoke-interface {v2, p2}, Lcom/google/protobuf/N;->h(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    iget-object v2, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 34
    .line 35
    invoke-interface {v2, p3}, Lcom/google/protobuf/N;->d(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget-object v3, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 40
    .line 41
    invoke-interface {v3, v2, p2}, Lcom/google/protobuf/N;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    invoke-static {p1, v0, v1, v2}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    move-object p2, v2

    .line 48
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 49
    .line 50
    invoke-interface {p1, p2}, Lcom/google/protobuf/N;->c(Ljava/lang/Object;)Ljava/util/Map;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object p0, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 55
    .line 56
    invoke-interface {p0, p3}, Lcom/google/protobuf/N;->b(Ljava/lang/Object;)Lcom/google/protobuf/L$a;

    .line 57
    .line 58
    .line 59
    const/4 p0, 0x0

    .line 60
    invoke-interface {p5, p1, p0, p4}, Lcom/google/protobuf/i0;->p(Ljava/util/Map;Lcom/google/protobuf/L$a;Lcom/google/protobuf/p;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method private N(Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-direct {p0, p3}, Lcom/google/protobuf/W;->u0(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-static {v0}, Lcom/google/protobuf/W;->W(I)J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    sget-object v2, Lcom/google/protobuf/W;->s:Lsun/misc/Unsafe;

    .line 17
    .line 18
    invoke-virtual {v2, p2, v0, v1}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    if-eqz v3, :cond_4

    .line 23
    .line 24
    invoke-direct {p0, p3}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-direct {p0, p1, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-nez v4, :cond_2

    .line 33
    .line 34
    invoke-static {v3}, Lcom/google/protobuf/W;->G(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-nez v4, :cond_1

    .line 39
    .line 40
    invoke-virtual {v2, p1, v0, v1, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-interface {p2}, Lcom/google/protobuf/j0;->f()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-interface {p2, v4, v3}, Lcom/google/protobuf/j0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2, p1, v0, v1, v4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    :goto_0
    invoke-direct {p0, p1, p3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    invoke-virtual {v2, p1, v0, v1}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {p0}, Lcom/google/protobuf/W;->G(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p3

    .line 66
    if-nez p3, :cond_3

    .line 67
    .line 68
    invoke-interface {p2}, Lcom/google/protobuf/j0;->f()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p3

    .line 72
    invoke-interface {p2, p3, p0}, Lcom/google/protobuf/j0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2, p1, v0, v1, p3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    move-object p0, p3

    .line 79
    :cond_3
    invoke-interface {p2, p0, v3}, Lcom/google/protobuf/j0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 84
    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 88
    .line 89
    .line 90
    const-string v1, "Source subfield "

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-direct {p0, p3}, Lcom/google/protobuf/W;->V(I)I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string p0, " is present but null: "

    .line 103
    .line 104
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    throw p1
.end method

.method private O(Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p3}, Lcom/google/protobuf/W;->V(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, p2, v0, p3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-direct {p0, p3}, Lcom/google/protobuf/W;->u0(I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-static {v1}, Lcom/google/protobuf/W;->W(I)J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    sget-object v3, Lcom/google/protobuf/W;->s:Lsun/misc/Unsafe;

    .line 21
    .line 22
    invoke-virtual {v3, p2, v1, v2}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    if-eqz v4, :cond_4

    .line 27
    .line 28
    invoke-direct {p0, p3}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-direct {p0, p1, v0, p3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    if-nez v5, :cond_2

    .line 37
    .line 38
    invoke-static {v4}, Lcom/google/protobuf/W;->G(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    if-nez v5, :cond_1

    .line 43
    .line 44
    invoke-virtual {v3, p1, v1, v2, v4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    invoke-interface {p2}, Lcom/google/protobuf/j0;->f()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    invoke-interface {p2, v5, v4}, Lcom/google/protobuf/j0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, p1, v1, v2, v5}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    :goto_0
    invoke-direct {p0, p1, v0, p3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    invoke-virtual {v3, p1, v1, v2}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {p0}, Lcom/google/protobuf/W;->G(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p3

    .line 70
    if-nez p3, :cond_3

    .line 71
    .line 72
    invoke-interface {p2}, Lcom/google/protobuf/j0;->f()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    invoke-interface {p2, p3, p0}, Lcom/google/protobuf/j0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3, p1, v1, v2, p3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    move-object p0, p3

    .line 83
    :cond_3
    invoke-interface {p2, p0, v4}, Lcom/google/protobuf/j0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 88
    .line 89
    new-instance v0, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    .line 93
    .line 94
    const-string v1, "Source subfield "

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-direct {p0, p3}, Lcom/google/protobuf/W;->V(I)I

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string p0, " is present but null: "

    .line 107
    .line 108
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    throw p1
.end method

.method private P(Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p3}, Lcom/google/protobuf/W;->u0(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Lcom/google/protobuf/W;->W(I)J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-direct {p0, p3}, Lcom/google/protobuf/W;->V(I)I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    invoke-static {v0}, Lcom/google/protobuf/W;->t0(I)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    packed-switch v0, :pswitch_data_0

    .line 18
    .line 19
    .line 20
    goto/16 :goto_0

    .line 21
    .line 22
    :pswitch_0
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->O(Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :pswitch_1
    invoke-direct {p0, p2, v3, p3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-static {p1, v1, v2, p2}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0, p1, v3, p3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :pswitch_2
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->O(Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :pswitch_3
    invoke-direct {p0, p2, v3, p3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-static {p1, v1, v2, p2}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    invoke-direct {p0, p1, v3, p3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :pswitch_4
    iget-object p0, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 65
    .line 66
    invoke-static {p0, p1, p2, v1, v2}, Lcom/google/protobuf/l0;->F(Lcom/google/protobuf/N;Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :pswitch_5
    iget-object p0, p0, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 71
    .line 72
    invoke-virtual {p0, p1, p2, v1, v2}, Lcom/google/protobuf/I;->d(Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :pswitch_6
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->N(Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :pswitch_7
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_0

    .line 85
    .line 86
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 87
    .line 88
    .line 89
    move-result-wide v3

    .line 90
    invoke-static {p1, v1, v2, v3, v4}, Lcom/google/protobuf/u0;->U(Ljava/lang/Object;JJ)V

    .line 91
    .line 92
    .line 93
    invoke-direct {p0, p1, p3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :pswitch_8
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_0

    .line 102
    .line 103
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 104
    .line 105
    .line 106
    move-result p2

    .line 107
    invoke-static {p1, v1, v2, p2}, Lcom/google/protobuf/u0;->T(Ljava/lang/Object;JI)V

    .line 108
    .line 109
    .line 110
    invoke-direct {p0, p1, p3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :pswitch_9
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_0

    .line 119
    .line 120
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 121
    .line 122
    .line 123
    move-result-wide v3

    .line 124
    invoke-static {p1, v1, v2, v3, v4}, Lcom/google/protobuf/u0;->U(Ljava/lang/Object;JJ)V

    .line 125
    .line 126
    .line 127
    invoke-direct {p0, p1, p3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :pswitch_a
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_0

    .line 136
    .line 137
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 138
    .line 139
    .line 140
    move-result p2

    .line 141
    invoke-static {p1, v1, v2, p2}, Lcom/google/protobuf/u0;->T(Ljava/lang/Object;JI)V

    .line 142
    .line 143
    .line 144
    invoke-direct {p0, p1, p3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :pswitch_b
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-eqz v0, :cond_0

    .line 153
    .line 154
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 155
    .line 156
    .line 157
    move-result p2

    .line 158
    invoke-static {p1, v1, v2, p2}, Lcom/google/protobuf/u0;->T(Ljava/lang/Object;JI)V

    .line 159
    .line 160
    .line 161
    invoke-direct {p0, p1, p3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :pswitch_c
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-eqz v0, :cond_0

    .line 170
    .line 171
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 172
    .line 173
    .line 174
    move-result p2

    .line 175
    invoke-static {p1, v1, v2, p2}, Lcom/google/protobuf/u0;->T(Ljava/lang/Object;JI)V

    .line 176
    .line 177
    .line 178
    invoke-direct {p0, p1, p3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    :pswitch_d
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-eqz v0, :cond_0

    .line 187
    .line 188
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object p2

    .line 192
    invoke-static {p1, v1, v2, p2}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 193
    .line 194
    .line 195
    invoke-direct {p0, p1, p3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    .line 196
    .line 197
    .line 198
    return-void

    .line 199
    :pswitch_e
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->N(Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 200
    .line 201
    .line 202
    return-void

    .line 203
    :pswitch_f
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    if-eqz v0, :cond_0

    .line 208
    .line 209
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object p2

    .line 213
    invoke-static {p1, v1, v2, p2}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 214
    .line 215
    .line 216
    invoke-direct {p0, p1, p3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    .line 217
    .line 218
    .line 219
    return-void

    .line 220
    :pswitch_10
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 221
    .line 222
    .line 223
    move-result v0

    .line 224
    if-eqz v0, :cond_0

    .line 225
    .line 226
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->t(Ljava/lang/Object;J)Z

    .line 227
    .line 228
    .line 229
    move-result p2

    .line 230
    invoke-static {p1, v1, v2, p2}, Lcom/google/protobuf/u0;->L(Ljava/lang/Object;JZ)V

    .line 231
    .line 232
    .line 233
    invoke-direct {p0, p1, p3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    .line 234
    .line 235
    .line 236
    return-void

    .line 237
    :pswitch_11
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    if-eqz v0, :cond_0

    .line 242
    .line 243
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 244
    .line 245
    .line 246
    move-result p2

    .line 247
    invoke-static {p1, v1, v2, p2}, Lcom/google/protobuf/u0;->T(Ljava/lang/Object;JI)V

    .line 248
    .line 249
    .line 250
    invoke-direct {p0, p1, p3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    .line 251
    .line 252
    .line 253
    return-void

    .line 254
    :pswitch_12
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 255
    .line 256
    .line 257
    move-result v0

    .line 258
    if-eqz v0, :cond_0

    .line 259
    .line 260
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 261
    .line 262
    .line 263
    move-result-wide v3

    .line 264
    invoke-static {p1, v1, v2, v3, v4}, Lcom/google/protobuf/u0;->U(Ljava/lang/Object;JJ)V

    .line 265
    .line 266
    .line 267
    invoke-direct {p0, p1, p3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    .line 268
    .line 269
    .line 270
    return-void

    .line 271
    :pswitch_13
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 272
    .line 273
    .line 274
    move-result v0

    .line 275
    if-eqz v0, :cond_0

    .line 276
    .line 277
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 278
    .line 279
    .line 280
    move-result p2

    .line 281
    invoke-static {p1, v1, v2, p2}, Lcom/google/protobuf/u0;->T(Ljava/lang/Object;JI)V

    .line 282
    .line 283
    .line 284
    invoke-direct {p0, p1, p3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    .line 285
    .line 286
    .line 287
    return-void

    .line 288
    :pswitch_14
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 289
    .line 290
    .line 291
    move-result v0

    .line 292
    if-eqz v0, :cond_0

    .line 293
    .line 294
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 295
    .line 296
    .line 297
    move-result-wide v3

    .line 298
    invoke-static {p1, v1, v2, v3, v4}, Lcom/google/protobuf/u0;->U(Ljava/lang/Object;JJ)V

    .line 299
    .line 300
    .line 301
    invoke-direct {p0, p1, p3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    .line 302
    .line 303
    .line 304
    return-void

    .line 305
    :pswitch_15
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    if-eqz v0, :cond_0

    .line 310
    .line 311
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 312
    .line 313
    .line 314
    move-result-wide v3

    .line 315
    invoke-static {p1, v1, v2, v3, v4}, Lcom/google/protobuf/u0;->U(Ljava/lang/Object;JJ)V

    .line 316
    .line 317
    .line 318
    invoke-direct {p0, p1, p3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    .line 319
    .line 320
    .line 321
    return-void

    .line 322
    :pswitch_16
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    if-eqz v0, :cond_0

    .line 327
    .line 328
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->B(Ljava/lang/Object;J)F

    .line 329
    .line 330
    .line 331
    move-result p2

    .line 332
    invoke-static {p1, v1, v2, p2}, Lcom/google/protobuf/u0;->S(Ljava/lang/Object;JF)V

    .line 333
    .line 334
    .line 335
    invoke-direct {p0, p1, p3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    .line 336
    .line 337
    .line 338
    return-void

    .line 339
    :pswitch_17
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    if-eqz v0, :cond_0

    .line 344
    .line 345
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->A(Ljava/lang/Object;J)D

    .line 346
    .line 347
    .line 348
    move-result-wide v3

    .line 349
    invoke-static {p1, v1, v2, v3, v4}, Lcom/google/protobuf/u0;->R(Ljava/lang/Object;JD)V

    .line 350
    .line 351
    .line 352
    invoke-direct {p0, p1, p3}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    .line 353
    .line 354
    .line 355
    :cond_0
    :goto_0
    return-void

    .line 356
    nop

    .line 357
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private Q(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, p2}, Lcom/google/protobuf/W;->u0(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v1}, Lcom/google/protobuf/W;->W(I)J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    invoke-direct {p0, p1, p2}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    invoke-interface {v0}, Lcom/google/protobuf/j0;->f()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    sget-object p0, Lcom/google/protobuf/W;->s:Lsun/misc/Unsafe;

    .line 25
    .line 26
    invoke-virtual {p0, p1, v1, v2}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Lcom/google/protobuf/W;->G(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_1
    invoke-interface {v0}, Lcom/google/protobuf/j0;->f()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    invoke-interface {v0, p1, p0}, Lcom/google/protobuf/j0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    :cond_2
    return-object p1
.end method

.method private R(Ljava/lang/Object;II)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;II)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p3}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/google/protobuf/j0;->f()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    sget-object p2, Lcom/google/protobuf/W;->s:Lsun/misc/Unsafe;

    .line 17
    .line 18
    invoke-direct {p0, p3}, Lcom/google/protobuf/W;->u0(I)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-static {p0}, Lcom/google/protobuf/W;->W(I)J

    .line 23
    .line 24
    .line 25
    move-result-wide v1

    .line 26
    invoke-virtual {p2, p1, v1, v2}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Lcom/google/protobuf/W;->G(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_1
    invoke-interface {v0}, Lcom/google/protobuf/j0;->f()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    invoke-interface {v0, p1, p0}, Lcom/google/protobuf/j0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    :cond_2
    return-object p1
.end method

.method static S(Ljava/lang/Class;Lcom/google/protobuf/Q;Lcom/google/protobuf/Y;Lcom/google/protobuf/I;Lcom/google/protobuf/q0;Lcom/google/protobuf/q;Lcom/google/protobuf/N;)Lcom/google/protobuf/W;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/protobuf/Q;",
            "Lcom/google/protobuf/Y;",
            "Lcom/google/protobuf/I;",
            "Lcom/google/protobuf/q0<",
            "**>;",
            "Lcom/google/protobuf/q<",
            "*>;",
            "Lcom/google/protobuf/N;",
            ")",
            "Lcom/google/protobuf/W<",
            "TT;>;"
        }
    .end annotation

    .line 1
    instance-of p0, p1, Lcom/google/protobuf/h0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/google/protobuf/h0;

    .line 6
    .line 7
    invoke-static/range {p1 .. p6}, Lcom/google/protobuf/W;->U(Lcom/google/protobuf/h0;Lcom/google/protobuf/Y;Lcom/google/protobuf/I;Lcom/google/protobuf/q0;Lcom/google/protobuf/q;Lcom/google/protobuf/N;)Lcom/google/protobuf/W;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    check-cast p1, Lcom/google/protobuf/n0;

    .line 13
    .line 14
    invoke-static/range {p1 .. p6}, Lcom/google/protobuf/W;->T(Lcom/google/protobuf/n0;Lcom/google/protobuf/Y;Lcom/google/protobuf/I;Lcom/google/protobuf/q0;Lcom/google/protobuf/q;Lcom/google/protobuf/N;)Lcom/google/protobuf/W;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method static T(Lcom/google/protobuf/n0;Lcom/google/protobuf/Y;Lcom/google/protobuf/I;Lcom/google/protobuf/q0;Lcom/google/protobuf/q;Lcom/google/protobuf/N;)Lcom/google/protobuf/W;
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/n0;",
            "Lcom/google/protobuf/Y;",
            "Lcom/google/protobuf/I;",
            "Lcom/google/protobuf/q0<",
            "**>;",
            "Lcom/google/protobuf/q<",
            "*>;",
            "Lcom/google/protobuf/N;",
            ")",
            "Lcom/google/protobuf/W<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual/range {p0 .. p0}, Lcom/google/protobuf/n0;->e()[Lcom/google/protobuf/t;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    const/4 v3, 0x0

    .line 8
    if-nez v1, :cond_3

    .line 9
    .line 10
    array-length v1, v0

    .line 11
    mul-int/lit8 v4, v1, 0x3

    .line 12
    .line 13
    new-array v6, v4, [I

    .line 14
    .line 15
    mul-int/lit8 v1, v1, 0x2

    .line 16
    .line 17
    new-array v7, v1, [Ljava/lang/Object;

    .line 18
    .line 19
    array-length v1, v0

    .line 20
    if-gtz v1, :cond_2

    .line 21
    .line 22
    invoke-virtual/range {p0 .. p0}, Lcom/google/protobuf/n0;->d()[I

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    sget-object v1, Lcom/google/protobuf/W;->r:[I

    .line 29
    .line 30
    :cond_0
    array-length v4, v0

    .line 31
    if-gtz v4, :cond_1

    .line 32
    .line 33
    sget-object v0, Lcom/google/protobuf/W;->r:[I

    .line 34
    .line 35
    sget-object v2, Lcom/google/protobuf/W;->r:[I

    .line 36
    .line 37
    array-length v4, v1

    .line 38
    array-length v5, v0

    .line 39
    add-int/2addr v4, v5

    .line 40
    array-length v5, v2

    .line 41
    add-int/2addr v4, v5

    .line 42
    new-array v13, v4, [I

    .line 43
    .line 44
    array-length v4, v1

    .line 45
    invoke-static {v1, v3, v13, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 46
    .line 47
    .line 48
    array-length v4, v1

    .line 49
    array-length v5, v0

    .line 50
    invoke-static {v0, v3, v13, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 51
    .line 52
    .line 53
    array-length v4, v1

    .line 54
    array-length v5, v0

    .line 55
    add-int/2addr v4, v5

    .line 56
    array-length v5, v2

    .line 57
    invoke-static {v2, v3, v13, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 58
    .line 59
    .line 60
    new-instance v5, Lcom/google/protobuf/W;

    .line 61
    .line 62
    invoke-virtual/range {p0 .. p0}, Lcom/google/protobuf/n0;->b()Lcom/google/protobuf/T;

    .line 63
    .line 64
    .line 65
    move-result-object v10

    .line 66
    invoke-virtual/range {p0 .. p0}, Lcom/google/protobuf/n0;->c()Lcom/google/protobuf/e0;

    .line 67
    .line 68
    .line 69
    move-result-object v11

    .line 70
    array-length v14, v1

    .line 71
    array-length v1, v1

    .line 72
    array-length v0, v0

    .line 73
    add-int v15, v1, v0

    .line 74
    .line 75
    const/4 v8, 0x0

    .line 76
    const/4 v9, 0x0

    .line 77
    const/4 v12, 0x1

    .line 78
    move-object/from16 v16, p1

    .line 79
    .line 80
    move-object/from16 v17, p2

    .line 81
    .line 82
    move-object/from16 v18, p3

    .line 83
    .line 84
    move-object/from16 v19, p4

    .line 85
    .line 86
    move-object/from16 v20, p5

    .line 87
    .line 88
    invoke-direct/range {v5 .. v20}, Lcom/google/protobuf/W;-><init>([I[Ljava/lang/Object;IILcom/google/protobuf/T;Lcom/google/protobuf/e0;Z[IIILcom/google/protobuf/Y;Lcom/google/protobuf/I;Lcom/google/protobuf/q0;Lcom/google/protobuf/q;Lcom/google/protobuf/N;)V

    .line 89
    .line 90
    .line 91
    return-object v5

    .line 92
    :cond_1
    aget-object v0, v0, v3

    .line 93
    .line 94
    throw v2

    .line 95
    :cond_2
    aget-object v0, v0, v3

    .line 96
    .line 97
    throw v2

    .line 98
    :cond_3
    aget-object v0, v0, v3

    .line 99
    .line 100
    throw v2
.end method

.method static U(Lcom/google/protobuf/h0;Lcom/google/protobuf/Y;Lcom/google/protobuf/I;Lcom/google/protobuf/q0;Lcom/google/protobuf/q;Lcom/google/protobuf/N;)Lcom/google/protobuf/W;
    .locals 33
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/h0;",
            "Lcom/google/protobuf/Y;",
            "Lcom/google/protobuf/I;",
            "Lcom/google/protobuf/q0<",
            "**>;",
            "Lcom/google/protobuf/q<",
            "*>;",
            "Lcom/google/protobuf/N;",
            ")",
            "Lcom/google/protobuf/W<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual/range {p0 .. p0}, Lcom/google/protobuf/h0;->e()Ljava/lang/String;

    move-result-object v0

    .line 2
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x0

    .line 3
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const v5, 0xd800

    if-lt v3, v5, :cond_0

    const/4 v3, 0x1

    :goto_0
    add-int/lit8 v6, v3, 0x1

    .line 4
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-lt v3, v5, :cond_1

    move v3, v6

    goto :goto_0

    :cond_0
    const/4 v6, 0x1

    :cond_1
    add-int/lit8 v3, v6, 0x1

    .line 5
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-lt v6, v5, :cond_3

    and-int/lit16 v6, v6, 0x1fff

    const/16 v8, 0xd

    :goto_1
    add-int/lit8 v9, v3, 0x1

    .line 6
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-lt v3, v5, :cond_2

    and-int/lit16 v3, v3, 0x1fff

    shl-int/2addr v3, v8

    or-int/2addr v6, v3

    add-int/lit8 v8, v8, 0xd

    move v3, v9

    goto :goto_1

    :cond_2
    shl-int/2addr v3, v8

    or-int/2addr v6, v3

    move v3, v9

    :cond_3
    if-nez v6, :cond_4

    .line 7
    sget-object v6, Lcom/google/protobuf/W;->r:[I

    move v8, v2

    move v10, v8

    move v11, v10

    move v12, v11

    move v15, v12

    move/from16 v17, v15

    move-object/from16 v16, v6

    move/from16 v6, v17

    goto/16 :goto_a

    :cond_4
    add-int/lit8 v6, v3, 0x1

    .line 8
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-lt v3, v5, :cond_6

    and-int/lit16 v3, v3, 0x1fff

    const/16 v8, 0xd

    :goto_2
    add-int/lit8 v9, v6, 0x1

    .line 9
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-lt v6, v5, :cond_5

    and-int/lit16 v6, v6, 0x1fff

    shl-int/2addr v6, v8

    or-int/2addr v3, v6

    add-int/lit8 v8, v8, 0xd

    move v6, v9

    goto :goto_2

    :cond_5
    shl-int/2addr v6, v8

    or-int/2addr v3, v6

    move v6, v9

    :cond_6
    add-int/lit8 v8, v6, 0x1

    .line 10
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-lt v6, v5, :cond_8

    and-int/lit16 v6, v6, 0x1fff

    const/16 v9, 0xd

    :goto_3
    add-int/lit8 v10, v8, 0x1

    .line 11
    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-lt v8, v5, :cond_7

    and-int/lit16 v8, v8, 0x1fff

    shl-int/2addr v8, v9

    or-int/2addr v6, v8

    add-int/lit8 v9, v9, 0xd

    move v8, v10

    goto :goto_3

    :cond_7
    shl-int/2addr v8, v9

    or-int/2addr v6, v8

    move v8, v10

    :cond_8
    add-int/lit8 v9, v8, 0x1

    .line 12
    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-lt v8, v5, :cond_a

    and-int/lit16 v8, v8, 0x1fff

    const/16 v10, 0xd

    :goto_4
    add-int/lit8 v11, v9, 0x1

    .line 13
    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-lt v9, v5, :cond_9

    and-int/lit16 v9, v9, 0x1fff

    shl-int/2addr v9, v10

    or-int/2addr v8, v9

    add-int/lit8 v10, v10, 0xd

    move v9, v11

    goto :goto_4

    :cond_9
    shl-int/2addr v9, v10

    or-int/2addr v8, v9

    move v9, v11

    :cond_a
    add-int/lit8 v10, v9, 0x1

    .line 14
    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-lt v9, v5, :cond_c

    and-int/lit16 v9, v9, 0x1fff

    const/16 v11, 0xd

    :goto_5
    add-int/lit8 v12, v10, 0x1

    .line 15
    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-lt v10, v5, :cond_b

    and-int/lit16 v10, v10, 0x1fff

    shl-int/2addr v10, v11

    or-int/2addr v9, v10

    add-int/lit8 v11, v11, 0xd

    move v10, v12

    goto :goto_5

    :cond_b
    shl-int/2addr v10, v11

    or-int/2addr v9, v10

    move v10, v12

    :cond_c
    add-int/lit8 v11, v10, 0x1

    .line 16
    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-lt v10, v5, :cond_e

    and-int/lit16 v10, v10, 0x1fff

    const/16 v12, 0xd

    :goto_6
    add-int/lit8 v13, v11, 0x1

    .line 17
    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    if-lt v11, v5, :cond_d

    and-int/lit16 v11, v11, 0x1fff

    shl-int/2addr v11, v12

    or-int/2addr v10, v11

    add-int/lit8 v12, v12, 0xd

    move v11, v13

    goto :goto_6

    :cond_d
    shl-int/2addr v11, v12

    or-int/2addr v10, v11

    move v11, v13

    :cond_e
    add-int/lit8 v12, v11, 0x1

    .line 18
    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    if-lt v11, v5, :cond_10

    and-int/lit16 v11, v11, 0x1fff

    const/16 v13, 0xd

    :goto_7
    add-int/lit8 v14, v12, 0x1

    .line 19
    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-lt v12, v5, :cond_f

    and-int/lit16 v12, v12, 0x1fff

    shl-int/2addr v12, v13

    or-int/2addr v11, v12

    add-int/lit8 v13, v13, 0xd

    move v12, v14

    goto :goto_7

    :cond_f
    shl-int/2addr v12, v13

    or-int/2addr v11, v12

    move v12, v14

    :cond_10
    add-int/lit8 v13, v12, 0x1

    .line 20
    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-lt v12, v5, :cond_12

    and-int/lit16 v12, v12, 0x1fff

    const/16 v14, 0xd

    :goto_8
    add-int/lit8 v15, v13, 0x1

    .line 21
    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v13

    if-lt v13, v5, :cond_11

    and-int/lit16 v13, v13, 0x1fff

    shl-int/2addr v13, v14

    or-int/2addr v12, v13

    add-int/lit8 v14, v14, 0xd

    move v13, v15

    goto :goto_8

    :cond_11
    shl-int/2addr v13, v14

    or-int/2addr v12, v13

    move v13, v15

    :cond_12
    add-int/lit8 v14, v13, 0x1

    .line 22
    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v13

    if-lt v13, v5, :cond_14

    and-int/lit16 v13, v13, 0x1fff

    const/16 v15, 0xd

    :goto_9
    add-int/lit8 v16, v14, 0x1

    .line 23
    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v14

    if-lt v14, v5, :cond_13

    and-int/lit16 v14, v14, 0x1fff

    shl-int/2addr v14, v15

    or-int/2addr v13, v14

    add-int/lit8 v15, v15, 0xd

    move/from16 v14, v16

    goto :goto_9

    :cond_13
    shl-int/2addr v14, v15

    or-int/2addr v13, v14

    move/from16 v14, v16

    :cond_14
    add-int v15, v13, v11

    add-int/2addr v15, v12

    .line 24
    new-array v12, v15, [I

    mul-int/lit8 v15, v3, 0x2

    add-int/2addr v15, v6

    move v6, v11

    move v11, v8

    move v8, v6

    move v6, v3

    move-object/from16 v16, v12

    move/from16 v17, v13

    move v3, v14

    move v12, v9

    .line 25
    :goto_a
    sget-object v9, Lcom/google/protobuf/W;->s:Lsun/misc/Unsafe;

    .line 26
    invoke-virtual/range {p0 .. p0}, Lcom/google/protobuf/h0;->d()[Ljava/lang/Object;

    move-result-object v13

    .line 27
    invoke-virtual/range {p0 .. p0}, Lcom/google/protobuf/h0;->b()Lcom/google/protobuf/T;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v14

    mul-int/lit8 v2, v10, 0x3

    .line 28
    new-array v2, v2, [I

    mul-int/lit8 v10, v10, 0x2

    .line 29
    new-array v10, v10, [Ljava/lang/Object;

    add-int v8, v17, v8

    move/from16 v22, v8

    move/from16 v21, v17

    const/16 v19, 0x0

    const/16 v20, 0x0

    :goto_b
    if-ge v3, v1, :cond_35

    add-int/lit8 v23, v3, 0x1

    .line 30
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-lt v3, v5, :cond_16

    and-int/lit16 v3, v3, 0x1fff

    move/from16 v4, v23

    const/16 v23, 0xd

    const/16 v24, 0x1

    :goto_c
    add-int/lit8 v25, v4, 0x1

    .line 31
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-lt v4, v5, :cond_15

    and-int/lit16 v4, v4, 0x1fff

    shl-int v4, v4, v23

    or-int/2addr v3, v4

    add-int/lit8 v23, v23, 0xd

    move/from16 v4, v25

    goto :goto_c

    :cond_15
    shl-int v4, v4, v23

    or-int/2addr v3, v4

    move/from16 v4, v25

    goto :goto_d

    :cond_16
    const/16 v24, 0x1

    move/from16 v4, v23

    :goto_d
    add-int/lit8 v23, v4, 0x1

    .line 32
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-lt v4, v5, :cond_18

    and-int/lit16 v4, v4, 0x1fff

    move/from16 v7, v23

    const/16 v23, 0xd

    :goto_e
    add-int/lit8 v26, v7, 0x1

    .line 33
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-lt v7, v5, :cond_17

    and-int/lit16 v7, v7, 0x1fff

    shl-int v7, v7, v23

    or-int/2addr v4, v7

    add-int/lit8 v23, v23, 0xd

    move/from16 v7, v26

    goto :goto_e

    :cond_17
    shl-int v7, v7, v23

    or-int/2addr v4, v7

    move/from16 v7, v26

    goto :goto_f

    :cond_18
    move/from16 v7, v23

    :goto_f
    and-int/lit16 v5, v4, 0xff

    move/from16 v26, v1

    and-int/lit16 v1, v4, 0x400

    if-eqz v1, :cond_19

    add-int/lit8 v1, v19, 0x1

    .line 34
    aput v20, v16, v19

    move/from16 v19, v1

    :cond_19
    const/16 v1, 0x33

    move-object/from16 v29, v2

    if-lt v5, v1, :cond_22

    add-int/lit8 v1, v7, 0x1

    .line 35
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const v2, 0xd800

    if-lt v7, v2, :cond_1b

    and-int/lit16 v7, v7, 0x1fff

    const/16 v31, 0xd

    :goto_10
    add-int/lit8 v32, v1, 0x1

    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-lt v1, v2, :cond_1a

    and-int/lit16 v1, v1, 0x1fff

    shl-int v1, v1, v31

    or-int/2addr v7, v1

    add-int/lit8 v31, v31, 0xd

    move/from16 v1, v32

    const v2, 0xd800

    goto :goto_10

    :cond_1a
    shl-int v1, v1, v31

    or-int/2addr v7, v1

    move/from16 v1, v32

    :cond_1b
    add-int/lit8 v2, v5, -0x33

    move/from16 v31, v1

    const/16 v1, 0x9

    if-eq v2, v1, :cond_1e

    const/16 v1, 0x11

    if-ne v2, v1, :cond_1c

    goto :goto_12

    :cond_1c
    const/16 v1, 0xc

    if-ne v2, v1, :cond_1f

    .line 37
    invoke-virtual/range {p0 .. p0}, Lcom/google/protobuf/h0;->c()Lcom/google/protobuf/e0;

    move-result-object v1

    sget-object v2, Lcom/google/protobuf/e0;->g:Lcom/google/protobuf/e0;

    invoke-virtual {v1, v2}, Ljava/lang/Enum;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1d

    and-int/lit16 v1, v4, 0x800

    if-eqz v1, :cond_1f

    .line 38
    :cond_1d
    div-int/lit8 v1, v20, 0x3

    mul-int/lit8 v1, v1, 0x2

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v2, v15, 0x1

    aget-object v15, v13, v15

    aput-object v15, v10, v1

    :goto_11
    move v15, v2

    goto :goto_13

    .line 39
    :cond_1e
    :goto_12
    div-int/lit8 v1, v20, 0x3

    mul-int/lit8 v1, v1, 0x2

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v2, v15, 0x1

    aget-object v15, v13, v15

    aput-object v15, v10, v1

    goto :goto_11

    :cond_1f
    :goto_13
    mul-int/lit8 v7, v7, 0x2

    .line 40
    aget-object v1, v13, v7

    .line 41
    instance-of v2, v1, Ljava/lang/reflect/Field;

    if-eqz v2, :cond_20

    .line 42
    check-cast v1, Ljava/lang/reflect/Field;

    goto :goto_14

    .line 43
    :cond_20
    check-cast v1, Ljava/lang/String;

    invoke-static {v14, v1}, Lcom/google/protobuf/W;->n0(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 44
    aput-object v1, v13, v7

    .line 45
    :goto_14
    invoke-virtual {v9, v1}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v1

    long-to-int v1, v1

    add-int/lit8 v7, v7, 0x1

    .line 46
    aget-object v2, v13, v7

    move/from16 v27, v1

    .line 47
    instance-of v1, v2, Ljava/lang/reflect/Field;

    if-eqz v1, :cond_21

    .line 48
    check-cast v2, Ljava/lang/reflect/Field;

    goto :goto_15

    .line 49
    :cond_21
    check-cast v2, Ljava/lang/String;

    invoke-static {v14, v2}, Lcom/google/protobuf/W;->n0(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 50
    aput-object v2, v13, v7

    .line 51
    :goto_15
    invoke-virtual {v9, v2}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v1

    long-to-int v1, v1

    move-object/from16 v30, v0

    move v0, v1

    move/from16 v1, v27

    const/4 v7, 0x0

    move/from16 v27, v3

    move/from16 v3, v31

    goto/16 :goto_22

    :cond_22
    add-int/lit8 v1, v15, 0x1

    .line 52
    aget-object v2, v13, v15

    check-cast v2, Ljava/lang/String;

    invoke-static {v14, v2}, Lcom/google/protobuf/W;->n0(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    move/from16 v31, v1

    const/16 v1, 0x9

    if-eq v5, v1, :cond_23

    const/16 v1, 0x11

    if-ne v5, v1, :cond_24

    :cond_23
    move/from16 v27, v3

    goto/16 :goto_19

    :cond_24
    const/16 v1, 0x1b

    if-eq v5, v1, :cond_25

    const/16 v1, 0x31

    if-ne v5, v1, :cond_26

    :cond_25
    move/from16 v27, v3

    goto :goto_18

    :cond_26
    const/16 v1, 0xc

    if-eq v5, v1, :cond_2a

    const/16 v1, 0x1e

    if-eq v5, v1, :cond_2a

    const/16 v1, 0x2c

    if-ne v5, v1, :cond_27

    goto :goto_16

    :cond_27
    const/16 v1, 0x32

    if-ne v5, v1, :cond_29

    add-int/lit8 v1, v21, 0x1

    .line 53
    aput v20, v16, v21

    .line 54
    div-int/lit8 v21, v20, 0x3

    mul-int/lit8 v21, v21, 0x2

    add-int/lit8 v27, v15, 0x2

    aget-object v28, v13, v31

    aput-object v28, v10, v21

    move/from16 v28, v1

    and-int/lit16 v1, v4, 0x800

    if-eqz v1, :cond_28

    add-int/lit8 v21, v21, 0x1

    add-int/lit8 v1, v15, 0x3

    .line 55
    aget-object v15, v13, v27

    aput-object v15, v10, v21

    move/from16 v27, v3

    move/from16 v21, v28

    goto :goto_1b

    :cond_28
    move/from16 v1, v27

    move/from16 v21, v28

    move/from16 v27, v3

    goto :goto_1b

    :cond_29
    move/from16 v27, v3

    goto :goto_1a

    .line 56
    :cond_2a
    :goto_16
    invoke-virtual/range {p0 .. p0}, Lcom/google/protobuf/h0;->c()Lcom/google/protobuf/e0;

    move-result-object v1

    move/from16 v27, v3

    sget-object v3, Lcom/google/protobuf/e0;->g:Lcom/google/protobuf/e0;

    if-eq v1, v3, :cond_2b

    and-int/lit16 v1, v4, 0x800

    if-eqz v1, :cond_2c

    .line 57
    :cond_2b
    div-int/lit8 v1, v20, 0x3

    mul-int/lit8 v1, v1, 0x2

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v15, v15, 0x2

    aget-object v3, v13, v31

    aput-object v3, v10, v1

    :goto_17
    move v1, v15

    goto :goto_1b

    .line 58
    :goto_18
    div-int/lit8 v1, v20, 0x3

    mul-int/lit8 v1, v1, 0x2

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v15, v15, 0x2

    aget-object v3, v13, v31

    aput-object v3, v10, v1

    goto :goto_17

    .line 59
    :goto_19
    div-int/lit8 v1, v20, 0x3

    mul-int/lit8 v1, v1, 0x2

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v3

    aput-object v3, v10, v1

    :cond_2c
    :goto_1a
    move/from16 v1, v31

    .line 60
    :goto_1b
    invoke-virtual {v9, v2}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v2

    long-to-int v2, v2

    and-int/lit16 v3, v4, 0x1000

    if-eqz v3, :cond_30

    const/16 v3, 0x11

    if-gt v5, v3, :cond_30

    add-int/lit8 v3, v7, 0x1

    .line 61
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const v15, 0xd800

    if-lt v7, v15, :cond_2e

    and-int/lit16 v7, v7, 0x1fff

    const/16 v23, 0xd

    :goto_1c
    add-int/lit8 v28, v3, 0x1

    .line 62
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-lt v3, v15, :cond_2d

    and-int/lit16 v3, v3, 0x1fff

    shl-int v3, v3, v23

    or-int/2addr v7, v3

    add-int/lit8 v23, v23, 0xd

    move/from16 v3, v28

    goto :goto_1c

    :cond_2d
    shl-int v3, v3, v23

    or-int/2addr v7, v3

    goto :goto_1d

    :cond_2e
    move/from16 v28, v3

    :goto_1d
    mul-int/lit8 v3, v6, 0x2

    .line 63
    div-int/lit8 v23, v7, 0x20

    add-int v3, v3, v23

    .line 64
    aget-object v15, v13, v3

    move-object/from16 v30, v0

    .line 65
    instance-of v0, v15, Ljava/lang/reflect/Field;

    if-eqz v0, :cond_2f

    .line 66
    check-cast v15, Ljava/lang/reflect/Field;

    :goto_1e
    move v3, v1

    goto :goto_1f

    .line 67
    :cond_2f
    check-cast v15, Ljava/lang/String;

    invoke-static {v14, v15}, Lcom/google/protobuf/W;->n0(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v15

    .line 68
    aput-object v15, v13, v3

    goto :goto_1e

    .line 69
    :goto_1f
    invoke-virtual {v9, v15}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v0

    long-to-int v0, v0

    .line 70
    rem-int/lit8 v7, v7, 0x20

    :goto_20
    move v1, v0

    goto :goto_21

    :cond_30
    move-object/from16 v30, v0

    move v3, v1

    const v0, 0xfffff

    move/from16 v28, v7

    const/4 v7, 0x0

    goto :goto_20

    :goto_21
    const/16 v0, 0x12

    if-lt v5, v0, :cond_31

    const/16 v0, 0x31

    if-gt v5, v0, :cond_31

    add-int/lit8 v0, v22, 0x1

    .line 71
    aput v2, v16, v22

    move/from16 v22, v0

    :cond_31
    move v0, v1

    move v1, v2

    move v15, v3

    move/from16 v3, v28

    :goto_22
    add-int/lit8 v2, v20, 0x1

    .line 72
    aput v27, v29, v20

    add-int/lit8 v27, v20, 0x2

    move/from16 v28, v0

    and-int/lit16 v0, v4, 0x200

    if-eqz v0, :cond_32

    const/high16 v0, 0x20000000

    goto :goto_23

    :cond_32
    const/4 v0, 0x0

    :goto_23
    move/from16 v31, v0

    and-int/lit16 v0, v4, 0x100

    if-eqz v0, :cond_33

    const/high16 v0, 0x10000000

    goto :goto_24

    :cond_33
    const/4 v0, 0x0

    :goto_24
    or-int v0, v31, v0

    and-int/lit16 v4, v4, 0x800

    if-eqz v4, :cond_34

    const/high16 v4, -0x80000000

    goto :goto_25

    :cond_34
    const/4 v4, 0x0

    :goto_25
    or-int/2addr v0, v4

    shl-int/lit8 v4, v5, 0x14

    or-int/2addr v0, v4

    or-int/2addr v0, v1

    .line 73
    aput v0, v29, v2

    add-int/lit8 v20, v20, 0x3

    shl-int/lit8 v0, v7, 0x14

    or-int v0, v0, v28

    .line 74
    aput v0, v29, v27

    move/from16 v1, v26

    move-object/from16 v2, v29

    move-object/from16 v0, v30

    const v5, 0xd800

    goto/16 :goto_b

    :cond_35
    move-object/from16 v29, v2

    .line 75
    new-instance v0, Lcom/google/protobuf/W;

    .line 76
    invoke-virtual/range {p0 .. p0}, Lcom/google/protobuf/h0;->b()Lcom/google/protobuf/T;

    move-result-object v13

    .line 77
    invoke-virtual/range {p0 .. p0}, Lcom/google/protobuf/h0;->c()Lcom/google/protobuf/e0;

    move-result-object v14

    const/4 v15, 0x0

    move-object/from16 v19, p1

    move-object/from16 v20, p2

    move-object/from16 v21, p3

    move-object/from16 v22, p4

    move-object/from16 v23, p5

    move/from16 v18, v8

    move-object/from16 v9, v29

    move-object v8, v0

    invoke-direct/range {v8 .. v23}, Lcom/google/protobuf/W;-><init>([I[Ljava/lang/Object;IILcom/google/protobuf/T;Lcom/google/protobuf/e0;Z[IIILcom/google/protobuf/Y;Lcom/google/protobuf/I;Lcom/google/protobuf/q0;Lcom/google/protobuf/q;Lcom/google/protobuf/N;)V

    return-object v8
.end method

.method private V(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/W;->a:[I

    .line 2
    .line 3
    aget p0, p0, p1

    .line 4
    .line 5
    return p0
.end method

.method private static W(I)J
    .locals 2

    .line 1
    const v0, 0xfffff

    .line 2
    .line 3
    .line 4
    and-int/2addr p0, v0

    .line 5
    int-to-long v0, p0

    .line 6
    return-wide v0
.end method

.method private static X(Ljava/lang/Object;J)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)Z"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private static Y(Ljava/lang/Object;J)D
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)D"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Double;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method private static Z(Ljava/lang/Object;J)F
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)F"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private static a0(Ljava/lang/Object;J)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)I"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private static b0(Ljava/lang/Object;J)J
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)J"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Long;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method private c0(Ljava/lang/Object;[BIIIJLcom/google/protobuf/e$b;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(TT;[BIIIJ",
            "Lcom/google/protobuf/e$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    sget-object v0, Lcom/google/protobuf/W;->s:Lsun/misc/Unsafe;

    .line 2
    .line 3
    invoke-direct {p0, p5}, Lcom/google/protobuf/W;->u(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p5

    .line 7
    invoke-virtual {v0, p1, p6, p7}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 12
    .line 13
    invoke-interface {v2, v1}, Lcom/google/protobuf/N;->h(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    iget-object v2, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 20
    .line 21
    invoke-interface {v2, p5}, Lcom/google/protobuf/N;->d(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v3, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 26
    .line 27
    invoke-interface {v3, v2, v1}, Lcom/google/protobuf/N;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p1, p6, p7, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    move-object v1, v2

    .line 34
    :cond_0
    iget-object p1, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 35
    .line 36
    invoke-interface {p1, p5}, Lcom/google/protobuf/N;->b(Ljava/lang/Object;)Lcom/google/protobuf/L$a;

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 40
    .line 41
    invoke-interface {p1, v1}, Lcom/google/protobuf/N;->c(Ljava/lang/Object;)Ljava/util/Map;

    .line 42
    .line 43
    .line 44
    move-result-object p7

    .line 45
    const/4 p6, 0x0

    .line 46
    move p5, p4

    .line 47
    move p4, p3

    .line 48
    move-object p3, p2

    .line 49
    move-object p2, p0

    .line 50
    invoke-direct/range {p2 .. p8}, Lcom/google/protobuf/W;->n([BIILcom/google/protobuf/L$a;Ljava/util/Map;Lcom/google/protobuf/e$b;)I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    return p0
.end method

.method private e0(Ljava/lang/Object;[BIIIIIIIJILcom/google/protobuf/e$b;)I
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[BIIIIIIIJI",
            "Lcom/google/protobuf/e$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move/from16 v8, p6

    .line 2
    .line 3
    move/from16 v2, p7

    .line 4
    .line 5
    move-wide/from16 v3, p10

    .line 6
    .line 7
    move/from16 v9, p12

    .line 8
    .line 9
    sget-object v5, Lcom/google/protobuf/W;->s:Lsun/misc/Unsafe;

    .line 10
    .line 11
    iget-object v6, p0, Lcom/google/protobuf/W;->a:[I

    .line 12
    .line 13
    add-int/lit8 v7, v9, 0x2

    .line 14
    .line 15
    aget v6, v6, v7

    .line 16
    .line 17
    const v7, 0xfffff

    .line 18
    .line 19
    .line 20
    and-int/2addr v6, v7

    .line 21
    int-to-long v6, v6

    .line 22
    const/4 v10, 0x5

    .line 23
    const/4 v11, 0x1

    .line 24
    const/4 v12, 0x2

    .line 25
    packed-switch p9, :pswitch_data_0

    .line 26
    .line 27
    .line 28
    :cond_0
    move/from16 v1, p3

    .line 29
    .line 30
    goto/16 :goto_4

    .line 31
    .line 32
    :pswitch_0
    const/4 v3, 0x3

    .line 33
    if-ne v2, v3, :cond_0

    .line 34
    .line 35
    move/from16 v10, p5

    .line 36
    .line 37
    invoke-direct {p0, p1, v8, v9}, Lcom/google/protobuf/W;->R(Ljava/lang/Object;II)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    and-int/lit8 v2, v10, -0x8

    .line 42
    .line 43
    or-int/lit8 v6, v2, 0x4

    .line 44
    .line 45
    invoke-direct {p0, v9}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    move-object/from16 v3, p2

    .line 50
    .line 51
    move/from16 v4, p3

    .line 52
    .line 53
    move/from16 v5, p4

    .line 54
    .line 55
    move-object/from16 v7, p13

    .line 56
    .line 57
    invoke-static/range {v1 .. v7}, Lcom/google/protobuf/e;->N(Ljava/lang/Object;Lcom/google/protobuf/j0;[BIIILcom/google/protobuf/e$b;)I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    invoke-direct {p0, p1, v8, v9, v1}, Lcom/google/protobuf/W;->s0(Ljava/lang/Object;IILjava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    return v2

    .line 65
    :pswitch_1
    move-object/from16 v11, p2

    .line 66
    .line 67
    move/from16 v1, p3

    .line 68
    .line 69
    move-object/from16 v13, p13

    .line 70
    .line 71
    if-nez v2, :cond_7

    .line 72
    .line 73
    invoke-static {v11, v1, v13}, Lcom/google/protobuf/e;->L([BILcom/google/protobuf/e$b;)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    iget-wide v1, v13, Lcom/google/protobuf/e$b;->b:J

    .line 78
    .line 79
    invoke-static {v1, v2}, Lcom/google/protobuf/i;->c(J)J

    .line 80
    .line 81
    .line 82
    move-result-wide v1

    .line 83
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v5, p1, v3, v4, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v5, p1, v6, v7, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 91
    .line 92
    .line 93
    return p0

    .line 94
    :pswitch_2
    move-object/from16 v11, p2

    .line 95
    .line 96
    move/from16 v1, p3

    .line 97
    .line 98
    move-object/from16 v13, p13

    .line 99
    .line 100
    if-nez v2, :cond_7

    .line 101
    .line 102
    invoke-static {v11, v1, v13}, Lcom/google/protobuf/e;->I([BILcom/google/protobuf/e$b;)I

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    iget v1, v13, Lcom/google/protobuf/e$b;->a:I

    .line 107
    .line 108
    invoke-static {v1}, Lcom/google/protobuf/i;->b(I)I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v5, p1, v3, v4, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v5, p1, v6, v7, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 120
    .line 121
    .line 122
    return p0

    .line 123
    :pswitch_3
    move-object/from16 v11, p2

    .line 124
    .line 125
    move/from16 v1, p3

    .line 126
    .line 127
    move/from16 v10, p5

    .line 128
    .line 129
    move-object/from16 v13, p13

    .line 130
    .line 131
    if-nez v2, :cond_7

    .line 132
    .line 133
    invoke-static {v11, v1, v13}, Lcom/google/protobuf/e;->I([BILcom/google/protobuf/e$b;)I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    iget v2, v13, Lcom/google/protobuf/e$b;->a:I

    .line 138
    .line 139
    invoke-direct {p0, v9}, Lcom/google/protobuf/W;->t(I)Lcom/google/protobuf/A$e;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    if-eqz p0, :cond_2

    .line 144
    .line 145
    invoke-interface {p0, v2}, Lcom/google/protobuf/A$e;->isInRange(I)Z

    .line 146
    .line 147
    .line 148
    move-result p0

    .line 149
    if-eqz p0, :cond_1

    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_1
    invoke-static {p1}, Lcom/google/protobuf/W;->w(Ljava/lang/Object;)Lcom/google/protobuf/r0;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    int-to-long v2, v2

    .line 157
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {p0, v10, v0}, Lcom/google/protobuf/r0;->r(ILjava/lang/Object;)V

    .line 162
    .line 163
    .line 164
    return v1

    .line 165
    :cond_2
    :goto_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-virtual {v5, p1, v3, v4, p0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v5, p1, v6, v7, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 173
    .line 174
    .line 175
    return v1

    .line 176
    :pswitch_4
    move-object/from16 v11, p2

    .line 177
    .line 178
    move/from16 v1, p3

    .line 179
    .line 180
    move-object/from16 v13, p13

    .line 181
    .line 182
    if-ne v2, v12, :cond_7

    .line 183
    .line 184
    invoke-static {v11, v1, v13}, Lcom/google/protobuf/e;->b([BILcom/google/protobuf/e$b;)I

    .line 185
    .line 186
    .line 187
    move-result p0

    .line 188
    iget-object v1, v13, Lcom/google/protobuf/e$b;->c:Ljava/lang/Object;

    .line 189
    .line 190
    invoke-virtual {v5, p1, v3, v4, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v5, p1, v6, v7, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 194
    .line 195
    .line 196
    return p0

    .line 197
    :pswitch_5
    move-object/from16 v11, p2

    .line 198
    .line 199
    move/from16 v1, p3

    .line 200
    .line 201
    move-object/from16 v13, p13

    .line 202
    .line 203
    if-ne v2, v12, :cond_7

    .line 204
    .line 205
    invoke-direct {p0, p1, v8, v9}, Lcom/google/protobuf/W;->R(Ljava/lang/Object;II)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    invoke-direct {p0, v9}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    move/from16 v4, p3

    .line 214
    .line 215
    move/from16 v5, p4

    .line 216
    .line 217
    move-object v3, v11

    .line 218
    move-object v6, v13

    .line 219
    invoke-static/range {v1 .. v6}, Lcom/google/protobuf/e;->O(Ljava/lang/Object;Lcom/google/protobuf/j0;[BIILcom/google/protobuf/e$b;)I

    .line 220
    .line 221
    .line 222
    move-result v2

    .line 223
    invoke-direct {p0, p1, v8, v9, v1}, Lcom/google/protobuf/W;->s0(Ljava/lang/Object;IILjava/lang/Object;)V

    .line 224
    .line 225
    .line 226
    return v2

    .line 227
    :pswitch_6
    move-object/from16 p0, p2

    .line 228
    .line 229
    move/from16 v1, p3

    .line 230
    .line 231
    move-object/from16 v13, p13

    .line 232
    .line 233
    if-ne v2, v12, :cond_7

    .line 234
    .line 235
    invoke-static {p0, v1, v13}, Lcom/google/protobuf/e;->I([BILcom/google/protobuf/e$b;)I

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    iget v2, v13, Lcom/google/protobuf/e$b;->a:I

    .line 240
    .line 241
    if-nez v2, :cond_3

    .line 242
    .line 243
    const-string p0, ""

    .line 244
    .line 245
    invoke-virtual {v5, p1, v3, v4, p0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 246
    .line 247
    .line 248
    goto :goto_2

    .line 249
    :cond_3
    const/high16 v9, 0x20000000

    .line 250
    .line 251
    and-int v9, p8, v9

    .line 252
    .line 253
    if-eqz v9, :cond_5

    .line 254
    .line 255
    add-int v9, v1, v2

    .line 256
    .line 257
    invoke-static {p0, v1, v9}, Lcom/google/protobuf/v0;->t([BII)Z

    .line 258
    .line 259
    .line 260
    move-result v9

    .line 261
    if-eqz v9, :cond_4

    .line 262
    .line 263
    goto :goto_1

    .line 264
    :cond_4
    invoke-static {}, Lcom/google/protobuf/B;->d()Lcom/google/protobuf/B;

    .line 265
    .line 266
    .line 267
    move-result-object p0

    .line 268
    throw p0

    .line 269
    :cond_5
    :goto_1
    new-instance v9, Ljava/lang/String;

    .line 270
    .line 271
    sget-object v10, Lcom/google/protobuf/A;->b:Ljava/nio/charset/Charset;

    .line 272
    .line 273
    invoke-direct {v9, p0, v1, v2, v10}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {v5, p1, v3, v4, v9}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 277
    .line 278
    .line 279
    add-int/2addr v1, v2

    .line 280
    :goto_2
    invoke-virtual {v5, p1, v6, v7, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 281
    .line 282
    .line 283
    return v1

    .line 284
    :pswitch_7
    move-object/from16 p0, p2

    .line 285
    .line 286
    move/from16 v1, p3

    .line 287
    .line 288
    move-object/from16 v13, p13

    .line 289
    .line 290
    if-nez v2, :cond_7

    .line 291
    .line 292
    invoke-static {p0, v1, v13}, Lcom/google/protobuf/e;->L([BILcom/google/protobuf/e$b;)I

    .line 293
    .line 294
    .line 295
    move-result p0

    .line 296
    iget-wide v1, v13, Lcom/google/protobuf/e$b;->b:J

    .line 297
    .line 298
    const-wide/16 v9, 0x0

    .line 299
    .line 300
    cmp-long v1, v1, v9

    .line 301
    .line 302
    if-eqz v1, :cond_6

    .line 303
    .line 304
    goto :goto_3

    .line 305
    :cond_6
    const/4 v11, 0x0

    .line 306
    :goto_3
    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 307
    .line 308
    .line 309
    move-result-object v1

    .line 310
    invoke-virtual {v5, p1, v3, v4, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {v5, p1, v6, v7, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 314
    .line 315
    .line 316
    return p0

    .line 317
    :pswitch_8
    move-object/from16 p0, p2

    .line 318
    .line 319
    move/from16 v1, p3

    .line 320
    .line 321
    if-ne v2, v10, :cond_7

    .line 322
    .line 323
    invoke-static/range {p2 .. p3}, Lcom/google/protobuf/e;->h([BI)I

    .line 324
    .line 325
    .line 326
    move-result p0

    .line 327
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 328
    .line 329
    .line 330
    move-result-object p0

    .line 331
    invoke-virtual {v5, p1, v3, v4, p0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 332
    .line 333
    .line 334
    add-int/lit8 p0, v1, 0x4

    .line 335
    .line 336
    invoke-virtual {v5, p1, v6, v7, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 337
    .line 338
    .line 339
    return p0

    .line 340
    :pswitch_9
    move-object/from16 p0, p2

    .line 341
    .line 342
    move/from16 v1, p3

    .line 343
    .line 344
    if-ne v2, v11, :cond_7

    .line 345
    .line 346
    invoke-static/range {p2 .. p3}, Lcom/google/protobuf/e;->j([BI)J

    .line 347
    .line 348
    .line 349
    move-result-wide v9

    .line 350
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 351
    .line 352
    .line 353
    move-result-object p0

    .line 354
    invoke-virtual {v5, p1, v3, v4, p0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 355
    .line 356
    .line 357
    add-int/lit8 p0, v1, 0x8

    .line 358
    .line 359
    invoke-virtual {v5, p1, v6, v7, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 360
    .line 361
    .line 362
    return p0

    .line 363
    :pswitch_a
    move-object/from16 p0, p2

    .line 364
    .line 365
    move/from16 v1, p3

    .line 366
    .line 367
    move-object/from16 v13, p13

    .line 368
    .line 369
    if-nez v2, :cond_7

    .line 370
    .line 371
    invoke-static {p0, v1, v13}, Lcom/google/protobuf/e;->I([BILcom/google/protobuf/e$b;)I

    .line 372
    .line 373
    .line 374
    move-result p0

    .line 375
    iget v1, v13, Lcom/google/protobuf/e$b;->a:I

    .line 376
    .line 377
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 378
    .line 379
    .line 380
    move-result-object v1

    .line 381
    invoke-virtual {v5, p1, v3, v4, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 382
    .line 383
    .line 384
    invoke-virtual {v5, p1, v6, v7, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 385
    .line 386
    .line 387
    return p0

    .line 388
    :pswitch_b
    move-object/from16 p0, p2

    .line 389
    .line 390
    move/from16 v1, p3

    .line 391
    .line 392
    move-object/from16 v13, p13

    .line 393
    .line 394
    if-nez v2, :cond_7

    .line 395
    .line 396
    invoke-static {p0, v1, v13}, Lcom/google/protobuf/e;->L([BILcom/google/protobuf/e$b;)I

    .line 397
    .line 398
    .line 399
    move-result p0

    .line 400
    iget-wide v1, v13, Lcom/google/protobuf/e$b;->b:J

    .line 401
    .line 402
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 403
    .line 404
    .line 405
    move-result-object v1

    .line 406
    invoke-virtual {v5, p1, v3, v4, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 407
    .line 408
    .line 409
    invoke-virtual {v5, p1, v6, v7, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 410
    .line 411
    .line 412
    return p0

    .line 413
    :pswitch_c
    move-object/from16 p0, p2

    .line 414
    .line 415
    move/from16 v1, p3

    .line 416
    .line 417
    if-ne v2, v10, :cond_7

    .line 418
    .line 419
    invoke-static/range {p2 .. p3}, Lcom/google/protobuf/e;->l([BI)F

    .line 420
    .line 421
    .line 422
    move-result p0

    .line 423
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 424
    .line 425
    .line 426
    move-result-object p0

    .line 427
    invoke-virtual {v5, p1, v3, v4, p0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 428
    .line 429
    .line 430
    add-int/lit8 p0, v1, 0x4

    .line 431
    .line 432
    invoke-virtual {v5, p1, v6, v7, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 433
    .line 434
    .line 435
    return p0

    .line 436
    :pswitch_d
    move-object/from16 p0, p2

    .line 437
    .line 438
    move/from16 v1, p3

    .line 439
    .line 440
    if-ne v2, v11, :cond_7

    .line 441
    .line 442
    invoke-static/range {p2 .. p3}, Lcom/google/protobuf/e;->d([BI)D

    .line 443
    .line 444
    .line 445
    move-result-wide v9

    .line 446
    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 447
    .line 448
    .line 449
    move-result-object p0

    .line 450
    invoke-virtual {v5, p1, v3, v4, p0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 451
    .line 452
    .line 453
    add-int/lit8 p0, v1, 0x8

    .line 454
    .line 455
    invoke-virtual {v5, p1, v6, v7, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 456
    .line 457
    .line 458
    return p0

    .line 459
    :cond_7
    :goto_4
    return v1

    .line 460
    nop

    :pswitch_data_0
    .packed-switch 0x33
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_a
        :pswitch_3
        :pswitch_8
        :pswitch_9
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private f0(Ljava/lang/Object;[BIIIIIIJIJLcom/google/protobuf/e$b;)I
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[BIIIIIIJIJ",
            "Lcom/google/protobuf/e$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move/from16 v1, p8

    .line 2
    .line 3
    move-wide/from16 v2, p12

    .line 4
    .line 5
    sget-object v4, Lcom/google/protobuf/W;->s:Lsun/misc/Unsafe;

    .line 6
    .line 7
    invoke-virtual {v4, p1, v2, v3}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v5

    .line 11
    check-cast v5, Lcom/google/protobuf/A$j;

    .line 12
    .line 13
    invoke-interface {v5}, Lcom/google/protobuf/A$j;->h()Z

    .line 14
    .line 15
    .line 16
    move-result v6

    .line 17
    const/4 v7, 0x2

    .line 18
    if-nez v6, :cond_1

    .line 19
    .line 20
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v6

    .line 24
    if-nez v6, :cond_0

    .line 25
    .line 26
    const/16 v6, 0xa

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    mul-int/2addr v6, v7

    .line 30
    :goto_0
    invoke-interface {v5, v6}, Lcom/google/protobuf/A$j;->a(I)Lcom/google/protobuf/A$j;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    invoke-virtual {v4, p1, v2, v3, v5}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    move-object v6, v5

    .line 38
    const/4 v2, 0x1

    .line 39
    const/4 v3, 0x5

    .line 40
    packed-switch p11, :pswitch_data_0

    .line 41
    .line 42
    .line 43
    goto/16 :goto_2

    .line 44
    .line 45
    :pswitch_0
    const/4 p1, 0x3

    .line 46
    if-ne p7, p1, :cond_d

    .line 47
    .line 48
    invoke-direct {p0, v1}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    move-object p6, p0

    .line 53
    move-object/from16 p8, p2

    .line 54
    .line 55
    move/from16 p9, p3

    .line 56
    .line 57
    move/from16 p10, p4

    .line 58
    .line 59
    move p7, p5

    .line 60
    move-object/from16 p12, p14

    .line 61
    .line 62
    move-object/from16 p11, v6

    .line 63
    .line 64
    invoke-static/range {p6 .. p12}, Lcom/google/protobuf/e;->o(Lcom/google/protobuf/j0;I[BIILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    return p0

    .line 69
    :pswitch_1
    move-object/from16 p0, p14

    .line 70
    .line 71
    if-ne p7, v7, :cond_2

    .line 72
    .line 73
    invoke-static {p2, p3, v6, p0}, Lcom/google/protobuf/e;->x([BILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    return p0

    .line 78
    :cond_2
    if-nez p7, :cond_d

    .line 79
    .line 80
    move-object/from16 p11, p0

    .line 81
    .line 82
    move-object p7, p2

    .line 83
    move/from16 p8, p3

    .line 84
    .line 85
    move/from16 p9, p4

    .line 86
    .line 87
    move p6, p5

    .line 88
    move-object/from16 p10, v6

    .line 89
    .line 90
    invoke-static/range {p6 .. p11}, Lcom/google/protobuf/e;->B(I[BIILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    return p0

    .line 95
    :pswitch_2
    move-object/from16 p0, p14

    .line 96
    .line 97
    if-ne p7, v7, :cond_3

    .line 98
    .line 99
    invoke-static {p2, p3, v6, p0}, Lcom/google/protobuf/e;->w([BILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    return p0

    .line 104
    :cond_3
    if-nez p7, :cond_d

    .line 105
    .line 106
    move-object/from16 p11, p0

    .line 107
    .line 108
    move-object p7, p2

    .line 109
    move/from16 p8, p3

    .line 110
    .line 111
    move/from16 p9, p4

    .line 112
    .line 113
    move p6, p5

    .line 114
    move-object/from16 p10, v6

    .line 115
    .line 116
    invoke-static/range {p6 .. p11}, Lcom/google/protobuf/e;->A(I[BIILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    return p0

    .line 121
    :pswitch_3
    move-object/from16 v2, p14

    .line 122
    .line 123
    if-ne p7, v7, :cond_4

    .line 124
    .line 125
    invoke-static {p2, p3, v6, v2}, Lcom/google/protobuf/e;->y([BILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    goto :goto_1

    .line 130
    :cond_4
    if-nez p7, :cond_d

    .line 131
    .line 132
    move-object v3, p2

    .line 133
    move v4, p3

    .line 134
    move v5, p4

    .line 135
    move-object v7, v2

    .line 136
    move v2, p5

    .line 137
    invoke-static/range {v2 .. v7}, Lcom/google/protobuf/e;->J(I[BIILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 138
    .line 139
    .line 140
    move-result p2

    .line 141
    :goto_1
    invoke-direct {p0, v1}, Lcom/google/protobuf/W;->t(I)Lcom/google/protobuf/A$e;

    .line 142
    .line 143
    .line 144
    move-result-object p3

    .line 145
    const/4 p4, 0x0

    .line 146
    iget-object p0, p0, Lcom/google/protobuf/W;->o:Lcom/google/protobuf/q0;

    .line 147
    .line 148
    move-object/from16 p12, p0

    .line 149
    .line 150
    move-object p7, p1

    .line 151
    move-object/from16 p10, p3

    .line 152
    .line 153
    move-object/from16 p11, p4

    .line 154
    .line 155
    move/from16 p8, p6

    .line 156
    .line 157
    move-object/from16 p9, v6

    .line 158
    .line 159
    invoke-static/range {p7 .. p12}, Lcom/google/protobuf/l0;->A(Ljava/lang/Object;ILjava/util/List;Lcom/google/protobuf/A$e;Ljava/lang/Object;Lcom/google/protobuf/q0;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    return p2

    .line 163
    :pswitch_4
    if-ne p7, v7, :cond_d

    .line 164
    .line 165
    move-object p7, p2

    .line 166
    move/from16 p8, p3

    .line 167
    .line 168
    move/from16 p9, p4

    .line 169
    .line 170
    move p6, p5

    .line 171
    move-object/from16 p11, p14

    .line 172
    .line 173
    move-object/from16 p10, v6

    .line 174
    .line 175
    invoke-static/range {p6 .. p11}, Lcom/google/protobuf/e;->c(I[BIILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 176
    .line 177
    .line 178
    move-result p0

    .line 179
    return p0

    .line 180
    :pswitch_5
    if-ne p7, v7, :cond_d

    .line 181
    .line 182
    invoke-direct {p0, v1}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    move-object p6, p0

    .line 187
    move-object/from16 p8, p2

    .line 188
    .line 189
    move/from16 p9, p3

    .line 190
    .line 191
    move/from16 p10, p4

    .line 192
    .line 193
    move p7, p5

    .line 194
    move-object/from16 p12, p14

    .line 195
    .line 196
    move-object/from16 p11, v6

    .line 197
    .line 198
    invoke-static/range {p6 .. p12}, Lcom/google/protobuf/e;->q(Lcom/google/protobuf/j0;I[BIILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 199
    .line 200
    .line 201
    move-result p0

    .line 202
    return p0

    .line 203
    :pswitch_6
    if-ne p7, v7, :cond_d

    .line 204
    .line 205
    const-wide/32 p0, 0x20000000

    .line 206
    .line 207
    .line 208
    and-long p0, p9, p0

    .line 209
    .line 210
    const-wide/16 v0, 0x0

    .line 211
    .line 212
    cmp-long p0, p0, v0

    .line 213
    .line 214
    if-nez p0, :cond_5

    .line 215
    .line 216
    move-object p7, p2

    .line 217
    move/from16 p8, p3

    .line 218
    .line 219
    move/from16 p9, p4

    .line 220
    .line 221
    move p6, p5

    .line 222
    move-object/from16 p11, p14

    .line 223
    .line 224
    move-object/from16 p10, v6

    .line 225
    .line 226
    invoke-static/range {p6 .. p11}, Lcom/google/protobuf/e;->D(I[BIILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 227
    .line 228
    .line 229
    move-result p0

    .line 230
    return p0

    .line 231
    :cond_5
    move-object p7, p2

    .line 232
    move/from16 p8, p3

    .line 233
    .line 234
    move/from16 p9, p4

    .line 235
    .line 236
    move p6, p5

    .line 237
    move-object/from16 p11, p14

    .line 238
    .line 239
    move-object/from16 p10, v6

    .line 240
    .line 241
    invoke-static/range {p6 .. p11}, Lcom/google/protobuf/e;->E(I[BIILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 242
    .line 243
    .line 244
    move-result p0

    .line 245
    return p0

    .line 246
    :pswitch_7
    move-object/from16 p0, p14

    .line 247
    .line 248
    if-ne p7, v7, :cond_6

    .line 249
    .line 250
    invoke-static {p2, p3, v6, p0}, Lcom/google/protobuf/e;->r([BILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 251
    .line 252
    .line 253
    move-result p0

    .line 254
    return p0

    .line 255
    :cond_6
    if-nez p7, :cond_d

    .line 256
    .line 257
    move-object/from16 p11, p0

    .line 258
    .line 259
    move-object p7, p2

    .line 260
    move/from16 p8, p3

    .line 261
    .line 262
    move/from16 p9, p4

    .line 263
    .line 264
    move p6, p5

    .line 265
    move-object/from16 p10, v6

    .line 266
    .line 267
    invoke-static/range {p6 .. p11}, Lcom/google/protobuf/e;->a(I[BIILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 268
    .line 269
    .line 270
    move-result p0

    .line 271
    return p0

    .line 272
    :pswitch_8
    move-object/from16 v2, p14

    .line 273
    .line 274
    if-ne p7, v7, :cond_7

    .line 275
    .line 276
    invoke-static {p2, p3, v6, v2}, Lcom/google/protobuf/e;->t([BILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 277
    .line 278
    .line 279
    move-result p0

    .line 280
    return p0

    .line 281
    :cond_7
    if-ne p7, v3, :cond_d

    .line 282
    .line 283
    move-object p7, p2

    .line 284
    move/from16 p8, p3

    .line 285
    .line 286
    move/from16 p9, p4

    .line 287
    .line 288
    move p6, p5

    .line 289
    move-object/from16 p11, v2

    .line 290
    .line 291
    move-object/from16 p10, v6

    .line 292
    .line 293
    invoke-static/range {p6 .. p11}, Lcom/google/protobuf/e;->i(I[BIILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 294
    .line 295
    .line 296
    move-result p0

    .line 297
    return p0

    .line 298
    :pswitch_9
    move-object/from16 p0, p14

    .line 299
    .line 300
    if-ne p7, v7, :cond_8

    .line 301
    .line 302
    invoke-static {p2, p3, v6, p0}, Lcom/google/protobuf/e;->u([BILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 303
    .line 304
    .line 305
    move-result p0

    .line 306
    return p0

    .line 307
    :cond_8
    if-ne p7, v2, :cond_d

    .line 308
    .line 309
    move-object/from16 p11, p0

    .line 310
    .line 311
    move-object p7, p2

    .line 312
    move/from16 p8, p3

    .line 313
    .line 314
    move/from16 p9, p4

    .line 315
    .line 316
    move p6, p5

    .line 317
    move-object/from16 p10, v6

    .line 318
    .line 319
    invoke-static/range {p6 .. p11}, Lcom/google/protobuf/e;->k(I[BIILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 320
    .line 321
    .line 322
    move-result p0

    .line 323
    return p0

    .line 324
    :pswitch_a
    move-object/from16 p0, p14

    .line 325
    .line 326
    if-ne p7, v7, :cond_9

    .line 327
    .line 328
    invoke-static {p2, p3, v6, p0}, Lcom/google/protobuf/e;->y([BILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 329
    .line 330
    .line 331
    move-result p0

    .line 332
    return p0

    .line 333
    :cond_9
    if-nez p7, :cond_d

    .line 334
    .line 335
    move-object/from16 p11, p0

    .line 336
    .line 337
    move-object p7, p2

    .line 338
    move/from16 p8, p3

    .line 339
    .line 340
    move/from16 p9, p4

    .line 341
    .line 342
    move p6, p5

    .line 343
    move-object/from16 p10, v6

    .line 344
    .line 345
    invoke-static/range {p6 .. p11}, Lcom/google/protobuf/e;->J(I[BIILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 346
    .line 347
    .line 348
    move-result p0

    .line 349
    return p0

    .line 350
    :pswitch_b
    move-object/from16 p0, p14

    .line 351
    .line 352
    if-ne p7, v7, :cond_a

    .line 353
    .line 354
    invoke-static {p2, p3, v6, p0}, Lcom/google/protobuf/e;->z([BILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 355
    .line 356
    .line 357
    move-result p0

    .line 358
    return p0

    .line 359
    :cond_a
    if-nez p7, :cond_d

    .line 360
    .line 361
    move-object/from16 p11, p0

    .line 362
    .line 363
    move-object p7, p2

    .line 364
    move/from16 p8, p3

    .line 365
    .line 366
    move/from16 p9, p4

    .line 367
    .line 368
    move p6, p5

    .line 369
    move-object/from16 p10, v6

    .line 370
    .line 371
    invoke-static/range {p6 .. p11}, Lcom/google/protobuf/e;->M(I[BIILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 372
    .line 373
    .line 374
    move-result p0

    .line 375
    return p0

    .line 376
    :pswitch_c
    move-object/from16 v2, p14

    .line 377
    .line 378
    if-ne p7, v7, :cond_b

    .line 379
    .line 380
    invoke-static {p2, p3, v6, v2}, Lcom/google/protobuf/e;->v([BILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 381
    .line 382
    .line 383
    move-result p0

    .line 384
    return p0

    .line 385
    :cond_b
    if-ne p7, v3, :cond_d

    .line 386
    .line 387
    move-object p7, p2

    .line 388
    move/from16 p8, p3

    .line 389
    .line 390
    move/from16 p9, p4

    .line 391
    .line 392
    move p6, p5

    .line 393
    move-object/from16 p11, v2

    .line 394
    .line 395
    move-object/from16 p10, v6

    .line 396
    .line 397
    invoke-static/range {p6 .. p11}, Lcom/google/protobuf/e;->m(I[BIILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 398
    .line 399
    .line 400
    move-result p0

    .line 401
    return p0

    .line 402
    :pswitch_d
    move-object/from16 p0, p14

    .line 403
    .line 404
    if-ne p7, v7, :cond_c

    .line 405
    .line 406
    invoke-static {p2, p3, v6, p0}, Lcom/google/protobuf/e;->s([BILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 407
    .line 408
    .line 409
    move-result p0

    .line 410
    return p0

    .line 411
    :cond_c
    if-ne p7, v2, :cond_d

    .line 412
    .line 413
    move-object/from16 p11, p0

    .line 414
    .line 415
    move-object p7, p2

    .line 416
    move/from16 p8, p3

    .line 417
    .line 418
    move/from16 p9, p4

    .line 419
    .line 420
    move p6, p5

    .line 421
    move-object/from16 p10, v6

    .line 422
    .line 423
    invoke-static/range {p6 .. p11}, Lcom/google/protobuf/e;->e(I[BIILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    .line 424
    .line 425
    .line 426
    move-result p0

    .line 427
    return p0

    .line 428
    :cond_d
    :goto_2
    return p3

    .line 429
    :pswitch_data_0
    .packed-switch 0x12
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_a
        :pswitch_3
        :pswitch_8
        :pswitch_9
        :pswitch_2
        :pswitch_1
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_a
        :pswitch_3
        :pswitch_8
        :pswitch_9
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private g0(I)I
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/protobuf/W;->c:I

    .line 2
    .line 3
    if-lt p1, v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/google/protobuf/W;->d:I

    .line 6
    .line 7
    if-gt p1, v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-direct {p0, p1, v0}, Lcom/google/protobuf/W;->q0(II)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, -0x1

    .line 16
    return p0
.end method

.method private h0(II)I
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/protobuf/W;->c:I

    .line 2
    .line 3
    if-lt p1, v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/google/protobuf/W;->d:I

    .line 6
    .line 7
    if-gt p1, v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1, p2}, Lcom/google/protobuf/W;->q0(II)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, -0x1

    .line 15
    return p0
.end method

.method private i0(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/W;->a:[I

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x2

    .line 4
    .line 5
    aget p0, p0, p1

    .line 6
    .line 7
    return p0
.end method

.method private j0(Ljava/lang/Object;JLcom/google/protobuf/i0;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "J",
            "Lcom/google/protobuf/i0;",
            "Lcom/google/protobuf/j0<",
            "TE;>;",
            "Lcom/google/protobuf/p;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p4, p0, p5, p6}, Lcom/google/protobuf/i0;->d(Ljava/util/List;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private k(Ljava/lang/Object;Ljava/lang/Object;I)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;I)Z"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-direct {p0, p2, p3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ne p1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private k0(Ljava/lang/Object;ILcom/google/protobuf/i0;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "I",
            "Lcom/google/protobuf/i0;",
            "Lcom/google/protobuf/j0<",
            "TE;>;",
            "Lcom/google/protobuf/p;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-static {p2}, Lcom/google/protobuf/W;->W(I)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object p0, p0, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0, v1}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p3, p0, p4, p5}, Lcom/google/protobuf/i0;->f(Ljava/util/List;Lcom/google/protobuf/j0;Lcom/google/protobuf/p;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private static l(Ljava/lang/Object;J)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)Z"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/u0;->t(Ljava/lang/Object;J)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private l0(Ljava/lang/Object;ILcom/google/protobuf/i0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-static {p2}, Lcom/google/protobuf/W;->z(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Lcom/google/protobuf/W;->W(I)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    invoke-interface {p3}, Lcom/google/protobuf/i0;->O()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p1, v0, v1, p0}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-boolean p0, p0, Lcom/google/protobuf/W;->g:Z

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-static {p2}, Lcom/google/protobuf/W;->W(I)J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    invoke-interface {p3}, Lcom/google/protobuf/i0;->E()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p1, v0, v1, p0}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    invoke-static {p2}, Lcom/google/protobuf/W;->W(I)J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    invoke-interface {p3}, Lcom/google/protobuf/i0;->r()Lcom/google/protobuf/h;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p1, v0, v1, p0}, Lcom/google/protobuf/u0;->V(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private static m(Ljava/lang/Object;)V
    .locals 3

    .line 1
    invoke-static {p0}, Lcom/google/protobuf/W;->G(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 9
    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v2, "Mutating immutable message: "

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw v0
.end method

.method private m0(Ljava/lang/Object;ILcom/google/protobuf/i0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-static {p2}, Lcom/google/protobuf/W;->z(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/google/protobuf/W;->W(I)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-virtual {p0, p1, v0, v1}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p3, p0}, Lcom/google/protobuf/i0;->q(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p0, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 22
    .line 23
    invoke-static {p2}, Lcom/google/protobuf/W;->W(I)J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    invoke-virtual {p0, p1, v0, v1}, Lcom/google/protobuf/I;->e(Ljava/lang/Object;J)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {p3, p0}, Lcom/google/protobuf/i0;->G(Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private n([BIILcom/google/protobuf/L$a;Ljava/util/Map;Lcom/google/protobuf/e$b;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">([BII",
            "Lcom/google/protobuf/L$a<",
            "TK;TV;>;",
            "Ljava/util/Map<",
            "TK;TV;>;",
            "Lcom/google/protobuf/e$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-static {p1, p2, p6}, Lcom/google/protobuf/e;->I([BILcom/google/protobuf/e$b;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    iget p1, p6, Lcom/google/protobuf/e$b;->a:I

    .line 6
    .line 7
    if-ltz p1, :cond_1

    .line 8
    .line 9
    sub-int/2addr p3, p0

    .line 10
    if-le p1, p3, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    throw p0

    .line 15
    :cond_1
    :goto_0
    invoke-static {}, Lcom/google/protobuf/B;->m()Lcom/google/protobuf/B;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    throw p0
.end method

.method private static n0(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    array-length v1, v0

    .line 11
    const/4 v2, 0x0

    .line 12
    :goto_0
    if-ge v2, v1, :cond_1

    .line 13
    .line 14
    aget-object v3, v0, v2

    .line 15
    .line 16
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    return-object v3

    .line 27
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    new-instance v1, Ljava/lang/RuntimeException;

    .line 31
    .line 32
    new-instance v2, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    const-string v3, "Field "

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string p1, " for "

    .line 46
    .line 47
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string p0, " not found. Known fields are "

    .line 58
    .line 59
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-direct {v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    throw v1
.end method

.method private static o(Ljava/lang/Object;J)D
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)D"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/u0;->A(Ljava/lang/Object;J)D

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method private o0(Ljava/lang/Object;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2}, Lcom/google/protobuf/W;->i0(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const p2, 0xfffff

    .line 6
    .line 7
    .line 8
    and-int/2addr p2, p0

    .line 9
    int-to-long v0, p2

    .line 10
    const-wide/32 v2, 0xfffff

    .line 11
    .line 12
    .line 13
    cmp-long p2, v0, v2

    .line 14
    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    ushr-int/lit8 p0, p0, 0x14

    .line 19
    .line 20
    const/4 p2, 0x1

    .line 21
    shl-int p0, p2, p0

    .line 22
    .line 23
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    or-int/2addr p0, p2

    .line 28
    invoke-static {p1, v0, v1, p0}, Lcom/google/protobuf/u0;->T(Ljava/lang/Object;JI)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private p(Ljava/lang/Object;Ljava/lang/Object;I)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;I)Z"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p3}, Lcom/google/protobuf/W;->u0(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Lcom/google/protobuf/W;->W(I)J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-static {v0}, Lcom/google/protobuf/W;->t0(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v3, 0x0

    .line 14
    const/4 v4, 0x1

    .line 15
    packed-switch v0, :pswitch_data_0

    .line 16
    .line 17
    .line 18
    return v4

    .line 19
    :pswitch_0
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->H(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p0, p1}, Lcom/google/protobuf/l0;->I(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    return v4

    .line 40
    :cond_0
    return v3

    .line 41
    :pswitch_1
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p0, p1}, Lcom/google/protobuf/l0;->I(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0

    .line 54
    :pswitch_2
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-static {p0, p1}, Lcom/google/protobuf/l0;->I(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    return p0

    .line 67
    :pswitch_3
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_1

    .line 72
    .line 73
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {p0, p1}, Lcom/google/protobuf/l0;->I(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_1

    .line 86
    .line 87
    return v4

    .line 88
    :cond_1
    return v3

    .line 89
    :pswitch_4
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-eqz p0, :cond_2

    .line 94
    .line 95
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 96
    .line 97
    .line 98
    move-result-wide p0

    .line 99
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 100
    .line 101
    .line 102
    move-result-wide p2

    .line 103
    cmp-long p0, p0, p2

    .line 104
    .line 105
    if-nez p0, :cond_2

    .line 106
    .line 107
    return v4

    .line 108
    :cond_2
    return v3

    .line 109
    :pswitch_5
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_3

    .line 114
    .line 115
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    if-ne p0, p1, :cond_3

    .line 124
    .line 125
    return v4

    .line 126
    :cond_3
    return v3

    .line 127
    :pswitch_6
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    if-eqz p0, :cond_4

    .line 132
    .line 133
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 134
    .line 135
    .line 136
    move-result-wide p0

    .line 137
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 138
    .line 139
    .line 140
    move-result-wide p2

    .line 141
    cmp-long p0, p0, p2

    .line 142
    .line 143
    if-nez p0, :cond_4

    .line 144
    .line 145
    return v4

    .line 146
    :cond_4
    return v3

    .line 147
    :pswitch_7
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    if-eqz p0, :cond_5

    .line 152
    .line 153
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 154
    .line 155
    .line 156
    move-result p0

    .line 157
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    if-ne p0, p1, :cond_5

    .line 162
    .line 163
    return v4

    .line 164
    :cond_5
    return v3

    .line 165
    :pswitch_8
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    if-eqz p0, :cond_6

    .line 170
    .line 171
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 172
    .line 173
    .line 174
    move-result p0

    .line 175
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    if-ne p0, p1, :cond_6

    .line 180
    .line 181
    return v4

    .line 182
    :cond_6
    return v3

    .line 183
    :pswitch_9
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    if-eqz p0, :cond_7

    .line 188
    .line 189
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 194
    .line 195
    .line 196
    move-result p1

    .line 197
    if-ne p0, p1, :cond_7

    .line 198
    .line 199
    return v4

    .line 200
    :cond_7
    return v3

    .line 201
    :pswitch_a
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 202
    .line 203
    .line 204
    move-result p0

    .line 205
    if-eqz p0, :cond_8

    .line 206
    .line 207
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    invoke-static {p0, p1}, Lcom/google/protobuf/l0;->I(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result p0

    .line 219
    if-eqz p0, :cond_8

    .line 220
    .line 221
    return v4

    .line 222
    :cond_8
    return v3

    .line 223
    :pswitch_b
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 224
    .line 225
    .line 226
    move-result p0

    .line 227
    if-eqz p0, :cond_9

    .line 228
    .line 229
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    invoke-static {p0, p1}, Lcom/google/protobuf/l0;->I(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result p0

    .line 241
    if-eqz p0, :cond_9

    .line 242
    .line 243
    return v4

    .line 244
    :cond_9
    return v3

    .line 245
    :pswitch_c
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 246
    .line 247
    .line 248
    move-result p0

    .line 249
    if-eqz p0, :cond_a

    .line 250
    .line 251
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    invoke-static {p0, p1}, Lcom/google/protobuf/l0;->I(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 260
    .line 261
    .line 262
    move-result p0

    .line 263
    if-eqz p0, :cond_a

    .line 264
    .line 265
    return v4

    .line 266
    :cond_a
    return v3

    .line 267
    :pswitch_d
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 268
    .line 269
    .line 270
    move-result p0

    .line 271
    if-eqz p0, :cond_b

    .line 272
    .line 273
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->t(Ljava/lang/Object;J)Z

    .line 274
    .line 275
    .line 276
    move-result p0

    .line 277
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->t(Ljava/lang/Object;J)Z

    .line 278
    .line 279
    .line 280
    move-result p1

    .line 281
    if-ne p0, p1, :cond_b

    .line 282
    .line 283
    return v4

    .line 284
    :cond_b
    return v3

    .line 285
    :pswitch_e
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 286
    .line 287
    .line 288
    move-result p0

    .line 289
    if-eqz p0, :cond_c

    .line 290
    .line 291
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 292
    .line 293
    .line 294
    move-result p0

    .line 295
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 296
    .line 297
    .line 298
    move-result p1

    .line 299
    if-ne p0, p1, :cond_c

    .line 300
    .line 301
    return v4

    .line 302
    :cond_c
    return v3

    .line 303
    :pswitch_f
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 304
    .line 305
    .line 306
    move-result p0

    .line 307
    if-eqz p0, :cond_d

    .line 308
    .line 309
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 310
    .line 311
    .line 312
    move-result-wide p0

    .line 313
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 314
    .line 315
    .line 316
    move-result-wide p2

    .line 317
    cmp-long p0, p0, p2

    .line 318
    .line 319
    if-nez p0, :cond_d

    .line 320
    .line 321
    return v4

    .line 322
    :cond_d
    return v3

    .line 323
    :pswitch_10
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 324
    .line 325
    .line 326
    move-result p0

    .line 327
    if-eqz p0, :cond_e

    .line 328
    .line 329
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 330
    .line 331
    .line 332
    move-result p0

    .line 333
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 334
    .line 335
    .line 336
    move-result p1

    .line 337
    if-ne p0, p1, :cond_e

    .line 338
    .line 339
    return v4

    .line 340
    :cond_e
    return v3

    .line 341
    :pswitch_11
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 342
    .line 343
    .line 344
    move-result p0

    .line 345
    if-eqz p0, :cond_f

    .line 346
    .line 347
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 348
    .line 349
    .line 350
    move-result-wide p0

    .line 351
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 352
    .line 353
    .line 354
    move-result-wide p2

    .line 355
    cmp-long p0, p0, p2

    .line 356
    .line 357
    if-nez p0, :cond_f

    .line 358
    .line 359
    return v4

    .line 360
    :cond_f
    return v3

    .line 361
    :pswitch_12
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 362
    .line 363
    .line 364
    move-result p0

    .line 365
    if-eqz p0, :cond_10

    .line 366
    .line 367
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 368
    .line 369
    .line 370
    move-result-wide p0

    .line 371
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 372
    .line 373
    .line 374
    move-result-wide p2

    .line 375
    cmp-long p0, p0, p2

    .line 376
    .line 377
    if-nez p0, :cond_10

    .line 378
    .line 379
    return v4

    .line 380
    :cond_10
    return v3

    .line 381
    :pswitch_13
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 382
    .line 383
    .line 384
    move-result p0

    .line 385
    if-eqz p0, :cond_11

    .line 386
    .line 387
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->B(Ljava/lang/Object;J)F

    .line 388
    .line 389
    .line 390
    move-result p0

    .line 391
    invoke-static {p0}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 392
    .line 393
    .line 394
    move-result p0

    .line 395
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->B(Ljava/lang/Object;J)F

    .line 396
    .line 397
    .line 398
    move-result p1

    .line 399
    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 400
    .line 401
    .line 402
    move-result p1

    .line 403
    if-ne p0, p1, :cond_11

    .line 404
    .line 405
    return v4

    .line 406
    :cond_11
    return v3

    .line 407
    :pswitch_14
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 408
    .line 409
    .line 410
    move-result p0

    .line 411
    if-eqz p0, :cond_12

    .line 412
    .line 413
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/u0;->A(Ljava/lang/Object;J)D

    .line 414
    .line 415
    .line 416
    move-result-wide p0

    .line 417
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 418
    .line 419
    .line 420
    move-result-wide p0

    .line 421
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/u0;->A(Ljava/lang/Object;J)D

    .line 422
    .line 423
    .line 424
    move-result-wide p2

    .line 425
    invoke-static {p2, p3}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 426
    .line 427
    .line 428
    move-result-wide p2

    .line 429
    cmp-long p0, p0, p2

    .line 430
    .line 431
    if-nez p0, :cond_12

    .line 432
    .line 433
    return v4

    .line 434
    :cond_12
    return v3

    .line 435
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private p0(Ljava/lang/Object;II)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;II)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p3}, Lcom/google/protobuf/W;->i0(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const p3, 0xfffff

    .line 6
    .line 7
    .line 8
    and-int/2addr p0, p3

    .line 9
    int-to-long v0, p0

    .line 10
    invoke-static {p1, v0, v1, p2}, Lcom/google/protobuf/u0;->T(Ljava/lang/Object;JI)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private q(Ljava/lang/Object;ILjava/lang/Object;Lcom/google/protobuf/q0;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<UT:",
            "Ljava/lang/Object;",
            "UB:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "ITUB;",
            "Lcom/google/protobuf/q0<",
            "TUT;TUB;>;",
            "Ljava/lang/Object;",
            ")TUB;"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2}, Lcom/google/protobuf/W;->V(I)I

    .line 2
    .line 3
    .line 4
    move-result v2

    .line 5
    invoke-direct {p0, p2}, Lcom/google/protobuf/W;->u0(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {v0}, Lcom/google/protobuf/W;->W(I)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-direct {p0, p2}, Lcom/google/protobuf/W;->t(I)Lcom/google/protobuf/A$e;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    if-nez v4, :cond_1

    .line 25
    .line 26
    :goto_0
    return-object p3

    .line 27
    :cond_1
    iget-object v0, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 28
    .line 29
    invoke-interface {v0, p1}, Lcom/google/protobuf/N;->c(Ljava/lang/Object;)Ljava/util/Map;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    move-object v0, p0

    .line 34
    move v1, p2

    .line 35
    move-object v5, p3

    .line 36
    move-object v6, p4

    .line 37
    move-object v7, p5

    .line 38
    invoke-direct/range {v0 .. v7}, Lcom/google/protobuf/W;->r(IILjava/util/Map;Lcom/google/protobuf/A$e;Ljava/lang/Object;Lcom/google/protobuf/q0;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method private q0(II)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/W;->a:[I

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    div-int/lit8 v0, v0, 0x3

    .line 5
    .line 6
    add-int/lit8 v0, v0, -0x1

    .line 7
    .line 8
    :goto_0
    if-gt p2, v0, :cond_2

    .line 9
    .line 10
    add-int v1, v0, p2

    .line 11
    .line 12
    ushr-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    mul-int/lit8 v2, v1, 0x3

    .line 15
    .line 16
    invoke-direct {p0, v2}, Lcom/google/protobuf/W;->V(I)I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-ne p1, v3, :cond_0

    .line 21
    .line 22
    return v2

    .line 23
    :cond_0
    if-ge p1, v3, :cond_1

    .line 24
    .line 25
    add-int/lit8 v1, v1, -0x1

    .line 26
    .line 27
    move v0, v1

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    move p2, v1

    .line 32
    goto :goto_0

    .line 33
    :cond_2
    const/4 p0, -0x1

    .line 34
    return p0
.end method

.method private r(IILjava/util/Map;Lcom/google/protobuf/A$e;Ljava/lang/Object;Lcom/google/protobuf/q0;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            "UT:",
            "Ljava/lang/Object;",
            "UB:",
            "Ljava/lang/Object;",
            ">(II",
            "Ljava/util/Map<",
            "TK;TV;>;",
            "Lcom/google/protobuf/A$e;",
            "TUB;",
            "Lcom/google/protobuf/q0<",
            "TUT;TUB;>;",
            "Ljava/lang/Object;",
            ")TUB;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/google/protobuf/W;->u(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {v0, p0}, Lcom/google/protobuf/N;->b(Ljava/lang/Object;)Lcom/google/protobuf/L$a;

    .line 8
    .line 9
    .line 10
    invoke-interface {p3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Ljava/util/Map$Entry;

    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    check-cast p3, Ljava/lang/Integer;

    .line 35
    .line 36
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    invoke-interface {p4, p3}, Lcom/google/protobuf/A$e;->isInRange(I)Z

    .line 41
    .line 42
    .line 43
    move-result p3

    .line 44
    if-nez p3, :cond_0

    .line 45
    .line 46
    if-nez p5, :cond_1

    .line 47
    .line 48
    invoke-virtual {p6, p7}, Lcom/google/protobuf/q0;->f(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p5

    .line 52
    :cond_1
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const/4 v1, 0x0

    .line 61
    invoke-static {v1, p3, v0}, Lcom/google/protobuf/L;->b(Lcom/google/protobuf/L$a;Ljava/lang/Object;Ljava/lang/Object;)I

    .line 62
    .line 63
    .line 64
    move-result p3

    .line 65
    invoke-static {p3}, Lcom/google/protobuf/h;->v(I)Lcom/google/protobuf/h$h;

    .line 66
    .line 67
    .line 68
    move-result-object p3

    .line 69
    invoke-virtual {p3}, Lcom/google/protobuf/h$h;->b()Lcom/google/protobuf/k;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    :try_start_0
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {v0, v1, v2, p1}, Lcom/google/protobuf/L;->d(Lcom/google/protobuf/k;Lcom/google/protobuf/L$a;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .line 83
    .line 84
    invoke-virtual {p3}, Lcom/google/protobuf/h$h;->a()Lcom/google/protobuf/h;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p6, p5, p2, p1}, Lcom/google/protobuf/q0;->d(Ljava/lang/Object;ILcom/google/protobuf/h;)V

    .line 89
    .line 90
    .line 91
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :catch_0
    move-exception p0

    .line 96
    new-instance p1, Ljava/lang/RuntimeException;

    .line 97
    .line 98
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 99
    .line 100
    .line 101
    throw p1

    .line 102
    :cond_2
    return-object p5
.end method

.method private r0(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/protobuf/W;->s:Lsun/misc/Unsafe;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lcom/google/protobuf/W;->u0(I)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v1}, Lcom/google/protobuf/W;->W(I)J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    invoke-virtual {v0, p1, v1, v2, p3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, p1, p2}, Lcom/google/protobuf/W;->o0(Ljava/lang/Object;I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private static s(Ljava/lang/Object;J)F
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)F"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/u0;->B(Ljava/lang/Object;J)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private s0(Ljava/lang/Object;IILjava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;II",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/protobuf/W;->s:Lsun/misc/Unsafe;

    .line 2
    .line 3
    invoke-direct {p0, p3}, Lcom/google/protobuf/W;->u0(I)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v1}, Lcom/google/protobuf/W;->W(I)J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    invoke-virtual {v0, p1, v1, v2, p4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/W;->p0(Ljava/lang/Object;II)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private t(I)Lcom/google/protobuf/A$e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/W;->b:[Ljava/lang/Object;

    .line 2
    .line 3
    div-int/lit8 p1, p1, 0x3

    .line 4
    .line 5
    mul-int/lit8 p1, p1, 0x2

    .line 6
    .line 7
    add-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    aget-object p0, p0, p1

    .line 10
    .line 11
    check-cast p0, Lcom/google/protobuf/A$e;

    .line 12
    .line 13
    return-object p0
.end method

.method private static t0(I)I
    .locals 1

    .line 1
    const/high16 v0, 0xff00000

    .line 2
    .line 3
    and-int/2addr p0, v0

    .line 4
    ushr-int/lit8 p0, p0, 0x14

    .line 5
    .line 6
    return p0
.end method

.method private u(I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/W;->b:[Ljava/lang/Object;

    .line 2
    .line 3
    div-int/lit8 p1, p1, 0x3

    .line 4
    .line 5
    mul-int/lit8 p1, p1, 0x2

    .line 6
    .line 7
    aget-object p0, p0, p1

    .line 8
    .line 9
    return-object p0
.end method

.method private u0(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/W;->a:[I

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    aget p0, p0, p1

    .line 6
    .line 7
    return p0
.end method

.method private v(I)Lcom/google/protobuf/j0;
    .locals 3

    .line 1
    div-int/lit8 p1, p1, 0x3

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0x2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/protobuf/W;->b:[Ljava/lang/Object;

    .line 6
    .line 7
    aget-object v0, v0, p1

    .line 8
    .line 9
    check-cast v0, Lcom/google/protobuf/j0;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    invoke-static {}, Lcom/google/protobuf/f0;->a()Lcom/google/protobuf/f0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lcom/google/protobuf/W;->b:[Ljava/lang/Object;

    .line 19
    .line 20
    add-int/lit8 v2, p1, 0x1

    .line 21
    .line 22
    aget-object v1, v1, v2

    .line 23
    .line 24
    check-cast v1, Ljava/lang/Class;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/google/protobuf/f0;->c(Ljava/lang/Class;)Lcom/google/protobuf/j0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object p0, p0, Lcom/google/protobuf/W;->b:[Ljava/lang/Object;

    .line 31
    .line 32
    aput-object v0, p0, p1

    .line 33
    .line 34
    return-object v0
.end method

.method private v0(Ljava/lang/Object;Lcom/google/protobuf/x0;)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/google/protobuf/x0;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v6, p2

    .line 1
    iget-boolean v2, v0, Lcom/google/protobuf/W;->f:Z

    if-eqz v2, :cond_0

    .line 2
    iget-object v2, v0, Lcom/google/protobuf/W;->p:Lcom/google/protobuf/q;

    invoke-virtual {v2, v1}, Lcom/google/protobuf/q;->c(Ljava/lang/Object;)Lcom/google/protobuf/u;

    move-result-object v2

    .line 3
    invoke-virtual {v2}, Lcom/google/protobuf/u;->m()Z

    move-result v3

    if-nez v3, :cond_0

    .line 4
    invoke-virtual {v2}, Lcom/google/protobuf/u;->s()Ljava/util/Iterator;

    move-result-object v2

    .line 5
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    move-object v8, v2

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    const/4 v8, 0x0

    .line 6
    :goto_0
    iget-object v2, v0, Lcom/google/protobuf/W;->a:[I

    array-length v9, v2

    .line 7
    sget-object v10, Lcom/google/protobuf/W;->s:Lsun/misc/Unsafe;

    const v11, 0xfffff

    move v4, v11

    const/4 v2, 0x0

    const/4 v5, 0x0

    :goto_1
    if-ge v2, v9, :cond_9

    .line 8
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->u0(I)I

    move-result v13

    .line 9
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v14

    .line 10
    invoke-static {v13}, Lcom/google/protobuf/W;->t0(I)I

    move-result v15

    const/16 v7, 0x11

    if-gt v15, v7, :cond_3

    .line 11
    iget-object v7, v0, Lcom/google/protobuf/W;->a:[I

    add-int/lit8 v16, v2, 0x2

    aget v7, v7, v16

    const/16 v16, 0x1

    and-int v12, v7, v11

    if-eq v12, v4, :cond_2

    if-ne v12, v11, :cond_1

    const/4 v5, 0x0

    goto :goto_2

    :cond_1
    int-to-long v4, v12

    .line 12
    invoke-virtual {v10, v1, v4, v5}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v4

    move v5, v4

    :goto_2
    move v4, v12

    :cond_2
    ushr-int/lit8 v7, v7, 0x14

    shl-int v7, v16, v7

    move/from16 v17, v7

    move-object v7, v3

    move v3, v4

    move v4, v5

    move/from16 v5, v17

    goto :goto_3

    :cond_3
    const/16 v16, 0x1

    move-object v7, v3

    move v3, v4

    move v4, v5

    const/4 v5, 0x0

    :goto_3
    if-eqz v7, :cond_5

    .line 13
    iget-object v12, v0, Lcom/google/protobuf/W;->p:Lcom/google/protobuf/q;

    invoke-virtual {v12, v7}, Lcom/google/protobuf/q;->a(Ljava/util/Map$Entry;)I

    move-result v12

    if-gt v12, v14, :cond_5

    .line 14
    iget-object v12, v0, Lcom/google/protobuf/W;->p:Lcom/google/protobuf/q;

    invoke-virtual {v12, v6, v7}, Lcom/google/protobuf/q;->j(Lcom/google/protobuf/x0;Ljava/util/Map$Entry;)V

    .line 15
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    goto :goto_3

    :cond_4
    const/4 v7, 0x0

    goto :goto_3

    .line 16
    :cond_5
    invoke-static {v13}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v12

    packed-switch v15, :pswitch_data_0

    :cond_6
    :goto_4
    const/4 v15, 0x0

    goto/16 :goto_7

    .line 17
    :pswitch_0
    invoke-direct {v0, v1, v14, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 18
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v12

    .line 19
    invoke-interface {v6, v14, v5, v12}, Lcom/google/protobuf/x0;->i(ILjava/lang/Object;Lcom/google/protobuf/j0;)V

    goto :goto_4

    .line 20
    :pswitch_1
    invoke-direct {v0, v1, v14, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 21
    invoke-static {v1, v12, v13}, Lcom/google/protobuf/W;->b0(Ljava/lang/Object;J)J

    move-result-wide v12

    invoke-interface {v6, v14, v12, v13}, Lcom/google/protobuf/x0;->p(IJ)V

    goto :goto_4

    .line 22
    :pswitch_2
    invoke-direct {v0, v1, v14, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 23
    invoke-static {v1, v12, v13}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    move-result v5

    invoke-interface {v6, v14, v5}, Lcom/google/protobuf/x0;->N(II)V

    goto :goto_4

    .line 24
    :pswitch_3
    invoke-direct {v0, v1, v14, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 25
    invoke-static {v1, v12, v13}, Lcom/google/protobuf/W;->b0(Ljava/lang/Object;J)J

    move-result-wide v12

    invoke-interface {v6, v14, v12, v13}, Lcom/google/protobuf/x0;->l(IJ)V

    goto :goto_4

    .line 26
    :pswitch_4
    invoke-direct {v0, v1, v14, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 27
    invoke-static {v1, v12, v13}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    move-result v5

    invoke-interface {v6, v14, v5}, Lcom/google/protobuf/x0;->B(II)V

    goto :goto_4

    .line 28
    :pswitch_5
    invoke-direct {v0, v1, v14, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 29
    invoke-static {v1, v12, v13}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    move-result v5

    invoke-interface {v6, v14, v5}, Lcom/google/protobuf/x0;->K(II)V

    goto :goto_4

    .line 30
    :pswitch_6
    invoke-direct {v0, v1, v14, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 31
    invoke-static {v1, v12, v13}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    move-result v5

    invoke-interface {v6, v14, v5}, Lcom/google/protobuf/x0;->s(II)V

    goto :goto_4

    .line 32
    :pswitch_7
    invoke-direct {v0, v1, v14, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 33
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/protobuf/h;

    invoke-interface {v6, v14, v5}, Lcom/google/protobuf/x0;->j(ILcom/google/protobuf/h;)V

    goto :goto_4

    .line 34
    :pswitch_8
    invoke-direct {v0, v1, v14, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 35
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 36
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v12

    invoke-interface {v6, v14, v5, v12}, Lcom/google/protobuf/x0;->w(ILjava/lang/Object;Lcom/google/protobuf/j0;)V

    goto/16 :goto_4

    .line 37
    :pswitch_9
    invoke-direct {v0, v1, v14, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 38
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    invoke-direct {v0, v14, v5, v6}, Lcom/google/protobuf/W;->y0(ILjava/lang/Object;Lcom/google/protobuf/x0;)V

    goto/16 :goto_4

    .line 39
    :pswitch_a
    invoke-direct {v0, v1, v14, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 40
    invoke-static {v1, v12, v13}, Lcom/google/protobuf/W;->X(Ljava/lang/Object;J)Z

    move-result v5

    invoke-interface {v6, v14, v5}, Lcom/google/protobuf/x0;->A(IZ)V

    goto/16 :goto_4

    .line 41
    :pswitch_b
    invoke-direct {v0, v1, v14, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 42
    invoke-static {v1, v12, v13}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    move-result v5

    invoke-interface {v6, v14, v5}, Lcom/google/protobuf/x0;->d(II)V

    goto/16 :goto_4

    .line 43
    :pswitch_c
    invoke-direct {v0, v1, v14, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 44
    invoke-static {v1, v12, v13}, Lcom/google/protobuf/W;->b0(Ljava/lang/Object;J)J

    move-result-wide v12

    invoke-interface {v6, v14, v12, v13}, Lcom/google/protobuf/x0;->x(IJ)V

    goto/16 :goto_4

    .line 45
    :pswitch_d
    invoke-direct {v0, v1, v14, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 46
    invoke-static {v1, v12, v13}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    move-result v5

    invoke-interface {v6, v14, v5}, Lcom/google/protobuf/x0;->k(II)V

    goto/16 :goto_4

    .line 47
    :pswitch_e
    invoke-direct {v0, v1, v14, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 48
    invoke-static {v1, v12, v13}, Lcom/google/protobuf/W;->b0(Ljava/lang/Object;J)J

    move-result-wide v12

    invoke-interface {v6, v14, v12, v13}, Lcom/google/protobuf/x0;->g(IJ)V

    goto/16 :goto_4

    .line 49
    :pswitch_f
    invoke-direct {v0, v1, v14, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 50
    invoke-static {v1, v12, v13}, Lcom/google/protobuf/W;->b0(Ljava/lang/Object;J)J

    move-result-wide v12

    invoke-interface {v6, v14, v12, v13}, Lcom/google/protobuf/x0;->z(IJ)V

    goto/16 :goto_4

    .line 51
    :pswitch_10
    invoke-direct {v0, v1, v14, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 52
    invoke-static {v1, v12, v13}, Lcom/google/protobuf/W;->Z(Ljava/lang/Object;J)F

    move-result v5

    invoke-interface {v6, v14, v5}, Lcom/google/protobuf/x0;->H(IF)V

    goto/16 :goto_4

    .line 53
    :pswitch_11
    invoke-direct {v0, v1, v14, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 54
    invoke-static {v1, v12, v13}, Lcom/google/protobuf/W;->Y(Ljava/lang/Object;J)D

    move-result-wide v12

    invoke-interface {v6, v14, v12, v13}, Lcom/google/protobuf/x0;->t(ID)V

    goto/16 :goto_4

    .line 55
    :pswitch_12
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    invoke-direct {v0, v6, v14, v5, v2}, Lcom/google/protobuf/W;->x0(Lcom/google/protobuf/x0;ILjava/lang/Object;I)V

    goto/16 :goto_4

    .line 56
    :pswitch_13
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 57
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 58
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v13

    .line 59
    invoke-static {v5, v12, v6, v13}, Lcom/google/protobuf/l0;->T(ILjava/util/List;Lcom/google/protobuf/x0;Lcom/google/protobuf/j0;)V

    goto/16 :goto_4

    .line 60
    :pswitch_14
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    move/from16 v14, v16

    .line 61
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->a0(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_4

    :pswitch_15
    move/from16 v14, v16

    .line 62
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 63
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->Z(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_4

    :pswitch_16
    move/from16 v14, v16

    .line 64
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 65
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->Y(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_4

    :pswitch_17
    move/from16 v14, v16

    .line 66
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 67
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->X(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_4

    :pswitch_18
    move/from16 v14, v16

    .line 68
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 69
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->P(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_4

    :pswitch_19
    move/from16 v14, v16

    .line 70
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 71
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->c0(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_4

    :pswitch_1a
    move/from16 v14, v16

    .line 72
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 73
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->M(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_4

    :pswitch_1b
    move/from16 v14, v16

    .line 74
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 75
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->Q(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_4

    :pswitch_1c
    move/from16 v14, v16

    .line 76
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 77
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->R(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_4

    :pswitch_1d
    move/from16 v14, v16

    .line 78
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 79
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->U(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_4

    :pswitch_1e
    move/from16 v14, v16

    .line 80
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 81
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->d0(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_4

    :pswitch_1f
    move/from16 v14, v16

    .line 82
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 83
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->V(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_4

    :pswitch_20
    move/from16 v14, v16

    .line 84
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 85
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->S(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_4

    :pswitch_21
    move/from16 v14, v16

    .line 86
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 87
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->O(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_4

    .line 88
    :pswitch_22
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    const/4 v14, 0x0

    .line 89
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->a0(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    :goto_5
    move v15, v14

    goto/16 :goto_7

    :pswitch_23
    const/4 v14, 0x0

    .line 90
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 91
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->Z(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto :goto_5

    :pswitch_24
    const/4 v14, 0x0

    .line 92
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 93
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->Y(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto :goto_5

    :pswitch_25
    const/4 v14, 0x0

    .line 94
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 95
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->X(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto :goto_5

    :pswitch_26
    const/4 v14, 0x0

    .line 96
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 97
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->P(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto :goto_5

    :pswitch_27
    const/4 v14, 0x0

    .line 98
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 99
    invoke-static {v5, v12, v6, v14}, Lcom/google/protobuf/l0;->c0(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto :goto_5

    .line 100
    :pswitch_28
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 101
    invoke-static {v5, v12, v6}, Lcom/google/protobuf/l0;->N(ILjava/util/List;Lcom/google/protobuf/x0;)V

    goto/16 :goto_4

    .line 102
    :pswitch_29
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 103
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 104
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v13

    .line 105
    invoke-static {v5, v12, v6, v13}, Lcom/google/protobuf/l0;->W(ILjava/util/List;Lcom/google/protobuf/x0;Lcom/google/protobuf/j0;)V

    goto/16 :goto_4

    .line 106
    :pswitch_2a
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 107
    invoke-static {v5, v12, v6}, Lcom/google/protobuf/l0;->b0(ILjava/util/List;Lcom/google/protobuf/x0;)V

    goto/16 :goto_4

    .line 108
    :pswitch_2b
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    const/4 v15, 0x0

    .line 109
    invoke-static {v5, v12, v6, v15}, Lcom/google/protobuf/l0;->M(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_7

    :pswitch_2c
    const/4 v15, 0x0

    .line 110
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 111
    invoke-static {v5, v12, v6, v15}, Lcom/google/protobuf/l0;->Q(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_7

    :pswitch_2d
    const/4 v15, 0x0

    .line 112
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 113
    invoke-static {v5, v12, v6, v15}, Lcom/google/protobuf/l0;->R(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_7

    :pswitch_2e
    const/4 v15, 0x0

    .line 114
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 115
    invoke-static {v5, v12, v6, v15}, Lcom/google/protobuf/l0;->U(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_7

    :pswitch_2f
    const/4 v15, 0x0

    .line 116
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 117
    invoke-static {v5, v12, v6, v15}, Lcom/google/protobuf/l0;->d0(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_7

    :pswitch_30
    const/4 v15, 0x0

    .line 118
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 119
    invoke-static {v5, v12, v6, v15}, Lcom/google/protobuf/l0;->V(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_7

    :pswitch_31
    const/4 v15, 0x0

    .line 120
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 121
    invoke-static {v5, v12, v6, v15}, Lcom/google/protobuf/l0;->S(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_7

    :pswitch_32
    const/4 v15, 0x0

    .line 122
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 123
    invoke-static {v5, v12, v6, v15}, Lcom/google/protobuf/l0;->O(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_7

    :pswitch_33
    const/4 v15, 0x0

    .line 124
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 125
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v12

    .line 126
    invoke-interface {v6, v14, v5, v12}, Lcom/google/protobuf/x0;->i(ILjava/lang/Object;Lcom/google/protobuf/j0;)V

    goto/16 :goto_7

    :pswitch_34
    const/4 v15, 0x0

    .line 127
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 128
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v12

    invoke-interface {v6, v14, v12, v13}, Lcom/google/protobuf/x0;->p(IJ)V

    :cond_7
    :goto_6
    move-object/from16 v0, p0

    goto/16 :goto_7

    :pswitch_35
    const/4 v15, 0x0

    .line 129
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 130
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v0

    invoke-interface {v6, v14, v0}, Lcom/google/protobuf/x0;->N(II)V

    goto :goto_6

    :pswitch_36
    const/4 v15, 0x0

    .line 131
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 132
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v12

    invoke-interface {v6, v14, v12, v13}, Lcom/google/protobuf/x0;->l(IJ)V

    goto :goto_6

    :pswitch_37
    const/4 v15, 0x0

    .line 133
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 134
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v0

    invoke-interface {v6, v14, v0}, Lcom/google/protobuf/x0;->B(II)V

    goto :goto_6

    :pswitch_38
    const/4 v15, 0x0

    .line 135
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 136
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v0

    invoke-interface {v6, v14, v0}, Lcom/google/protobuf/x0;->K(II)V

    goto :goto_6

    :pswitch_39
    const/4 v15, 0x0

    .line 137
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 138
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v0

    invoke-interface {v6, v14, v0}, Lcom/google/protobuf/x0;->s(II)V

    goto :goto_6

    :pswitch_3a
    const/4 v15, 0x0

    .line 139
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 140
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/h;

    invoke-interface {v6, v14, v0}, Lcom/google/protobuf/x0;->j(ILcom/google/protobuf/h;)V

    goto :goto_6

    :pswitch_3b
    const/4 v15, 0x0

    .line 141
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 142
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 143
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v12

    invoke-interface {v6, v14, v5, v12}, Lcom/google/protobuf/x0;->w(ILjava/lang/Object;Lcom/google/protobuf/j0;)V

    goto/16 :goto_7

    :pswitch_3c
    const/4 v15, 0x0

    .line 144
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 145
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    invoke-direct {v0, v14, v5, v6}, Lcom/google/protobuf/W;->y0(ILjava/lang/Object;Lcom/google/protobuf/x0;)V

    goto/16 :goto_7

    :pswitch_3d
    const/4 v15, 0x0

    .line 146
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 147
    invoke-static {v1, v12, v13}, Lcom/google/protobuf/W;->l(Ljava/lang/Object;J)Z

    move-result v0

    invoke-interface {v6, v14, v0}, Lcom/google/protobuf/x0;->A(IZ)V

    goto/16 :goto_6

    :pswitch_3e
    const/4 v15, 0x0

    .line 148
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 149
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v0

    invoke-interface {v6, v14, v0}, Lcom/google/protobuf/x0;->d(II)V

    goto/16 :goto_6

    :pswitch_3f
    const/4 v15, 0x0

    .line 150
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 151
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v12

    invoke-interface {v6, v14, v12, v13}, Lcom/google/protobuf/x0;->x(IJ)V

    goto/16 :goto_6

    :pswitch_40
    const/4 v15, 0x0

    .line 152
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 153
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v0

    invoke-interface {v6, v14, v0}, Lcom/google/protobuf/x0;->k(II)V

    goto/16 :goto_6

    :pswitch_41
    const/4 v15, 0x0

    .line 154
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 155
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v12

    invoke-interface {v6, v14, v12, v13}, Lcom/google/protobuf/x0;->g(IJ)V

    goto/16 :goto_6

    :pswitch_42
    const/4 v15, 0x0

    .line 156
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 157
    invoke-virtual {v10, v1, v12, v13}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v12

    invoke-interface {v6, v14, v12, v13}, Lcom/google/protobuf/x0;->z(IJ)V

    goto/16 :goto_6

    :pswitch_43
    const/4 v15, 0x0

    .line 158
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 159
    invoke-static {v1, v12, v13}, Lcom/google/protobuf/W;->s(Ljava/lang/Object;J)F

    move-result v0

    invoke-interface {v6, v14, v0}, Lcom/google/protobuf/x0;->H(IF)V

    goto/16 :goto_6

    :pswitch_44
    const/4 v15, 0x0

    .line 160
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 161
    invoke-static {v1, v12, v13}, Lcom/google/protobuf/W;->o(Ljava/lang/Object;J)D

    move-result-wide v12

    invoke-interface {v6, v14, v12, v13}, Lcom/google/protobuf/x0;->t(ID)V

    :cond_8
    :goto_7
    add-int/lit8 v2, v2, 0x3

    move v5, v4

    move v4, v3

    move-object v3, v7

    goto/16 :goto_1

    :cond_9
    :goto_8
    if-eqz v3, :cond_b

    .line 162
    iget-object v2, v0, Lcom/google/protobuf/W;->p:Lcom/google/protobuf/q;

    invoke-virtual {v2, v6, v3}, Lcom/google/protobuf/q;->j(Lcom/google/protobuf/x0;Ljava/util/Map$Entry;)V

    .line 163
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    move-object v3, v2

    goto :goto_8

    :cond_a
    const/4 v3, 0x0

    goto :goto_8

    .line 164
    :cond_b
    iget-object v2, v0, Lcom/google/protobuf/W;->o:Lcom/google/protobuf/q0;

    invoke-direct {v0, v2, v1, v6}, Lcom/google/protobuf/W;->z0(Lcom/google/protobuf/q0;Ljava/lang/Object;Lcom/google/protobuf/x0;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static w(Ljava/lang/Object;)Lcom/google/protobuf/r0;
    .locals 2

    .line 1
    check-cast p0, Lcom/google/protobuf/y;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/google/protobuf/y;->unknownFields:Lcom/google/protobuf/r0;

    .line 4
    .line 5
    invoke-static {}, Lcom/google/protobuf/r0;->c()Lcom/google/protobuf/r0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/google/protobuf/r0;->o()Lcom/google/protobuf/r0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/google/protobuf/y;->unknownFields:Lcom/google/protobuf/r0;

    .line 16
    .line 17
    :cond_0
    return-object v0
.end method

.method private w0(Ljava/lang/Object;Lcom/google/protobuf/x0;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/google/protobuf/x0;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/W;->o:Lcom/google/protobuf/q0;

    invoke-direct {p0, v0, p1, p2}, Lcom/google/protobuf/W;->z0(Lcom/google/protobuf/q0;Ljava/lang/Object;Lcom/google/protobuf/x0;)V

    .line 2
    iget-boolean v0, p0, Lcom/google/protobuf/W;->f:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 3
    iget-object v0, p0, Lcom/google/protobuf/W;->p:Lcom/google/protobuf/q;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/q;->c(Ljava/lang/Object;)Lcom/google/protobuf/u;

    move-result-object v0

    .line 4
    invoke-virtual {v0}, Lcom/google/protobuf/u;->m()Z

    move-result v2

    if-nez v2, :cond_0

    .line 5
    invoke-virtual {v0}, Lcom/google/protobuf/u;->g()Ljava/util/Iterator;

    move-result-object v0

    .line 6
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    goto :goto_0

    :cond_0
    move-object v0, v1

    move-object v2, v0

    .line 7
    :goto_0
    iget-object v3, p0, Lcom/google/protobuf/W;->a:[I

    array-length v3, v3

    add-int/lit8 v3, v3, -0x3

    :goto_1
    if-ltz v3, :cond_4

    .line 8
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->u0(I)I

    move-result v4

    .line 9
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    :goto_2
    if-eqz v2, :cond_2

    .line 10
    iget-object v6, p0, Lcom/google/protobuf/W;->p:Lcom/google/protobuf/q;

    invoke-virtual {v6, v2}, Lcom/google/protobuf/q;->a(Ljava/util/Map$Entry;)I

    move-result v6

    if-le v6, v5, :cond_2

    .line 11
    iget-object v6, p0, Lcom/google/protobuf/W;->p:Lcom/google/protobuf/q;

    invoke-virtual {v6, p2, v2}, Lcom/google/protobuf/q;->j(Lcom/google/protobuf/x0;Ljava/util/Map$Entry;)V

    .line 12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    goto :goto_2

    :cond_1
    move-object v2, v1

    goto :goto_2

    .line 13
    :cond_2
    invoke-static {v4}, Lcom/google/protobuf/W;->t0(I)I

    move-result v6

    const/4 v7, 0x0

    const/4 v8, 0x1

    packed-switch v6, :pswitch_data_0

    goto/16 :goto_3

    .line 14
    :pswitch_0
    invoke-direct {p0, p1, v5, v3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 15
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    .line 16
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v6

    .line 17
    invoke-interface {p2, v5, v4, v6}, Lcom/google/protobuf/x0;->i(ILjava/lang/Object;Lcom/google/protobuf/j0;)V

    goto/16 :goto_3

    .line 18
    :pswitch_1
    invoke-direct {p0, p1, v5, v3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 19
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->b0(Ljava/lang/Object;J)J

    move-result-wide v6

    invoke-interface {p2, v5, v6, v7}, Lcom/google/protobuf/x0;->p(IJ)V

    goto/16 :goto_3

    .line 20
    :pswitch_2
    invoke-direct {p0, p1, v5, v3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 21
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    move-result v4

    invoke-interface {p2, v5, v4}, Lcom/google/protobuf/x0;->N(II)V

    goto/16 :goto_3

    .line 22
    :pswitch_3
    invoke-direct {p0, p1, v5, v3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 23
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->b0(Ljava/lang/Object;J)J

    move-result-wide v6

    invoke-interface {p2, v5, v6, v7}, Lcom/google/protobuf/x0;->l(IJ)V

    goto/16 :goto_3

    .line 24
    :pswitch_4
    invoke-direct {p0, p1, v5, v3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 25
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    move-result v4

    invoke-interface {p2, v5, v4}, Lcom/google/protobuf/x0;->B(II)V

    goto/16 :goto_3

    .line 26
    :pswitch_5
    invoke-direct {p0, p1, v5, v3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 27
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    move-result v4

    invoke-interface {p2, v5, v4}, Lcom/google/protobuf/x0;->K(II)V

    goto/16 :goto_3

    .line 28
    :pswitch_6
    invoke-direct {p0, p1, v5, v3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 29
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    move-result v4

    invoke-interface {p2, v5, v4}, Lcom/google/protobuf/x0;->s(II)V

    goto/16 :goto_3

    .line 30
    :pswitch_7
    invoke-direct {p0, p1, v5, v3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 31
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/protobuf/h;

    .line 32
    invoke-interface {p2, v5, v4}, Lcom/google/protobuf/x0;->j(ILcom/google/protobuf/h;)V

    goto/16 :goto_3

    .line 33
    :pswitch_8
    invoke-direct {p0, p1, v5, v3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 34
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    .line 35
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v6

    invoke-interface {p2, v5, v4, v6}, Lcom/google/protobuf/x0;->w(ILjava/lang/Object;Lcom/google/protobuf/j0;)V

    goto/16 :goto_3

    .line 36
    :pswitch_9
    invoke-direct {p0, p1, v5, v3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 37
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    invoke-direct {p0, v5, v4, p2}, Lcom/google/protobuf/W;->y0(ILjava/lang/Object;Lcom/google/protobuf/x0;)V

    goto/16 :goto_3

    .line 38
    :pswitch_a
    invoke-direct {p0, p1, v5, v3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 39
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->X(Ljava/lang/Object;J)Z

    move-result v4

    invoke-interface {p2, v5, v4}, Lcom/google/protobuf/x0;->A(IZ)V

    goto/16 :goto_3

    .line 40
    :pswitch_b
    invoke-direct {p0, p1, v5, v3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 41
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    move-result v4

    invoke-interface {p2, v5, v4}, Lcom/google/protobuf/x0;->d(II)V

    goto/16 :goto_3

    .line 42
    :pswitch_c
    invoke-direct {p0, p1, v5, v3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 43
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->b0(Ljava/lang/Object;J)J

    move-result-wide v6

    invoke-interface {p2, v5, v6, v7}, Lcom/google/protobuf/x0;->x(IJ)V

    goto/16 :goto_3

    .line 44
    :pswitch_d
    invoke-direct {p0, p1, v5, v3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 45
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    move-result v4

    invoke-interface {p2, v5, v4}, Lcom/google/protobuf/x0;->k(II)V

    goto/16 :goto_3

    .line 46
    :pswitch_e
    invoke-direct {p0, p1, v5, v3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 47
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->b0(Ljava/lang/Object;J)J

    move-result-wide v6

    invoke-interface {p2, v5, v6, v7}, Lcom/google/protobuf/x0;->g(IJ)V

    goto/16 :goto_3

    .line 48
    :pswitch_f
    invoke-direct {p0, p1, v5, v3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 49
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->b0(Ljava/lang/Object;J)J

    move-result-wide v6

    invoke-interface {p2, v5, v6, v7}, Lcom/google/protobuf/x0;->z(IJ)V

    goto/16 :goto_3

    .line 50
    :pswitch_10
    invoke-direct {p0, p1, v5, v3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 51
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->Z(Ljava/lang/Object;J)F

    move-result v4

    invoke-interface {p2, v5, v4}, Lcom/google/protobuf/x0;->H(IF)V

    goto/16 :goto_3

    .line 52
    :pswitch_11
    invoke-direct {p0, p1, v5, v3}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 53
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->Y(Ljava/lang/Object;J)D

    move-result-wide v6

    invoke-interface {p2, v5, v6, v7}, Lcom/google/protobuf/x0;->t(ID)V

    goto/16 :goto_3

    .line 54
    :pswitch_12
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    invoke-direct {p0, p2, v5, v4, v3}, Lcom/google/protobuf/W;->x0(Lcom/google/protobuf/x0;ILjava/lang/Object;I)V

    goto/16 :goto_3

    .line 55
    :pswitch_13
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 56
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 57
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v6

    .line 58
    invoke-static {v5, v4, p2, v6}, Lcom/google/protobuf/l0;->T(ILjava/util/List;Lcom/google/protobuf/x0;Lcom/google/protobuf/j0;)V

    goto/16 :goto_3

    .line 59
    :pswitch_14
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 60
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 61
    invoke-static {v5, v4, p2, v8}, Lcom/google/protobuf/l0;->a0(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 62
    :pswitch_15
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 63
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 64
    invoke-static {v5, v4, p2, v8}, Lcom/google/protobuf/l0;->Z(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 65
    :pswitch_16
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 66
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 67
    invoke-static {v5, v4, p2, v8}, Lcom/google/protobuf/l0;->Y(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 68
    :pswitch_17
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 69
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 70
    invoke-static {v5, v4, p2, v8}, Lcom/google/protobuf/l0;->X(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 71
    :pswitch_18
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 72
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 73
    invoke-static {v5, v4, p2, v8}, Lcom/google/protobuf/l0;->P(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 74
    :pswitch_19
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 75
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 76
    invoke-static {v5, v4, p2, v8}, Lcom/google/protobuf/l0;->c0(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 77
    :pswitch_1a
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 78
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 79
    invoke-static {v5, v4, p2, v8}, Lcom/google/protobuf/l0;->M(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 80
    :pswitch_1b
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 81
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 82
    invoke-static {v5, v4, p2, v8}, Lcom/google/protobuf/l0;->Q(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 83
    :pswitch_1c
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 84
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 85
    invoke-static {v5, v4, p2, v8}, Lcom/google/protobuf/l0;->R(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 86
    :pswitch_1d
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 87
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 88
    invoke-static {v5, v4, p2, v8}, Lcom/google/protobuf/l0;->U(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 89
    :pswitch_1e
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 90
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 91
    invoke-static {v5, v4, p2, v8}, Lcom/google/protobuf/l0;->d0(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 92
    :pswitch_1f
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 93
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 94
    invoke-static {v5, v4, p2, v8}, Lcom/google/protobuf/l0;->V(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 95
    :pswitch_20
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 96
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 97
    invoke-static {v5, v4, p2, v8}, Lcom/google/protobuf/l0;->S(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 98
    :pswitch_21
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 99
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 100
    invoke-static {v5, v4, p2, v8}, Lcom/google/protobuf/l0;->O(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 101
    :pswitch_22
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 102
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 103
    invoke-static {v5, v4, p2, v7}, Lcom/google/protobuf/l0;->a0(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 104
    :pswitch_23
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 105
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 106
    invoke-static {v5, v4, p2, v7}, Lcom/google/protobuf/l0;->Z(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 107
    :pswitch_24
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 108
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 109
    invoke-static {v5, v4, p2, v7}, Lcom/google/protobuf/l0;->Y(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 110
    :pswitch_25
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 111
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 112
    invoke-static {v5, v4, p2, v7}, Lcom/google/protobuf/l0;->X(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 113
    :pswitch_26
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 114
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 115
    invoke-static {v5, v4, p2, v7}, Lcom/google/protobuf/l0;->P(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 116
    :pswitch_27
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 117
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 118
    invoke-static {v5, v4, p2, v7}, Lcom/google/protobuf/l0;->c0(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 119
    :pswitch_28
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 120
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 121
    invoke-static {v5, v4, p2}, Lcom/google/protobuf/l0;->N(ILjava/util/List;Lcom/google/protobuf/x0;)V

    goto/16 :goto_3

    .line 122
    :pswitch_29
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 123
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 124
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v6

    .line 125
    invoke-static {v5, v4, p2, v6}, Lcom/google/protobuf/l0;->W(ILjava/util/List;Lcom/google/protobuf/x0;Lcom/google/protobuf/j0;)V

    goto/16 :goto_3

    .line 126
    :pswitch_2a
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 127
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 128
    invoke-static {v5, v4, p2}, Lcom/google/protobuf/l0;->b0(ILjava/util/List;Lcom/google/protobuf/x0;)V

    goto/16 :goto_3

    .line 129
    :pswitch_2b
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 130
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 131
    invoke-static {v5, v4, p2, v7}, Lcom/google/protobuf/l0;->M(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 132
    :pswitch_2c
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 133
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 134
    invoke-static {v5, v4, p2, v7}, Lcom/google/protobuf/l0;->Q(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 135
    :pswitch_2d
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 136
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 137
    invoke-static {v5, v4, p2, v7}, Lcom/google/protobuf/l0;->R(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 138
    :pswitch_2e
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 139
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 140
    invoke-static {v5, v4, p2, v7}, Lcom/google/protobuf/l0;->U(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 141
    :pswitch_2f
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 142
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 143
    invoke-static {v5, v4, p2, v7}, Lcom/google/protobuf/l0;->d0(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 144
    :pswitch_30
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 145
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 146
    invoke-static {v5, v4, p2, v7}, Lcom/google/protobuf/l0;->V(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 147
    :pswitch_31
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 148
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 149
    invoke-static {v5, v4, p2, v7}, Lcom/google/protobuf/l0;->S(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 150
    :pswitch_32
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->V(I)I

    move-result v5

    .line 151
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 152
    invoke-static {v5, v4, p2, v7}, Lcom/google/protobuf/l0;->O(ILjava/util/List;Lcom/google/protobuf/x0;Z)V

    goto/16 :goto_3

    .line 153
    :pswitch_33
    invoke-direct {p0, p1, v3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 154
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    .line 155
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v6

    .line 156
    invoke-interface {p2, v5, v4, v6}, Lcom/google/protobuf/x0;->i(ILjava/lang/Object;Lcom/google/protobuf/j0;)V

    goto/16 :goto_3

    .line 157
    :pswitch_34
    invoke-direct {p0, p1, v3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 158
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->K(Ljava/lang/Object;J)J

    move-result-wide v6

    invoke-interface {p2, v5, v6, v7}, Lcom/google/protobuf/x0;->p(IJ)V

    goto/16 :goto_3

    .line 159
    :pswitch_35
    invoke-direct {p0, p1, v3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 160
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->y(Ljava/lang/Object;J)I

    move-result v4

    invoke-interface {p2, v5, v4}, Lcom/google/protobuf/x0;->N(II)V

    goto/16 :goto_3

    .line 161
    :pswitch_36
    invoke-direct {p0, p1, v3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 162
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->K(Ljava/lang/Object;J)J

    move-result-wide v6

    invoke-interface {p2, v5, v6, v7}, Lcom/google/protobuf/x0;->l(IJ)V

    goto/16 :goto_3

    .line 163
    :pswitch_37
    invoke-direct {p0, p1, v3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 164
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->y(Ljava/lang/Object;J)I

    move-result v4

    invoke-interface {p2, v5, v4}, Lcom/google/protobuf/x0;->B(II)V

    goto/16 :goto_3

    .line 165
    :pswitch_38
    invoke-direct {p0, p1, v3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 166
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->y(Ljava/lang/Object;J)I

    move-result v4

    invoke-interface {p2, v5, v4}, Lcom/google/protobuf/x0;->K(II)V

    goto/16 :goto_3

    .line 167
    :pswitch_39
    invoke-direct {p0, p1, v3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 168
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->y(Ljava/lang/Object;J)I

    move-result v4

    invoke-interface {p2, v5, v4}, Lcom/google/protobuf/x0;->s(II)V

    goto/16 :goto_3

    .line 169
    :pswitch_3a
    invoke-direct {p0, p1, v3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 170
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/protobuf/h;

    .line 171
    invoke-interface {p2, v5, v4}, Lcom/google/protobuf/x0;->j(ILcom/google/protobuf/h;)V

    goto/16 :goto_3

    .line 172
    :pswitch_3b
    invoke-direct {p0, p1, v3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 173
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    .line 174
    invoke-direct {p0, v3}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v6

    invoke-interface {p2, v5, v4, v6}, Lcom/google/protobuf/x0;->w(ILjava/lang/Object;Lcom/google/protobuf/j0;)V

    goto/16 :goto_3

    .line 175
    :pswitch_3c
    invoke-direct {p0, p1, v3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 176
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    invoke-direct {p0, v5, v4, p2}, Lcom/google/protobuf/W;->y0(ILjava/lang/Object;Lcom/google/protobuf/x0;)V

    goto/16 :goto_3

    .line 177
    :pswitch_3d
    invoke-direct {p0, p1, v3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 178
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->l(Ljava/lang/Object;J)Z

    move-result v4

    invoke-interface {p2, v5, v4}, Lcom/google/protobuf/x0;->A(IZ)V

    goto/16 :goto_3

    .line 179
    :pswitch_3e
    invoke-direct {p0, p1, v3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 180
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->y(Ljava/lang/Object;J)I

    move-result v4

    invoke-interface {p2, v5, v4}, Lcom/google/protobuf/x0;->d(II)V

    goto :goto_3

    .line 181
    :pswitch_3f
    invoke-direct {p0, p1, v3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 182
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->K(Ljava/lang/Object;J)J

    move-result-wide v6

    invoke-interface {p2, v5, v6, v7}, Lcom/google/protobuf/x0;->x(IJ)V

    goto :goto_3

    .line 183
    :pswitch_40
    invoke-direct {p0, p1, v3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 184
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->y(Ljava/lang/Object;J)I

    move-result v4

    invoke-interface {p2, v5, v4}, Lcom/google/protobuf/x0;->k(II)V

    goto :goto_3

    .line 185
    :pswitch_41
    invoke-direct {p0, p1, v3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 186
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->K(Ljava/lang/Object;J)J

    move-result-wide v6

    invoke-interface {p2, v5, v6, v7}, Lcom/google/protobuf/x0;->g(IJ)V

    goto :goto_3

    .line 187
    :pswitch_42
    invoke-direct {p0, p1, v3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 188
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->K(Ljava/lang/Object;J)J

    move-result-wide v6

    invoke-interface {p2, v5, v6, v7}, Lcom/google/protobuf/x0;->z(IJ)V

    goto :goto_3

    .line 189
    :pswitch_43
    invoke-direct {p0, p1, v3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 190
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->s(Ljava/lang/Object;J)F

    move-result v4

    invoke-interface {p2, v5, v4}, Lcom/google/protobuf/x0;->H(IF)V

    goto :goto_3

    .line 191
    :pswitch_44
    invoke-direct {p0, p1, v3}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 192
    invoke-static {v4}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/W;->o(Ljava/lang/Object;J)D

    move-result-wide v6

    invoke-interface {p2, v5, v6, v7}, Lcom/google/protobuf/x0;->t(ID)V

    :cond_3
    :goto_3
    add-int/lit8 v3, v3, -0x3

    goto/16 :goto_1

    :cond_4
    :goto_4
    if-eqz v2, :cond_6

    .line 193
    iget-object p1, p0, Lcom/google/protobuf/W;->p:Lcom/google/protobuf/q;

    invoke-virtual {p1, p2, v2}, Lcom/google/protobuf/q;->j(Lcom/google/protobuf/x0;Ljava/util/Map$Entry;)V

    .line 194
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map$Entry;

    move-object v2, p1

    goto :goto_4

    :cond_5
    move-object v2, v1

    goto :goto_4

    :cond_6
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private x(Lcom/google/protobuf/q0;Ljava/lang/Object;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<UT:",
            "Ljava/lang/Object;",
            "UB:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/q0<",
            "TUT;TUB;>;TT;)I"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2}, Lcom/google/protobuf/q0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/q0;->h(Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private x0(Lcom/google/protobuf/x0;ILjava/lang/Object;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/x0;",
            "I",
            "Ljava/lang/Object;",
            "I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 4
    .line 5
    invoke-direct {p0, p4}, Lcom/google/protobuf/W;->u(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p4

    .line 9
    invoke-interface {v0, p4}, Lcom/google/protobuf/N;->b(Ljava/lang/Object;)Lcom/google/protobuf/L$a;

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 13
    .line 14
    invoke-interface {p0, p3}, Lcom/google/protobuf/N;->e(Ljava/lang/Object;)Ljava/util/Map;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 p3, 0x0

    .line 19
    invoke-interface {p1, p2, p3, p0}, Lcom/google/protobuf/x0;->G(ILcom/google/protobuf/L$a;Ljava/util/Map;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method private static y(Ljava/lang/Object;J)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)I"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private y0(ILjava/lang/Object;Lcom/google/protobuf/x0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    instance-of p0, p2, Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p2, Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p3, p1, p2}, Lcom/google/protobuf/x0;->f(ILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    check-cast p2, Lcom/google/protobuf/h;

    .line 12
    .line 13
    invoke-interface {p3, p1, p2}, Lcom/google/protobuf/x0;->j(ILcom/google/protobuf/h;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private static z(I)Z
    .locals 1

    .line 1
    const/high16 v0, 0x20000000

    .line 2
    .line 3
    and-int/2addr p0, v0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method private z0(Lcom/google/protobuf/q0;Ljava/lang/Object;Lcom/google/protobuf/x0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<UT:",
            "Ljava/lang/Object;",
            "UB:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/q0<",
            "TUT;TUB;>;TT;",
            "Lcom/google/protobuf/x0;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p1, p2}, Lcom/google/protobuf/q0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0, p3}, Lcom/google/protobuf/q0;->t(Ljava/lang/Object;Lcom/google/protobuf/x0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/google/protobuf/W;->m(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_2

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :goto_0
    iget-object v1, p0, Lcom/google/protobuf/W;->a:[I

    .line 8
    .line 9
    array-length v1, v1

    .line 10
    if-ge v0, v1, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, p1, p2, v0}, Lcom/google/protobuf/W;->P(Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 13
    .line 14
    .line 15
    add-int/lit8 v0, v0, 0x3

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/google/protobuf/W;->o:Lcom/google/protobuf/q0;

    .line 19
    .line 20
    invoke-static {v0, p1, p2}, Lcom/google/protobuf/l0;->G(Lcom/google/protobuf/q0;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iget-boolean v0, p0, Lcom/google/protobuf/W;->f:Z

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Lcom/google/protobuf/W;->p:Lcom/google/protobuf/q;

    .line 28
    .line 29
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/l0;->E(Lcom/google/protobuf/q;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void

    .line 33
    :cond_2
    const/4 p0, 0x0

    .line 34
    throw p0
.end method

.method public b(Ljava/lang/Object;Lcom/google/protobuf/x0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/google/protobuf/x0;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-interface {p2}, Lcom/google/protobuf/x0;->y()Lcom/google/protobuf/x0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/google/protobuf/x0$a;->h:Lcom/google/protobuf/x0$a;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1, p2}, Lcom/google/protobuf/W;->w0(Ljava/lang/Object;Lcom/google/protobuf/x0;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/google/protobuf/W;->v0(Ljava/lang/Object;Lcom/google/protobuf/x0;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public c(Ljava/lang/Object;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/google/protobuf/W;->G(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_2

    .line 8
    .line 9
    :cond_0
    instance-of v0, p1, Lcom/google/protobuf/y;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    move-object v0, p1

    .line 14
    check-cast v0, Lcom/google/protobuf/y;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/google/protobuf/y;->clearMemoizedSerializedSize()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/google/protobuf/y;->clearMemoizedHashCode()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/google/protobuf/y;->markImmutable()V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Lcom/google/protobuf/W;->a:[I

    .line 26
    .line 27
    array-length v0, v0

    .line 28
    const/4 v1, 0x0

    .line 29
    :goto_0
    if-ge v1, v0, :cond_5

    .line 30
    .line 31
    invoke-direct {p0, v1}, Lcom/google/protobuf/W;->u0(I)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-static {v2}, Lcom/google/protobuf/W;->W(I)J

    .line 36
    .line 37
    .line 38
    move-result-wide v3

    .line 39
    invoke-static {v2}, Lcom/google/protobuf/W;->t0(I)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    const/16 v5, 0x9

    .line 44
    .line 45
    if-eq v2, v5, :cond_3

    .line 46
    .line 47
    const/16 v5, 0x3c

    .line 48
    .line 49
    if-eq v2, v5, :cond_2

    .line 50
    .line 51
    const/16 v5, 0x44

    .line 52
    .line 53
    if-eq v2, v5, :cond_2

    .line 54
    .line 55
    packed-switch v2, :pswitch_data_0

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :pswitch_0
    sget-object v2, Lcom/google/protobuf/W;->s:Lsun/misc/Unsafe;

    .line 60
    .line 61
    invoke-virtual {v2, p1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    if-eqz v5, :cond_4

    .line 66
    .line 67
    iget-object v6, p0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 68
    .line 69
    invoke-interface {v6, v5}, Lcom/google/protobuf/N;->f(Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    invoke-virtual {v2, p1, v3, v4, v5}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :pswitch_1
    iget-object v2, p0, Lcom/google/protobuf/W;->n:Lcom/google/protobuf/I;

    .line 78
    .line 79
    invoke-virtual {v2, p1, v3, v4}, Lcom/google/protobuf/I;->c(Ljava/lang/Object;J)V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    invoke-direct {p0, v1}, Lcom/google/protobuf/W;->V(I)I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    invoke-direct {p0, p1, v2, v1}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eqz v2, :cond_4

    .line 92
    .line 93
    invoke-direct {p0, v1}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    sget-object v5, Lcom/google/protobuf/W;->s:Lsun/misc/Unsafe;

    .line 98
    .line 99
    invoke-virtual {v5, p1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-interface {v2, v3}, Lcom/google/protobuf/j0;->c(Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_3
    :pswitch_2
    invoke-direct {p0, p1, v1}, Lcom/google/protobuf/W;->A(Ljava/lang/Object;I)Z

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    if-eqz v2, :cond_4

    .line 112
    .line 113
    invoke-direct {p0, v1}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    sget-object v5, Lcom/google/protobuf/W;->s:Lsun/misc/Unsafe;

    .line 118
    .line 119
    invoke-virtual {v5, p1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-interface {v2, v3}, Lcom/google/protobuf/j0;->c(Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    :cond_4
    :goto_1
    add-int/lit8 v1, v1, 0x3

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_5
    iget-object v0, p0, Lcom/google/protobuf/W;->o:Lcom/google/protobuf/q0;

    .line 130
    .line 131
    invoke-virtual {v0, p1}, Lcom/google/protobuf/q0;->j(Ljava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    iget-boolean v0, p0, Lcom/google/protobuf/W;->f:Z

    .line 135
    .line 136
    if-eqz v0, :cond_6

    .line 137
    .line 138
    iget-object p0, p0, Lcom/google/protobuf/W;->p:Lcom/google/protobuf/q;

    .line 139
    .line 140
    invoke-virtual {p0, p1}, Lcom/google/protobuf/q;->f(Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    :cond_6
    :goto_2
    return-void

    .line 144
    nop

    .line 145
    :pswitch_data_0
    .packed-switch 0x11
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final d(Ljava/lang/Object;)Z
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    const v0, 0xfffff

    .line 2
    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    move v3, v0

    .line 6
    move v2, v1

    .line 7
    move v4, v2

    .line 8
    :goto_0
    iget v5, p0, Lcom/google/protobuf/W;->k:I

    .line 9
    .line 10
    const/4 v6, 0x1

    .line 11
    if-ge v2, v5, :cond_8

    .line 12
    .line 13
    iget-object v5, p0, Lcom/google/protobuf/W;->j:[I

    .line 14
    .line 15
    aget v9, v5, v2

    .line 16
    .line 17
    invoke-direct {p0, v9}, Lcom/google/protobuf/W;->V(I)I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    invoke-direct {p0, v9}, Lcom/google/protobuf/W;->u0(I)I

    .line 22
    .line 23
    .line 24
    move-result v13

    .line 25
    iget-object v7, p0, Lcom/google/protobuf/W;->a:[I

    .line 26
    .line 27
    add-int/lit8 v8, v9, 0x2

    .line 28
    .line 29
    aget v7, v7, v8

    .line 30
    .line 31
    and-int v8, v7, v0

    .line 32
    .line 33
    ushr-int/lit8 v7, v7, 0x14

    .line 34
    .line 35
    shl-int v12, v6, v7

    .line 36
    .line 37
    if-eq v8, v3, :cond_1

    .line 38
    .line 39
    if-eq v8, v0, :cond_0

    .line 40
    .line 41
    sget-object v3, Lcom/google/protobuf/W;->s:Lsun/misc/Unsafe;

    .line 42
    .line 43
    int-to-long v6, v8

    .line 44
    invoke-virtual {v3, p1, v6, v7}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    :cond_0
    move v11, v4

    .line 49
    move v10, v8

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    move v10, v3

    .line 52
    move v11, v4

    .line 53
    :goto_1
    invoke-static {v13}, Lcom/google/protobuf/W;->J(I)Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    move-object v7, p0

    .line 58
    move-object v8, p1

    .line 59
    if-eqz v3, :cond_2

    .line 60
    .line 61
    invoke-direct/range {v7 .. v12}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_2

    .line 66
    .line 67
    return v1

    .line 68
    :cond_2
    invoke-static {v13}, Lcom/google/protobuf/W;->t0(I)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    const/16 p1, 0x9

    .line 73
    .line 74
    if-eq p0, p1, :cond_6

    .line 75
    .line 76
    const/16 p1, 0x11

    .line 77
    .line 78
    if-eq p0, p1, :cond_6

    .line 79
    .line 80
    const/16 p1, 0x1b

    .line 81
    .line 82
    if-eq p0, p1, :cond_5

    .line 83
    .line 84
    const/16 p1, 0x3c

    .line 85
    .line 86
    if-eq p0, p1, :cond_4

    .line 87
    .line 88
    const/16 p1, 0x44

    .line 89
    .line 90
    if-eq p0, p1, :cond_4

    .line 91
    .line 92
    const/16 p1, 0x31

    .line 93
    .line 94
    if-eq p0, p1, :cond_5

    .line 95
    .line 96
    const/16 p1, 0x32

    .line 97
    .line 98
    if-eq p0, p1, :cond_3

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_3
    invoke-direct {v7, v8, v13, v9}, Lcom/google/protobuf/W;->F(Ljava/lang/Object;II)Z

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    if-nez p0, :cond_7

    .line 106
    .line 107
    return v1

    .line 108
    :cond_4
    invoke-direct {v7, v8, v5, v9}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    if-eqz p0, :cond_7

    .line 113
    .line 114
    invoke-direct {v7, v9}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-static {v8, v13, p0}, Lcom/google/protobuf/W;->C(Ljava/lang/Object;ILcom/google/protobuf/j0;)Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    if-nez p0, :cond_7

    .line 123
    .line 124
    return v1

    .line 125
    :cond_5
    invoke-direct {v7, v8, v13, v9}, Lcom/google/protobuf/W;->E(Ljava/lang/Object;II)Z

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    if-nez p0, :cond_7

    .line 130
    .line 131
    return v1

    .line 132
    :cond_6
    invoke-direct/range {v7 .. v12}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    if-eqz p0, :cond_7

    .line 137
    .line 138
    invoke-direct {v7, v9}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-static {v8, v13, p0}, Lcom/google/protobuf/W;->C(Ljava/lang/Object;ILcom/google/protobuf/j0;)Z

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    if-nez p0, :cond_7

    .line 147
    .line 148
    return v1

    .line 149
    :cond_7
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 150
    .line 151
    move-object p0, v7

    .line 152
    move-object p1, v8

    .line 153
    move v3, v10

    .line 154
    move v4, v11

    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :cond_8
    move-object v7, p0

    .line 158
    move-object v8, p1

    .line 159
    iget-boolean p0, v7, Lcom/google/protobuf/W;->f:Z

    .line 160
    .line 161
    if-eqz p0, :cond_9

    .line 162
    .line 163
    iget-object p0, v7, Lcom/google/protobuf/W;->p:Lcom/google/protobuf/q;

    .line 164
    .line 165
    invoke-virtual {p0, v8}, Lcom/google/protobuf/q;->c(Ljava/lang/Object;)Lcom/google/protobuf/u;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-virtual {p0}, Lcom/google/protobuf/u;->o()Z

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    if-nez p0, :cond_9

    .line 174
    .line 175
    return v1

    .line 176
    :cond_9
    return v6
.end method

.method d0(Ljava/lang/Object;[BIIILcom/google/protobuf/e$b;)I
    .locals 26
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[BIII",
            "Lcom/google/protobuf/e$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v4, p4

    move/from16 v15, p5

    move-object/from16 v7, p6

    .line 1
    invoke-static {v1}, Lcom/google/protobuf/W;->m(Ljava/lang/Object;)V

    .line 2
    sget-object v9, Lcom/google/protobuf/W;->s:Lsun/misc/Unsafe;

    const/16 v16, 0x0

    const/4 v11, -0x1

    move/from16 v3, p3

    move v5, v11

    move/from16 v6, v16

    move v12, v6

    move v13, v12

    const v8, 0xfffff

    :goto_0
    if-ge v3, v4, :cond_20

    add-int/lit8 v13, v3, 0x1

    .line 3
    aget-byte v3, v2, v3

    if-gez v3, :cond_0

    .line 4
    invoke-static {v3, v2, v13, v7}, Lcom/google/protobuf/e;->H(I[BILcom/google/protobuf/e$b;)I

    move-result v13

    .line 5
    iget v3, v7, Lcom/google/protobuf/e$b;->a:I

    :cond_0
    move/from16 v25, v13

    move v13, v3

    move/from16 v3, v25

    ushr-int/lit8 v14, v13, 0x3

    and-int/lit8 v7, v13, 0x7

    const v17, 0xfffff

    const/4 v10, 0x3

    if-le v14, v5, :cond_1

    .line 6
    div-int/2addr v6, v10

    invoke-direct {v0, v14, v6}, Lcom/google/protobuf/W;->h0(II)I

    move-result v5

    goto :goto_1

    .line 7
    :cond_1
    invoke-direct {v0, v14}, Lcom/google/protobuf/W;->g0(I)I

    move-result v5

    :goto_1
    if-ne v5, v11, :cond_2

    move v2, v3

    move/from16 v17, v8

    move-object/from16 v24, v9

    move/from16 v19, v11

    move/from16 v21, v14

    move/from16 v8, v16

    move-object v9, v0

    move v0, v13

    :goto_2
    move-object/from16 v13, p6

    goto/16 :goto_1a

    .line 8
    :cond_2
    iget-object v6, v0, Lcom/google/protobuf/W;->a:[I

    add-int/lit8 v18, v5, 0x1

    aget v6, v6, v18

    move/from16 v18, v11

    .line 9
    invoke-static {v6}, Lcom/google/protobuf/W;->t0(I)I

    move-result v11

    move/from16 v19, v3

    .line 10
    invoke-static {v6}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v3

    const/16 v10, 0x11

    if-gt v11, v10, :cond_13

    .line 11
    iget-object v10, v0, Lcom/google/protobuf/W;->a:[I

    add-int/lit8 v20, v5, 0x2

    aget v10, v10, v20

    ushr-int/lit8 v20, v10, 0x14

    const/4 v2, 0x1

    shl-int v20, v2, v20

    and-int v10, v10, v17

    if-eq v10, v8, :cond_5

    move/from16 v21, v14

    move/from16 v14, v17

    move-wide/from16 v22, v3

    if-eq v8, v14, :cond_3

    int-to-long v2, v8

    .line 12
    invoke-virtual {v9, v1, v2, v3, v12}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    :cond_3
    if-ne v10, v14, :cond_4

    move/from16 v2, v16

    goto :goto_3

    :cond_4
    int-to-long v2, v10

    .line 13
    invoke-virtual {v9, v1, v2, v3}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v2

    :goto_3
    move v12, v2

    goto :goto_4

    :cond_5
    move-wide/from16 v22, v3

    move/from16 v21, v14

    move/from16 v14, v17

    move v10, v8

    :goto_4
    const/4 v2, 0x5

    packed-switch v11, :pswitch_data_0

    move-object/from16 v8, p6

    move v11, v5

    :goto_5
    move-object v3, v9

    move/from16 v14, v19

    move-object/from16 v9, p2

    goto/16 :goto_14

    :pswitch_0
    const/4 v2, 0x3

    if-ne v7, v2, :cond_6

    .line 14
    invoke-direct {v0, v1, v5}, Lcom/google/protobuf/W;->Q(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    shl-int/lit8 v3, v21, 0x3

    or-int/lit8 v7, v3, 0x4

    .line 15
    invoke-direct {v0, v5}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v3

    move-object/from16 v4, p2

    move/from16 v6, p4

    move-object/from16 v8, p6

    move v11, v5

    move/from16 v5, v19

    .line 16
    invoke-static/range {v2 .. v8}, Lcom/google/protobuf/e;->N(Ljava/lang/Object;Lcom/google/protobuf/j0;[BIIILcom/google/protobuf/e$b;)I

    move-result v3

    move-object/from16 v25, v4

    move-object v4, v2

    move-object v2, v8

    move-object/from16 v8, v25

    .line 17
    invoke-direct {v0, v1, v11, v4}, Lcom/google/protobuf/W;->r0(Ljava/lang/Object;ILjava/lang/Object;)V

    or-int v12, v12, v20

    move/from16 v4, p4

    move-object v7, v2

    move-object v2, v8

    :goto_6
    move v8, v10

    move v6, v11

    move/from16 v11, v18

    move/from16 v5, v21

    goto/16 :goto_0

    :cond_6
    move v11, v5

    move-object/from16 v8, p6

    goto :goto_5

    :pswitch_1
    move-object/from16 v8, p2

    move-object/from16 v2, p6

    move v11, v5

    move/from16 v3, v19

    if-nez v7, :cond_7

    .line 18
    invoke-static {v8, v3, v2}, Lcom/google/protobuf/e;->L([BILcom/google/protobuf/e$b;)I

    move-result v7

    .line 19
    iget-wide v3, v2, Lcom/google/protobuf/e$b;->b:J

    .line 20
    invoke-static {v3, v4}, Lcom/google/protobuf/i;->c(J)J

    move-result-wide v5

    move-object v3, v2

    move-object v2, v1

    move-object v1, v9

    move-object v9, v3

    move-wide/from16 v3, v22

    .line 21
    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    move-object/from16 v25, v2

    move-object v2, v1

    move-object/from16 v1, v25

    or-int v12, v12, v20

    move/from16 v4, p4

    move v3, v7

    :goto_7
    move-object v7, v9

    move v6, v11

    move/from16 v11, v18

    move/from16 v5, v21

    move-object v9, v2

    move-object v2, v8

    :goto_8
    move v8, v10

    goto/16 :goto_0

    :cond_7
    move-object/from16 v25, v9

    move-object v9, v2

    move-object/from16 v2, v25

    :cond_8
    move-object v14, v9

    move-object v9, v8

    move-object v8, v14

    move v14, v3

    :cond_9
    :goto_9
    move-object v3, v2

    goto/16 :goto_14

    :pswitch_2
    move-object/from16 v8, p2

    move v11, v5

    move-object v2, v9

    move/from16 v3, v19

    move-wide/from16 v4, v22

    move-object/from16 v9, p6

    if-nez v7, :cond_8

    .line 22
    invoke-static {v8, v3, v9}, Lcom/google/protobuf/e;->I([BILcom/google/protobuf/e$b;)I

    move-result v3

    .line 23
    iget v6, v9, Lcom/google/protobuf/e$b;->a:I

    .line 24
    invoke-static {v6}, Lcom/google/protobuf/i;->b(I)I

    move-result v6

    .line 25
    invoke-virtual {v2, v1, v4, v5, v6}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    :goto_a
    or-int v12, v12, v20

    :goto_b
    move/from16 v4, p4

    goto :goto_7

    :pswitch_3
    move-object/from16 v8, p2

    move v11, v5

    move-object v2, v9

    move/from16 v3, v19

    move-wide/from16 v4, v22

    move-object/from16 v9, p6

    if-nez v7, :cond_8

    .line 26
    invoke-static {v8, v3, v9}, Lcom/google/protobuf/e;->I([BILcom/google/protobuf/e$b;)I

    move-result v3

    .line 27
    iget v7, v9, Lcom/google/protobuf/e$b;->a:I

    .line 28
    invoke-direct {v0, v11}, Lcom/google/protobuf/W;->t(I)Lcom/google/protobuf/A$e;

    move-result-object v14

    .line 29
    invoke-static {v6}, Lcom/google/protobuf/W;->D(I)Z

    move-result v6

    if-eqz v6, :cond_b

    if-eqz v14, :cond_b

    .line 30
    invoke-interface {v14, v7}, Lcom/google/protobuf/A$e;->isInRange(I)Z

    move-result v6

    if-eqz v6, :cond_a

    goto :goto_c

    .line 31
    :cond_a
    invoke-static {v1}, Lcom/google/protobuf/W;->w(Ljava/lang/Object;)Lcom/google/protobuf/r0;

    move-result-object v4

    int-to-long v5, v7

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v4, v13, v5}, Lcom/google/protobuf/r0;->r(ILjava/lang/Object;)V

    goto :goto_b

    .line 32
    :cond_b
    :goto_c
    invoke-virtual {v2, v1, v4, v5, v7}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_a

    :pswitch_4
    move-object/from16 v8, p2

    move v11, v5

    move-object v2, v9

    move/from16 v3, v19

    move-wide/from16 v4, v22

    const/4 v14, 0x2

    move-object/from16 v9, p6

    if-ne v7, v14, :cond_8

    .line 33
    invoke-static {v8, v3, v9}, Lcom/google/protobuf/e;->b([BILcom/google/protobuf/e$b;)I

    move-result v3

    .line 34
    iget-object v6, v9, Lcom/google/protobuf/e$b;->c:Ljava/lang/Object;

    invoke-virtual {v2, v1, v4, v5, v6}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_a

    :pswitch_5
    move-object/from16 v8, p2

    move v11, v5

    move-object v2, v9

    move/from16 v3, v19

    const/4 v14, 0x2

    move-object/from16 v9, p6

    if-ne v7, v14, :cond_c

    move-object v4, v1

    .line 35
    invoke-direct {v0, v4, v11}, Lcom/google/protobuf/W;->Q(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    move-object v5, v2

    .line 36
    invoke-direct {v0, v11}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v2

    move-object v6, v4

    move v4, v3

    move-object v3, v8

    move-object v8, v6

    move-object v6, v9

    move-object v9, v5

    move/from16 v5, p4

    .line 37
    invoke-static/range {v1 .. v6}, Lcom/google/protobuf/e;->O(Ljava/lang/Object;Lcom/google/protobuf/j0;[BIILcom/google/protobuf/e$b;)I

    move-result v2

    move-object v4, v1

    move-object v1, v3

    move-object v3, v6

    .line 38
    invoke-direct {v0, v8, v11, v4}, Lcom/google/protobuf/W;->r0(Ljava/lang/Object;ILjava/lang/Object;)V

    :goto_d
    or-int v12, v12, v20

    move/from16 v4, p4

    move-object v7, v3

    move v6, v11

    move/from16 v11, v18

    move/from16 v5, v21

    move v3, v2

    move-object v2, v1

    move-object v1, v8

    goto/16 :goto_8

    :cond_c
    move-object/from16 v25, v8

    move-object v8, v1

    move-object/from16 v1, v25

    move-object/from16 v25, v9

    move-object v9, v2

    move v2, v3

    move-object/from16 v3, v25

    :cond_d
    move-object v14, v9

    move-object v9, v1

    move-object v1, v8

    move-object v8, v3

    move-object v3, v14

    move v14, v2

    goto/16 :goto_14

    :pswitch_6
    move-object/from16 v3, p6

    move-object v8, v1

    move v11, v5

    move/from16 v2, v19

    move-wide/from16 v4, v22

    const/4 v14, 0x2

    move-object/from16 v1, p2

    if-ne v7, v14, :cond_d

    .line 39
    invoke-static {v6}, Lcom/google/protobuf/W;->z(I)Z

    move-result v6

    if-eqz v6, :cond_e

    .line 40
    invoke-static {v1, v2, v3}, Lcom/google/protobuf/e;->F([BILcom/google/protobuf/e$b;)I

    move-result v2

    goto :goto_e

    .line 41
    :cond_e
    invoke-static {v1, v2, v3}, Lcom/google/protobuf/e;->C([BILcom/google/protobuf/e$b;)I

    move-result v2

    .line 42
    :goto_e
    iget-object v6, v3, Lcom/google/protobuf/e$b;->c:Ljava/lang/Object;

    invoke-virtual {v9, v8, v4, v5, v6}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_d

    :pswitch_7
    move-object/from16 v3, p6

    move-object v8, v1

    move v11, v5

    move/from16 v2, v19

    move-wide/from16 v5, v22

    move-object/from16 v1, p2

    if-nez v7, :cond_d

    .line 43
    invoke-static {v1, v2, v3}, Lcom/google/protobuf/e;->L([BILcom/google/protobuf/e$b;)I

    move-result v2

    move-wide/from16 v22, v5

    .line 44
    iget-wide v4, v3, Lcom/google/protobuf/e$b;->b:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_f

    const/4 v4, 0x1

    :goto_f
    move-wide/from16 v5, v22

    goto :goto_10

    :cond_f
    move/from16 v4, v16

    goto :goto_f

    :goto_10
    invoke-static {v8, v5, v6, v4}, Lcom/google/protobuf/u0;->L(Ljava/lang/Object;JZ)V

    goto :goto_d

    :pswitch_8
    move-object/from16 v3, p6

    move-object v8, v1

    move v11, v5

    move/from16 v14, v19

    move-wide/from16 v5, v22

    move-object/from16 v1, p2

    if-ne v7, v2, :cond_10

    .line 45
    invoke-static {v1, v14}, Lcom/google/protobuf/e;->h([BI)I

    move-result v2

    invoke-virtual {v9, v8, v5, v6, v2}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    add-int/lit8 v2, v14, 0x4

    goto :goto_d

    :cond_10
    move-object/from16 v25, v9

    move-object v9, v1

    move-object v1, v8

    move-object v8, v3

    move-object/from16 v3, v25

    goto/16 :goto_14

    :pswitch_9
    move-object/from16 v3, p6

    move-object v8, v1

    move v11, v5

    move/from16 v14, v19

    move-wide/from16 v5, v22

    const/4 v4, 0x1

    move-object/from16 v1, p2

    if-ne v7, v4, :cond_11

    move-wide/from16 v22, v5

    .line 46
    invoke-static {v1, v14}, Lcom/google/protobuf/e;->j([BI)J

    move-result-wide v5

    move-object v2, v9

    move-object v9, v1

    move-object v1, v2

    move-object v2, v8

    move-object v8, v3

    move-wide/from16 v3, v22

    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    move-object/from16 v25, v2

    move-object v2, v1

    move-object/from16 v1, v25

    add-int/lit8 v3, v14, 0x8

    or-int v12, v12, v20

    move-object v4, v9

    move-object v9, v2

    move-object v2, v4

    :goto_11
    move/from16 v4, p4

    :goto_12
    move-object v7, v8

    goto/16 :goto_6

    :cond_11
    move-object v2, v9

    move-object v9, v1

    move-object v1, v8

    move-object v8, v3

    goto/16 :goto_9

    :pswitch_a
    move-object/from16 v8, p6

    move v11, v5

    move-object v2, v9

    move/from16 v14, v19

    move-wide/from16 v3, v22

    move-object/from16 v9, p2

    if-nez v7, :cond_9

    .line 47
    invoke-static {v9, v14, v8}, Lcom/google/protobuf/e;->I([BILcom/google/protobuf/e$b;)I

    move-result v5

    .line 48
    iget v6, v8, Lcom/google/protobuf/e$b;->a:I

    invoke-virtual {v2, v1, v3, v4, v6}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    or-int v12, v12, v20

    move-object v3, v9

    move-object v9, v2

    move-object v2, v3

    move/from16 v4, p4

    move v3, v5

    goto :goto_12

    :pswitch_b
    move-object/from16 v8, p6

    move v11, v5

    move-object v2, v9

    move/from16 v14, v19

    move-wide/from16 v3, v22

    move-object/from16 v9, p2

    if-nez v7, :cond_9

    .line 49
    invoke-static {v9, v14, v8}, Lcom/google/protobuf/e;->L([BILcom/google/protobuf/e$b;)I

    move-result v7

    .line 50
    iget-wide v5, v8, Lcom/google/protobuf/e$b;->b:J

    move-object/from16 v25, v2

    move-object v2, v1

    move-object/from16 v1, v25

    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    move-object v3, v1

    move-object v1, v2

    or-int v12, v12, v20

    move/from16 v4, p4

    move-object v2, v9

    move v6, v11

    move/from16 v11, v18

    move/from16 v5, v21

    move-object v9, v3

    move v3, v7

    move-object v7, v8

    goto/16 :goto_8

    :pswitch_c
    move-object/from16 v8, p6

    move v11, v5

    move-object v3, v9

    move/from16 v14, v19

    move-wide/from16 v4, v22

    move-object/from16 v9, p2

    if-ne v7, v2, :cond_12

    .line 51
    invoke-static {v9, v14}, Lcom/google/protobuf/e;->l([BI)F

    move-result v2

    invoke-static {v1, v4, v5, v2}, Lcom/google/protobuf/u0;->S(Ljava/lang/Object;JF)V

    add-int/lit8 v2, v14, 0x4

    :goto_13
    or-int v12, v12, v20

    move-object v4, v3

    move v3, v2

    move-object v2, v9

    move-object v9, v4

    goto :goto_11

    :pswitch_d
    move-object/from16 v8, p6

    move v11, v5

    move-object v3, v9

    move/from16 v14, v19

    move-wide/from16 v4, v22

    const/4 v2, 0x1

    move-object/from16 v9, p2

    if-ne v7, v2, :cond_12

    .line 52
    invoke-static {v9, v14}, Lcom/google/protobuf/e;->d([BI)D

    move-result-wide v6

    invoke-static {v1, v4, v5, v6, v7}, Lcom/google/protobuf/u0;->R(Ljava/lang/Object;JD)V

    add-int/lit8 v2, v14, 0x8

    goto :goto_13

    :cond_12
    :goto_14
    move-object v9, v0

    move-object/from16 v24, v3

    move/from16 v17, v10

    move v0, v13

    move v2, v14

    move/from16 v19, v18

    move-object v13, v8

    move v8, v11

    goto/16 :goto_1a

    :cond_13
    move v10, v8

    move/from16 v21, v14

    move/from16 v14, v19

    move v8, v5

    move-wide v4, v3

    move-object v3, v9

    move-object/from16 v9, p2

    const/16 v2, 0x1b

    if-ne v11, v2, :cond_17

    const/4 v2, 0x2

    if-ne v7, v2, :cond_16

    .line 53
    invoke-virtual {v3, v1, v4, v5}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/protobuf/A$j;

    .line 54
    invoke-interface {v2}, Lcom/google/protobuf/A$j;->h()Z

    move-result v6

    if-nez v6, :cond_15

    .line 55
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    if-nez v6, :cond_14

    const/16 v6, 0xa

    goto :goto_15

    :cond_14
    mul-int/lit8 v6, v6, 0x2

    .line 56
    :goto_15
    invoke-interface {v2, v6}, Lcom/google/protobuf/A$j;->a(I)Lcom/google/protobuf/A$j;

    move-result-object v2

    .line 57
    invoke-virtual {v3, v1, v4, v5, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :cond_15
    move-object v6, v2

    .line 58
    invoke-direct {v0, v8}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v1

    move-object v2, v9

    move-object v9, v3

    move-object v3, v2

    move/from16 v5, p4

    move-object/from16 v7, p6

    move v2, v13

    move v4, v14

    .line 59
    invoke-static/range {v1 .. v7}, Lcom/google/protobuf/e;->q(Lcom/google/protobuf/j0;I[BIILcom/google/protobuf/A$j;Lcom/google/protobuf/e$b;)I

    move-result v1

    move/from16 v4, p4

    move v3, v1

    move v6, v8

    move v8, v10

    move/from16 v11, v18

    move/from16 v5, v21

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    goto/16 :goto_0

    :cond_16
    move-object v9, v3

    move-object/from16 v24, v9

    move/from16 v17, v10

    move v3, v14

    move/from16 v19, v18

    move/from16 v18, v12

    goto/16 :goto_19

    :cond_17
    move-object v9, v3

    move v2, v13

    move v3, v14

    const/16 v1, 0x31

    if-gt v11, v1, :cond_19

    move-object v1, v9

    move v13, v10

    int-to-long v9, v6

    move-object/from16 v14, p6

    move-object/from16 v24, v1

    move/from16 v17, v13

    move/from16 v19, v18

    move/from16 v6, v21

    move-object/from16 v1, p1

    move/from16 v18, v12

    move-wide v12, v4

    move/from16 v4, p4

    move v5, v2

    move-object/from16 v2, p2

    .line 60
    invoke-direct/range {v0 .. v14}, Lcom/google/protobuf/W;->f0(Ljava/lang/Object;[BIIIIIIJIJLcom/google/protobuf/e$b;)I

    move-result v7

    move v13, v5

    if-eq v7, v3, :cond_18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v4, p4

    move v3, v7

    move v6, v8

    move/from16 v8, v17

    move/from16 v12, v18

    :goto_16
    move/from16 v11, v19

    move/from16 v5, v21

    move-object/from16 v9, v24

    move-object/from16 v7, p6

    goto/16 :goto_0

    :cond_18
    move-object/from16 v9, p0

    move v2, v7

    :goto_17
    move v0, v13

    move/from16 v12, v18

    goto/16 :goto_2

    :cond_19
    move v13, v2

    move-wide/from16 v22, v4

    move-object/from16 v24, v9

    move/from16 v17, v10

    move v9, v11

    move/from16 v19, v18

    move/from16 v18, v12

    const/16 v0, 0x32

    if-ne v9, v0, :cond_1c

    const/4 v14, 0x2

    if-ne v7, v14, :cond_1b

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v4, p4

    move v5, v8

    move-wide/from16 v6, v22

    move-object/from16 v8, p6

    .line 61
    invoke-direct/range {v0 .. v8}, Lcom/google/protobuf/W;->c0(Ljava/lang/Object;[BIIIJLcom/google/protobuf/e$b;)I

    move-result v6

    move v8, v5

    if-eq v6, v3, :cond_1a

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v4, p4

    move-object/from16 v7, p6

    move v3, v6

    move v6, v8

    move/from16 v8, v17

    move/from16 v12, v18

    move/from16 v11, v19

    move/from16 v5, v21

    :goto_18
    move-object/from16 v9, v24

    goto/16 :goto_0

    :cond_1a
    move-object/from16 v9, p0

    move v2, v6

    goto :goto_17

    :cond_1b
    :goto_19
    move-object/from16 v9, p0

    move v2, v3

    goto :goto_17

    :cond_1c
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v4, p4

    move v12, v8

    move v5, v13

    move-wide/from16 v10, v22

    move-object/from16 v13, p6

    move v8, v6

    move/from16 v6, v21

    .line 62
    invoke-direct/range {v0 .. v13}, Lcom/google/protobuf/W;->e0(Ljava/lang/Object;[BIIIIIIIJILcom/google/protobuf/e$b;)I

    move-result v7

    move-object v9, v0

    move v0, v5

    move v8, v12

    if-eq v7, v3, :cond_1d

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v4, p4

    move v3, v7

    move v6, v8

    move-object v7, v13

    move/from16 v8, v17

    move/from16 v12, v18

    move/from16 v11, v19

    move/from16 v5, v21

    move v13, v0

    move-object v0, v9

    goto :goto_18

    :cond_1d
    move v2, v7

    move/from16 v12, v18

    :goto_1a
    if-ne v0, v15, :cond_1e

    if-eqz v15, :cond_1e

    move-object/from16 v6, p1

    move/from16 v7, p4

    move v13, v0

    move v8, v2

    :goto_1b
    move/from16 v0, v17

    const v14, 0xfffff

    goto :goto_1e

    .line 63
    :cond_1e
    iget-boolean v1, v9, Lcom/google/protobuf/W;->f:Z

    if-eqz v1, :cond_1f

    iget-object v1, v13, Lcom/google/protobuf/e$b;->d:Lcom/google/protobuf/p;

    .line 64
    invoke-static {}, Lcom/google/protobuf/p;->b()Lcom/google/protobuf/p;

    move-result-object v3

    if-eq v1, v3, :cond_1f

    .line 65
    iget-object v5, v9, Lcom/google/protobuf/W;->e:Lcom/google/protobuf/T;

    iget-object v6, v9, Lcom/google/protobuf/W;->o:Lcom/google/protobuf/q0;

    move-object/from16 v4, p1

    move-object/from16 v1, p2

    move/from16 v3, p4

    move-object v7, v13

    invoke-static/range {v0 .. v7}, Lcom/google/protobuf/e;->g(I[BIILjava/lang/Object;Lcom/google/protobuf/T;Lcom/google/protobuf/q0;Lcom/google/protobuf/e$b;)I

    move-result v2

    move-object v6, v4

    move/from16 v7, p4

    :goto_1c
    move v3, v2

    goto :goto_1d

    :cond_1f
    move-object/from16 v6, p1

    .line 66
    invoke-static {v6}, Lcom/google/protobuf/W;->w(Ljava/lang/Object;)Lcom/google/protobuf/r0;

    move-result-object v4

    move-object/from16 v1, p2

    move/from16 v3, p4

    move-object/from16 v5, p6

    .line 67
    invoke-static/range {v0 .. v5}, Lcom/google/protobuf/e;->G(I[BIILcom/google/protobuf/r0;Lcom/google/protobuf/e$b;)I

    move-result v2

    move v7, v3

    goto :goto_1c

    :goto_1d
    move-object/from16 v2, p2

    move v13, v0

    move-object v1, v6

    move v4, v7

    move v6, v8

    move-object v0, v9

    move/from16 v8, v17

    goto/16 :goto_16

    :cond_20
    move-object v6, v1

    move v7, v4

    move/from16 v17, v8

    move-object/from16 v24, v9

    move/from16 v18, v12

    move-object v9, v0

    move v8, v3

    goto :goto_1b

    :goto_1e
    if-eq v0, v14, :cond_21

    int-to-long v0, v0

    move-object/from16 v2, v24

    .line 68
    invoke-virtual {v2, v6, v0, v1, v12}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 69
    :cond_21
    iget v0, v9, Lcom/google/protobuf/W;->k:I

    const/4 v1, 0x0

    move v10, v0

    move-object v3, v1

    :goto_1f
    iget v0, v9, Lcom/google/protobuf/W;->l:I

    if-ge v10, v0, :cond_22

    .line 70
    iget-object v0, v9, Lcom/google/protobuf/W;->j:[I

    aget v2, v0, v10

    iget-object v4, v9, Lcom/google/protobuf/W;->o:Lcom/google/protobuf/q0;

    move-object/from16 v5, p1

    move-object v1, v6

    move-object v0, v9

    .line 71
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->q(Ljava/lang/Object;ILjava/lang/Object;Lcom/google/protobuf/q0;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lcom/google/protobuf/r0;

    add-int/lit8 v10, v10, 0x1

    goto :goto_1f

    :cond_22
    move-object v1, v6

    move-object v0, v9

    if-eqz v3, :cond_23

    .line 72
    iget-object v0, v0, Lcom/google/protobuf/W;->o:Lcom/google/protobuf/q0;

    .line 73
    invoke-virtual {v0, v1, v3}, Lcom/google/protobuf/q0;->o(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_23
    if-nez v15, :cond_25

    if-ne v8, v7, :cond_24

    goto :goto_20

    .line 74
    :cond_24
    invoke-static {}, Lcom/google/protobuf/B;->h()Lcom/google/protobuf/B;

    move-result-object v0

    throw v0

    :cond_25
    if-gt v8, v7, :cond_26

    if-ne v13, v15, :cond_26

    :goto_20
    return v8

    .line 75
    :cond_26
    invoke-static {}, Lcom/google/protobuf/B;->h()Lcom/google/protobuf/B;

    move-result-object v0

    throw v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_a
        :pswitch_3
        :pswitch_8
        :pswitch_9
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public e(Ljava/lang/Object;)I
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 1
    sget-object v6, Lcom/google/protobuf/W;->s:Lsun/misc/Unsafe;

    const/4 v7, 0x0

    const v8, 0xfffff

    move v2, v7

    move v4, v2

    move v9, v4

    move v3, v8

    .line 2
    :goto_0
    iget-object v5, v0, Lcom/google/protobuf/W;->a:[I

    array-length v5, v5

    if-ge v2, v5, :cond_17

    .line 3
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->u0(I)I

    move-result v5

    .line 4
    invoke-static {v5}, Lcom/google/protobuf/W;->t0(I)I

    move-result v10

    .line 5
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->V(I)I

    move-result v11

    .line 6
    iget-object v12, v0, Lcom/google/protobuf/W;->a:[I

    add-int/lit8 v13, v2, 0x2

    aget v12, v12, v13

    and-int v13, v12, v8

    const/16 v14, 0x11

    const/4 v15, 0x1

    if-gt v10, v14, :cond_2

    if-eq v13, v3, :cond_1

    if-ne v13, v8, :cond_0

    move v4, v7

    goto :goto_1

    :cond_0
    int-to-long v3, v13

    .line 7
    invoke-virtual {v6, v1, v3, v4}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v3

    move v4, v3

    :goto_1
    move v3, v13

    :cond_1
    ushr-int/lit8 v12, v12, 0x14

    shl-int v12, v15, v12

    :goto_2
    move/from16 v16, v9

    goto :goto_3

    :cond_2
    move v12, v7

    goto :goto_2

    .line 8
    :goto_3
    invoke-static {v5}, Lcom/google/protobuf/W;->W(I)J

    move-result-wide v8

    .line 9
    sget-object v5, Lcom/google/protobuf/v;->U:Lcom/google/protobuf/v;

    .line 10
    invoke-virtual {v5}, Lcom/google/protobuf/v;->a()I

    move-result v5

    if-lt v10, v5, :cond_3

    sget-object v5, Lcom/google/protobuf/v;->h0:Lcom/google/protobuf/v;

    .line 11
    invoke-virtual {v5}, Lcom/google/protobuf/v;->a()I

    move-result v5

    if-gt v10, v5, :cond_3

    goto :goto_4

    :cond_3
    move v13, v7

    :goto_4
    const/4 v5, 0x0

    const-wide/16 v14, 0x0

    packed-switch v10, :pswitch_data_0

    goto/16 :goto_9

    .line 12
    :pswitch_0
    invoke-direct {v0, v1, v11, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 13
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/protobuf/T;

    .line 14
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v8

    .line 15
    invoke-static {v11, v5, v8}, Lcom/google/protobuf/k;->t(ILcom/google/protobuf/T;Lcom/google/protobuf/j0;)I

    move-result v5

    :goto_5
    add-int v9, v16, v5

    goto/16 :goto_a

    .line 16
    :pswitch_1
    invoke-direct {v0, v1, v11, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 17
    invoke-static {v1, v8, v9}, Lcom/google/protobuf/W;->b0(Ljava/lang/Object;J)J

    move-result-wide v8

    invoke-static {v11, v8, v9}, Lcom/google/protobuf/k;->R(IJ)I

    move-result v5

    goto :goto_5

    .line 18
    :pswitch_2
    invoke-direct {v0, v1, v11, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 19
    invoke-static {v1, v8, v9}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    move-result v5

    invoke-static {v11, v5}, Lcom/google/protobuf/k;->P(II)I

    move-result v5

    goto :goto_5

    .line 20
    :pswitch_3
    invoke-direct {v0, v1, v11, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 21
    invoke-static {v11, v14, v15}, Lcom/google/protobuf/k;->N(IJ)I

    move-result v5

    goto :goto_5

    .line 22
    :pswitch_4
    invoke-direct {v0, v1, v11, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 23
    invoke-static {v11, v7}, Lcom/google/protobuf/k;->L(II)I

    move-result v5

    goto :goto_5

    .line 24
    :pswitch_5
    invoke-direct {v0, v1, v11, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 25
    invoke-static {v1, v8, v9}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    move-result v5

    invoke-static {v11, v5}, Lcom/google/protobuf/k;->l(II)I

    move-result v5

    goto :goto_5

    .line 26
    :pswitch_6
    invoke-direct {v0, v1, v11, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 27
    invoke-static {v1, v8, v9}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    move-result v5

    invoke-static {v11, v5}, Lcom/google/protobuf/k;->W(II)I

    move-result v5

    goto :goto_5

    .line 28
    :pswitch_7
    invoke-direct {v0, v1, v11, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 29
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/protobuf/h;

    .line 30
    invoke-static {v11, v5}, Lcom/google/protobuf/k;->h(ILcom/google/protobuf/h;)I

    move-result v5

    goto :goto_5

    .line 31
    :pswitch_8
    invoke-direct {v0, v1, v11, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 32
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 33
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v8

    invoke-static {v11, v5, v8}, Lcom/google/protobuf/l0;->o(ILjava/lang/Object;Lcom/google/protobuf/j0;)I

    move-result v5

    goto :goto_5

    .line 34
    :pswitch_9
    invoke-direct {v0, v1, v11, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 35
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 36
    instance-of v8, v5, Lcom/google/protobuf/h;

    if-eqz v8, :cond_4

    .line 37
    check-cast v5, Lcom/google/protobuf/h;

    invoke-static {v11, v5}, Lcom/google/protobuf/k;->h(ILcom/google/protobuf/h;)I

    move-result v5

    goto/16 :goto_5

    .line 38
    :cond_4
    check-cast v5, Ljava/lang/String;

    invoke-static {v11, v5}, Lcom/google/protobuf/k;->T(ILjava/lang/String;)I

    move-result v5

    goto/16 :goto_5

    .line 39
    :pswitch_a
    invoke-direct {v0, v1, v11, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_16

    const/4 v5, 0x1

    .line 40
    invoke-static {v11, v5}, Lcom/google/protobuf/k;->e(IZ)I

    move-result v5

    goto/16 :goto_5

    .line 41
    :pswitch_b
    invoke-direct {v0, v1, v11, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 42
    invoke-static {v11, v7}, Lcom/google/protobuf/k;->n(II)I

    move-result v5

    goto/16 :goto_5

    .line 43
    :pswitch_c
    invoke-direct {v0, v1, v11, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 44
    invoke-static {v11, v14, v15}, Lcom/google/protobuf/k;->p(IJ)I

    move-result v5

    goto/16 :goto_5

    .line 45
    :pswitch_d
    invoke-direct {v0, v1, v11, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 46
    invoke-static {v1, v8, v9}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    move-result v5

    invoke-static {v11, v5}, Lcom/google/protobuf/k;->w(II)I

    move-result v5

    goto/16 :goto_5

    .line 47
    :pswitch_e
    invoke-direct {v0, v1, v11, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 48
    invoke-static {v1, v8, v9}, Lcom/google/protobuf/W;->b0(Ljava/lang/Object;J)J

    move-result-wide v8

    invoke-static {v11, v8, v9}, Lcom/google/protobuf/k;->Y(IJ)I

    move-result v5

    goto/16 :goto_5

    .line 49
    :pswitch_f
    invoke-direct {v0, v1, v11, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 50
    invoke-static {v1, v8, v9}, Lcom/google/protobuf/W;->b0(Ljava/lang/Object;J)J

    move-result-wide v8

    invoke-static {v11, v8, v9}, Lcom/google/protobuf/k;->y(IJ)I

    move-result v5

    goto/16 :goto_5

    .line 51
    :pswitch_10
    invoke-direct {v0, v1, v11, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v8

    if-eqz v8, :cond_16

    .line 52
    invoke-static {v11, v5}, Lcom/google/protobuf/k;->r(IF)I

    move-result v5

    goto/16 :goto_5

    .line 53
    :pswitch_11
    invoke-direct {v0, v1, v11, v2}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_16

    const-wide/16 v8, 0x0

    .line 54
    invoke-static {v11, v8, v9}, Lcom/google/protobuf/k;->j(ID)I

    move-result v5

    goto/16 :goto_5

    .line 55
    :pswitch_12
    iget-object v5, v0, Lcom/google/protobuf/W;->q:Lcom/google/protobuf/N;

    .line 56
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v8

    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->u(I)Ljava/lang/Object;

    move-result-object v9

    .line 57
    invoke-interface {v5, v11, v8, v9}, Lcom/google/protobuf/N;->g(ILjava/lang/Object;Ljava/lang/Object;)I

    move-result v5

    goto/16 :goto_5

    .line 58
    :pswitch_13
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 59
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v8

    .line 60
    invoke-static {v11, v5, v8}, Lcom/google/protobuf/l0;->j(ILjava/util/List;Lcom/google/protobuf/j0;)I

    move-result v5

    goto/16 :goto_5

    .line 61
    :pswitch_14
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 62
    invoke-static {v5}, Lcom/google/protobuf/l0;->t(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_16

    .line 63
    iget-boolean v8, v0, Lcom/google/protobuf/W;->i:Z

    if-eqz v8, :cond_5

    int-to-long v8, v13

    .line 64
    invoke-virtual {v6, v1, v8, v9, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 65
    :cond_5
    invoke-static {v11}, Lcom/google/protobuf/k;->V(I)I

    move-result v8

    .line 66
    invoke-static {v5}, Lcom/google/protobuf/k;->X(I)I

    move-result v9

    :goto_6
    add-int/2addr v8, v9

    add-int/2addr v8, v5

    add-int v9, v16, v8

    goto/16 :goto_a

    .line 67
    :pswitch_15
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 68
    invoke-static {v5}, Lcom/google/protobuf/l0;->r(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_16

    .line 69
    iget-boolean v8, v0, Lcom/google/protobuf/W;->i:Z

    if-eqz v8, :cond_6

    int-to-long v8, v13

    .line 70
    invoke-virtual {v6, v1, v8, v9, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 71
    :cond_6
    invoke-static {v11}, Lcom/google/protobuf/k;->V(I)I

    move-result v8

    .line 72
    invoke-static {v5}, Lcom/google/protobuf/k;->X(I)I

    move-result v9

    goto :goto_6

    .line 73
    :pswitch_16
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 74
    invoke-static {v5}, Lcom/google/protobuf/l0;->i(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_16

    .line 75
    iget-boolean v8, v0, Lcom/google/protobuf/W;->i:Z

    if-eqz v8, :cond_7

    int-to-long v8, v13

    .line 76
    invoke-virtual {v6, v1, v8, v9, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 77
    :cond_7
    invoke-static {v11}, Lcom/google/protobuf/k;->V(I)I

    move-result v8

    .line 78
    invoke-static {v5}, Lcom/google/protobuf/k;->X(I)I

    move-result v9

    goto :goto_6

    .line 79
    :pswitch_17
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 80
    invoke-static {v5}, Lcom/google/protobuf/l0;->g(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_16

    .line 81
    iget-boolean v8, v0, Lcom/google/protobuf/W;->i:Z

    if-eqz v8, :cond_8

    int-to-long v8, v13

    .line 82
    invoke-virtual {v6, v1, v8, v9, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 83
    :cond_8
    invoke-static {v11}, Lcom/google/protobuf/k;->V(I)I

    move-result v8

    .line 84
    invoke-static {v5}, Lcom/google/protobuf/k;->X(I)I

    move-result v9

    goto :goto_6

    .line 85
    :pswitch_18
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 86
    invoke-static {v5}, Lcom/google/protobuf/l0;->e(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_16

    .line 87
    iget-boolean v8, v0, Lcom/google/protobuf/W;->i:Z

    if-eqz v8, :cond_9

    int-to-long v8, v13

    .line 88
    invoke-virtual {v6, v1, v8, v9, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 89
    :cond_9
    invoke-static {v11}, Lcom/google/protobuf/k;->V(I)I

    move-result v8

    .line 90
    invoke-static {v5}, Lcom/google/protobuf/k;->X(I)I

    move-result v9

    goto :goto_6

    .line 91
    :pswitch_19
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 92
    invoke-static {v5}, Lcom/google/protobuf/l0;->w(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_16

    .line 93
    iget-boolean v8, v0, Lcom/google/protobuf/W;->i:Z

    if-eqz v8, :cond_a

    int-to-long v8, v13

    .line 94
    invoke-virtual {v6, v1, v8, v9, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 95
    :cond_a
    invoke-static {v11}, Lcom/google/protobuf/k;->V(I)I

    move-result v8

    .line 96
    invoke-static {v5}, Lcom/google/protobuf/k;->X(I)I

    move-result v9

    goto/16 :goto_6

    .line 97
    :pswitch_1a
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 98
    invoke-static {v5}, Lcom/google/protobuf/l0;->b(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_16

    .line 99
    iget-boolean v8, v0, Lcom/google/protobuf/W;->i:Z

    if-eqz v8, :cond_b

    int-to-long v8, v13

    .line 100
    invoke-virtual {v6, v1, v8, v9, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 101
    :cond_b
    invoke-static {v11}, Lcom/google/protobuf/k;->V(I)I

    move-result v8

    .line 102
    invoke-static {v5}, Lcom/google/protobuf/k;->X(I)I

    move-result v9

    goto/16 :goto_6

    .line 103
    :pswitch_1b
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 104
    invoke-static {v5}, Lcom/google/protobuf/l0;->g(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_16

    .line 105
    iget-boolean v8, v0, Lcom/google/protobuf/W;->i:Z

    if-eqz v8, :cond_c

    int-to-long v8, v13

    .line 106
    invoke-virtual {v6, v1, v8, v9, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 107
    :cond_c
    invoke-static {v11}, Lcom/google/protobuf/k;->V(I)I

    move-result v8

    .line 108
    invoke-static {v5}, Lcom/google/protobuf/k;->X(I)I

    move-result v9

    goto/16 :goto_6

    .line 109
    :pswitch_1c
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 110
    invoke-static {v5}, Lcom/google/protobuf/l0;->i(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_16

    .line 111
    iget-boolean v8, v0, Lcom/google/protobuf/W;->i:Z

    if-eqz v8, :cond_d

    int-to-long v8, v13

    .line 112
    invoke-virtual {v6, v1, v8, v9, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 113
    :cond_d
    invoke-static {v11}, Lcom/google/protobuf/k;->V(I)I

    move-result v8

    .line 114
    invoke-static {v5}, Lcom/google/protobuf/k;->X(I)I

    move-result v9

    goto/16 :goto_6

    .line 115
    :pswitch_1d
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 116
    invoke-static {v5}, Lcom/google/protobuf/l0;->l(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_16

    .line 117
    iget-boolean v8, v0, Lcom/google/protobuf/W;->i:Z

    if-eqz v8, :cond_e

    int-to-long v8, v13

    .line 118
    invoke-virtual {v6, v1, v8, v9, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 119
    :cond_e
    invoke-static {v11}, Lcom/google/protobuf/k;->V(I)I

    move-result v8

    .line 120
    invoke-static {v5}, Lcom/google/protobuf/k;->X(I)I

    move-result v9

    goto/16 :goto_6

    .line 121
    :pswitch_1e
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 122
    invoke-static {v5}, Lcom/google/protobuf/l0;->y(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_16

    .line 123
    iget-boolean v8, v0, Lcom/google/protobuf/W;->i:Z

    if-eqz v8, :cond_f

    int-to-long v8, v13

    .line 124
    invoke-virtual {v6, v1, v8, v9, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 125
    :cond_f
    invoke-static {v11}, Lcom/google/protobuf/k;->V(I)I

    move-result v8

    .line 126
    invoke-static {v5}, Lcom/google/protobuf/k;->X(I)I

    move-result v9

    goto/16 :goto_6

    .line 127
    :pswitch_1f
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 128
    invoke-static {v5}, Lcom/google/protobuf/l0;->n(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_16

    .line 129
    iget-boolean v8, v0, Lcom/google/protobuf/W;->i:Z

    if-eqz v8, :cond_10

    int-to-long v8, v13

    .line 130
    invoke-virtual {v6, v1, v8, v9, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 131
    :cond_10
    invoke-static {v11}, Lcom/google/protobuf/k;->V(I)I

    move-result v8

    .line 132
    invoke-static {v5}, Lcom/google/protobuf/k;->X(I)I

    move-result v9

    goto/16 :goto_6

    .line 133
    :pswitch_20
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 134
    invoke-static {v5}, Lcom/google/protobuf/l0;->g(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_16

    .line 135
    iget-boolean v8, v0, Lcom/google/protobuf/W;->i:Z

    if-eqz v8, :cond_11

    int-to-long v8, v13

    .line 136
    invoke-virtual {v6, v1, v8, v9, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 137
    :cond_11
    invoke-static {v11}, Lcom/google/protobuf/k;->V(I)I

    move-result v8

    .line 138
    invoke-static {v5}, Lcom/google/protobuf/k;->X(I)I

    move-result v9

    goto/16 :goto_6

    .line 139
    :pswitch_21
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 140
    invoke-static {v5}, Lcom/google/protobuf/l0;->i(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_16

    .line 141
    iget-boolean v8, v0, Lcom/google/protobuf/W;->i:Z

    if-eqz v8, :cond_12

    int-to-long v8, v13

    .line 142
    invoke-virtual {v6, v1, v8, v9, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 143
    :cond_12
    invoke-static {v11}, Lcom/google/protobuf/k;->V(I)I

    move-result v8

    .line 144
    invoke-static {v5}, Lcom/google/protobuf/k;->X(I)I

    move-result v9

    goto/16 :goto_6

    .line 145
    :pswitch_22
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 146
    invoke-static {v11, v5, v7}, Lcom/google/protobuf/l0;->s(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_5

    .line 147
    :pswitch_23
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 148
    invoke-static {v11, v5, v7}, Lcom/google/protobuf/l0;->q(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_5

    .line 149
    :pswitch_24
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 150
    invoke-static {v11, v5, v7}, Lcom/google/protobuf/l0;->h(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_5

    .line 151
    :pswitch_25
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 152
    invoke-static {v11, v5, v7}, Lcom/google/protobuf/l0;->f(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_5

    .line 153
    :pswitch_26
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 154
    invoke-static {v11, v5, v7}, Lcom/google/protobuf/l0;->d(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_5

    .line 155
    :pswitch_27
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 156
    invoke-static {v11, v5, v7}, Lcom/google/protobuf/l0;->v(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_5

    .line 157
    :pswitch_28
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 158
    invoke-static {v11, v5}, Lcom/google/protobuf/l0;->c(ILjava/util/List;)I

    move-result v5

    goto/16 :goto_5

    .line 159
    :pswitch_29
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v8

    .line 160
    invoke-static {v11, v5, v8}, Lcom/google/protobuf/l0;->p(ILjava/util/List;Lcom/google/protobuf/j0;)I

    move-result v5

    goto/16 :goto_5

    .line 161
    :pswitch_2a
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-static {v11, v5}, Lcom/google/protobuf/l0;->u(ILjava/util/List;)I

    move-result v5

    goto/16 :goto_5

    .line 162
    :pswitch_2b
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 163
    invoke-static {v11, v5, v7}, Lcom/google/protobuf/l0;->a(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_5

    .line 164
    :pswitch_2c
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 165
    invoke-static {v11, v5, v7}, Lcom/google/protobuf/l0;->f(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_5

    .line 166
    :pswitch_2d
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 167
    invoke-static {v11, v5, v7}, Lcom/google/protobuf/l0;->h(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_5

    .line 168
    :pswitch_2e
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 169
    invoke-static {v11, v5, v7}, Lcom/google/protobuf/l0;->k(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_5

    .line 170
    :pswitch_2f
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 171
    invoke-static {v11, v5, v7}, Lcom/google/protobuf/l0;->x(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_5

    .line 172
    :pswitch_30
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 173
    invoke-static {v11, v5, v7}, Lcom/google/protobuf/l0;->m(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_5

    .line 174
    :pswitch_31
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 175
    invoke-static {v11, v5, v7}, Lcom/google/protobuf/l0;->f(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_5

    .line 176
    :pswitch_32
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 177
    invoke-static {v11, v5, v7}, Lcom/google/protobuf/l0;->h(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_5

    :pswitch_33
    move v5, v12

    .line 178
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 179
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/protobuf/T;

    .line 180
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v8

    .line 181
    invoke-static {v11, v5, v8}, Lcom/google/protobuf/k;->t(ILcom/google/protobuf/T;Lcom/google/protobuf/j0;)I

    move-result v5

    goto/16 :goto_5

    :pswitch_34
    move v5, v12

    .line 182
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 183
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v8

    invoke-static {v11, v8, v9}, Lcom/google/protobuf/k;->R(IJ)I

    move-result v0

    :goto_7
    add-int v9, v16, v0

    move-object/from16 v0, p0

    goto/16 :goto_a

    :cond_13
    move-object/from16 v0, p0

    goto/16 :goto_9

    :pswitch_35
    move v5, v12

    .line 184
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 185
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v0

    invoke-static {v11, v0}, Lcom/google/protobuf/k;->P(II)I

    move-result v0

    goto :goto_7

    :pswitch_36
    move v5, v12

    .line 186
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_14

    .line 187
    invoke-static {v11, v14, v15}, Lcom/google/protobuf/k;->N(IJ)I

    move-result v0

    :goto_8
    add-int v9, v16, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    goto/16 :goto_a

    :cond_14
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    goto/16 :goto_9

    :pswitch_37
    move v5, v12

    .line 188
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_14

    .line 189
    invoke-static {v11, v7}, Lcom/google/protobuf/k;->L(II)I

    move-result v0

    goto :goto_8

    :pswitch_38
    move v5, v12

    .line 190
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 191
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v0

    invoke-static {v11, v0}, Lcom/google/protobuf/k;->l(II)I

    move-result v0

    goto :goto_7

    :pswitch_39
    move v5, v12

    .line 192
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 193
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v0

    invoke-static {v11, v0}, Lcom/google/protobuf/k;->W(II)I

    move-result v0

    goto :goto_7

    :pswitch_3a
    move v5, v12

    .line 194
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 195
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/h;

    .line 196
    invoke-static {v11, v0}, Lcom/google/protobuf/k;->h(ILcom/google/protobuf/h;)I

    move-result v0

    goto :goto_7

    :pswitch_3b
    move v5, v12

    .line 197
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 198
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 199
    invoke-direct {v0, v2}, Lcom/google/protobuf/W;->v(I)Lcom/google/protobuf/j0;

    move-result-object v8

    invoke-static {v11, v5, v8}, Lcom/google/protobuf/l0;->o(ILjava/lang/Object;Lcom/google/protobuf/j0;)I

    move-result v5

    goto/16 :goto_5

    :pswitch_3c
    move v5, v12

    .line 200
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 201
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    .line 202
    instance-of v5, v0, Lcom/google/protobuf/h;

    if-eqz v5, :cond_15

    .line 203
    check-cast v0, Lcom/google/protobuf/h;

    invoke-static {v11, v0}, Lcom/google/protobuf/k;->h(ILcom/google/protobuf/h;)I

    move-result v0

    goto/16 :goto_7

    .line 204
    :cond_15
    check-cast v0, Ljava/lang/String;

    invoke-static {v11, v0}, Lcom/google/protobuf/k;->T(ILjava/lang/String;)I

    move-result v0

    goto/16 :goto_7

    :pswitch_3d
    move v5, v12

    .line 205
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_14

    const/4 v5, 0x1

    .line 206
    invoke-static {v11, v5}, Lcom/google/protobuf/k;->e(IZ)I

    move-result v0

    goto/16 :goto_8

    :pswitch_3e
    move v5, v12

    .line 207
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_14

    .line 208
    invoke-static {v11, v7}, Lcom/google/protobuf/k;->n(II)I

    move-result v0

    goto/16 :goto_8

    :pswitch_3f
    move v5, v12

    .line 209
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_14

    .line 210
    invoke-static {v11, v14, v15}, Lcom/google/protobuf/k;->p(IJ)I

    move-result v0

    goto/16 :goto_8

    :pswitch_40
    move v5, v12

    .line 211
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 212
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v0

    invoke-static {v11, v0}, Lcom/google/protobuf/k;->w(II)I

    move-result v0

    goto/16 :goto_7

    :pswitch_41
    move v5, v12

    .line 213
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 214
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v8

    invoke-static {v11, v8, v9}, Lcom/google/protobuf/k;->Y(IJ)I

    move-result v0

    goto/16 :goto_7

    :pswitch_42
    move v5, v12

    .line 215
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 216
    invoke-virtual {v6, v1, v8, v9}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v8

    invoke-static {v11, v8, v9}, Lcom/google/protobuf/k;->y(IJ)I

    move-result v0

    goto/16 :goto_7

    :pswitch_43
    move v8, v5

    move v5, v12

    .line 217
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_14

    .line 218
    invoke-static {v11, v8}, Lcom/google/protobuf/k;->r(IF)I

    move-result v0

    goto/16 :goto_8

    :pswitch_44
    move v5, v12

    .line 219
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->B(Ljava/lang/Object;IIII)Z

    move-result v5

    if-eqz v5, :cond_16

    const-wide/16 v8, 0x0

    .line 220
    invoke-static {v11, v8, v9}, Lcom/google/protobuf/k;->j(ID)I

    move-result v5

    goto/16 :goto_5

    :cond_16
    :goto_9
    move/from16 v9, v16

    :goto_a
    add-int/lit8 v2, v2, 0x3

    const v8, 0xfffff

    goto/16 :goto_0

    :cond_17
    move/from16 v16, v9

    .line 221
    iget-object v2, v0, Lcom/google/protobuf/W;->o:Lcom/google/protobuf/q0;

    invoke-direct {v0, v2, v1}, Lcom/google/protobuf/W;->x(Lcom/google/protobuf/q0;Ljava/lang/Object;)I

    move-result v2

    add-int v9, v16, v2

    .line 222
    iget-boolean v2, v0, Lcom/google/protobuf/W;->f:Z

    if-eqz v2, :cond_18

    .line 223
    iget-object v0, v0, Lcom/google/protobuf/W;->p:Lcom/google/protobuf/q;

    invoke-virtual {v0, v1}, Lcom/google/protobuf/q;->c(Ljava/lang/Object;)Lcom/google/protobuf/u;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/u;->l()I

    move-result v0

    add-int/2addr v9, v0

    :cond_18
    return v9

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public f()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/W;->m:Lcom/google/protobuf/Y;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/google/protobuf/W;->e:Lcom/google/protobuf/T;

    .line 4
    .line 5
    invoke-interface {v0, p0}, Lcom/google/protobuf/Y;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public g(Ljava/lang/Object;)I
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/W;->a:[I

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v1, v0, :cond_2

    .line 7
    .line 8
    invoke-direct {p0, v1}, Lcom/google/protobuf/W;->u0(I)I

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    invoke-direct {p0, v1}, Lcom/google/protobuf/W;->V(I)I

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    invoke-static {v3}, Lcom/google/protobuf/W;->W(I)J

    .line 17
    .line 18
    .line 19
    move-result-wide v5

    .line 20
    invoke-static {v3}, Lcom/google/protobuf/W;->t0(I)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    const/16 v7, 0x25

    .line 25
    .line 26
    packed-switch v3, :pswitch_data_0

    .line 27
    .line 28
    .line 29
    goto/16 :goto_3

    .line 30
    .line 31
    :pswitch_0
    invoke-direct {p0, p1, v4, v1}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    mul-int/lit8 v2, v2, 0x35

    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    :goto_1
    add-int/2addr v2, v3

    .line 48
    goto/16 :goto_3

    .line 49
    .line 50
    :pswitch_1
    invoke-direct {p0, p1, v4, v1}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-eqz v3, :cond_1

    .line 55
    .line 56
    mul-int/lit8 v2, v2, 0x35

    .line 57
    .line 58
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/W;->b0(Ljava/lang/Object;J)J

    .line 59
    .line 60
    .line 61
    move-result-wide v3

    .line 62
    invoke-static {v3, v4}, Lcom/google/protobuf/A;->f(J)I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    goto :goto_1

    .line 67
    :pswitch_2
    invoke-direct {p0, p1, v4, v1}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-eqz v3, :cond_1

    .line 72
    .line 73
    mul-int/lit8 v2, v2, 0x35

    .line 74
    .line 75
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    goto :goto_1

    .line 80
    :pswitch_3
    invoke-direct {p0, p1, v4, v1}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    if-eqz v3, :cond_1

    .line 85
    .line 86
    mul-int/lit8 v2, v2, 0x35

    .line 87
    .line 88
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/W;->b0(Ljava/lang/Object;J)J

    .line 89
    .line 90
    .line 91
    move-result-wide v3

    .line 92
    invoke-static {v3, v4}, Lcom/google/protobuf/A;->f(J)I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    goto :goto_1

    .line 97
    :pswitch_4
    invoke-direct {p0, p1, v4, v1}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    if-eqz v3, :cond_1

    .line 102
    .line 103
    mul-int/lit8 v2, v2, 0x35

    .line 104
    .line 105
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    goto :goto_1

    .line 110
    :pswitch_5
    invoke-direct {p0, p1, v4, v1}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    if-eqz v3, :cond_1

    .line 115
    .line 116
    mul-int/lit8 v2, v2, 0x35

    .line 117
    .line 118
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    goto :goto_1

    .line 123
    :pswitch_6
    invoke-direct {p0, p1, v4, v1}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    if-eqz v3, :cond_1

    .line 128
    .line 129
    mul-int/lit8 v2, v2, 0x35

    .line 130
    .line 131
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    goto :goto_1

    .line 136
    :pswitch_7
    invoke-direct {p0, p1, v4, v1}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    if-eqz v3, :cond_1

    .line 141
    .line 142
    mul-int/lit8 v2, v2, 0x35

    .line 143
    .line 144
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 149
    .line 150
    .line 151
    move-result v3

    .line 152
    goto :goto_1

    .line 153
    :pswitch_8
    invoke-direct {p0, p1, v4, v1}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 154
    .line 155
    .line 156
    move-result v3

    .line 157
    if-eqz v3, :cond_1

    .line 158
    .line 159
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    mul-int/lit8 v2, v2, 0x35

    .line 164
    .line 165
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 166
    .line 167
    .line 168
    move-result v3

    .line 169
    goto :goto_1

    .line 170
    :pswitch_9
    invoke-direct {p0, p1, v4, v1}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    if-eqz v3, :cond_1

    .line 175
    .line 176
    mul-int/lit8 v2, v2, 0x35

    .line 177
    .line 178
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    check-cast v3, Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 185
    .line 186
    .line 187
    move-result v3

    .line 188
    goto/16 :goto_1

    .line 189
    .line 190
    :pswitch_a
    invoke-direct {p0, p1, v4, v1}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 191
    .line 192
    .line 193
    move-result v3

    .line 194
    if-eqz v3, :cond_1

    .line 195
    .line 196
    mul-int/lit8 v2, v2, 0x35

    .line 197
    .line 198
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/W;->X(Ljava/lang/Object;J)Z

    .line 199
    .line 200
    .line 201
    move-result v3

    .line 202
    invoke-static {v3}, Lcom/google/protobuf/A;->c(Z)I

    .line 203
    .line 204
    .line 205
    move-result v3

    .line 206
    goto/16 :goto_1

    .line 207
    .line 208
    :pswitch_b
    invoke-direct {p0, p1, v4, v1}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 209
    .line 210
    .line 211
    move-result v3

    .line 212
    if-eqz v3, :cond_1

    .line 213
    .line 214
    mul-int/lit8 v2, v2, 0x35

    .line 215
    .line 216
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    .line 217
    .line 218
    .line 219
    move-result v3

    .line 220
    goto/16 :goto_1

    .line 221
    .line 222
    :pswitch_c
    invoke-direct {p0, p1, v4, v1}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 223
    .line 224
    .line 225
    move-result v3

    .line 226
    if-eqz v3, :cond_1

    .line 227
    .line 228
    mul-int/lit8 v2, v2, 0x35

    .line 229
    .line 230
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/W;->b0(Ljava/lang/Object;J)J

    .line 231
    .line 232
    .line 233
    move-result-wide v3

    .line 234
    invoke-static {v3, v4}, Lcom/google/protobuf/A;->f(J)I

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    goto/16 :goto_1

    .line 239
    .line 240
    :pswitch_d
    invoke-direct {p0, p1, v4, v1}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 241
    .line 242
    .line 243
    move-result v3

    .line 244
    if-eqz v3, :cond_1

    .line 245
    .line 246
    mul-int/lit8 v2, v2, 0x35

    .line 247
    .line 248
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/W;->a0(Ljava/lang/Object;J)I

    .line 249
    .line 250
    .line 251
    move-result v3

    .line 252
    goto/16 :goto_1

    .line 253
    .line 254
    :pswitch_e
    invoke-direct {p0, p1, v4, v1}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 255
    .line 256
    .line 257
    move-result v3

    .line 258
    if-eqz v3, :cond_1

    .line 259
    .line 260
    mul-int/lit8 v2, v2, 0x35

    .line 261
    .line 262
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/W;->b0(Ljava/lang/Object;J)J

    .line 263
    .line 264
    .line 265
    move-result-wide v3

    .line 266
    invoke-static {v3, v4}, Lcom/google/protobuf/A;->f(J)I

    .line 267
    .line 268
    .line 269
    move-result v3

    .line 270
    goto/16 :goto_1

    .line 271
    .line 272
    :pswitch_f
    invoke-direct {p0, p1, v4, v1}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 273
    .line 274
    .line 275
    move-result v3

    .line 276
    if-eqz v3, :cond_1

    .line 277
    .line 278
    mul-int/lit8 v2, v2, 0x35

    .line 279
    .line 280
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/W;->b0(Ljava/lang/Object;J)J

    .line 281
    .line 282
    .line 283
    move-result-wide v3

    .line 284
    invoke-static {v3, v4}, Lcom/google/protobuf/A;->f(J)I

    .line 285
    .line 286
    .line 287
    move-result v3

    .line 288
    goto/16 :goto_1

    .line 289
    .line 290
    :pswitch_10
    invoke-direct {p0, p1, v4, v1}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 291
    .line 292
    .line 293
    move-result v3

    .line 294
    if-eqz v3, :cond_1

    .line 295
    .line 296
    mul-int/lit8 v2, v2, 0x35

    .line 297
    .line 298
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/W;->Z(Ljava/lang/Object;J)F

    .line 299
    .line 300
    .line 301
    move-result v3

    .line 302
    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 303
    .line 304
    .line 305
    move-result v3

    .line 306
    goto/16 :goto_1

    .line 307
    .line 308
    :pswitch_11
    invoke-direct {p0, p1, v4, v1}, Lcom/google/protobuf/W;->I(Ljava/lang/Object;II)Z

    .line 309
    .line 310
    .line 311
    move-result v3

    .line 312
    if-eqz v3, :cond_1

    .line 313
    .line 314
    mul-int/lit8 v2, v2, 0x35

    .line 315
    .line 316
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/W;->Y(Ljava/lang/Object;J)D

    .line 317
    .line 318
    .line 319
    move-result-wide v3

    .line 320
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 321
    .line 322
    .line 323
    move-result-wide v3

    .line 324
    invoke-static {v3, v4}, Lcom/google/protobuf/A;->f(J)I

    .line 325
    .line 326
    .line 327
    move-result v3

    .line 328
    goto/16 :goto_1

    .line 329
    .line 330
    :pswitch_12
    mul-int/lit8 v2, v2, 0x35

    .line 331
    .line 332
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 333
    .line 334
    .line 335
    move-result-object v3

    .line 336
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 337
    .line 338
    .line 339
    move-result v3

    .line 340
    goto/16 :goto_1

    .line 341
    .line 342
    :pswitch_13
    mul-int/lit8 v2, v2, 0x35

    .line 343
    .line 344
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 345
    .line 346
    .line 347
    move-result-object v3

    .line 348
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 349
    .line 350
    .line 351
    move-result v3

    .line 352
    goto/16 :goto_1

    .line 353
    .line 354
    :pswitch_14
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 355
    .line 356
    .line 357
    move-result-object v3

    .line 358
    if-eqz v3, :cond_0

    .line 359
    .line 360
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 361
    .line 362
    .line 363
    move-result v7

    .line 364
    :cond_0
    :goto_2
    mul-int/lit8 v2, v2, 0x35

    .line 365
    .line 366
    add-int/2addr v2, v7

    .line 367
    goto/16 :goto_3

    .line 368
    .line 369
    :pswitch_15
    mul-int/lit8 v2, v2, 0x35

    .line 370
    .line 371
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 372
    .line 373
    .line 374
    move-result-wide v3

    .line 375
    invoke-static {v3, v4}, Lcom/google/protobuf/A;->f(J)I

    .line 376
    .line 377
    .line 378
    move-result v3

    .line 379
    goto/16 :goto_1

    .line 380
    .line 381
    :pswitch_16
    mul-int/lit8 v2, v2, 0x35

    .line 382
    .line 383
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 384
    .line 385
    .line 386
    move-result v3

    .line 387
    goto/16 :goto_1

    .line 388
    .line 389
    :pswitch_17
    mul-int/lit8 v2, v2, 0x35

    .line 390
    .line 391
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 392
    .line 393
    .line 394
    move-result-wide v3

    .line 395
    invoke-static {v3, v4}, Lcom/google/protobuf/A;->f(J)I

    .line 396
    .line 397
    .line 398
    move-result v3

    .line 399
    goto/16 :goto_1

    .line 400
    .line 401
    :pswitch_18
    mul-int/lit8 v2, v2, 0x35

    .line 402
    .line 403
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 404
    .line 405
    .line 406
    move-result v3

    .line 407
    goto/16 :goto_1

    .line 408
    .line 409
    :pswitch_19
    mul-int/lit8 v2, v2, 0x35

    .line 410
    .line 411
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 412
    .line 413
    .line 414
    move-result v3

    .line 415
    goto/16 :goto_1

    .line 416
    .line 417
    :pswitch_1a
    mul-int/lit8 v2, v2, 0x35

    .line 418
    .line 419
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 420
    .line 421
    .line 422
    move-result v3

    .line 423
    goto/16 :goto_1

    .line 424
    .line 425
    :pswitch_1b
    mul-int/lit8 v2, v2, 0x35

    .line 426
    .line 427
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 428
    .line 429
    .line 430
    move-result-object v3

    .line 431
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 432
    .line 433
    .line 434
    move-result v3

    .line 435
    goto/16 :goto_1

    .line 436
    .line 437
    :pswitch_1c
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 438
    .line 439
    .line 440
    move-result-object v3

    .line 441
    if-eqz v3, :cond_0

    .line 442
    .line 443
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 444
    .line 445
    .line 446
    move-result v7

    .line 447
    goto :goto_2

    .line 448
    :pswitch_1d
    mul-int/lit8 v2, v2, 0x35

    .line 449
    .line 450
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->G(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 451
    .line 452
    .line 453
    move-result-object v3

    .line 454
    check-cast v3, Ljava/lang/String;

    .line 455
    .line 456
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 457
    .line 458
    .line 459
    move-result v3

    .line 460
    goto/16 :goto_1

    .line 461
    .line 462
    :pswitch_1e
    mul-int/lit8 v2, v2, 0x35

    .line 463
    .line 464
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->t(Ljava/lang/Object;J)Z

    .line 465
    .line 466
    .line 467
    move-result v3

    .line 468
    invoke-static {v3}, Lcom/google/protobuf/A;->c(Z)I

    .line 469
    .line 470
    .line 471
    move-result v3

    .line 472
    goto/16 :goto_1

    .line 473
    .line 474
    :pswitch_1f
    mul-int/lit8 v2, v2, 0x35

    .line 475
    .line 476
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 477
    .line 478
    .line 479
    move-result v3

    .line 480
    goto/16 :goto_1

    .line 481
    .line 482
    :pswitch_20
    mul-int/lit8 v2, v2, 0x35

    .line 483
    .line 484
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 485
    .line 486
    .line 487
    move-result-wide v3

    .line 488
    invoke-static {v3, v4}, Lcom/google/protobuf/A;->f(J)I

    .line 489
    .line 490
    .line 491
    move-result v3

    .line 492
    goto/16 :goto_1

    .line 493
    .line 494
    :pswitch_21
    mul-int/lit8 v2, v2, 0x35

    .line 495
    .line 496
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->C(Ljava/lang/Object;J)I

    .line 497
    .line 498
    .line 499
    move-result v3

    .line 500
    goto/16 :goto_1

    .line 501
    .line 502
    :pswitch_22
    mul-int/lit8 v2, v2, 0x35

    .line 503
    .line 504
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 505
    .line 506
    .line 507
    move-result-wide v3

    .line 508
    invoke-static {v3, v4}, Lcom/google/protobuf/A;->f(J)I

    .line 509
    .line 510
    .line 511
    move-result v3

    .line 512
    goto/16 :goto_1

    .line 513
    .line 514
    :pswitch_23
    mul-int/lit8 v2, v2, 0x35

    .line 515
    .line 516
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->E(Ljava/lang/Object;J)J

    .line 517
    .line 518
    .line 519
    move-result-wide v3

    .line 520
    invoke-static {v3, v4}, Lcom/google/protobuf/A;->f(J)I

    .line 521
    .line 522
    .line 523
    move-result v3

    .line 524
    goto/16 :goto_1

    .line 525
    .line 526
    :pswitch_24
    mul-int/lit8 v2, v2, 0x35

    .line 527
    .line 528
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->B(Ljava/lang/Object;J)F

    .line 529
    .line 530
    .line 531
    move-result v3

    .line 532
    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 533
    .line 534
    .line 535
    move-result v3

    .line 536
    goto/16 :goto_1

    .line 537
    .line 538
    :pswitch_25
    mul-int/lit8 v2, v2, 0x35

    .line 539
    .line 540
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/u0;->A(Ljava/lang/Object;J)D

    .line 541
    .line 542
    .line 543
    move-result-wide v3

    .line 544
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 545
    .line 546
    .line 547
    move-result-wide v3

    .line 548
    invoke-static {v3, v4}, Lcom/google/protobuf/A;->f(J)I

    .line 549
    .line 550
    .line 551
    move-result v3

    .line 552
    goto/16 :goto_1

    .line 553
    .line 554
    :cond_1
    :goto_3
    add-int/lit8 v1, v1, 0x3

    .line 555
    .line 556
    goto/16 :goto_0

    .line 557
    .line 558
    :cond_2
    mul-int/lit8 v2, v2, 0x35

    .line 559
    .line 560
    iget-object v0, p0, Lcom/google/protobuf/W;->o:Lcom/google/protobuf/q0;

    .line 561
    .line 562
    invoke-virtual {v0, p1}, Lcom/google/protobuf/q0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 563
    .line 564
    .line 565
    move-result-object v0

    .line 566
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 567
    .line 568
    .line 569
    move-result v0

    .line 570
    add-int/2addr v2, v0

    .line 571
    iget-boolean v0, p0, Lcom/google/protobuf/W;->f:Z

    .line 572
    .line 573
    if-eqz v0, :cond_3

    .line 574
    .line 575
    mul-int/lit8 v2, v2, 0x35

    .line 576
    .line 577
    iget-object p0, p0, Lcom/google/protobuf/W;->p:Lcom/google/protobuf/q;

    .line 578
    .line 579
    invoke-virtual {p0, p1}, Lcom/google/protobuf/q;->c(Ljava/lang/Object;)Lcom/google/protobuf/u;

    .line 580
    .line 581
    .line 582
    move-result-object p0

    .line 583
    invoke-virtual {p0}, Lcom/google/protobuf/u;->hashCode()I

    .line 584
    .line 585
    .line 586
    move-result p0

    .line 587
    add-int/2addr v2, p0

    .line 588
    :cond_3
    return v2

    .line 589
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public h(Ljava/lang/Object;Lcom/google/protobuf/i0;Lcom/google/protobuf/p;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/google/protobuf/i0;",
            "Lcom/google/protobuf/p;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-static {p1}, Lcom/google/protobuf/W;->m(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/google/protobuf/W;->o:Lcom/google/protobuf/q0;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/google/protobuf/W;->p:Lcom/google/protobuf/q;

    .line 9
    .line 10
    move-object v0, p0

    .line 11
    move-object v3, p1

    .line 12
    move-object v4, p2

    .line 13
    move-object v5, p3

    .line 14
    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/W;->L(Lcom/google/protobuf/q0;Lcom/google/protobuf/q;Ljava/lang/Object;Lcom/google/protobuf/i0;Lcom/google/protobuf/p;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    throw p0
.end method

.method public i(Ljava/lang/Object;[BIILcom/google/protobuf/e$b;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[BII",
            "Lcom/google/protobuf/e$b;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move-object v6, p5

    .line 8
    invoke-virtual/range {v0 .. v6}, Lcom/google/protobuf/W;->d0(Ljava/lang/Object;[BIIILcom/google/protobuf/e$b;)I

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public j(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/W;->a:[I

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v2, v0, :cond_1

    .line 7
    .line 8
    invoke-direct {p0, p1, p2, v2}, Lcom/google/protobuf/W;->p(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    if-nez v3, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    add-int/lit8 v2, v2, 0x3

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    iget-object v0, p0, Lcom/google/protobuf/W;->o:Lcom/google/protobuf/q0;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Lcom/google/protobuf/q0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v2, p0, Lcom/google/protobuf/W;->o:Lcom/google/protobuf/q0;

    .line 25
    .line 26
    invoke-virtual {v2, p2}, Lcom/google/protobuf/q0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_2

    .line 35
    .line 36
    return v1

    .line 37
    :cond_2
    iget-boolean v0, p0, Lcom/google/protobuf/W;->f:Z

    .line 38
    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    iget-object v0, p0, Lcom/google/protobuf/W;->p:Lcom/google/protobuf/q;

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Lcom/google/protobuf/q;->c(Ljava/lang/Object;)Lcom/google/protobuf/u;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-object p0, p0, Lcom/google/protobuf/W;->p:Lcom/google/protobuf/q;

    .line 48
    .line 49
    invoke-virtual {p0, p2}, Lcom/google/protobuf/q;->c(Ljava/lang/Object;)Lcom/google/protobuf/u;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p1, p0}, Lcom/google/protobuf/u;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0

    .line 58
    :cond_3
    const/4 p0, 0x1

    .line 59
    return p0
.end method
