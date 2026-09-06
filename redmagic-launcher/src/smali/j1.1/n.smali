.class public final synthetic Lj1/n;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Ljava/lang/Runnable;

.field public final synthetic h:Lj1/k$b;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;Lj1/k$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lj1/n;->g:Ljava/lang/Runnable;

    .line 5
    .line 6
    iput-object p2, p0, Lj1/n;->h:Lj1/k$b;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lj1/n;->g:Ljava/lang/Runnable;

    .line 2
    .line 3
    iget-object p0, p0, Lj1/n;->h:Lj1/k$b;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lj1/k$b;->o2(Ljava/lang/Runnable;Lj1/k$b;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
