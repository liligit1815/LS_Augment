.class final Lcom/google/protobuf/y$d;
.super Ljava/lang/Object;
.source "GeneratedMessageLite.java"

# interfaces
.implements Lcom/google/protobuf/u$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/y;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/protobuf/u$b<",
        "Lcom/google/protobuf/y$d;",
        ">;"
    }
.end annotation


# instance fields
.field final g:Lcom/google/protobuf/A$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/A$d<",
            "*>;"
        }
    .end annotation
.end field

.field final h:I

.field final i:Lcom/google/protobuf/w0$b;

.field final j:Z

.field final k:Z


# direct methods
.method constructor <init>(Lcom/google/protobuf/A$d;ILcom/google/protobuf/w0$b;ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/A$d<",
            "*>;I",
            "Lcom/google/protobuf/w0$b;",
            "ZZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/protobuf/y$d;->g:Lcom/google/protobuf/A$d;

    .line 5
    .line 6
    iput p2, p0, Lcom/google/protobuf/y$d;->h:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/google/protobuf/y$d;->i:Lcom/google/protobuf/w0$b;

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/google/protobuf/y$d;->j:Z

    .line 11
    .line 12
    iput-boolean p5, p0, Lcom/google/protobuf/y$d;->k:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(Lcom/google/protobuf/y$d;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/protobuf/y$d;->h:I

    .line 2
    .line 3
    iget p1, p1, Lcom/google/protobuf/y$d;->h:I

    .line 4
    .line 5
    sub-int/2addr p0, p1

    .line 6
    return p0
.end method

.method public b(Lcom/google/protobuf/T$a;Lcom/google/protobuf/T;)Lcom/google/protobuf/T$a;
    .locals 0

    .line 1
    check-cast p1, Lcom/google/protobuf/y$a;

    .line 2
    .line 3
    check-cast p2, Lcom/google/protobuf/y;

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Lcom/google/protobuf/y$a;->mergeFrom(Lcom/google/protobuf/y;)Lcom/google/protobuf/y$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public c()Lcom/google/protobuf/A$d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/A$d<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$d;->g:Lcom/google/protobuf/A$d;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/google/protobuf/y$d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/protobuf/y$d;->a(Lcom/google/protobuf/y$d;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/protobuf/y$d;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/google/protobuf/y$d;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public l()Lcom/google/protobuf/w0$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$d;->i:Lcom/google/protobuf/w0$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public q()Lcom/google/protobuf/w0$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$d;->i:Lcom/google/protobuf/w0$b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/w0$b;->a()Lcom/google/protobuf/w0$c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public r()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/google/protobuf/y$d;->k:Z

    .line 2
    .line 3
    return p0
.end method
