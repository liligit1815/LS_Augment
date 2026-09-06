.class public final synthetic Lcom/android/quickstep/util/G0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Landroid/graphics/RectF;

.field public final synthetic h:Landroid/graphics/RectF;

.field public final synthetic i:Lcom/android/quickstep/util/RectFSpringAnim;

.field public final synthetic j:Lcom/android/launcher3/Workspace;


# direct methods
.method public synthetic constructor <init>(Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/android/quickstep/util/RectFSpringAnim;Lcom/android/launcher3/Workspace;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/G0;->g:Landroid/graphics/RectF;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/G0;->h:Landroid/graphics/RectF;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/util/G0;->i:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/util/G0;->j:Lcom/android/launcher3/Workspace;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/G0;->g:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/G0;->h:Landroid/graphics/RectF;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/util/G0;->i:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/util/G0;->j:Lcom/android/launcher3/Workspace;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0, p1}, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;->a(Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/android/quickstep/util/RectFSpringAnim;Lcom/android/launcher3/Workspace;Landroid/animation/ValueAnimator;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
