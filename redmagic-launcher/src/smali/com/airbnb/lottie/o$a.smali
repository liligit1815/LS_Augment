.class Lcom/airbnb/lottie/o$a;
.super Ljava/util/concurrent/FutureTask;
.source "LottieTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/airbnb/lottie/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/FutureTask<",
        "Lv0/v<",
        "TT;>;>;"
    }
.end annotation


# instance fields
.field final synthetic g:Lcom/airbnb/lottie/o;


# direct methods
.method constructor <init>(Lcom/airbnb/lottie/o;Ljava/util/concurrent/Callable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable<",
            "Lv0/v<",
            "TT;>;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/airbnb/lottie/o$a;->g:Lcom/airbnb/lottie/o;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method protected done()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/util/concurrent/FutureTask;->isCancelled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/airbnb/lottie/o$a;->g:Lcom/airbnb/lottie/o;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lv0/v;

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/airbnb/lottie/o;->b(Lcom/airbnb/lottie/o;Lv0/v;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception v0

    .line 21
    iget-object p0, p0, Lcom/airbnb/lottie/o$a;->g:Lcom/airbnb/lottie/o;

    .line 22
    .line 23
    new-instance v1, Lv0/v;

    .line 24
    .line 25
    invoke-direct {v1, v0}, Lv0/v;-><init>(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p0, v1}, Lcom/airbnb/lottie/o;->b(Lcom/airbnb/lottie/o;Lv0/v;)V

    .line 29
    .line 30
    .line 31
    :goto_0
    return-void
.end method
