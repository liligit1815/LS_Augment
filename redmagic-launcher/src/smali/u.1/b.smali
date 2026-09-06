.class public Lu/b;
.super Ljava/lang/Object;
.source "BasicMeasure.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lu/b$a;,
        Lu/b$b;
    }
.end annotation


# instance fields
.field private final a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lt/e;",
            ">;"
        }
    .end annotation
.end field

.field private b:Lu/b$a;

.field private c:Lt/f;


# direct methods
.method public constructor <init>(Lt/f;)V
    .locals 1

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
    iput-object v0, p0, Lu/b;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Lu/b$a;

    .line 12
    .line 13
    invoke-direct {v0}, Lu/b$a;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lu/b;->b:Lu/b$a;

    .line 17
    .line 18
    iput-object p1, p0, Lu/b;->c:Lt/f;

    .line 19
    .line 20
    return-void
.end method

.method private a(Lu/b$b;Lt/e;I)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lu/b;->b:Lu/b$a;

    .line 2
    .line 3
    invoke-virtual {p2}, Lt/e;->A()Lt/e$b;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iput-object v1, v0, Lu/b$a;->a:Lt/e$b;

    .line 8
    .line 9
    iget-object v0, p0, Lu/b;->b:Lu/b$a;

    .line 10
    .line 11
    invoke-virtual {p2}, Lt/e;->T()Lt/e$b;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, v0, Lu/b$a;->b:Lt/e$b;

    .line 16
    .line 17
    iget-object v0, p0, Lu/b;->b:Lu/b$a;

    .line 18
    .line 19
    invoke-virtual {p2}, Lt/e;->W()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput v1, v0, Lu/b$a;->c:I

    .line 24
    .line 25
    iget-object v0, p0, Lu/b;->b:Lu/b$a;

    .line 26
    .line 27
    invoke-virtual {p2}, Lt/e;->x()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iput v1, v0, Lu/b$a;->d:I

    .line 32
    .line 33
    iget-object v0, p0, Lu/b;->b:Lu/b$a;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    iput-boolean v1, v0, Lu/b$a;->i:Z

    .line 37
    .line 38
    iput p3, v0, Lu/b$a;->j:I

    .line 39
    .line 40
    iget-object p3, v0, Lu/b$a;->a:Lt/e$b;

    .line 41
    .line 42
    sget-object v2, Lt/e$b;->i:Lt/e$b;

    .line 43
    .line 44
    const/4 v3, 0x1

    .line 45
    if-ne p3, v2, :cond_0

    .line 46
    .line 47
    move p3, v3

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    move p3, v1

    .line 50
    :goto_0
    iget-object v4, v0, Lu/b$a;->b:Lt/e$b;

    .line 51
    .line 52
    if-ne v4, v2, :cond_1

    .line 53
    .line 54
    move v2, v3

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    move v2, v1

    .line 57
    :goto_1
    const/4 v4, 0x0

    .line 58
    if-eqz p3, :cond_2

    .line 59
    .line 60
    iget p3, p2, Lt/e;->d0:F

    .line 61
    .line 62
    cmpl-float p3, p3, v4

    .line 63
    .line 64
    if-lez p3, :cond_2

    .line 65
    .line 66
    move p3, v3

    .line 67
    goto :goto_2

    .line 68
    :cond_2
    move p3, v1

    .line 69
    :goto_2
    if-eqz v2, :cond_3

    .line 70
    .line 71
    iget v2, p2, Lt/e;->d0:F

    .line 72
    .line 73
    cmpl-float v2, v2, v4

    .line 74
    .line 75
    if-lez v2, :cond_3

    .line 76
    .line 77
    move v2, v3

    .line 78
    goto :goto_3

    .line 79
    :cond_3
    move v2, v1

    .line 80
    :goto_3
    const/4 v4, 0x4

    .line 81
    if-eqz p3, :cond_4

    .line 82
    .line 83
    iget-object p3, p2, Lt/e;->y:[I

    .line 84
    .line 85
    aget p3, p3, v1

    .line 86
    .line 87
    if-ne p3, v4, :cond_4

    .line 88
    .line 89
    sget-object p3, Lt/e$b;->g:Lt/e$b;

    .line 90
    .line 91
    iput-object p3, v0, Lu/b$a;->a:Lt/e$b;

    .line 92
    .line 93
    :cond_4
    if-eqz v2, :cond_5

    .line 94
    .line 95
    iget-object p3, p2, Lt/e;->y:[I

    .line 96
    .line 97
    aget p3, p3, v3

    .line 98
    .line 99
    if-ne p3, v4, :cond_5

    .line 100
    .line 101
    sget-object p3, Lt/e$b;->g:Lt/e$b;

    .line 102
    .line 103
    iput-object p3, v0, Lu/b$a;->b:Lt/e$b;

    .line 104
    .line 105
    :cond_5
    invoke-interface {p1, p2, v0}, Lu/b$b;->a(Lt/e;Lu/b$a;)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Lu/b;->b:Lu/b$a;

    .line 109
    .line 110
    iget p1, p1, Lu/b$a;->e:I

    .line 111
    .line 112
    invoke-virtual {p2, p1}, Lt/e;->l1(I)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Lu/b;->b:Lu/b$a;

    .line 116
    .line 117
    iget p1, p1, Lu/b$a;->f:I

    .line 118
    .line 119
    invoke-virtual {p2, p1}, Lt/e;->M0(I)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Lu/b;->b:Lu/b$a;

    .line 123
    .line 124
    iget-boolean p1, p1, Lu/b$a;->h:Z

    .line 125
    .line 126
    invoke-virtual {p2, p1}, Lt/e;->L0(Z)V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Lu/b;->b:Lu/b$a;

    .line 130
    .line 131
    iget p1, p1, Lu/b$a;->g:I

    .line 132
    .line 133
    invoke-virtual {p2, p1}, Lt/e;->B0(I)V

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Lu/b;->b:Lu/b$a;

    .line 137
    .line 138
    sget p1, Lu/b$a;->k:I

    .line 139
    .line 140
    iput p1, p0, Lu/b$a;->j:I

    .line 141
    .line 142
    iget-boolean p0, p0, Lu/b$a;->i:Z

    .line 143
    .line 144
    return p0
.end method

.method private b(Lt/f;)V
    .locals 12

    .line 1
    iget-object v0, p1, Lt/m;->L0:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x40

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Lt/f;->V1(I)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {p1}, Lt/f;->K1()Lu/b$b;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const/4 v3, 0x0

    .line 18
    move v4, v3

    .line 19
    :goto_0
    if-ge v4, v0, :cond_a

    .line 20
    .line 21
    iget-object v5, p1, Lt/m;->L0:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    check-cast v5, Lt/e;

    .line 28
    .line 29
    instance-of v6, v5, Lt/h;

    .line 30
    .line 31
    if-eqz v6, :cond_0

    .line 32
    .line 33
    goto/16 :goto_3

    .line 34
    .line 35
    :cond_0
    instance-of v6, v5, Lt/a;

    .line 36
    .line 37
    if-eqz v6, :cond_1

    .line 38
    .line 39
    goto/16 :goto_3

    .line 40
    .line 41
    :cond_1
    invoke-virtual {v5}, Lt/e;->l0()Z

    .line 42
    .line 43
    .line 44
    move-result v6

    .line 45
    if-eqz v6, :cond_2

    .line 46
    .line 47
    goto/16 :goto_3

    .line 48
    .line 49
    :cond_2
    if-eqz v1, :cond_3

    .line 50
    .line 51
    iget-object v6, v5, Lt/e;->e:Lu/l;

    .line 52
    .line 53
    if-eqz v6, :cond_3

    .line 54
    .line 55
    iget-object v7, v5, Lt/e;->f:Lu/n;

    .line 56
    .line 57
    if-eqz v7, :cond_3

    .line 58
    .line 59
    iget-object v6, v6, Lu/p;->e:Lu/g;

    .line 60
    .line 61
    iget-boolean v6, v6, Lu/f;->j:Z

    .line 62
    .line 63
    if-eqz v6, :cond_3

    .line 64
    .line 65
    iget-object v6, v7, Lu/p;->e:Lu/g;

    .line 66
    .line 67
    iget-boolean v6, v6, Lu/f;->j:Z

    .line 68
    .line 69
    if-eqz v6, :cond_3

    .line 70
    .line 71
    goto :goto_3

    .line 72
    :cond_3
    invoke-virtual {v5, v3}, Lt/e;->u(I)Lt/e$b;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    const/4 v7, 0x1

    .line 77
    invoke-virtual {v5, v7}, Lt/e;->u(I)Lt/e$b;

    .line 78
    .line 79
    .line 80
    move-result-object v8

    .line 81
    sget-object v9, Lt/e$b;->i:Lt/e$b;

    .line 82
    .line 83
    if-ne v6, v9, :cond_4

    .line 84
    .line 85
    iget v10, v5, Lt/e;->w:I

    .line 86
    .line 87
    if-eq v10, v7, :cond_4

    .line 88
    .line 89
    if-ne v8, v9, :cond_4

    .line 90
    .line 91
    iget v10, v5, Lt/e;->x:I

    .line 92
    .line 93
    if-eq v10, v7, :cond_4

    .line 94
    .line 95
    move v10, v7

    .line 96
    goto :goto_1

    .line 97
    :cond_4
    move v10, v3

    .line 98
    :goto_1
    if-nez v10, :cond_8

    .line 99
    .line 100
    invoke-virtual {p1, v7}, Lt/f;->V1(I)Z

    .line 101
    .line 102
    .line 103
    move-result v11

    .line 104
    if-eqz v11, :cond_8

    .line 105
    .line 106
    instance-of v11, v5, Lt/l;

    .line 107
    .line 108
    if-nez v11, :cond_8

    .line 109
    .line 110
    if-ne v6, v9, :cond_5

    .line 111
    .line 112
    iget v11, v5, Lt/e;->w:I

    .line 113
    .line 114
    if-nez v11, :cond_5

    .line 115
    .line 116
    if-eq v8, v9, :cond_5

    .line 117
    .line 118
    invoke-virtual {v5}, Lt/e;->i0()Z

    .line 119
    .line 120
    .line 121
    move-result v11

    .line 122
    if-nez v11, :cond_5

    .line 123
    .line 124
    move v10, v7

    .line 125
    :cond_5
    if-ne v8, v9, :cond_6

    .line 126
    .line 127
    iget v11, v5, Lt/e;->x:I

    .line 128
    .line 129
    if-nez v11, :cond_6

    .line 130
    .line 131
    if-eq v6, v9, :cond_6

    .line 132
    .line 133
    invoke-virtual {v5}, Lt/e;->i0()Z

    .line 134
    .line 135
    .line 136
    move-result v11

    .line 137
    if-nez v11, :cond_6

    .line 138
    .line 139
    move v10, v7

    .line 140
    :cond_6
    if-eq v6, v9, :cond_7

    .line 141
    .line 142
    if-ne v8, v9, :cond_8

    .line 143
    .line 144
    :cond_7
    iget v6, v5, Lt/e;->d0:F

    .line 145
    .line 146
    const/4 v8, 0x0

    .line 147
    cmpl-float v6, v6, v8

    .line 148
    .line 149
    if-lez v6, :cond_8

    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_8
    move v7, v10

    .line 153
    :goto_2
    if-eqz v7, :cond_9

    .line 154
    .line 155
    goto :goto_3

    .line 156
    :cond_9
    sget v6, Lu/b$a;->k:I

    .line 157
    .line 158
    invoke-direct {p0, v2, v5, v6}, Lu/b;->a(Lu/b$b;Lt/e;I)Z

    .line 159
    .line 160
    .line 161
    :goto_3
    add-int/lit8 v4, v4, 0x1

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :cond_a
    invoke-interface {v2}, Lu/b$b;->b()V

    .line 166
    .line 167
    .line 168
    return-void
.end method

.method private c(Lt/f;Ljava/lang/String;III)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lt/e;->I()I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    invoke-virtual {p1}, Lt/e;->H()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {p1, v1}, Lt/e;->b1(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v1}, Lt/e;->a1(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p4}, Lt/e;->l1(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p5}, Lt/e;->M0(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, p2}, Lt/e;->b1(I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lt/e;->a1(I)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lu/b;->c:Lt/f;

    .line 32
    .line 33
    invoke-virtual {p1, p3}, Lt/f;->Z1(I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lu/b;->c:Lt/f;

    .line 37
    .line 38
    invoke-virtual {p0}, Lt/f;->t1()V

    .line 39
    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public d(Lt/f;IIIIIIIII)J
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p5

    .line 8
    .line 9
    move/from16 v4, p7

    .line 10
    .line 11
    invoke-virtual {v1}, Lt/f;->K1()Lu/b$b;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    iget-object v6, v1, Lt/m;->L0:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    invoke-virtual {v1}, Lt/e;->W()I

    .line 22
    .line 23
    .line 24
    move-result v7

    .line 25
    invoke-virtual {v1}, Lt/e;->x()I

    .line 26
    .line 27
    .line 28
    move-result v8

    .line 29
    const/16 v9, 0x80

    .line 30
    .line 31
    invoke-static {v2, v9}, Lt/k;->b(II)Z

    .line 32
    .line 33
    .line 34
    move-result v9

    .line 35
    const/4 v11, 0x0

    .line 36
    if-nez v9, :cond_1

    .line 37
    .line 38
    const/16 v12, 0x40

    .line 39
    .line 40
    invoke-static {v2, v12}, Lt/k;->b(II)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    move v2, v11

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    :goto_0
    const/4 v2, 0x1

    .line 50
    :goto_1
    if-eqz v2, :cond_a

    .line 51
    .line 52
    move v12, v11

    .line 53
    :goto_2
    if-ge v12, v6, :cond_a

    .line 54
    .line 55
    iget-object v13, v1, Lt/m;->L0:Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-virtual {v13, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v13

    .line 61
    check-cast v13, Lt/e;

    .line 62
    .line 63
    invoke-virtual {v13}, Lt/e;->A()Lt/e$b;

    .line 64
    .line 65
    .line 66
    move-result-object v14

    .line 67
    sget-object v15, Lt/e$b;->i:Lt/e$b;

    .line 68
    .line 69
    if-ne v14, v15, :cond_2

    .line 70
    .line 71
    const/4 v14, 0x1

    .line 72
    :goto_3
    const/16 p9, 0x1

    .line 73
    .line 74
    goto :goto_4

    .line 75
    :cond_2
    move v14, v11

    .line 76
    goto :goto_3

    .line 77
    :goto_4
    invoke-virtual {v13}, Lt/e;->T()Lt/e$b;

    .line 78
    .line 79
    .line 80
    move-result-object v10

    .line 81
    if-ne v10, v15, :cond_3

    .line 82
    .line 83
    move/from16 v10, p9

    .line 84
    .line 85
    goto :goto_5

    .line 86
    :cond_3
    move v10, v11

    .line 87
    :goto_5
    if-eqz v14, :cond_4

    .line 88
    .line 89
    if-eqz v10, :cond_4

    .line 90
    .line 91
    invoke-virtual {v13}, Lt/e;->v()F

    .line 92
    .line 93
    .line 94
    move-result v10

    .line 95
    const/4 v14, 0x0

    .line 96
    cmpl-float v10, v10, v14

    .line 97
    .line 98
    if-lez v10, :cond_4

    .line 99
    .line 100
    move/from16 v10, p9

    .line 101
    .line 102
    goto :goto_6

    .line 103
    :cond_4
    move v10, v11

    .line 104
    :goto_6
    invoke-virtual {v13}, Lt/e;->i0()Z

    .line 105
    .line 106
    .line 107
    move-result v14

    .line 108
    if-eqz v14, :cond_6

    .line 109
    .line 110
    if-eqz v10, :cond_6

    .line 111
    .line 112
    :cond_5
    :goto_7
    move v2, v11

    .line 113
    goto :goto_8

    .line 114
    :cond_6
    invoke-virtual {v13}, Lt/e;->k0()Z

    .line 115
    .line 116
    .line 117
    move-result v14

    .line 118
    if-eqz v14, :cond_7

    .line 119
    .line 120
    if-eqz v10, :cond_7

    .line 121
    .line 122
    goto :goto_7

    .line 123
    :cond_7
    instance-of v10, v13, Lt/l;

    .line 124
    .line 125
    if-eqz v10, :cond_8

    .line 126
    .line 127
    goto :goto_7

    .line 128
    :cond_8
    invoke-virtual {v13}, Lt/e;->i0()Z

    .line 129
    .line 130
    .line 131
    move-result v10

    .line 132
    if-nez v10, :cond_5

    .line 133
    .line 134
    invoke-virtual {v13}, Lt/e;->k0()Z

    .line 135
    .line 136
    .line 137
    move-result v10

    .line 138
    if-eqz v10, :cond_9

    .line 139
    .line 140
    goto :goto_7

    .line 141
    :cond_9
    add-int/lit8 v12, v12, 0x1

    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_a
    const/16 p9, 0x1

    .line 145
    .line 146
    :goto_8
    if-eqz v2, :cond_b

    .line 147
    .line 148
    sget-boolean v10, Lq/d;->s:Z

    .line 149
    .line 150
    :cond_b
    const/high16 v10, 0x40000000    # 2.0f

    .line 151
    .line 152
    if-ne v3, v10, :cond_c

    .line 153
    .line 154
    if-eq v4, v10, :cond_d

    .line 155
    .line 156
    :cond_c
    if-eqz v9, :cond_e

    .line 157
    .line 158
    :cond_d
    move/from16 v12, p9

    .line 159
    .line 160
    goto :goto_9

    .line 161
    :cond_e
    move v12, v11

    .line 162
    :goto_9
    and-int/2addr v2, v12

    .line 163
    const/4 v12, 0x2

    .line 164
    if-eqz v2, :cond_16

    .line 165
    .line 166
    invoke-virtual {v1}, Lt/e;->G()I

    .line 167
    .line 168
    .line 169
    move-result v13

    .line 170
    move/from16 v14, p6

    .line 171
    .line 172
    invoke-static {v13, v14}, Ljava/lang/Math;->min(II)I

    .line 173
    .line 174
    .line 175
    move-result v13

    .line 176
    invoke-virtual {v1}, Lt/e;->F()I

    .line 177
    .line 178
    .line 179
    move-result v14

    .line 180
    move/from16 v15, p8

    .line 181
    .line 182
    invoke-static {v14, v15}, Ljava/lang/Math;->min(II)I

    .line 183
    .line 184
    .line 185
    move-result v14

    .line 186
    if-ne v3, v10, :cond_f

    .line 187
    .line 188
    invoke-virtual {v1}, Lt/e;->W()I

    .line 189
    .line 190
    .line 191
    move-result v15

    .line 192
    if-eq v15, v13, :cond_f

    .line 193
    .line 194
    invoke-virtual {v1, v13}, Lt/e;->l1(I)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v1}, Lt/f;->O1()V

    .line 198
    .line 199
    .line 200
    :cond_f
    if-ne v4, v10, :cond_10

    .line 201
    .line 202
    invoke-virtual {v1}, Lt/e;->x()I

    .line 203
    .line 204
    .line 205
    move-result v13

    .line 206
    if-eq v13, v14, :cond_10

    .line 207
    .line 208
    invoke-virtual {v1, v14}, Lt/e;->M0(I)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {v1}, Lt/f;->O1()V

    .line 212
    .line 213
    .line 214
    :cond_10
    if-ne v3, v10, :cond_11

    .line 215
    .line 216
    if-ne v4, v10, :cond_11

    .line 217
    .line 218
    invoke-virtual {v1, v9}, Lt/f;->G1(Z)Z

    .line 219
    .line 220
    .line 221
    move-result v9

    .line 222
    move v13, v12

    .line 223
    goto :goto_b

    .line 224
    :cond_11
    invoke-virtual {v1, v9}, Lt/f;->H1(Z)Z

    .line 225
    .line 226
    .line 227
    move-result v13

    .line 228
    if-ne v3, v10, :cond_12

    .line 229
    .line 230
    invoke-virtual {v1, v9, v11}, Lt/f;->I1(ZI)Z

    .line 231
    .line 232
    .line 233
    move-result v14

    .line 234
    and-int/2addr v13, v14

    .line 235
    move v14, v13

    .line 236
    move/from16 v13, p9

    .line 237
    .line 238
    goto :goto_a

    .line 239
    :cond_12
    move v14, v13

    .line 240
    move v13, v11

    .line 241
    :goto_a
    if-ne v4, v10, :cond_13

    .line 242
    .line 243
    move/from16 v15, p9

    .line 244
    .line 245
    invoke-virtual {v1, v9, v15}, Lt/f;->I1(ZI)Z

    .line 246
    .line 247
    .line 248
    move-result v9

    .line 249
    and-int/2addr v9, v14

    .line 250
    add-int/2addr v13, v15

    .line 251
    goto :goto_b

    .line 252
    :cond_13
    move v9, v14

    .line 253
    :goto_b
    if-eqz v9, :cond_17

    .line 254
    .line 255
    if-ne v3, v10, :cond_14

    .line 256
    .line 257
    const/4 v3, 0x1

    .line 258
    goto :goto_c

    .line 259
    :cond_14
    move v3, v11

    .line 260
    :goto_c
    if-ne v4, v10, :cond_15

    .line 261
    .line 262
    const/4 v4, 0x1

    .line 263
    goto :goto_d

    .line 264
    :cond_15
    move v4, v11

    .line 265
    :goto_d
    invoke-virtual {v1, v3, v4}, Lt/f;->q1(ZZ)V

    .line 266
    .line 267
    .line 268
    goto :goto_e

    .line 269
    :cond_16
    move v9, v11

    .line 270
    move v13, v9

    .line 271
    :cond_17
    :goto_e
    if-eqz v9, :cond_18

    .line 272
    .line 273
    if-eq v13, v12, :cond_31

    .line 274
    .line 275
    :cond_18
    invoke-virtual {v1}, Lt/f;->L1()I

    .line 276
    .line 277
    .line 278
    move-result v3

    .line 279
    if-lez v6, :cond_19

    .line 280
    .line 281
    invoke-direct/range {p0 .. p1}, Lu/b;->b(Lt/f;)V

    .line 282
    .line 283
    .line 284
    :cond_19
    invoke-virtual/range {p0 .. p1}, Lu/b;->e(Lt/f;)V

    .line 285
    .line 286
    .line 287
    iget-object v4, v0, Lu/b;->a:Ljava/util/ArrayList;

    .line 288
    .line 289
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 290
    .line 291
    .line 292
    move-result v4

    .line 293
    if-lez v6, :cond_1a

    .line 294
    .line 295
    const-string v6, "First pass"

    .line 296
    .line 297
    const/4 v9, 0x0

    .line 298
    move-object/from16 p2, v0

    .line 299
    .line 300
    move-object/from16 p3, v1

    .line 301
    .line 302
    move-object/from16 p4, v6

    .line 303
    .line 304
    move/from16 p6, v7

    .line 305
    .line 306
    move/from16 p7, v8

    .line 307
    .line 308
    move/from16 p5, v9

    .line 309
    .line 310
    invoke-direct/range {p2 .. p7}, Lu/b;->c(Lt/f;Ljava/lang/String;III)V

    .line 311
    .line 312
    .line 313
    move/from16 v1, p6

    .line 314
    .line 315
    move/from16 v6, p7

    .line 316
    .line 317
    goto :goto_f

    .line 318
    :cond_1a
    move v1, v7

    .line 319
    move v6, v8

    .line 320
    :goto_f
    if-lez v4, :cond_30

    .line 321
    .line 322
    invoke-virtual/range {p1 .. p1}, Lt/e;->A()Lt/e$b;

    .line 323
    .line 324
    .line 325
    move-result-object v7

    .line 326
    sget-object v8, Lt/e$b;->h:Lt/e$b;

    .line 327
    .line 328
    if-ne v7, v8, :cond_1b

    .line 329
    .line 330
    const/4 v15, 0x1

    .line 331
    goto :goto_10

    .line 332
    :cond_1b
    move v15, v11

    .line 333
    :goto_10
    invoke-virtual/range {p1 .. p1}, Lt/e;->T()Lt/e$b;

    .line 334
    .line 335
    .line 336
    move-result-object v7

    .line 337
    if-ne v7, v8, :cond_1c

    .line 338
    .line 339
    const/4 v7, 0x1

    .line 340
    goto :goto_11

    .line 341
    :cond_1c
    move v7, v11

    .line 342
    :goto_11
    invoke-virtual/range {p1 .. p1}, Lt/e;->W()I

    .line 343
    .line 344
    .line 345
    move-result v8

    .line 346
    iget-object v9, v0, Lu/b;->c:Lt/f;

    .line 347
    .line 348
    invoke-virtual {v9}, Lt/e;->I()I

    .line 349
    .line 350
    .line 351
    move-result v9

    .line 352
    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    .line 353
    .line 354
    .line 355
    move-result v8

    .line 356
    invoke-virtual/range {p1 .. p1}, Lt/e;->x()I

    .line 357
    .line 358
    .line 359
    move-result v9

    .line 360
    iget-object v10, v0, Lu/b;->c:Lt/f;

    .line 361
    .line 362
    invoke-virtual {v10}, Lt/e;->H()I

    .line 363
    .line 364
    .line 365
    move-result v10

    .line 366
    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    .line 367
    .line 368
    .line 369
    move-result v9

    .line 370
    move v10, v11

    .line 371
    move v13, v10

    .line 372
    :goto_12
    if-ge v10, v4, :cond_22

    .line 373
    .line 374
    iget-object v14, v0, Lu/b;->a:Ljava/util/ArrayList;

    .line 375
    .line 376
    invoke-virtual {v14, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 377
    .line 378
    .line 379
    move-result-object v14

    .line 380
    check-cast v14, Lt/e;

    .line 381
    .line 382
    instance-of v11, v14, Lt/l;

    .line 383
    .line 384
    if-nez v11, :cond_1d

    .line 385
    .line 386
    move/from16 p6, v1

    .line 387
    .line 388
    :goto_13
    const/4 v1, 0x1

    .line 389
    goto/16 :goto_15

    .line 390
    .line 391
    :cond_1d
    invoke-virtual {v14}, Lt/e;->W()I

    .line 392
    .line 393
    .line 394
    move-result v11

    .line 395
    invoke-virtual {v14}, Lt/e;->x()I

    .line 396
    .line 397
    .line 398
    move-result v12

    .line 399
    move/from16 p6, v1

    .line 400
    .line 401
    sget v1, Lu/b$a;->l:I

    .line 402
    .line 403
    invoke-direct {v0, v5, v14, v1}, Lu/b;->a(Lu/b$b;Lt/e;I)Z

    .line 404
    .line 405
    .line 406
    move-result v1

    .line 407
    or-int/2addr v1, v13

    .line 408
    invoke-virtual {v14}, Lt/e;->W()I

    .line 409
    .line 410
    .line 411
    move-result v13

    .line 412
    move/from16 p2, v1

    .line 413
    .line 414
    invoke-virtual {v14}, Lt/e;->x()I

    .line 415
    .line 416
    .line 417
    move-result v1

    .line 418
    if-eq v13, v11, :cond_1f

    .line 419
    .line 420
    invoke-virtual {v14, v13}, Lt/e;->l1(I)V

    .line 421
    .line 422
    .line 423
    if-eqz v15, :cond_1e

    .line 424
    .line 425
    invoke-virtual {v14}, Lt/e;->M()I

    .line 426
    .line 427
    .line 428
    move-result v11

    .line 429
    if-le v11, v8, :cond_1e

    .line 430
    .line 431
    invoke-virtual {v14}, Lt/e;->M()I

    .line 432
    .line 433
    .line 434
    move-result v11

    .line 435
    sget-object v13, Lt/d$a;->j:Lt/d$a;

    .line 436
    .line 437
    invoke-virtual {v14, v13}, Lt/e;->o(Lt/d$a;)Lt/d;

    .line 438
    .line 439
    .line 440
    move-result-object v13

    .line 441
    invoke-virtual {v13}, Lt/d;->f()I

    .line 442
    .line 443
    .line 444
    move-result v13

    .line 445
    add-int/2addr v11, v13

    .line 446
    invoke-static {v8, v11}, Ljava/lang/Math;->max(II)I

    .line 447
    .line 448
    .line 449
    move-result v8

    .line 450
    :cond_1e
    move v11, v8

    .line 451
    const/4 v8, 0x1

    .line 452
    goto :goto_14

    .line 453
    :cond_1f
    move v11, v8

    .line 454
    move/from16 v8, p2

    .line 455
    .line 456
    :goto_14
    if-eq v1, v12, :cond_21

    .line 457
    .line 458
    invoke-virtual {v14, v1}, Lt/e;->M0(I)V

    .line 459
    .line 460
    .line 461
    if-eqz v7, :cond_20

    .line 462
    .line 463
    invoke-virtual {v14}, Lt/e;->r()I

    .line 464
    .line 465
    .line 466
    move-result v1

    .line 467
    if-le v1, v9, :cond_20

    .line 468
    .line 469
    invoke-virtual {v14}, Lt/e;->r()I

    .line 470
    .line 471
    .line 472
    move-result v1

    .line 473
    sget-object v8, Lt/d$a;->k:Lt/d$a;

    .line 474
    .line 475
    invoke-virtual {v14, v8}, Lt/e;->o(Lt/d$a;)Lt/d;

    .line 476
    .line 477
    .line 478
    move-result-object v8

    .line 479
    invoke-virtual {v8}, Lt/d;->f()I

    .line 480
    .line 481
    .line 482
    move-result v8

    .line 483
    add-int/2addr v1, v8

    .line 484
    invoke-static {v9, v1}, Ljava/lang/Math;->max(II)I

    .line 485
    .line 486
    .line 487
    move-result v9

    .line 488
    :cond_20
    const/4 v8, 0x1

    .line 489
    :cond_21
    check-cast v14, Lt/l;

    .line 490
    .line 491
    invoke-virtual {v14}, Lt/l;->G1()Z

    .line 492
    .line 493
    .line 494
    move-result v1

    .line 495
    or-int v13, v8, v1

    .line 496
    .line 497
    move v8, v11

    .line 498
    goto :goto_13

    .line 499
    :goto_15
    add-int/2addr v10, v1

    .line 500
    move/from16 v1, p6

    .line 501
    .line 502
    const/4 v11, 0x0

    .line 503
    const/4 v12, 0x2

    .line 504
    goto/16 :goto_12

    .line 505
    .line 506
    :cond_22
    move/from16 p6, v1

    .line 507
    .line 508
    move v1, v12

    .line 509
    const/4 v10, 0x0

    .line 510
    :goto_16
    if-ge v10, v1, :cond_30

    .line 511
    .line 512
    const/4 v11, 0x0

    .line 513
    :goto_17
    if-ge v11, v4, :cond_2f

    .line 514
    .line 515
    iget-object v12, v0, Lu/b;->a:Ljava/util/ArrayList;

    .line 516
    .line 517
    invoke-virtual {v12, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 518
    .line 519
    .line 520
    move-result-object v12

    .line 521
    check-cast v12, Lt/e;

    .line 522
    .line 523
    instance-of v14, v12, Lt/i;

    .line 524
    .line 525
    if-eqz v14, :cond_23

    .line 526
    .line 527
    instance-of v14, v12, Lt/l;

    .line 528
    .line 529
    if-eqz v14, :cond_27

    .line 530
    .line 531
    :cond_23
    instance-of v14, v12, Lt/h;

    .line 532
    .line 533
    if-eqz v14, :cond_24

    .line 534
    .line 535
    goto :goto_18

    .line 536
    :cond_24
    invoke-virtual {v12}, Lt/e;->V()I

    .line 537
    .line 538
    .line 539
    move-result v14

    .line 540
    const/16 v1, 0x8

    .line 541
    .line 542
    if-ne v14, v1, :cond_25

    .line 543
    .line 544
    goto :goto_18

    .line 545
    :cond_25
    if-eqz v2, :cond_26

    .line 546
    .line 547
    iget-object v1, v12, Lt/e;->e:Lu/l;

    .line 548
    .line 549
    iget-object v1, v1, Lu/p;->e:Lu/g;

    .line 550
    .line 551
    iget-boolean v1, v1, Lu/f;->j:Z

    .line 552
    .line 553
    if-eqz v1, :cond_26

    .line 554
    .line 555
    iget-object v1, v12, Lt/e;->f:Lu/n;

    .line 556
    .line 557
    iget-object v1, v1, Lu/p;->e:Lu/g;

    .line 558
    .line 559
    iget-boolean v1, v1, Lu/f;->j:Z

    .line 560
    .line 561
    if-eqz v1, :cond_26

    .line 562
    .line 563
    goto :goto_18

    .line 564
    :cond_26
    instance-of v1, v12, Lt/l;

    .line 565
    .line 566
    if-eqz v1, :cond_28

    .line 567
    .line 568
    :cond_27
    :goto_18
    move/from16 v16, v2

    .line 569
    .line 570
    move/from16 p8, v4

    .line 571
    .line 572
    :goto_19
    const/4 v1, 0x1

    .line 573
    goto/16 :goto_1a

    .line 574
    .line 575
    :cond_28
    invoke-virtual {v12}, Lt/e;->W()I

    .line 576
    .line 577
    .line 578
    move-result v1

    .line 579
    invoke-virtual {v12}, Lt/e;->x()I

    .line 580
    .line 581
    .line 582
    move-result v14

    .line 583
    move/from16 v16, v2

    .line 584
    .line 585
    invoke-virtual {v12}, Lt/e;->p()I

    .line 586
    .line 587
    .line 588
    move-result v2

    .line 589
    sget v17, Lu/b$a;->l:I

    .line 590
    .line 591
    move/from16 p8, v4

    .line 592
    .line 593
    const/4 v4, 0x1

    .line 594
    if-ne v10, v4, :cond_29

    .line 595
    .line 596
    sget v17, Lu/b$a;->m:I

    .line 597
    .line 598
    :cond_29
    move/from16 v4, v17

    .line 599
    .line 600
    invoke-direct {v0, v5, v12, v4}, Lu/b;->a(Lu/b$b;Lt/e;I)Z

    .line 601
    .line 602
    .line 603
    move-result v4

    .line 604
    or-int/2addr v4, v13

    .line 605
    invoke-virtual {v12}, Lt/e;->W()I

    .line 606
    .line 607
    .line 608
    move-result v13

    .line 609
    invoke-virtual {v12}, Lt/e;->x()I

    .line 610
    .line 611
    .line 612
    move-result v0

    .line 613
    if-eq v13, v1, :cond_2b

    .line 614
    .line 615
    invoke-virtual {v12, v13}, Lt/e;->l1(I)V

    .line 616
    .line 617
    .line 618
    if-eqz v15, :cond_2a

    .line 619
    .line 620
    invoke-virtual {v12}, Lt/e;->M()I

    .line 621
    .line 622
    .line 623
    move-result v1

    .line 624
    if-le v1, v8, :cond_2a

    .line 625
    .line 626
    invoke-virtual {v12}, Lt/e;->M()I

    .line 627
    .line 628
    .line 629
    move-result v1

    .line 630
    sget-object v4, Lt/d$a;->j:Lt/d$a;

    .line 631
    .line 632
    invoke-virtual {v12, v4}, Lt/e;->o(Lt/d$a;)Lt/d;

    .line 633
    .line 634
    .line 635
    move-result-object v4

    .line 636
    invoke-virtual {v4}, Lt/d;->f()I

    .line 637
    .line 638
    .line 639
    move-result v4

    .line 640
    add-int/2addr v1, v4

    .line 641
    invoke-static {v8, v1}, Ljava/lang/Math;->max(II)I

    .line 642
    .line 643
    .line 644
    move-result v8

    .line 645
    :cond_2a
    const/4 v4, 0x1

    .line 646
    :cond_2b
    if-eq v0, v14, :cond_2d

    .line 647
    .line 648
    invoke-virtual {v12, v0}, Lt/e;->M0(I)V

    .line 649
    .line 650
    .line 651
    if-eqz v7, :cond_2c

    .line 652
    .line 653
    invoke-virtual {v12}, Lt/e;->r()I

    .line 654
    .line 655
    .line 656
    move-result v0

    .line 657
    if-le v0, v9, :cond_2c

    .line 658
    .line 659
    invoke-virtual {v12}, Lt/e;->r()I

    .line 660
    .line 661
    .line 662
    move-result v0

    .line 663
    sget-object v1, Lt/d$a;->k:Lt/d$a;

    .line 664
    .line 665
    invoke-virtual {v12, v1}, Lt/e;->o(Lt/d$a;)Lt/d;

    .line 666
    .line 667
    .line 668
    move-result-object v1

    .line 669
    invoke-virtual {v1}, Lt/d;->f()I

    .line 670
    .line 671
    .line 672
    move-result v1

    .line 673
    add-int/2addr v0, v1

    .line 674
    invoke-static {v9, v0}, Ljava/lang/Math;->max(II)I

    .line 675
    .line 676
    .line 677
    move-result v9

    .line 678
    :cond_2c
    const/4 v4, 0x1

    .line 679
    :cond_2d
    invoke-virtual {v12}, Lt/e;->Z()Z

    .line 680
    .line 681
    .line 682
    move-result v0

    .line 683
    if-eqz v0, :cond_2e

    .line 684
    .line 685
    invoke-virtual {v12}, Lt/e;->p()I

    .line 686
    .line 687
    .line 688
    move-result v0

    .line 689
    if-eq v2, v0, :cond_2e

    .line 690
    .line 691
    const/4 v1, 0x1

    .line 692
    const/4 v13, 0x1

    .line 693
    goto :goto_1a

    .line 694
    :cond_2e
    move v13, v4

    .line 695
    goto :goto_19

    .line 696
    :goto_1a
    add-int/2addr v11, v1

    .line 697
    move-object/from16 v0, p0

    .line 698
    .line 699
    move/from16 v4, p8

    .line 700
    .line 701
    move/from16 v2, v16

    .line 702
    .line 703
    const/4 v1, 0x2

    .line 704
    goto/16 :goto_17

    .line 705
    .line 706
    :cond_2f
    move/from16 v16, v2

    .line 707
    .line 708
    move/from16 p8, v4

    .line 709
    .line 710
    const/4 v1, 0x1

    .line 711
    if-eqz v13, :cond_30

    .line 712
    .line 713
    add-int/2addr v10, v1

    .line 714
    const-string v0, "intermediate pass"

    .line 715
    .line 716
    move-object/from16 p2, p0

    .line 717
    .line 718
    move-object/from16 p3, p1

    .line 719
    .line 720
    move-object/from16 p4, v0

    .line 721
    .line 722
    move/from16 p7, v6

    .line 723
    .line 724
    move/from16 p5, v10

    .line 725
    .line 726
    invoke-direct/range {p2 .. p7}, Lu/b;->c(Lt/f;Ljava/lang/String;III)V

    .line 727
    .line 728
    .line 729
    move-object/from16 v0, p3

    .line 730
    .line 731
    move-object/from16 v0, p0

    .line 732
    .line 733
    move/from16 v4, p8

    .line 734
    .line 735
    move/from16 v2, v16

    .line 736
    .line 737
    const/4 v1, 0x2

    .line 738
    const/4 v13, 0x0

    .line 739
    goto/16 :goto_16

    .line 740
    .line 741
    :cond_30
    move-object/from16 v0, p1

    .line 742
    .line 743
    invoke-virtual {v0, v3}, Lt/f;->Y1(I)V

    .line 744
    .line 745
    .line 746
    :cond_31
    const-wide/16 v0, 0x0

    .line 747
    .line 748
    return-wide v0
.end method

.method public e(Lt/f;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lu/b;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lt/m;->L0:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    :goto_0
    if-ge v1, v0, :cond_2

    .line 14
    .line 15
    iget-object v2, p1, Lt/m;->L0:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lt/e;

    .line 22
    .line 23
    invoke-virtual {v2}, Lt/e;->A()Lt/e$b;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    sget-object v4, Lt/e$b;->i:Lt/e$b;

    .line 28
    .line 29
    if-eq v3, v4, :cond_0

    .line 30
    .line 31
    invoke-virtual {v2}, Lt/e;->T()Lt/e$b;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    if-ne v3, v4, :cond_1

    .line 36
    .line 37
    :cond_0
    iget-object v3, p0, Lu/b;->a:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    invoke-virtual {p1}, Lt/f;->O1()V

    .line 46
    .line 47
    .line 48
    return-void
.end method
