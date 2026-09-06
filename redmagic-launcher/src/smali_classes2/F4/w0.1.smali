.class public LF4/w0;
.super LF4/A0;
.source "JobSupport.kt"

# interfaces
.implements LF4/t;


# instance fields
.field private final i:Z


# direct methods
.method public constructor <init>(LF4/u0;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, LF4/A0;-><init>(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p1}, LF4/A0;->h0(LF4/u0;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, LF4/w0;->L0()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iput-boolean p1, p0, LF4/w0;->i:Z

    .line 13
    .line 14
    return-void
.end method

.method private final L0()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, LF4/A0;->b0()LF4/q;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, LF4/r;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    check-cast p0, LF4/r;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move-object p0, v1

    .line 14
    :goto_0
    const/4 v0, 0x0

    .line 15
    if-eqz p0, :cond_4

    .line 16
    .line 17
    invoke-virtual {p0}, LF4/z0;->s()LF4/A0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    goto :goto_2

    .line 24
    :cond_1
    invoke-virtual {p0}, LF4/A0;->X()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_2

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_2
    invoke-virtual {p0}, LF4/A0;->b0()LF4/q;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    instance-of v2, p0, LF4/r;

    .line 37
    .line 38
    if-eqz v2, :cond_3

    .line 39
    .line 40
    check-cast p0, LF4/r;

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_3
    move-object p0, v1

    .line 44
    :goto_1
    if-eqz p0, :cond_4

    .line 45
    .line 46
    invoke-virtual {p0}, LF4/z0;->s()LF4/A0;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    if-nez p0, :cond_1

    .line 51
    .line 52
    :cond_4
    :goto_2
    return v0
.end method


# virtual methods
.method public X()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LF4/w0;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public Y()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
