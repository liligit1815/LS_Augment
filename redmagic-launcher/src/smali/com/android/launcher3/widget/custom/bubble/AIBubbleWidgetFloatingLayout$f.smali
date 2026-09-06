.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;
.super Ljava/lang/Object;
.source "AIBubbleWidgetFloatingLayout.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->X()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:I

.field final synthetic i:I

.field final synthetic j:I

.field final synthetic k:F

.field final synthetic l:F

.field final synthetic m:F

.field final synthetic n:F

.field final synthetic o:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;IIIIFFFF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->o:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->g:I

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->h:I

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->i:I

    .line 8
    .line 9
    iput p5, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->j:I

    .line 10
    .line 11
    iput p6, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->k:F

    .line 12
    .line 13
    iput p7, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->l:F

    .line 14
    .line 15
    iput p8, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->m:F

    .line 16
    .line 17
    iput p9, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->n:F

    .line 18
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 5

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
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->g:I

    .line 12
    .line 13
    int-to-float v1, v0

    .line 14
    iget v2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->h:I

    .line 15
    .line 16
    sub-int v0, v2, v0

    .line 17
    .line 18
    int-to-float v0, v0

    .line 19
    mul-float/2addr v0, p1

    .line 20
    add-float/2addr v1, v0

    .line 21
    int-to-float v0, v2

    .line 22
    sub-float/2addr v1, v0

    .line 23
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->i:I

    .line 24
    .line 25
    int-to-float v2, v0

    .line 26
    iget v3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->j:I

    .line 27
    .line 28
    sub-int v0, v3, v0

    .line 29
    .line 30
    int-to-float v0, v0

    .line 31
    mul-float/2addr v0, p1

    .line 32
    add-float/2addr v2, v0

    .line 33
    int-to-float v0, v3

    .line 34
    sub-float/2addr v2, v0

    .line 35
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->k:F

    .line 36
    .line 37
    iget v3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->l:F

    .line 38
    .line 39
    sub-float/2addr v3, v0

    .line 40
    mul-float/2addr v3, p1

    .line 41
    add-float/2addr v0, v3

    .line 42
    iget v3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->m:F

    .line 43
    .line 44
    iget v4, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->n:F

    .line 45
    .line 46
    sub-float/2addr v4, v3

    .line 47
    mul-float/2addr v4, p1

    .line 48
    add-float/2addr v3, v4

    .line 49
    iget-object v4, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->o:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 50
    .line 51
    invoke-static {v4}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->o(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)Landroid/view/ViewGroup;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 56
    .line 57
    .line 58
    iget-object v4, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->o:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 59
    .line 60
    invoke-static {v4}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->o(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)Landroid/view/ViewGroup;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->o:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 68
    .line 69
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->o(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)Landroid/view/ViewGroup;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->o:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 77
    .line 78
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->o(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)Landroid/view/ViewGroup;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setTranslationX(F)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->o:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 86
    .line 87
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->o(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)Landroid/view/ViewGroup;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setTranslationY(F)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->o:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 95
    .line 96
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    if-eqz v0, :cond_0

    .line 101
    .line 102
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$f;->o:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    const/high16 v0, 0x437f0000    # 255.0f

    .line 109
    .line 110
    mul-float/2addr p1, v0

    .line 111
    float-to-int p1, p1

    .line 112
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 113
    .line 114
    .line 115
    :cond_0
    return-void
.end method
