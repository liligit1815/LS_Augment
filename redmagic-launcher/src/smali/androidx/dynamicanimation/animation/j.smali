.class public final Landroidx/dynamicanimation/animation/j;
.super Landroidx/dynamicanimation/animation/e;
.source "SpringAnimation.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/dynamicanimation/animation/e<",
        "Landroidx/dynamicanimation/animation/j;",
        ">;"
    }
.end annotation


# instance fields
.field private B:Landroidx/dynamicanimation/animation/k;

.field private C:F

.field private D:Z


# direct methods
.method public constructor <init>(Landroidx/dynamicanimation/animation/h;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/dynamicanimation/animation/e;-><init>(Landroidx/dynamicanimation/animation/h;)V

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 3
    iput p1, p0, Landroidx/dynamicanimation/animation/j;->C:F

    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Landroidx/dynamicanimation/animation/j;->D:Z

    return-void
.end method

.method public constructor <init>(Landroidx/dynamicanimation/animation/h;F)V
    .locals 0

    .line 5
    invoke-direct {p0, p1}, Landroidx/dynamicanimation/animation/e;-><init>(Landroidx/dynamicanimation/animation/h;)V

    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 7
    iput p1, p0, Landroidx/dynamicanimation/animation/j;->C:F

    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Landroidx/dynamicanimation/animation/j;->D:Z

    .line 9
    new-instance p1, Landroidx/dynamicanimation/animation/k;

    invoke-direct {p1, p2}, Landroidx/dynamicanimation/animation/k;-><init>(F)V

    iput-object p1, p0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(TK;",
            "Landroidx/dynamicanimation/animation/g<",
            "TK;>;)V"
        }
    .end annotation

    .line 10
    invoke-direct {p0, p1, p2}, Landroidx/dynamicanimation/animation/e;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 12
    iput p1, p0, Landroidx/dynamicanimation/animation/j;->C:F

    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Landroidx/dynamicanimation/animation/j;->D:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;F)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(TK;",
            "Landroidx/dynamicanimation/animation/g<",
            "TK;>;F)V"
        }
    .end annotation

    .line 14
    invoke-direct {p0, p1, p2}, Landroidx/dynamicanimation/animation/e;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    const/4 p1, 0x0

    .line 15
    iput-object p1, p0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 16
    iput p1, p0, Landroidx/dynamicanimation/animation/j;->C:F

    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Landroidx/dynamicanimation/animation/j;->D:Z

    .line 18
    new-instance p1, Landroidx/dynamicanimation/animation/k;

    invoke-direct {p1, p3}, Landroidx/dynamicanimation/animation/k;-><init>(F)V

    iput-object p1, p0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    return-void
.end method

.method private A()V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/k;->b()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    float-to-double v0, v0

    .line 10
    iget v2, p0, Landroidx/dynamicanimation/animation/e;->g:F

    .line 11
    .line 12
    float-to-double v2, v2

    .line 13
    cmpl-double v2, v0, v2

    .line 14
    .line 15
    if-gtz v2, :cond_1

    .line 16
    .line 17
    iget p0, p0, Landroidx/dynamicanimation/animation/e;->h:F

    .line 18
    .line 19
    float-to-double v2, p0

    .line 20
    cmpg-double p0, v0, v2

    .line 21
    .line 22
    if-ltz p0, :cond_0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 26
    .line 27
    const-string v0, "Final position of the spring cannot be less than the min value."

    .line 28
    .line 29
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    throw p0

    .line 33
    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 34
    .line 35
    const-string v0, "Final position of the spring cannot be greater than the max value."

    .line 36
    .line 37
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw p0

    .line 41
    :cond_2
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 42
    .line 43
    const-string v0, "Incomplete SpringAnimation: Either final position or a spring force needs to be set."

    .line 44
    .line 45
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    throw p0
.end method


# virtual methods
.method public B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    .line 2
    .line 3
    return-object p0
.end method

.method public C()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/j;->x()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/e;->e()Landroidx/dynamicanimation/animation/b;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/b;->j()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-boolean v0, p0, Landroidx/dynamicanimation/animation/e;->f:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Landroidx/dynamicanimation/animation/j;->D:Z

    .line 23
    .line 24
    :cond_0
    return-void

    .line 25
    :cond_1
    new-instance p0, Landroid/util/AndroidRuntimeException;

    .line 26
    .line 27
    const-string v0, "Animations may only be started on the same thread as the animation handler"

    .line 28
    .line 29
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    throw p0

    .line 33
    :cond_2
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 34
    .line 35
    const-string v0, "Spring animations can only come to an end when there is damping"

    .line 36
    .line 37
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw p0
.end method

.method public c()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroidx/dynamicanimation/animation/e;->c()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Landroidx/dynamicanimation/animation/j;->C:F

    .line 5
    .line 6
    const v1, 0x7f7fffff    # Float.MAX_VALUE

    .line 7
    .line 8
    .line 9
    cmpl-float v2, v0, v1

    .line 10
    .line 11
    if-eqz v2, :cond_1

    .line 12
    .line 13
    iget-object v2, p0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    .line 14
    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    new-instance v2, Landroidx/dynamicanimation/animation/k;

    .line 18
    .line 19
    invoke-direct {v2, v0}, Landroidx/dynamicanimation/animation/k;-><init>(F)V

    .line 20
    .line 21
    .line 22
    iput-object v2, p0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {v2, v0}, Landroidx/dynamicanimation/animation/k;->g(F)Landroidx/dynamicanimation/animation/k;

    .line 26
    .line 27
    .line 28
    :goto_0
    iput v1, p0, Landroidx/dynamicanimation/animation/j;->C:F

    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method s(F)V
    .locals 0

    .line 1
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-direct {p0}, Landroidx/dynamicanimation/animation/j;->A()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/e;->g()F

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    float-to-double v1, v1

    .line 11
    invoke-virtual {v0, v1, v2}, Landroidx/dynamicanimation/animation/k;->i(D)V

    .line 12
    .line 13
    .line 14
    invoke-super {p0}, Landroidx/dynamicanimation/animation/e;->t()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method v(J)Z
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-boolean v1, v0, Landroidx/dynamicanimation/animation/j;->D:Z

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x0

    .line 8
    const v5, 0x7f7fffff    # Float.MAX_VALUE

    .line 9
    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    iget v1, v0, Landroidx/dynamicanimation/animation/j;->C:F

    .line 14
    .line 15
    cmpl-float v6, v1, v5

    .line 16
    .line 17
    if-eqz v6, :cond_0

    .line 18
    .line 19
    iget-object v6, v0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    .line 20
    .line 21
    invoke-virtual {v6, v1}, Landroidx/dynamicanimation/animation/k;->g(F)Landroidx/dynamicanimation/animation/k;

    .line 22
    .line 23
    .line 24
    iput v5, v0, Landroidx/dynamicanimation/animation/j;->C:F

    .line 25
    .line 26
    :cond_0
    iget-object v1, v0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroidx/dynamicanimation/animation/k;->b()F

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iput v1, v0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 33
    .line 34
    iput v4, v0, Landroidx/dynamicanimation/animation/e;->a:F

    .line 35
    .line 36
    iput-boolean v3, v0, Landroidx/dynamicanimation/animation/j;->D:Z

    .line 37
    .line 38
    return v2

    .line 39
    :cond_1
    iget v1, v0, Landroidx/dynamicanimation/animation/j;->C:F

    .line 40
    .line 41
    cmpl-float v1, v1, v5

    .line 42
    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    iget-object v6, v0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    .line 46
    .line 47
    iget v1, v0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 48
    .line 49
    float-to-double v7, v1

    .line 50
    iget v1, v0, Landroidx/dynamicanimation/animation/e;->a:F

    .line 51
    .line 52
    float-to-double v9, v1

    .line 53
    const-wide/16 v11, 0x2

    .line 54
    .line 55
    div-long v18, p1, v11

    .line 56
    .line 57
    move-wide/from16 v11, v18

    .line 58
    .line 59
    invoke-virtual/range {v6 .. v12}, Landroidx/dynamicanimation/animation/k;->j(DDJ)Landroidx/dynamicanimation/animation/e$p;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iget-object v6, v0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    .line 64
    .line 65
    iget v7, v0, Landroidx/dynamicanimation/animation/j;->C:F

    .line 66
    .line 67
    invoke-virtual {v6, v7}, Landroidx/dynamicanimation/animation/k;->g(F)Landroidx/dynamicanimation/animation/k;

    .line 68
    .line 69
    .line 70
    iput v5, v0, Landroidx/dynamicanimation/animation/j;->C:F

    .line 71
    .line 72
    iget-object v13, v0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    .line 73
    .line 74
    iget v5, v1, Landroidx/dynamicanimation/animation/e$p;->a:F

    .line 75
    .line 76
    float-to-double v14, v5

    .line 77
    iget v1, v1, Landroidx/dynamicanimation/animation/e$p;->b:F

    .line 78
    .line 79
    float-to-double v5, v1

    .line 80
    move-wide/from16 v16, v5

    .line 81
    .line 82
    invoke-virtual/range {v13 .. v19}, Landroidx/dynamicanimation/animation/k;->j(DDJ)Landroidx/dynamicanimation/animation/e$p;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    iget v5, v1, Landroidx/dynamicanimation/animation/e$p;->a:F

    .line 87
    .line 88
    iput v5, v0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 89
    .line 90
    iget v1, v1, Landroidx/dynamicanimation/animation/e$p;->b:F

    .line 91
    .line 92
    iput v1, v0, Landroidx/dynamicanimation/animation/e;->a:F

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    iget-object v5, v0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    .line 96
    .line 97
    iget v1, v0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 98
    .line 99
    float-to-double v6, v1

    .line 100
    iget v1, v0, Landroidx/dynamicanimation/animation/e;->a:F

    .line 101
    .line 102
    float-to-double v8, v1

    .line 103
    move-wide/from16 v10, p1

    .line 104
    .line 105
    invoke-virtual/range {v5 .. v11}, Landroidx/dynamicanimation/animation/k;->j(DDJ)Landroidx/dynamicanimation/animation/e$p;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    iget v5, v1, Landroidx/dynamicanimation/animation/e$p;->a:F

    .line 110
    .line 111
    iput v5, v0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 112
    .line 113
    iget v1, v1, Landroidx/dynamicanimation/animation/e$p;->b:F

    .line 114
    .line 115
    iput v1, v0, Landroidx/dynamicanimation/animation/e;->a:F

    .line 116
    .line 117
    :goto_0
    iget v1, v0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 118
    .line 119
    iget v5, v0, Landroidx/dynamicanimation/animation/e;->h:F

    .line 120
    .line 121
    invoke-static {v1, v5}, Ljava/lang/Math;->max(FF)F

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    iput v1, v0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 126
    .line 127
    iget v5, v0, Landroidx/dynamicanimation/animation/e;->g:F

    .line 128
    .line 129
    invoke-static {v1, v5}, Ljava/lang/Math;->min(FF)F

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    iput v1, v0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 134
    .line 135
    iget v5, v0, Landroidx/dynamicanimation/animation/e;->a:F

    .line 136
    .line 137
    invoke-virtual {v0, v1, v5}, Landroidx/dynamicanimation/animation/j;->z(FF)Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_3

    .line 142
    .line 143
    iget-object v1, v0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    .line 144
    .line 145
    invoke-virtual {v1}, Landroidx/dynamicanimation/animation/k;->b()F

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    iput v1, v0, Landroidx/dynamicanimation/animation/e;->b:F

    .line 150
    .line 151
    iput v4, v0, Landroidx/dynamicanimation/animation/e;->a:F

    .line 152
    .line 153
    return v2

    .line 154
    :cond_3
    return v3
.end method

.method public w(F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/e;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Landroidx/dynamicanimation/animation/j;->C:F

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    new-instance v0, Landroidx/dynamicanimation/animation/k;

    .line 15
    .line 16
    invoke-direct {v0, p1}, Landroidx/dynamicanimation/animation/k;-><init>(F)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Landroidx/dynamicanimation/animation/k;->g(F)Landroidx/dynamicanimation/animation/k;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/j;->t()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public x()Z
    .locals 4

    .line 1
    iget-object p0, p0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    .line 2
    .line 3
    iget-wide v0, p0, Landroidx/dynamicanimation/animation/k;->b:D

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmpl-double p0, v0, v2

    .line 8
    .line 9
    if-lez p0, :cond_0

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

.method public y()Landroidx/dynamicanimation/animation/k;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    .line 2
    .line 3
    return-object p0
.end method

.method z(FF)Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/dynamicanimation/animation/j;->B:Landroidx/dynamicanimation/animation/k;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Landroidx/dynamicanimation/animation/k;->e(FF)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
