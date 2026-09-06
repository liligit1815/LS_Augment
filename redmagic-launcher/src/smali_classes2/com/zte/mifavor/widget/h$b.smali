.class public Lcom/zte/mifavor/widget/h$b;
.super Ljava/lang/Object;
.source "G2ContinuousRoundedPath.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public final a:D

.field public final b:D

.field public final c:D

.field public final d:D

.field private e:Lcom/zte/mifavor/widget/h$a;


# direct methods
.method public constructor <init>(DDDD)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/zte/mifavor/widget/h$b;->a:D

    .line 5
    .line 6
    iput-wide p3, p0, Lcom/zte/mifavor/widget/h$b;->b:D

    .line 7
    .line 8
    iput-wide p5, p0, Lcom/zte/mifavor/widget/h$b;->c:D

    .line 9
    .line 10
    iput-wide p7, p0, Lcom/zte/mifavor/widget/h$b;->d:D

    .line 11
    .line 12
    return-void
.end method

.method private a()Lcom/zte/mifavor/widget/h$a;
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v1, v0, Lcom/zte/mifavor/widget/h$b;->b:D

    .line 4
    .line 5
    const-wide v3, 0x3ff921fb54442d18L    # 1.5707963267948966

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    mul-double/2addr v1, v3

    .line 11
    sub-double/2addr v3, v1

    .line 12
    const-wide/high16 v1, 0x3fe0000000000000L    # 0.5

    .line 13
    .line 14
    mul-double/2addr v3, v1

    .line 15
    invoke-static {v3, v4}, Ljava/lang/Math;->sin(D)D

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    invoke-static {v3, v4}, Ljava/lang/Math;->cos(D)D

    .line 20
    .line 21
    .line 22
    move-result-wide v3

    .line 23
    iget-wide v5, v0, Lcom/zte/mifavor/widget/h$b;->c:D

    .line 24
    .line 25
    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    .line 26
    .line 27
    cmpl-double v5, v5, v7

    .line 28
    .line 29
    const-wide/16 v9, 0x0

    .line 30
    .line 31
    if-nez v5, :cond_0

    .line 32
    .line 33
    iget-wide v5, v0, Lcom/zte/mifavor/widget/h$b;->d:D

    .line 34
    .line 35
    cmpl-double v5, v5, v7

    .line 36
    .line 37
    if-nez v5, :cond_0

    .line 38
    .line 39
    add-double v5, v3, v7

    .line 40
    .line 41
    div-double v11, v1, v5

    .line 42
    .line 43
    new-instance v13, Lcom/zte/mifavor/widget/h$a;

    .line 44
    .line 45
    new-instance v14, Lcom/zte/mifavor/widget/h$c;

    .line 46
    .line 47
    move-wide v15, v7

    .line 48
    iget-wide v7, v0, Lcom/zte/mifavor/widget/h$b;->a:D

    .line 49
    .line 50
    neg-double v7, v7

    .line 51
    invoke-direct {v14, v7, v8, v9, v10}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 52
    .line 53
    .line 54
    new-instance v0, Lcom/zte/mifavor/widget/h$c;

    .line 55
    .line 56
    const-wide/high16 v7, 0x3ff8000000000000L    # 1.5

    .line 57
    .line 58
    div-double/2addr v7, v5

    .line 59
    sub-double v7, v15, v7

    .line 60
    .line 61
    mul-double/2addr v7, v11

    .line 62
    invoke-direct {v0, v7, v8, v9, v10}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 63
    .line 64
    .line 65
    new-instance v5, Lcom/zte/mifavor/widget/h$c;

    .line 66
    .line 67
    invoke-direct {v5, v11, v12, v9, v10}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 68
    .line 69
    .line 70
    new-instance v6, Lcom/zte/mifavor/widget/h$c;

    .line 71
    .line 72
    sub-double v7, v15, v3

    .line 73
    .line 74
    invoke-direct {v6, v1, v2, v7, v8}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 75
    .line 76
    .line 77
    invoke-direct {v13, v14, v0, v5, v6}, Lcom/zte/mifavor/widget/h$a;-><init>(Lcom/zte/mifavor/widget/h$c;Lcom/zte/mifavor/widget/h$c;Lcom/zte/mifavor/widget/h$c;Lcom/zte/mifavor/widget/h$c;)V

    .line 78
    .line 79
    .line 80
    return-object v13

    .line 81
    :cond_0
    move-wide v15, v7

    .line 82
    iget-wide v5, v0, Lcom/zte/mifavor/widget/h$b;->d:D

    .line 83
    .line 84
    div-double v7, v15, v5

    .line 85
    .line 86
    new-instance v5, Lcom/zte/mifavor/widget/h$c;

    .line 87
    .line 88
    move-wide v11, v15

    .line 89
    invoke-direct {v5, v9, v10, v11, v12}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 90
    .line 91
    .line 92
    new-instance v6, Lcom/zte/mifavor/widget/h$c;

    .line 93
    .line 94
    const-wide/high16 v13, 0x4000000000000000L    # 2.0

    .line 95
    .line 96
    invoke-static {v13, v14}, Ljava/lang/Math;->sqrt(D)D

    .line 97
    .line 98
    .line 99
    move-result-wide v15

    .line 100
    move-wide/from16 v17, v11

    .line 101
    .line 102
    div-double v11, v17, v15

    .line 103
    .line 104
    const-wide/high16 v15, -0x4010000000000000L    # -1.0

    .line 105
    .line 106
    invoke-static {v13, v14}, Ljava/lang/Math;->sqrt(D)D

    .line 107
    .line 108
    .line 109
    move-result-wide v13

    .line 110
    div-double v13, v15, v13

    .line 111
    .line 112
    invoke-direct {v6, v11, v12, v13, v14}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 113
    .line 114
    .line 115
    sub-double v11, v17, v7

    .line 116
    .line 117
    invoke-virtual {v6, v11, v12}, Lcom/zte/mifavor/widget/h$c;->c(D)Lcom/zte/mifavor/widget/h$c;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    invoke-virtual {v5, v6}, Lcom/zte/mifavor/widget/h$c;->b(Lcom/zte/mifavor/widget/h$c;)Lcom/zte/mifavor/widget/h$c;

    .line 122
    .line 123
    .line 124
    move-result-object v5

    .line 125
    new-instance v6, Lcom/zte/mifavor/widget/h$c;

    .line 126
    .line 127
    neg-double v11, v3

    .line 128
    invoke-direct {v6, v1, v2, v11, v12}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v6, v7, v8}, Lcom/zte/mifavor/widget/h$c;->c(D)Lcom/zte/mifavor/widget/h$c;

    .line 132
    .line 133
    .line 134
    move-result-object v6

    .line 135
    invoke-virtual {v5, v6}, Lcom/zte/mifavor/widget/h$c;->b(Lcom/zte/mifavor/widget/h$c;)Lcom/zte/mifavor/widget/h$c;

    .line 136
    .line 137
    .line 138
    move-result-object v18

    .line 139
    new-instance v5, Lcom/zte/mifavor/widget/h$c;

    .line 140
    .line 141
    iget-wide v6, v0, Lcom/zte/mifavor/widget/h$b;->a:D

    .line 142
    .line 143
    neg-double v6, v6

    .line 144
    invoke-direct {v5, v6, v7, v9, v10}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 145
    .line 146
    .line 147
    new-instance v6, Lcom/zte/mifavor/widget/h$c;

    .line 148
    .line 149
    const-wide/high16 v11, 0x3ff0000000000000L    # 1.0

    .line 150
    .line 151
    invoke-direct {v6, v11, v12, v9, v10}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 152
    .line 153
    .line 154
    new-instance v7, Lcom/zte/mifavor/widget/h$c;

    .line 155
    .line 156
    invoke-direct {v7, v3, v4, v1, v2}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 157
    .line 158
    .line 159
    iget-wide v0, v0, Lcom/zte/mifavor/widget/h$b;->c:D

    .line 160
    .line 161
    move-wide/from16 v21, v0

    .line 162
    .line 163
    move-object/from16 v17, v5

    .line 164
    .line 165
    move-object/from16 v19, v6

    .line 166
    .line 167
    move-object/from16 v20, v7

    .line 168
    .line 169
    invoke-static/range {v17 .. v22}, Lcom/zte/mifavor/widget/h$b;->d(Lcom/zte/mifavor/widget/h$c;Lcom/zte/mifavor/widget/h$c;Lcom/zte/mifavor/widget/h$c;Lcom/zte/mifavor/widget/h$c;D)Lcom/zte/mifavor/widget/h$a;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    return-object v0
.end method

.method public static b()Lcom/zte/mifavor/widget/h$b;
    .locals 9

    .line 1
    new-instance v0, Lcom/zte/mifavor/widget/h$b;

    .line 2
    .line 3
    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    .line 4
    .line 5
    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    .line 6
    .line 7
    const-wide v1, 0x3fd9603c9b91c15eL    # 0.396498825

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    const-wide/16 v3, 0x0

    .line 13
    .line 14
    invoke-direct/range {v0 .. v8}, Lcom/zte/mifavor/widget/h$b;-><init>(DDDD)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public static c()Lcom/zte/mifavor/widget/h$b;
    .locals 9

    .line 1
    new-instance v0, Lcom/zte/mifavor/widget/h$b;

    .line 2
    .line 3
    const-wide v5, 0x3ff12bd91c666814L    # 1.0732051

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    const-wide v7, 0x3ff12bd91c666814L    # 1.0732051

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    const-wide v1, 0x3fe0ead312612b94L    # 0.5286651

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    const-wide v3, 0x3fe1c71c71c71c72L    # 0.5555555555555556

    .line 19
    .line 20
    .line 21
    .line 22
    .line 23
    invoke-direct/range {v0 .. v8}, Lcom/zte/mifavor/widget/h$b;-><init>(DDDD)V

    .line 24
    .line 25
    .line 26
    return-object v0
.end method

.method private static d(Lcom/zte/mifavor/widget/h$c;Lcom/zte/mifavor/widget/h$c;Lcom/zte/mifavor/widget/h$c;Lcom/zte/mifavor/widget/h$c;D)Lcom/zte/mifavor/widget/h$a;
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    const-wide/high16 v4, 0x3ff8000000000000L    # 1.5

    .line 10
    .line 11
    mul-double v4, v4, p4

    .line 12
    .line 13
    iget-wide v6, v2, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 14
    .line 15
    iget-wide v8, v3, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 16
    .line 17
    mul-double v10, v6, v8

    .line 18
    .line 19
    iget-wide v12, v2, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 20
    .line 21
    iget-wide v14, v3, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 22
    .line 23
    mul-double v16, v12, v14

    .line 24
    .line 25
    sub-double v10, v10, v16

    .line 26
    .line 27
    move-wide/from16 p4, v4

    .line 28
    .line 29
    iget-wide v4, v1, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 30
    .line 31
    move-wide/from16 v16, v4

    .line 32
    .line 33
    iget-wide v4, v0, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 34
    .line 35
    sub-double v4, v16, v4

    .line 36
    .line 37
    move-wide/from16 v16, v4

    .line 38
    .line 39
    iget-wide v4, v1, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 40
    .line 41
    move-wide/from16 v18, v4

    .line 42
    .line 43
    iget-wide v4, v0, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 44
    .line 45
    sub-double v4, v18, v4

    .line 46
    .line 47
    move-wide/from16 v18, v6

    .line 48
    .line 49
    neg-double v6, v4

    .line 50
    mul-double v6, v6, v18

    .line 51
    .line 52
    mul-double v12, v12, v16

    .line 53
    .line 54
    add-double/2addr v6, v12

    .line 55
    mul-double/2addr v4, v14

    .line 56
    mul-double v8, v8, v16

    .line 57
    .line 58
    sub-double/2addr v4, v8

    .line 59
    neg-double v4, v4

    .line 60
    div-double/2addr v4, v10

    .line 61
    mul-double v8, p4, v6

    .line 62
    .line 63
    mul-double/2addr v8, v6

    .line 64
    div-double/2addr v8, v10

    .line 65
    div-double/2addr v8, v10

    .line 66
    div-double/2addr v8, v10

    .line 67
    sub-double/2addr v4, v8

    .line 68
    neg-double v6, v6

    .line 69
    div-double/2addr v6, v10

    .line 70
    new-instance v8, Lcom/zte/mifavor/widget/h$c;

    .line 71
    .line 72
    iget-wide v9, v2, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 73
    .line 74
    mul-double/2addr v9, v4

    .line 75
    const-wide/16 v11, 0x0

    .line 76
    .line 77
    invoke-static {v9, v10, v11, v12}, Ljava/lang/Math;->max(DD)D

    .line 78
    .line 79
    .line 80
    move-result-wide v9

    .line 81
    iget-wide v13, v2, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 82
    .line 83
    mul-double/2addr v4, v13

    .line 84
    invoke-static {v4, v5, v11, v12}, Ljava/lang/Math;->max(DD)D

    .line 85
    .line 86
    .line 87
    move-result-wide v4

    .line 88
    invoke-direct {v8, v9, v10, v4, v5}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v8}, Lcom/zte/mifavor/widget/h$c;->b(Lcom/zte/mifavor/widget/h$c;)Lcom/zte/mifavor/widget/h$c;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    new-instance v4, Lcom/zte/mifavor/widget/h$c;

    .line 96
    .line 97
    iget-wide v8, v3, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 98
    .line 99
    mul-double/2addr v8, v6

    .line 100
    invoke-static {v8, v9, v11, v12}, Ljava/lang/Math;->max(DD)D

    .line 101
    .line 102
    .line 103
    move-result-wide v8

    .line 104
    iget-wide v13, v3, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 105
    .line 106
    mul-double/2addr v6, v13

    .line 107
    invoke-static {v6, v7, v11, v12}, Ljava/lang/Math;->max(DD)D

    .line 108
    .line 109
    .line 110
    move-result-wide v5

    .line 111
    invoke-direct {v4, v8, v9, v5, v6}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1, v4}, Lcom/zte/mifavor/widget/h$c;->a(Lcom/zte/mifavor/widget/h$c;)Lcom/zte/mifavor/widget/h$c;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    new-instance v4, Lcom/zte/mifavor/widget/h$a;

    .line 119
    .line 120
    invoke-direct {v4, v0, v2, v3, v1}, Lcom/zte/mifavor/widget/h$a;-><init>(Lcom/zte/mifavor/widget/h$c;Lcom/zte/mifavor/widget/h$c;Lcom/zte/mifavor/widget/h$c;Lcom/zte/mifavor/widget/h$c;)V

    .line 121
    .line 122
    .line 123
    return-object v4
.end method


# virtual methods
.method public e()Lcom/zte/mifavor/widget/h$a;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/h$b;->e:Lcom/zte/mifavor/widget/h$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/zte/mifavor/widget/h$b;->a()Lcom/zte/mifavor/widget/h$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/zte/mifavor/widget/h$b;->e:Lcom/zte/mifavor/widget/h$a;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/zte/mifavor/widget/h$b;->e:Lcom/zte/mifavor/widget/h$a;

    .line 12
    .line 13
    return-object p0
.end method
