.class public final synthetic Lj1/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Landroid/view/SurfaceControl$Transaction;

.field public final synthetic h:Landroid/window/TransitionInfo$Change;


# direct methods
.method public synthetic constructor <init>(Landroid/view/SurfaceControl$Transaction;Landroid/window/TransitionInfo$Change;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lj1/b;->g:Landroid/view/SurfaceControl$Transaction;

    .line 5
    .line 6
    iput-object p2, p0, Lj1/b;->h:Landroid/window/TransitionInfo$Change;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lj1/b;->g:Landroid/view/SurfaceControl$Transaction;

    .line 2
    .line 3
    iget-object p0, p0, Lj1/b;->h:Landroid/window/TransitionInfo$Change;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Lj1/d;->b(Landroid/view/SurfaceControl$Transaction;Landroid/window/TransitionInfo$Change;Landroid/animation/ValueAnimator;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
