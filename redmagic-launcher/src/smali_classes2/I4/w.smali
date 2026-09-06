.class public final LI4/w;
.super Ljava/lang/Object;
.source "StateFlow.kt"


# static fields
.field private static final a:LK4/D;

.field private static final b:LK4/D;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LK4/D;

    .line 2
    .line 3
    const-string v1, "NONE"

    .line 4
    .line 5
    invoke-direct {v0, v1}, LK4/D;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, LI4/w;->a:LK4/D;

    .line 9
    .line 10
    new-instance v0, LK4/D;

    .line 11
    .line 12
    const-string v1, "PENDING"

    .line 13
    .line 14
    invoke-direct {v0, v1}, LK4/D;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, LI4/w;->b:LK4/D;

    .line 18
    .line 19
    return-void
.end method

.method public static final a(Ljava/lang/Object;)LI4/r;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "LI4/r<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, LI4/v;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, LJ4/s;->a:LK4/D;

    .line 6
    .line 7
    :cond_0
    invoke-direct {v0, p0}, LI4/v;-><init>(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static final synthetic b()LK4/D;
    .locals 1

    .line 1
    sget-object v0, LI4/w;->a:LK4/D;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic c()LK4/D;
    .locals 1

    .line 1
    sget-object v0, LI4/w;->b:LK4/D;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final d(LI4/u;Ll4/g;ILH4/a;)LI4/d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "LI4/u<",
            "+TT;>;",
            "Ll4/g;",
            "I",
            "LH4/a;",
            ")",
            "LI4/d<",
            "TT;>;"
        }
    .end annotation

    .line 1
    if-ltz p2, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ge p2, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, -0x2

    .line 8
    if-ne p2, v0, :cond_1

    .line 9
    .line 10
    :goto_0
    sget-object v0, LH4/a;->h:LH4/a;

    .line 11
    .line 12
    if-ne p3, v0, :cond_1

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    invoke-static {p0, p1, p2, p3}, LI4/t;->a(LI4/s;Ll4/g;ILH4/a;)LI4/d;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method
