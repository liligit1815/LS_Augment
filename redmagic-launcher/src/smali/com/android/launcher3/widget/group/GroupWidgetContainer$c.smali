.class Lcom/android/launcher3/widget/group/GroupWidgetContainer$c;
.super Ljava/lang/Object;
.source "GroupWidgetContainer.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/group/GroupWidgetContainer;->n(IZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:I

.field final synthetic i:F

.field final synthetic j:F

.field final synthetic k:Lcom/android/launcher3/widget/group/GroupWidgetContainer;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/group/GroupWidgetContainer;IIFF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$c;->k:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$c;->g:I

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$c;->h:I

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$c;->i:F

    .line 8
    .line 9
    iput p5, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$c;->j:F

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
    .locals 4

    .line 1
    iget v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$c;->g:I

    .line 2
    .line 3
    int-to-float v1, v0

    .line 4
    iget v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$c;->h:I

    .line 5
    .line 6
    sub-int/2addr v2, v0

    .line 7
    int-to-float v0, v2

    .line 8
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    mul-float/2addr v0, v2

    .line 13
    add-float/2addr v1, v0

    .line 14
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$c;->k:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v1, v2, v0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->scrollTo(II)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$c;->k:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->j(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getDuration()J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    const-wide/16 v2, 0x0

    .line 37
    .line 38
    cmp-long v0, v0, v2

    .line 39
    .line 40
    const/high16 v1, 0x3f800000    # 1.0f

    .line 41
    .line 42
    if-lez v0, :cond_0

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getCurrentPlayTime()J

    .line 45
    .line 46
    .line 47
    move-result-wide v2

    .line 48
    long-to-float v0, v2

    .line 49
    mul-float/2addr v0, v1

    .line 50
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getDuration()J

    .line 51
    .line 52
    .line 53
    move-result-wide v2

    .line 54
    long-to-float p1, v2

    .line 55
    div-float/2addr v0, p1

    .line 56
    goto :goto_0

    .line 57
    :cond_0
    move v0, v1

    .line 58
    :goto_0
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    iget v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$c;->i:F

    .line 63
    .line 64
    iget v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$c;->j:F

    .line 65
    .line 66
    sub-float/2addr v2, v0

    .line 67
    mul-float/2addr v2, p1

    .line 68
    add-float/2addr v0, v2

    .line 69
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$c;->k:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 70
    .line 71
    invoke-static {p1}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->c(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_1

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_1
    move v1, v0

    .line 79
    :goto_1
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$c;->k:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 80
    .line 81
    invoke-static {p1}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->j(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleX(F)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$c;->k:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 89
    .line 90
    invoke-static {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->j(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 95
    .line 96
    .line 97
    :cond_2
    return-void
.end method
