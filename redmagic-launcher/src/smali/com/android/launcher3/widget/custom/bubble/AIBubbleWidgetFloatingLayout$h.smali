.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$h;
.super Ljava/lang/Object;
.source "AIBubbleWidgetFloatingLayout.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->W(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:F

.field final synthetic h:F

.field final synthetic i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;FF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$h;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$h;->g:F

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$h;->h:F

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
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$h;->g:F

    .line 12
    .line 13
    iget v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$h;->h:F

    .line 14
    .line 15
    sub-float/2addr v1, v0

    .line 16
    mul-float/2addr v1, p1

    .line 17
    add-float/2addr v0, v1

    .line 18
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$h;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->o(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)Landroid/view/ViewGroup;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$h;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$h;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const/high16 p1, 0x437f0000    # 255.0f

    .line 42
    .line 43
    mul-float/2addr v0, p1

    .line 44
    float-to-int p1, v0

    .line 45
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method
