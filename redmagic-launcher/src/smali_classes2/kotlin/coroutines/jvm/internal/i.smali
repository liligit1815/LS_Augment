.class final Lkotlin/coroutines/jvm/internal/i;
.super Ljava/lang/Object;
.source "DebugMetadata.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/coroutines/jvm/internal/i$a;
    }
.end annotation


# static fields
.field public static final a:Lkotlin/coroutines/jvm/internal/i;

.field private static final b:Lkotlin/coroutines/jvm/internal/i$a;

.field private static c:Lkotlin/coroutines/jvm/internal/i$a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lkotlin/coroutines/jvm/internal/i;

    .line 2
    .line 3
    invoke-direct {v0}, Lkotlin/coroutines/jvm/internal/i;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lkotlin/coroutines/jvm/internal/i;->a:Lkotlin/coroutines/jvm/internal/i;

    .line 7
    .line 8
    new-instance v0, Lkotlin/coroutines/jvm/internal/i$a;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-direct {v0, v1, v1, v1}, Lkotlin/coroutines/jvm/internal/i$a;-><init>(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lkotlin/coroutines/jvm/internal/i;->b:Lkotlin/coroutines/jvm/internal/i$a;

    .line 15
    .line 16
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

.method private final a(Lkotlin/coroutines/jvm/internal/a;)Lkotlin/coroutines/jvm/internal/i$a;
    .locals 4

    .line 1
    :try_start_0
    const-class p0, Ljava/lang/Class;

    .line 2
    .line 3
    const-string v0, "getModule"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    new-array v2, v1, [Ljava/lang/Class;

    .line 7
    .line 8
    invoke-virtual {p0, v0, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v2, "java.lang.Module"

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v2, "getDescriptor"

    .line 27
    .line 28
    new-array v3, v1, [Ljava/lang/Class;

    .line 29
    .line 30
    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string v2, "java.lang.module.ModuleDescriptor"

    .line 43
    .line 44
    invoke-virtual {p1, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const-string v2, "name"

    .line 49
    .line 50
    new-array v1, v1, [Ljava/lang/Class;

    .line 51
    .line 52
    invoke-virtual {p1, v2, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    new-instance v1, Lkotlin/coroutines/jvm/internal/i$a;

    .line 57
    .line 58
    invoke-direct {v1, p0, v0, p1}, Lkotlin/coroutines/jvm/internal/i$a;-><init>(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V

    .line 59
    .line 60
    .line 61
    sput-object v1, Lkotlin/coroutines/jvm/internal/i;->c:Lkotlin/coroutines/jvm/internal/i$a;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .line 63
    return-object v1

    .line 64
    :catch_0
    sget-object p0, Lkotlin/coroutines/jvm/internal/i;->b:Lkotlin/coroutines/jvm/internal/i$a;

    .line 65
    .line 66
    sput-object p0, Lkotlin/coroutines/jvm/internal/i;->c:Lkotlin/coroutines/jvm/internal/i$a;

    .line 67
    .line 68
    return-object p0
.end method


# virtual methods
.method public final b(Lkotlin/coroutines/jvm/internal/a;)Ljava/lang/String;
    .locals 4

    .line 1
    const-string v0, "continuation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lkotlin/coroutines/jvm/internal/i;->c:Lkotlin/coroutines/jvm/internal/i$a;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, p1}, Lkotlin/coroutines/jvm/internal/i;->a(Lkotlin/coroutines/jvm/internal/a;)Lkotlin/coroutines/jvm/internal/i$a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :cond_0
    sget-object p0, Lkotlin/coroutines/jvm/internal/i;->b:Lkotlin/coroutines/jvm/internal/i$a;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-ne v0, p0, :cond_1

    .line 18
    .line 19
    return-object v1

    .line 20
    :cond_1
    iget-object p0, v0, Lkotlin/coroutines/jvm/internal/i$a;->a:Ljava/lang/reflect/Method;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-array v3, v2, [Ljava/lang/Object;

    .line 30
    .line 31
    invoke-virtual {p0, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    goto :goto_0

    .line 36
    :cond_2
    move-object p0, v1

    .line 37
    :goto_0
    if-nez p0, :cond_3

    .line 38
    .line 39
    return-object v1

    .line 40
    :cond_3
    iget-object p1, v0, Lkotlin/coroutines/jvm/internal/i$a;->b:Ljava/lang/reflect/Method;

    .line 41
    .line 42
    if-eqz p1, :cond_4

    .line 43
    .line 44
    new-array v3, v2, [Ljava/lang/Object;

    .line 45
    .line 46
    invoke-virtual {p1, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    goto :goto_1

    .line 51
    :cond_4
    move-object p0, v1

    .line 52
    :goto_1
    if-nez p0, :cond_5

    .line 53
    .line 54
    return-object v1

    .line 55
    :cond_5
    iget-object p1, v0, Lkotlin/coroutines/jvm/internal/i$a;->c:Ljava/lang/reflect/Method;

    .line 56
    .line 57
    if-eqz p1, :cond_6

    .line 58
    .line 59
    new-array v0, v2, [Ljava/lang/Object;

    .line 60
    .line 61
    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    goto :goto_2

    .line 66
    :cond_6
    move-object p0, v1

    .line 67
    :goto_2
    instance-of p1, p0, Ljava/lang/String;

    .line 68
    .line 69
    if-eqz p1, :cond_7

    .line 70
    .line 71
    check-cast p0, Ljava/lang/String;

    .line 72
    .line 73
    return-object p0

    .line 74
    :cond_7
    return-object v1
.end method
