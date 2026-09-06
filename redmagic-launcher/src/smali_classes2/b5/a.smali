.class public final Lb5/a;
.super Ljava/lang/Object;
.source "BooleanSubscription.java"

# interfaces
.implements Lrx/i;


# static fields
.field static final h:LT4/a;


# instance fields
.field final g:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "LT4/a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lb5/a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lb5/a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lb5/a;->h:LT4/a;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lb5/a;->g:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method private constructor <init>(LT4/a;)V
    .locals 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lb5/a;->g:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method public static a()Lb5/a;
    .locals 1

    .line 1
    new-instance v0, Lb5/a;

    .line 2
    .line 3
    invoke-direct {v0}, Lb5/a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static b(LT4/a;)Lb5/a;
    .locals 1

    .line 1
    new-instance v0, Lb5/a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lb5/a;-><init>(LT4/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public isUnsubscribed()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lb5/a;->g:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lb5/a;->h:LT4/a;

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final unsubscribe()V
    .locals 2

    .line 1
    iget-object v0, p0, Lb5/a;->g:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, LT4/a;

    .line 8
    .line 9
    sget-object v1, Lb5/a;->h:LT4/a;

    .line 10
    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lb5/a;->g:Ljava/util/concurrent/atomic/AtomicReference;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, LT4/a;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    if-eq p0, v1, :cond_0

    .line 24
    .line 25
    invoke-interface {p0}, LT4/a;->call()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
