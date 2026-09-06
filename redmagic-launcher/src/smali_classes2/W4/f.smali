.class public final LW4/f;
.super Lrx/b;
.source "ScalarSynchronousObservable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LW4/f$f;,
        LW4/f$e;,
        LW4/f$d;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/b<",
        "TT;>;"
    }
.end annotation


# static fields
.field static final d:Z


# instance fields
.field final c:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "rx.just.strong-mode"

    .line 2
    .line 3
    const-string v1, "false"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    sput-boolean v0, LW4/f;->d:Z

    .line 18
    .line 19
    return-void
.end method

.method protected constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    new-instance v0, LW4/f$a;

    .line 2
    .line 3
    invoke-direct {v0, p1}, LW4/f$a;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lrx/b;-><init>(Lrx/b$a;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, LW4/f;->c:Ljava/lang/Object;

    .line 10
    .line 11
    return-void
.end method

.method public static n(Ljava/lang/Object;)LW4/f;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "LW4/f<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, LW4/f;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LW4/f;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method static o(Lrx/h;Ljava/lang/Object;)Lrx/d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/h<",
            "-TT;>;TT;)",
            "Lrx/d;"
        }
    .end annotation

    .line 1
    sget-boolean v0, LW4/f;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, LV4/c;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, LV4/c;-><init>(Lrx/h;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    new-instance v0, LW4/f$f;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1}, LW4/f$f;-><init>(Lrx/h;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method


# virtual methods
.method public p(Lrx/e;)Lrx/b;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/e;",
            ")",
            "Lrx/b<",
            "TT;>;"
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lrx/internal/schedulers/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lrx/internal/schedulers/b;

    .line 6
    .line 7
    new-instance v0, LW4/f$b;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, LW4/f$b;-><init>(LW4/f;Lrx/internal/schedulers/b;)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    new-instance v0, LW4/f$c;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, LW4/f$c;-><init>(LW4/f;Lrx/e;)V

    .line 16
    .line 17
    .line 18
    :goto_0
    new-instance p1, LW4/f$d;

    .line 19
    .line 20
    iget-object p0, p0, LW4/f;->c:Ljava/lang/Object;

    .line 21
    .line 22
    invoke-direct {p1, p0, v0}, LW4/f$d;-><init>(Ljava/lang/Object;LT4/c;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1}, Lrx/b;->a(Lrx/b$a;)Lrx/b;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method
