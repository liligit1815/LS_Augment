.class public final LF4/T;
.super Ljava/lang/Object;
.source "Delay.kt"


# direct methods
.method public static final a(Ll4/g;)LF4/S;
    .locals 1

    .line 1
    sget-object v0, Ll4/e;->f:Ll4/e$b;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll4/g;->b(Ll4/g$c;)Ll4/g$b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    instance-of v0, p0, LF4/S;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    check-cast p0, LF4/S;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    :goto_0
    if-nez p0, :cond_1

    .line 16
    .line 17
    invoke-static {}, LF4/O;->a()LF4/S;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :cond_1
    return-object p0
.end method
