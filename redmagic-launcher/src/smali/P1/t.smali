.class public final synthetic LP1/t;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LP1/k$b;

.field public final synthetic h:I


# direct methods
.method public synthetic constructor <init>(LP1/k$b;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LP1/t;->g:LP1/k$b;

    .line 5
    .line 6
    iput p2, p0, LP1/t;->h:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, LP1/t;->g:LP1/k$b;

    .line 2
    .line 3
    iget p0, p0, LP1/t;->h:I

    .line 4
    .line 5
    invoke-static {v0, p0}, LP1/k$b;->w2(LP1/k$b;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
