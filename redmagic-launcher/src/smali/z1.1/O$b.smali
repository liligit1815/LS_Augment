.class Lz1/O$b;
.super Ljava/lang/Object;
.source "BaseLauncherBinder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lz1/O;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "b"
.end annotation


# instance fields
.field private final a:Lz1/y0$b;

.field private final b:Lcom/android/launcher3/util/A0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/A0<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Lcom/android/launcher3/util/x0;

.field private final d:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lz1/y0$c;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic e:Lz1/O;


# direct methods
.method constructor <init>(Lz1/O;Lz1/y0$b;Lcom/android/launcher3/util/A0;Ljava/util/ArrayList;Lcom/android/launcher3/util/x0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/y0$b;",
            "Lcom/android/launcher3/util/A0<",
            "Lcom/android/launcher3/model/data/y;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lz1/y0$c;",
            ">;",
            "Lcom/android/launcher3/util/x0;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lz1/O$b;->e:Lz1/O;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lz1/O$b;->a:Lz1/y0$b;

    .line 7
    .line 8
    iput-object p3, p0, Lz1/O$b;->b:Lcom/android/launcher3/util/A0;

    .line 9
    .line 10
    iput-object p4, p0, Lz1/O$b;->d:Ljava/util/ArrayList;

    .line 11
    .line 12
    iput-object p5, p0, Lz1/O$b;->c:Lcom/android/launcher3/util/x0;

    .line 13
    .line 14
    return-void
.end method

.method private synthetic A(Lcom/android/launcher3/D3$a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/O$b;->e:Lz1/O;

    .line 2
    .line 3
    invoke-static {v0}, Lz1/O;->y(Lz1/O;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lz1/O$b;->e:Lz1/O;

    .line 8
    .line 9
    iget-object v1, v1, Lz1/O;->e:Lz1/y0;

    .line 10
    .line 11
    iget v1, v1, Lz1/y0;->f:I

    .line 12
    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    const-string p0, "LauncherBinder"

    .line 16
    .line 17
    const-string p1, "Too many consecutive reloads, skipping obsolete data-bind"

    .line 18
    .line 19
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p0, p0, Lz1/O$b;->a:Lz1/y0$b;

    .line 24
    .line 25
    invoke-interface {p1, p0}, Lcom/android/launcher3/D3$a;->a(Lz1/y0$b;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private synthetic B()V
    .locals 1

    .line 1
    sget-object v0, Lz1/t1;->f:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/O$b;->e:Lz1/O;

    .line 4
    .line 5
    invoke-static {p0}, Lz1/O;->w(Lz1/O;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lz1/t1;

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    invoke-virtual {p0, v0}, Lz1/t1;->C(I)V

    .line 17
    .line 18
    .line 19
    const-string p0, "LauncherBinder"

    .line 20
    .line 21
    const-string v0, "bind resumeModelPush"

    .line 22
    .line 23
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private C(Lcom/android/launcher3/util/z0;Ljava/util/concurrent/Executor;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/O$b;->e:Lz1/O;

    .line 2
    .line 3
    iget-object v0, v0, Lz1/O;->e:Lz1/y0;

    .line 4
    .line 5
    iget-object v0, v0, Lz1/y0;->e:Lz1/G4;

    .line 6
    .line 7
    invoke-virtual {v0}, Lz1/G4;->c()Lz1/G4;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Lz1/f0;

    .line 12
    .line 13
    invoke-direct {v1, v0}, Lz1/f0;-><init>(Lz1/G4;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v1, p2}, Lz1/O$b;->t(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Lz1/g0;

    .line 20
    .line 21
    invoke-direct {v0, p1}, Lz1/g0;-><init>(Lcom/android/launcher3/util/z0;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0, p2}, Lz1/O$b;->t(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 25
    .line 26
    .line 27
    new-instance p1, Lz1/Q;

    .line 28
    .line 29
    invoke-direct {p1, p0}, Lz1/Q;-><init>(Lz1/O$b;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p2, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/util/z0;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lz1/y0$b;->h(Lcom/android/launcher3/util/z0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lz1/O$b;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/O$b;->x(Lz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lz1/O$b;Ljava/util/ArrayList;Lcom/android/launcher3/util/B0;Ljava/util/concurrent/Executor;Ljava/util/ArrayList;Lcom/android/launcher3/util/z0;Lcom/android/launcher3/util/Y1;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lz1/O$b;->z(Ljava/util/ArrayList;Lcom/android/launcher3/util/B0;Ljava/util/concurrent/Executor;Ljava/util/ArrayList;Lcom/android/launcher3/util/z0;Lcom/android/launcher3/util/Y1;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lz1/O$b;Lz1/y0$c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/O$b;->y(Lz1/y0$c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e()V
    .locals 2

    .line 1
    const-string v0, "LauncherBinder"

    .line 2
    .line 3
    const-string v1, "Calling onCompleteSignal"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/util/z0;Lcom/android/launcher3/util/Y1;Lcom/android/launcher3/util/Y1;IZLz1/y0$b;)V
    .locals 3

    .line 1
    const-string v0, "LauncherBinder"

    .line 2
    .line 3
    const-string v1, "bind onInitialBindComplete"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-object v2, p1

    .line 9
    move-object p1, p0

    .line 10
    move-object p0, p5

    .line 11
    move p5, p4

    .line 12
    move p4, p3

    .line 13
    move-object p3, p2

    .line 14
    move-object p2, v2

    .line 15
    invoke-interface/range {p0 .. p5}, Lz1/y0$b;->D(Lcom/android/launcher3/util/z0;Lcom/android/launcher3/util/Y1;Lcom/android/launcher3/util/Y1;IZ)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic g(Lz1/G4;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lz1/y0$b;->X(Lz1/G4;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lz1/O$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lz1/O$b;->B()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lz1/y0$b;->q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Ljava/util/List;IILz1/y0$b;)V
    .locals 0

    .line 1
    add-int/2addr p2, p1

    .line 2
    invoke-interface {p0, p1, p2}, Ljava/util/List;->subList(II)Ljava/util/List;

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

.method public static synthetic k(Lz1/O$b;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/O$b;->w(Lz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Lz1/y0$c;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lz1/y0$b;->z(Lz1/y0$c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Lz1/O$b;Lcom/android/launcher3/D3$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/O$b;->A(Lcom/android/launcher3/D3$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Ljava/util/function/Predicate;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    invoke-interface {p0, p5}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    sget-object p0, Lz1/r3;->a:Ljava/util/function/Predicate;

    .line 8
    .line 9
    invoke-interface {p0, p5}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move-object p1, p2

    .line 17
    :goto_0
    invoke-virtual {p1, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    iget p0, p5, Lcom/android/launcher3/model/data/y;->container:I

    .line 22
    .line 23
    const/16 p1, -0x64

    .line 24
    .line 25
    if-ne p0, p1, :cond_3

    .line 26
    .line 27
    sget-object p0, Lz1/r3;->a:Ljava/util/function/Predicate;

    .line 28
    .line 29
    invoke-interface {p0, p5}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_2
    move-object p3, p4

    .line 37
    :goto_1
    invoke-virtual {p3, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    :cond_3
    return-void
.end method

.method public static synthetic o(Ljava/util/List;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lz1/y0$b;->l(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(Lcom/android/launcher3/util/B0;Lz1/J3;Lcom/android/launcher3/model/data/y;)Landroid/util/Pair;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p2, p1, v0}, Lcom/android/launcher3/util/B0;->d(Lcom/android/launcher3/model/data/y;Lz1/J3;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-static {p2, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method static bridge synthetic q(Lz1/O$b;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lz1/O$b;->r(ZI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private r(ZI)V
    .locals 11

    .line 1
    iget-object v0, p0, Lz1/O$b;->a:Lz1/y0$b;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/O$b;->c:Lcom/android/launcher3/util/x0;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Lz1/y0$b;->p(Lcom/android/launcher3/util/x0;)Lcom/android/launcher3/util/z0;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v1, "Null screen ids provided by "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lz1/O$b;->a:Lz1/y0$b;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v3, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    const-string v1, "bind mOrderedScreenIds: "

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lz1/O$b;->c:Lcom/android/launcher3/util/x0;

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/android/launcher3/util/x0;->B()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v1, " ,currentScreenIds: "

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-string v1, "LauncherBinder"

    .line 63
    .line 64
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    new-instance v7, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .line 71
    .line 72
    new-instance v4, Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 75
    .line 76
    .line 77
    new-instance v6, Ljava/util/ArrayList;

    .line 78
    .line 79
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .line 81
    .line 82
    new-instance v8, Ljava/util/ArrayList;

    .line 83
    .line 84
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lz1/O$b;->e:Lz1/O;

    .line 88
    .line 89
    invoke-static {v0}, Lz1/O;->w(Lz1/O;)Landroid/content/Context;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-static {v3, v0}, Lz1/r3;->b(Lcom/android/launcher3/util/z0;Lcom/android/launcher3/P2;)Ljava/util/function/Predicate;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    iget-object v0, p0, Lz1/O$b;->b:Lcom/android/launcher3/util/A0;

    .line 102
    .line 103
    move-object v9, v4

    .line 104
    new-instance v4, Lz1/P;

    .line 105
    .line 106
    invoke-direct/range {v4 .. v9}, Lz1/P;-><init>(Ljava/util/function/Predicate;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 107
    .line 108
    .line 109
    invoke-interface {v0, v4}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lz1/O$b;->e:Lz1/O;

    .line 113
    .line 114
    invoke-virtual {v0, v7}, Lz1/O;->Z(Ljava/util/ArrayList;)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lz1/O$b;->e:Lz1/O;

    .line 118
    .line 119
    invoke-virtual {v0, v9}, Lz1/O;->Z(Ljava/util/ArrayList;)V

    .line 120
    .line 121
    .line 122
    new-instance v0, Lz1/Y;

    .line 123
    .line 124
    invoke-direct {v0, p0}, Lz1/Y;-><init>(Lz1/O$b;)V

    .line 125
    .line 126
    .line 127
    iget-object v2, p0, Lz1/O$b;->e:Lz1/O;

    .line 128
    .line 129
    iget-object v2, v2, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 130
    .line 131
    invoke-virtual {p0, v0, v2}, Lz1/O$b;->t(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 132
    .line 133
    .line 134
    new-instance v0, Lz1/Z;

    .line 135
    .line 136
    invoke-direct {v0, p0}, Lz1/Z;-><init>(Lz1/O$b;)V

    .line 137
    .line 138
    .line 139
    iget-object v2, p0, Lz1/O$b;->e:Lz1/O;

    .line 140
    .line 141
    iget-object v2, v2, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 142
    .line 143
    invoke-virtual {p0, v0, v2}, Lz1/O$b;->t(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Lz1/O$b;->a:Lz1/y0$b;

    .line 147
    .line 148
    invoke-interface {v0}, Lz1/y0$b;->b()Lcom/android/launcher3/util/B0;

    .line 149
    .line 150
    .line 151
    move-result-object v5

    .line 152
    invoke-static {}, Lx1/O;->M()Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    const/4 v2, 0x1

    .line 157
    const/4 v4, 0x6

    .line 158
    if-eqz v0, :cond_0

    .line 159
    .line 160
    if-eqz v5, :cond_0

    .line 161
    .line 162
    iget-object v0, p0, Lz1/O$b;->e:Lz1/O;

    .line 163
    .line 164
    iget-object v0, v0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 165
    .line 166
    invoke-direct {p0, v7, v5, v0}, Lz1/O$b;->v(Ljava/util/List;Lcom/android/launcher3/util/B0;Ljava/util/concurrent/Executor;)V

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Lz1/O$b;->e:Lz1/O;

    .line 170
    .line 171
    iget-object v0, v0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 172
    .line 173
    invoke-direct {p0, v6, v5, v0}, Lz1/O$b;->v(Ljava/util/List;Lcom/android/launcher3/util/B0;Ljava/util/concurrent/Executor;)V

    .line 174
    .line 175
    .line 176
    goto :goto_0

    .line 177
    :cond_0
    iget-object v0, p0, Lz1/O$b;->e:Lz1/O;

    .line 178
    .line 179
    iget-object v0, v0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 180
    .line 181
    invoke-direct {p0, v7, v4, v0}, Lz1/O$b;->s(Ljava/util/List;ILjava/util/concurrent/Executor;)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Lz1/O$b;->e:Lz1/O;

    .line 185
    .line 186
    iget-object v0, v0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 187
    .line 188
    invoke-direct {p0, v6, v2, v0}, Lz1/O$b;->s(Ljava/util/List;ILjava/util/concurrent/Executor;)V

    .line 189
    .line 190
    .line 191
    :goto_0
    iget-object v0, p0, Lz1/O$b;->d:Ljava/util/ArrayList;

    .line 192
    .line 193
    new-instance v6, Lz1/a0;

    .line 194
    .line 195
    invoke-direct {v6, p0}, Lz1/a0;-><init>(Lz1/O$b;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 199
    .line 200
    .line 201
    iget-object v0, p0, Lz1/O$b;->e:Lz1/O;

    .line 202
    .line 203
    iget-object v0, v0, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 204
    .line 205
    invoke-direct {p0, v0}, Lz1/O$b;->u(Ljava/util/concurrent/Executor;)V

    .line 206
    .line 207
    .line 208
    const-string v0, "bind currentItems in uiExecutor"

    .line 209
    .line 210
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    .line 212
    .line 213
    new-instance v0, Lcom/android/launcher3/util/Y1;

    .line 214
    .line 215
    invoke-direct {v0}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 216
    .line 217
    .line 218
    new-instance v6, Lz1/b0;

    .line 219
    .line 220
    invoke-direct {v6, v0}, Lz1/b0;-><init>(Lcom/android/launcher3/util/Y1;)V

    .line 221
    .line 222
    .line 223
    move v7, v4

    .line 224
    move-object v4, v9

    .line 225
    new-instance v9, Lcom/android/launcher3/util/Y1;

    .line 226
    .line 227
    invoke-direct {v9}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 228
    .line 229
    .line 230
    new-instance v10, Lz1/c0;

    .line 231
    .line 232
    invoke-direct {v10}, Lz1/c0;-><init>()V

    .line 233
    .line 234
    .line 235
    invoke-virtual {v9, v10}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 236
    .line 237
    .line 238
    invoke-static {}, Lx1/O;->M()Z

    .line 239
    .line 240
    .line 241
    move-result v10

    .line 242
    if-eqz v10, :cond_1

    .line 243
    .line 244
    if-eqz v5, :cond_1

    .line 245
    .line 246
    const-string v2, "Starting async inflation"

    .line 247
    .line 248
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    .line 250
    .line 251
    sget-object v1, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 252
    .line 253
    new-instance v2, Lz1/d0;

    .line 254
    .line 255
    move-object v7, v8

    .line 256
    move-object v8, v3

    .line 257
    move-object v3, p0

    .line 258
    invoke-direct/range {v2 .. v9}, Lz1/d0;-><init>(Lz1/O$b;Ljava/util/ArrayList;Lcom/android/launcher3/util/B0;Ljava/util/concurrent/Executor;Ljava/util/ArrayList;Lcom/android/launcher3/util/z0;Lcom/android/launcher3/util/Y1;)V

    .line 259
    .line 260
    .line 261
    move-object v3, v8

    .line 262
    move-object v5, v9

    .line 263
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 264
    .line 265
    .line 266
    goto :goto_1

    .line 267
    :cond_1
    move-object v5, v9

    .line 268
    move-object v9, v4

    .line 269
    const-string v4, "Starting sync inflation"

    .line 270
    .line 271
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    .line 273
    .line 274
    invoke-direct {p0, v9, v7, v6}, Lz1/O$b;->s(Ljava/util/List;ILjava/util/concurrent/Executor;)V

    .line 275
    .line 276
    .line 277
    invoke-direct {p0, v8, v2, v6}, Lz1/O$b;->s(Ljava/util/List;ILjava/util/concurrent/Executor;)V

    .line 278
    .line 279
    .line 280
    invoke-direct {p0, v3, v6}, Lz1/O$b;->C(Lcom/android/launcher3/util/z0;Ljava/util/concurrent/Executor;)V

    .line 281
    .line 282
    .line 283
    invoke-virtual {v5}, Lcom/android/launcher3/util/Y1;->c()V

    .line 284
    .line 285
    .line 286
    :goto_1
    new-instance v2, Lz1/e0;

    .line 287
    .line 288
    move v7, p1

    .line 289
    move v6, p2

    .line 290
    move-object v4, v0

    .line 291
    invoke-direct/range {v2 .. v7}, Lz1/e0;-><init>(Lcom/android/launcher3/util/z0;Lcom/android/launcher3/util/Y1;Lcom/android/launcher3/util/Y1;IZ)V

    .line 292
    .line 293
    .line 294
    iget-object p1, p0, Lz1/O$b;->e:Lz1/O;

    .line 295
    .line 296
    iget-object p1, p1, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 297
    .line 298
    invoke-virtual {p0, v2, p1}, Lz1/O$b;->t(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 299
    .line 300
    .line 301
    return-void
.end method

.method private s(Ljava/util/List;ILjava/util/concurrent/Executor;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;I",
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
    if-ge v1, v0, :cond_1

    .line 7
    .line 8
    add-int v2, v1, p2

    .line 9
    .line 10
    if-gt v2, v0, :cond_0

    .line 11
    .line 12
    move v3, p2

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    sub-int v3, v0, v1

    .line 15
    .line 16
    :goto_1
    new-instance v4, Lz1/W;

    .line 17
    .line 18
    invoke-direct {v4, p1, v1, v3}, Lz1/W;-><init>(Ljava/util/List;II)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v4, p3}, Lz1/O$b;->t(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

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

.method private u(Ljava/util/concurrent/Executor;)V
    .locals 1

    .line 1
    new-instance v0, Lz1/X;

    .line 2
    .line 3
    invoke-direct {v0}, Lz1/X;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0, p1}, Lz1/O$b;->t(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private v(Ljava/util/List;Lcom/android/launcher3/util/B0;Ljava/util/concurrent/Executor;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;",
            "Lcom/android/launcher3/util/B0;",
            "Ljava/util/concurrent/Executor;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lz1/O$b;->e:Lz1/O;

    .line 2
    .line 3
    invoke-static {v0}, Lz1/O;->y(Lz1/O;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lz1/O$b;->e:Lz1/O;

    .line 8
    .line 9
    iget-object v2, v1, Lz1/O;->e:Lz1/y0;

    .line 10
    .line 11
    iget v2, v2, Lz1/y0;->f:I

    .line 12
    .line 13
    if-eq v0, v2, :cond_0

    .line 14
    .line 15
    const-string p0, "LauncherBinder"

    .line 16
    .line 17
    const-string p1, "Too many consecutive reloads, skipping obsolete view inflation"

    .line 18
    .line 19
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {v1}, Lz1/O;->x(Lz1/O;)Lcom/android/launcher3/D3;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v1, Lc1/c;->c:Lc1/c;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-virtual {v0, v3, v1, v2}, Lcom/android/launcher3/D3;->o0(ZLc1/c;Lz1/y0$b;)Lz1/J3;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance v1, Lz1/U;

    .line 40
    .line 41
    invoke-direct {v1, p2, v0}, Lz1/U;-><init>(Lcom/android/launcher3/util/B0;Lz1/J3;)V

    .line 42
    .line 43
    .line 44
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Ljava/util/List;

    .line 57
    .line 58
    new-instance p2, Lz1/V;

    .line 59
    .line 60
    invoke-direct {p2, p1}, Lz1/V;-><init>(Ljava/util/List;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p2, p3}, Lz1/O$b;->t(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method private synthetic w(Lz1/y0$b;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Lz1/y0$b;->J()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Lz1/y0$b;->O()V

    .line 5
    .line 6
    .line 7
    const-string v0, "LauncherBinder"

    .line 8
    .line 9
    const-string v1, "bind startBinding"

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/android/launcher3/y0;->Z()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lz1/O$b;->e:Lz1/O;

    .line 21
    .line 22
    iget-object p0, p0, Lz1/O;->e:Lz1/y0;

    .line 23
    .line 24
    iget-boolean p0, p0, Lz1/y0;->h:Z

    .line 25
    .line 26
    invoke-interface {p1, p0}, Lz1/y0$b;->S(Z)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method private synthetic x(Lz1/y0$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/O$b;->c:Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Lz1/y0$b;->f(Lcom/android/launcher3/util/x0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic y(Lz1/y0$c;)V
    .locals 1

    .line 1
    new-instance v0, Lz1/T;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lz1/T;-><init>(Lz1/y0$c;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lz1/O$b;->e:Lz1/O;

    .line 7
    .line 8
    iget-object p1, p1, Lz1/O;->a:Lcom/android/launcher3/util/p1;

    .line 9
    .line 10
    invoke-virtual {p0, v0, p1}, Lz1/O$b;->t(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic z(Ljava/util/ArrayList;Lcom/android/launcher3/util/B0;Ljava/util/concurrent/Executor;Ljava/util/ArrayList;Lcom/android/launcher3/util/z0;Lcom/android/launcher3/util/Y1;)V
    .locals 2

    .line 1
    const-string v0, "LauncherBinder"

    .line 2
    .line 3
    const-string v1, "bind otherItems"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1, p2, p3}, Lz1/O$b;->v(Ljava/util/List;Lcom/android/launcher3/util/B0;Ljava/util/concurrent/Executor;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p4, p2, p3}, Lz1/O$b;->v(Ljava/util/List;Lcom/android/launcher3/util/B0;Ljava/util/concurrent/Executor;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, p5, p3}, Lz1/O$b;->C(Lcom/android/launcher3/util/z0;Ljava/util/concurrent/Executor;)V

    .line 15
    .line 16
    .line 17
    sget-object p0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 18
    .line 19
    invoke-static {p6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    new-instance p1, Lcom/android/launcher3/t;

    .line 23
    .line 24
    invoke-direct {p1, p6}, Lcom/android/launcher3/t;-><init>(Lcom/android/launcher3/util/Y1;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method protected t(Lcom/android/launcher3/D3$a;Ljava/util/concurrent/Executor;)V
    .locals 1

    .line 1
    new-instance v0, Lz1/S;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lz1/S;-><init>(Lz1/O$b;Lcom/android/launcher3/D3$a;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
