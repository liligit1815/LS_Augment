.class public final synthetic Lcom/android/launcher3/widget/custom/bubble/A;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/widget/custom/bubble/PointerClock;

.field public final synthetic h:I

.field public final synthetic i:F

.field public final synthetic j:F


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/widget/custom/bubble/PointerClock;IFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/A;->g:Lcom/android/launcher3/widget/custom/bubble/PointerClock;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/widget/custom/bubble/A;->h:I

    .line 7
    .line 8
    iput p3, p0, Lcom/android/launcher3/widget/custom/bubble/A;->i:F

    .line 9
    .line 10
    iput p4, p0, Lcom/android/launcher3/widget/custom/bubble/A;->j:F

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/A;->g:Lcom/android/launcher3/widget/custom/bubble/PointerClock;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/widget/custom/bubble/A;->h:I

    .line 4
    .line 5
    iget v2, p0, Lcom/android/launcher3/widget/custom/bubble/A;->i:F

    .line 6
    .line 7
    iget p0, p0, Lcom/android/launcher3/widget/custom/bubble/A;->j:F

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0, p1}, Lcom/android/launcher3/widget/custom/bubble/PointerClock;->f(Lcom/android/launcher3/widget/custom/bubble/PointerClock;IFFLandroid/animation/ValueAnimator;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
