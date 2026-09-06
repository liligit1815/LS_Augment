.class public final synthetic LM2/k;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:LM2/l$a;

.field public final synthetic h:Landroid/view/SurfaceControl$Transaction;

.field public final synthetic i:Landroid/view/SurfaceControl;


# direct methods
.method public synthetic constructor <init>(LM2/l$a;Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LM2/k;->g:LM2/l$a;

    .line 5
    .line 6
    iput-object p2, p0, LM2/k;->h:Landroid/view/SurfaceControl$Transaction;

    .line 7
    .line 8
    iput-object p3, p0, LM2/k;->i:Landroid/view/SurfaceControl;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, LM2/k;->g:LM2/l$a;

    .line 2
    .line 3
    iget-object v1, p0, LM2/k;->h:Landroid/view/SurfaceControl$Transaction;

    .line 4
    .line 5
    iget-object p0, p0, LM2/k;->i:Landroid/view/SurfaceControl;

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1}, LM2/l;->a(LM2/l$a;Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;Landroid/animation/ValueAnimator;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
