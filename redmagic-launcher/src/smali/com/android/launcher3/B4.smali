.class public final Lcom/android/launcher3/B4;
.super Ljava/lang/Object;
.source "ModelCallbacks.kt"

# interfaces
.implements Lz1/y0$b;


# instance fields
.field private g:Lcom/android/launcher3/C2;

.field private h:Lcom/android/launcher3/util/z0;

.field private i:Lcom/android/launcher3/util/z0;

.field private j:Z

.field private k:Lz1/G4;

.field private l:Lcom/android/launcher3/util/Y2;

.field private m:Z


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    const-string v0, "launcher"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    new-instance p1, Lcom/android/launcher3/util/z0;

    .line 12
    .line 13
    invoke-direct {p1}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/launcher3/B4;->h:Lcom/android/launcher3/util/z0;

    .line 17
    .line 18
    new-instance p1, Lcom/android/launcher3/util/z0;

    .line 19
    .line 20
    invoke-direct {p1}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/android/launcher3/B4;->i:Lcom/android/launcher3/util/z0;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    iput-boolean p1, p0, Lcom/android/launcher3/B4;->j:Z

    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    iput-boolean p1, p0, Lcom/android/launcher3/B4;->m:Z

    .line 30
    .line 31
    return-void
.end method

.method private static final F(Lcom/android/launcher3/B4;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/D;->i(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private static final G(Lcom/android/launcher3/B4;Lcom/android/launcher3/util/Y2;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/B4;->l:Lcom/android/launcher3/util/Y2;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-object p1, p0, Lcom/android/launcher3/B4;->l:Lcom/android/launcher3/util/Y2;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private static final M(Lcom/android/launcher3/a;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/a;->close(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/B4;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/B4;->F(Lcom/android/launcher3/B4;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/B4;Lcom/android/launcher3/util/Y2;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/B4;->G(Lcom/android/launcher3/B4;Lcom/android/launcher3/util/Y2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/launcher3/a;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/B4;->M(Lcom/android/launcher3/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Lcom/android/launcher3/B4;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/B4;->u(Lcom/android/launcher3/B4;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final o(Lcom/android/launcher3/util/x0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->K0:Z

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    sget-object v0, Lf1/a;->c:Lf1/a$a;

    .line 12
    .line 13
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-direct {p0, p1}, Lcom/android/launcher3/B4;->s(Lcom/android/launcher3/util/x0;)Lcom/android/launcher3/util/x0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    invoke-static {p1}, Lcom/android/launcher3/util/z0;->wrap(Lcom/android/launcher3/util/x0;)Lcom/android/launcher3/util/z0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Ljava/lang/Number;

    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    iget-object v2, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 49
    .line 50
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v2, v1}, Lcom/android/launcher3/Workspace;->k1(I)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/util/z0;->getArray()Lcom/android/launcher3/util/x0;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    :cond_2
    :goto_1
    new-instance v0, Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_5

    .line 80
    .line 81
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    move-object v2, v1

    .line 86
    check-cast v2, Ljava/lang/Integer;

    .line 87
    .line 88
    iget-boolean v3, p0, Lcom/android/launcher3/B4;->j:Z

    .line 89
    .line 90
    if-eqz v3, :cond_4

    .line 91
    .line 92
    sget-boolean v3, Lcom/android/launcher3/N5;->j:Z

    .line 93
    .line 94
    if-nez v3, :cond_4

    .line 95
    .line 96
    if-nez v2, :cond_3

    .line 97
    .line 98
    goto :goto_3

    .line 99
    :cond_3
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-nez v2, :cond_4

    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_4
    :goto_3
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_5
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_6

    .line 119
    .line 120
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Ljava/lang/Integer;

    .line 125
    .line 126
    iget-object v1, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 127
    .line 128
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    invoke-virtual {v1, v0}, Lcom/android/launcher3/Workspace;->x1(I)V

    .line 140
    .line 141
    .line 142
    goto :goto_4

    .line 143
    :cond_6
    return-void
.end method

.method private final s(Lcom/android/launcher3/util/x0;)Lcom/android/launcher3/util/x0;
    .locals 5

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/util/z0;->wrap(Lcom/android/launcher3/util/x0;)Lcom/android/launcher3/util/z0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const/4 v3, 0x1

    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    move-object v4, v2

    .line 26
    check-cast v4, Ljava/lang/Integer;

    .line 27
    .line 28
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    rem-int/lit8 v4, v4, 0x2

    .line 33
    .line 34
    if-ne v4, v3, :cond_0

    .line 35
    .line 36
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    :cond_2
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_3

    .line 49
    .line 50
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Ljava/lang/Integer;

    .line 55
    .line 56
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/z0;->remove(I)V

    .line 64
    .line 65
    .line 66
    iget-object v2, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 67
    .line 68
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    sub-int/2addr v4, v3

    .line 77
    invoke-virtual {v2, v4}, Lcom/android/launcher3/Workspace;->P0(I)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-nez v2, :cond_2

    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    sub-int/2addr v1, v3

    .line 88
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_3
    invoke-virtual {v0}, Lcom/android/launcher3/util/z0;->getArray()Lcom/android/launcher3/util/x0;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    const-string p1, "getArray(...)"

    .line 97
    .line 98
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-object p0
.end method

.method private static final u(Lcom/android/launcher3/B4;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getViewCache()Lcom/android/launcher3/util/X2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const v1, 0x7f0e00dc

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/X2;->a(I)Lcom/android/launcher3/util/X2$a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const v2, 0x7f0b013c

    .line 15
    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    const/4 v4, 0x0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/util/X2$a;->a()I

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    if-nez v5, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/util/X2$a;->b()I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    move v6, v4

    .line 32
    :goto_0
    if-ge v6, v5, :cond_0

    .line 33
    .line 34
    iget-object v7, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 35
    .line 36
    invoke-static {v7}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 37
    .line 38
    .line 39
    move-result-object v7

    .line 40
    invoke-virtual {v7, v1, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v7

    .line 44
    invoke-virtual {v7, v2, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    iget-object v8, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 48
    .line 49
    invoke-virtual {v8}, Lcom/android/launcher3/v;->getViewCache()Lcom/android/launcher3/util/X2;

    .line 50
    .line 51
    .line 52
    move-result-object v8

    .line 53
    invoke-virtual {v8, v1, v7}, Lcom/android/launcher3/util/X2;->c(ILandroid/view/View;)V

    .line 54
    .line 55
    .line 56
    add-int/lit8 v6, v6, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getViewCache()Lcom/android/launcher3/util/X2;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const v1, 0x7f0e00e1

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/X2;->a(I)Lcom/android/launcher3/util/X2$a;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/android/launcher3/util/X2$a;->a()I

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    if-nez v5, :cond_1

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/android/launcher3/util/X2$a;->b()I

    .line 81
    .line 82
    .line 83
    move-result v5

    .line 84
    move v6, v4

    .line 85
    :goto_1
    if-ge v6, v5, :cond_1

    .line 86
    .line 87
    iget-object v7, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 88
    .line 89
    invoke-static {v7}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 90
    .line 91
    .line 92
    move-result-object v7

    .line 93
    invoke-virtual {v7, v1, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v7

    .line 97
    invoke-virtual {v7, v2, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    iget-object v8, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 101
    .line 102
    invoke-virtual {v8}, Lcom/android/launcher3/v;->getViewCache()Lcom/android/launcher3/util/X2;

    .line 103
    .line 104
    .line 105
    move-result-object v8

    .line 106
    invoke-virtual {v8, v1, v7}, Lcom/android/launcher3/util/X2;->c(ILandroid/view/View;)V

    .line 107
    .line 108
    .line 109
    add-int/lit8 v6, v6, 0x1

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_1
    return-void
.end method


# virtual methods
.method public final A()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/B4;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public D(Lcom/android/launcher3/util/z0;Lcom/android/launcher3/util/Y1;Lcom/android/launcher3/util/Y1;IZ)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1f
    .end annotation

    .line 1
    const-string v0, "boundPages"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "pendingTasks"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "onCompleteSignal"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "DisplayWorkspaceFirstFrame"

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-static {v0, v1}, Landroid/os/Trace;->endAsyncSection(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/android/launcher3/B4;->h:Lcom/android/launcher3/util/z0;

    .line 23
    .line 24
    new-instance p1, Lcom/android/launcher3/util/z0;

    .line 25
    .line 26
    invoke-direct {p1}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lcom/android/launcher3/B4;->i:Lcom/android/launcher3/util/z0;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/B4;->J()V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 35
    .line 36
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 37
    .line 38
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_0

    .line 43
    .line 44
    invoke-static {}, Lx1/O;->M()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    iget-object p1, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    const/4 v0, 0x1

    .line 61
    invoke-virtual {p1, v0}, Lcom/android/launcher3/allapps/D;->l(I)V

    .line 62
    .line 63
    .line 64
    new-instance p1, Lcom/android/launcher3/x4;

    .line 65
    .line 66
    invoke-direct {p1, p0}, Lcom/android/launcher3/x4;-><init>(Lcom/android/launcher3/B4;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 70
    .line 71
    .line 72
    :cond_0
    new-instance p1, Lcom/android/launcher3/util/Y2;

    .line 73
    .line 74
    new-instance v0, Lcom/android/launcher3/y4;

    .line 75
    .line 76
    invoke-direct {v0, p0}, Lcom/android/launcher3/y4;-><init>(Lcom/android/launcher3/B4;)V

    .line 77
    .line 78
    .line 79
    invoke-direct {p1, p2, v0}, Lcom/android/launcher3/util/Y2;-><init>(Lcom/android/launcher3/util/Y1;Ljava/util/function/Consumer;)V

    .line 80
    .line 81
    .line 82
    iput-object p1, p0, Lcom/android/launcher3/B4;->l:Lcom/android/launcher3/util/Y2;

    .line 83
    .line 84
    invoke-static {}, Lx1/O;->M()Z

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    if-eqz p2, :cond_1

    .line 89
    .line 90
    new-instance p2, Lcom/android/launcher3/z4;

    .line 91
    .line 92
    invoke-direct {p2, p1}, Lcom/android/launcher3/z4;-><init>(Lcom/android/launcher3/util/Y2;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p3, p2}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_1
    iget-object p2, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 100
    .line 101
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/Y2;->c(Lcom/android/launcher3/C2;)V

    .line 102
    .line 103
    .line 104
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 105
    .line 106
    invoke-virtual {p0, p4, p5}, Lcom/android/launcher3/C2;->b1(IZ)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public E(Ljava/util/Set;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "+",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "updates"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 13
    .line 14
    invoke-interface {v0, p1, v1}, Lcom/android/launcher3/util/Y0;->m(Ljava/util/Set;Lcom/android/launcher3/views/k;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->b0(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public H(Lcom/android/launcher3/BubbleTextView;)V
    .locals 1

    .line 1
    new-instance p0, Lh4/k;

    .line 2
    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v0, "An operation is not implemented: "

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v0, "Not yet implemented"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-direct {p0, p1}, Lh4/k;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    throw p0
.end method

.method public I(Ljava/util/function/Predicate;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Lcom/android/launcher3/Workspace;->I2(Ljava/util/function/Predicate;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, p1}, Lcom/android/launcher3/dragndrop/j;->K(Ljava/util/function/Predicate;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->b0(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public J()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/B4;->l:Lcom/android/launcher3/util/Y2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/util/Y2;->d()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/B4;->l:Lcom/android/launcher3/util/Y2;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v0, 0x1

    .line 22
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/D;->j(I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public K(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Lcom/android/launcher3/util/E;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getPopupDataProvider()Lcom/android/launcher3/popup/n;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/popup/n;->k(Ljava/util/HashMap;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public N()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lz1/J3;->z()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 11
    .line 12
    const/16 v0, 0x80

    .line 13
    .line 14
    invoke-static {p0, v0}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    new-instance v0, Lcom/android/launcher3/w4;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Lcom/android/launcher3/w4;-><init>(Lcom/android/launcher3/a;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public O()V
    .locals 4

    .line 1
    sget-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 2
    .line 3
    const-string v1, "startBinding"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/K2;->beginSection(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    const v1, 0xf289d8b

    .line 11
    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    invoke-static {v0, v2, v1}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 15
    .line 16
    .line 17
    iput-boolean v2, p0, Lcom/android/launcher3/B4;->m:Z

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->l()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->L0()V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->D2()V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->I1()Lcom/android/launcher3/widget/l0;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lcom/android/launcher3/widget/l0;->u()V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/android/launcher3/Hotseat;->b1()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    goto :goto_0

    .line 72
    :cond_0
    const/4 v0, 0x0

    .line 73
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->T0()Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    new-instance v2, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    const-string v3, "startBinding: hotseat layout was vertical: "

    .line 89
    .line 90
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v0, " and is setting to "

    .line 97
    .line 98
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    const-string v1, "ModelCallbacks"

    .line 109
    .line 110
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 114
    .line 115
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    if-eqz v0, :cond_1

    .line 120
    .line 121
    iget-object p0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    invoke-virtual {v0, p0}, Lcom/android/launcher3/Hotseat;->m1(Z)V

    .line 132
    .line 133
    .line 134
    :cond_1
    sget-object p0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 135
    .line 136
    invoke-virtual {p0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method public final P(Lcom/android/launcher3/util/z0;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/B4;->i:Lcom/android/launcher3/util/z0;

    .line 7
    .line 8
    return-void
.end method

.method public S(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/B4;->j:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->G0()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public V()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/Workspace;->n(I)Lcom/android/launcher3/CellLayout;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v2, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 13
    .line 14
    iget-object v3, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lcom/android/launcher3/F1;

    .line 21
    .line 22
    iget v2, v2, Lcom/android/launcher3/F1;->I0:I

    .line 23
    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    const/4 v3, 0x1

    .line 27
    invoke-virtual {v0, v1, v1, v2, v3}, Lcom/android/launcher3/CellLayout;->c0(IIII)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-ne v0, v3, :cond_3

    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getWidgetPickerDataProvider()Ln2/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ln2/c;->e()Lo2/a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lo2/a;->c()Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    move-object v3, v2

    .line 62
    check-cast v3, Lm2/g;

    .line 63
    .line 64
    iget-object v3, v3, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 65
    .line 66
    iget-object v3, v3, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 67
    .line 68
    const-string v4, "com.zte.mifavor.launcher"

    .line 69
    .line 70
    invoke-static {v3, v4}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-eqz v3, :cond_0

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    const/4 v2, 0x0

    .line 78
    :goto_0
    check-cast v2, Lm2/g;

    .line 79
    .line 80
    if-nez v2, :cond_2

    .line 81
    .line 82
    return-void

    .line 83
    :cond_2
    new-instance v4, Lcom/android/launcher3/widget/z0;

    .line 84
    .line 85
    iget-object v0, v2, Lm2/g;->c:Ljava/util/List;

    .line 86
    .line 87
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Lz1/Z4;

    .line 92
    .line 93
    iget-object v0, v0, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 94
    .line 95
    const/16 v2, -0x64

    .line 96
    .line 97
    invoke-direct {v4, v0, v2}, Lcom/android/launcher3/widget/z0;-><init>(Lcom/android/launcher3/widget/U;I)V

    .line 98
    .line 99
    .line 100
    iget-object v3, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 101
    .line 102
    iget v5, v4, Lcom/android/launcher3/model/data/y;->container:I

    .line 103
    .line 104
    filled-new-array {v1, v1}, [I

    .line 105
    .line 106
    .line 107
    move-result-object v7

    .line 108
    iget v8, v4, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 109
    .line 110
    iget v9, v4, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 111
    .line 112
    const/4 v6, 0x0

    .line 113
    invoke-virtual/range {v3 .. v9}, Lcom/android/launcher3/C2;->Y0(Lcom/android/launcher3/W4;II[III)V

    .line 114
    .line 115
    .line 116
    :cond_3
    return-void
.end method

.method public X(Lz1/G4;)V
    .locals 1

    .line 1
    const-string v0, "cache"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/B4;->k:Lz1/G4;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->I0()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public Y(Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string p0, "packageVisibilityMap"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Lh4/k;

    .line 7
    .line 8
    new-instance p1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v0, "An operation is not implemented: "

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, "Not yet implemented"

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-direct {p0, p1}, Lh4/k;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw p0
.end method

.method public a(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/A;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string p0, "launcherAppWidgetInfos"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Lh4/k;

    .line 7
    .line 8
    new-instance p1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v0, "An operation is not implemented: "

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, "Not yet implemented"

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-direct {p0, p1}, Lh4/k;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw p0
.end method

.method public b()Lcom/android/launcher3/util/B0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/util/B0<",
            "Lcom/android/launcher3/C2;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->b()Lcom/android/launcher3/util/B0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p0, Lh4/k;

    .line 2
    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v0, "An operation is not implemented: "

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v0, "Not yet implemented"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-direct {p0, p1}, Lh4/k;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    throw p0
.end method

.method public f(Lcom/android/launcher3/util/x0;)V
    .locals 3

    .line 1
    const-string v0, "orderedScreenIds"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageIndicator()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    check-cast v0, Lcom/android/launcher3/pageindicators/d;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->K0:Z

    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    invoke-interface {v0, v2, v1}, Lcom/android/launcher3/pageindicators/d;->b(ZZ)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/B4;->j:Z

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    sget-boolean v0, Lcom/android/launcher3/N5;->j:Z

    .line 37
    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/x0;->w(I)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/x0;->z(I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v0, v0}, Lcom/android/launcher3/util/x0;->n(II)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/B4;->j:Z

    .line 55
    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    sget-boolean v0, Lcom/android/launcher3/N5;->j:Z

    .line 59
    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    :cond_2
    invoke-virtual {p1}, Lcom/android/launcher3/util/x0;->isEmpty()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->A0()V

    .line 75
    .line 76
    .line 77
    :cond_3
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/B4;->o(Lcom/android/launcher3/util/x0;)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->m3()V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public h(Lcom/android/launcher3/util/z0;)V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "VisibleForTests"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 2
    .line 3
    const-string v1, "finishBindingItems"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/K2;->beginSection(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Lcom/android/launcher3/Workspace;->S2()V

    .line 21
    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    iput-boolean v1, p0, Lcom/android/launcher3/B4;->m:Z

    .line 25
    .line 26
    iget-object v2, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 27
    .line 28
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->j4()V

    .line 29
    .line 30
    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/android/launcher3/util/z0;->isEmpty()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_0

    .line 38
    .line 39
    iget-object v2, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 40
    .line 41
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {p1}, Lcom/android/launcher3/util/z0;->getArray()Lcom/android/launcher3/util/x0;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1, v1}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-virtual {v2, p1}, Lcom/android/launcher3/Workspace;->h1(I)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    goto :goto_0

    .line 58
    :cond_0
    const/4 p1, -0x2

    .line 59
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 60
    .line 61
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v2, p1, p1}, Lcom/android/launcher3/T6;->setCurrentPage(II)V

    .line 66
    .line 67
    .line 68
    new-instance p1, Lcom/android/launcher3/util/z0;

    .line 69
    .line 70
    invoke-direct {p1}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 71
    .line 72
    .line 73
    iput-object p1, p0, Lcom/android/launcher3/B4;->i:Lcom/android/launcher3/util/z0;

    .line 74
    .line 75
    iget-object p1, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 76
    .line 77
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getViewCache()Lcom/android/launcher3/util/X2;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {}, Lx1/O;->e2()Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    const/4 v3, 0x3

    .line 86
    if-eqz v2, :cond_1

    .line 87
    .line 88
    iget v2, v0, Lcom/android/launcher3/h0;->M1:I

    .line 89
    .line 90
    iget v4, v0, Lcom/android/launcher3/h0;->L1:I

    .line 91
    .line 92
    mul-int/2addr v2, v4

    .line 93
    mul-int/2addr v2, v3

    .line 94
    goto :goto_1

    .line 95
    :cond_1
    iget v2, v0, Lcom/android/launcher3/h0;->M1:I

    .line 96
    .line 97
    iget v4, v0, Lcom/android/launcher3/h0;->L1:I

    .line 98
    .line 99
    mul-int/2addr v2, v4

    .line 100
    :goto_1
    const v4, 0x7f0e00dc

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1, v4, v2}, Lcom/android/launcher3/util/X2;->d(II)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getViewCache()Lcom/android/launcher3/util/X2;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-static {}, Lx1/O;->e2()Z

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    if-eqz v2, :cond_2

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_2
    const/4 v3, 0x2

    .line 120
    :goto_2
    const v2, 0x7f0e00e1

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1, v2, v3}, Lcom/android/launcher3/util/X2;->d(II)V

    .line 124
    .line 125
    .line 126
    sget-object p1, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 127
    .line 128
    new-instance v2, Lcom/android/launcher3/A4;

    .line 129
    .line 130
    invoke-direct {v2, p0}, Lcom/android/launcher3/A4;-><init>(Lcom/android/launcher3/B4;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 134
    .line 135
    .line 136
    sget-object p1, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 137
    .line 138
    invoke-virtual {p1}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 142
    .line 143
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    const/4 v2, 0x1

    .line 148
    invoke-virtual {p1, v2}, Lcom/android/launcher3/Workspace;->F2(Z)V

    .line 149
    .line 150
    .line 151
    iget-object p0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageIndicator()Landroid/view/View;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    if-eqz p0, :cond_3

    .line 162
    .line 163
    check-cast p0, Lcom/android/launcher3/pageindicators/d;

    .line 164
    .line 165
    iget-boolean p1, v0, Lcom/android/launcher3/h0;->K0:Z

    .line 166
    .line 167
    invoke-interface {p0, v1, p1}, Lcom/android/launcher3/pageindicators/d;->b(ZZ)V

    .line 168
    .line 169
    .line 170
    :cond_3
    sget-object p0, Li1/a$a;->j:Li1/a$a;

    .line 171
    .line 172
    invoke-static {p0}, Li1/a;->a(Li1/a$a;)V

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method public i([Lcom/android/launcher3/model/data/d;ILjava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/android/launcher3/model/data/d;",
            "I",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/L1;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->A0()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1, p1, p2, p3}, Lcom/android/launcher3/allapps/D;->x([Lcom/android/launcher3/model/data/d;ILjava/util/Map;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->b0(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/r;->A0()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eq v0, p1, :cond_0

    .line 43
    .line 44
    iget-object p1, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    sget-object p2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 55
    .line 56
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_0

    .line 61
    .line 62
    iget-object p0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    sget-object p1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    .line 71
    .line 72
    .line 73
    :cond_0
    return-void
.end method

.method public n(Lcom/android/launcher3/util/x0;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/util/x0;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/x0;->x(Lcom/android/launcher3/util/x0;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, p1}, Lcom/android/launcher3/B4;->o(Lcom/android/launcher3/util/x0;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    if-eqz p2, :cond_2

    .line 19
    .line 20
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 28
    .line 29
    invoke-virtual {v0, p2, p1}, Lcom/android/launcher3/C2;->L(Ljava/util/List;Z)V

    .line 30
    .line 31
    .line 32
    :cond_2
    :goto_0
    if-eqz p3, :cond_4

    .line 33
    .line 34
    invoke-interface {p3}, Ljava/util/Collection;->isEmpty()Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_3

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_3
    iget-object p2, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    invoke-virtual {p2, p3, v0}, Lcom/android/launcher3/C2;->L(Ljava/util/List;Z)V

    .line 45
    .line 46
    .line 47
    :cond_4
    :goto_1
    iget-object p0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->F2(Z)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public p(Lcom/android/launcher3/util/x0;)Lcom/android/launcher3/util/z0;
    .locals 4

    .line 1
    const-string v0, "orderedScreenIds"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/B4;->i:Lcom/android/launcher3/util/z0;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/util/z0;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/B4;->i:Lcom/android/launcher3/util/z0;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/B4;->m:Z

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->getCurrentPageScreenIds()Lcom/android/launcher3/util/z0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/B4;->h:Lcom/android/launcher3/util/z0;

    .line 33
    .line 34
    :goto_0
    new-instance v1, Lcom/android/launcher3/util/z0;

    .line 35
    .line 36
    invoke-direct {v1}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/android/launcher3/util/z0;->isEmpty()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_2

    .line 44
    .line 45
    goto/16 :goto_1

    .line 46
    .line 47
    :cond_2
    invoke-virtual {p1}, Lcom/android/launcher3/util/x0;->q()Lcom/android/launcher3/util/x0;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string v2, "clone(...)"

    .line 52
    .line 53
    invoke-static {p1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0}, Li4/m;->Z(Ljava/lang/Iterable;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Ljava/lang/Integer;

    .line 64
    .line 65
    iget-object v2, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 66
    .line 67
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    invoke-virtual {v2, v3}, Lcom/android/launcher3/Workspace;->k1(I)I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    invoke-virtual {p1, v3}, Lcom/android/launcher3/util/x0;->r(I)Z

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    if-eqz v3, :cond_3

    .line 91
    .line 92
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->K0:Z

    .line 106
    .line 107
    if-eqz p0, :cond_6

    .line 108
    .line 109
    invoke-virtual {p1, v2}, Lcom/android/launcher3/util/x0;->r(I)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_6

    .line 114
    .line 115
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 116
    .line 117
    .line 118
    return-object v1

    .line 119
    :cond_3
    sget-object v0, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    .line 120
    .line 121
    iget-object p0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 122
    .line 123
    invoke-virtual {v0, p0}, Lcom/android/launcher3/P2$a;->a(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    iget-object p0, p0, Lcom/android/launcher3/F1;->I1:Ljava/util/List;

    .line 128
    .line 129
    const-string v0, "supportedProfiles"

    .line 130
    .line 131
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    if-eqz p0, :cond_4

    .line 135
    .line 136
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-eqz v0, :cond_4

    .line 141
    .line 142
    return-object v1

    .line 143
    :cond_4
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    :cond_5
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-eqz v0, :cond_6

    .line 152
    .line 153
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    check-cast v0, Lcom/android/launcher3/h0;

    .line 158
    .line 159
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->K0:Z

    .line 160
    .line 161
    if-eqz v0, :cond_5

    .line 162
    .line 163
    invoke-virtual {p1, v2}, Lcom/android/launcher3/util/x0;->r(I)Z

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    if-eqz p0, :cond_6

    .line 168
    .line 169
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 170
    .line 171
    .line 172
    :cond_6
    :goto_1
    return-object v1
.end method

.method public r(Lcom/android/launcher3/model/data/d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/D;->D(Lcom/android/launcher3/model/data/d;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public t(Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    new-instance p0, Lh4/k;

    .line 2
    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string p2, "An operation is not implemented: "

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p2, "Not yet implemented"

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-direct {p0, p1}, Lh4/k;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    throw p0
.end method

.method public final v()Lcom/android/launcher3/util/Y2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/B4;->l:Lcom/android/launcher3/util/Y2;

    .line 2
    .line 3
    return-object p0
.end method

.method public w(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lm2/g;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "allWidgets"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/B4;->g:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getWidgetPickerDataProvider()Ln2/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ln2/c;->o(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final x()Lz1/G4;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/B4;->k:Lz1/G4;

    .line 2
    .line 3
    return-object p0
.end method

.method public final y()Lcom/android/launcher3/util/z0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/B4;->h:Lcom/android/launcher3/util/z0;

    .line 2
    .line 3
    return-object p0
.end method
