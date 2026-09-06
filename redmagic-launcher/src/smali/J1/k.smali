.class public final synthetic LJ1/k;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LJ1/m;

.field public final synthetic h:Ljava/util/Set;


# direct methods
.method public synthetic constructor <init>(LJ1/m;Ljava/util/Set;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LJ1/k;->g:LJ1/m;

    .line 5
    .line 6
    iput-object p2, p0, LJ1/k;->h:Ljava/util/Set;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, LJ1/k;->g:LJ1/m;

    .line 2
    .line 3
    iget-object p0, p0, LJ1/k;->h:Ljava/util/Set;

    .line 4
    .line 5
    invoke-static {v0, p0}, LJ1/m;->c(LJ1/m;Ljava/util/Set;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
