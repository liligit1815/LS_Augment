.class public final La5/a;
.super Ljava/lang/Object;
.source "Schedulers.java"


# static fields
.field private static final d:La5/a;


# instance fields
.field private final a:Lrx/e;

.field private final b:Lrx/e;

.field private final c:Lrx/e;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, La5/a;

    .line 2
    .line 3
    invoke-direct {v0}, La5/a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, La5/a;->d:La5/a;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, LZ4/d;->b()LZ4/d;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, LZ4/d;->e()LZ4/e;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, LZ4/e;->g()Lrx/e;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iput-object v1, p0, La5/a;->a:Lrx/e;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-static {}, LZ4/e;->a()Lrx/e;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iput-object v1, p0, La5/a;->a:Lrx/e;

    .line 26
    .line 27
    :goto_0
    invoke-virtual {v0}, LZ4/e;->i()Lrx/e;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    iput-object v1, p0, La5/a;->b:Lrx/e;

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    invoke-static {}, LZ4/e;->c()Lrx/e;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, p0, La5/a;->b:Lrx/e;

    .line 41
    .line 42
    :goto_1
    invoke-virtual {v0}, LZ4/e;->j()Lrx/e;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    iput-object v0, p0, La5/a;->c:Lrx/e;

    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-static {}, LZ4/e;->e()Lrx/e;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, La5/a;->c:Lrx/e;

    .line 56
    .line 57
    return-void
.end method

.method public static a()Lrx/e;
    .locals 1

    .line 1
    sget-object v0, La5/a;->d:La5/a;

    .line 2
    .line 3
    iget-object v0, v0, La5/a;->a:Lrx/e;

    .line 4
    .line 5
    return-object v0
.end method

.method public static b()Lrx/e;
    .locals 1

    .line 1
    sget-object v0, La5/a;->d:La5/a;

    .line 2
    .line 3
    iget-object v0, v0, La5/a;->b:Lrx/e;

    .line 4
    .line 5
    return-object v0
.end method
