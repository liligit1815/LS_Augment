.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$c;
.super Ljava/lang/Object;
.source "AIBubbleWidgetBubbleView.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->j(ZLjava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:F

.field final synthetic h:F

.field final synthetic i:F

.field final synthetic j:F

.field final synthetic k:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;FFFF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$c;->k:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$c;->g:F

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$c;->h:F

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$c;->i:F

    .line 8
    .line 9
    iput p5, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$c;->j:F

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$c;->g:F

    .line 6
    .line 7
    iget v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$c;->h:F

    .line 8
    .line 9
    sub-float/2addr v1, v0

    .line 10
    mul-float/2addr v1, p1

    .line 11
    add-float/2addr v0, v1

    .line 12
    iget v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$c;->i:F

    .line 13
    .line 14
    iget v2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$c;->j:F

    .line 15
    .line 16
    sub-float/2addr v2, v1

    .line 17
    mul-float/2addr v2, p1

    .line 18
    add-float/2addr v1, v2

    .line 19
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$c;->k:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->setAnimScale(F)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$c;->k:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
