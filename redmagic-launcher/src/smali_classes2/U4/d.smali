.class public LU4/d;
.super Ljava/lang/Object;
.source "OnSubscribeSingle.java"

# interfaces
.implements Lrx/f$b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/f$b<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final a:Lrx/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/b<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/b<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LU4/d;->a:Lrx/b;

    .line 5
    .line 6
    return-void
.end method

.method public static b(Lrx/b;)LU4/d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/b<",
            "TT;>;)",
            "LU4/d<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, LU4/d;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LU4/d;-><init>(Lrx/b;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a(Lrx/g;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/g<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, LU4/d$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, LU4/d$a;-><init>(LU4/d;Lrx/g;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lrx/g;->a(Lrx/i;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, LU4/d;->a:Lrx/b;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lrx/b;->m(Lrx/h;)Lrx/i;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lrx/g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LU4/d;->a(Lrx/g;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
