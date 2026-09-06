.class LD4/o;
.super LD4/n;
.source "StringNumberConversions.kt"


# direct methods
.method public static i(Ljava/lang/String;)Ljava/lang/Long;
    .locals 1

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/16 v0, 0xa

    .line 7
    .line 8
    invoke-static {p0, v0}, LD4/o;->j(Ljava/lang/String;I)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static final j(Ljava/lang/String;I)Ljava/lang/Long;
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "<this>"

    .line 6
    .line 7
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, LD4/b;->a(I)I

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/4 v3, 0x0

    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    return-object v3

    .line 21
    :cond_0
    const/4 v4, 0x0

    .line 22
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    const/16 v6, 0x30

    .line 27
    .line 28
    invoke-static {v5, v6}, Lkotlin/jvm/internal/o;->h(II)I

    .line 29
    .line 30
    .line 31
    move-result v6

    .line 32
    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    if-gez v6, :cond_4

    .line 38
    .line 39
    const/4 v6, 0x1

    .line 40
    if-ne v2, v6, :cond_1

    .line 41
    .line 42
    return-object v3

    .line 43
    :cond_1
    const/16 v9, 0x2b

    .line 44
    .line 45
    if-eq v5, v9, :cond_3

    .line 46
    .line 47
    const/16 v4, 0x2d

    .line 48
    .line 49
    if-eq v5, v4, :cond_2

    .line 50
    .line 51
    return-object v3

    .line 52
    :cond_2
    const-wide/high16 v7, -0x8000000000000000L

    .line 53
    .line 54
    move v4, v6

    .line 55
    goto :goto_0

    .line 56
    :cond_3
    move/from16 v19, v6

    .line 57
    .line 58
    move v6, v4

    .line 59
    move/from16 v4, v19

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_4
    move v6, v4

    .line 63
    :goto_0
    const-wide v9, -0x38e38e38e38e38eL    # -2.772000429909333E291

    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    const-wide/16 v11, 0x0

    .line 69
    .line 70
    move-wide v13, v9

    .line 71
    :goto_1
    if-ge v4, v2, :cond_9

    .line 72
    .line 73
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    invoke-static {v5, v1}, LD4/b;->b(CI)I

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    if-gez v5, :cond_5

    .line 82
    .line 83
    return-object v3

    .line 84
    :cond_5
    cmp-long v15, v11, v13

    .line 85
    .line 86
    if-gez v15, :cond_6

    .line 87
    .line 88
    cmp-long v13, v13, v9

    .line 89
    .line 90
    if-nez v13, :cond_7

    .line 91
    .line 92
    int-to-long v13, v1

    .line 93
    div-long v13, v7, v13

    .line 94
    .line 95
    cmp-long v15, v11, v13

    .line 96
    .line 97
    if-gez v15, :cond_6

    .line 98
    .line 99
    return-object v3

    .line 100
    :cond_6
    move-object v15, v3

    .line 101
    move/from16 v16, v4

    .line 102
    .line 103
    goto :goto_2

    .line 104
    :cond_7
    return-object v3

    .line 105
    :goto_2
    int-to-long v3, v1

    .line 106
    mul-long/2addr v11, v3

    .line 107
    int-to-long v3, v5

    .line 108
    add-long v17, v7, v3

    .line 109
    .line 110
    cmp-long v5, v11, v17

    .line 111
    .line 112
    if-gez v5, :cond_8

    .line 113
    .line 114
    return-object v15

    .line 115
    :cond_8
    sub-long/2addr v11, v3

    .line 116
    add-int/lit8 v4, v16, 0x1

    .line 117
    .line 118
    move-object v3, v15

    .line 119
    goto :goto_1

    .line 120
    :cond_9
    if-eqz v6, :cond_a

    .line 121
    .line 122
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    return-object v0

    .line 127
    :cond_a
    neg-long v0, v11

    .line 128
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    return-object v0
.end method
