.class public final synthetic Lh2/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lh2/c;

.field public final synthetic h:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lh2/c;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lh2/b;->g:Lh2/c;

    .line 5
    .line 6
    iput-object p2, p0, Lh2/b;->h:Ljava/util/ArrayList;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lh2/b;->g:Lh2/c;

    .line 2
    .line 3
    iget-object p0, p0, Lh2/b;->h:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lh2/c;->b(Lh2/c;Ljava/util/ArrayList;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
