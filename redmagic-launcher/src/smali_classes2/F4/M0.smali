.class public final LF4/M0;
.super Ljava/lang/Object;
.source "Supervisor.kt"


# direct methods
.method public static final a(LF4/u0;)LF4/t;
    .locals 1

    .line 1
    new-instance v0, LF4/L0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LF4/L0;-><init>(LF4/u0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic b(LF4/u0;ILjava/lang/Object;)LF4/t;
    .locals 0

    .line 1
    and-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    :cond_0
    invoke-static {p0}, LF4/M0;->a(LF4/u0;)LF4/t;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method
