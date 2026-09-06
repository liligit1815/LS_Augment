.class LP2/d$c;
.super Landroid/view/CompositionSamplingListener;
.source "RegionSamplingHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LP2/d;-><init>(Landroid/view/View;LP2/d$d;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;LP2/d$e;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:LP2/d;


# direct methods
.method constructor <init>(LP2/d;Ljava/util/concurrent/Executor;)V
    .locals 0

    .line 1
    iput-object p1, p0, LP2/d$c;->a:LP2/d;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/view/CompositionSamplingListener;-><init>(Ljava/util/concurrent/Executor;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onSampleCollected(F)V
    .locals 1

    .line 1
    iget-object v0, p0, LP2/d$c;->a:LP2/d;

    .line 2
    .line 3
    invoke-static {v0}, LP2/d;->f(LP2/d;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, LP2/d$c;->a:LP2/d;

    .line 10
    .line 11
    invoke-static {v0}, LP2/d;->h(LP2/d;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, LP2/d$c;->a:LP2/d;

    .line 18
    .line 19
    invoke-static {p0, p1}, LP2/d;->j(LP2/d;F)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p0, p0, LP2/d$c;->a:LP2/d;

    .line 24
    .line 25
    invoke-static {p0, p1}, LP2/d;->k(LP2/d;F)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method
