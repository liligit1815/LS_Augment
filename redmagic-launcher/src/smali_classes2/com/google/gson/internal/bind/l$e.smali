.class final Lcom/google/gson/internal/bind/l$e;
.super Lcom/google/gson/internal/bind/l$c;
.source "ReflectiveTypeAdapterFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/gson/internal/bind/l;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/gson/internal/bind/l$c<",
        "TT;TT;>;"
    }
.end annotation


# instance fields
.field private final b:LC3/D;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LC3/D<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(LC3/D;Lcom/google/gson/internal/bind/l$f;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LC3/D<",
            "TT;>;",
            "Lcom/google/gson/internal/bind/l$f;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2}, Lcom/google/gson/internal/bind/l$c;-><init>(Lcom/google/gson/internal/bind/l$f;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/gson/internal/bind/l$e;->b:LC3/D;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method e()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/gson/internal/bind/l$e;->b:LC3/D;

    .line 2
    .line 3
    invoke-interface {p0}, LC3/D;->a()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method f(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation

    .line 1
    return-object p1
.end method

.method g(Ljava/lang/Object;Lcom/google/gson/stream/JsonReader;Lcom/google/gson/internal/bind/l$d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/google/gson/stream/JsonReader;",
            "Lcom/google/gson/internal/bind/l$d;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p3, p2, p1}, Lcom/google/gson/internal/bind/l$d;->b(Lcom/google/gson/stream/JsonReader;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
