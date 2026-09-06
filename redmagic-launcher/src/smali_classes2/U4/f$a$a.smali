.class LU4/f$a$a;
.super Ljava/lang/Object;
.source "OperatorObserveOn.java"

# interfaces
.implements Lrx/d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LU4/f$a;->b()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:LU4/f$a;


# direct methods
.method constructor <init>(LU4/f$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, LU4/f$a$a;->g:LU4/f$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, LU4/f$a$a;->g:LU4/f$a;

    .line 8
    .line 9
    iget-object v0, v0, LU4/f$a;->n:Ljava/util/concurrent/atomic/AtomicLong;

    .line 10
    .line 11
    invoke-static {v0, p1, p2}, LU4/a;->b(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, LU4/f$a$a;->g:LU4/f$a;

    .line 15
    .line 16
    invoke-virtual {p0}, LU4/f$a;->c()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
