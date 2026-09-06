.class public final Lcom/android/quickstep/utils/CreateTransactionHelper;
.super Ljava/lang/Object;
.source "CreateTransactionHelper.java"


# static fields
.field private static final MAX_TRANSACTION_COUNT:I = 0xa


# instance fields
.field private final mTransactionQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/android/quickstep/util/SurfaceTransaction;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/utils/CreateTransactionHelper;->mTransactionQueue:Ljava/util/LinkedList;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final createSurfaceTransaction()Lcom/android/quickstep/util/SurfaceTransaction;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/utils/CreateTransactionHelper;->mTransactionQueue:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0xa

    .line 8
    .line 9
    if-ge v0, v1, :cond_0

    .line 10
    .line 11
    new-instance v0, Lcom/android/quickstep/util/SurfaceTransaction;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/android/quickstep/util/SurfaceTransaction;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/quickstep/utils/CreateTransactionHelper;->mTransactionQueue:Ljava/util/LinkedList;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/utils/CreateTransactionHelper;->mTransactionQueue:Ljava/util/LinkedList;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/LinkedList;->pop()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/android/quickstep/util/SurfaceTransaction;

    .line 29
    .line 30
    const-string v1, "mTransactionQueue.pop()"

    .line 31
    .line 32
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/quickstep/utils/CreateTransactionHelper;->mTransactionQueue:Ljava/util/LinkedList;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    return-object v0
.end method
