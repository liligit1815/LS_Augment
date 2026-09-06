.class public final LF/e;
.super Ljava/lang/Object;
.source "LocaleListCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LF/e$b;,
        LF/e$a;
    }
.end annotation


# static fields
.field private static final b:LF/e;


# instance fields
.field private final a:LF/f;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ljava/util/Locale;

    .line 3
    .line 4
    invoke-static {v0}, LF/e;->a([Ljava/util/Locale;)LF/e;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sput-object v0, LF/e;->b:LF/e;

    .line 9
    .line 10
    return-void
.end method

.method private constructor <init>(LF/f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LF/e;->a:LF/f;

    .line 5
    .line 6
    return-void
.end method

.method public static varargs a([Ljava/util/Locale;)LF/e;
    .locals 0

    .line 1
    invoke-static {p0}, LF/e$b;->a([Ljava/util/Locale;)Landroid/os/LocaleList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, LF/e;->h(Landroid/os/LocaleList;)LF/e;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static b(Ljava/lang/String;)LF/e;
    .locals 4

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    const-string v0, ","

    .line 11
    .line 12
    const/4 v1, -0x1

    .line 13
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    array-length v0, p0

    .line 18
    new-array v1, v0, [Ljava/util/Locale;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    :goto_0
    if-ge v2, v0, :cond_1

    .line 22
    .line 23
    aget-object v3, p0, v2

    .line 24
    .line 25
    invoke-static {v3}, LF/e$a;->a(Ljava/lang/String;)Ljava/util/Locale;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    aput-object v3, v1, v2

    .line 30
    .line 31
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-static {v1}, LF/e;->a([Ljava/util/Locale;)LF/e;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_2
    :goto_1
    invoke-static {}, LF/e;->d()LF/e;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public static d()LF/e;
    .locals 1

    .line 1
    sget-object v0, LF/e;->b:LF/e;

    .line 2
    .line 3
    return-object v0
.end method

.method public static h(Landroid/os/LocaleList;)LF/e;
    .locals 2

    .line 1
    new-instance v0, LF/e;

    .line 2
    .line 3
    new-instance v1, LF/g;

    .line 4
    .line 5
    invoke-direct {v1, p0}, LF/g;-><init>(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, LF/e;-><init>(LF/f;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public c(I)Ljava/util/Locale;
    .locals 0

    .line 1
    iget-object p0, p0, LF/e;->a:LF/f;

    .line 2
    .line 3
    invoke-interface {p0, p1}, LF/f;->get(I)Ljava/util/Locale;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, LF/e;->a:LF/f;

    .line 2
    .line 3
    invoke-interface {p0}, LF/f;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, LF/e;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, LF/e;->a:LF/f;

    .line 6
    .line 7
    check-cast p1, LF/e;

    .line 8
    .line 9
    iget-object p1, p1, LF/e;->a:LF/f;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget-object p0, p0, LF/e;->a:LF/f;

    .line 2
    .line 3
    invoke-interface {p0}, LF/f;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LF/e;->a:LF/f;

    .line 2
    .line 3
    invoke-interface {p0}, LF/f;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, LF/e;->a:LF/f;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

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
    iget-object p0, p0, LF/e;->a:LF/f;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
