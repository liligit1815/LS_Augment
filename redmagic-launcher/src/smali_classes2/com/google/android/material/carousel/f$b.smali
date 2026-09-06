.class final Lcom/google/android/material/carousel/f$b;
.super Ljava/lang/Object;
.source "KeylineState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/carousel/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "b"
.end annotation


# instance fields
.field private final a:F

.field private final b:F

.field private final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/material/carousel/f$c;",
            ">;"
        }
    .end annotation
.end field

.field private d:Lcom/google/android/material/carousel/f$c;

.field private e:Lcom/google/android/material/carousel/f$c;

.field private f:I

.field private g:I

.field private h:F

.field private i:I


# direct methods
.method constructor <init>(FF)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/google/android/material/carousel/f$b;->c:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Lcom/google/android/material/carousel/f$b;->f:I

    .line 13
    .line 14
    iput v0, p0, Lcom/google/android/material/carousel/f$b;->g:I

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iput v1, p0, Lcom/google/android/material/carousel/f$b;->h:F

    .line 18
    .line 19
    iput v0, p0, Lcom/google/android/material/carousel/f$b;->i:I

    .line 20
    .line 21
    iput p1, p0, Lcom/google/android/material/carousel/f$b;->a:F

    .line 22
    .line 23
    iput p2, p0, Lcom/google/android/material/carousel/f$b;->b:F

    .line 24
    .line 25
    return-void
.end method

.method private static j(FFII)F
    .locals 0

    .line 1
    int-to-float p2, p2

    .line 2
    mul-float/2addr p2, p1

    .line 3
    sub-float/2addr p0, p2

    .line 4
    int-to-float p2, p3

    .line 5
    mul-float/2addr p2, p1

    .line 6
    add-float/2addr p0, p2

    .line 7
    return p0
.end method


# virtual methods
.method a(FFF)Lcom/google/android/material/carousel/f$b;
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, 0x1

    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move v2, p2

    .line 6
    move v3, p3

    .line 7
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/material/carousel/f$b;->d(FFFZZ)Lcom/google/android/material/carousel/f$b;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method b(FFF)Lcom/google/android/material/carousel/f$b;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/google/android/material/carousel/f$b;->c(FFFZ)Lcom/google/android/material/carousel/f$b;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method c(FFFZ)Lcom/google/android/material/carousel/f$b;
    .locals 6

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/material/carousel/f$b;->d(FFFZZ)Lcom/google/android/material/carousel/f$b;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method d(FFFZZ)Lcom/google/android/material/carousel/f$b;
    .locals 8

    .line 1
    const/high16 v0, 0x40000000    # 2.0f

    .line 2
    .line 3
    div-float v0, p3, v0

    .line 4
    .line 5
    sub-float v1, p1, v0

    .line 6
    .line 7
    add-float/2addr v0, p1

    .line 8
    iget v2, p0, Lcom/google/android/material/carousel/f$b;->b:F

    .line 9
    .line 10
    cmpl-float v3, v0, v2

    .line 11
    .line 12
    if-lez v3, :cond_1

    .line 13
    .line 14
    sub-float v1, v0, p3

    .line 15
    .line 16
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    sub-float/2addr v0, v1

    .line 21
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    :cond_0
    :goto_0
    move-object v1, p0

    .line 26
    move v2, p1

    .line 27
    move v3, p2

    .line 28
    move v4, p3

    .line 29
    move v5, p4

    .line 30
    move v6, p5

    .line 31
    move v7, v0

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    const/4 v0, 0x0

    .line 34
    cmpg-float v2, v1, v0

    .line 35
    .line 36
    if-gez v2, :cond_0

    .line 37
    .line 38
    add-float v2, v1, p3

    .line 39
    .line 40
    invoke-static {v2, v0}, Ljava/lang/Math;->min(FF)F

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    sub-float/2addr v1, v0

    .line 45
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    goto :goto_0

    .line 50
    :goto_1
    invoke-virtual/range {v1 .. v7}, Lcom/google/android/material/carousel/f$b;->e(FFFZZF)Lcom/google/android/material/carousel/f$b;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method e(FFFZZF)Lcom/google/android/material/carousel/f$b;
    .locals 9

    .line 1
    const/4 v7, 0x0

    .line 2
    const/4 v8, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move v2, p2

    .line 6
    move v3, p3

    .line 7
    move v4, p4

    .line 8
    move v5, p5

    .line 9
    move v6, p6

    .line 10
    invoke-virtual/range {v0 .. v8}, Lcom/google/android/material/carousel/f$b;->f(FFFZZFFF)Lcom/google/android/material/carousel/f$b;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method f(FFFZZFFF)Lcom/google/android/material/carousel/f$b;
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p3, v0

    .line 3
    .line 4
    if-gtz v0, :cond_0

    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_0
    const/4 v0, -0x1

    .line 8
    if-eqz p5, :cond_4

    .line 9
    .line 10
    if-nez p4, :cond_3

    .line 11
    .line 12
    iget v1, p0, Lcom/google/android/material/carousel/f$b;->i:I

    .line 13
    .line 14
    if-eq v1, v0, :cond_2

    .line 15
    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 20
    .line 21
    const-string p1, "Anchor keylines must be either the first or last keyline."

    .line 22
    .line 23
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    throw p0

    .line 27
    :cond_2
    :goto_0
    iget-object v1, p0, Lcom/google/android/material/carousel/f$b;->c:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iput v1, p0, Lcom/google/android/material/carousel/f$b;->i:I

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 37
    .line 38
    const-string p1, "Anchor keylines cannot be focal."

    .line 39
    .line 40
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    throw p0

    .line 44
    :cond_4
    :goto_1
    new-instance v1, Lcom/google/android/material/carousel/f$c;

    .line 45
    .line 46
    const/4 v2, 0x1

    .line 47
    move v3, p1

    .line 48
    move v4, p2

    .line 49
    move v5, p3

    .line 50
    move v6, p5

    .line 51
    move/from16 v7, p6

    .line 52
    .line 53
    move/from16 v8, p7

    .line 54
    .line 55
    move/from16 v9, p8

    .line 56
    .line 57
    invoke-direct/range {v1 .. v9}, Lcom/google/android/material/carousel/f$c;-><init>(FFFFZFFF)V

    .line 58
    .line 59
    .line 60
    if-eqz p4, :cond_9

    .line 61
    .line 62
    iget-object p1, p0, Lcom/google/android/material/carousel/f$b;->d:Lcom/google/android/material/carousel/f$c;

    .line 63
    .line 64
    if-nez p1, :cond_5

    .line 65
    .line 66
    iput-object v1, p0, Lcom/google/android/material/carousel/f$b;->d:Lcom/google/android/material/carousel/f$c;

    .line 67
    .line 68
    iget-object p1, p0, Lcom/google/android/material/carousel/f$b;->c:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    iput p1, p0, Lcom/google/android/material/carousel/f$b;->f:I

    .line 75
    .line 76
    :cond_5
    iget p1, p0, Lcom/google/android/material/carousel/f$b;->g:I

    .line 77
    .line 78
    if-eq p1, v0, :cond_7

    .line 79
    .line 80
    iget-object p1, p0, Lcom/google/android/material/carousel/f$b;->c:Ljava/util/List;

    .line 81
    .line 82
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    iget p2, p0, Lcom/google/android/material/carousel/f$b;->g:I

    .line 87
    .line 88
    sub-int/2addr p1, p2

    .line 89
    const/4 p2, 0x1

    .line 90
    if-gt p1, p2, :cond_6

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_6
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 94
    .line 95
    const-string p1, "Keylines marked as focal must be placed next to each other. There cannot be non-focal keylines between focal keylines."

    .line 96
    .line 97
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    throw p0

    .line 101
    :cond_7
    :goto_2
    iget-object p1, p0, Lcom/google/android/material/carousel/f$b;->d:Lcom/google/android/material/carousel/f$c;

    .line 102
    .line 103
    iget p1, p1, Lcom/google/android/material/carousel/f$c;->d:F

    .line 104
    .line 105
    cmpl-float p1, p3, p1

    .line 106
    .line 107
    if-nez p1, :cond_8

    .line 108
    .line 109
    iput-object v1, p0, Lcom/google/android/material/carousel/f$b;->e:Lcom/google/android/material/carousel/f$c;

    .line 110
    .line 111
    iget-object p1, p0, Lcom/google/android/material/carousel/f$b;->c:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    iput p1, p0, Lcom/google/android/material/carousel/f$b;->g:I

    .line 118
    .line 119
    goto :goto_4

    .line 120
    :cond_8
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 121
    .line 122
    const-string p1, "Keylines that are marked as focal must all have the same masked item size."

    .line 123
    .line 124
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    throw p0

    .line 128
    :cond_9
    iget-object p1, p0, Lcom/google/android/material/carousel/f$b;->d:Lcom/google/android/material/carousel/f$c;

    .line 129
    .line 130
    if-nez p1, :cond_b

    .line 131
    .line 132
    iget p1, v1, Lcom/google/android/material/carousel/f$c;->d:F

    .line 133
    .line 134
    iget p2, p0, Lcom/google/android/material/carousel/f$b;->h:F

    .line 135
    .line 136
    cmpg-float p1, p1, p2

    .line 137
    .line 138
    if-ltz p1, :cond_a

    .line 139
    .line 140
    goto :goto_3

    .line 141
    :cond_a
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 142
    .line 143
    const-string p1, "Keylines before the first focal keyline must be ordered by incrementing masked item size."

    .line 144
    .line 145
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    throw p0

    .line 149
    :cond_b
    :goto_3
    iget-object p1, p0, Lcom/google/android/material/carousel/f$b;->e:Lcom/google/android/material/carousel/f$c;

    .line 150
    .line 151
    if-eqz p1, :cond_d

    .line 152
    .line 153
    iget p1, v1, Lcom/google/android/material/carousel/f$c;->d:F

    .line 154
    .line 155
    iget p2, p0, Lcom/google/android/material/carousel/f$b;->h:F

    .line 156
    .line 157
    cmpl-float p1, p1, p2

    .line 158
    .line 159
    if-gtz p1, :cond_c

    .line 160
    .line 161
    goto :goto_4

    .line 162
    :cond_c
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 163
    .line 164
    const-string p1, "Keylines after the last focal keyline must be ordered by decreasing masked item size."

    .line 165
    .line 166
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    throw p0

    .line 170
    :cond_d
    :goto_4
    iget p1, v1, Lcom/google/android/material/carousel/f$c;->d:F

    .line 171
    .line 172
    iput p1, p0, Lcom/google/android/material/carousel/f$b;->h:F

    .line 173
    .line 174
    iget-object p1, p0, Lcom/google/android/material/carousel/f$b;->c:Ljava/util/List;

    .line 175
    .line 176
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    return-object p0
.end method

.method g(FFFI)Lcom/google/android/material/carousel/f$b;
    .locals 6

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/material/carousel/f$b;->h(FFFIZ)Lcom/google/android/material/carousel/f$b;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method h(FFFIZ)Lcom/google/android/material/carousel/f$b;
    .locals 2

    .line 1
    if-lez p4, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    cmpg-float v0, p3, v0

    .line 5
    .line 6
    if-gtz v0, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    if-ge v0, p4, :cond_1

    .line 11
    .line 12
    int-to-float v1, v0

    .line 13
    mul-float/2addr v1, p3

    .line 14
    add-float/2addr v1, p1

    .line 15
    invoke-virtual {p0, v1, p2, p3, p5}, Lcom/google/android/material/carousel/f$b;->c(FFFZ)Lcom/google/android/material/carousel/f$b;

    .line 16
    .line 17
    .line 18
    add-int/lit8 v0, v0, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    :goto_1
    return-object p0
.end method

.method i()Lcom/google/android/material/carousel/f;
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/google/android/material/carousel/f$b;->d:Lcom/google/android/material/carousel/f$c;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    new-instance v3, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :goto_0
    iget-object v1, p0, Lcom/google/android/material/carousel/f$b;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-ge v0, v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Lcom/google/android/material/carousel/f$b;->c:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/google/android/material/carousel/f$c;

    .line 26
    .line 27
    new-instance v4, Lcom/google/android/material/carousel/f$c;

    .line 28
    .line 29
    iget-object v2, p0, Lcom/google/android/material/carousel/f$b;->d:Lcom/google/android/material/carousel/f$c;

    .line 30
    .line 31
    iget v2, v2, Lcom/google/android/material/carousel/f$c;->b:F

    .line 32
    .line 33
    iget v5, p0, Lcom/google/android/material/carousel/f$b;->a:F

    .line 34
    .line 35
    iget v6, p0, Lcom/google/android/material/carousel/f$b;->f:I

    .line 36
    .line 37
    invoke-static {v2, v5, v6, v0}, Lcom/google/android/material/carousel/f$b;->j(FFII)F

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    iget v6, v1, Lcom/google/android/material/carousel/f$c;->b:F

    .line 42
    .line 43
    iget v7, v1, Lcom/google/android/material/carousel/f$c;->c:F

    .line 44
    .line 45
    iget v8, v1, Lcom/google/android/material/carousel/f$c;->d:F

    .line 46
    .line 47
    iget-boolean v9, v1, Lcom/google/android/material/carousel/f$c;->e:Z

    .line 48
    .line 49
    iget v10, v1, Lcom/google/android/material/carousel/f$c;->f:F

    .line 50
    .line 51
    iget v11, v1, Lcom/google/android/material/carousel/f$c;->g:F

    .line 52
    .line 53
    iget v12, v1, Lcom/google/android/material/carousel/f$c;->h:F

    .line 54
    .line 55
    invoke-direct/range {v4 .. v12}, Lcom/google/android/material/carousel/f$c;-><init>(FFFFZFFF)V

    .line 56
    .line 57
    .line 58
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    add-int/lit8 v0, v0, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    new-instance v1, Lcom/google/android/material/carousel/f;

    .line 65
    .line 66
    iget v2, p0, Lcom/google/android/material/carousel/f$b;->a:F

    .line 67
    .line 68
    iget v4, p0, Lcom/google/android/material/carousel/f$b;->f:I

    .line 69
    .line 70
    iget v5, p0, Lcom/google/android/material/carousel/f$b;->g:I

    .line 71
    .line 72
    const/4 v6, 0x0

    .line 73
    invoke-direct/range {v1 .. v6}, Lcom/google/android/material/carousel/f;-><init>(FLjava/util/List;IILcom/google/android/material/carousel/f$a;)V

    .line 74
    .line 75
    .line 76
    return-object v1

    .line 77
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 78
    .line 79
    const-string v0, "There must be a keyline marked as focal."

    .line 80
    .line 81
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    throw p0
.end method
