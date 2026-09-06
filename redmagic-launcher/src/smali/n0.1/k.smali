.class final Ln0/k;
.super Ln0/j;
.source "SpecificationComputer.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ln0/j<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final b:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final c:Ljava/lang/String;

.field private final d:Ln0/l;

.field private final e:Ln0/h;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;Ln0/l;Ln0/h;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/String;",
            "Ln0/l;",
            "Ln0/h;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "value"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "tag"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "verificationMode"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "logger"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Ln0/j;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ln0/k;->b:Ljava/lang/Object;

    .line 25
    .line 26
    iput-object p2, p0, Ln0/k;->c:Ljava/lang/String;

    .line 27
    .line 28
    iput-object p3, p0, Ln0/k;->d:Ln0/l;

    .line 29
    .line 30
    iput-object p4, p0, Ln0/k;->e:Ln0/h;

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ln0/k;->b:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ljava/lang/String;Lu4/l;)Ln0/j;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lu4/l<",
            "-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ln0/j<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const-string v0, "message"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "condition"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ln0/k;->b:Ljava/lang/Object;

    .line 12
    .line 13
    invoke-interface {p2, v0}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    check-cast p2, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    new-instance v0, Ln0/g;

    .line 27
    .line 28
    iget-object v1, p0, Ln0/k;->b:Ljava/lang/Object;

    .line 29
    .line 30
    iget-object v2, p0, Ln0/k;->c:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v4, p0, Ln0/k;->e:Ln0/h;

    .line 33
    .line 34
    iget-object v5, p0, Ln0/k;->d:Ln0/l;

    .line 35
    .line 36
    move-object v3, p1

    .line 37
    invoke-direct/range {v0 .. v5}, Ln0/g;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ln0/h;Ln0/l;)V

    .line 38
    .line 39
    .line 40
    return-object v0
.end method
