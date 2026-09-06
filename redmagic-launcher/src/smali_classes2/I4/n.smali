.class final synthetic LI4/n;
.super Ljava/lang/Object;
.source "Emitters.kt"


# direct methods
.method public static final a(LI4/e;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI4/e<",
            "*>;)V"
        }
    .end annotation

    .line 1
    instance-of v0, p0, LI4/A;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    check-cast p0, LI4/A;

    .line 7
    .line 8
    iget-object p0, p0, LI4/A;->g:Ljava/lang/Throwable;

    .line 9
    .line 10
    throw p0
.end method
