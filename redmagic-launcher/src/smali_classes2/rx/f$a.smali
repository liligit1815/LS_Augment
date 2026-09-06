.class Lrx/f$a;
.super Ljava/lang/Object;
.source "Single.java"

# interfaces
.implements Lrx/b$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/f;-><init>(Lrx/f$b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/b$a<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic a:Lrx/f$b;

.field final synthetic b:Lrx/f;


# direct methods
.method constructor <init>(Lrx/f;Lrx/f$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/f$a;->b:Lrx/f;

    .line 2
    .line 3
    iput-object p2, p0, Lrx/f$a;->a:Lrx/f$b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lrx/h;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/h<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, LV4/b;

    .line 2
    .line 3
    invoke-direct {v0, p1}, LV4/b;-><init>(Lrx/h;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lrx/h;->setProducer(Lrx/d;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Lrx/f$a$a;

    .line 10
    .line 11
    invoke-direct {v1, p0, v0, p1}, Lrx/f$a$a;-><init>(Lrx/f$a;LV4/b;Lrx/h;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v1}, Lrx/h;->add(Lrx/i;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lrx/f$a;->a:Lrx/f$b;

    .line 18
    .line 19
    invoke-interface {p0, v1}, LT4/b;->call(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lrx/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/f$a;->a(Lrx/h;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
