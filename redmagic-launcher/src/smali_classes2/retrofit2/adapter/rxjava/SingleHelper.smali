.class final Lretrofit2/adapter/rxjava/SingleHelper;
.super Ljava/lang/Object;
.source "SingleHelper.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static makeSingle(Lretrofit2/CallAdapter;)Lretrofit2/CallAdapter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lretrofit2/CallAdapter<",
            "Lrx/b<",
            "*>;>;)",
            "Lretrofit2/CallAdapter<",
            "Lrx/f<",
            "*>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lretrofit2/adapter/rxjava/SingleHelper$1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lretrofit2/adapter/rxjava/SingleHelper$1;-><init>(Lretrofit2/CallAdapter;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
