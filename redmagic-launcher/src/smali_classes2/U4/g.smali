.class public final LU4/g;
.super Ljava/lang/Object;
.source "OperatorOnErrorResumeNextViaFunction.java"

# interfaces
.implements Lrx/b$b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/b$b<",
        "TT;TT;>;"
    }
.end annotation


# instance fields
.field final a:LT4/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LT4/c<",
            "Ljava/lang/Throwable;",
            "+",
            "Lrx/b<",
            "+TT;>;>;"
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
            "Ljava/lang/Throwable;",
            "+",
            "Lrx/b<",
            "+TT;>;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LU4/g;->a:LT4/c;

    .line 5
    .line 6
    return-void
.end method

.method public static b(LT4/c;)LU4/g;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "LT4/c<",
            "Ljava/lang/Throwable;",
            "+TT;>;)",
            "LU4/g<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, LU4/g;

    .line 2
    .line 3
    new-instance v1, LU4/g$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, LU4/g$a;-><init>(LT4/c;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, LU4/g;-><init>(LT4/c;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public a(Lrx/h;)Lrx/h;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/h<",
            "-TT;>;)",
            "Lrx/h<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, LV4/a;

    .line 2
    .line 3
    invoke-direct {v0}, LV4/a;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lb5/d;

    .line 7
    .line 8
    invoke-direct {v1}, Lb5/d;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, LU4/g$b;

    .line 12
    .line 13
    invoke-direct {v2, p0, p1, v0, v1}, LU4/g$b;-><init>(LU4/g;Lrx/h;LV4/a;Lb5/d;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v2}, Lb5/d;->a(Lrx/i;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v1}, Lrx/h;->add(Lrx/i;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Lrx/h;->setProducer(Lrx/d;)V

    .line 23
    .line 24
    .line 25
    return-object v2
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lrx/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LU4/g;->a(Lrx/h;)Lrx/h;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
