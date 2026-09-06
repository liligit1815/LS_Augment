.class public Lkotlin/jvm/internal/D;
.super Ljava/lang/Object;
.source "Reflection.java"


# static fields
.field private static final a:Lkotlin/jvm/internal/E;

.field private static final b:[LB4/c;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    const-string v1, "kotlin.reflect.jvm.internal.ReflectionFactoryImpl"

    .line 3
    .line 4
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lkotlin/jvm/internal/E;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    move-object v0, v1

    .line 15
    :catch_0
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance v0, Lkotlin/jvm/internal/E;

    .line 19
    .line 20
    invoke-direct {v0}, Lkotlin/jvm/internal/E;-><init>()V

    .line 21
    .line 22
    .line 23
    :goto_0
    sput-object v0, Lkotlin/jvm/internal/D;->a:Lkotlin/jvm/internal/E;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    new-array v0, v0, [LB4/c;

    .line 27
    .line 28
    sput-object v0, Lkotlin/jvm/internal/D;->b:[LB4/c;

    .line 29
    .line 30
    return-void
.end method

.method public static a(Lkotlin/jvm/internal/l;)LB4/f;
    .locals 1

    .line 1
    sget-object v0, Lkotlin/jvm/internal/D;->a:Lkotlin/jvm/internal/E;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lkotlin/jvm/internal/E;->a(Lkotlin/jvm/internal/l;)LB4/f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static b(Ljava/lang/Class;)LB4/c;
    .locals 1

    .line 1
    sget-object v0, Lkotlin/jvm/internal/D;->a:Lkotlin/jvm/internal/E;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lkotlin/jvm/internal/E;->b(Ljava/lang/Class;)LB4/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static c(Ljava/lang/Class;)LB4/e;
    .locals 2

    .line 1
    sget-object v0, Lkotlin/jvm/internal/D;->a:Lkotlin/jvm/internal/E;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, p0, v1}, Lkotlin/jvm/internal/E;->c(Ljava/lang/Class;Ljava/lang/String;)LB4/e;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static d(Lkotlin/jvm/internal/q;)LB4/h;
    .locals 1

    .line 1
    sget-object v0, Lkotlin/jvm/internal/D;->a:Lkotlin/jvm/internal/E;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lkotlin/jvm/internal/E;->d(Lkotlin/jvm/internal/q;)LB4/h;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static e(Lkotlin/jvm/internal/u;)LB4/j;
    .locals 1

    .line 1
    sget-object v0, Lkotlin/jvm/internal/D;->a:Lkotlin/jvm/internal/E;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lkotlin/jvm/internal/E;->e(Lkotlin/jvm/internal/u;)LB4/j;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static f(Lkotlin/jvm/internal/w;)LB4/k;
    .locals 1

    .line 1
    sget-object v0, Lkotlin/jvm/internal/D;->a:Lkotlin/jvm/internal/E;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lkotlin/jvm/internal/E;->f(Lkotlin/jvm/internal/w;)LB4/k;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static g(Lkotlin/jvm/internal/k;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lkotlin/jvm/internal/D;->a:Lkotlin/jvm/internal/E;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lkotlin/jvm/internal/E;->g(Lkotlin/jvm/internal/k;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static h(Lkotlin/jvm/internal/p;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lkotlin/jvm/internal/D;->a:Lkotlin/jvm/internal/E;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lkotlin/jvm/internal/E;->h(Lkotlin/jvm/internal/p;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
