.class public final LI4/q$c;
.super Ljava/lang/Object;
.source "SafeCollector.common.kt"

# interfaces
.implements LI4/d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LI4/q;->e(LI4/d;LI4/d;Lu4/q;)LI4/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LI4/d<",
        "TR;>;"
    }
.end annotation


# instance fields
.field final synthetic g:LI4/d;

.field final synthetic h:LI4/d;

.field final synthetic i:Lu4/q;


# direct methods
.method public constructor <init>(LI4/d;LI4/d;Lu4/q;)V
    .locals 0

    .line 1
    iput-object p1, p0, LI4/q$c;->g:LI4/d;

    .line 2
    .line 3
    iput-object p2, p0, LI4/q$c;->h:LI4/d;

    .line 4
    .line 5
    iput-object p3, p0, LI4/q$c;->i:Lu4/q;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public collect(LI4/e;Ll4/d;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI4/e<",
            "-TR;>;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LI4/q$c;->g:LI4/d;

    .line 2
    .line 3
    iget-object v1, p0, LI4/q$c;->h:LI4/d;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    new-array v2, v2, [LI4/d;

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    aput-object v0, v2, v3

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    aput-object v1, v2, v0

    .line 13
    .line 14
    invoke-static {}, LI4/q;->a()Lu4/a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, LI4/q$d;

    .line 19
    .line 20
    iget-object p0, p0, LI4/q$c;->i:Lu4/q;

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-direct {v1, p0, v3}, LI4/q$d;-><init>(Lu4/q;Ll4/d;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v2, v0, v1, p2}, LJ4/k;->a(LI4/e;[LI4/d;Lu4/a;Lu4/q;Ll4/d;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-ne p0, p1, :cond_0

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 38
    .line 39
    return-object p0
.end method
