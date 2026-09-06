.class public final synthetic Lz1/A3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lz1/J3;

.field public final synthetic h:Ljava/util/Collection;

.field public final synthetic i:Lz1/J3$d;


# direct methods
.method public synthetic constructor <init>(Lz1/J3;Ljava/util/Collection;Lz1/J3$d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/A3;->g:Lz1/J3;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/A3;->h:Ljava/util/Collection;

    .line 7
    .line 8
    iput-object p3, p0, Lz1/A3;->i:Lz1/J3$d;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/A3;->g:Lz1/J3;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/A3;->h:Ljava/util/Collection;

    .line 4
    .line 5
    iget-object p0, p0, Lz1/A3;->i:Lz1/J3$d;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lz1/J3;->f(Lz1/J3;Ljava/util/Collection;Lz1/J3$d;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
