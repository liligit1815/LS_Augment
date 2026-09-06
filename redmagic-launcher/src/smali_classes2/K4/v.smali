.class public final LK4/v;
.super LF4/E;
.source "NamedDispatcher.kt"

# interfaces
.implements LF4/S;


# instance fields
.field private final synthetic i:LF4/S;

.field private final j:LF4/E;

.field private final k:Ljava/lang/String;


# direct methods
.method public constructor <init>(LF4/E;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, LF4/E;-><init>()V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, LF4/S;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move-object v0, p1

    .line 9
    check-cast v0, LF4/S;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, LF4/O;->a()LF4/S;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :cond_1
    iput-object v0, p0, LK4/v;->i:LF4/S;

    .line 20
    .line 21
    iput-object p1, p0, LK4/v;->j:LF4/E;

    .line 22
    .line 23
    iput-object p2, p0, LK4/v;->k:Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public C(JLjava/lang/Runnable;Ll4/g;)LF4/b0;
    .locals 0

    .line 1
    iget-object p0, p0, LK4/v;->i:LF4/S;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3, p4}, LF4/S;->C(JLjava/lang/Runnable;Ll4/g;)LF4/b0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public a0(Ll4/g;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, LK4/v;->j:LF4/E;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, LF4/E;->a0(Ll4/g;Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b0(Ll4/g;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, LK4/v;->j:LF4/E;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, LF4/E;->b0(Ll4/g;Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c0(Ll4/g;)Z
    .locals 0

    .line 1
    iget-object p0, p0, LK4/v;->j:LF4/E;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LF4/E;->c0(Ll4/g;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LK4/v;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
