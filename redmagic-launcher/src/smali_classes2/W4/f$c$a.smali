.class LW4/f$c$a;
.super Ljava/lang/Object;
.source "ScalarSynchronousObservable.java"

# interfaces
.implements LT4/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LW4/f$c;->a(LT4/a;)Lrx/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:LT4/a;

.field final synthetic h:Lrx/e$a;

.field final synthetic i:LW4/f$c;


# direct methods
.method constructor <init>(LW4/f$c;LT4/a;Lrx/e$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, LW4/f$c$a;->i:LW4/f$c;

    .line 2
    .line 3
    iput-object p2, p0, LW4/f$c$a;->g:LT4/a;

    .line 4
    .line 5
    iput-object p3, p0, LW4/f$c$a;->h:Lrx/e$a;

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
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, LW4/f$c$a;->g:LT4/a;

    .line 2
    .line 3
    invoke-interface {v0}, LT4/a;->call()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LW4/f$c$a;->h:Lrx/e$a;

    .line 7
    .line 8
    invoke-interface {p0}, Lrx/i;->unsubscribe()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    iget-object p0, p0, LW4/f$c$a;->h:Lrx/e$a;

    .line 14
    .line 15
    invoke-interface {p0}, Lrx/i;->unsubscribe()V

    .line 16
    .line 17
    .line 18
    throw v0
.end method
