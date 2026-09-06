.class public Lz1/J3$d;
.super Ljava/lang/Object;
.source "ModelWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lz1/J3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field final a:I

.field final synthetic b:Lz1/J3;


# direct methods
.method constructor <init>(Lz1/J3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lz1/J3$d;->b:Lz1/J3;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lz1/J3;->q(Lz1/J3;)Lz1/y0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget p1, p1, Lz1/y0;->f:I

    .line 11
    .line 12
    iput p1, p0, Lz1/J3$d;->a:I

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Lz1/J3$d;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/J3$d;->b(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic b(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/J3$d;->b:Lz1/J3;

    .line 2
    .line 3
    invoke-static {v0}, Lz1/J3;->q(Lz1/J3;)Lz1/y0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Lz1/y0;->f:I

    .line 8
    .line 9
    if-le v0, p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget v0, p0, Lz1/J3$d;->a:I

    .line 13
    .line 14
    if-ne p1, v0, :cond_1

    .line 15
    .line 16
    :goto_0
    return-void

    .line 17
    :cond_1
    iget-object p0, p0, Lz1/J3$d;->b:Lz1/J3;

    .line 18
    .line 19
    invoke-static {p0}, Lz1/J3;->s(Lz1/J3;)Lcom/android/launcher3/D3;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->I0()V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method c()V
    .locals 3

    .line 1
    iget-object v0, p0, Lz1/J3$d;->b:Lz1/J3;

    .line 2
    .line 3
    invoke-static {v0}, Lz1/J3;->u(Lz1/J3;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lz1/J3$d;->b:Lz1/J3;

    .line 10
    .line 11
    invoke-static {v0}, Lz1/J3;->s(Lz1/J3;)Lcom/android/launcher3/D3;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->p0()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, p0, Lz1/J3$d;->b:Lz1/J3;

    .line 23
    .line 24
    invoke-static {v0}, Lz1/J3;->q(Lz1/J3;)Lz1/y0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget v0, v0, Lz1/y0;->f:I

    .line 29
    .line 30
    iget-object v1, p0, Lz1/J3$d;->b:Lz1/J3;

    .line 31
    .line 32
    invoke-static {v1}, Lz1/J3;->t(Lz1/J3;)Lcom/android/launcher3/util/p1;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    new-instance v2, Lz1/K3;

    .line 37
    .line 38
    invoke-direct {v2, p0, v0}, Lz1/K3;-><init>(Lz1/J3$d;I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    return-void
.end method
