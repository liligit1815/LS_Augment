.class public final synthetic Lcom/android/quickstep/util/L0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:F

.field public final synthetic h:I

.field public final synthetic i:F

.field public final synthetic j:I

.field public final synthetic k:F

.field public final synthetic l:Landroid/view/SurfaceControl$Transaction;

.field public final synthetic m:Lkotlin/jvm/internal/C;


# direct methods
.method public synthetic constructor <init>(FIFIFLandroid/view/SurfaceControl$Transaction;Lkotlin/jvm/internal/C;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/quickstep/util/L0;->g:F

    .line 5
    .line 6
    iput p2, p0, Lcom/android/quickstep/util/L0;->h:I

    .line 7
    .line 8
    iput p3, p0, Lcom/android/quickstep/util/L0;->i:F

    .line 9
    .line 10
    iput p4, p0, Lcom/android/quickstep/util/L0;->j:I

    .line 11
    .line 12
    iput p5, p0, Lcom/android/quickstep/util/L0;->k:F

    .line 13
    .line 14
    iput-object p6, p0, Lcom/android/quickstep/util/L0;->l:Landroid/view/SurfaceControl$Transaction;

    .line 15
    .line 16
    iput-object p7, p0, Lcom/android/quickstep/util/L0;->m:Lkotlin/jvm/internal/C;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 8

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/L0;->g:F

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/util/L0;->h:I

    .line 4
    .line 5
    iget v2, p0, Lcom/android/quickstep/util/L0;->i:F

    .line 6
    .line 7
    iget v3, p0, Lcom/android/quickstep/util/L0;->j:I

    .line 8
    .line 9
    iget v4, p0, Lcom/android/quickstep/util/L0;->k:F

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/quickstep/util/L0;->l:Landroid/view/SurfaceControl$Transaction;

    .line 12
    .line 13
    iget-object v6, p0, Lcom/android/quickstep/util/L0;->m:Lkotlin/jvm/internal/C;

    .line 14
    .line 15
    move-object v7, p1

    .line 16
    invoke-static/range {v0 .. v7}, Lcom/android/quickstep/util/SplitAnimationController;->e(FIFIFLandroid/view/SurfaceControl$Transaction;Lkotlin/jvm/internal/C;Landroid/animation/ValueAnimator;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
