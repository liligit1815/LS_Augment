.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$g;
.super Ljava/lang/Object;
.source "AIBubbleWidgetBubbleView.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->q(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;Z)Ljava/util/ArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:F

.field final synthetic h:F

.field final synthetic i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;FF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$g;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$g;->g:F

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$g;->h:F

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$g;->g:F

    .line 6
    .line 7
    iget v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$g;->h:F

    .line 8
    .line 9
    sub-float/2addr v1, v0

    .line 10
    mul-float/2addr v1, p1

    .line 11
    add-float/2addr v0, v1

    .line 12
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$g;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->setAnimScale(F)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
