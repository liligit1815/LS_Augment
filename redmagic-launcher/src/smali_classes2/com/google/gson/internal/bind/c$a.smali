.class Lcom/google/gson/internal/bind/c$a;
.super Ljava/lang/Object;
.source "DefaultDateTypeAdapter.java"

# interfaces
.implements Lcom/google/gson/A;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/gson/internal/bind/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/google/gson/f;Lcom/google/gson/reflect/a;)Lcom/google/gson/z;
    .locals 1
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
    invoke-virtual {p2}, Lcom/google/gson/reflect/a;->getRawType()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class p1, Ljava/util/Date;

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    if-ne p0, p1, :cond_0

    .line 9
    .line 10
    new-instance p0, Lcom/google/gson/internal/bind/c;

    .line 11
    .line 12
    sget-object p1, Lcom/google/gson/internal/bind/c$b;->b:Lcom/google/gson/internal/bind/c$b;

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    invoke-direct {p0, p1, v0, v0, p2}, Lcom/google/gson/internal/bind/c;-><init>(Lcom/google/gson/internal/bind/c$b;IILcom/google/gson/internal/bind/c$a;)V

    .line 16
    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    return-object p2
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "DefaultDateTypeAdapter#DEFAULT_STYLE_FACTORY"

    .line 2
    .line 3
    return-object p0
.end method
