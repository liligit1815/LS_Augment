.class public Lz1/O;
.super Ljava/lang/Object;
.source "BaseLauncherBinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lz1/O$b;,
        Lz1/O$a;
    }
.end annotation


# instance fields
.field protected final a:Lcom/android/launcher3/util/p1;

.field private final b:Landroid/content/Context;

.field private final c:Lcom/android/launcher3/F1;

.field private final d:Lcom/android/launcher3/D3;

.field protected final e:Lz1/y0;

.field private final f:Lz1/m;

.field final g:[Lz1/y0$b;

.field private h:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/F1;Lcom/android/launcher3/D3;Lz1/y0;Lz1/m;[Lz1/y0$b;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 5
    .line 6
    iput-object v0, p0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 7
    .line 8
    iput-object p1, p0, Lz1/O;->b:Landroid/content/Context;

    .line 9
    .line 10
    iput-object p2, p0, Lz1/O;->c:Lcom/android/launcher3/F1;

    .line 11
    .line 12
    iput-object p3, p0, Lz1/O;->d:Lcom/android/launcher3/D3;

    .line 13
    .line 14
    iput-object p4, p0, Lz1/O;->e:Lz1/y0;

    .line 15
    .line 16
    iput-object p5, p0, Lz1/O;->f:Lz1/m;

    .line 17
    .line 18
    iput-object p6, p0, Lz1/O;->g:[Lz1/y0$b;

    .line 19
    .line 20
    return-void
.end method

.method private synthetic Q(Lcom/android/launcher3/D3$a;)V
    .locals 3

    .line 1
    iget v0, p0, Lz1/O;->h:I

    .line 2
    .line 3
    iget-object v1, p0, Lz1/O;->e:Lz1/y0;

    .line 4
    .line 5
    iget v1, v1, Lz1/y0;->f:I

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    const-string p0, "LauncherBinder"

    .line 10
    .line 11
    const-string p1, "Too many consecutive reloads, skipping obsolete data-bind"

    .line 12
    .line 13
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p0, p0, Lz1/O;->g:[Lz1/y0$b;

    .line 18
    .line 19
    array-length v0, p0

    .line 20
    const/4 v1, 0x0

    .line 21
    :goto_0
    if-ge v1, v0, :cond_1

    .line 22
    .line 23
    aget-object v2, p0, v1

    .line 24
    .line 25
    invoke-interface {p1, v2}, Lcom/android/launcher3/D3$a;->a(Lz1/y0$b;)V

    .line 26
    .line 27
    .line 28
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return-void
.end method

.method private synthetic R()V
    .locals 1

    .line 1
    sget-object v0, Lz1/t1;->f:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/O;->b:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lz1/t1;

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    invoke-virtual {p0, v0}, Lz1/t1;->C(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private S(Ljava/util/ArrayList;I)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/android/launcher3/model/data/y;",
            ">(",
            "Ljava/util/ArrayList<",
            "TT;>;I)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_3

    .line 8
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_3

    .line 27
    .line 28
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    move-object v4, v2

    .line 33
    check-cast v4, Lcom/android/launcher3/model/data/y;

    .line 34
    .line 35
    new-instance v2, Lcom/android/launcher3/util/E;

    .line 36
    .line 37
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    iget-object v5, v4, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 42
    .line 43
    invoke-direct {v2, v3, v5}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 44
    .line 45
    .line 46
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-nez v3, :cond_2

    .line 51
    .line 52
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    iget v2, v4, Lcom/android/launcher3/model/data/y;->container:I

    .line 56
    .line 57
    if-eq v2, p2, :cond_1

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    iget v6, v4, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 64
    .line 65
    iget v7, v4, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 66
    .line 67
    iget v8, v4, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 68
    .line 69
    move v5, p2

    .line 70
    invoke-virtual/range {v3 .. v8}, Lz1/J3;->T(Lcom/android/launcher3/model/data/y;IIII)V

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    move v5, p2

    .line 75
    goto :goto_1

    .line 76
    :cond_2
    move v5, p2

    .line 77
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    :goto_1
    move p2, v5

    .line 81
    goto :goto_0

    .line 82
    :cond_3
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    if-eqz p2, :cond_4

    .line 91
    .line 92
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    check-cast p2, Lcom/android/launcher3/model/data/y;

    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    const-string v1, "move items to special container"

    .line 103
    .line 104
    invoke-virtual {v0, p2, v1}, Lz1/J3;->B(Lcom/android/launcher3/model/data/y;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_4
    :goto_3
    return-void
.end method

.method private V(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/android/launcher3/model/data/y;",
            ">(",
            "Ljava/util/ArrayList<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "remove Extra HideFolder"

    .line 29
    .line 30
    invoke-virtual {v1, v0, v2}, Lz1/J3;->B(Lcom/android/launcher3/model/data/y;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    :goto_1
    return-void
.end method

.method public static synthetic a(Ljava/util/List;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lz1/y0$b;->w(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lz1/y0$c;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lz1/y0$b;->z(Lz1/y0$c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lz1/y0$b;->V()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/util/z0;IZLz1/y0$b;)V
    .locals 6

    .line 1
    new-instance v3, Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    invoke-direct {v3}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v3}, Lcom/android/launcher3/util/Y1;->c()V

    .line 7
    .line 8
    .line 9
    new-instance v2, Lcom/android/launcher3/util/Y1;

    .line 10
    .line 11
    invoke-direct {v2}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 12
    .line 13
    .line 14
    move-object v1, p0

    .line 15
    move v4, p1

    .line 16
    move v5, p2

    .line 17
    move-object v0, p3

    .line 18
    invoke-interface/range {v0 .. v5}, Lz1/y0$b;->D(Lcom/android/launcher3/util/z0;Lcom/android/launcher3/util/Y1;Lcom/android/launcher3/util/Y1;IZ)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic e(Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lz1/y0$b;->q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lz1/O;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lz1/O;->R()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lz1/y0$b;->J()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p0}, Lz1/y0$b;->O()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic h(Lcom/android/launcher3/util/x0;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lz1/y0$b;->f(Lcom/android/launcher3/util/x0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(I)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0, p0}, Lp1/f;->A(Lcom/android/launcher3/Hotseat;I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic j(Lz1/G4;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lz1/y0$b;->X(Lz1/G4;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lz1/y0$b;->C()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(IILcom/android/launcher3/model/data/y;Lcom/android/launcher3/model/data/y;)I
    .locals 2

    .line 1
    iget v0, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 2
    .line 3
    iget v1, p3, Lcom/android/launcher3/model/data/y;->container:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_2

    .line 6
    .line 7
    const/16 v1, -0x65

    .line 8
    .line 9
    if-eq v0, v1, :cond_1

    .line 10
    .line 11
    const/16 v1, -0x64

    .line 12
    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_0
    iget v0, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 18
    .line 19
    mul-int/2addr v0, p0

    .line 20
    iget v1, p2, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 21
    .line 22
    mul-int/2addr v1, p1

    .line 23
    add-int/2addr v0, v1

    .line 24
    iget p2, p2, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 25
    .line 26
    add-int/2addr v0, p2

    .line 27
    iget p2, p3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 28
    .line 29
    mul-int/2addr p2, p0

    .line 30
    iget p0, p3, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 31
    .line 32
    mul-int/2addr p0, p1

    .line 33
    add-int/2addr p2, p0

    .line 34
    iget p0, p3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 35
    .line 36
    add-int/2addr p2, p0

    .line 37
    invoke-static {v0, p2}, Ljava/lang/Integer;->compare(II)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0

    .line 42
    :cond_1
    iget p0, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 43
    .line 44
    iget p1, p3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 45
    .line 46
    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0

    .line 51
    :cond_2
    invoke-static {v0, v1}, Ljava/lang/Integer;->compare(II)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0
.end method

.method public static synthetic m(Lcom/android/launcher3/model/data/y;Lz1/y0$b;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p1, p0, v0}, Lz1/y0$b;->L(Ljava/util/List;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic n([Lcom/android/launcher3/model/data/d;ILjava/util/Map;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p3, p0, p1, p2}, Lz1/y0$b;->i([Lcom/android/launcher3/model/data/d;ILjava/util/Map;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Ljava/util/HashMap;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lz1/y0$b;->K(Ljava/util/HashMap;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(Lz1/O;Lcom/android/launcher3/D3$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/O;->Q(Lcom/android/launcher3/D3$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Lcom/android/launcher3/model/data/d;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/d;->n:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic r(Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lz1/y0$b;->onLoaderTaskBindAllApplications()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s(Lcom/android/launcher3/util/z0;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lz1/y0$b;->h(Lcom/android/launcher3/util/z0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t(Lcom/android/launcher3/model/data/d;)Lcom/android/launcher3/util/L1;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/L1;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 10
    .line 11
    invoke-direct {v0, v1, p0}, Lcom/android/launcher3/util/L1;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static synthetic u(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic v(Ljava/util/ArrayList;IILz1/y0$b;)V
    .locals 0

    .line 1
    add-int/2addr p2, p1

    .line 2
    invoke-virtual {p0, p1, p2}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-interface {p3, p0, p1}, Lz1/y0$b;->L(Ljava/util/List;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method static bridge synthetic w(Lz1/O;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/O;->b:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic x(Lz1/O;)Lcom/android/launcher3/D3;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/O;->d:Lcom/android/launcher3/D3;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic y(Lz1/O;)I
    .locals 0

    .line 1
    iget p0, p0, Lz1/O;->h:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public A()V
    .locals 6

    .line 1
    iget-object v0, p0, Lz1/O;->f:Lz1/m;

    .line 2
    .line 3
    invoke-virtual {v0}, Lz1/m;->i()[Lcom/android/launcher3/model/data/d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lz1/O;->f:Lz1/m;

    .line 8
    .line 9
    invoke-virtual {v1}, Lz1/m;->p()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {v0}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    new-instance v3, Lz1/H;

    .line 18
    .line 19
    invoke-direct {v3}, Lz1/H;-><init>()V

    .line 20
    .line 21
    .line 22
    new-instance v4, Lz1/I;

    .line 23
    .line 24
    invoke-direct {v4}, Lz1/I;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v5, Lz1/J;

    .line 28
    .line 29
    invoke-direct {v5}, Lz1/J;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {v3, v4, v5}, Ljava/util/stream/Collectors;->toMap(Ljava/util/function/Function;Ljava/util/function/Function;Ljava/util/function/BinaryOperator;)Ljava/util/stream/Collector;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Ljava/util/Map;

    .line 41
    .line 42
    new-instance v3, Lz1/K;

    .line 43
    .line 44
    invoke-direct {v3, v0, v1, v2}, Lz1/K;-><init>([Lcom/android/launcher3/model/data/d;ILjava/util/Map;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 48
    .line 49
    invoke-virtual {p0, v3, v0}, Lz1/O;->L(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 50
    .line 51
    .line 52
    new-instance v0, Lz1/L;

    .line 53
    .line 54
    invoke-direct {v0}, Lz1/L;-><init>()V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 58
    .line 59
    invoke-virtual {p0, v0, v1}, Lz1/O;->L(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public B(Ljava/util/List;Ljava/util/concurrent/Executor;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;",
            "Ljava/util/concurrent/Executor;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_0

    .line 7
    .line 8
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 13
    .line 14
    new-instance v3, Lz1/v;

    .line 15
    .line 16
    invoke-direct {v3, v2}, Lz1/v;-><init>(Lcom/android/launcher3/model/data/y;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v3, p2}, Lz1/O;->L(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 20
    .line 21
    .line 22
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public C()V
    .locals 3

    .line 1
    iget-object v0, p0, Lz1/O;->e:Lz1/y0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    new-instance v1, Ljava/util/HashMap;

    .line 5
    .line 6
    iget-object v2, p0, Lz1/O;->e:Lz1/y0;

    .line 7
    .line 8
    iget-object v2, v2, Lz1/y0;->c:Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 11
    .line 12
    .line 13
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    new-instance v0, Lz1/G;

    .line 15
    .line 16
    invoke-direct {v0, v1}, Lz1/G;-><init>(Ljava/util/HashMap;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 20
    .line 21
    invoke-virtual {p0, v0, v1}, Lz1/O;->L(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    throw p0
.end method

.method public D(Lz1/y0$c;)V
    .locals 1

    .line 1
    new-instance v0, Lz1/F;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lz1/F;-><init>(Lz1/y0$c;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 7
    .line 8
    invoke-virtual {p0, v0, p1}, Lz1/O;->L(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public E()V
    .locals 2

    .line 1
    new-instance v0, Lz1/A;

    .line 2
    .line 3
    invoke-direct {v0}, Lz1/A;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Lz1/O;->L(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public F()V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/O;->e:Lz1/y0;

    .line 2
    .line 3
    iget-object v0, v0, Lz1/y0;->e:Lz1/G4;

    .line 4
    .line 5
    invoke-virtual {v0}, Lz1/G4;->c()Lz1/G4;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Lz1/s;

    .line 10
    .line 11
    invoke-direct {v1, v0}, Lz1/s;-><init>(Lz1/G4;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 15
    .line 16
    invoke-virtual {p0, v1, v0}, Lz1/O;->L(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public G()V
    .locals 2

    .line 1
    new-instance v0, Lm2/c;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/O;->b:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lm2/c;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lz1/O;->e:Lz1/y0;

    .line 9
    .line 10
    iget-object v1, v1, Lz1/y0;->d:Lz1/u5;

    .line 11
    .line 12
    invoke-virtual {v1}, Lz1/u5;->m()Ljava/util/Map;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lm2/c;->b(Ljava/util/Map;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Lz1/r;

    .line 21
    .line 22
    invoke-direct {v1, v0}, Lz1/r;-><init>(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 26
    .line 27
    invoke-virtual {p0, v1, v0}, Lz1/O;->L(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public H(ZZ)V
    .locals 9

    .line 1
    const-string v0, "BaseLauncherBinder#bindWorkspace"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    new-instance v6, Lcom/android/launcher3/util/x0;

    .line 7
    .line 8
    invoke-direct {v6}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v5, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lz1/O;->e:Lz1/y0;

    .line 17
    .line 18
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 19
    :try_start_1
    iget-object v0, p0, Lz1/O;->e:Lz1/y0;

    .line 20
    .line 21
    iget-object v0, v0, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/util/A0;->m()Lcom/android/launcher3/util/A0;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    iget-object v0, p0, Lz1/O;->e:Lz1/y0;

    .line 28
    .line 29
    invoke-virtual {v0}, Lz1/y0;->m()Lcom/android/launcher3/util/x0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v6, v0}, Lcom/android/launcher3/util/x0;->o(Lcom/android/launcher3/util/x0;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lz1/O;->e:Lz1/y0;

    .line 37
    .line 38
    iget-object v0, v0, Lz1/y0;->b:Lcom/android/launcher3/util/A0;

    .line 39
    .line 40
    new-instance v2, Lz1/C;

    .line 41
    .line 42
    invoke-direct {v2, v5}, Lz1/C;-><init>(Ljava/util/ArrayList;)V

    .line 43
    .line 44
    .line 45
    invoke-interface {v0, v2}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    .line 46
    .line 47
    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    iget-object p1, p0, Lz1/O;->e:Lz1/y0;

    .line 51
    .line 52
    iget v0, p1, Lz1/y0;->f:I

    .line 53
    .line 54
    add-int/lit8 v0, v0, 0x1

    .line 55
    .line 56
    iput v0, p1, Lz1/y0;->f:I

    .line 57
    .line 58
    iget-object v0, p0, Lz1/O;->d:Lcom/android/launcher3/D3;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->l0()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iput v0, p1, Lz1/y0;->g:I

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :catchall_0
    move-exception v0

    .line 68
    move-object p0, v0

    .line 69
    goto :goto_2

    .line 70
    :cond_0
    :goto_0
    iget-object p1, p0, Lz1/O;->e:Lz1/y0;

    .line 71
    .line 72
    iget v0, p1, Lz1/y0;->f:I

    .line 73
    .line 74
    iput v0, p0, Lz1/O;->h:I

    .line 75
    .line 76
    iget-object p1, p1, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 83
    :try_start_2
    iget-object v0, p0, Lz1/O;->g:[Lz1/y0$b;

    .line 84
    .line 85
    array-length v7, v0

    .line 86
    const/4 v1, 0x0

    .line 87
    move v8, v1

    .line 88
    :goto_1
    if-ge v8, v7, :cond_1

    .line 89
    .line 90
    aget-object v3, v0, v8

    .line 91
    .line 92
    new-instance v1, Lz1/O$b;

    .line 93
    .line 94
    move-object v2, p0

    .line 95
    invoke-direct/range {v1 .. v6}, Lz1/O$b;-><init>(Lz1/O;Lz1/y0$b;Lcom/android/launcher3/util/A0;Ljava/util/ArrayList;Lcom/android/launcher3/util/x0;)V

    .line 96
    .line 97
    .line 98
    invoke-static {v1, p2, p1}, Lz1/O$b;->q(Lz1/O$b;ZI)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 99
    .line 100
    .line 101
    add-int/lit8 v8, v8, 0x1

    .line 102
    .line 103
    move-object p0, v2

    .line 104
    goto :goto_1

    .line 105
    :cond_1
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :goto_2
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 110
    :try_start_4
    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 111
    :catchall_1
    move-exception v0

    .line 112
    move-object p0, v0

    .line 113
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 114
    .line 115
    .line 116
    throw p0
.end method

.method public I(Ljava/util/ArrayList;Ljava/util/concurrent/Executor;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;",
            "Ljava/util/concurrent/Executor;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_1

    .line 7
    .line 8
    add-int/lit8 v2, v1, 0x6

    .line 9
    .line 10
    if-gt v2, v0, :cond_0

    .line 11
    .line 12
    const/4 v3, 0x6

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    sub-int v3, v0, v1

    .line 15
    .line 16
    :goto_1
    new-instance v4, Lz1/z;

    .line 17
    .line 18
    invoke-direct {v4, p1, v1, v3}, Lz1/z;-><init>(Ljava/util/ArrayList;II)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v4, p2}, Lz1/O;->L(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 22
    .line 23
    .line 24
    move v1, v2

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return-void
.end method

.method J(Lcom/android/launcher3/util/x0;)V
    .locals 1

    .line 1
    new-instance v0, Lz1/u;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lz1/u;-><init>(Lcom/android/launcher3/util/x0;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 7
    .line 8
    invoke-virtual {p0, v0, p1}, Lz1/O;->L(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method K()V
    .locals 2

    .line 1
    new-instance v0, Lz1/w;

    .line 2
    .line 3
    invoke-direct {v0}, Lz1/w;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Lz1/O;->L(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected L(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V
    .locals 1

    .line 1
    new-instance v0, Lz1/M;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lz1/M;-><init>(Lz1/O;Lcom/android/launcher3/D3$a;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method M(Lcom/android/launcher3/util/A0;Ljava/util/ArrayList;)Lcom/android/launcher3/model/data/y;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/android/launcher3/model/data/y;",
            ">(",
            "Lcom/android/launcher3/util/A0;",
            "Ljava/util/ArrayList<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 16
    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    new-instance v1, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    new-instance v2, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    :cond_2
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_3

    .line 47
    .line 48
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 53
    .line 54
    if-eqz v3, :cond_2

    .line 55
    .line 56
    iget v4, v3, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 57
    .line 58
    const/4 v5, 0x2

    .line 59
    if-ne v4, v5, :cond_2

    .line 60
    .line 61
    move-object v4, v3

    .line 62
    check-cast v4, Lcom/android/launcher3/model/data/p;

    .line 63
    .line 64
    const/16 v5, 0x8

    .line 65
    .line 66
    invoke-virtual {v4, v5}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-eqz v4, :cond_2

    .line 71
    .line 72
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    iget v3, v3, Lcom/android/launcher3/model/data/y;->id:I

    .line 76
    .line 77
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 86
    .line 87
    .line 88
    move-result p2

    .line 89
    const-string v3, "LauncherBinder"

    .line 90
    .line 91
    if-nez p2, :cond_4

    .line 92
    .line 93
    const-string p0, "filterCurrentHideItems: no hide folder exist"

    .line 94
    .line 95
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    const/4 p0, 0x0

    .line 99
    return-object p0

    .line 100
    :cond_4
    new-instance p2, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    :cond_5
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 110
    .line 111
    .line 112
    move-result v4

    .line 113
    const/4 v5, 0x1

    .line 114
    if-eqz v4, :cond_7

    .line 115
    .line 116
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    if-eqz v4, :cond_5

    .line 121
    .line 122
    check-cast v4, Lcom/android/launcher3/model/data/y;

    .line 123
    .line 124
    iget v6, v4, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 125
    .line 126
    if-eqz v6, :cond_6

    .line 127
    .line 128
    if-eq v6, v5, :cond_6

    .line 129
    .line 130
    const/4 v5, 0x6

    .line 131
    if-ne v6, v5, :cond_5

    .line 132
    .line 133
    :cond_6
    iget v5, v4, Lcom/android/launcher3/model/data/y;->container:I

    .line 134
    .line 135
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 136
    .line 137
    .line 138
    move-result-object v5

    .line 139
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v5

    .line 143
    if-eqz v5, :cond_5

    .line 144
    .line 145
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    iget-object v4, v4, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 149
    .line 150
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v4, ","

    .line 154
    .line 155
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    goto :goto_2

    .line 159
    :cond_7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 162
    .line 163
    .line 164
    const-string v1, "filterCurrentHideItems: hide item: "

    .line 165
    .line 166
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    .line 178
    .line 179
    const/4 p1, 0x0

    .line 180
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    check-cast p2, Lcom/android/launcher3/model/data/y;

    .line 185
    .line 186
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    if-le v1, v5, :cond_8

    .line 191
    .line 192
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    :cond_8
    iget p1, p2, Lcom/android/launcher3/model/data/y;->id:I

    .line 196
    .line 197
    invoke-direct {p0, v2, p1}, Lz1/O;->S(Ljava/util/ArrayList;I)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 201
    .line 202
    .line 203
    move-result p1

    .line 204
    if-le p1, v5, :cond_9

    .line 205
    .line 206
    invoke-direct {p0, v0}, Lz1/O;->V(Ljava/util/ArrayList;)V

    .line 207
    .line 208
    .line 209
    :cond_9
    return-object p2
.end method

.method public N(Ljava/util/concurrent/Executor;)V
    .locals 1

    .line 1
    new-instance v0, Lz1/B;

    .line 2
    .line 3
    invoke-direct {v0}, Lz1/B;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0, p1}, Lz1/O;->L(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method O(Lcom/android/launcher3/util/z0;)V
    .locals 1

    .line 1
    new-instance v0, Lz1/x;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lz1/x;-><init>(Lcom/android/launcher3/util/z0;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 7
    .line 8
    invoke-virtual {p0, v0, p1}, Lz1/O;->L(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method P()I
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lx1/Z;->d()Landroid/util/Pair;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p0, Ljava/lang/Integer;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public T(Ljava/lang/Object;)Lcom/android/launcher3/util/q1;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/q1;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/android/launcher3/util/p1;->g()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, p1, v1}, Lcom/android/launcher3/util/q1;-><init>(Ljava/lang/Object;Landroid/os/Looper;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/util/p1;->g()Landroid/os/Looper;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Landroid/os/Looper;->getQueue()Landroid/os/MessageQueue;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Landroid/os/MessageQueue;->isIdle()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/util/q1;->queueIdle()Z

    .line 29
    .line 30
    .line 31
    :cond_0
    return-object v0
.end method

.method public U(Lcom/android/launcher3/util/z0;IZ)V
    .locals 1

    .line 1
    new-instance v0, Lz1/t;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3}, Lz1/t;-><init>(Lcom/android/launcher3/util/z0;IZ)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 7
    .line 8
    invoke-virtual {p0, v0, p1}, Lz1/O;->L(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method W(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v0, Lz1/y;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Lz1/y;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public X()V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lz1/D;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lz1/D;-><init>(Lz1/O;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public Y(I)V
    .locals 0

    .line 1
    iput p1, p0, Lz1/O;->h:I

    .line 2
    .line 3
    return-void
.end method

.method protected Z(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lz1/O;->c:Lcom/android/launcher3/F1;

    .line 2
    .line 3
    iget v0, p0, Lcom/android/launcher3/F1;->H0:I

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/F1;->G0:I

    .line 6
    .line 7
    mul-int/2addr p0, v0

    .line 8
    new-instance v1, Lz1/E;

    .line 9
    .line 10
    invoke-direct {v1, p0, v0}, Lz1/E;-><init>(II)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public z()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->t()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Lz1/N;

    .line 9
    .line 10
    invoke-direct {v0}, Lz1/N;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Lz1/O;->L(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
