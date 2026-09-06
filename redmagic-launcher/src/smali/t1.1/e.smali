.class public final synthetic Lt1/e;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lt1/f;

.field public final synthetic h:I

.field public final synthetic i:I


# direct methods
.method public synthetic constructor <init>(Lt1/f;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lt1/e;->g:Lt1/f;

    .line 5
    .line 6
    iput p2, p0, Lt1/e;->h:I

    .line 7
    .line 8
    iput p3, p0, Lt1/e;->i:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lt1/e;->g:Lt1/f;

    .line 2
    .line 3
    iget v1, p0, Lt1/e;->h:I

    .line 4
    .line 5
    iget p0, p0, Lt1/e;->i:I

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lt1/f;->d(Lt1/f;II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
