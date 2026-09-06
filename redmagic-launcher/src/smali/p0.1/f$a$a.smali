.class final Lp0/f$a$a;
.super Lkotlin/jvm/internal/p;
.source "WindowInfoTracker.kt"

# interfaces
.implements Lu4/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lp0/f$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/p;",
        "Lu4/a<",
        "Lq0/a;",
        ">;"
    }
.end annotation


# static fields
.field public static final h:Lp0/f$a$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lp0/f$a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lp0/f$a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lp0/f$a$a;->h:Lp0/f$a$a;

    .line 7
    .line 8
    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lkotlin/jvm/internal/p;-><init>(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public final a()Lq0/a;
    .locals 5

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    const-class v0, Lp0/f;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v1, Lp0/e;

    .line 11
    .line 12
    new-instance v2, Ln0/e;

    .line 13
    .line 14
    invoke-direct {v2, v0}, Ln0/e;-><init>(Ljava/lang/ClassLoader;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {v1, v0, v2}, Lp0/e;-><init>(Ljava/lang/ClassLoader;Ln0/e;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move-object v1, p0

    .line 22
    :goto_0
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1}, Lp0/e;->g()Landroidx/window/extensions/layout/WindowLayoutComponent;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    sget-object v2, Lr0/a;->a:Lr0/a$a;

    .line 31
    .line 32
    new-instance v3, Ln0/e;

    .line 33
    .line 34
    const-string v4, "loader"

    .line 35
    .line 36
    invoke-static {v0, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {v3, v0}, Ln0/e;-><init>(Ljava/lang/ClassLoader;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, v1, v3}, Lr0/a$a;->a(Landroidx/window/extensions/layout/WindowLayoutComponent;Ln0/e;)Lq0/a;

    .line 43
    .line 44
    .line 45
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    :cond_1
    return-object p0

    .line 47
    :catchall_0
    invoke-static {}, Lp0/f$a;->a()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-static {}, Lp0/f$a;->b()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string v1, "Failed to load WindowExtensions"

    .line 58
    .line 59
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    :cond_2
    return-object p0
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lp0/f$a$a;->a()Lq0/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
