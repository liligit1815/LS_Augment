.class public LW2/f;
.super Ljava/lang/Object;
.source "SpringChain.java"

# interfaces
.implements LW2/i;


# static fields
.field private static final g:LW2/h;

.field private static h:I


# instance fields
.field private final a:LW2/k;

.field private final b:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "LW2/i;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "LW2/e;",
            ">;"
        }
    .end annotation
.end field

.field private d:I

.field private final e:LW2/g;

.field private final f:LW2/g;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, LW2/h;->b()LW2/h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, LW2/f;->g:LW2/h;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    sput v0, LW2/f;->h:I

    .line 9
    .line 10
    return-void
.end method

.method private constructor <init>()V
    .locals 4

    const/16 v0, 0x46

    const/16 v1, 0xa

    const/16 v2, 0x28

    const/4 v3, 0x6

    .line 1
    invoke-direct {p0, v2, v3, v0, v1}, LW2/f;-><init>(IIII)V

    return-void
.end method

.method private constructor <init>(IIII)V
    .locals 2

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    invoke-static {}, LW2/k;->j()LW2/k;

    move-result-object v0

    iput-object v0, p0, LW2/f;->a:LW2/k;

    .line 4
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, LW2/f;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 5
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, LW2/f;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    const/4 v0, -0x1

    .line 6
    iput v0, p0, LW2/f;->d:I

    int-to-double v0, p1

    int-to-double p1, p2

    .line 7
    invoke-static {v0, v1, p1, p2}, LW2/g;->a(DD)LW2/g;

    move-result-object p1

    iput-object p1, p0, LW2/f;->e:LW2/g;

    int-to-double p2, p3

    int-to-double v0, p4

    .line 8
    invoke-static {p2, p3, v0, v1}, LW2/g;->a(DD)LW2/g;

    move-result-object p2

    iput-object p2, p0, LW2/f;->f:LW2/g;

    .line 9
    sget-object p0, LW2/f;->g:LW2/h;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "main spring "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p4, LW2/f;->h:I

    add-int/lit8 v0, p4, 0x1

    sput v0, LW2/f;->h:I

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p1, p3}, LW2/h;->a(LW2/g;Ljava/lang/String;)Z

    .line 10
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "attachment spring "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p3, LW2/f;->h:I

    add-int/lit8 p4, p3, 0x1

    sput p4, LW2/f;->h:I

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, LW2/h;->a(LW2/g;Ljava/lang/String;)Z

    return-void
.end method

.method public static f()LW2/f;
    .locals 1

    .line 1
    new-instance v0, LW2/f;

    .line 2
    .line 3
    invoke-direct {v0}, LW2/f;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static g(IIII)LW2/f;
    .locals 1

    .line 1
    new-instance v0, LW2/f;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, LW2/f;-><init>(IIII)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a(LW2/e;)V
    .locals 1

    .line 1
    iget-object v0, p0, LW2/f;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, LW2/f;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, LW2/i;

    .line 14
    .line 15
    invoke-interface {p0, p1}, LW2/i;->a(LW2/e;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public b(LW2/e;)V
    .locals 6

    .line 1
    iget-object v0, p0, LW2/f;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, LW2/f;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, LW2/i;

    .line 14
    .line 15
    iget v2, p0, LW2/f;->d:I

    .line 16
    .line 17
    const/4 v3, -0x1

    .line 18
    if-ne v0, v2, :cond_0

    .line 19
    .line 20
    add-int/lit8 v2, v0, -0x1

    .line 21
    .line 22
    add-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    if-ge v0, v2, :cond_1

    .line 26
    .line 27
    add-int/lit8 v2, v0, -0x1

    .line 28
    .line 29
    move v0, v3

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    if-le v0, v2, :cond_2

    .line 32
    .line 33
    add-int/lit8 v0, v0, 0x1

    .line 34
    .line 35
    move v2, v3

    .line 36
    goto :goto_0

    .line 37
    :cond_2
    move v0, v3

    .line 38
    move v2, v0

    .line 39
    :goto_0
    if-le v0, v3, :cond_3

    .line 40
    .line 41
    iget-object v4, p0, LW2/f;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 42
    .line 43
    invoke-virtual {v4}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-ge v0, v4, :cond_3

    .line 48
    .line 49
    iget-object v4, p0, LW2/f;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 50
    .line 51
    invoke-virtual {v4, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, LW2/e;

    .line 56
    .line 57
    invoke-virtual {p1}, LW2/e;->e()D

    .line 58
    .line 59
    .line 60
    move-result-wide v4

    .line 61
    invoke-virtual {v0, v4, v5}, LW2/e;->n(D)LW2/e;

    .line 62
    .line 63
    .line 64
    :cond_3
    if-le v2, v3, :cond_4

    .line 65
    .line 66
    iget-object v0, p0, LW2/f;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-ge v2, v0, :cond_4

    .line 73
    .line 74
    iget-object p0, p0, LW2/f;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 75
    .line 76
    invoke-virtual {p0, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    check-cast p0, LW2/e;

    .line 81
    .line 82
    invoke-virtual {p1}, LW2/e;->e()D

    .line 83
    .line 84
    .line 85
    move-result-wide v2

    .line 86
    invoke-virtual {p0, v2, v3}, LW2/e;->n(D)LW2/e;

    .line 87
    .line 88
    .line 89
    :cond_4
    invoke-interface {v1, p1}, LW2/i;->b(LW2/e;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public c(LW2/e;)V
    .locals 1

    .line 1
    iget-object v0, p0, LW2/f;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, LW2/f;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, LW2/i;

    .line 14
    .line 15
    invoke-interface {p0, p1}, LW2/i;->c(LW2/e;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public d(LW2/e;)V
    .locals 1

    .line 1
    iget-object v0, p0, LW2/f;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, LW2/f;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, LW2/i;

    .line 14
    .line 15
    invoke-interface {p0, p1}, LW2/i;->d(LW2/e;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public e(LW2/i;)LW2/f;
    .locals 2

    .line 1
    iget-object v0, p0, LW2/f;->a:LW2/k;

    .line 2
    .line 3
    invoke-virtual {v0}, LW2/b;->c()LW2/e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, LW2/e;->a(LW2/i;)LW2/e;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, LW2/f;->f:LW2/g;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, LW2/e;->q(LW2/g;)LW2/e;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, LW2/f;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, LW2/f;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    return-object p0
.end method

.method public h()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LW2/e;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LW2/f;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()LW2/e;
    .locals 1

    .line 1
    iget-object v0, p0, LW2/f;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    iget p0, p0, LW2/f;->d:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, LW2/e;

    .line 10
    .line 11
    return-object p0
.end method

.method public j(I)LW2/f;
    .locals 2

    .line 1
    iput p1, p0, LW2/f;->d:I

    .line 2
    .line 3
    iget-object v0, p0, LW2/f;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, LW2/e;

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object p1, p0, LW2/f;->a:LW2/k;

    .line 16
    .line 17
    invoke-virtual {p1}, LW2/b;->e()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, LW2/e;

    .line 36
    .line 37
    iget-object v1, p0, LW2/f;->f:LW2/g;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, LW2/e;->q(LW2/g;)LW2/e;

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {p0}, LW2/f;->i()LW2/e;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-object v0, p0, LW2/f;->e:LW2/g;

    .line 48
    .line 49
    invoke-virtual {p1, v0}, LW2/e;->q(LW2/g;)LW2/e;

    .line 50
    .line 51
    .line 52
    return-object p0
.end method
