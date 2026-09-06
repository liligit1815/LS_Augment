.class public final LU/j;
.super Ljava/lang/Object;
.source "FloatMapping.kt"


# direct methods
.method public static final a(Lo/f;Lo/f;F)F
    .locals 6

    .line 1
    const-string v0, "xValues"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "yValues"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    cmpg-float v0, v0, p2

    .line 13
    .line 14
    if-gtz v0, :cond_3

    .line 15
    .line 16
    const/high16 v0, 0x3f800000    # 1.0f

    .line 17
    .line 18
    cmpg-float v1, p2, v0

    .line 19
    .line 20
    if-gtz v1, :cond_3

    .line 21
    .line 22
    iget v1, p0, Lo/f;->b:I

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-static {v2, v1}, LA4/d;->l(II)LA4/c;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_2

    .line 38
    .line 39
    move-object v2, v1

    .line 40
    check-cast v2, Li4/E;

    .line 41
    .line 42
    invoke-virtual {v2}, Li4/E;->nextInt()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-virtual {p0, v2}, Lo/f;->b(I)F

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    add-int/lit8 v4, v2, 0x1

    .line 51
    .line 52
    invoke-virtual {p0}, Lo/f;->c()I

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    rem-int v5, v4, v5

    .line 57
    .line 58
    invoke-virtual {p0, v5}, Lo/f;->b(I)F

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    invoke-static {p2, v3, v5}, LU/j;->c(FFF)Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-eqz v3, :cond_0

    .line 67
    .line 68
    invoke-virtual {p0}, Lo/f;->c()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    rem-int/2addr v4, v1

    .line 73
    invoke-virtual {p0, v4}, Lo/f;->b(I)F

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-virtual {p0, v2}, Lo/f;->b(I)F

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    sub-float/2addr v1, v3

    .line 82
    invoke-static {v1, v0}, LU/C;->f(FF)F

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    invoke-virtual {p1, v4}, Lo/f;->b(I)F

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    invoke-virtual {p1, v2}, Lo/f;->b(I)F

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    sub-float/2addr v3, v4

    .line 95
    invoke-static {v3, v0}, LU/C;->f(FF)F

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    const v4, 0x3a83126f    # 0.001f

    .line 100
    .line 101
    .line 102
    cmpg-float v4, v1, v4

    .line 103
    .line 104
    if-gez v4, :cond_1

    .line 105
    .line 106
    const/high16 p0, 0x3f000000    # 0.5f

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_1
    invoke-virtual {p0, v2}, Lo/f;->b(I)F

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    sub-float/2addr p2, p0

    .line 114
    invoke-static {p2, v0}, LU/C;->f(FF)F

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    div-float/2addr p0, v1

    .line 119
    :goto_0
    invoke-virtual {p1, v2}, Lo/f;->b(I)F

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    mul-float/2addr v3, p0

    .line 124
    add-float/2addr p1, v3

    .line 125
    invoke-static {p1, v0}, LU/C;->f(FF)F

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    return p0

    .line 130
    :cond_2
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 131
    .line 132
    const-string p1, "Collection contains no element matching the predicate."

    .line 133
    .line 134
    invoke-direct {p0, p1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    throw p0

    .line 138
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 141
    .line 142
    .line 143
    const-string p1, "Invalid progress: "

    .line 144
    .line 145
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 156
    .line 157
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    throw p1
.end method

.method public static final b(FF)F
    .locals 0

    .line 1
    sub-float/2addr p0, p1

    .line 2
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    const/high16 p1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    sub-float/2addr p1, p0

    .line 9
    invoke-static {p0, p1}, Ljava/lang/Math;->min(FF)F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static final c(FFF)Z
    .locals 3

    .line 1
    cmpl-float v0, p2, p1

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ltz v0, :cond_1

    .line 6
    .line 7
    cmpg-float p1, p1, p0

    .line 8
    .line 9
    if-gtz p1, :cond_0

    .line 10
    .line 11
    cmpg-float p0, p0, p2

    .line 12
    .line 13
    if-gtz p0, :cond_0

    .line 14
    .line 15
    return v1

    .line 16
    :cond_0
    return v2

    .line 17
    :cond_1
    cmpl-float p1, p0, p1

    .line 18
    .line 19
    if-gez p1, :cond_3

    .line 20
    .line 21
    cmpg-float p0, p0, p2

    .line 22
    .line 23
    if-gtz p0, :cond_2

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_2
    return v2

    .line 27
    :cond_3
    :goto_0
    return v1
.end method

.method public static final d(Lo/f;)V
    .locals 11

    .line 1
    const-string v0, "p"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lo/f;->g()F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0}, Lo/f;->c()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x0

    .line 15
    move v3, v2

    .line 16
    :goto_0
    if-ge v2, v1, :cond_4

    .line 17
    .line 18
    invoke-virtual {p0, v2}, Lo/f;->b(I)F

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    const/4 v5, 0x0

    .line 23
    cmpl-float v5, v4, v5

    .line 24
    .line 25
    if-ltz v5, :cond_3

    .line 26
    .line 27
    const/high16 v5, 0x3f800000    # 1.0f

    .line 28
    .line 29
    cmpg-float v5, v4, v5

    .line 30
    .line 31
    if-gez v5, :cond_3

    .line 32
    .line 33
    invoke-static {v4, v0}, LU/j;->b(FF)F

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    const v6, 0x38d1b717    # 1.0E-4f

    .line 38
    .line 39
    .line 40
    cmpl-float v5, v5, v6

    .line 41
    .line 42
    if-lez v5, :cond_2

    .line 43
    .line 44
    cmpg-float v0, v4, v0

    .line 45
    .line 46
    if-gez v0, :cond_0

    .line 47
    .line 48
    add-int/lit8 v3, v3, 0x1

    .line 49
    .line 50
    const/4 v0, 0x1

    .line 51
    if-gt v3, v0, :cond_1

    .line 52
    .line 53
    :cond_0
    move v10, v1

    .line 54
    move-object v1, p0

    .line 55
    move p0, v10

    .line 56
    goto :goto_1

    .line 57
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    const-string v1, "FloatMapping - Progress wraps more than once: "

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const/16 v8, 0x1f

    .line 68
    .line 69
    const/4 v9, 0x0

    .line 70
    const/4 v3, 0x0

    .line 71
    const/4 v4, 0x0

    .line 72
    const/4 v5, 0x0

    .line 73
    const/4 v6, 0x0

    .line 74
    const/4 v7, 0x0

    .line 75
    move-object v2, p0

    .line 76
    invoke-static/range {v2 .. v9}, Lo/f;->f(Lo/f;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;ILjava/lang/Object;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 88
    .line 89
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    throw v0

    .line 97
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 98
    .line 99
    move-object v0, v1

    .line 100
    move v1, p0

    .line 101
    move-object p0, v0

    .line 102
    move v0, v4

    .line 103
    goto :goto_0

    .line 104
    :cond_2
    move-object v1, p0

    .line 105
    new-instance p0, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 108
    .line 109
    .line 110
    const-string v0, "FloatMapping - Progress repeats a value: "

    .line 111
    .line 112
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const/16 v7, 0x1f

    .line 116
    .line 117
    const/4 v8, 0x0

    .line 118
    const/4 v2, 0x0

    .line 119
    const/4 v3, 0x0

    .line 120
    const/4 v4, 0x0

    .line 121
    const/4 v5, 0x0

    .line 122
    const/4 v6, 0x0

    .line 123
    invoke-static/range {v1 .. v8}, Lo/f;->f(Lo/f;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;ILjava/lang/Object;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 135
    .line 136
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    throw v0

    .line 144
    :cond_3
    move-object v1, p0

    .line 145
    new-instance p0, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 148
    .line 149
    .line 150
    const-string v0, "FloatMapping - Progress outside of range: "

    .line 151
    .line 152
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    const/16 v7, 0x1f

    .line 156
    .line 157
    const/4 v8, 0x0

    .line 158
    const/4 v2, 0x0

    .line 159
    const/4 v3, 0x0

    .line 160
    const/4 v4, 0x0

    .line 161
    const/4 v5, 0x0

    .line 162
    const/4 v6, 0x0

    .line 163
    invoke-static/range {v1 .. v8}, Lo/f;->f(Lo/f;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;ILjava/lang/Object;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 175
    .line 176
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    throw v0

    .line 184
    :cond_4
    return-void
.end method
