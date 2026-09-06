.class public abstract Lu/p;
.super Ljava/lang/Object;
.source "WidgetRun.java"

# interfaces
.implements Lu/d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lu/p$b;
    }
.end annotation


# instance fields
.field public a:I

.field b:Lt/e;

.field c:Lu/m;

.field protected d:Lt/e$b;

.field e:Lu/g;

.field public f:I

.field g:Z

.field public h:Lu/f;

.field public i:Lu/f;

.field protected j:Lu/p$b;


# direct methods
.method public constructor <init>(Lt/e;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lu/g;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lu/g;-><init>(Lu/p;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lu/p;->e:Lu/g;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lu/p;->f:I

    .line 13
    .line 14
    iput-boolean v0, p0, Lu/p;->g:Z

    .line 15
    .line 16
    new-instance v0, Lu/f;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Lu/f;-><init>(Lu/p;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lu/p;->h:Lu/f;

    .line 22
    .line 23
    new-instance v0, Lu/f;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Lu/f;-><init>(Lu/p;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lu/p;->i:Lu/f;

    .line 29
    .line 30
    sget-object v0, Lu/p$b;->g:Lu/p$b;

    .line 31
    .line 32
    iput-object v0, p0, Lu/p;->j:Lu/p$b;

    .line 33
    .line 34
    iput-object p1, p0, Lu/p;->b:Lt/e;

    .line 35
    .line 36
    return-void
.end method

.method private l(II)V
    .locals 7

    .line 1
    iget v0, p0, Lu/p;->a:I

    .line 2
    .line 3
    if-eqz v0, :cond_9

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_8

    .line 7
    .line 8
    const/4 p2, 0x2

    .line 9
    const/high16 v2, 0x3f000000    # 0.5f

    .line 10
    .line 11
    if-eq v0, p2, :cond_4

    .line 12
    .line 13
    const/4 p2, 0x3

    .line 14
    if-eq v0, p2, :cond_0

    .line 15
    .line 16
    goto/16 :goto_3

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 19
    .line 20
    iget-object v3, v0, Lt/e;->e:Lu/l;

    .line 21
    .line 22
    iget-object v4, v3, Lu/p;->d:Lt/e$b;

    .line 23
    .line 24
    sget-object v5, Lt/e$b;->i:Lt/e$b;

    .line 25
    .line 26
    if-ne v4, v5, :cond_1

    .line 27
    .line 28
    iget v4, v3, Lu/p;->a:I

    .line 29
    .line 30
    if-ne v4, p2, :cond_1

    .line 31
    .line 32
    iget-object v4, v0, Lt/e;->f:Lu/n;

    .line 33
    .line 34
    iget-object v6, v4, Lu/p;->d:Lt/e$b;

    .line 35
    .line 36
    if-ne v6, v5, :cond_1

    .line 37
    .line 38
    iget v4, v4, Lu/p;->a:I

    .line 39
    .line 40
    if-ne v4, p2, :cond_1

    .line 41
    .line 42
    goto :goto_3

    .line 43
    :cond_1
    if-nez p1, :cond_2

    .line 44
    .line 45
    iget-object v3, v0, Lt/e;->f:Lu/n;

    .line 46
    .line 47
    :cond_2
    iget-object p2, v3, Lu/p;->e:Lu/g;

    .line 48
    .line 49
    iget-boolean p2, p2, Lu/f;->j:Z

    .line 50
    .line 51
    if-eqz p2, :cond_7

    .line 52
    .line 53
    invoke-virtual {v0}, Lt/e;->v()F

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    if-ne p1, v1, :cond_3

    .line 58
    .line 59
    iget-object p1, v3, Lu/p;->e:Lu/g;

    .line 60
    .line 61
    iget p1, p1, Lu/f;->g:I

    .line 62
    .line 63
    int-to-float p1, p1

    .line 64
    div-float/2addr p1, p2

    .line 65
    add-float/2addr p1, v2

    .line 66
    float-to-int p1, p1

    .line 67
    goto :goto_0

    .line 68
    :cond_3
    iget-object p1, v3, Lu/p;->e:Lu/g;

    .line 69
    .line 70
    iget p1, p1, Lu/f;->g:I

    .line 71
    .line 72
    int-to-float p1, p1

    .line 73
    mul-float/2addr p2, p1

    .line 74
    add-float/2addr p2, v2

    .line 75
    float-to-int p1, p2

    .line 76
    :goto_0
    iget-object p0, p0, Lu/p;->e:Lu/g;

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Lu/g;->d(I)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_4
    iget-object p2, p0, Lu/p;->b:Lt/e;

    .line 83
    .line 84
    invoke-virtual {p2}, Lt/e;->K()Lt/e;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    if-eqz p2, :cond_7

    .line 89
    .line 90
    if-nez p1, :cond_5

    .line 91
    .line 92
    iget-object p2, p2, Lt/e;->e:Lu/l;

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_5
    iget-object p2, p2, Lt/e;->f:Lu/n;

    .line 96
    .line 97
    :goto_1
    iget-object p2, p2, Lu/p;->e:Lu/g;

    .line 98
    .line 99
    iget-boolean v0, p2, Lu/f;->j:Z

    .line 100
    .line 101
    if-eqz v0, :cond_7

    .line 102
    .line 103
    if-nez p1, :cond_6

    .line 104
    .line 105
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 106
    .line 107
    iget v0, v0, Lt/e;->B:F

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_6
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 111
    .line 112
    iget v0, v0, Lt/e;->E:F

    .line 113
    .line 114
    :goto_2
    iget p2, p2, Lu/f;->g:I

    .line 115
    .line 116
    int-to-float p2, p2

    .line 117
    mul-float/2addr p2, v0

    .line 118
    add-float/2addr p2, v2

    .line 119
    float-to-int p2, p2

    .line 120
    iget-object v0, p0, Lu/p;->e:Lu/g;

    .line 121
    .line 122
    invoke-virtual {p0, p2, p1}, Lu/p;->g(II)I

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    invoke-virtual {v0, p0}, Lu/g;->d(I)V

    .line 127
    .line 128
    .line 129
    :cond_7
    :goto_3
    return-void

    .line 130
    :cond_8
    iget-object v0, p0, Lu/p;->e:Lu/g;

    .line 131
    .line 132
    iget v0, v0, Lu/g;->m:I

    .line 133
    .line 134
    invoke-virtual {p0, v0, p1}, Lu/p;->g(II)I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    iget-object p0, p0, Lu/p;->e:Lu/g;

    .line 139
    .line 140
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    invoke-virtual {p0, p1}, Lu/g;->d(I)V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :cond_9
    iget-object v0, p0, Lu/p;->e:Lu/g;

    .line 149
    .line 150
    invoke-virtual {p0, p2, p1}, Lu/p;->g(II)I

    .line 151
    .line 152
    .line 153
    move-result p0

    .line 154
    invoke-virtual {v0, p0}, Lu/g;->d(I)V

    .line 155
    .line 156
    .line 157
    return-void
.end method


# virtual methods
.method public a(Lu/d;)V
    .locals 0

    .line 1
    return-void
.end method

.method protected final b(Lu/f;Lu/f;I)V
    .locals 0

    .line 1
    iget-object p0, p1, Lu/f;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iput p3, p1, Lu/f;->f:I

    .line 7
    .line 8
    iget-object p0, p2, Lu/f;->k:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method protected final c(Lu/f;Lu/f;ILu/g;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lu/f;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lu/f;->l:Ljava/util/List;

    .line 7
    .line 8
    iget-object p0, p0, Lu/p;->e:Lu/g;

    .line 9
    .line 10
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    iput p3, p1, Lu/f;->h:I

    .line 14
    .line 15
    iput-object p4, p1, Lu/f;->i:Lu/g;

    .line 16
    .line 17
    iget-object p0, p2, Lu/f;->k:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object p0, p4, Lu/f;->k:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method abstract d()V
.end method

.method abstract e()V
.end method

.method abstract f()V
.end method

.method protected final g(II)I
    .locals 0

    .line 1
    if-nez p2, :cond_1

    .line 2
    .line 3
    iget-object p0, p0, Lu/p;->b:Lt/e;

    .line 4
    .line 5
    iget p2, p0, Lt/e;->A:I

    .line 6
    .line 7
    iget p0, p0, Lt/e;->z:I

    .line 8
    .line 9
    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-lez p2, :cond_0

    .line 14
    .line 15
    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    :cond_0
    if-eq p0, p1, :cond_3

    .line 20
    .line 21
    return p0

    .line 22
    :cond_1
    iget-object p0, p0, Lu/p;->b:Lt/e;

    .line 23
    .line 24
    iget p2, p0, Lt/e;->D:I

    .line 25
    .line 26
    iget p0, p0, Lt/e;->C:I

    .line 27
    .line 28
    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-lez p2, :cond_2

    .line 33
    .line 34
    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    :cond_2
    if-eq p0, p1, :cond_3

    .line 39
    .line 40
    return p0

    .line 41
    :cond_3
    return p1
.end method

.method protected final h(Lt/d;)Lu/f;
    .locals 2

    .line 1
    iget-object p0, p1, Lt/d;->f:Lt/d;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return-object p1

    .line 7
    :cond_0
    iget-object v0, p0, Lt/d;->d:Lt/e;

    .line 8
    .line 9
    iget-object p0, p0, Lt/d;->e:Lt/d$a;

    .line 10
    .line 11
    sget-object v1, Lu/p$a;->a:[I

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    aget p0, v1, p0

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    if-eq p0, v1, :cond_5

    .line 21
    .line 22
    const/4 v1, 0x2

    .line 23
    if-eq p0, v1, :cond_4

    .line 24
    .line 25
    const/4 v1, 0x3

    .line 26
    if-eq p0, v1, :cond_3

    .line 27
    .line 28
    const/4 v1, 0x4

    .line 29
    if-eq p0, v1, :cond_2

    .line 30
    .line 31
    const/4 v1, 0x5

    .line 32
    if-eq p0, v1, :cond_1

    .line 33
    .line 34
    return-object p1

    .line 35
    :cond_1
    iget-object p0, v0, Lt/e;->f:Lu/n;

    .line 36
    .line 37
    iget-object p0, p0, Lu/p;->i:Lu/f;

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_2
    iget-object p0, v0, Lt/e;->f:Lu/n;

    .line 41
    .line 42
    iget-object p0, p0, Lu/n;->k:Lu/f;

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_3
    iget-object p0, v0, Lt/e;->f:Lu/n;

    .line 46
    .line 47
    iget-object p0, p0, Lu/p;->h:Lu/f;

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_4
    iget-object p0, v0, Lt/e;->e:Lu/l;

    .line 51
    .line 52
    iget-object p0, p0, Lu/p;->i:Lu/f;

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_5
    iget-object p0, v0, Lt/e;->e:Lu/l;

    .line 56
    .line 57
    iget-object p0, p0, Lu/p;->h:Lu/f;

    .line 58
    .line 59
    return-object p0
.end method

.method protected final i(Lt/d;I)Lu/f;
    .locals 1

    .line 1
    iget-object p0, p1, Lt/d;->f:Lt/d;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return-object p1

    .line 7
    :cond_0
    iget-object v0, p0, Lt/d;->d:Lt/e;

    .line 8
    .line 9
    if-nez p2, :cond_1

    .line 10
    .line 11
    iget-object p2, v0, Lt/e;->e:Lu/l;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    iget-object p2, v0, Lt/e;->f:Lu/n;

    .line 15
    .line 16
    :goto_0
    iget-object p0, p0, Lt/d;->e:Lt/d$a;

    .line 17
    .line 18
    sget-object v0, Lu/p$a;->a:[I

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    aget p0, v0, p0

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    if-eq p0, v0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x2

    .line 30
    if-eq p0, v0, :cond_2

    .line 31
    .line 32
    const/4 v0, 0x3

    .line 33
    if-eq p0, v0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x5

    .line 36
    if-eq p0, v0, :cond_2

    .line 37
    .line 38
    return-object p1

    .line 39
    :cond_2
    iget-object p0, p2, Lu/p;->i:Lu/f;

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_3
    iget-object p0, p2, Lu/p;->h:Lu/f;

    .line 43
    .line 44
    return-object p0
.end method

.method public j()J
    .locals 2

    .line 1
    iget-object p0, p0, Lu/p;->e:Lu/g;

    .line 2
    .line 3
    iget-boolean v0, p0, Lu/f;->j:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lu/f;->g:I

    .line 8
    .line 9
    int-to-long v0, p0

    .line 10
    return-wide v0

    .line 11
    :cond_0
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    return-wide v0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lu/p;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method abstract m()Z
.end method

.method protected n(Lu/d;Lt/d;Lt/d;I)V
    .locals 4

    .line 1
    invoke-virtual {p0, p2}, Lu/p;->h(Lt/d;)Lu/f;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p3}, Lu/p;->h(Lt/d;)Lu/f;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v1, p1, Lu/f;->j:Z

    .line 10
    .line 11
    if-eqz v1, :cond_6

    .line 12
    .line 13
    iget-boolean v1, v0, Lu/f;->j:Z

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    iget v1, p1, Lu/f;->g:I

    .line 19
    .line 20
    invoke-virtual {p2}, Lt/d;->f()I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    add-int/2addr v1, p2

    .line 25
    iget p2, v0, Lu/f;->g:I

    .line 26
    .line 27
    invoke-virtual {p3}, Lt/d;->f()I

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    sub-int/2addr p2, p3

    .line 32
    sub-int p3, p2, v1

    .line 33
    .line 34
    iget-object v2, p0, Lu/p;->e:Lu/g;

    .line 35
    .line 36
    iget-boolean v2, v2, Lu/f;->j:Z

    .line 37
    .line 38
    if-nez v2, :cond_1

    .line 39
    .line 40
    iget-object v2, p0, Lu/p;->d:Lt/e$b;

    .line 41
    .line 42
    sget-object v3, Lt/e$b;->i:Lt/e$b;

    .line 43
    .line 44
    if-ne v2, v3, :cond_1

    .line 45
    .line 46
    invoke-direct {p0, p4, p3}, Lu/p;->l(II)V

    .line 47
    .line 48
    .line 49
    :cond_1
    iget-object v2, p0, Lu/p;->e:Lu/g;

    .line 50
    .line 51
    iget-boolean v3, v2, Lu/f;->j:Z

    .line 52
    .line 53
    if-nez v3, :cond_2

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    iget v2, v2, Lu/f;->g:I

    .line 57
    .line 58
    if-ne v2, p3, :cond_3

    .line 59
    .line 60
    iget-object p1, p0, Lu/p;->h:Lu/f;

    .line 61
    .line 62
    invoke-virtual {p1, v1}, Lu/f;->d(I)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lu/p;->i:Lu/f;

    .line 66
    .line 67
    invoke-virtual {p0, p2}, Lu/f;->d(I)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_3
    if-nez p4, :cond_4

    .line 72
    .line 73
    iget-object p3, p0, Lu/p;->b:Lt/e;

    .line 74
    .line 75
    invoke-virtual {p3}, Lt/e;->y()F

    .line 76
    .line 77
    .line 78
    move-result p3

    .line 79
    goto :goto_0

    .line 80
    :cond_4
    iget-object p3, p0, Lu/p;->b:Lt/e;

    .line 81
    .line 82
    invoke-virtual {p3}, Lt/e;->R()F

    .line 83
    .line 84
    .line 85
    move-result p3

    .line 86
    :goto_0
    const/high16 p4, 0x3f000000    # 0.5f

    .line 87
    .line 88
    if-ne p1, v0, :cond_5

    .line 89
    .line 90
    iget v1, p1, Lu/f;->g:I

    .line 91
    .line 92
    iget p2, v0, Lu/f;->g:I

    .line 93
    .line 94
    move p3, p4

    .line 95
    :cond_5
    sub-int/2addr p2, v1

    .line 96
    iget-object p1, p0, Lu/p;->e:Lu/g;

    .line 97
    .line 98
    iget p1, p1, Lu/f;->g:I

    .line 99
    .line 100
    sub-int/2addr p2, p1

    .line 101
    iget-object p1, p0, Lu/p;->h:Lu/f;

    .line 102
    .line 103
    int-to-float v0, v1

    .line 104
    add-float/2addr v0, p4

    .line 105
    int-to-float p2, p2

    .line 106
    mul-float/2addr p2, p3

    .line 107
    add-float/2addr v0, p2

    .line 108
    float-to-int p2, v0

    .line 109
    invoke-virtual {p1, p2}, Lu/f;->d(I)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Lu/p;->i:Lu/f;

    .line 113
    .line 114
    iget-object p2, p0, Lu/p;->h:Lu/f;

    .line 115
    .line 116
    iget p2, p2, Lu/f;->g:I

    .line 117
    .line 118
    iget-object p0, p0, Lu/p;->e:Lu/g;

    .line 119
    .line 120
    iget p0, p0, Lu/f;->g:I

    .line 121
    .line 122
    add-int/2addr p2, p0

    .line 123
    invoke-virtual {p1, p2}, Lu/f;->d(I)V

    .line 124
    .line 125
    .line 126
    :cond_6
    :goto_1
    return-void
.end method

.method protected o(Lu/d;)V
    .locals 0

    .line 1
    return-void
.end method

.method protected p(Lu/d;)V
    .locals 0

    .line 1
    return-void
.end method
