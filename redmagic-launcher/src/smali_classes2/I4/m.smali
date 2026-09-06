.class final synthetic LI4/m;
.super Ljava/lang/Object;
.source "Distinct.kt"


# static fields
.field private static final a:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final b:Lu4/p;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/p<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LI4/k;

    .line 2
    .line 3
    invoke-direct {v0}, LI4/k;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LI4/m;->a:Lu4/l;

    .line 7
    .line 8
    new-instance v0, LI4/l;

    .line 9
    .line 10
    invoke-direct {v0}, LI4/l;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, LI4/m;->b:Lu4/p;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic a(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, LI4/m;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic b(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {p0}, LI4/m;->d(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final c(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static final d(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static final e(LI4/d;)LI4/d;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "LI4/d<",
            "+TT;>;)",
            "LI4/d<",
            "TT;>;"
        }
    .end annotation

    .line 1
    instance-of v0, p0, LI4/u;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    sget-object v0, LI4/m;->a:Lu4/l;

    .line 7
    .line 8
    sget-object v1, LI4/m;->b:Lu4/p;

    .line 9
    .line 10
    invoke-static {p0, v0, v1}, LI4/m;->g(LI4/d;Lu4/l;Lu4/p;)LI4/d;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static final f(LI4/d;Lu4/l;)LI4/d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "K:",
            "Ljava/lang/Object;",
            ">(",
            "LI4/d<",
            "+TT;>;",
            "Lu4/l<",
            "-TT;+TK;>;)",
            "LI4/d<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, LI4/m;->b:Lu4/p;

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, LI4/m;->g(LI4/d;Lu4/l;Lu4/p;)LI4/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private static final g(LI4/d;Lu4/l;Lu4/p;)LI4/d;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "LI4/d<",
            "+TT;>;",
            "Lu4/l<",
            "-TT;+",
            "Ljava/lang/Object;",
            ">;",
            "Lu4/p<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Boolean;",
            ">;)",
            "LI4/d<",
            "TT;>;"
        }
    .end annotation

    .line 1
    instance-of v0, p0, LI4/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, LI4/c;

    .line 7
    .line 8
    iget-object v1, v0, LI4/c;->h:Lu4/l;

    .line 9
    .line 10
    if-ne v1, p1, :cond_0

    .line 11
    .line 12
    iget-object v0, v0, LI4/c;->i:Lu4/p;

    .line 13
    .line 14
    if-ne v0, p2, :cond_0

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    new-instance v0, LI4/c;

    .line 18
    .line 19
    invoke-direct {v0, p0, p1, p2}, LI4/c;-><init>(LI4/d;Lu4/l;Lu4/p;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method
