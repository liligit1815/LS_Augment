.class Lrx/f$a$a;
.super Lrx/g;
.source "Single.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/f$a;->a(Lrx/h;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lrx/g<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic h:LV4/b;

.field final synthetic i:Lrx/h;

.field final synthetic j:Lrx/f$a;


# direct methods
.method constructor <init>(Lrx/f$a;LV4/b;Lrx/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/f$a$a;->j:Lrx/f$a;

    .line 2
    .line 3
    iput-object p2, p0, Lrx/f$a$a;->h:LV4/b;

    .line 4
    .line 5
    iput-object p3, p0, Lrx/f$a$a;->i:Lrx/h;

    .line 6
    .line 7
    invoke-direct {p0}, Lrx/g;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/f$a$a;->i:Lrx/h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lrx/c;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lrx/f$a$a;->h:LV4/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LV4/b;->b(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
