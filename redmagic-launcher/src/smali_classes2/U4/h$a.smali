.class LU4/h$a;
.super Ljava/lang/Object;
.source "OperatorSubscribeOn.java"

# interfaces
.implements LT4/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LU4/h;->a(Lrx/h;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lrx/h;

.field final synthetic h:Lrx/e$a;

.field final synthetic i:LU4/h;


# direct methods
.method constructor <init>(LU4/h;Lrx/h;Lrx/e$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, LU4/h$a;->i:LU4/h;

    .line 2
    .line 3
    iput-object p2, p0, LU4/h$a;->g:Lrx/h;

    .line 4
    .line 5
    iput-object p3, p0, LU4/h$a;->h:Lrx/e$a;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, LU4/h$a$a;

    .line 6
    .line 7
    iget-object v2, p0, LU4/h$a;->g:Lrx/h;

    .line 8
    .line 9
    invoke-direct {v1, p0, v2, v0}, LU4/h$a$a;-><init>(LU4/h$a;Lrx/h;Ljava/lang/Thread;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, LU4/h$a;->i:LU4/h;

    .line 13
    .line 14
    iget-object p0, p0, LU4/h;->b:Lrx/b;

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Lrx/b;->m(Lrx/h;)Lrx/i;

    .line 17
    .line 18
    .line 19
    return-void
.end method
