.class public final Lo0/o$a;
.super Ljava/lang/Object;
.source "EmbeddingCompat.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lo0/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lo0/o$a;-><init>()V

    return-void
.end method

.method public static synthetic a(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lo0/o$a;->d(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final c()Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;
    .locals 2

    .line 1
    const-class p0, Lo0/o;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-class v0, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 8
    .line 9
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Lo0/n;

    .line 14
    .line 15
    invoke-direct {v1}, Lo0/n;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, v0, v1}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "null cannot be cast to non-null type androidx.window.extensions.embedding.ActivityEmbeddingComponent"

    .line 23
    .line 24
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    check-cast p0, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 28
    .line 29
    return-object p0
.end method

.method private static final d(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Lh4/t;
    .locals 0

    .line 1
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final b()Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;
    .locals 5

    .line 1
    invoke-virtual {p0}, Lo0/o$a;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    const-class v0, Lo0/o;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    new-instance v1, Lo0/A;

    .line 16
    .line 17
    new-instance v2, Ln0/e;

    .line 18
    .line 19
    invoke-direct {v2, v0}, Ln0/e;-><init>(Ljava/lang/ClassLoader;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Landroidx/window/extensions/WindowExtensionsProvider;->getWindowExtensions()Landroidx/window/extensions/WindowExtensions;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    const-string v4, "getWindowExtensions()"

    .line 27
    .line 28
    invoke-static {v3, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-direct {v1, v0, v2, v3}, Lo0/A;-><init>(Ljava/lang/ClassLoader;Ln0/e;Landroidx/window/extensions/WindowExtensions;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Lo0/A;->e()Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-object v0

    .line 42
    :cond_1
    :goto_0
    invoke-direct {p0}, Lo0/o$a;->c()Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_2
    invoke-direct {p0}, Lo0/o$a;->c()Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method public final e()Z
    .locals 6

    .line 1
    const-string p0, "EmbeddingCompat"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    :try_start_0
    const-class v1, Lo0/o;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    new-instance v2, Lo0/A;

    .line 13
    .line 14
    new-instance v3, Ln0/e;

    .line 15
    .line 16
    invoke-direct {v3, v1}, Ln0/e;-><init>(Ljava/lang/ClassLoader;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Landroidx/window/extensions/WindowExtensionsProvider;->getWindowExtensions()Landroidx/window/extensions/WindowExtensions;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    const-string v5, "getWindowExtensions()"

    .line 24
    .line 25
    invoke-static {v4, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {v2, v1, v3, v4}, Lo0/A;-><init>(Ljava/lang/ClassLoader;Ln0/e;Landroidx/window/extensions/WindowExtensions;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2}, Lo0/A;->e()Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 32
    .line 33
    .line 34
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_0
    return v0

    .line 40
    :catch_0
    const-string v1, "Stub Extension"

    .line 41
    .line 42
    invoke-static {p0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catch_1
    const-string v1, "Embedding extension version not found"

    .line 47
    .line 48
    invoke-static {p0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    :goto_0
    return v0
.end method
