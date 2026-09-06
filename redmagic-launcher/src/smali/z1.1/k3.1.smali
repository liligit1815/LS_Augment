.class public final synthetic Lz1/k3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/IntFunction;


# instance fields
.field public final synthetic a:Lz1/o3;


# direct methods
.method public synthetic constructor <init>(Lz1/o3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/k3;->a:Lz1/o3;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final apply(I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/k3;->a:Lz1/o3;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lz1/o3;->t(Lz1/o3;I)Lz1/y0$c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
