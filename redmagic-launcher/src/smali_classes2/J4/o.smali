.class public final LJ4/o;
.super Ljava/lang/Object;
.source "FlowExceptions.common.kt"


# direct methods
.method public static final a(LJ4/a;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, LJ4/a;->g:Ljava/lang/Object;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    throw p0
.end method
