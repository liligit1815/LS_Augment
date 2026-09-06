.class final Lcom/google/android/material/carousel/f;
.super Ljava/lang/Object;
.source "KeylineState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/carousel/f$c;,
        Lcom/google/android/material/carousel/f$b;
    }
.end annotation


# instance fields
.field private final a:F

.field private final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/material/carousel/f$c;",
            ">;"
        }
    .end annotation
.end field

.field private final c:I

.field private final d:I


# direct methods
.method private constructor <init>(FLjava/util/List;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F",
            "Ljava/util/List<",
            "Lcom/google/android/material/carousel/f$c;",
            ">;II)V"
        }
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput p1, p0, Lcom/google/android/material/carousel/f;->a:F

    .line 4
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/material/carousel/f;->b:Ljava/util/List;

    .line 5
    iput p3, p0, Lcom/google/android/material/carousel/f;->c:I

    .line 6
    iput p4, p0, Lcom/google/android/material/carousel/f;->d:I

    return-void
.end method

.method synthetic constructor <init>(FLjava/util/List;IILcom/google/android/material/carousel/f$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/material/carousel/f;-><init>(FLjava/util/List;II)V

    return-void
.end method

.method static m(Lcom/google/android/material/carousel/f;Lcom/google/android/material/carousel/f;F)Lcom/google/android/material/carousel/f;
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->f()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Lcom/google/android/material/carousel/f;->f()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    cmpl-float v0, v0, v1

    .line 10
    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p1}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-ne v2, v3, :cond_1

    .line 30
    .line 31
    new-instance v2, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    const/4 v3, 0x0

    .line 37
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-ge v3, v4, :cond_0

    .line 46
    .line 47
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    check-cast v4, Lcom/google/android/material/carousel/f$c;

    .line 52
    .line 53
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    check-cast v5, Lcom/google/android/material/carousel/f$c;

    .line 58
    .line 59
    invoke-static {v4, v5, p2}, Lcom/google/android/material/carousel/f$c;->a(Lcom/google/android/material/carousel/f$c;Lcom/google/android/material/carousel/f$c;F)Lcom/google/android/material/carousel/f$c;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    add-int/lit8 v3, v3, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->b()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    invoke-virtual {p1}, Lcom/google/android/material/carousel/f;->b()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-static {v0, v1, p2}, LY2/a;->c(IIF)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->i()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    invoke-virtual {p1}, Lcom/google/android/material/carousel/f;->i()I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    invoke-static {v1, p1, p2}, LY2/a;->c(IIF)I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    new-instance p2, Lcom/google/android/material/carousel/f;

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->f()F

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    invoke-direct {p2, p0, v2, v0, p1}, Lcom/google/android/material/carousel/f;-><init>(FLjava/util/List;II)V

    .line 100
    .line 101
    .line 102
    return-object p2

    .line 103
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 104
    .line 105
    const-string p1, "Keylines being linearly interpolated must have the same number of keylines."

    .line 106
    .line 107
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    throw p0

    .line 111
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 112
    .line 113
    const-string p1, "Keylines being linearly interpolated must have the same item size."

    .line 114
    .line 115
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    throw p0
.end method

.method static n(Lcom/google/android/material/carousel/f;F)Lcom/google/android/material/carousel/f;
    .locals 10

    .line 1
    new-instance v0, Lcom/google/android/material/carousel/f$b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->f()F

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-direct {v0, v1, p1}, Lcom/google/android/material/carousel/f$b;-><init>(FF)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->j()Lcom/google/android/material/carousel/f$c;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget v1, v1, Lcom/google/android/material/carousel/f$c;->b:F

    .line 15
    .line 16
    sub-float/2addr p1, v1

    .line 17
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->j()Lcom/google/android/material/carousel/f$c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget v1, v1, Lcom/google/android/material/carousel/f$c;->d:F

    .line 22
    .line 23
    const/high16 v6, 0x40000000    # 2.0f

    .line 24
    .line 25
    div-float/2addr v1, v6

    .line 26
    sub-float/2addr p1, v1

    .line 27
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/4 v7, 0x1

    .line 36
    sub-int/2addr v1, v7

    .line 37
    move v8, v1

    .line 38
    :goto_0
    if-ltz v8, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->g()Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    move-object v9, v1

    .line 49
    check-cast v9, Lcom/google/android/material/carousel/f$c;

    .line 50
    .line 51
    iget v1, v9, Lcom/google/android/material/carousel/f$c;->d:F

    .line 52
    .line 53
    div-float/2addr v1, v6

    .line 54
    add-float/2addr v1, p1

    .line 55
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->b()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-lt v8, v2, :cond_0

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/google/android/material/carousel/f;->i()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-gt v8, v2, :cond_0

    .line 66
    .line 67
    move v4, v7

    .line 68
    goto :goto_1

    .line 69
    :cond_0
    const/4 v2, 0x0

    .line 70
    move v4, v2

    .line 71
    :goto_1
    iget v2, v9, Lcom/google/android/material/carousel/f$c;->c:F

    .line 72
    .line 73
    iget v3, v9, Lcom/google/android/material/carousel/f$c;->d:F

    .line 74
    .line 75
    iget-boolean v5, v9, Lcom/google/android/material/carousel/f$c;->e:Z

    .line 76
    .line 77
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/material/carousel/f$b;->d(FFFZZ)Lcom/google/android/material/carousel/f$b;

    .line 78
    .line 79
    .line 80
    iget v1, v9, Lcom/google/android/material/carousel/f$c;->d:F

    .line 81
    .line 82
    add-float/2addr p1, v1

    .line 83
    add-int/lit8 v8, v8, -0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    invoke-virtual {v0}, Lcom/google/android/material/carousel/f$b;->i()Lcom/google/android/material/carousel/f;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0
.end method


# virtual methods
.method a()Lcom/google/android/material/carousel/f$c;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/carousel/f;->b:Ljava/util/List;

    .line 2
    .line 3
    iget p0, p0, Lcom/google/android/material/carousel/f;->c:I

    .line 4
    .line 5
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/google/android/material/carousel/f$c;

    .line 10
    .line 11
    return-object p0
.end method

.method b()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/carousel/f;->c:I

    .line 2
    .line 3
    return p0
.end method

.method c()Lcom/google/android/material/carousel/f$c;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/carousel/f;->b:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/google/android/material/carousel/f$c;

    .line 9
    .line 10
    return-object p0
.end method

.method d()Lcom/google/android/material/carousel/f$c;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/google/android/material/carousel/f;->b:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lcom/google/android/material/carousel/f;->b:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/google/android/material/carousel/f$c;

    .line 17
    .line 18
    iget-boolean v2, v1, Lcom/google/android/material/carousel/f$c;->e:Z

    .line 19
    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    return-object v1

    .line 23
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method e()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/material/carousel/f$c;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/material/carousel/f;->b:Ljava/util/List;

    .line 2
    .line 3
    iget v1, p0, Lcom/google/android/material/carousel/f;->c:I

    .line 4
    .line 5
    iget p0, p0, Lcom/google/android/material/carousel/f;->d:I

    .line 6
    .line 7
    add-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-interface {v0, v1, p0}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method f()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/carousel/f;->a:F

    .line 2
    .line 3
    return p0
.end method

.method g()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/material/carousel/f$c;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/material/carousel/f;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method h()Lcom/google/android/material/carousel/f$c;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/carousel/f;->b:Ljava/util/List;

    .line 2
    .line 3
    iget p0, p0, Lcom/google/android/material/carousel/f;->d:I

    .line 4
    .line 5
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/google/android/material/carousel/f$c;

    .line 10
    .line 11
    return-object p0
.end method

.method i()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/carousel/f;->d:I

    .line 2
    .line 3
    return p0
.end method

.method j()Lcom/google/android/material/carousel/f$c;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/carousel/f;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/google/android/material/carousel/f$c;

    .line 14
    .line 15
    return-object p0
.end method

.method k()Lcom/google/android/material/carousel/f$c;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/carousel/f;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    :goto_0
    if-ltz v0, :cond_1

    .line 10
    .line 11
    iget-object v1, p0, Lcom/google/android/material/carousel/f;->b:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/google/android/material/carousel/f$c;

    .line 18
    .line 19
    iget-boolean v2, v1, Lcom/google/android/material/carousel/f$c;->e:Z

    .line 20
    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    return-object v1

    .line 24
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method l()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/carousel/f;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_1

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Lcom/google/android/material/carousel/f$c;

    .line 19
    .line 20
    iget-boolean v2, v2, Lcom/google/android/material/carousel/f$c;->e:Z

    .line 21
    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-object p0, p0, Lcom/google/android/material/carousel/f;->b:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    sub-int/2addr p0, v1

    .line 34
    return p0
.end method
