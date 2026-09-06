.class public final Lcom/google/gson/internal/bind/b;
.super Ljava/lang/Object;
.source "CollectionTypeAdapterFactory.java"

# interfaces
.implements Lcom/google/gson/A;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/gson/internal/bind/b$a;
    }
.end annotation


# instance fields
.field private final g:LC3/w;


# direct methods
.method public constructor <init>(LC3/w;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/gson/internal/bind/b;->g:LC3/w;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/google/gson/f;Lcom/google/gson/reflect/a;)Lcom/google/gson/z;
    .locals 3
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
    const-class v2, Ljava/util/Collection;

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
    invoke-static {v0, v1}, LC3/b;->h(Ljava/lang/reflect/Type;Ljava/lang/Class;)Ljava/lang/reflect/Type;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lcom/google/gson/reflect/a;->get(Ljava/lang/reflect/Type;)Lcom/google/gson/reflect/a;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {p1, v1}, Lcom/google/gson/f;->l(Lcom/google/gson/reflect/a;)Lcom/google/gson/z;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    new-instance v2, Lcom/google/gson/internal/bind/o;

    .line 32
    .line 33
    invoke-direct {v2, p1, v1, v0}, Lcom/google/gson/internal/bind/o;-><init>(Lcom/google/gson/f;Lcom/google/gson/z;Ljava/lang/reflect/Type;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/google/gson/internal/bind/b;->g:LC3/w;

    .line 37
    .line 38
    invoke-virtual {p0, p2}, LC3/w;->v(Lcom/google/gson/reflect/a;)LC3/D;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    new-instance p1, Lcom/google/gson/internal/bind/b$a;

    .line 43
    .line 44
    invoke-direct {p1, v2, p0}, Lcom/google/gson/internal/bind/b$a;-><init>(Lcom/google/gson/z;LC3/D;)V

    .line 45
    .line 46
    .line 47
    return-object p1
.end method
