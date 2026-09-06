.class public Lq/h;
.super Lq/b;
.source "PriorityGoalRow.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lq/h$b;
    }
.end annotation


# instance fields
.field private g:I

.field private h:[Lq/i;

.field private i:[Lq/i;

.field private j:I

.field k:Lq/h$b;

.field l:Lq/c;


# direct methods
.method public constructor <init>(Lq/c;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lq/b;-><init>(Lq/c;)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x80

    .line 5
    .line 6
    iput v0, p0, Lq/h;->g:I

    .line 7
    .line 8
    new-array v1, v0, [Lq/i;

    .line 9
    .line 10
    iput-object v1, p0, Lq/h;->h:[Lq/i;

    .line 11
    .line 12
    new-array v0, v0, [Lq/i;

    .line 13
    .line 14
    iput-object v0, p0, Lq/h;->i:[Lq/i;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput v0, p0, Lq/h;->j:I

    .line 18
    .line 19
    new-instance v0, Lq/h$b;

    .line 20
    .line 21
    invoke-direct {v0, p0, p0}, Lq/h$b;-><init>(Lq/h;Lq/h;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lq/h;->k:Lq/h$b;

    .line 25
    .line 26
    iput-object p1, p0, Lq/h;->l:Lq/c;

    .line 27
    .line 28
    return-void
.end method

.method static synthetic E(Lq/h;Lq/i;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lq/h;->G(Lq/i;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private F(Lq/i;)V
    .locals 5

    .line 1
    iget v0, p0, Lq/h;->j:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    iget-object v2, p0, Lq/h;->h:[Lq/i;

    .line 6
    .line 7
    array-length v3, v2

    .line 8
    if-le v0, v3, :cond_0

    .line 9
    .line 10
    array-length v0, v2

    .line 11
    mul-int/lit8 v0, v0, 0x2

    .line 12
    .line 13
    invoke-static {v2, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, [Lq/i;

    .line 18
    .line 19
    iput-object v0, p0, Lq/h;->h:[Lq/i;

    .line 20
    .line 21
    array-length v2, v0

    .line 22
    mul-int/lit8 v2, v2, 0x2

    .line 23
    .line 24
    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, [Lq/i;

    .line 29
    .line 30
    iput-object v0, p0, Lq/h;->i:[Lq/i;

    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lq/h;->h:[Lq/i;

    .line 33
    .line 34
    iget v2, p0, Lq/h;->j:I

    .line 35
    .line 36
    aput-object p1, v0, v2

    .line 37
    .line 38
    add-int/lit8 v3, v2, 0x1

    .line 39
    .line 40
    iput v3, p0, Lq/h;->j:I

    .line 41
    .line 42
    if-le v3, v1, :cond_2

    .line 43
    .line 44
    aget-object v0, v0, v2

    .line 45
    .line 46
    iget v0, v0, Lq/i;->i:I

    .line 47
    .line 48
    iget v2, p1, Lq/i;->i:I

    .line 49
    .line 50
    if-le v0, v2, :cond_2

    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    move v2, v0

    .line 54
    :goto_0
    iget v3, p0, Lq/h;->j:I

    .line 55
    .line 56
    if-ge v2, v3, :cond_1

    .line 57
    .line 58
    iget-object v3, p0, Lq/h;->i:[Lq/i;

    .line 59
    .line 60
    iget-object v4, p0, Lq/h;->h:[Lq/i;

    .line 61
    .line 62
    aget-object v4, v4, v2

    .line 63
    .line 64
    aput-object v4, v3, v2

    .line 65
    .line 66
    add-int/lit8 v2, v2, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    iget-object v2, p0, Lq/h;->i:[Lq/i;

    .line 70
    .line 71
    new-instance v4, Lq/h$a;

    .line 72
    .line 73
    invoke-direct {v4, p0}, Lq/h$a;-><init>(Lq/h;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v2, v0, v3, v4}, Ljava/util/Arrays;->sort([Ljava/lang/Object;IILjava/util/Comparator;)V

    .line 77
    .line 78
    .line 79
    :goto_1
    iget v2, p0, Lq/h;->j:I

    .line 80
    .line 81
    if-ge v0, v2, :cond_2

    .line 82
    .line 83
    iget-object v2, p0, Lq/h;->h:[Lq/i;

    .line 84
    .line 85
    iget-object v3, p0, Lq/h;->i:[Lq/i;

    .line 86
    .line 87
    aget-object v3, v3, v0

    .line 88
    .line 89
    aput-object v3, v2, v0

    .line 90
    .line 91
    add-int/lit8 v0, v0, 0x1

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_2
    iput-boolean v1, p1, Lq/i;->g:Z

    .line 95
    .line 96
    invoke-virtual {p1, p0}, Lq/i;->a(Lq/b;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method private G(Lq/i;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget v2, p0, Lq/h;->j:I

    .line 4
    .line 5
    if-ge v1, v2, :cond_2

    .line 6
    .line 7
    iget-object v2, p0, Lq/h;->h:[Lq/i;

    .line 8
    .line 9
    aget-object v2, v2, v1

    .line 10
    .line 11
    if-ne v2, p1, :cond_1

    .line 12
    .line 13
    :goto_1
    iget v2, p0, Lq/h;->j:I

    .line 14
    .line 15
    add-int/lit8 v3, v2, -0x1

    .line 16
    .line 17
    if-ge v1, v3, :cond_0

    .line 18
    .line 19
    iget-object v2, p0, Lq/h;->h:[Lq/i;

    .line 20
    .line 21
    add-int/lit8 v3, v1, 0x1

    .line 22
    .line 23
    aget-object v4, v2, v3

    .line 24
    .line 25
    aput-object v4, v2, v1

    .line 26
    .line 27
    move v1, v3

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    add-int/lit8 v2, v2, -0x1

    .line 30
    .line 31
    iput v2, p0, Lq/h;->j:I

    .line 32
    .line 33
    iput-boolean v0, p1, Lq/i;->g:Z

    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    return-void
.end method


# virtual methods
.method public B(Lq/d;Lq/b;Z)V
    .locals 5

    .line 1
    iget-object p1, p2, Lq/b;->a:Lq/i;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p3, p2, Lq/b;->e:Lq/b$a;

    .line 7
    .line 8
    invoke-interface {p3}, Lq/b$a;->f()I

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
    invoke-interface {p3, v1}, Lq/b$a;->b(I)Lq/i;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-interface {p3, v1}, Lq/b$a;->i(I)F

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    iget-object v4, p0, Lq/h;->k:Lq/h$b;

    .line 24
    .line 25
    invoke-virtual {v4, v2}, Lq/h$b;->b(Lq/i;)V

    .line 26
    .line 27
    .line 28
    iget-object v4, p0, Lq/h;->k:Lq/h$b;

    .line 29
    .line 30
    invoke-virtual {v4, p1, v3}, Lq/h$b;->a(Lq/i;F)Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-eqz v4, :cond_1

    .line 35
    .line 36
    invoke-direct {p0, v2}, Lq/h;->F(Lq/i;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    iget v2, p0, Lq/b;->b:F

    .line 40
    .line 41
    iget v4, p2, Lq/b;->b:F

    .line 42
    .line 43
    mul-float/2addr v4, v3

    .line 44
    add-float/2addr v2, v4

    .line 45
    iput v2, p0, Lq/b;->b:F

    .line 46
    .line 47
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    invoke-direct {p0, p1}, Lq/h;->G(Lq/i;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public b(Lq/i;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lq/h;->k:Lq/h$b;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lq/h$b;->b(Lq/i;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lq/h;->k:Lq/h$b;

    .line 7
    .line 8
    invoke-virtual {v0}, Lq/h$b;->e()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p1, Lq/i;->o:[F

    .line 12
    .line 13
    iget v1, p1, Lq/i;->k:I

    .line 14
    .line 15
    const/high16 v2, 0x3f800000    # 1.0f

    .line 16
    .line 17
    aput v2, v0, v1

    .line 18
    .line 19
    invoke-direct {p0, p1}, Lq/h;->F(Lq/i;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public c(Lq/d;[Z)Lq/i;
    .locals 4

    .line 1
    const/4 p1, -0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    move v1, p1

    .line 4
    :goto_0
    iget v2, p0, Lq/h;->j:I

    .line 5
    .line 6
    if-ge v0, v2, :cond_3

    .line 7
    .line 8
    iget-object v2, p0, Lq/h;->h:[Lq/i;

    .line 9
    .line 10
    aget-object v2, v2, v0

    .line 11
    .line 12
    iget v3, v2, Lq/i;->i:I

    .line 13
    .line 14
    aget-boolean v3, p2, v3

    .line 15
    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    goto :goto_2

    .line 19
    :cond_0
    iget-object v3, p0, Lq/h;->k:Lq/h$b;

    .line 20
    .line 21
    invoke-virtual {v3, v2}, Lq/h$b;->b(Lq/i;)V

    .line 22
    .line 23
    .line 24
    if-ne v1, p1, :cond_1

    .line 25
    .line 26
    iget-object v2, p0, Lq/h;->k:Lq/h$b;

    .line 27
    .line 28
    invoke-virtual {v2}, Lq/h$b;->c()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    iget-object v2, p0, Lq/h;->k:Lq/h$b;

    .line 36
    .line 37
    iget-object v3, p0, Lq/h;->h:[Lq/i;

    .line 38
    .line 39
    aget-object v3, v3, v1

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Lq/h$b;->d(Lq/i;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_2

    .line 46
    .line 47
    :goto_1
    move v1, v0

    .line 48
    :cond_2
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_3
    if-ne v1, p1, :cond_4

    .line 52
    .line 53
    const/4 p0, 0x0

    .line 54
    return-object p0

    .line 55
    :cond_4
    iget-object p0, p0, Lq/h;->h:[Lq/i;

    .line 56
    .line 57
    aget-object p0, p0, v1

    .line 58
    .line 59
    return-object p0
.end method

.method public clear()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lq/h;->j:I

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lq/b;->b:F

    .line 6
    .line 7
    return-void
.end method

.method public isEmpty()Z
    .locals 0

    .line 1
    iget p0, p0, Lq/h;->j:I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " goal -> ("

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget v1, p0, Lq/b;->b:F

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, ") : "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const/4 v1, 0x0

    .line 31
    :goto_0
    iget v2, p0, Lq/h;->j:I

    .line 32
    .line 33
    if-ge v1, v2, :cond_0

    .line 34
    .line 35
    iget-object v2, p0, Lq/h;->h:[Lq/i;

    .line 36
    .line 37
    aget-object v2, v2, v1

    .line 38
    .line 39
    iget-object v3, p0, Lq/h;->k:Lq/h$b;

    .line 40
    .line 41
    invoke-virtual {v3, v2}, Lq/h$b;->b(Lq/i;)V

    .line 42
    .line 43
    .line 44
    new-instance v2, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lq/h;->k:Lq/h$b;

    .line 53
    .line 54
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v0, " "

    .line 58
    .line 59
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    add-int/lit8 v1, v1, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    return-object v0
.end method
