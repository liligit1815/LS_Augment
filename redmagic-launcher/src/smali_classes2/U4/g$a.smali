.class final LU4/g$a;
.super Ljava/lang/Object;
.source "OperatorOnErrorResumeNextViaFunction.java"

# interfaces
.implements LT4/c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LU4/g;->b(LT4/c;)LU4/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LT4/c<",
        "Ljava/lang/Throwable;",
        "Lrx/b<",
        "+TT;>;>;"
    }
.end annotation


# instance fields
.field final synthetic a:LT4/c;


# direct methods
.method constructor <init>(LT4/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, LU4/g$a;->a:LT4/c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Throwable;)Lrx/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            ")",
            "Lrx/b<",
            "+TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LU4/g$a;->a:LT4/c;

    .line 2
    .line 3
    invoke-interface {p0, p1}, LT4/c;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lrx/b;->b(Ljava/lang/Object;)Lrx/b;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Throwable;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LU4/g$a;->a(Ljava/lang/Throwable;)Lrx/b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
