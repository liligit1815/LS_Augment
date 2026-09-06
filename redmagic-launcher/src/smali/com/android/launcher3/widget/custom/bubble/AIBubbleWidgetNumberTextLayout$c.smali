.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$c;
.super Ljava/lang/Object;
.source "AIBubbleWidgetNumberTextLayout.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->g()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$c;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
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
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$c;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->a(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    int-to-float v0, v0

    .line 12
    mul-float/2addr p1, v0

    .line 13
    const/4 v0, 0x0

    .line 14
    sub-float v1, v0, p1

    .line 15
    .line 16
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$c;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 17
    .line 18
    invoke-static {v2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->a(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    int-to-float v2, v2

    .line 23
    sub-float/2addr v2, p1

    .line 24
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$c;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->b(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    sub-float v1, v0, v1

    .line 33
    .line 34
    sub-float v2, v0, v2

    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$c;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->d(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)Landroid/widget/TextView;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$c;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 46
    .line 47
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->e(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)Landroid/widget/TextView;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
