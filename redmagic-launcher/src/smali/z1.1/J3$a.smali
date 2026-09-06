.class Lz1/J3$a;
.super Lz1/J3$c;
.source "ModelWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lz1/J3;->V(Ljava/lang/Runnable;)Lz1/J3$c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic i:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lz1/J3;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lz1/J3$a;->i:Ljava/lang/Runnable;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    invoke-direct {p0, p1, p2}, Lz1/J3$c;-><init>(Lz1/J3;Lz1/L3;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/J3$a;->i:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
