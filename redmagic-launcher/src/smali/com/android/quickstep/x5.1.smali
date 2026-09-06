.class public final synthetic Lcom/android/quickstep/x5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Ljava/util/List;

.field public final synthetic h:Landroid/view/SurfaceControl$Transaction;

.field public final synthetic i:Z


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Landroid/view/SurfaceControl$Transaction;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/x5;->g:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/x5;->h:Landroid/view/SurfaceControl$Transaction;

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/android/quickstep/x5;->i:Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/x5;->g:Ljava/util/List;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/x5;->h:Landroid/view/SurfaceControl$Transaction;

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/android/quickstep/x5;->i:Z

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1}, Lcom/android/quickstep/TaskViewUtils;->e(Ljava/util/List;Landroid/view/SurfaceControl$Transaction;ZLandroid/animation/ValueAnimator;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
