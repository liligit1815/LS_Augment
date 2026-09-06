.class final LN2/x$b;
.super Ljava/lang/Object;
.source "DropTargetManager.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LN2/x;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "b"
.end annotation


# instance fields
.field private final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LN2/r;",
            ">;"
        }
    .end annotation
.end field

.field private final b:LN2/t;

.field private final c:LN2/r$a;

.field private d:LN2/r;

.field final synthetic e:LN2/x;


# direct methods
.method public constructor <init>(LN2/x;Ljava/util/List;LN2/t;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "LN2/r;",
            ">;",
            "LN2/t;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "dragZones"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "draggedObject"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, LN2/x$b;->e:LN2/x;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, LN2/x$b;->a:Ljava/util/List;

    .line 17
    .line 18
    iput-object p3, p0, LN2/x$b;->b:LN2/t;

    .line 19
    .line 20
    invoke-interface {p3}, LN2/t;->a()LN2/h;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    invoke-static {p1}, LN2/x;->d(LN2/x;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-virtual {p3, p1}, LN2/h;->e(Z)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    new-instance p1, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    if-eqz p3, :cond_1

    .line 48
    .line 49
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    instance-of v0, p3, LN2/r$a$a;

    .line 54
    .line 55
    if-eqz v0, :cond_0

    .line 56
    .line 57
    invoke-interface {p1, p3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    invoke-static {p1}, Li4/m;->a0(Ljava/util/List;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, LN2/r$a;

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_2
    new-instance p1, Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    :cond_3
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 78
    .line 79
    .line 80
    move-result p3

    .line 81
    if-eqz p3, :cond_4

    .line 82
    .line 83
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    instance-of v0, p3, LN2/r$a$b;

    .line 88
    .line 89
    if-eqz v0, :cond_3

    .line 90
    .line 91
    invoke-interface {p1, p3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_4
    invoke-static {p1}, Li4/m;->a0(Ljava/util/List;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    check-cast p1, LN2/r$a;

    .line 100
    .line 101
    :goto_2
    iput-object p1, p0, LN2/x$b;->c:LN2/r$a;

    .line 102
    .line 103
    iput-object p1, p0, LN2/x$b;->d:LN2/r;

    .line 104
    .line 105
    return-void
.end method


# virtual methods
.method public final a()LN2/r;
    .locals 0

    .line 1
    iget-object p0, p0, LN2/x$b;->d:LN2/r;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()LN2/t;
    .locals 0

    .line 1
    iget-object p0, p0, LN2/x$b;->b:LN2/t;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()LN2/r$a;
    .locals 0

    .line 1
    iget-object p0, p0, LN2/x$b;->c:LN2/r$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d(II)LN2/r;
    .locals 3

    .line 1
    iget-object v0, p0, LN2/x$b;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    move-object v2, v1

    .line 18
    check-cast v2, LN2/r;

    .line 19
    .line 20
    invoke-interface {v2, p1, p2}, LN2/r;->b(II)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 v1, 0x0

    .line 28
    :goto_0
    check-cast v1, LN2/r;

    .line 29
    .line 30
    if-nez v1, :cond_2

    .line 31
    .line 32
    iget-object p0, p0, LN2/x$b;->d:LN2/r;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_2
    return-object v1
.end method

.method public final e(LN2/r;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, LN2/x$b;->d:LN2/r;

    .line 7
    .line 8
    return-void
.end method
