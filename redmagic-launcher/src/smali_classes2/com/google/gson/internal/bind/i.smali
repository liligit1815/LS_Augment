.class public final Lcom/google/gson/internal/bind/i;
.super Ljava/lang/Object;
.source "MapTypeAdapterFactory.java"

# interfaces
.implements Lcom/google/gson/A;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/gson/internal/bind/i$a;
    }
.end annotation


# instance fields
.field private final g:LC3/w;

.field final h:Z


# direct methods
.method public constructor <init>(LC3/w;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/gson/internal/bind/i;->g:LC3/w;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/google/gson/internal/bind/i;->h:Z

    .line 7
    .line 8
    return-void
.end method

.method private b(Lcom/google/gson/f;Ljava/lang/reflect/Type;)Lcom/google/gson/z;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson/f;",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lcom/google/gson/z<",
            "*>;"
        }
    .end annotation

    .line 1
    sget-object p0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 2
    .line 3
    if-eq p2, p0, :cond_1

    .line 4
    .line 5
    const-class p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    if-ne p2, p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {p2}, Lcom/google/gson/reflect/a;->get(Ljava/lang/reflect/Type;)Lcom/google/gson/reflect/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Lcom/google/gson/f;->l(Lcom/google/gson/reflect/a;)Lcom/google/gson/z;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_1
    :goto_0
    sget-object p0, Lcom/google/gson/internal/bind/p;->f:Lcom/google/gson/z;

    .line 20
    .line 21
    return-object p0
.end method


# virtual methods
.method public a(Lcom/google/gson/f;Lcom/google/gson/reflect/a;)Lcom/google/gson/z;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/gson/f;",
            "Lcom/google/gson/reflect/a<",
            "TT;>;)",
            "Lcom/google/gson/z<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lcom/google/gson/reflect/a;->getType()Ljava/lang/reflect/Type;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p2}, Lcom/google/gson/reflect/a;->getRawType()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-class v2, Ljava/util/Map;

    .line 10
    .line 11
    invoke-virtual {v2, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0

    .line 19
    :cond_0
    invoke-static {v0, v1}, LC3/b;->j(Ljava/lang/reflect/Type;Ljava/lang/Class;)[Ljava/lang/reflect/Type;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x0

    .line 24
    aget-object v1, v0, v1

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    aget-object v0, v0, v2

    .line 28
    .line 29
    invoke-direct {p0, p1, v1}, Lcom/google/gson/internal/bind/i;->b(Lcom/google/gson/f;Ljava/lang/reflect/Type;)Lcom/google/gson/z;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    new-instance v3, Lcom/google/gson/internal/bind/o;

    .line 34
    .line 35
    invoke-direct {v3, p1, v2, v1}, Lcom/google/gson/internal/bind/o;-><init>(Lcom/google/gson/f;Lcom/google/gson/z;Ljava/lang/reflect/Type;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0}, Lcom/google/gson/reflect/a;->get(Ljava/lang/reflect/Type;)Lcom/google/gson/reflect/a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p1, v1}, Lcom/google/gson/f;->l(Lcom/google/gson/reflect/a;)Lcom/google/gson/z;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    new-instance v2, Lcom/google/gson/internal/bind/o;

    .line 47
    .line 48
    invoke-direct {v2, p1, v1, v0}, Lcom/google/gson/internal/bind/o;-><init>(Lcom/google/gson/f;Lcom/google/gson/z;Ljava/lang/reflect/Type;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/google/gson/internal/bind/i;->g:LC3/w;

    .line 52
    .line 53
    invoke-virtual {p1, p2}, LC3/w;->v(Lcom/google/gson/reflect/a;)LC3/D;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    new-instance p2, Lcom/google/gson/internal/bind/i$a;

    .line 58
    .line 59
    invoke-direct {p2, p0, v3, v2, p1}, Lcom/google/gson/internal/bind/i$a;-><init>(Lcom/google/gson/internal/bind/i;Lcom/google/gson/z;Lcom/google/gson/z;LC3/D;)V

    .line 60
    .line 61
    .line 62
    return-object p2
.end method
