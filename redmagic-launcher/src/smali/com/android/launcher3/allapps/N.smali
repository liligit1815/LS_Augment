.class public Lcom/android/launcher3/allapps/N;
.super Ljava/lang/Object;
.source "AppInfoComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/android/launcher3/model/data/d;",
        ">;"
    }
.end annotation


# instance fields
.field private final g:LD1/t;

.field private final h:Landroid/os/UserHandle;

.field private final i:Lcom/android/launcher3/util/T0;

.field private j:LR0/m;

.field private k:Landroid/content/Context;

.field private l:Lcom/android/launcher3/resource/g;

.field private m:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/android/launcher3/allapps/N;->m:I

    .line 6
    .line 7
    sget-object v0, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, LD1/t;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/android/launcher3/allapps/N;->g:LD1/t;

    .line 16
    .line 17
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/android/launcher3/allapps/N;->h:Landroid/os/UserHandle;

    .line 22
    .line 23
    new-instance v0, Lcom/android/launcher3/util/T0;

    .line 24
    .line 25
    invoke-direct {v0}, Lcom/android/launcher3/util/T0;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/android/launcher3/allapps/N;->i:Lcom/android/launcher3/util/T0;

    .line 29
    .line 30
    iput-object p1, p0, Lcom/android/launcher3/allapps/N;->k:Landroid/content/Context;

    .line 31
    .line 32
    invoke-static {}, LR0/m;->a()LR0/m;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Lcom/android/launcher3/allapps/N;->j:LR0/m;

    .line 37
    .line 38
    invoke-static {}, Lcom/android/launcher3/resource/g;->l()Lcom/android/launcher3/resource/g;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/android/launcher3/allapps/N;->l:Lcom/android/launcher3/resource/g;

    .line 43
    .line 44
    return-void
.end method

.method private c(Lcom/android/launcher3/model/data/d;Lcom/android/launcher3/model/data/d;)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/N;->l:Lcom/android/launcher3/resource/g;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/d;->S()Lcom/android/launcher3/util/E;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/resource/g;->j(Lcom/android/launcher3/util/E;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/allapps/N;->l:Lcom/android/launcher3/resource/g;

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/d;->S()Lcom/android/launcher3/util/E;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Lcom/android/launcher3/resource/g;->j(Lcom/android/launcher3/util/E;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-le v0, v1, :cond_0

    .line 22
    .line 23
    const/4 p0, -0x1

    .line 24
    return p0

    .line 25
    :cond_0
    if-ge v0, v1, :cond_1

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/allapps/N;->e(Lcom/android/launcher3/model/data/d;Lcom/android/launcher3/model/data/d;)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0
.end method

.method private d(Lcom/android/launcher3/model/data/d;Lcom/android/launcher3/model/data/d;)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/N;->l:Lcom/android/launcher3/resource/g;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/d;->S()Lcom/android/launcher3/util/E;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/resource/g;->k(Lcom/android/launcher3/util/E;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iget-object v2, p0, Lcom/android/launcher3/allapps/N;->l:Lcom/android/launcher3/resource/g;

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/d;->S()Lcom/android/launcher3/util/E;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v2, v3}, Lcom/android/launcher3/resource/g;->k(Lcom/android/launcher3/util/E;)J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    cmp-long v0, v0, v2

    .line 22
    .line 23
    if-lez v0, :cond_0

    .line 24
    .line 25
    const/4 p0, -0x1

    .line 26
    return p0

    .line 27
    :cond_0
    if-gez v0, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/allapps/N;->e(Lcom/android/launcher3/model/data/d;Lcom/android/launcher3/model/data/d;)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method

.method private e(Lcom/android/launcher3/model/data/d;Lcom/android/launcher3/model/data/d;)I
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    move-object v0, v1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :goto_0
    iget-object v2, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 14
    .line 15
    if-nez v2, :cond_1

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_1
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    :goto_1
    sget-object v2, Lx1/g;->a:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {}, Lx1/g;->a()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-nez v2, :cond_2

    .line 33
    .line 34
    sget-object v2, Lx1/g;->c:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {}, Lx1/g;->a()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_4

    .line 45
    .line 46
    :cond_2
    invoke-static {v0}, Lx1/O;->e5(Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_3

    .line 51
    .line 52
    iget-object v0, p1, Lcom/android/launcher3/model/data/y;->pinyinFull:Ljava/lang/String;

    .line 53
    .line 54
    :cond_3
    invoke-static {v1}, Lx1/O;->e5(Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_4

    .line 59
    .line 60
    iget-object v1, p2, Lcom/android/launcher3/model/data/y;->pinyinFull:Ljava/lang/String;

    .line 61
    .line 62
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/allapps/N;->i:Lcom/android/launcher3/util/T0;

    .line 63
    .line 64
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/util/T0;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    return p0
.end method


# virtual methods
.method public a(Lcom/android/launcher3/model/data/d;Lcom/android/launcher3/model/data/d;)I
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->X0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, -0x1

    .line 10
    if-eqz v0, :cond_4

    .line 11
    .line 12
    iget v0, p0, Lcom/android/launcher3/allapps/N;->m:I

    .line 13
    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/allapps/N;->j:LR0/m;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/android/launcher3/allapps/N;->k:Landroid/content/Context;

    .line 19
    .line 20
    invoke-virtual {v0, v2}, LR0/m;->b(Landroid/content/Context;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    :cond_0
    if-eqz v0, :cond_3

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    if-eq v0, v2, :cond_2

    .line 28
    .line 29
    const/4 v2, 0x2

    .line 30
    if-eq v0, v2, :cond_1

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/allapps/N;->c(Lcom/android/launcher3/model/data/d;Lcom/android/launcher3/model/data/d;)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    goto :goto_0

    .line 39
    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/allapps/N;->d(Lcom/android/launcher3/model/data/d;Lcom/android/launcher3/model/data/d;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    goto :goto_0

    .line 44
    :cond_3
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/allapps/N;->e(Lcom/android/launcher3/model/data/d;Lcom/android/launcher3/model/data/d;)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    goto :goto_0

    .line 49
    :cond_4
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/allapps/N;->e(Lcom/android/launcher3/model/data/d;Lcom/android/launcher3/model/data/d;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    :goto_0
    if-eqz v0, :cond_5

    .line 54
    .line 55
    return v0

    .line 56
    :cond_5
    iget-object v0, p1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 57
    .line 58
    iget-object v2, p2, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 59
    .line 60
    invoke-virtual {v0, v2}, Landroid/content/ComponentName;->compareTo(Landroid/content/ComponentName;)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_6

    .line 65
    .line 66
    return v0

    .line 67
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/allapps/N;->h:Landroid/os/UserHandle;

    .line 68
    .line 69
    iget-object v2, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 70
    .line 71
    invoke-virtual {v0, v2}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_7

    .line 76
    .line 77
    return v1

    .line 78
    :cond_7
    iget-object v0, p0, Lcom/android/launcher3/allapps/N;->g:LD1/t;

    .line 79
    .line 80
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 81
    .line 82
    invoke-virtual {v0, p1}, LD1/t;->m(Landroid/os/UserHandle;)J

    .line 83
    .line 84
    .line 85
    move-result-wide v0

    .line 86
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iget-object p0, p0, Lcom/android/launcher3/allapps/N;->g:LD1/t;

    .line 91
    .line 92
    iget-object p2, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 93
    .line 94
    invoke-virtual {p0, p2}, LD1/t;->m(Landroid/os/UserHandle;)J

    .line 95
    .line 96
    .line 97
    move-result-wide v0

    .line 98
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p1, p0}, Ljava/lang/Long;->compareTo(Ljava/lang/Long;)I

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    return p0
.end method

.method public b(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/allapps/N;->m:I

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/model/data/d;

    .line 2
    .line 3
    check-cast p2, Lcom/android/launcher3/model/data/d;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/allapps/N;->a(Lcom/android/launcher3/model/data/d;Lcom/android/launcher3/model/data/d;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
