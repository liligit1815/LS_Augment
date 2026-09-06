.class Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;
.super Ljava/lang/Object;
.source "GroupWidgetBackgroundLayout.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->d(ZZJ)V
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

.field final synthetic k:F

.field final synthetic l:F

.field final synthetic m:F

.field final synthetic n:F

.field final synthetic o:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;FFFFFFFF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->o:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->g:F

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->h:F

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->i:F

    .line 8
    .line 9
    iput p5, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->j:F

    .line 10
    .line 11
    iput p6, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->k:F

    .line 12
    .line 13
    iput p7, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->l:F

    .line 14
    .line 15
    iput p8, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->m:F

    .line 16
    .line 17
    iput p9, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->n:F

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
    .locals 4

    .line 1
    iget v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->g:F

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->h:F

    .line 4
    .line 5
    sub-float/2addr v1, v0

    .line 6
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    mul-float/2addr v1, v2

    .line 11
    add-float/2addr v0, v1

    .line 12
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->i:F

    .line 13
    .line 14
    iget v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->j:F

    .line 15
    .line 16
    sub-float/2addr v2, v1

    .line 17
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    mul-float/2addr v2, v3

    .line 22
    add-float/2addr v1, v2

    .line 23
    iget-object v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->o:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 24
    .line 25
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->o:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 31
    .line 32
    .line 33
    iget v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->k:F

    .line 34
    .line 35
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->l:F

    .line 36
    .line 37
    sub-float/2addr v1, v0

    .line 38
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    mul-float/2addr v1, v2

    .line 43
    add-float/2addr v0, v1

    .line 44
    iget-object v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->o:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 45
    .line 46
    invoke-static {v1}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->b(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;)Landroid/widget/ImageView;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    if-eqz v1, :cond_0

    .line 51
    .line 52
    iget-object v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->o:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 53
    .line 54
    invoke-static {v1}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->b(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;)Landroid/widget/ImageView;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 59
    .line 60
    .line 61
    :cond_0
    iget v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->m:F

    .line 62
    .line 63
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->n:F

    .line 64
    .line 65
    sub-float/2addr v1, v0

    .line 66
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    mul-float/2addr v1, p1

    .line 71
    add-float/2addr v0, v1

    .line 72
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->o:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    instance-of p1, p1, Lcom/android/launcher3/widget/group/GroupWidgetLayout;

    .line 79
    .line 80
    if-eqz p1, :cond_1

    .line 81
    .line 82
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->o:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 83
    .line 84
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    check-cast p1, Lcom/android/launcher3/widget/group/GroupWidgetLayout;

    .line 89
    .line 90
    invoke-virtual {p1}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->getGroupWidgetContainer()Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    if-eqz p1, :cond_1

    .line 95
    .line 96
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$b;->o:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    check-cast p0, Lcom/android/launcher3/widget/group/GroupWidgetLayout;

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/android/launcher3/widget/group/GroupWidgetLayout;->getGroupWidgetContainer()Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    float-to-int p1, v0

    .line 109
    invoke-virtual {p0, p1, p1}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->B(II)V

    .line 110
    .line 111
    .line 112
    :cond_1
    return-void
.end method
