.class public final synthetic Lcom/android/quickstep/util/Q0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Ljava/util/ArrayList;

.field public final synthetic h:Landroid/view/SurfaceControl$Transaction;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Landroid/view/SurfaceControl$Transaction;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/Q0;->g:Ljava/util/ArrayList;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/Q0;->h:Landroid/view/SurfaceControl$Transaction;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/Q0;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/Q0;->h:Landroid/view/SurfaceControl$Transaction;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Lcom/android/quickstep/util/SplitAnimationController;->a(Ljava/util/ArrayList;Landroid/view/SurfaceControl$Transaction;Landroid/animation/ValueAnimator;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
