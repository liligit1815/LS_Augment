.class public final LF4/S0;
.super Ljava/util/concurrent/CancellationException;
.source "Timeout.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/CancellationException;"
    }
.end annotation


# instance fields
.field public final transient g:LF4/u0;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 3
    invoke-direct {p0, p1, v0}, LF4/S0;-><init>(Ljava/lang/String;LF4/u0;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;LF4/u0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    .line 2
    iput-object p2, p0, LF4/S0;->g:LF4/u0;

    return-void
.end method
