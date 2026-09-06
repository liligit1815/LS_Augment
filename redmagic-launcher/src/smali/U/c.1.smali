.class public LU/c;
.super Ljava/lang/Object;
.source "Cubic.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LU/c$a;
    }
.end annotation


# static fields
.field public static final b:LU/c$a;


# instance fields
.field private final a:[F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LU/c$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LU/c$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LU/c;->b:LU/c$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 1
    invoke-direct {p0, v0, v1, v0}, LU/c;-><init>([FILkotlin/jvm/internal/j;)V

    return-void
.end method

.method private constructor <init>(JJJJ)V
    .locals 2

    .line 6
    invoke-static {p1, p2}, LU/r;->h(J)F

    move-result v0

    .line 7
    invoke-static {p1, p2}, LU/r;->i(J)F

    move-result p1

    .line 8
    invoke-static {p3, p4}, LU/r;->h(J)F

    move-result p2

    .line 9
    invoke-static {p3, p4}, LU/r;->i(J)F

    move-result p3

    .line 10
    invoke-static {p5, p6}, LU/r;->h(J)F

    move-result p4

    .line 11
    invoke-static {p5, p6}, LU/r;->i(J)F

    move-result p5

    .line 12
    invoke-static {p7, p8}, LU/r;->h(J)F

    move-result p6

    .line 13
    invoke-static {p7, p8}, LU/r;->i(J)F

    move-result p7

    const/16 p8, 0x8

    new-array p8, p8, [F

    const/4 v1, 0x0

    aput v0, p8, v1

    const/4 v0, 0x1

    aput p1, p8, v0

    const/4 p1, 0x2

    aput p2, p8, p1

    const/4 p1, 0x3

    aput p3, p8, p1

    const/4 p1, 0x4

    aput p4, p8, p1

    const/4 p1, 0x5

    aput p5, p8, p1

    const/4 p1, 0x6

    aput p6, p8, p1

    const/4 p1, 0x7

    aput p7, p8, p1

    .line 14
    invoke-direct {p0, p8}, LU/c;-><init>([F)V

    return-void
.end method

.method public synthetic constructor <init>(JJJJLkotlin/jvm/internal/j;)V
    .locals 0

    .line 2
    invoke-direct/range {p0 .. p8}, LU/c;-><init>(JJJJ)V

    return-void
.end method

.method public constructor <init>([F)V
    .locals 1

    const-string v0, "points"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LU/c;->a:[F

    .line 4
    array-length p0, p1

    const/16 p1, 0x8

    if-ne p0, p1, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Points array size should be 8"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public synthetic constructor <init>([FILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/16 p1, 0x8

    .line 5
    new-array p1, p1, [F

    :cond_0
    invoke-direct {p0, p1}, LU/c;-><init>([F)V

    return-void
.end method


# virtual methods
.method public final a(LU/c;)Z
    .locals 8

    .line 1
    const-string v0, "next"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, LU/c;->b()F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0}, LU/c;->c()F

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-static {v0, v1}, Lo/e;->b(FF)J

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    invoke-virtual {p0}, LU/c;->d()F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p0}, LU/c;->e()F

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-static {v0, p0}, Lo/e;->b(FF)J

    .line 27
    .line 28
    .line 29
    move-result-wide v4

    .line 30
    invoke-virtual {p1}, LU/c;->d()F

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {p1}, LU/c;->e()F

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-static {p0, p1}, Lo/e;->b(FF)J

    .line 39
    .line 40
    .line 41
    move-result-wide v6

    .line 42
    invoke-static/range {v2 .. v7}, LU/C;->b(JJJ)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0
.end method

.method public final b()F
    .locals 1

    .line 1
    iget-object p0, p0, LU/c;->a:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    return p0
.end method

.method public final c()F
    .locals 1

    .line 1
    iget-object p0, p0, LU/c;->a:[F

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    return p0
.end method

.method public final d()F
    .locals 1

    .line 1
    iget-object p0, p0, LU/c;->a:[F

    .line 2
    .line 3
    const/4 v0, 0x6

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    return p0
.end method

.method public final e()F
    .locals 1

    .line 1
    iget-object p0, p0, LU/c;->a:[F

    .line 2
    .line 3
    const/4 v0, 0x7

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p1, LU/c;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    iget-object p0, p0, LU/c;->a:[F

    .line 12
    .line 13
    check-cast p1, LU/c;

    .line 14
    .line 15
    iget-object p1, p1, LU/c;->a:[F

    .line 16
    .line 17
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([F[F)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public final f()F
    .locals 1

    .line 1
    iget-object p0, p0, LU/c;->a:[F

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    return p0
.end method

.method public final g()F
    .locals 1

    .line 1
    iget-object p0, p0, LU/c;->a:[F

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    return p0
.end method

.method public final h()F
    .locals 1

    .line 1
    iget-object p0, p0, LU/c;->a:[F

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    return p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, LU/c;->a:[F

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final i()F
    .locals 1

    .line 1
    iget-object p0, p0, LU/c;->a:[F

    .line 2
    .line 3
    const/4 v0, 0x5

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    return p0
.end method

.method public final j()[F
    .locals 0

    .line 1
    iget-object p0, p0, LU/c;->a:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final k(F)J
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    int-to-float v0, v0

    .line 3
    sub-float/2addr v0, p1

    .line 4
    invoke-virtual {p0}, LU/c;->b()F

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    mul-float v2, v0, v0

    .line 9
    .line 10
    mul-float/2addr v2, v0

    .line 11
    mul-float/2addr v1, v2

    .line 12
    invoke-virtual {p0}, LU/c;->f()F

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    const/4 v4, 0x3

    .line 17
    int-to-float v4, v4

    .line 18
    mul-float/2addr v4, p1

    .line 19
    mul-float v5, v4, v0

    .line 20
    .line 21
    mul-float/2addr v5, v0

    .line 22
    mul-float/2addr v3, v5

    .line 23
    add-float/2addr v1, v3

    .line 24
    invoke-virtual {p0}, LU/c;->h()F

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    mul-float/2addr v4, p1

    .line 29
    mul-float/2addr v4, v0

    .line 30
    mul-float/2addr v3, v4

    .line 31
    add-float/2addr v1, v3

    .line 32
    invoke-virtual {p0}, LU/c;->d()F

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    mul-float v3, p1, p1

    .line 37
    .line 38
    mul-float/2addr v3, p1

    .line 39
    mul-float/2addr v0, v3

    .line 40
    add-float/2addr v1, v0

    .line 41
    invoke-virtual {p0}, LU/c;->c()F

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    mul-float/2addr p1, v2

    .line 46
    invoke-virtual {p0}, LU/c;->g()F

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    mul-float/2addr v0, v5

    .line 51
    add-float/2addr p1, v0

    .line 52
    invoke-virtual {p0}, LU/c;->i()F

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    mul-float/2addr v0, v4

    .line 57
    add-float/2addr p1, v0

    .line 58
    invoke-virtual {p0}, LU/c;->e()F

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    mul-float/2addr p0, v3

    .line 63
    add-float/2addr p1, p0

    .line 64
    invoke-static {v1, p1}, Lo/e;->b(FF)J

    .line 65
    .line 66
    .line 67
    move-result-wide p0

    .line 68
    return-wide p0
.end method

.method public final l()LU/c;
    .locals 8

    .line 1
    invoke-virtual {p0}, LU/c;->d()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, LU/c;->e()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, LU/c;->h()F

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p0}, LU/c;->i()F

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    invoke-virtual {p0}, LU/c;->f()F

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    invoke-virtual {p0}, LU/c;->g()F

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    invoke-virtual {p0}, LU/c;->b()F

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    invoke-virtual {p0}, LU/c;->c()F

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    invoke-static/range {v0 .. v7}, LU/d;->a(FFFFFFFF)LU/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public final m(F)Lh4/l;
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Lh4/l<",
            "LU/c;",
            "LU/c;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    int-to-float v0, v0

    .line 3
    sub-float v0, v0, p1

    .line 4
    .line 5
    invoke-virtual/range {p0 .. p1}, LU/c;->k(F)J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual/range {p0 .. p0}, LU/c;->b()F

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    invoke-virtual/range {p0 .. p0}, LU/c;->c()F

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    invoke-virtual/range {p0 .. p0}, LU/c;->b()F

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    mul-float/2addr v5, v0

    .line 22
    invoke-virtual/range {p0 .. p0}, LU/c;->f()F

    .line 23
    .line 24
    .line 25
    move-result v6

    .line 26
    mul-float v6, v6, p1

    .line 27
    .line 28
    add-float/2addr v5, v6

    .line 29
    invoke-virtual/range {p0 .. p0}, LU/c;->c()F

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    mul-float/2addr v6, v0

    .line 34
    invoke-virtual/range {p0 .. p0}, LU/c;->g()F

    .line 35
    .line 36
    .line 37
    move-result v7

    .line 38
    mul-float v7, v7, p1

    .line 39
    .line 40
    add-float/2addr v6, v7

    .line 41
    invoke-virtual/range {p0 .. p0}, LU/c;->b()F

    .line 42
    .line 43
    .line 44
    move-result v7

    .line 45
    mul-float v11, v0, v0

    .line 46
    .line 47
    mul-float/2addr v7, v11

    .line 48
    invoke-virtual/range {p0 .. p0}, LU/c;->f()F

    .line 49
    .line 50
    .line 51
    move-result v8

    .line 52
    const/4 v9, 0x2

    .line 53
    int-to-float v9, v9

    .line 54
    mul-float/2addr v9, v0

    .line 55
    mul-float v12, v9, p1

    .line 56
    .line 57
    mul-float/2addr v8, v12

    .line 58
    add-float/2addr v7, v8

    .line 59
    invoke-virtual/range {p0 .. p0}, LU/c;->h()F

    .line 60
    .line 61
    .line 62
    move-result v8

    .line 63
    mul-float v13, p1, p1

    .line 64
    .line 65
    mul-float/2addr v8, v13

    .line 66
    add-float/2addr v7, v8

    .line 67
    invoke-virtual/range {p0 .. p0}, LU/c;->c()F

    .line 68
    .line 69
    .line 70
    move-result v8

    .line 71
    mul-float/2addr v8, v11

    .line 72
    invoke-virtual/range {p0 .. p0}, LU/c;->g()F

    .line 73
    .line 74
    .line 75
    move-result v9

    .line 76
    mul-float/2addr v9, v12

    .line 77
    add-float/2addr v8, v9

    .line 78
    invoke-virtual/range {p0 .. p0}, LU/c;->i()F

    .line 79
    .line 80
    .line 81
    move-result v9

    .line 82
    mul-float/2addr v9, v13

    .line 83
    add-float/2addr v8, v9

    .line 84
    invoke-static {v1, v2}, LU/r;->h(J)F

    .line 85
    .line 86
    .line 87
    move-result v9

    .line 88
    invoke-static {v1, v2}, LU/r;->i(J)F

    .line 89
    .line 90
    .line 91
    move-result v10

    .line 92
    invoke-static/range {v3 .. v10}, LU/d;->a(FFFFFFFF)LU/c;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-static {v1, v2}, LU/r;->h(J)F

    .line 97
    .line 98
    .line 99
    move-result v14

    .line 100
    invoke-static {v1, v2}, LU/r;->i(J)F

    .line 101
    .line 102
    .line 103
    move-result v15

    .line 104
    invoke-virtual/range {p0 .. p0}, LU/c;->f()F

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    mul-float/2addr v1, v11

    .line 109
    invoke-virtual/range {p0 .. p0}, LU/c;->h()F

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    mul-float/2addr v2, v12

    .line 114
    add-float/2addr v1, v2

    .line 115
    invoke-virtual/range {p0 .. p0}, LU/c;->d()F

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    mul-float/2addr v2, v13

    .line 120
    add-float v16, v1, v2

    .line 121
    .line 122
    invoke-virtual/range {p0 .. p0}, LU/c;->g()F

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    mul-float/2addr v1, v11

    .line 127
    invoke-virtual/range {p0 .. p0}, LU/c;->i()F

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    mul-float/2addr v2, v12

    .line 132
    add-float/2addr v1, v2

    .line 133
    invoke-virtual/range {p0 .. p0}, LU/c;->e()F

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    mul-float/2addr v2, v13

    .line 138
    add-float v17, v1, v2

    .line 139
    .line 140
    invoke-virtual/range {p0 .. p0}, LU/c;->h()F

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    mul-float/2addr v1, v0

    .line 145
    invoke-virtual/range {p0 .. p0}, LU/c;->d()F

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    mul-float v2, v2, p1

    .line 150
    .line 151
    add-float v18, v1, v2

    .line 152
    .line 153
    invoke-virtual/range {p0 .. p0}, LU/c;->i()F

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    mul-float/2addr v1, v0

    .line 158
    invoke-virtual/range {p0 .. p0}, LU/c;->e()F

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    mul-float v0, v0, p1

    .line 163
    .line 164
    add-float v19, v1, v0

    .line 165
    .line 166
    invoke-virtual/range {p0 .. p0}, LU/c;->d()F

    .line 167
    .line 168
    .line 169
    move-result v20

    .line 170
    invoke-virtual/range {p0 .. p0}, LU/c;->e()F

    .line 171
    .line 172
    .line 173
    move-result v21

    .line 174
    invoke-static/range {v14 .. v21}, LU/d;->a(FFFFFFFF)LU/c;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-static {v3, v0}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    return-object v0
.end method

.method public final n(LU/s;)LU/c;
    .locals 8

    .line 1
    const-string v0, "f"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, LU/q;

    .line 7
    .line 8
    invoke-direct {v0}, LU/q;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, LU/c;->a:[F

    .line 12
    .line 13
    invoke-virtual {v0}, LU/c;->j()[F

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const/16 v6, 0xe

    .line 18
    .line 19
    const/4 v7, 0x0

    .line 20
    const/4 v3, 0x0

    .line 21
    const/4 v4, 0x0

    .line 22
    const/4 v5, 0x0

    .line 23
    invoke-static/range {v1 .. v7}, Li4/g;->j([F[FIIIILjava/lang/Object;)[F

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, LU/q;->p(LU/s;)V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method

.method public final o()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, LU/c;->b()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, LU/c;->d()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-float/2addr v0, v1

    .line 10
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const v1, 0x38d1b717    # 1.0E-4f

    .line 15
    .line 16
    .line 17
    cmpg-float v0, v0, v1

    .line 18
    .line 19
    if-gez v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, LU/c;->c()F

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p0}, LU/c;->e()F

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    sub-float/2addr v0, p0

    .line 30
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    cmpg-float p0, p0, v1

    .line 35
    .line 36
    if-gez p0, :cond_0

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "anchor0: ("

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, LU/c;->b()F

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, ", "

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, LU/c;->c()F

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v2, ") control0: ("

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, LU/c;->f()F

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, LU/c;->g()F

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v2, "), control1: ("

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, LU/c;->h()F

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, LU/c;->i()F

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string v2, "), anchor1: ("

    .line 75
    .line 76
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, LU/c;->d()F

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, LU/c;->e()F

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const/16 p0, 0x29

    .line 97
    .line 98
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    return-object p0
.end method
