.class public final LN2/s;
.super Ljava/lang/Object;
.source "DragZoneFactory.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LN2/s$a;,
        LN2/s$b;,
        LN2/s$c;
    }
.end annotation


# instance fields
.field private A:I

.field private final a:Landroid/content/Context;

.field private final b:LN2/n;

.field private final c:LN2/s$b;

.field private final d:LN2/s$a;

.field private e:I

.field private f:I

.field private g:I

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

.field private r:I

.field private s:I

.field private t:I

.field private u:I

.field private v:I

.field private w:I

.field private x:I

.field private y:I

.field private z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;LN2/n;LN2/s$b;LN2/s$a;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "deviceConfig"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "splitScreenModeChecker"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "desktopWindowModeChecker"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, LN2/s;->a:Landroid/content/Context;

    .line 25
    .line 26
    iput-object p2, p0, LN2/s;->b:LN2/n;

    .line 27
    .line 28
    iput-object p3, p0, LN2/s;->c:LN2/s$b;

    .line 29
    .line 30
    iput-object p4, p0, LN2/s;->d:LN2/s$a;

    .line 31
    .line 32
    invoke-virtual {p0}, LN2/s;->n()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private final a()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LN2/r;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object v1, p0, LN2/s;->b:LN2/n;

    .line 3
    .line 4
    invoke-virtual {v1}, LN2/n;->d()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget v1, p0, LN2/s;->g:I

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget v1, p0, LN2/s;->f:I

    .line 14
    .line 15
    :goto_0
    new-instance v2, LN2/r$a$a;

    .line 16
    .line 17
    new-instance v3, Landroid/graphics/Rect;

    .line 18
    .line 19
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    .line 24
    .line 25
    sub-int/2addr v4, v1

    .line 26
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    .line 31
    .line 32
    invoke-direct {v3, v0, v4, v1, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 33
    .line 34
    .line 35
    invoke-direct {p0}, LN2/s;->j()Landroid/graphics/Rect;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-direct {v2, v3, v4}, LN2/r$a$a;-><init>(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 40
    .line 41
    .line 42
    new-instance v3, LN2/r$a$b;

    .line 43
    .line 44
    new-instance v4, Landroid/graphics/Rect;

    .line 45
    .line 46
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    iget v5, v5, Landroid/graphics/Rect;->right:I

    .line 51
    .line 52
    sub-int/2addr v5, v1

    .line 53
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    .line 58
    .line 59
    sub-int/2addr v6, v1

    .line 60
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 65
    .line 66
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 67
    .line 68
    .line 69
    move-result-object v7

    .line 70
    iget v7, v7, Landroid/graphics/Rect;->bottom:I

    .line 71
    .line 72
    invoke-direct {v4, v5, v6, v1, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 73
    .line 74
    .line 75
    invoke-direct {p0}, LN2/s;->k()Landroid/graphics/Rect;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-direct {v3, v4, p0}, LN2/r$a$b;-><init>(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 80
    .line 81
    .line 82
    const/4 p0, 0x2

    .line 83
    new-array p0, p0, [LN2/r$a;

    .line 84
    .line 85
    aput-object v2, p0, v0

    .line 86
    .line 87
    const/4 v0, 0x1

    .line 88
    aput-object v3, p0, v0

    .line 89
    .line 90
    invoke-static {p0}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0
.end method

.method private final b()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LN2/r;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, LN2/r$a$a;

    .line 2
    .line 3
    new-instance v1, Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget v2, v2, Landroid/graphics/Rect;->right:I

    .line 10
    .line 11
    const/4 v3, 0x2

    .line 12
    div-int/2addr v2, v3

    .line 13
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    .line 18
    .line 19
    const/4 v5, 0x0

    .line 20
    invoke-direct {v1, v5, v5, v2, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, LN2/s;->j()Landroid/graphics/Rect;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-direct {v0, v1, v2}, LN2/r$a$a;-><init>(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 28
    .line 29
    .line 30
    new-instance v1, LN2/r$a$b;

    .line 31
    .line 32
    new-instance v2, Landroid/graphics/Rect;

    .line 33
    .line 34
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 39
    .line 40
    div-int/2addr v4, v3

    .line 41
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    iget v6, v6, Landroid/graphics/Rect;->right:I

    .line 46
    .line 47
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    iget v7, v7, Landroid/graphics/Rect;->bottom:I

    .line 52
    .line 53
    invoke-direct {v2, v4, v5, v6, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 54
    .line 55
    .line 56
    invoke-direct {p0}, LN2/s;->k()Landroid/graphics/Rect;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-direct {v1, v2, p0}, LN2/r$a$b;-><init>(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 61
    .line 62
    .line 63
    new-array p0, v3, [LN2/r$a;

    .line 64
    .line 65
    aput-object v0, p0, v5

    .line 66
    .line 67
    const/4 v0, 0x1

    .line 68
    aput-object v1, p0, v0

    .line 69
    .line 70
    invoke-static {p0}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0
.end method

.method private final c()LN2/r;
    .locals 7

    .line 1
    new-instance v0, LN2/r$c;

    .line 2
    .line 3
    iget-object v1, p0, LN2/s;->b:LN2/n;

    .line 4
    .line 5
    invoke-virtual {v1}, LN2/n;->c()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    new-instance v1, Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget v2, v2, Landroid/graphics/Rect;->right:I

    .line 18
    .line 19
    div-int/lit8 v2, v2, 0x2

    .line 20
    .line 21
    iget v3, p0, LN2/s;->j:I

    .line 22
    .line 23
    div-int/lit8 v3, v3, 0x2

    .line 24
    .line 25
    sub-int/2addr v2, v3

    .line 26
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 31
    .line 32
    div-int/lit8 v3, v3, 0x2

    .line 33
    .line 34
    iget v4, p0, LN2/s;->k:I

    .line 35
    .line 36
    div-int/lit8 v4, v4, 0x2

    .line 37
    .line 38
    sub-int/2addr v3, v4

    .line 39
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 44
    .line 45
    div-int/lit8 v4, v4, 0x2

    .line 46
    .line 47
    iget v5, p0, LN2/s;->j:I

    .line 48
    .line 49
    div-int/lit8 v5, v5, 0x2

    .line 50
    .line 51
    add-int/2addr v4, v5

    .line 52
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    .line 57
    .line 58
    div-int/lit8 v5, v5, 0x2

    .line 59
    .line 60
    iget v6, p0, LN2/s;->k:I

    .line 61
    .line 62
    div-int/lit8 v6, v6, 0x2

    .line 63
    .line 64
    add-int/2addr v5, v6

    .line 65
    invoke-direct {v1, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    new-instance v1, Landroid/graphics/Rect;

    .line 70
    .line 71
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 76
    .line 77
    div-int/lit8 v2, v2, 0x2

    .line 78
    .line 79
    iget v3, p0, LN2/s;->k:I

    .line 80
    .line 81
    div-int/lit8 v3, v3, 0x2

    .line 82
    .line 83
    sub-int/2addr v2, v3

    .line 84
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    iget v3, v3, Landroid/graphics/Rect;->right:I

    .line 89
    .line 90
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    .line 95
    .line 96
    div-int/lit8 v4, v4, 0x2

    .line 97
    .line 98
    iget v5, p0, LN2/s;->k:I

    .line 99
    .line 100
    div-int/lit8 v5, v5, 0x2

    .line 101
    .line 102
    add-int/2addr v4, v5

    .line 103
    const/4 v5, 0x0

    .line 104
    invoke-direct {v1, v5, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 105
    .line 106
    .line 107
    :goto_0
    invoke-direct {p0}, LN2/s;->i()Landroid/graphics/Rect;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-direct {v0, v1, p0}, LN2/r$c;-><init>(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 112
    .line 113
    .line 114
    return-object v0
.end method

.method private final d()LN2/r;
    .locals 6

    .line 1
    new-instance v0, LN2/r$d;

    .line 2
    .line 3
    new-instance v1, Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget v2, v2, Landroid/graphics/Rect;->right:I

    .line 10
    .line 11
    div-int/lit8 v2, v2, 0x2

    .line 12
    .line 13
    iget v3, p0, LN2/s;->e:I

    .line 14
    .line 15
    div-int/lit8 v3, v3, 0x2

    .line 16
    .line 17
    sub-int/2addr v2, v3

    .line 18
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 23
    .line 24
    iget v4, p0, LN2/s;->e:I

    .line 25
    .line 26
    sub-int/2addr v3, v4

    .line 27
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 32
    .line 33
    div-int/lit8 v4, v4, 0x2

    .line 34
    .line 35
    iget v5, p0, LN2/s;->e:I

    .line 36
    .line 37
    div-int/lit8 v5, v5, 0x2

    .line 38
    .line 39
    add-int/2addr v4, v5

    .line 40
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 45
    .line 46
    invoke-direct {v1, v2, v3, v4, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 47
    .line 48
    .line 49
    invoke-direct {v0, v1}, LN2/r$d;-><init>(Landroid/graphics/Rect;)V

    .line 50
    .line 51
    .line 52
    return-object v0
.end method

.method private final e()LN2/r;
    .locals 6

    .line 1
    new-instance v0, LN2/r$e;

    .line 2
    .line 3
    new-instance v1, Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget v2, v2, Landroid/graphics/Rect;->right:I

    .line 10
    .line 11
    div-int/lit8 v2, v2, 0x2

    .line 12
    .line 13
    iget v3, p0, LN2/s;->h:I

    .line 14
    .line 15
    div-int/lit8 v3, v3, 0x2

    .line 16
    .line 17
    sub-int/2addr v2, v3

    .line 18
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    iget v3, v3, Landroid/graphics/Rect;->right:I

    .line 23
    .line 24
    div-int/lit8 v3, v3, 0x2

    .line 25
    .line 26
    iget v4, p0, LN2/s;->h:I

    .line 27
    .line 28
    div-int/lit8 v4, v4, 0x2

    .line 29
    .line 30
    add-int/2addr v3, v4

    .line 31
    iget v4, p0, LN2/s;->i:I

    .line 32
    .line 33
    const/4 v5, 0x0

    .line 34
    invoke-direct {v1, v2, v5, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0}, LN2/s;->l()Landroid/graphics/Rect;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-direct {v0, v1, p0}, LN2/r$e;-><init>(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 42
    .line 43
    .line 44
    return-object v0
.end method

.method private final g()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LN2/r;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LN2/s;->b:LN2/n;

    .line 2
    .line 3
    invoke-virtual {v0}, LN2/n;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, LN2/s;->b:LN2/n;

    .line 8
    .line 9
    invoke-virtual {v1}, LN2/n;->c()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x5

    .line 14
    const/4 v3, 0x4

    .line 15
    const/4 v4, 0x3

    .line 16
    const/4 v5, 0x1

    .line 17
    const/4 v6, 0x2

    .line 18
    const/4 v7, 0x0

    .line 19
    if-ne v0, v1, :cond_4

    .line 20
    .line 21
    iget-object v0, p0, LN2/s;->c:LN2/s$b;

    .line 22
    .line 23
    invoke-interface {v0}, LN2/s$b;->a()LN2/s$b$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v1, LN2/s$c;->a:[I

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    aget v0, v1, v0

    .line 34
    .line 35
    if-eq v0, v5, :cond_3

    .line 36
    .line 37
    if-eq v0, v6, :cond_2

    .line 38
    .line 39
    if-eq v0, v4, :cond_2

    .line 40
    .line 41
    if-eq v0, v3, :cond_1

    .line 42
    .line 43
    if-ne v0, v2, :cond_0

    .line 44
    .line 45
    new-instance v0, LN2/r$f$d;

    .line 46
    .line 47
    new-instance v1, Landroid/graphics/Rect;

    .line 48
    .line 49
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    iget v2, v2, Landroid/graphics/Rect;->right:I

    .line 54
    .line 55
    iget v3, p0, LN2/s;->n:I

    .line 56
    .line 57
    invoke-direct {v1, v7, v7, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 58
    .line 59
    .line 60
    invoke-direct {v0, v1}, LN2/r$f$d;-><init>(Landroid/graphics/Rect;)V

    .line 61
    .line 62
    .line 63
    new-instance v1, LN2/r$f$a;

    .line 64
    .line 65
    new-instance v2, Landroid/graphics/Rect;

    .line 66
    .line 67
    iget v3, p0, LN2/s;->n:I

    .line 68
    .line 69
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 74
    .line 75
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 80
    .line 81
    invoke-direct {v2, v7, v3, v4, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 82
    .line 83
    .line 84
    invoke-direct {v1, v2}, LN2/r$f$a;-><init>(Landroid/graphics/Rect;)V

    .line 85
    .line 86
    .line 87
    new-array p0, v6, [LN2/r$f;

    .line 88
    .line 89
    aput-object v0, p0, v7

    .line 90
    .line 91
    aput-object v1, p0, v5

    .line 92
    .line 93
    invoke-static {p0}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    return-object p0

    .line 98
    :cond_0
    new-instance p0, Lh4/j;

    .line 99
    .line 100
    invoke-direct {p0}, Lh4/j;-><init>()V

    .line 101
    .line 102
    .line 103
    throw p0

    .line 104
    :cond_1
    new-instance v0, LN2/r$f$d;

    .line 105
    .line 106
    new-instance v1, Landroid/graphics/Rect;

    .line 107
    .line 108
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    iget v2, v2, Landroid/graphics/Rect;->right:I

    .line 113
    .line 114
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 119
    .line 120
    iget v4, p0, LN2/s;->n:I

    .line 121
    .line 122
    sub-int/2addr v3, v4

    .line 123
    invoke-direct {v1, v7, v7, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 124
    .line 125
    .line 126
    invoke-direct {v0, v1}, LN2/r$f$d;-><init>(Landroid/graphics/Rect;)V

    .line 127
    .line 128
    .line 129
    new-instance v1, LN2/r$f$a;

    .line 130
    .line 131
    new-instance v2, Landroid/graphics/Rect;

    .line 132
    .line 133
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 138
    .line 139
    iget v4, p0, LN2/s;->n:I

    .line 140
    .line 141
    sub-int/2addr v3, v4

    .line 142
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 147
    .line 148
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 153
    .line 154
    invoke-direct {v2, v7, v3, v4, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 155
    .line 156
    .line 157
    invoke-direct {v1, v2}, LN2/r$f$a;-><init>(Landroid/graphics/Rect;)V

    .line 158
    .line 159
    .line 160
    new-array p0, v6, [LN2/r$f;

    .line 161
    .line 162
    aput-object v0, p0, v7

    .line 163
    .line 164
    aput-object v1, p0, v5

    .line 165
    .line 166
    invoke-static {p0}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    return-object p0

    .line 171
    :cond_2
    new-instance v0, LN2/r$f$d;

    .line 172
    .line 173
    new-instance v1, Landroid/graphics/Rect;

    .line 174
    .line 175
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    iget v2, v2, Landroid/graphics/Rect;->right:I

    .line 180
    .line 181
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 186
    .line 187
    div-int/2addr v3, v6

    .line 188
    invoke-direct {v1, v7, v7, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 189
    .line 190
    .line 191
    invoke-direct {v0, v1}, LN2/r$f$d;-><init>(Landroid/graphics/Rect;)V

    .line 192
    .line 193
    .line 194
    new-instance v1, LN2/r$f$a;

    .line 195
    .line 196
    new-instance v2, Landroid/graphics/Rect;

    .line 197
    .line 198
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 199
    .line 200
    .line 201
    move-result-object v3

    .line 202
    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 203
    .line 204
    div-int/2addr v3, v6

    .line 205
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 206
    .line 207
    .line 208
    move-result-object v4

    .line 209
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 210
    .line 211
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 216
    .line 217
    invoke-direct {v2, v7, v3, v4, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 218
    .line 219
    .line 220
    invoke-direct {v1, v2}, LN2/r$f$a;-><init>(Landroid/graphics/Rect;)V

    .line 221
    .line 222
    .line 223
    new-array p0, v6, [LN2/r$f;

    .line 224
    .line 225
    aput-object v0, p0, v7

    .line 226
    .line 227
    aput-object v1, p0, v5

    .line 228
    .line 229
    invoke-static {p0}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    return-object p0

    .line 234
    :cond_3
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    return-object p0

    .line 239
    :cond_4
    iget-object v0, p0, LN2/s;->c:LN2/s$b;

    .line 240
    .line 241
    invoke-interface {v0}, LN2/s$b;->a()LN2/s$b$a;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    sget-object v1, LN2/s$c;->a:[I

    .line 246
    .line 247
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    aget v0, v1, v0

    .line 252
    .line 253
    if-eq v0, v5, :cond_8

    .line 254
    .line 255
    if-eq v0, v6, :cond_7

    .line 256
    .line 257
    if-eq v0, v4, :cond_7

    .line 258
    .line 259
    if-eq v0, v3, :cond_6

    .line 260
    .line 261
    if-ne v0, v2, :cond_5

    .line 262
    .line 263
    new-instance v0, LN2/r$f$b;

    .line 264
    .line 265
    new-instance v1, Landroid/graphics/Rect;

    .line 266
    .line 267
    iget v2, p0, LN2/s;->o:I

    .line 268
    .line 269
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 270
    .line 271
    .line 272
    move-result-object v3

    .line 273
    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 274
    .line 275
    invoke-direct {v1, v7, v7, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 276
    .line 277
    .line 278
    invoke-direct {v0, v1}, LN2/r$f$b;-><init>(Landroid/graphics/Rect;)V

    .line 279
    .line 280
    .line 281
    new-instance v1, LN2/r$f$c;

    .line 282
    .line 283
    new-instance v2, Landroid/graphics/Rect;

    .line 284
    .line 285
    iget v3, p0, LN2/s;->o:I

    .line 286
    .line 287
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 288
    .line 289
    .line 290
    move-result-object v4

    .line 291
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 292
    .line 293
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 294
    .line 295
    .line 296
    move-result-object p0

    .line 297
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 298
    .line 299
    invoke-direct {v2, v3, v7, v4, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 300
    .line 301
    .line 302
    invoke-direct {v1, v2}, LN2/r$f$c;-><init>(Landroid/graphics/Rect;)V

    .line 303
    .line 304
    .line 305
    new-array p0, v6, [LN2/r$f;

    .line 306
    .line 307
    aput-object v0, p0, v7

    .line 308
    .line 309
    aput-object v1, p0, v5

    .line 310
    .line 311
    invoke-static {p0}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    .line 312
    .line 313
    .line 314
    move-result-object p0

    .line 315
    return-object p0

    .line 316
    :cond_5
    new-instance p0, Lh4/j;

    .line 317
    .line 318
    invoke-direct {p0}, Lh4/j;-><init>()V

    .line 319
    .line 320
    .line 321
    throw p0

    .line 322
    :cond_6
    new-instance v0, LN2/r$f$b;

    .line 323
    .line 324
    new-instance v1, Landroid/graphics/Rect;

    .line 325
    .line 326
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 327
    .line 328
    .line 329
    move-result-object v2

    .line 330
    iget v2, v2, Landroid/graphics/Rect;->right:I

    .line 331
    .line 332
    iget v3, p0, LN2/s;->o:I

    .line 333
    .line 334
    sub-int/2addr v2, v3

    .line 335
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 336
    .line 337
    .line 338
    move-result-object v3

    .line 339
    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 340
    .line 341
    invoke-direct {v1, v7, v7, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 342
    .line 343
    .line 344
    invoke-direct {v0, v1}, LN2/r$f$b;-><init>(Landroid/graphics/Rect;)V

    .line 345
    .line 346
    .line 347
    new-instance v1, LN2/r$f$c;

    .line 348
    .line 349
    new-instance v2, Landroid/graphics/Rect;

    .line 350
    .line 351
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 352
    .line 353
    .line 354
    move-result-object v3

    .line 355
    iget v3, v3, Landroid/graphics/Rect;->right:I

    .line 356
    .line 357
    iget v4, p0, LN2/s;->o:I

    .line 358
    .line 359
    sub-int/2addr v3, v4

    .line 360
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 361
    .line 362
    .line 363
    move-result-object v4

    .line 364
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 365
    .line 366
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 367
    .line 368
    .line 369
    move-result-object p0

    .line 370
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 371
    .line 372
    invoke-direct {v2, v3, v7, v4, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 373
    .line 374
    .line 375
    invoke-direct {v1, v2}, LN2/r$f$c;-><init>(Landroid/graphics/Rect;)V

    .line 376
    .line 377
    .line 378
    new-array p0, v6, [LN2/r$f;

    .line 379
    .line 380
    aput-object v0, p0, v7

    .line 381
    .line 382
    aput-object v1, p0, v5

    .line 383
    .line 384
    invoke-static {p0}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    .line 385
    .line 386
    .line 387
    move-result-object p0

    .line 388
    return-object p0

    .line 389
    :cond_7
    new-instance v0, LN2/r$f$b;

    .line 390
    .line 391
    new-instance v1, Landroid/graphics/Rect;

    .line 392
    .line 393
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 394
    .line 395
    .line 396
    move-result-object v2

    .line 397
    iget v2, v2, Landroid/graphics/Rect;->right:I

    .line 398
    .line 399
    div-int/2addr v2, v6

    .line 400
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 401
    .line 402
    .line 403
    move-result-object v3

    .line 404
    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 405
    .line 406
    invoke-direct {v1, v7, v7, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 407
    .line 408
    .line 409
    invoke-direct {v0, v1}, LN2/r$f$b;-><init>(Landroid/graphics/Rect;)V

    .line 410
    .line 411
    .line 412
    new-instance v1, LN2/r$f$c;

    .line 413
    .line 414
    new-instance v2, Landroid/graphics/Rect;

    .line 415
    .line 416
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 417
    .line 418
    .line 419
    move-result-object v3

    .line 420
    iget v3, v3, Landroid/graphics/Rect;->right:I

    .line 421
    .line 422
    div-int/2addr v3, v6

    .line 423
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 424
    .line 425
    .line 426
    move-result-object v4

    .line 427
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 428
    .line 429
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 430
    .line 431
    .line 432
    move-result-object p0

    .line 433
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 434
    .line 435
    invoke-direct {v2, v3, v7, v4, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 436
    .line 437
    .line 438
    invoke-direct {v1, v2}, LN2/r$f$c;-><init>(Landroid/graphics/Rect;)V

    .line 439
    .line 440
    .line 441
    new-array p0, v6, [LN2/r$f;

    .line 442
    .line 443
    aput-object v0, p0, v7

    .line 444
    .line 445
    aput-object v1, p0, v5

    .line 446
    .line 447
    invoke-static {p0}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    .line 448
    .line 449
    .line 450
    move-result-object p0

    .line 451
    return-object p0

    .line 452
    :cond_8
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 453
    .line 454
    .line 455
    move-result-object p0

    .line 456
    return-object p0
.end method

.method private final h(I)I
    .locals 1

    .line 1
    int-to-float p1, p1

    .line 2
    iget-object p0, p0, LN2/s;->a:Landroid/content/Context;

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-static {v0, p1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    float-to-int p0, p0

    .line 18
    return p0
.end method

.method private final i()Landroid/graphics/Rect;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, LN2/s;->b:LN2/n;

    .line 11
    .line 12
    invoke-virtual {v1}, LN2/n;->c()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget v1, p0, LN2/s;->w:I

    .line 19
    .line 20
    iget p0, p0, LN2/s;->v:I

    .line 21
    .line 22
    invoke-virtual {v0, v1, p0}, Landroid/graphics/Rect;->inset(II)V

    .line 23
    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_0
    iget v1, p0, LN2/s;->v:I

    .line 27
    .line 28
    iget p0, p0, LN2/s;->w:I

    .line 29
    .line 30
    invoke-virtual {v0, v1, p0}, Landroid/graphics/Rect;->inset(II)V

    .line 31
    .line 32
    .line 33
    return-object v0
.end method

.method private final j()Landroid/graphics/Rect;
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    iget v1, p0, LN2/s;->A:I

    .line 4
    .line 5
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 10
    .line 11
    iget v3, p0, LN2/s;->z:I

    .line 12
    .line 13
    sub-int/2addr v2, v3

    .line 14
    iget v3, p0, LN2/s;->y:I

    .line 15
    .line 16
    sub-int/2addr v2, v3

    .line 17
    iget v3, p0, LN2/s;->x:I

    .line 18
    .line 19
    iget v4, p0, LN2/s;->A:I

    .line 20
    .line 21
    add-int/2addr v3, v4

    .line 22
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    .line 27
    .line 28
    iget p0, p0, LN2/s;->z:I

    .line 29
    .line 30
    sub-int/2addr v4, p0

    .line 31
    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method private final k()Landroid/graphics/Rect;
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 8
    .line 9
    iget v2, p0, LN2/s;->A:I

    .line 10
    .line 11
    sub-int/2addr v1, v2

    .line 12
    iget v2, p0, LN2/s;->x:I

    .line 13
    .line 14
    sub-int/2addr v1, v2

    .line 15
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 20
    .line 21
    iget v3, p0, LN2/s;->z:I

    .line 22
    .line 23
    sub-int/2addr v2, v3

    .line 24
    iget v3, p0, LN2/s;->y:I

    .line 25
    .line 26
    sub-int/2addr v2, v3

    .line 27
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    iget v3, v3, Landroid/graphics/Rect;->right:I

    .line 32
    .line 33
    iget v4, p0, LN2/s;->A:I

    .line 34
    .line 35
    sub-int/2addr v3, v4

    .line 36
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    .line 41
    .line 42
    iget p0, p0, LN2/s;->z:I

    .line 43
    .line 44
    sub-int/2addr v4, p0

    .line 45
    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method

.method private final l()Landroid/graphics/Rect;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {p0}, LN2/s;->m()Landroid/graphics/Rect;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 8
    .line 9
    .line 10
    iget p0, p0, LN2/s;->u:I

    .line 11
    .line 12
    invoke-virtual {v0, p0, p0}, Landroid/graphics/Rect;->inset(II)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method private final m()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, LN2/s;->b:LN2/n;

    .line 2
    .line 3
    invoke-virtual {p0}, LN2/n;->b()Landroid/graphics/Rect;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private final o()Z
    .locals 1

    .line 1
    iget-object v0, p0, LN2/s;->b:LN2/n;

    .line 2
    .line 3
    invoke-virtual {v0}, LN2/n;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, LN2/s;->d:LN2/s$a;

    .line 10
    .line 11
    invoke-interface {p0}, LN2/s$a;->a()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method


# virtual methods
.method public final f(LN2/t;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LN2/t;",
            ")",
            "Ljava/util/List<",
            "LN2/r;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "draggedObject"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    instance-of v1, p1, LN2/t$b;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-direct {p0}, LN2/s;->d()LN2/r;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, LN2/s;->b()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {v0, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    return-object v0

    .line 30
    :cond_0
    instance-of p1, p1, LN2/t$a;

    .line 31
    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    invoke-direct {p0}, LN2/s;->d()LN2/r;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    invoke-direct {p0}, LN2/s;->a()Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 46
    .line 47
    .line 48
    invoke-direct {p0}, LN2/s;->e()LN2/r;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    invoke-direct {p0}, LN2/s;->o()Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_1

    .line 60
    .line 61
    invoke-direct {p0}, LN2/s;->c()LN2/r;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    :cond_1
    invoke-direct {p0}, LN2/s;->g()Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-interface {v0, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 73
    .line 74
    .line 75
    return-object v0

    .line 76
    :cond_2
    new-instance p0, Lh4/j;

    .line 77
    .line 78
    invoke-direct {p0}, Lh4/j;-><init>()V

    .line 79
    .line 80
    .line 81
    throw p0
.end method

.method public final n()V
    .locals 4

    .line 1
    iget-object v0, p0, LN2/s;->b:LN2/n;

    .line 2
    .line 3
    invoke-virtual {v0}, LN2/n;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x8c

    .line 8
    .line 9
    const/16 v2, 0xc8

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, v1}, LN2/s;->h(I)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-direct {p0, v2}, LN2/s;->h(I)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    :goto_0
    iput v0, p0, LN2/s;->e:I

    .line 23
    .line 24
    invoke-direct {p0, v2}, LN2/s;->h(I)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, LN2/s;->f:I

    .line 29
    .line 30
    invoke-direct {p0, v1}, LN2/s;->h(I)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, LN2/s;->g:I

    .line 35
    .line 36
    const/16 v0, 0x200

    .line 37
    .line 38
    invoke-direct {p0, v0}, LN2/s;->h(I)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, LN2/s;->h:I

    .line 43
    .line 44
    const/16 v0, 0x2c

    .line 45
    .line 46
    invoke-direct {p0, v0}, LN2/s;->h(I)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput v0, p0, LN2/s;->i:I

    .line 51
    .line 52
    const/16 v0, 0x370

    .line 53
    .line 54
    invoke-direct {p0, v0}, LN2/s;->h(I)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput v0, p0, LN2/s;->j:I

    .line 59
    .line 60
    const/16 v0, 0x12c

    .line 61
    .line 62
    invoke-direct {p0, v0}, LN2/s;->h(I)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iput v0, p0, LN2/s;->k:I

    .line 67
    .line 68
    invoke-direct {p0, v2}, LN2/s;->h(I)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iput v0, p0, LN2/s;->l:I

    .line 73
    .line 74
    const/16 v0, 0x15e

    .line 75
    .line 76
    invoke-direct {p0, v0}, LN2/s;->h(I)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iput v0, p0, LN2/s;->m:I

    .line 81
    .line 82
    const/16 v0, 0x64

    .line 83
    .line 84
    invoke-direct {p0, v0}, LN2/s;->h(I)I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    iput v1, p0, LN2/s;->n:I

    .line 89
    .line 90
    const/16 v1, 0x3c

    .line 91
    .line 92
    invoke-direct {p0, v1}, LN2/s;->h(I)I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    iput v3, p0, LN2/s;->o:I

    .line 97
    .line 98
    invoke-direct {p0, v1}, LN2/s;->h(I)I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    iput v1, p0, LN2/s;->p:I

    .line 103
    .line 104
    invoke-direct {p0, v2}, LN2/s;->h(I)I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    iput v1, p0, LN2/s;->q:I

    .line 109
    .line 110
    const/16 v1, 0x11d

    .line 111
    .line 112
    invoke-direct {p0, v1}, LN2/s;->h(I)I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    iput v1, p0, LN2/s;->r:I

    .line 117
    .line 118
    const/16 v1, 0x96

    .line 119
    .line 120
    invoke-direct {p0, v1}, LN2/s;->h(I)I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    iput v1, p0, LN2/s;->s:I

    .line 125
    .line 126
    invoke-direct {p0, v0}, LN2/s;->h(I)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    iput v1, p0, LN2/s;->t:I

    .line 131
    .line 132
    const/16 v1, 0x14

    .line 133
    .line 134
    invoke-direct {p0, v1}, LN2/s;->h(I)I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    iput v1, p0, LN2/s;->u:I

    .line 139
    .line 140
    invoke-direct {p0, v0}, LN2/s;->h(I)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    iput v0, p0, LN2/s;->v:I

    .line 145
    .line 146
    const/16 v0, 0x82

    .line 147
    .line 148
    invoke-direct {p0, v0}, LN2/s;->h(I)I

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    iput v0, p0, LN2/s;->w:I

    .line 153
    .line 154
    const/16 v0, 0x14a

    .line 155
    .line 156
    invoke-direct {p0, v0}, LN2/s;->h(I)I

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    iput v0, p0, LN2/s;->x:I

    .line 161
    .line 162
    const/16 v0, 0x242

    .line 163
    .line 164
    invoke-direct {p0, v0}, LN2/s;->h(I)I

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    iput v0, p0, LN2/s;->y:I

    .line 169
    .line 170
    const/16 v0, 0x6c

    .line 171
    .line 172
    invoke-direct {p0, v0}, LN2/s;->h(I)I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    iput v0, p0, LN2/s;->z:I

    .line 177
    .line 178
    const/16 v0, 0x18

    .line 179
    .line 180
    invoke-direct {p0, v0}, LN2/s;->h(I)I

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    iput v0, p0, LN2/s;->A:I

    .line 185
    .line 186
    return-void
.end method
