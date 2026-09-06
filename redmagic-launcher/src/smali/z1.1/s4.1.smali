.class public final synthetic Lz1/s4;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/app/StatsManager$StatsPullAtomCallback;


# instance fields
.field public final synthetic a:Lz1/w4;


# direct methods
.method public synthetic constructor <init>(Lz1/w4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/s4;->a:Lz1/w4;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onPullAtom(ILjava/util/List;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/s4;->a:Lz1/w4;

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lz1/w4;->n(Lz1/w4;ILjava/util/List;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
