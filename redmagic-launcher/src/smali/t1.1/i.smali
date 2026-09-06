.class public final Lt1/i;
.super Ljava/lang/Object;
.source "CachedObjectCachingLogic.kt"

# interfaces
.implements Lt1/j;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lt1/j<",
        "Lt1/h;",
        ">;"
    }
.end annotation


# static fields
.field public static final a:Lt1/i;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lt1/i;

    .line 2
    .line 3
    invoke-direct {v0}, Lt1/i;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lt1/i;->a:Lt1/i;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    check-cast p1, Lt1/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lt1/i;->l(Lt1/h;)Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic c(Ljava/lang/Object;Ls1/T;)Ljava/lang/String;
    .locals 0

    .line 1
    check-cast p1, Lt1/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lt1/i;->k(Lt1/h;Ls1/T;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic d(Landroid/content/Context;Lt1/f;Ljava/lang/Object;)Ls1/d;
    .locals 0

    .line 1
    check-cast p3, Lt1/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lt1/i;->n(Landroid/content/Context;Lt1/f;Lt1/h;)Ls1/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic e(Landroid/content/Context;Ljava/lang/Object;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    check-cast p2, Lt1/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lt1/i;->o(Landroid/content/Context;Lt1/h;)Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic f(Ljava/lang/Object;)Landroid/content/pm/ApplicationInfo;
    .locals 0

    .line 1
    check-cast p1, Lt1/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lt1/i;->i(Lt1/h;)Landroid/content/pm/ApplicationInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic g(Ljava/lang/Object;)Landroid/os/UserHandle;
    .locals 0

    .line 1
    check-cast p1, Lt1/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lt1/i;->m(Lt1/h;)Landroid/os/UserHandle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic h(Ljava/lang/Object;)Landroid/content/ComponentName;
    .locals 0

    .line 1
    check-cast p1, Lt1/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lt1/i;->j(Lt1/h;)Landroid/content/ComponentName;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public i(Lt1/h;)Landroid/content/pm/ApplicationInfo;
    .locals 0

    .line 1
    const-string p0, "info"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Lt1/h;->a()Landroid/content/pm/ApplicationInfo;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public j(Lt1/h;)Landroid/content/ComponentName;
    .locals 0

    .line 1
    const-string p0, "info"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Lt1/h;->g()Landroid/content/ComponentName;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string p1, "getComponent(...)"

    .line 11
    .line 12
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public k(Lt1/h;Ls1/T;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "item"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "provider"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1, p2}, Lt1/h;->b(Ls1/T;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public l(Lt1/h;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    const-string p0, "info"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Lt1/h;->getLabel()Ljava/lang/CharSequence;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public m(Lt1/h;)Landroid/os/UserHandle;
    .locals 0

    .line 1
    const-string p0, "info"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Lt1/h;->e()Landroid/os/UserHandle;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string p1, "getUser(...)"

    .line 11
    .line 12
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public n(Landroid/content/Context;Lt1/f;Lt1/h;)Ls1/d;
    .locals 2

    .line 1
    const-string p0, "context"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "cache"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "info"

    .line 12
    .line 13
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p3, p2}, Lt1/h;->h(Lt1/f;)Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    sget-object p0, Ls1/d;->i:Ls1/d;

    .line 23
    .line 24
    const-string p1, "LOW_RES_INFO"

    .line 25
    .line 26
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_0
    invoke-virtual {p2}, Lt1/f;->v()Ls1/b;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    :try_start_0
    new-instance v0, Ls1/b$c;

    .line 35
    .line 36
    invoke-direct {v0}, Ls1/b$c;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-interface {p3}, Lt1/h;->e()Landroid/os/UserHandle;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Ls1/b$c;->e(Landroid/os/UserHandle;)Ls1/b$c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sget-object v1, Lt1/i;->a:Lt1/i;

    .line 48
    .line 49
    invoke-interface {v1, p3, p2}, Lt1/j;->b(Ljava/lang/Object;Lt1/f;)Ls1/n0;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-virtual {v0, p2}, Ls1/b$c;->d(Ls1/n0;)Ls1/b$c;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-virtual {p1, p0, p2}, Ls1/b;->e(Landroid/graphics/drawable/Drawable;Ls1/b$c;)Ls1/d;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p2, "createBadgedIconBitmap(...)"

    .line 62
    .line 63
    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    .line 65
    .line 66
    const/4 p2, 0x0

    .line 67
    invoke-static {p1, p2}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    return-object p0

    .line 71
    :catchall_0
    move-exception p0

    .line 72
    :try_start_1
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 73
    :catchall_1
    move-exception p2

    .line 74
    invoke-static {p1, p0}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    throw p2
.end method

.method public o(Landroid/content/Context;Lt1/h;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    const-string p0, "context"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "object"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method
