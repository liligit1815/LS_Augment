.class public final LK0/a;
.super Ljava/lang/Object;
.source "TraceUtils.kt"


# direct methods
.method public static final a(Ljava/lang/String;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UnclosedTrace"
        }
    .end annotation

    .line 1
    const-string v0, "sliceName"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x1000

    .line 7
    .line 8
    invoke-static {v0, v1, p0}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static final b()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x1000

    .line 2
    .line 3
    invoke-static {v0, v1}, Landroid/os/Trace;->traceEnd(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
