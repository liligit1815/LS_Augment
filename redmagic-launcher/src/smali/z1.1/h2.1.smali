.class public final synthetic Lz1/h2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/ToLongFunction;


# instance fields
.field public final synthetic a:Lz1/k2;


# direct methods
.method public synthetic constructor <init>(Lz1/k2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/h2;->a:Lz1/k2;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final applyAsLong(Ljava/lang/Object;)J
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/h2;->a:Lz1/k2;

    .line 2
    .line 3
    check-cast p1, Landroid/os/UserHandle;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lz1/k2;->H(Landroid/os/UserHandle;)J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0
.end method
