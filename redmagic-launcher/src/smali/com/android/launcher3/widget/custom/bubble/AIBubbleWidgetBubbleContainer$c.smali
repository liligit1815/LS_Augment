.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$c;
.super Ljava/lang/Object;
.source "AIBubbleWidgetBubbleContainer.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->F(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:F

.field final synthetic h:F

.field final synthetic i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

.field final synthetic j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;FFLcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$c;->j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$c;->g:F

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$c;->h:F

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$c;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$c;->g:F

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$c;->h:F

    .line 4
    .line 5
    sub-float/2addr v1, v0

    .line 6
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    mul-float/2addr v1, p1

    .line 11
    add-float/2addr v0, v1

    .line 12
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$c;->j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->j(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Landroid/widget/ImageView;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$c;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
