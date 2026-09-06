.class public LC0/q;
.super Ljava/lang/Object;
.source "ShapePath.java"

# interfaces
.implements LC0/c;


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:I

.field private final c:LB0/h;

.field private final d:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;ILB0/h;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LC0/q;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, LC0/q;->b:I

    .line 7
    .line 8
    iput-object p3, p0, LC0/q;->c:LB0/h;

    .line 9
    .line 10
    iput-boolean p4, p0, LC0/q;->d:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Lcom/airbnb/lottie/n;Lv0/h;LD0/b;)Lx0/c;
    .locals 0

    .line 1
    new-instance p2, Lx0/r;

    .line 2
    .line 3
    invoke-direct {p2, p1, p3, p0}, Lx0/r;-><init>(Lcom/airbnb/lottie/n;LD0/b;LC0/q;)V

    .line 4
    .line 5
    .line 6
    return-object p2
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/q;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()LB0/h;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/q;->c:LB0/h;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LC0/q;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "ShapePath{name="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, LC0/q;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", index="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget p0, p0, LC0/q;->b:I

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const/16 p0, 0x7d

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method
