.class public final LI4/t;
.super Ljava/lang/Object;
.source "SharedFlow.kt"


# static fields
.field public static final a:LK4/D;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LK4/D;

    .line 2
    .line 3
    const-string v1, "NO_VALUE"

    .line 4
    .line 5
    invoke-direct {v0, v1}, LK4/D;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, LI4/t;->a:LK4/D;

    .line 9
    .line 10
    return-void
.end method

.method public static final a(LI4/s;Ll4/g;ILH4/a;)LI4/d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "LI4/s<",
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
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const/4 v0, -0x3

    .line 4
    if-ne p2, v0, :cond_1

    .line 5
    .line 6
    :cond_0
    sget-object v0, LH4/a;->g:LH4/a;

    .line 7
    .line 8
    if-ne p3, v0, :cond_1

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_1
    new-instance v0, LJ4/h;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1, p2, p3}, LJ4/h;-><init>(LI4/d;Ll4/g;ILH4/a;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method
