.class Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$d;
.super Ljava/lang/Object;
.source "SwipeMenuLayout.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->t(Landroid/view/ViewGroup;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/view/ViewGroup;

.field final synthetic h:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;Landroid/view/ViewGroup;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$d;->h:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$d;->g:Landroid/view/ViewGroup;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
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
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$d;->g:Landroid/view/ViewGroup;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, p1, v1}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$d;->h:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$d;->h:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 25
    .line 26
    invoke-static {p0, p1}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->f(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
