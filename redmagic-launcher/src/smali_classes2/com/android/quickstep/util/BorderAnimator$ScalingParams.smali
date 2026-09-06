.class final Lcom/android/quickstep/util/BorderAnimator$ScalingParams;
.super Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;
.source "BorderAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/BorderAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ScalingParams"
.end annotation


# instance fields
.field private final alignmentAdjustmentInset:I

.field private final contentView:Landroid/view/View;


# direct methods
.method public constructor <init>(IILu4/l;Landroid/view/View;Landroid/view/View;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lu4/l<",
            "-",
            "Landroid/graphics/Rect;",
            "Lh4/t;",
            ">;",
            "Landroid/view/View;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "boundsBuilder"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "targetView"

    .line 7
    .line 8
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "contentView"

    .line 12
    .line 13
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;-><init>(IILu4/l;Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    iput-object p5, p0, Lcom/android/quickstep/util/BorderAnimator$ScalingParams;->contentView:Landroid/view/View;

    .line 20
    .line 21
    iput p2, p0, Lcom/android/quickstep/util/BorderAnimator$ScalingParams;->alignmentAdjustmentInset:I

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public getAlignmentAdjustmentInset()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/BorderAnimator$ScalingParams;->alignmentAdjustmentInset:I

    .line 2
    .line 3
    return p0
.end method

.method public getRadiusAdjustment()F
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getAlignmentAdjustment()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public onHideBorder()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->onHideBorder()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getTargetView()Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    int-to-float v1, v1

    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 22
    .line 23
    .line 24
    const/high16 v1, 0x3f800000    # 1.0f

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/quickstep/util/BorderAnimator$ScalingParams;->contentView:Landroid/view/View;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    int-to-float v0, v0

    .line 39
    const/high16 v2, 0x40000000    # 2.0f

    .line 40
    .line 41
    div-float/2addr v0, v2

    .line 42
    invoke-virtual {p0, v0}, Landroid/view/View;->setPivotX(F)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    int-to-float v0, v0

    .line 50
    div-float/2addr v0, v2

    .line 51
    invoke-virtual {p0, v0}, Landroid/view/View;->setPivotY(F)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public onShowBorder()V
    .locals 6

    .line 1
    invoke-super {p0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->onShowBorder()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getTargetView()Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    int-to-float v0, v0

    .line 13
    invoke-virtual {p0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getTargetView()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    int-to-float v1, v1

    .line 22
    const/4 v2, 0x0

    .line 23
    cmpg-float v3, v0, v2

    .line 24
    .line 25
    const/high16 v4, 0x3f800000    # 1.0f

    .line 26
    .line 27
    if-nez v3, :cond_0

    .line 28
    .line 29
    move v3, v4

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getBorderWidthPx()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    mul-int/lit8 v3, v3, 0x2

    .line 36
    .line 37
    int-to-float v3, v3

    .line 38
    div-float/2addr v3, v0

    .line 39
    add-float/2addr v3, v4

    .line 40
    :goto_0
    cmpg-float v0, v1, v2

    .line 41
    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    move v0, v4

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getBorderWidthPx()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    mul-int/lit8 v0, v0, 0x2

    .line 51
    .line 52
    int-to-float v0, v0

    .line 53
    div-float/2addr v0, v1

    .line 54
    add-float/2addr v0, v4

    .line 55
    :goto_1
    invoke-virtual {p0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getTargetView()Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    int-to-float v2, v2

    .line 64
    const/high16 v5, 0x40000000    # 2.0f

    .line 65
    .line 66
    div-float/2addr v2, v5

    .line 67
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotX(F)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    int-to-float v2, v2

    .line 75
    div-float/2addr v2, v5

    .line 76
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotY(F)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1, v3}, Landroid/view/View;->setScaleX(F)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, v0}, Landroid/view/View;->setScaleY(F)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/android/quickstep/util/BorderAnimator$ScalingParams;->contentView:Landroid/view/View;

    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    int-to-float v1, v1

    .line 92
    div-float/2addr v1, v5

    .line 93
    invoke-virtual {p0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    int-to-float v1, v1

    .line 101
    div-float/2addr v1, v5

    .line 102
    invoke-virtual {p0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 103
    .line 104
    .line 105
    div-float v1, v4, v3

    .line 106
    .line 107
    invoke-virtual {p0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 108
    .line 109
    .line 110
    div-float/2addr v4, v0

    .line 111
    invoke-virtual {p0, v4}, Landroid/view/View;->setScaleY(F)V

    .line 112
    .line 113
    .line 114
    return-void
.end method
