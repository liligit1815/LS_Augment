.class public LP0/e;
.super Ljava/lang/Object;
.source "DefaultAppSearchAlgorithm.java"

# interfaces
.implements LI1/a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LI1/a<",
        "Lcom/android/launcher3/allapps/O$a;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Lcom/android/launcher3/P2;

.field private final b:Landroid/os/Handler;

.field private final c:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, LP0/e;->a:Lcom/android/launcher3/P2;

    .line 9
    .line 10
    new-instance p1, Landroid/os/Handler;

    .line 11
    .line 12
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->g()Landroid/os/Looper;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, LP0/e;->b:Landroid/os/Handler;

    .line 22
    .line 23
    iput-boolean p2, p0, LP0/e;->c:Z

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic c(LI1/b;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1, p2}, LI1/b;->b(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(LP0/e;Ljava/lang/String;LI1/b;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, LP0/e;->g(Ljava/lang/String;LI1/b;Lz1/o3;Lz1/y0;Lz1/m;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static e(Ljava/lang/String;)Lcom/android/launcher3/allapps/O$a;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/allapps/O$a;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/allapps/O$a;-><init>(I)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Lcom/android/launcher3/model/data/d;

    .line 8
    .line 9
    invoke-direct {v1}, Lcom/android/launcher3/model/data/d;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p0, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 13
    .line 14
    iput-object v1, v0, Lcom/android/launcher3/allapps/O$a;->d:Lcom/android/launcher3/model/data/d;

    .line 15
    .line 16
    return-object v0
.end method

.method private f(Ljava/util/List;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/d;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/allapps/O$a;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_2

    .line 13
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_6

    .line 30
    .line 31
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lcom/android/launcher3/model/data/d;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/android/launcher3/resource/h1;->h0(Lcom/android/launcher3/model/data/y;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-nez v1, :cond_2

    .line 52
    .line 53
    const/4 v1, 0x1

    .line 54
    goto :goto_1

    .line 55
    :cond_2
    const/4 v1, 0x0

    .line 56
    :goto_1
    iget-object v2, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 57
    .line 58
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-nez v2, :cond_3

    .line 63
    .line 64
    iget-object v2, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 65
    .line 66
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v2, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-nez v2, :cond_5

    .line 79
    .line 80
    :cond_3
    iget-object v2, v0, Lcom/android/launcher3/model/data/y;->pinyinFull:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-nez v2, :cond_4

    .line 87
    .line 88
    iget-object v2, v0, Lcom/android/launcher3/model/data/y;->pinyinFull:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v2, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-nez v2, :cond_5

    .line 95
    .line 96
    :cond_4
    iget-object v2, v0, Lcom/android/launcher3/model/data/y;->pinyinHeader:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-nez v2, :cond_1

    .line 103
    .line 104
    iget-object v2, v0, Lcom/android/launcher3/model/data/y;->pinyinHeader:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v2, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-eqz v2, :cond_1

    .line 111
    .line 112
    :cond_5
    if-nez v1, :cond_1

    .line 113
    .line 114
    invoke-static {v0}, Lcom/android/launcher3/allapps/O$a;->a(Lcom/android/launcher3/model/data/d;)Lcom/android/launcher3/allapps/O$a;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_6
    :goto_2
    return-object p0
.end method

.method private synthetic g(Ljava/lang/String;LI1/b;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 0

    .line 1
    iget-object p3, p5, Lz1/m;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0, p3, p1}, LP0/e;->f(Ljava/util/List;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    new-instance p4, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string p5, "execute: query: "

    .line 13
    .line 14
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string p5, " result: "

    .line 21
    .line 22
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 26
    .line 27
    .line 28
    move-result p5

    .line 29
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p4

    .line 36
    const-string p5, "DefaultAppSearchAlgorithm"

    .line 37
    .line 38
    invoke-static {p5, p4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    iget-boolean p4, p0, LP0/e;->c:Z

    .line 42
    .line 43
    if-eqz p4, :cond_0

    .line 44
    .line 45
    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 46
    .line 47
    .line 48
    move-result p4

    .line 49
    if-eqz p4, :cond_0

    .line 50
    .line 51
    invoke-static {p1}, LP0/e;->e(Ljava/lang/String;)Lcom/android/launcher3/allapps/O$a;

    .line 52
    .line 53
    .line 54
    move-result-object p4

    .line 55
    invoke-virtual {p3, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    :cond_0
    iget-object p0, p0, LP0/e;->b:Landroid/os/Handler;

    .line 59
    .line 60
    new-instance p4, LP0/d;

    .line 61
    .line 62
    invoke-direct {p4, p2, p1, p3}, LP0/d;-><init>(LI1/b;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 66
    .line 67
    .line 68
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;LI1/b;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "LI1/b<",
            "Lcom/android/launcher3/allapps/O$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LP0/e;->a:Lcom/android/launcher3/P2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, LP0/c;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1, p2}, LP0/c;-><init>(LP0/e;Ljava/lang/String;LI1/b;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public cancel(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, LP0/e;->b:Landroid/os/Handler;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method
