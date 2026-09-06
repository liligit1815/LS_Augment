.class public Lcom/android/launcher3/f1;
.super Ljava/lang/Object;
.source "IconUpdateTask.java"

# interfaces
.implements Lcom/android/launcher3/D3$d;


# instance fields
.field private a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/E;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/E;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/f1;->a:Ljava/util/List;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Ljava/util/Set;Lz1/y0$b;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/C2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/C2;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getPopupDataProvider()Lcom/android/launcher3/popup/n;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getPopupDataProvider()Lcom/android/launcher3/popup/n;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    new-instance v0, Lcom/android/launcher3/e1;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Lcom/android/launcher3/e1;-><init>(Ljava/util/Set;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lcom/android/launcher3/popup/n;->l(Ljava/util/function/Predicate;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const-string p0, "IconUpdateTask"

    .line 30
    .line 31
    const-string p1, "execute, other"

    .line 32
    .line 33
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private c()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/E;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/f1;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public a(Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 3

    .line 1
    new-instance p2, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-class p3, Lcom/android/launcher3/f1;

    .line 7
    .line 8
    monitor-enter p3

    .line 9
    :try_start_0
    invoke-direct {p0}, Lcom/android/launcher3/f1;->c()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p2, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    new-instance p0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result p3

    .line 30
    if-eqz p3, :cond_2

    .line 31
    .line 32
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    check-cast p3, Lcom/android/launcher3/util/E;

    .line 37
    .line 38
    if-nez p3, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-virtual {p1}, Lz1/o3;->X()Lcom/android/launcher3/D3;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p3, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 46
    .line 47
    iget-object p3, p3, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 48
    .line 49
    invoke-virtual {v0, v1, p3}, Lcom/android/launcher3/D3;->Y(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/d;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    if-eqz p3, :cond_0

    .line 54
    .line 55
    invoke-virtual {p1}, Lz1/o3;->X()Lcom/android/launcher3/D3;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->j0()Lcom/android/launcher3/c1;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p1}, Lz1/o3;->V()Landroid/content/Context;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {p1}, Lz1/o3;->W()Ls1/P;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {v0, v1, v2, p3}, Lcom/android/launcher3/c1;->A(Landroid/content/Context;Ls1/P;Lcom/android/launcher3/model/data/d;)Lcom/android/launcher3/model/data/d;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    if-eqz p2, :cond_3

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    new-instance p2, Ljava/util/HashSet;

    .line 86
    .line 87
    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 95
    .line 96
    .line 97
    move-result p3

    .line 98
    if-eqz p3, :cond_4

    .line 99
    .line 100
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p3

    .line 104
    check-cast p3, Lcom/android/launcher3/model/data/d;

    .line 105
    .line 106
    invoke-static {p3}, Lcom/android/launcher3/util/L1;->a(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/L1;

    .line 107
    .line 108
    .line 109
    move-result-object p3

    .line 110
    invoke-interface {p2, p3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_4
    invoke-interface {p2}, Ljava/util/Set;->isEmpty()Z

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    if-nez p0, :cond_5

    .line 119
    .line 120
    new-instance p0, Lcom/android/launcher3/d1;

    .line 121
    .line 122
    invoke-direct {p0, p2}, Lcom/android/launcher3/d1;-><init>(Ljava/util/Set;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, p0}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 126
    .line 127
    .line 128
    :cond_5
    :goto_2
    return-void

    .line 129
    :catchall_0
    move-exception p0

    .line 130
    :try_start_1
    monitor-exit p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 131
    throw p0
.end method
