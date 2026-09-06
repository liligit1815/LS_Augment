.class Lt/g$a;
.super Ljava/lang/Object;
.source "Flow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lt/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field private a:I

.field private b:Lt/e;

.field c:I

.field private d:Lt/d;

.field private e:Lt/d;

.field private f:Lt/d;

.field private g:Lt/d;

.field private h:I

.field private i:I

.field private j:I

.field private k:I

.field private l:I

.field private m:I

.field private n:I

.field private o:I

.field private p:I

.field private q:I

.field final synthetic r:Lt/g;


# direct methods
.method constructor <init>(Lt/g;ILt/d;Lt/d;Lt/d;Lt/d;I)V
    .locals 1

    .line 1
    iput-object p1, p0, Lt/g$a;->r:Lt/g;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lt/g$a;->b:Lt/e;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Lt/g$a;->c:I

    .line 11
    .line 12
    iput v0, p0, Lt/g$a;->h:I

    .line 13
    .line 14
    iput v0, p0, Lt/g$a;->i:I

    .line 15
    .line 16
    iput v0, p0, Lt/g$a;->j:I

    .line 17
    .line 18
    iput v0, p0, Lt/g$a;->k:I

    .line 19
    .line 20
    iput v0, p0, Lt/g$a;->l:I

    .line 21
    .line 22
    iput v0, p0, Lt/g$a;->m:I

    .line 23
    .line 24
    iput v0, p0, Lt/g$a;->n:I

    .line 25
    .line 26
    iput v0, p0, Lt/g$a;->o:I

    .line 27
    .line 28
    iput v0, p0, Lt/g$a;->p:I

    .line 29
    .line 30
    iput v0, p0, Lt/g$a;->q:I

    .line 31
    .line 32
    iput p2, p0, Lt/g$a;->a:I

    .line 33
    .line 34
    iput-object p3, p0, Lt/g$a;->d:Lt/d;

    .line 35
    .line 36
    iput-object p4, p0, Lt/g$a;->e:Lt/d;

    .line 37
    .line 38
    iput-object p5, p0, Lt/g$a;->f:Lt/d;

    .line 39
    .line 40
    iput-object p6, p0, Lt/g$a;->g:Lt/d;

    .line 41
    .line 42
    invoke-virtual {p1}, Lt/l;->A1()I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    iput p2, p0, Lt/g$a;->h:I

    .line 47
    .line 48
    invoke-virtual {p1}, Lt/l;->C1()I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    iput p2, p0, Lt/g$a;->i:I

    .line 53
    .line 54
    invoke-virtual {p1}, Lt/l;->B1()I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    iput p2, p0, Lt/g$a;->j:I

    .line 59
    .line 60
    invoke-virtual {p1}, Lt/l;->z1()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    iput p1, p0, Lt/g$a;->k:I

    .line 65
    .line 66
    iput p7, p0, Lt/g$a;->q:I

    .line 67
    .line 68
    return-void
.end method

.method static synthetic a(Lt/g$a;)Lt/e;
    .locals 0

    .line 1
    iget-object p0, p0, Lt/g$a;->b:Lt/e;

    .line 2
    .line 3
    return-object p0
.end method

.method private h()V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lt/g$a;->l:I

    .line 3
    .line 4
    iput v0, p0, Lt/g$a;->m:I

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput-object v1, p0, Lt/g$a;->b:Lt/e;

    .line 8
    .line 9
    iput v0, p0, Lt/g$a;->c:I

    .line 10
    .line 11
    iget v1, p0, Lt/g$a;->o:I

    .line 12
    .line 13
    move v2, v0

    .line 14
    :goto_0
    if-ge v2, v1, :cond_7

    .line 15
    .line 16
    iget v3, p0, Lt/g$a;->n:I

    .line 17
    .line 18
    add-int/2addr v3, v2

    .line 19
    iget-object v4, p0, Lt/g$a;->r:Lt/g;

    .line 20
    .line 21
    invoke-static {v4}, Lt/g;->e2(Lt/g;)I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-lt v3, v4, :cond_0

    .line 26
    .line 27
    goto/16 :goto_2

    .line 28
    .line 29
    :cond_0
    iget-object v3, p0, Lt/g$a;->r:Lt/g;

    .line 30
    .line 31
    invoke-static {v3}, Lt/g;->f2(Lt/g;)[Lt/e;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    iget v4, p0, Lt/g$a;->n:I

    .line 36
    .line 37
    add-int/2addr v4, v2

    .line 38
    aget-object v3, v3, v4

    .line 39
    .line 40
    iget v4, p0, Lt/g$a;->a:I

    .line 41
    .line 42
    const/16 v5, 0x8

    .line 43
    .line 44
    if-nez v4, :cond_3

    .line 45
    .line 46
    invoke-virtual {v3}, Lt/e;->W()I

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    iget-object v6, p0, Lt/g$a;->r:Lt/g;

    .line 51
    .line 52
    invoke-static {v6}, Lt/g;->Q1(Lt/g;)I

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    invoke-virtual {v3}, Lt/e;->V()I

    .line 57
    .line 58
    .line 59
    move-result v7

    .line 60
    if-ne v7, v5, :cond_1

    .line 61
    .line 62
    move v6, v0

    .line 63
    :cond_1
    iget v5, p0, Lt/g$a;->l:I

    .line 64
    .line 65
    add-int/2addr v4, v6

    .line 66
    add-int/2addr v5, v4

    .line 67
    iput v5, p0, Lt/g$a;->l:I

    .line 68
    .line 69
    iget-object v4, p0, Lt/g$a;->r:Lt/g;

    .line 70
    .line 71
    iget v5, p0, Lt/g$a;->q:I

    .line 72
    .line 73
    invoke-static {v4, v3, v5}, Lt/g;->d2(Lt/g;Lt/e;I)I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    iget-object v5, p0, Lt/g$a;->b:Lt/e;

    .line 78
    .line 79
    if-eqz v5, :cond_2

    .line 80
    .line 81
    iget v5, p0, Lt/g$a;->c:I

    .line 82
    .line 83
    if-ge v5, v4, :cond_6

    .line 84
    .line 85
    :cond_2
    iput-object v3, p0, Lt/g$a;->b:Lt/e;

    .line 86
    .line 87
    iput v4, p0, Lt/g$a;->c:I

    .line 88
    .line 89
    iput v4, p0, Lt/g$a;->m:I

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_3
    iget-object v4, p0, Lt/g$a;->r:Lt/g;

    .line 93
    .line 94
    iget v6, p0, Lt/g$a;->q:I

    .line 95
    .line 96
    invoke-static {v4, v3, v6}, Lt/g;->c2(Lt/g;Lt/e;I)I

    .line 97
    .line 98
    .line 99
    move-result v4

    .line 100
    iget-object v6, p0, Lt/g$a;->r:Lt/g;

    .line 101
    .line 102
    iget v7, p0, Lt/g$a;->q:I

    .line 103
    .line 104
    invoke-static {v6, v3, v7}, Lt/g;->d2(Lt/g;Lt/e;I)I

    .line 105
    .line 106
    .line 107
    move-result v6

    .line 108
    iget-object v7, p0, Lt/g$a;->r:Lt/g;

    .line 109
    .line 110
    invoke-static {v7}, Lt/g;->R1(Lt/g;)I

    .line 111
    .line 112
    .line 113
    move-result v7

    .line 114
    invoke-virtual {v3}, Lt/e;->V()I

    .line 115
    .line 116
    .line 117
    move-result v8

    .line 118
    if-ne v8, v5, :cond_4

    .line 119
    .line 120
    move v7, v0

    .line 121
    :cond_4
    iget v5, p0, Lt/g$a;->m:I

    .line 122
    .line 123
    add-int/2addr v6, v7

    .line 124
    add-int/2addr v5, v6

    .line 125
    iput v5, p0, Lt/g$a;->m:I

    .line 126
    .line 127
    iget-object v5, p0, Lt/g$a;->b:Lt/e;

    .line 128
    .line 129
    if-eqz v5, :cond_5

    .line 130
    .line 131
    iget v5, p0, Lt/g$a;->c:I

    .line 132
    .line 133
    if-ge v5, v4, :cond_6

    .line 134
    .line 135
    :cond_5
    iput-object v3, p0, Lt/g$a;->b:Lt/e;

    .line 136
    .line 137
    iput v4, p0, Lt/g$a;->c:I

    .line 138
    .line 139
    iput v4, p0, Lt/g$a;->l:I

    .line 140
    .line 141
    :cond_6
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :cond_7
    :goto_2
    return-void
.end method


# virtual methods
.method public b(Lt/e;)V
    .locals 6

    .line 1
    iget v0, p0, Lt/g$a;->a:I

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v0, :cond_3

    .line 7
    .line 8
    iget-object v0, p0, Lt/g$a;->r:Lt/g;

    .line 9
    .line 10
    iget v3, p0, Lt/g$a;->q:I

    .line 11
    .line 12
    invoke-static {v0, p1, v3}, Lt/g;->c2(Lt/g;Lt/e;I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p1}, Lt/e;->A()Lt/e$b;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    sget-object v4, Lt/e$b;->i:Lt/e$b;

    .line 21
    .line 22
    if-ne v3, v4, :cond_0

    .line 23
    .line 24
    iget v0, p0, Lt/g$a;->p:I

    .line 25
    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    iput v0, p0, Lt/g$a;->p:I

    .line 29
    .line 30
    move v0, v2

    .line 31
    :cond_0
    iget-object v3, p0, Lt/g$a;->r:Lt/g;

    .line 32
    .line 33
    invoke-static {v3}, Lt/g;->Q1(Lt/g;)I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-virtual {p1}, Lt/e;->V()I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    if-ne v4, v1, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    move v2, v3

    .line 45
    :goto_0
    iget v1, p0, Lt/g$a;->l:I

    .line 46
    .line 47
    add-int/2addr v0, v2

    .line 48
    add-int/2addr v1, v0

    .line 49
    iput v1, p0, Lt/g$a;->l:I

    .line 50
    .line 51
    iget-object v0, p0, Lt/g$a;->r:Lt/g;

    .line 52
    .line 53
    iget v1, p0, Lt/g$a;->q:I

    .line 54
    .line 55
    invoke-static {v0, p1, v1}, Lt/g;->d2(Lt/g;Lt/e;I)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iget-object v1, p0, Lt/g$a;->b:Lt/e;

    .line 60
    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    iget v1, p0, Lt/g$a;->c:I

    .line 64
    .line 65
    if-ge v1, v0, :cond_7

    .line 66
    .line 67
    :cond_2
    iput-object p1, p0, Lt/g$a;->b:Lt/e;

    .line 68
    .line 69
    iput v0, p0, Lt/g$a;->c:I

    .line 70
    .line 71
    iput v0, p0, Lt/g$a;->m:I

    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_3
    iget-object v0, p0, Lt/g$a;->r:Lt/g;

    .line 75
    .line 76
    iget v3, p0, Lt/g$a;->q:I

    .line 77
    .line 78
    invoke-static {v0, p1, v3}, Lt/g;->c2(Lt/g;Lt/e;I)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iget-object v3, p0, Lt/g$a;->r:Lt/g;

    .line 83
    .line 84
    iget v4, p0, Lt/g$a;->q:I

    .line 85
    .line 86
    invoke-static {v3, p1, v4}, Lt/g;->d2(Lt/g;Lt/e;I)I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    invoke-virtual {p1}, Lt/e;->T()Lt/e$b;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    sget-object v5, Lt/e$b;->i:Lt/e$b;

    .line 95
    .line 96
    if-ne v4, v5, :cond_4

    .line 97
    .line 98
    iget v3, p0, Lt/g$a;->p:I

    .line 99
    .line 100
    add-int/lit8 v3, v3, 0x1

    .line 101
    .line 102
    iput v3, p0, Lt/g$a;->p:I

    .line 103
    .line 104
    move v3, v2

    .line 105
    :cond_4
    iget-object v4, p0, Lt/g$a;->r:Lt/g;

    .line 106
    .line 107
    invoke-static {v4}, Lt/g;->R1(Lt/g;)I

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    invoke-virtual {p1}, Lt/e;->V()I

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    if-ne v5, v1, :cond_5

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_5
    move v2, v4

    .line 119
    :goto_1
    iget v1, p0, Lt/g$a;->m:I

    .line 120
    .line 121
    add-int/2addr v3, v2

    .line 122
    add-int/2addr v1, v3

    .line 123
    iput v1, p0, Lt/g$a;->m:I

    .line 124
    .line 125
    iget-object v1, p0, Lt/g$a;->b:Lt/e;

    .line 126
    .line 127
    if-eqz v1, :cond_6

    .line 128
    .line 129
    iget v1, p0, Lt/g$a;->c:I

    .line 130
    .line 131
    if-ge v1, v0, :cond_7

    .line 132
    .line 133
    :cond_6
    iput-object p1, p0, Lt/g$a;->b:Lt/e;

    .line 134
    .line 135
    iput v0, p0, Lt/g$a;->c:I

    .line 136
    .line 137
    iput v0, p0, Lt/g$a;->l:I

    .line 138
    .line 139
    :cond_7
    :goto_2
    iget p1, p0, Lt/g$a;->o:I

    .line 140
    .line 141
    add-int/lit8 p1, p1, 0x1

    .line 142
    .line 143
    iput p1, p0, Lt/g$a;->o:I

    .line 144
    .line 145
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lt/g$a;->c:I

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    iput-object v1, p0, Lt/g$a;->b:Lt/e;

    .line 6
    .line 7
    iput v0, p0, Lt/g$a;->l:I

    .line 8
    .line 9
    iput v0, p0, Lt/g$a;->m:I

    .line 10
    .line 11
    iput v0, p0, Lt/g$a;->n:I

    .line 12
    .line 13
    iput v0, p0, Lt/g$a;->o:I

    .line 14
    .line 15
    iput v0, p0, Lt/g$a;->p:I

    .line 16
    .line 17
    return-void
.end method

.method public d(ZIZ)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lt/g$a;->o:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    move v3, v2

    .line 7
    :goto_0
    if-ge v3, v1, :cond_2

    .line 8
    .line 9
    iget v4, v0, Lt/g$a;->n:I

    .line 10
    .line 11
    add-int/2addr v4, v3

    .line 12
    iget-object v5, v0, Lt/g$a;->r:Lt/g;

    .line 13
    .line 14
    invoke-static {v5}, Lt/g;->e2(Lt/g;)I

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    if-lt v4, v5, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    iget-object v4, v0, Lt/g$a;->r:Lt/g;

    .line 22
    .line 23
    invoke-static {v4}, Lt/g;->f2(Lt/g;)[Lt/e;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    iget v5, v0, Lt/g$a;->n:I

    .line 28
    .line 29
    add-int/2addr v5, v3

    .line 30
    aget-object v4, v4, v5

    .line 31
    .line 32
    if-eqz v4, :cond_1

    .line 33
    .line 34
    invoke-virtual {v4}, Lt/e;->u0()V

    .line 35
    .line 36
    .line 37
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    :goto_1
    if-eqz v1, :cond_3a

    .line 41
    .line 42
    iget-object v3, v0, Lt/g$a;->b:Lt/e;

    .line 43
    .line 44
    if-nez v3, :cond_3

    .line 45
    .line 46
    goto/16 :goto_17

    .line 47
    .line 48
    :cond_3
    if-eqz p3, :cond_4

    .line 49
    .line 50
    if-nez p2, :cond_4

    .line 51
    .line 52
    const/4 v4, 0x1

    .line 53
    goto :goto_2

    .line 54
    :cond_4
    move v4, v2

    .line 55
    :goto_2
    const/4 v5, -0x1

    .line 56
    move v6, v2

    .line 57
    move v7, v5

    .line 58
    move v8, v7

    .line 59
    :goto_3
    if-ge v6, v1, :cond_9

    .line 60
    .line 61
    if-eqz p1, :cond_5

    .line 62
    .line 63
    add-int/lit8 v9, v1, -0x1

    .line 64
    .line 65
    sub-int/2addr v9, v6

    .line 66
    goto :goto_4

    .line 67
    :cond_5
    move v9, v6

    .line 68
    :goto_4
    iget v10, v0, Lt/g$a;->n:I

    .line 69
    .line 70
    add-int/2addr v10, v9

    .line 71
    iget-object v11, v0, Lt/g$a;->r:Lt/g;

    .line 72
    .line 73
    invoke-static {v11}, Lt/g;->e2(Lt/g;)I

    .line 74
    .line 75
    .line 76
    move-result v11

    .line 77
    if-lt v10, v11, :cond_6

    .line 78
    .line 79
    goto :goto_5

    .line 80
    :cond_6
    iget-object v10, v0, Lt/g$a;->r:Lt/g;

    .line 81
    .line 82
    invoke-static {v10}, Lt/g;->f2(Lt/g;)[Lt/e;

    .line 83
    .line 84
    .line 85
    move-result-object v10

    .line 86
    iget v11, v0, Lt/g$a;->n:I

    .line 87
    .line 88
    add-int/2addr v11, v9

    .line 89
    aget-object v9, v10, v11

    .line 90
    .line 91
    if-eqz v9, :cond_8

    .line 92
    .line 93
    invoke-virtual {v9}, Lt/e;->V()I

    .line 94
    .line 95
    .line 96
    move-result v9

    .line 97
    if-nez v9, :cond_8

    .line 98
    .line 99
    if-ne v7, v5, :cond_7

    .line 100
    .line 101
    move v7, v6

    .line 102
    :cond_7
    move v8, v6

    .line 103
    :cond_8
    add-int/lit8 v6, v6, 0x1

    .line 104
    .line 105
    goto :goto_3

    .line 106
    :cond_9
    :goto_5
    iget v6, v0, Lt/g$a;->a:I

    .line 107
    .line 108
    const/4 v9, 0x0

    .line 109
    if-nez v6, :cond_23

    .line 110
    .line 111
    iget-object v6, v0, Lt/g$a;->b:Lt/e;

    .line 112
    .line 113
    iget-object v10, v0, Lt/g$a;->r:Lt/g;

    .line 114
    .line 115
    invoke-static {v10}, Lt/g;->g2(Lt/g;)I

    .line 116
    .line 117
    .line 118
    move-result v10

    .line 119
    invoke-virtual {v6, v10}, Lt/e;->f1(I)V

    .line 120
    .line 121
    .line 122
    iget v10, v0, Lt/g$a;->i:I

    .line 123
    .line 124
    if-lez p2, :cond_a

    .line 125
    .line 126
    iget-object v11, v0, Lt/g$a;->r:Lt/g;

    .line 127
    .line 128
    invoke-static {v11}, Lt/g;->R1(Lt/g;)I

    .line 129
    .line 130
    .line 131
    move-result v11

    .line 132
    add-int/2addr v10, v11

    .line 133
    :cond_a
    iget-object v11, v6, Lt/e;->P:Lt/d;

    .line 134
    .line 135
    iget-object v12, v0, Lt/g$a;->e:Lt/d;

    .line 136
    .line 137
    invoke-virtual {v11, v12, v10}, Lt/d;->a(Lt/d;I)Z

    .line 138
    .line 139
    .line 140
    if-eqz p3, :cond_b

    .line 141
    .line 142
    iget-object v10, v6, Lt/e;->R:Lt/d;

    .line 143
    .line 144
    iget-object v11, v0, Lt/g$a;->g:Lt/d;

    .line 145
    .line 146
    iget v12, v0, Lt/g$a;->k:I

    .line 147
    .line 148
    invoke-virtual {v10, v11, v12}, Lt/d;->a(Lt/d;I)Z

    .line 149
    .line 150
    .line 151
    :cond_b
    if-lez p2, :cond_c

    .line 152
    .line 153
    iget-object v10, v0, Lt/g$a;->e:Lt/d;

    .line 154
    .line 155
    iget-object v10, v10, Lt/d;->d:Lt/e;

    .line 156
    .line 157
    iget-object v10, v10, Lt/e;->R:Lt/d;

    .line 158
    .line 159
    iget-object v11, v6, Lt/e;->P:Lt/d;

    .line 160
    .line 161
    invoke-virtual {v10, v11, v2}, Lt/d;->a(Lt/d;I)Z

    .line 162
    .line 163
    .line 164
    :cond_c
    iget-object v10, v0, Lt/g$a;->r:Lt/g;

    .line 165
    .line 166
    invoke-static {v10}, Lt/g;->h2(Lt/g;)I

    .line 167
    .line 168
    .line 169
    move-result v10

    .line 170
    const/4 v11, 0x3

    .line 171
    if-ne v10, v11, :cond_10

    .line 172
    .line 173
    invoke-virtual {v6}, Lt/e;->Z()Z

    .line 174
    .line 175
    .line 176
    move-result v10

    .line 177
    if-nez v10, :cond_10

    .line 178
    .line 179
    move v10, v2

    .line 180
    :goto_6
    if-ge v10, v1, :cond_10

    .line 181
    .line 182
    if-eqz p1, :cond_d

    .line 183
    .line 184
    add-int/lit8 v12, v1, -0x1

    .line 185
    .line 186
    sub-int/2addr v12, v10

    .line 187
    goto :goto_7

    .line 188
    :cond_d
    move v12, v10

    .line 189
    :goto_7
    iget v13, v0, Lt/g$a;->n:I

    .line 190
    .line 191
    add-int/2addr v13, v12

    .line 192
    iget-object v14, v0, Lt/g$a;->r:Lt/g;

    .line 193
    .line 194
    invoke-static {v14}, Lt/g;->e2(Lt/g;)I

    .line 195
    .line 196
    .line 197
    move-result v14

    .line 198
    if-lt v13, v14, :cond_e

    .line 199
    .line 200
    goto :goto_8

    .line 201
    :cond_e
    iget-object v13, v0, Lt/g$a;->r:Lt/g;

    .line 202
    .line 203
    invoke-static {v13}, Lt/g;->f2(Lt/g;)[Lt/e;

    .line 204
    .line 205
    .line 206
    move-result-object v13

    .line 207
    iget v14, v0, Lt/g$a;->n:I

    .line 208
    .line 209
    add-int/2addr v14, v12

    .line 210
    aget-object v12, v13, v14

    .line 211
    .line 212
    invoke-virtual {v12}, Lt/e;->Z()Z

    .line 213
    .line 214
    .line 215
    move-result v13

    .line 216
    if-eqz v13, :cond_f

    .line 217
    .line 218
    goto :goto_9

    .line 219
    :cond_f
    add-int/lit8 v10, v10, 0x1

    .line 220
    .line 221
    goto :goto_6

    .line 222
    :cond_10
    :goto_8
    move-object v12, v6

    .line 223
    :goto_9
    move v10, v2

    .line 224
    :goto_a
    if-ge v10, v1, :cond_3a

    .line 225
    .line 226
    if-eqz p1, :cond_11

    .line 227
    .line 228
    add-int/lit8 v13, v1, -0x1

    .line 229
    .line 230
    sub-int/2addr v13, v10

    .line 231
    goto :goto_b

    .line 232
    :cond_11
    move v13, v10

    .line 233
    :goto_b
    iget v14, v0, Lt/g$a;->n:I

    .line 234
    .line 235
    add-int/2addr v14, v13

    .line 236
    iget-object v15, v0, Lt/g$a;->r:Lt/g;

    .line 237
    .line 238
    invoke-static {v15}, Lt/g;->e2(Lt/g;)I

    .line 239
    .line 240
    .line 241
    move-result v15

    .line 242
    if-lt v14, v15, :cond_12

    .line 243
    .line 244
    goto/16 :goto_17

    .line 245
    .line 246
    :cond_12
    iget-object v14, v0, Lt/g$a;->r:Lt/g;

    .line 247
    .line 248
    invoke-static {v14}, Lt/g;->f2(Lt/g;)[Lt/e;

    .line 249
    .line 250
    .line 251
    move-result-object v14

    .line 252
    iget v15, v0, Lt/g$a;->n:I

    .line 253
    .line 254
    add-int/2addr v15, v13

    .line 255
    aget-object v14, v14, v15

    .line 256
    .line 257
    if-nez v14, :cond_13

    .line 258
    .line 259
    move-object v14, v9

    .line 260
    move v9, v11

    .line 261
    goto/16 :goto_10

    .line 262
    .line 263
    :cond_13
    if-nez v10, :cond_14

    .line 264
    .line 265
    iget-object v15, v14, Lt/e;->O:Lt/d;

    .line 266
    .line 267
    const/16 v16, 0x1

    .line 268
    .line 269
    iget-object v3, v0, Lt/g$a;->d:Lt/d;

    .line 270
    .line 271
    iget v11, v0, Lt/g$a;->h:I

    .line 272
    .line 273
    invoke-virtual {v14, v15, v3, v11}, Lt/e;->k(Lt/d;Lt/d;I)V

    .line 274
    .line 275
    .line 276
    goto :goto_c

    .line 277
    :cond_14
    const/16 v16, 0x1

    .line 278
    .line 279
    :goto_c
    if-nez v13, :cond_1a

    .line 280
    .line 281
    iget-object v3, v0, Lt/g$a;->r:Lt/g;

    .line 282
    .line 283
    invoke-static {v3}, Lt/g;->i2(Lt/g;)I

    .line 284
    .line 285
    .line 286
    move-result v3

    .line 287
    const/high16 v11, 0x3f800000    # 1.0f

    .line 288
    .line 289
    iget-object v13, v0, Lt/g$a;->r:Lt/g;

    .line 290
    .line 291
    invoke-static {v13}, Lt/g;->j2(Lt/g;)F

    .line 292
    .line 293
    .line 294
    move-result v13

    .line 295
    if-eqz p1, :cond_15

    .line 296
    .line 297
    sub-float v13, v11, v13

    .line 298
    .line 299
    :cond_15
    iget v15, v0, Lt/g$a;->n:I

    .line 300
    .line 301
    if-nez v15, :cond_17

    .line 302
    .line 303
    iget-object v15, v0, Lt/g$a;->r:Lt/g;

    .line 304
    .line 305
    invoke-static {v15}, Lt/g;->S1(Lt/g;)I

    .line 306
    .line 307
    .line 308
    move-result v15

    .line 309
    if-eq v15, v5, :cond_17

    .line 310
    .line 311
    iget-object v3, v0, Lt/g$a;->r:Lt/g;

    .line 312
    .line 313
    invoke-static {v3}, Lt/g;->S1(Lt/g;)I

    .line 314
    .line 315
    .line 316
    move-result v3

    .line 317
    if-eqz p1, :cond_16

    .line 318
    .line 319
    iget-object v13, v0, Lt/g$a;->r:Lt/g;

    .line 320
    .line 321
    invoke-static {v13}, Lt/g;->T1(Lt/g;)F

    .line 322
    .line 323
    .line 324
    move-result v13

    .line 325
    :goto_d
    sub-float/2addr v11, v13

    .line 326
    :goto_e
    move v13, v11

    .line 327
    goto :goto_f

    .line 328
    :cond_16
    iget-object v11, v0, Lt/g$a;->r:Lt/g;

    .line 329
    .line 330
    invoke-static {v11}, Lt/g;->T1(Lt/g;)F

    .line 331
    .line 332
    .line 333
    move-result v11

    .line 334
    goto :goto_e

    .line 335
    :cond_17
    if-eqz p3, :cond_19

    .line 336
    .line 337
    iget-object v15, v0, Lt/g$a;->r:Lt/g;

    .line 338
    .line 339
    invoke-static {v15}, Lt/g;->U1(Lt/g;)I

    .line 340
    .line 341
    .line 342
    move-result v15

    .line 343
    if-eq v15, v5, :cond_19

    .line 344
    .line 345
    iget-object v3, v0, Lt/g$a;->r:Lt/g;

    .line 346
    .line 347
    invoke-static {v3}, Lt/g;->U1(Lt/g;)I

    .line 348
    .line 349
    .line 350
    move-result v3

    .line 351
    if-eqz p1, :cond_18

    .line 352
    .line 353
    iget-object v13, v0, Lt/g$a;->r:Lt/g;

    .line 354
    .line 355
    invoke-static {v13}, Lt/g;->V1(Lt/g;)F

    .line 356
    .line 357
    .line 358
    move-result v13

    .line 359
    goto :goto_d

    .line 360
    :cond_18
    iget-object v11, v0, Lt/g$a;->r:Lt/g;

    .line 361
    .line 362
    invoke-static {v11}, Lt/g;->V1(Lt/g;)F

    .line 363
    .line 364
    .line 365
    move-result v11

    .line 366
    goto :goto_e

    .line 367
    :cond_19
    :goto_f
    invoke-virtual {v14, v3}, Lt/e;->O0(I)V

    .line 368
    .line 369
    .line 370
    invoke-virtual {v14, v13}, Lt/e;->N0(F)V

    .line 371
    .line 372
    .line 373
    :cond_1a
    add-int/lit8 v3, v1, -0x1

    .line 374
    .line 375
    if-ne v10, v3, :cond_1b

    .line 376
    .line 377
    iget-object v3, v14, Lt/e;->Q:Lt/d;

    .line 378
    .line 379
    iget-object v11, v0, Lt/g$a;->f:Lt/d;

    .line 380
    .line 381
    iget v13, v0, Lt/g$a;->j:I

    .line 382
    .line 383
    invoke-virtual {v14, v3, v11, v13}, Lt/e;->k(Lt/d;Lt/d;I)V

    .line 384
    .line 385
    .line 386
    :cond_1b
    if-eqz v9, :cond_1d

    .line 387
    .line 388
    iget-object v3, v14, Lt/e;->O:Lt/d;

    .line 389
    .line 390
    iget-object v11, v9, Lt/e;->Q:Lt/d;

    .line 391
    .line 392
    iget-object v13, v0, Lt/g$a;->r:Lt/g;

    .line 393
    .line 394
    invoke-static {v13}, Lt/g;->Q1(Lt/g;)I

    .line 395
    .line 396
    .line 397
    move-result v13

    .line 398
    invoke-virtual {v3, v11, v13}, Lt/d;->a(Lt/d;I)Z

    .line 399
    .line 400
    .line 401
    if-ne v10, v7, :cond_1c

    .line 402
    .line 403
    iget-object v3, v14, Lt/e;->O:Lt/d;

    .line 404
    .line 405
    iget v11, v0, Lt/g$a;->h:I

    .line 406
    .line 407
    invoke-virtual {v3, v11}, Lt/d;->u(I)V

    .line 408
    .line 409
    .line 410
    :cond_1c
    iget-object v3, v9, Lt/e;->Q:Lt/d;

    .line 411
    .line 412
    iget-object v11, v14, Lt/e;->O:Lt/d;

    .line 413
    .line 414
    invoke-virtual {v3, v11, v2}, Lt/d;->a(Lt/d;I)Z

    .line 415
    .line 416
    .line 417
    add-int/lit8 v3, v8, 0x1

    .line 418
    .line 419
    if-ne v10, v3, :cond_1d

    .line 420
    .line 421
    iget-object v3, v9, Lt/e;->Q:Lt/d;

    .line 422
    .line 423
    iget v9, v0, Lt/g$a;->j:I

    .line 424
    .line 425
    invoke-virtual {v3, v9}, Lt/d;->u(I)V

    .line 426
    .line 427
    .line 428
    :cond_1d
    if-eq v14, v6, :cond_22

    .line 429
    .line 430
    iget-object v3, v0, Lt/g$a;->r:Lt/g;

    .line 431
    .line 432
    invoke-static {v3}, Lt/g;->h2(Lt/g;)I

    .line 433
    .line 434
    .line 435
    move-result v3

    .line 436
    const/4 v9, 0x3

    .line 437
    if-ne v3, v9, :cond_1e

    .line 438
    .line 439
    invoke-virtual {v12}, Lt/e;->Z()Z

    .line 440
    .line 441
    .line 442
    move-result v3

    .line 443
    if-eqz v3, :cond_1e

    .line 444
    .line 445
    if-eq v14, v12, :cond_1e

    .line 446
    .line 447
    invoke-virtual {v14}, Lt/e;->Z()Z

    .line 448
    .line 449
    .line 450
    move-result v3

    .line 451
    if-eqz v3, :cond_1e

    .line 452
    .line 453
    iget-object v3, v14, Lt/e;->S:Lt/d;

    .line 454
    .line 455
    iget-object v11, v12, Lt/e;->S:Lt/d;

    .line 456
    .line 457
    invoke-virtual {v3, v11, v2}, Lt/d;->a(Lt/d;I)Z

    .line 458
    .line 459
    .line 460
    goto :goto_10

    .line 461
    :cond_1e
    iget-object v3, v0, Lt/g$a;->r:Lt/g;

    .line 462
    .line 463
    invoke-static {v3}, Lt/g;->h2(Lt/g;)I

    .line 464
    .line 465
    .line 466
    move-result v3

    .line 467
    if-eqz v3, :cond_21

    .line 468
    .line 469
    move/from16 v11, v16

    .line 470
    .line 471
    if-eq v3, v11, :cond_20

    .line 472
    .line 473
    if-eqz v4, :cond_1f

    .line 474
    .line 475
    iget-object v3, v14, Lt/e;->P:Lt/d;

    .line 476
    .line 477
    iget-object v11, v0, Lt/g$a;->e:Lt/d;

    .line 478
    .line 479
    iget v13, v0, Lt/g$a;->i:I

    .line 480
    .line 481
    invoke-virtual {v3, v11, v13}, Lt/d;->a(Lt/d;I)Z

    .line 482
    .line 483
    .line 484
    iget-object v3, v14, Lt/e;->R:Lt/d;

    .line 485
    .line 486
    iget-object v11, v0, Lt/g$a;->g:Lt/d;

    .line 487
    .line 488
    iget v13, v0, Lt/g$a;->k:I

    .line 489
    .line 490
    invoke-virtual {v3, v11, v13}, Lt/d;->a(Lt/d;I)Z

    .line 491
    .line 492
    .line 493
    goto :goto_10

    .line 494
    :cond_1f
    iget-object v3, v14, Lt/e;->P:Lt/d;

    .line 495
    .line 496
    iget-object v11, v6, Lt/e;->P:Lt/d;

    .line 497
    .line 498
    invoke-virtual {v3, v11, v2}, Lt/d;->a(Lt/d;I)Z

    .line 499
    .line 500
    .line 501
    iget-object v3, v14, Lt/e;->R:Lt/d;

    .line 502
    .line 503
    iget-object v11, v6, Lt/e;->R:Lt/d;

    .line 504
    .line 505
    invoke-virtual {v3, v11, v2}, Lt/d;->a(Lt/d;I)Z

    .line 506
    .line 507
    .line 508
    goto :goto_10

    .line 509
    :cond_20
    iget-object v3, v14, Lt/e;->R:Lt/d;

    .line 510
    .line 511
    iget-object v11, v6, Lt/e;->R:Lt/d;

    .line 512
    .line 513
    invoke-virtual {v3, v11, v2}, Lt/d;->a(Lt/d;I)Z

    .line 514
    .line 515
    .line 516
    goto :goto_10

    .line 517
    :cond_21
    iget-object v3, v14, Lt/e;->P:Lt/d;

    .line 518
    .line 519
    iget-object v11, v6, Lt/e;->P:Lt/d;

    .line 520
    .line 521
    invoke-virtual {v3, v11, v2}, Lt/d;->a(Lt/d;I)Z

    .line 522
    .line 523
    .line 524
    goto :goto_10

    .line 525
    :cond_22
    const/4 v9, 0x3

    .line 526
    :goto_10
    add-int/lit8 v10, v10, 0x1

    .line 527
    .line 528
    move v11, v9

    .line 529
    move-object v9, v14

    .line 530
    goto/16 :goto_a

    .line 531
    .line 532
    :cond_23
    iget-object v3, v0, Lt/g$a;->b:Lt/e;

    .line 533
    .line 534
    iget-object v6, v0, Lt/g$a;->r:Lt/g;

    .line 535
    .line 536
    invoke-static {v6}, Lt/g;->i2(Lt/g;)I

    .line 537
    .line 538
    .line 539
    move-result v6

    .line 540
    invoke-virtual {v3, v6}, Lt/e;->O0(I)V

    .line 541
    .line 542
    .line 543
    iget v6, v0, Lt/g$a;->h:I

    .line 544
    .line 545
    if-lez p2, :cond_24

    .line 546
    .line 547
    iget-object v10, v0, Lt/g$a;->r:Lt/g;

    .line 548
    .line 549
    invoke-static {v10}, Lt/g;->Q1(Lt/g;)I

    .line 550
    .line 551
    .line 552
    move-result v10

    .line 553
    add-int/2addr v6, v10

    .line 554
    :cond_24
    if-eqz p1, :cond_26

    .line 555
    .line 556
    iget-object v10, v3, Lt/e;->Q:Lt/d;

    .line 557
    .line 558
    iget-object v11, v0, Lt/g$a;->f:Lt/d;

    .line 559
    .line 560
    invoke-virtual {v10, v11, v6}, Lt/d;->a(Lt/d;I)Z

    .line 561
    .line 562
    .line 563
    if-eqz p3, :cond_25

    .line 564
    .line 565
    iget-object v6, v3, Lt/e;->O:Lt/d;

    .line 566
    .line 567
    iget-object v10, v0, Lt/g$a;->d:Lt/d;

    .line 568
    .line 569
    iget v11, v0, Lt/g$a;->j:I

    .line 570
    .line 571
    invoke-virtual {v6, v10, v11}, Lt/d;->a(Lt/d;I)Z

    .line 572
    .line 573
    .line 574
    :cond_25
    if-lez p2, :cond_28

    .line 575
    .line 576
    iget-object v6, v0, Lt/g$a;->f:Lt/d;

    .line 577
    .line 578
    iget-object v6, v6, Lt/d;->d:Lt/e;

    .line 579
    .line 580
    iget-object v6, v6, Lt/e;->O:Lt/d;

    .line 581
    .line 582
    iget-object v10, v3, Lt/e;->Q:Lt/d;

    .line 583
    .line 584
    invoke-virtual {v6, v10, v2}, Lt/d;->a(Lt/d;I)Z

    .line 585
    .line 586
    .line 587
    goto :goto_11

    .line 588
    :cond_26
    iget-object v10, v3, Lt/e;->O:Lt/d;

    .line 589
    .line 590
    iget-object v11, v0, Lt/g$a;->d:Lt/d;

    .line 591
    .line 592
    invoke-virtual {v10, v11, v6}, Lt/d;->a(Lt/d;I)Z

    .line 593
    .line 594
    .line 595
    if-eqz p3, :cond_27

    .line 596
    .line 597
    iget-object v6, v3, Lt/e;->Q:Lt/d;

    .line 598
    .line 599
    iget-object v10, v0, Lt/g$a;->f:Lt/d;

    .line 600
    .line 601
    iget v11, v0, Lt/g$a;->j:I

    .line 602
    .line 603
    invoke-virtual {v6, v10, v11}, Lt/d;->a(Lt/d;I)Z

    .line 604
    .line 605
    .line 606
    :cond_27
    if-lez p2, :cond_28

    .line 607
    .line 608
    iget-object v6, v0, Lt/g$a;->d:Lt/d;

    .line 609
    .line 610
    iget-object v6, v6, Lt/d;->d:Lt/e;

    .line 611
    .line 612
    iget-object v6, v6, Lt/e;->Q:Lt/d;

    .line 613
    .line 614
    iget-object v10, v3, Lt/e;->O:Lt/d;

    .line 615
    .line 616
    invoke-virtual {v6, v10, v2}, Lt/d;->a(Lt/d;I)Z

    .line 617
    .line 618
    .line 619
    :cond_28
    :goto_11
    move v6, v2

    .line 620
    :goto_12
    if-ge v6, v1, :cond_3a

    .line 621
    .line 622
    iget v10, v0, Lt/g$a;->n:I

    .line 623
    .line 624
    add-int/2addr v10, v6

    .line 625
    iget-object v11, v0, Lt/g$a;->r:Lt/g;

    .line 626
    .line 627
    invoke-static {v11}, Lt/g;->e2(Lt/g;)I

    .line 628
    .line 629
    .line 630
    move-result v11

    .line 631
    if-lt v10, v11, :cond_29

    .line 632
    .line 633
    goto/16 :goto_17

    .line 634
    .line 635
    :cond_29
    iget-object v10, v0, Lt/g$a;->r:Lt/g;

    .line 636
    .line 637
    invoke-static {v10}, Lt/g;->f2(Lt/g;)[Lt/e;

    .line 638
    .line 639
    .line 640
    move-result-object v10

    .line 641
    iget v11, v0, Lt/g$a;->n:I

    .line 642
    .line 643
    add-int/2addr v11, v6

    .line 644
    aget-object v10, v10, v11

    .line 645
    .line 646
    if-nez v10, :cond_2a

    .line 647
    .line 648
    const/4 v12, 0x1

    .line 649
    goto/16 :goto_16

    .line 650
    .line 651
    :cond_2a
    if-nez v6, :cond_2d

    .line 652
    .line 653
    iget-object v11, v10, Lt/e;->P:Lt/d;

    .line 654
    .line 655
    iget-object v12, v0, Lt/g$a;->e:Lt/d;

    .line 656
    .line 657
    iget v13, v0, Lt/g$a;->i:I

    .line 658
    .line 659
    invoke-virtual {v10, v11, v12, v13}, Lt/e;->k(Lt/d;Lt/d;I)V

    .line 660
    .line 661
    .line 662
    iget-object v11, v0, Lt/g$a;->r:Lt/g;

    .line 663
    .line 664
    invoke-static {v11}, Lt/g;->g2(Lt/g;)I

    .line 665
    .line 666
    .line 667
    move-result v11

    .line 668
    iget-object v12, v0, Lt/g$a;->r:Lt/g;

    .line 669
    .line 670
    invoke-static {v12}, Lt/g;->W1(Lt/g;)F

    .line 671
    .line 672
    .line 673
    move-result v12

    .line 674
    iget v13, v0, Lt/g$a;->n:I

    .line 675
    .line 676
    if-nez v13, :cond_2b

    .line 677
    .line 678
    iget-object v13, v0, Lt/g$a;->r:Lt/g;

    .line 679
    .line 680
    invoke-static {v13}, Lt/g;->X1(Lt/g;)I

    .line 681
    .line 682
    .line 683
    move-result v13

    .line 684
    if-eq v13, v5, :cond_2b

    .line 685
    .line 686
    iget-object v11, v0, Lt/g$a;->r:Lt/g;

    .line 687
    .line 688
    invoke-static {v11}, Lt/g;->X1(Lt/g;)I

    .line 689
    .line 690
    .line 691
    move-result v11

    .line 692
    iget-object v12, v0, Lt/g$a;->r:Lt/g;

    .line 693
    .line 694
    invoke-static {v12}, Lt/g;->Y1(Lt/g;)F

    .line 695
    .line 696
    .line 697
    move-result v12

    .line 698
    goto :goto_13

    .line 699
    :cond_2b
    if-eqz p3, :cond_2c

    .line 700
    .line 701
    iget-object v13, v0, Lt/g$a;->r:Lt/g;

    .line 702
    .line 703
    invoke-static {v13}, Lt/g;->Z1(Lt/g;)I

    .line 704
    .line 705
    .line 706
    move-result v13

    .line 707
    if-eq v13, v5, :cond_2c

    .line 708
    .line 709
    iget-object v11, v0, Lt/g$a;->r:Lt/g;

    .line 710
    .line 711
    invoke-static {v11}, Lt/g;->Z1(Lt/g;)I

    .line 712
    .line 713
    .line 714
    move-result v11

    .line 715
    iget-object v12, v0, Lt/g$a;->r:Lt/g;

    .line 716
    .line 717
    invoke-static {v12}, Lt/g;->a2(Lt/g;)F

    .line 718
    .line 719
    .line 720
    move-result v12

    .line 721
    :cond_2c
    :goto_13
    invoke-virtual {v10, v11}, Lt/e;->f1(I)V

    .line 722
    .line 723
    .line 724
    invoke-virtual {v10, v12}, Lt/e;->e1(F)V

    .line 725
    .line 726
    .line 727
    :cond_2d
    add-int/lit8 v11, v1, -0x1

    .line 728
    .line 729
    if-ne v6, v11, :cond_2e

    .line 730
    .line 731
    iget-object v11, v10, Lt/e;->R:Lt/d;

    .line 732
    .line 733
    iget-object v12, v0, Lt/g$a;->g:Lt/d;

    .line 734
    .line 735
    iget v13, v0, Lt/g$a;->k:I

    .line 736
    .line 737
    invoke-virtual {v10, v11, v12, v13}, Lt/e;->k(Lt/d;Lt/d;I)V

    .line 738
    .line 739
    .line 740
    :cond_2e
    if-eqz v9, :cond_30

    .line 741
    .line 742
    iget-object v11, v10, Lt/e;->P:Lt/d;

    .line 743
    .line 744
    iget-object v12, v9, Lt/e;->R:Lt/d;

    .line 745
    .line 746
    iget-object v13, v0, Lt/g$a;->r:Lt/g;

    .line 747
    .line 748
    invoke-static {v13}, Lt/g;->R1(Lt/g;)I

    .line 749
    .line 750
    .line 751
    move-result v13

    .line 752
    invoke-virtual {v11, v12, v13}, Lt/d;->a(Lt/d;I)Z

    .line 753
    .line 754
    .line 755
    if-ne v6, v7, :cond_2f

    .line 756
    .line 757
    iget-object v11, v10, Lt/e;->P:Lt/d;

    .line 758
    .line 759
    iget v12, v0, Lt/g$a;->i:I

    .line 760
    .line 761
    invoke-virtual {v11, v12}, Lt/d;->u(I)V

    .line 762
    .line 763
    .line 764
    :cond_2f
    iget-object v11, v9, Lt/e;->R:Lt/d;

    .line 765
    .line 766
    iget-object v12, v10, Lt/e;->P:Lt/d;

    .line 767
    .line 768
    invoke-virtual {v11, v12, v2}, Lt/d;->a(Lt/d;I)Z

    .line 769
    .line 770
    .line 771
    const/16 v16, 0x1

    .line 772
    .line 773
    add-int/lit8 v11, v8, 0x1

    .line 774
    .line 775
    if-ne v6, v11, :cond_30

    .line 776
    .line 777
    iget-object v9, v9, Lt/e;->R:Lt/d;

    .line 778
    .line 779
    iget v11, v0, Lt/g$a;->k:I

    .line 780
    .line 781
    invoke-virtual {v9, v11}, Lt/d;->u(I)V

    .line 782
    .line 783
    .line 784
    :cond_30
    if-eq v10, v3, :cond_34

    .line 785
    .line 786
    const/4 v9, 0x2

    .line 787
    if-eqz p1, :cond_35

    .line 788
    .line 789
    iget-object v11, v0, Lt/g$a;->r:Lt/g;

    .line 790
    .line 791
    invoke-static {v11}, Lt/g;->b2(Lt/g;)I

    .line 792
    .line 793
    .line 794
    move-result v11

    .line 795
    if-eqz v11, :cond_33

    .line 796
    .line 797
    const/4 v12, 0x1

    .line 798
    if-eq v11, v12, :cond_32

    .line 799
    .line 800
    if-eq v11, v9, :cond_31

    .line 801
    .line 802
    goto :goto_14

    .line 803
    :cond_31
    iget-object v9, v10, Lt/e;->O:Lt/d;

    .line 804
    .line 805
    iget-object v11, v3, Lt/e;->O:Lt/d;

    .line 806
    .line 807
    invoke-virtual {v9, v11, v2}, Lt/d;->a(Lt/d;I)Z

    .line 808
    .line 809
    .line 810
    iget-object v9, v10, Lt/e;->Q:Lt/d;

    .line 811
    .line 812
    iget-object v11, v3, Lt/e;->Q:Lt/d;

    .line 813
    .line 814
    invoke-virtual {v9, v11, v2}, Lt/d;->a(Lt/d;I)Z

    .line 815
    .line 816
    .line 817
    goto :goto_14

    .line 818
    :cond_32
    iget-object v9, v10, Lt/e;->O:Lt/d;

    .line 819
    .line 820
    iget-object v11, v3, Lt/e;->O:Lt/d;

    .line 821
    .line 822
    invoke-virtual {v9, v11, v2}, Lt/d;->a(Lt/d;I)Z

    .line 823
    .line 824
    .line 825
    goto :goto_14

    .line 826
    :cond_33
    iget-object v9, v10, Lt/e;->Q:Lt/d;

    .line 827
    .line 828
    iget-object v11, v3, Lt/e;->Q:Lt/d;

    .line 829
    .line 830
    invoke-virtual {v9, v11, v2}, Lt/d;->a(Lt/d;I)Z

    .line 831
    .line 832
    .line 833
    :cond_34
    :goto_14
    const/4 v12, 0x1

    .line 834
    goto :goto_15

    .line 835
    :cond_35
    iget-object v11, v0, Lt/g$a;->r:Lt/g;

    .line 836
    .line 837
    invoke-static {v11}, Lt/g;->b2(Lt/g;)I

    .line 838
    .line 839
    .line 840
    move-result v11

    .line 841
    if-eqz v11, :cond_39

    .line 842
    .line 843
    const/4 v12, 0x1

    .line 844
    if-eq v11, v12, :cond_38

    .line 845
    .line 846
    if-eq v11, v9, :cond_36

    .line 847
    .line 848
    goto :goto_15

    .line 849
    :cond_36
    if-eqz v4, :cond_37

    .line 850
    .line 851
    iget-object v9, v10, Lt/e;->O:Lt/d;

    .line 852
    .line 853
    iget-object v11, v0, Lt/g$a;->d:Lt/d;

    .line 854
    .line 855
    iget v13, v0, Lt/g$a;->h:I

    .line 856
    .line 857
    invoke-virtual {v9, v11, v13}, Lt/d;->a(Lt/d;I)Z

    .line 858
    .line 859
    .line 860
    iget-object v9, v10, Lt/e;->Q:Lt/d;

    .line 861
    .line 862
    iget-object v11, v0, Lt/g$a;->f:Lt/d;

    .line 863
    .line 864
    iget v13, v0, Lt/g$a;->j:I

    .line 865
    .line 866
    invoke-virtual {v9, v11, v13}, Lt/d;->a(Lt/d;I)Z

    .line 867
    .line 868
    .line 869
    goto :goto_15

    .line 870
    :cond_37
    iget-object v9, v10, Lt/e;->O:Lt/d;

    .line 871
    .line 872
    iget-object v11, v3, Lt/e;->O:Lt/d;

    .line 873
    .line 874
    invoke-virtual {v9, v11, v2}, Lt/d;->a(Lt/d;I)Z

    .line 875
    .line 876
    .line 877
    iget-object v9, v10, Lt/e;->Q:Lt/d;

    .line 878
    .line 879
    iget-object v11, v3, Lt/e;->Q:Lt/d;

    .line 880
    .line 881
    invoke-virtual {v9, v11, v2}, Lt/d;->a(Lt/d;I)Z

    .line 882
    .line 883
    .line 884
    goto :goto_15

    .line 885
    :cond_38
    iget-object v9, v10, Lt/e;->Q:Lt/d;

    .line 886
    .line 887
    iget-object v11, v3, Lt/e;->Q:Lt/d;

    .line 888
    .line 889
    invoke-virtual {v9, v11, v2}, Lt/d;->a(Lt/d;I)Z

    .line 890
    .line 891
    .line 892
    goto :goto_15

    .line 893
    :cond_39
    const/4 v12, 0x1

    .line 894
    iget-object v9, v10, Lt/e;->O:Lt/d;

    .line 895
    .line 896
    iget-object v11, v3, Lt/e;->O:Lt/d;

    .line 897
    .line 898
    invoke-virtual {v9, v11, v2}, Lt/d;->a(Lt/d;I)Z

    .line 899
    .line 900
    .line 901
    :goto_15
    move-object v9, v10

    .line 902
    :goto_16
    add-int/lit8 v6, v6, 0x1

    .line 903
    .line 904
    goto/16 :goto_12

    .line 905
    .line 906
    :cond_3a
    :goto_17
    return-void
.end method

.method public e()I
    .locals 2

    .line 1
    iget v0, p0, Lt/g$a;->a:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget v0, p0, Lt/g$a;->m:I

    .line 7
    .line 8
    iget-object p0, p0, Lt/g$a;->r:Lt/g;

    .line 9
    .line 10
    invoke-static {p0}, Lt/g;->R1(Lt/g;)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    sub-int/2addr v0, p0

    .line 15
    return v0

    .line 16
    :cond_0
    iget p0, p0, Lt/g$a;->m:I

    .line 17
    .line 18
    return p0
.end method

.method public f()I
    .locals 1

    .line 1
    iget v0, p0, Lt/g$a;->a:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lt/g$a;->l:I

    .line 6
    .line 7
    iget-object p0, p0, Lt/g$a;->r:Lt/g;

    .line 8
    .line 9
    invoke-static {p0}, Lt/g;->Q1(Lt/g;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    sub-int/2addr v0, p0

    .line 14
    return v0

    .line 15
    :cond_0
    iget p0, p0, Lt/g$a;->l:I

    .line 16
    .line 17
    return p0
.end method

.method public g(I)V
    .locals 8

    .line 1
    iget v0, p0, Lt/g$a;->p:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v1, p0, Lt/g$a;->o:I

    .line 7
    .line 8
    div-int v5, p1, v0

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    :goto_0
    if-ge p1, v1, :cond_4

    .line 12
    .line 13
    iget v0, p0, Lt/g$a;->n:I

    .line 14
    .line 15
    add-int/2addr v0, p1

    .line 16
    iget-object v2, p0, Lt/g$a;->r:Lt/g;

    .line 17
    .line 18
    invoke-static {v2}, Lt/g;->e2(Lt/g;)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-lt v0, v2, :cond_1

    .line 23
    .line 24
    goto :goto_2

    .line 25
    :cond_1
    iget-object v0, p0, Lt/g$a;->r:Lt/g;

    .line 26
    .line 27
    invoke-static {v0}, Lt/g;->f2(Lt/g;)[Lt/e;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget v2, p0, Lt/g$a;->n:I

    .line 32
    .line 33
    add-int/2addr v2, p1

    .line 34
    aget-object v3, v0, v2

    .line 35
    .line 36
    iget v0, p0, Lt/g$a;->a:I

    .line 37
    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    if-eqz v3, :cond_3

    .line 41
    .line 42
    invoke-virtual {v3}, Lt/e;->A()Lt/e$b;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sget-object v2, Lt/e$b;->i:Lt/e$b;

    .line 47
    .line 48
    if-ne v0, v2, :cond_3

    .line 49
    .line 50
    iget v0, v3, Lt/e;->w:I

    .line 51
    .line 52
    if-nez v0, :cond_3

    .line 53
    .line 54
    iget-object v2, p0, Lt/g$a;->r:Lt/g;

    .line 55
    .line 56
    sget-object v4, Lt/e$b;->g:Lt/e$b;

    .line 57
    .line 58
    invoke-virtual {v3}, Lt/e;->T()Lt/e$b;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    invoke-virtual {v3}, Lt/e;->x()I

    .line 63
    .line 64
    .line 65
    move-result v7

    .line 66
    invoke-virtual/range {v2 .. v7}, Lt/l;->E1(Lt/e;Lt/e$b;ILt/e$b;I)V

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    if-eqz v3, :cond_3

    .line 71
    .line 72
    invoke-virtual {v3}, Lt/e;->T()Lt/e$b;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    sget-object v2, Lt/e$b;->i:Lt/e$b;

    .line 77
    .line 78
    if-ne v0, v2, :cond_3

    .line 79
    .line 80
    iget v0, v3, Lt/e;->x:I

    .line 81
    .line 82
    if-nez v0, :cond_3

    .line 83
    .line 84
    iget-object v2, p0, Lt/g$a;->r:Lt/g;

    .line 85
    .line 86
    invoke-virtual {v3}, Lt/e;->A()Lt/e$b;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    move v7, v5

    .line 91
    invoke-virtual {v3}, Lt/e;->W()I

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    sget-object v6, Lt/e$b;->g:Lt/e$b;

    .line 96
    .line 97
    invoke-virtual/range {v2 .. v7}, Lt/l;->E1(Lt/e;Lt/e$b;ILt/e$b;I)V

    .line 98
    .line 99
    .line 100
    move v5, v7

    .line 101
    :cond_3
    :goto_1
    add-int/lit8 p1, p1, 0x1

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_4
    :goto_2
    invoke-direct {p0}, Lt/g$a;->h()V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public i(I)V
    .locals 0

    .line 1
    iput p1, p0, Lt/g$a;->n:I

    .line 2
    .line 3
    return-void
.end method

.method public j(ILt/d;Lt/d;Lt/d;Lt/d;IIIII)V
    .locals 0

    .line 1
    iput p1, p0, Lt/g$a;->a:I

    .line 2
    .line 3
    iput-object p2, p0, Lt/g$a;->d:Lt/d;

    .line 4
    .line 5
    iput-object p3, p0, Lt/g$a;->e:Lt/d;

    .line 6
    .line 7
    iput-object p4, p0, Lt/g$a;->f:Lt/d;

    .line 8
    .line 9
    iput-object p5, p0, Lt/g$a;->g:Lt/d;

    .line 10
    .line 11
    iput p6, p0, Lt/g$a;->h:I

    .line 12
    .line 13
    iput p7, p0, Lt/g$a;->i:I

    .line 14
    .line 15
    iput p8, p0, Lt/g$a;->j:I

    .line 16
    .line 17
    iput p9, p0, Lt/g$a;->k:I

    .line 18
    .line 19
    iput p10, p0, Lt/g$a;->q:I

    .line 20
    .line 21
    return-void
.end method
