.class public final synthetic LP1/n;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:I

.field public final synthetic h:LP1/k$b;

.field public final synthetic i:LP1/k;


# direct methods
.method public synthetic constructor <init>(ILP1/k$b;LP1/k;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, LP1/n;->g:I

    .line 5
    .line 6
    iput-object p2, p0, LP1/n;->h:LP1/k$b;

    .line 7
    .line 8
    iput-object p3, p0, LP1/n;->i:LP1/k;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget v0, p0, LP1/n;->g:I

    .line 2
    .line 3
    iget-object v1, p0, LP1/n;->h:LP1/k$b;

    .line 4
    .line 5
    iget-object p0, p0, LP1/n;->i:LP1/k;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, LP1/k$b;->o2(ILP1/k$b;LP1/k;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
