.class Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$b;
.super Ljava/lang/Object;
.source "SwipeMenuLayout.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->s(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$b;->g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$b;->g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 12
    .line 13
    invoke-static {v0, p1}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->e(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$b;->g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->a(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$b;->g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->c(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;)Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$b;->g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->c(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;)Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0, p1, v1}, Landroid/widget/FrameLayout;->scrollTo(II)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$b;->g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 44
    .line 45
    invoke-virtual {v0, p1, v1}, Landroid/widget/FrameLayout;->scrollTo(II)V

    .line 46
    .line 47
    .line 48
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$b;->g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 51
    .line 52
    .line 53
    return-void
.end method
