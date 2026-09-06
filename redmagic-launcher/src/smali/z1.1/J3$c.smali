.class abstract Lz1/J3$c;
.super Ljava/lang/Object;
.source "ModelWriter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lz1/J3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "c"
.end annotation


# instance fields
.field private final g:I

.field final synthetic h:Lz1/J3;


# direct methods
.method private constructor <init>(Lz1/J3;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lz1/J3$c;->h:Lz1/J3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    invoke-static {p1}, Lz1/J3;->q(Lz1/J3;)Lz1/y0;

    move-result-object p1

    iget p1, p1, Lz1/y0;->g:I

    iput p1, p0, Lz1/J3$c;->g:I

    return-void
.end method

.method synthetic constructor <init>(Lz1/J3;Lz1/L3;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/J3$c;-><init>(Lz1/J3;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public abstract b()V
.end method

.method public final run()V
    .locals 2

    .line 1
    iget v0, p0, Lz1/J3$c;->g:I

    .line 2
    .line 3
    iget-object v1, p0, Lz1/J3$c;->h:Lz1/J3;

    .line 4
    .line 5
    invoke-static {v1}, Lz1/J3;->s(Lz1/J3;)Lcom/android/launcher3/D3;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/D3;->l0()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    const-string p0, "ModelWriter"

    .line 16
    .line 17
    const-string v0, "Model changed before the task could execute"

    .line 18
    .line 19
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p0}, Lz1/J3$c;->b()V

    .line 24
    .line 25
    .line 26
    return-void
.end method
