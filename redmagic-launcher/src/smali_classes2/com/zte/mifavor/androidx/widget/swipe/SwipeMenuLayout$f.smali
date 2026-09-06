.class Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$f;
.super Ljava/util/TimerTask;
.source "SwipeMenuLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "f"
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$f;->g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$f;->g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->c(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;)Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$f;->g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$f;->g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->d(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    sub-int v1, v0, v1

    .line 22
    .line 23
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/16 v2, 0x18

    .line 28
    .line 29
    if-ge v1, v2, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$f;->g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->setSlidingPause(Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$f;->g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 39
    .line 40
    invoke-static {v1, v0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->g(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;I)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$f;->g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->setSlidingPause(Z)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method
