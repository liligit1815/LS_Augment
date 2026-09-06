.class public final synthetic Lcom/android/quickstep/interaction/k;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/interaction/AnimatedTaskView;

.field public final synthetic h:Landroid/graphics/Rect;

.field public final synthetic i:I

.field public final synthetic j:F

.field public final synthetic k:F


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/interaction/AnimatedTaskView;Landroid/graphics/Rect;IFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/interaction/k;->g:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/interaction/k;->h:Landroid/graphics/Rect;

    .line 7
    .line 8
    iput p3, p0, Lcom/android/quickstep/interaction/k;->i:I

    .line 9
    .line 10
    iput p4, p0, Lcom/android/quickstep/interaction/k;->j:F

    .line 11
    .line 12
    iput p5, p0, Lcom/android/quickstep/interaction/k;->k:F

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/k;->g:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/interaction/k;->h:Landroid/graphics/Rect;

    .line 4
    .line 5
    iget v2, p0, Lcom/android/quickstep/interaction/k;->i:I

    .line 6
    .line 7
    iget v3, p0, Lcom/android/quickstep/interaction/k;->j:F

    .line 8
    .line 9
    iget v4, p0, Lcom/android/quickstep/interaction/k;->k:F

    .line 10
    .line 11
    move-object v5, p1

    .line 12
    invoke-static/range {v0 .. v5}, Lcom/android/quickstep/interaction/AnimatedTaskView;->a(Lcom/android/quickstep/interaction/AnimatedTaskView;Landroid/graphics/Rect;IFFLandroid/animation/ValueAnimator;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
