.class public final LU4/c;
.super Ljava/lang/Object;
.source "OnSubscribeLift.java"

# interfaces
.implements Lrx/b$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/b$a<",
        "TR;>;"
    }
.end annotation


# static fields
.field static final c:LZ4/b;


# instance fields
.field final a:Lrx/b$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/b$a<",
            "TT;>;"
        }
    .end annotation
.end field

.field final b:Lrx/b$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/b$b<",
            "+TR;-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, LZ4/d;->b()LZ4/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, LZ4/d;->c()LZ4/b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, LU4/c;->c:LZ4/b;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Lrx/b$a;Lrx/b$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/b$a<",
            "TT;>;",
            "Lrx/b$b<",
            "+TR;-TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LU4/c;->a:Lrx/b$a;

    .line 5
    .line 6
    iput-object p2, p0, LU4/c;->b:Lrx/b$b;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lrx/h;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/h<",
            "-TR;>;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    sget-object v0, LU4/c;->c:LZ4/b;

    .line 2
    .line 3
    iget-object v1, p0, LU4/c;->b:Lrx/b$b;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, LZ4/b;->b(Lrx/b$b;)Lrx/b$b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0, p1}, LT4/c;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lrx/h;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 14
    .line 15
    :try_start_1
    invoke-virtual {v0}, Lrx/h;->onStart()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, LU4/c;->a:Lrx/b$a;

    .line 19
    .line 20
    invoke-interface {p0, v0}, LT4/b;->call(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    :try_start_2
    invoke-static {p0}, LS4/b;->d(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {v0, p0}, Lrx/c;->onError(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_1
    move-exception p0

    .line 33
    invoke-static {p0}, LS4/b;->d(Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {p1, p0}, Lrx/c;->onError(Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lrx/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LU4/c;->a(Lrx/h;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
