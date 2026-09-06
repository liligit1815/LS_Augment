.class public final LI4/q$a;
.super Ljava/lang/Object;
.source "SafeCollector.common.kt"

# interfaces
.implements LI4/d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LI4/q;->c(LI4/d;LI4/d;LI4/d;Lu4/r;)LI4/d;
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
.field final synthetic g:[LI4/d;

.field final synthetic h:Lu4/r;


# direct methods
.method public constructor <init>([LI4/d;Lu4/r;)V
    .locals 0

    .line 1
    iput-object p1, p0, LI4/q$a;->g:[LI4/d;

    .line 2
    .line 3
    iput-object p2, p0, LI4/q$a;->h:Lu4/r;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public collect(LI4/e;Ll4/d;)Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, LI4/q$a;->g:[LI4/d;

    .line 2
    .line 3
    invoke-static {}, LI4/q;->a()Lu4/a;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v2, LI4/q$a$a;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    iget-object p0, p0, LI4/q$a;->h:Lu4/r;

    .line 11
    .line 12
    invoke-direct {v2, v3, p0}, LI4/q$a$a;-><init>(Ll4/d;Lu4/r;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0, v1, v2, p2}, LJ4/k;->a(LI4/e;[LI4/d;Lu4/a;Lu4/q;Ll4/d;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-ne p0, p1, :cond_0

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 27
    .line 28
    return-object p0
.end method
