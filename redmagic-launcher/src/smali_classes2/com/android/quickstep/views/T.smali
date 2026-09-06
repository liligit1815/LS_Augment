.class public final synthetic Lcom/android/quickstep/views/T;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/views/RecentsView;

.field public final synthetic h:[Landroid/view/RemoteAnimationTarget;

.field public final synthetic i:Landroid/graphics/Matrix;

.field public final synthetic j:Lcom/android/quickstep/util/SurfaceTransactionApplier;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/RecentsView;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/Matrix;Lcom/android/quickstep/util/SurfaceTransactionApplier;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/T;->g:Lcom/android/quickstep/views/RecentsView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/views/T;->h:[Landroid/view/RemoteAnimationTarget;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/views/T;->i:Landroid/graphics/Matrix;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/views/T;->j:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/T;->g:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/views/T;->h:[Landroid/view/RemoteAnimationTarget;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/views/T;->i:Landroid/graphics/Matrix;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/views/T;->j:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0, p1}, Lcom/android/quickstep/views/RecentsView;->Y(Lcom/android/quickstep/views/RecentsView;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/Matrix;Lcom/android/quickstep/util/SurfaceTransactionApplier;Landroid/animation/ValueAnimator;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
