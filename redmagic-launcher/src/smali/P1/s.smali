.class public final synthetic LP1/s;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LP1/k$b;

.field public final synthetic h:I

.field public final synthetic i:I

.field public final synthetic j:I


# direct methods
.method public synthetic constructor <init>(LP1/k$b;III)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LP1/s;->g:LP1/k$b;

    .line 5
    .line 6
    iput p2, p0, LP1/s;->h:I

    .line 7
    .line 8
    iput p3, p0, LP1/s;->i:I

    .line 9
    .line 10
    iput p4, p0, LP1/s;->j:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, LP1/s;->g:LP1/k$b;

    .line 2
    .line 3
    iget v1, p0, LP1/s;->h:I

    .line 4
    .line 5
    iget v2, p0, LP1/s;->i:I

    .line 6
    .line 7
    iget p0, p0, LP1/s;->j:I

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, LP1/k$b;->q2(LP1/k$b;III)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
