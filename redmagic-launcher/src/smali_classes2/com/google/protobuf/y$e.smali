.class public Lcom/google/protobuf/y$e;
.super Lcom/google/protobuf/n;
.source "GeneratedMessageLite.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/y;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ContainingType::",
        "Lcom/google/protobuf/T;",
        "Type:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/protobuf/n<",
        "TContainingType;TType;>;"
    }
.end annotation


# instance fields
.field final a:Lcom/google/protobuf/T;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TContainingType;"
        }
    .end annotation
.end field

.field final b:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TType;"
        }
    .end annotation
.end field

.field final c:Lcom/google/protobuf/T;

.field final d:Lcom/google/protobuf/y$d;


# direct methods
.method constructor <init>(Lcom/google/protobuf/T;Ljava/lang/Object;Lcom/google/protobuf/T;Lcom/google/protobuf/y$d;Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TContainingType;TType;",
            "Lcom/google/protobuf/T;",
            "Lcom/google/protobuf/y$d;",
            "Ljava/lang/Class;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/n;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_2

    .line 5
    .line 6
    invoke-virtual {p4}, Lcom/google/protobuf/y$d;->l()Lcom/google/protobuf/w0$b;

    .line 7
    .line 8
    .line 9
    move-result-object p5

    .line 10
    sget-object v0, Lcom/google/protobuf/w0$b;->s:Lcom/google/protobuf/w0$b;

    .line 11
    .line 12
    if-ne p5, v0, :cond_1

    .line 13
    .line 14
    if-eqz p3, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 18
    .line 19
    const-string p1, "Null messageDefaultInstance"

    .line 20
    .line 21
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw p0

    .line 25
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/google/protobuf/y$e;->a:Lcom/google/protobuf/T;

    .line 26
    .line 27
    iput-object p2, p0, Lcom/google/protobuf/y$e;->b:Ljava/lang/Object;

    .line 28
    .line 29
    iput-object p3, p0, Lcom/google/protobuf/y$e;->c:Lcom/google/protobuf/T;

    .line 30
    .line 31
    iput-object p4, p0, Lcom/google/protobuf/y$e;->d:Lcom/google/protobuf/y$d;

    .line 32
    .line 33
    return-void

    .line 34
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 35
    .line 36
    const-string p1, "Null containingTypeDefaultInstance"

    .line 37
    .line 38
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    throw p0
.end method


# virtual methods
.method public b()Lcom/google/protobuf/w0$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$e;->d:Lcom/google/protobuf/y$d;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->l()Lcom/google/protobuf/w0$b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()Lcom/google/protobuf/T;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$e;->c:Lcom/google/protobuf/T;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$e;->d:Lcom/google/protobuf/y$d;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/y$d;->getNumber()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/y$e;->d:Lcom/google/protobuf/y$d;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/google/protobuf/y$d;->j:Z

    .line 4
    .line 5
    return p0
.end method
