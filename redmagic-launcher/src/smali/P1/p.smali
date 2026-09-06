.class public final synthetic LP1/p;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LP1/k$b;

.field public final synthetic h:I

.field public final synthetic i:I


# direct methods
.method public synthetic constructor <init>(LP1/k$b;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LP1/p;->g:LP1/k$b;

    .line 5
    .line 6
    iput p2, p0, LP1/p;->h:I

    .line 7
    .line 8
    iput p3, p0, LP1/p;->i:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, LP1/p;->g:LP1/k$b;

    .line 2
    .line 3
    iget v1, p0, LP1/p;->h:I

    .line 4
    .line 5
    iget p0, p0, LP1/p;->i:I

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, LP1/k$b;->p2(LP1/k$b;II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
