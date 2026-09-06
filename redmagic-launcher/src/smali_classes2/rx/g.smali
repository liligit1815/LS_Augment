.class public abstract Lrx/g;
.super Ljava/lang/Object;
.source "SingleSubscriber.java"

# interfaces
.implements Lrx/i;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/i;"
    }
.end annotation


# instance fields
.field private final g:LW4/g;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, LW4/g;

    .line 5
    .line 6
    invoke-direct {v0}, LW4/g;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lrx/g;->g:LW4/g;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a(Lrx/i;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/g;->g:LW4/g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LW4/g;->a(Lrx/i;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public abstract b(Ljava/lang/Throwable;)V
.end method

.method public abstract c(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method public final isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/g;->g:LW4/g;

    .line 2
    .line 3
    invoke-virtual {p0}, LW4/g;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final unsubscribe()V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/g;->g:LW4/g;

    .line 2
    .line 3
    invoke-virtual {p0}, LW4/g;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
