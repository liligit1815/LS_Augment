.class public interface abstract LI1/a;
.super Ljava/lang/Object;
.source "SearchAlgorithm.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract a(Ljava/lang/String;LI1/b;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "LI1/b<",
            "TT;>;)V"
        }
    .end annotation
.end method

.method public b(Ljava/lang/String;[Ljava/lang/String;LI1/b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "LI1/b<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p0, p1, p3}, LI1/a;->a(Ljava/lang/String;LI1/b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public abstract cancel(Z)V
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method
