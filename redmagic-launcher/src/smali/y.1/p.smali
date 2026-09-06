.class Ly/p;
.super Ljava/lang/Object;
.source "KeyframeSet.java"

# interfaces
.implements Ly/q;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ly/q<",
        "TT;>;"
    }
.end annotation


# instance fields
.field g:I

.field h:Ly/o;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly/o<",
            "TT;>;"
        }
    .end annotation
.end field

.field i:Ly/o;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly/o<",
            "TT;>;"
        }
    .end annotation
.end field

.field j:Ly/n;

.field k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ly/o<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field l:Ly/y;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly/y<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method varargs constructor <init>([Ly/o;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ly/o<",
            "TT;>;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    array-length v0, p1

    .line 5
    iput v0, p0, Ly/p;->g:I

    .line 6
    .line 7
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ly/p;->k:Ljava/util/List;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    aget-object v0, p1, v0

    .line 15
    .line 16
    iput-object v0, p0, Ly/p;->h:Ly/o;

    .line 17
    .line 18
    iget v0, p0, Ly/p;->g:I

    .line 19
    .line 20
    add-int/lit8 v0, v0, -0x1

    .line 21
    .line 22
    aget-object p1, p1, v0

    .line 23
    .line 24
    iput-object p1, p0, Ly/p;->i:Ly/o;

    .line 25
    .line 26
    invoke-virtual {p1}, Ly/o;->c()Ly/n;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Ly/p;->j:Ly/n;

    .line 31
    .line 32
    return-void
.end method

.method static varargs a([F)Ly/p;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([F)",
            "Ly/p<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x2

    .line 3
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    new-array v1, v1, [Ly/o$a;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x0

    .line 11
    const/4 v4, 0x1

    .line 12
    if-ne v0, v4, :cond_0

    .line 13
    .line 14
    invoke-static {v2}, Ly/o;->h(F)Ly/o;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ly/o$a;

    .line 19
    .line 20
    aput-object v0, v1, v3

    .line 21
    .line 22
    const/high16 v0, 0x3f800000    # 1.0f

    .line 23
    .line 24
    aget v2, p0, v3

    .line 25
    .line 26
    invoke-static {v0, v2}, Ly/o;->i(FF)Ly/o;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ly/o$a;

    .line 31
    .line 32
    aput-object v0, v1, v4

    .line 33
    .line 34
    aget p0, p0, v3

    .line 35
    .line 36
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_2

    .line 41
    .line 42
    move v3, v4

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    aget v5, p0, v3

    .line 45
    .line 46
    invoke-static {v2, v5}, Ly/o;->i(FF)Ly/o;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Ly/o$a;

    .line 51
    .line 52
    aput-object v2, v1, v3

    .line 53
    .line 54
    move v2, v4

    .line 55
    :goto_0
    if-ge v2, v0, :cond_2

    .line 56
    .line 57
    int-to-float v5, v2

    .line 58
    add-int/lit8 v6, v0, -0x1

    .line 59
    .line 60
    int-to-float v6, v6

    .line 61
    div-float/2addr v5, v6

    .line 62
    aget v6, p0, v2

    .line 63
    .line 64
    invoke-static {v5, v6}, Ly/o;->i(FF)Ly/o;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    check-cast v5, Ly/o$a;

    .line 69
    .line 70
    aput-object v5, v1, v2

    .line 71
    .line 72
    aget v5, p0, v2

    .line 73
    .line 74
    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    if-eqz v5, :cond_1

    .line 79
    .line 80
    move v3, v4

    .line 81
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    :goto_1
    if-eqz v3, :cond_3

    .line 85
    .line 86
    const-string p0, "Animator"

    .line 87
    .line 88
    const-string v0, "Bad value (NaN) in float animator"

    .line 89
    .line 90
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    :cond_3
    new-instance p0, Ly/k;

    .line 94
    .line 95
    invoke-direct {p0, v1}, Ly/k;-><init>([Ly/o$a;)V

    .line 96
    .line 97
    .line 98
    return-object p0
.end method


# virtual methods
.method public getKeyframes()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ly/o<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ly/p;->k:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ly/y;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ly/y<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ly/p;->l:Ly/y;

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, " "

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :goto_0
    iget v2, p0, Ly/p;->g:I

    .line 5
    .line 6
    if-ge v1, v2, :cond_0

    .line 7
    .line 8
    new-instance v2, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ly/p;->k:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ly/o;

    .line 23
    .line 24
    invoke-virtual {v0}, Ly/o;->d()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v0, "  "

    .line 32
    .line 33
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    return-object v0
.end method
