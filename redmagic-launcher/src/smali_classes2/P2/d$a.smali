.class LP2/d$a;
.super Ljava/lang/Object;
.source "RegionSamplingHelper.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LP2/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:LP2/d;


# direct methods
.method constructor <init>(LP2/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, LP2/d$a;->g:LP2/d;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDraw()V
    .locals 2

    .line 1
    iget-object v0, p0, LP2/d$a;->g:LP2/d;

    .line 2
    .line 3
    invoke-static {v0}, LP2/d;->c(LP2/d;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, LP2/d$a;->g:LP2/d;

    .line 8
    .line 9
    invoke-static {v1}, LP2/d;->d(LP2/d;)Ljava/lang/Runnable;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, LP2/d$a;->g:LP2/d;

    .line 17
    .line 18
    invoke-static {p0}, LP2/d;->i(LP2/d;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
