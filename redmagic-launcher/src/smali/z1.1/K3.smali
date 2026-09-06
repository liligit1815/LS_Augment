.class public final synthetic Lz1/K3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lz1/J3$d;

.field public final synthetic h:I


# direct methods
.method public synthetic constructor <init>(Lz1/J3$d;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/K3;->g:Lz1/J3$d;

    .line 5
    .line 6
    iput p2, p0, Lz1/K3;->h:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/K3;->g:Lz1/J3$d;

    .line 2
    .line 3
    iget p0, p0, Lz1/K3;->h:I

    .line 4
    .line 5
    invoke-static {v0, p0}, Lz1/J3$d;->a(Lz1/J3$d;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
