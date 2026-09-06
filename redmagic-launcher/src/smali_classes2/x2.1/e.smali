.class public interface abstract Lx2/e;
.super Ljava/lang/Object;
.source "PluginListener.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lx2/c;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public G(Lx2/c;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    return-void
.end method

.method public P(Lx2/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lx2/d<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public T(Lx2/d;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lx2/d<",
            "TT;>;)Z"
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public W(Lx2/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    return-void
.end method

.method public u(Lx2/c;Landroid/content/Context;Lx2/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/content/Context;",
            "Lx2/d<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p0, p1, p2}, Lx2/e;->G(Lx2/c;Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public x(Lx2/c;Lx2/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lx2/d<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p0, p1}, Lx2/e;->W(Lx2/c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
