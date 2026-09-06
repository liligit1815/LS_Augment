.class public final LU4/e;
.super Ljava/lang/Object;
.source "OperatorMap.java"

# interfaces
.implements Lrx/b$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LU4/e$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/b$b<",
        "TR;TT;>;"
    }
.end annotation


# instance fields
.field final a:LT4/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LT4/c<",
            "-TT;+TR;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(LT4/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LT4/c<",
            "-TT;+TR;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LU4/e;->a:LT4/c;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lrx/h;)Lrx/h;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/h<",
            "-TR;>;)",
            "Lrx/h<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, LU4/e$a;

    .line 2
    .line 3
    iget-object p0, p0, LU4/e;->a:LT4/c;

    .line 4
    .line 5
    invoke-direct {v0, p1, p0}, LU4/e$a;-><init>(Lrx/h;LT4/c;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lrx/h;->add(Lrx/i;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lrx/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LU4/e;->a(Lrx/h;)Lrx/h;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
