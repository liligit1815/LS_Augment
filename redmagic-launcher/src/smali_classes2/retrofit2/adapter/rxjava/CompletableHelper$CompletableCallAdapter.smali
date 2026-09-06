.class Lretrofit2/adapter/rxjava/CompletableHelper$CompletableCallAdapter;
.super Ljava/lang/Object;
.source "CompletableHelper.java"

# interfaces
.implements Lretrofit2/CallAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lretrofit2/adapter/rxjava/CompletableHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "CompletableCallAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lretrofit2/CallAdapter<",
        "Lrx/a;",
        ">;"
    }
.end annotation


# instance fields
.field private final scheduler:Lrx/e;


# direct methods
.method constructor <init>(Lrx/e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lretrofit2/adapter/rxjava/CompletableHelper$CompletableCallAdapter;->scheduler:Lrx/e;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic adapt(Lretrofit2/Call;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lretrofit2/adapter/rxjava/CompletableHelper$CompletableCallAdapter;->adapt(Lretrofit2/Call;)Lrx/a;

    move-result-object p0

    return-object p0
.end method

.method public adapt(Lretrofit2/Call;)Lrx/a;
    .locals 1

    .line 2
    new-instance v0, Lretrofit2/adapter/rxjava/CompletableHelper$CompletableCallOnSubscribe;

    invoke-direct {v0, p1}, Lretrofit2/adapter/rxjava/CompletableHelper$CompletableCallOnSubscribe;-><init>(Lretrofit2/Call;)V

    invoke-static {v0}, Lrx/a;->a(Lrx/a$d;)Lrx/a;

    move-result-object p1

    .line 3
    iget-object p0, p0, Lretrofit2/adapter/rxjava/CompletableHelper$CompletableCallAdapter;->scheduler:Lrx/e;

    if-eqz p0, :cond_0

    .line 4
    invoke-virtual {p1, p0}, Lrx/a;->c(Lrx/e;)Lrx/a;

    move-result-object p0

    return-object p0

    :cond_0
    return-object p1
.end method

.method public responseType()Ljava/lang/reflect/Type;
    .locals 0

    .line 1
    const-class p0, Ljava/lang/Void;

    .line 2
    .line 3
    return-object p0
.end method
