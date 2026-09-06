.class Lcom/android/launcher3/CellLayout$e;
.super Ljava/lang/Object;
.source "CellLayout.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/CellLayout;->g(Landroid/view/View;IIIIZZ)Z
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

.field final synthetic k:Landroid/view/View;

.field final synthetic l:I

.field final synthetic m:Lcom/android/launcher3/G5;

.field final synthetic n:F

.field final synthetic o:F

.field final synthetic p:I

.field final synthetic q:I

.field final synthetic r:Lcom/android/launcher3/CellLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/CellLayout;FFFFLandroid/view/View;ILcom/android/launcher3/G5;FFII)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/CellLayout$e;->r:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/CellLayout$e;->g:F

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/CellLayout$e;->h:F

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/CellLayout$e;->i:F

    .line 8
    .line 9
    iput p5, p0, Lcom/android/launcher3/CellLayout$e;->j:F

    .line 10
    .line 11
    iput-object p6, p0, Lcom/android/launcher3/CellLayout$e;->k:Landroid/view/View;

    .line 12
    .line 13
    iput p7, p0, Lcom/android/launcher3/CellLayout$e;->l:I

    .line 14
    .line 15
    iput-object p8, p0, Lcom/android/launcher3/CellLayout$e;->m:Lcom/android/launcher3/G5;

    .line 16
    .line 17
    iput p9, p0, Lcom/android/launcher3/CellLayout$e;->n:F

    .line 18
    .line 19
    iput p10, p0, Lcom/android/launcher3/CellLayout$e;->o:F

    .line 20
    .line 21
    iput p11, p0, Lcom/android/launcher3/CellLayout$e;->p:I

    .line 22
    .line 23
    iput p12, p0, Lcom/android/launcher3/CellLayout$e;->q:I

    .line 24
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    .line 27
    .line 28
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
    const/high16 v0, 0x3f800000    # 1.0f

    .line 12
    .line 13
    sub-float/2addr v0, p1

    .line 14
    iget v1, p0, Lcom/android/launcher3/CellLayout$e;->g:F

    .line 15
    .line 16
    mul-float/2addr v1, v0

    .line 17
    iget v2, p0, Lcom/android/launcher3/CellLayout$e;->h:F

    .line 18
    .line 19
    mul-float/2addr v2, p1

    .line 20
    add-float/2addr v1, v2

    .line 21
    iget v2, p0, Lcom/android/launcher3/CellLayout$e;->i:F

    .line 22
    .line 23
    mul-float/2addr v0, v2

    .line 24
    iget v2, p0, Lcom/android/launcher3/CellLayout$e;->j:F

    .line 25
    .line 26
    mul-float/2addr v2, p1

    .line 27
    add-float/2addr v0, v2

    .line 28
    invoke-static {}, Lx1/O;->C3()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    const/4 v3, 0x1

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    iget-object v2, p0, Lcom/android/launcher3/CellLayout$e;->k:Landroid/view/View;

    .line 36
    .line 37
    const v4, 0x7f0b04c8

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v4}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    instance-of v2, v2, Ljava/lang/Integer;

    .line 45
    .line 46
    if-eqz v2, :cond_0

    .line 47
    .line 48
    iget v1, p0, Lcom/android/launcher3/CellLayout$e;->l:I

    .line 49
    .line 50
    int-to-float v1, v1

    .line 51
    move v2, v3

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    const/4 v2, 0x0

    .line 54
    :goto_0
    iget-object v4, p0, Lcom/android/launcher3/CellLayout$e;->m:Lcom/android/launcher3/G5;

    .line 55
    .line 56
    invoke-interface {v4}, Lcom/android/launcher3/G5;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-virtual {v4, v3, v1, v0}, Lcom/android/launcher3/util/z1;->c(IFF)V

    .line 61
    .line 62
    .line 63
    invoke-static {}, Lx1/O;->C3()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    if-nez v2, :cond_1

    .line 70
    .line 71
    iget v0, p0, Lcom/android/launcher3/CellLayout$e;->n:F

    .line 72
    .line 73
    const/4 v1, 0x0

    .line 74
    cmpl-float v2, v0, v1

    .line 75
    .line 76
    if-lez v2, :cond_1

    .line 77
    .line 78
    iget v2, p0, Lcom/android/launcher3/CellLayout$e;->o:F

    .line 79
    .line 80
    cmpl-float v1, v2, v1

    .line 81
    .line 82
    if-lez v1, :cond_1

    .line 83
    .line 84
    sub-float/2addr v2, v0

    .line 85
    mul-float/2addr v2, p1

    .line 86
    add-float/2addr v0, v2

    .line 87
    iget-object v1, p0, Lcom/android/launcher3/CellLayout$e;->k:Landroid/view/View;

    .line 88
    .line 89
    invoke-virtual {v1, v0}, Landroid/view/View;->setScaleX(F)V

    .line 90
    .line 91
    .line 92
    iget-object v1, p0, Lcom/android/launcher3/CellLayout$e;->k:Landroid/view/View;

    .line 93
    .line 94
    invoke-virtual {v1, v0}, Landroid/view/View;->setScaleY(F)V

    .line 95
    .line 96
    .line 97
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout$e;->r:Lcom/android/launcher3/CellLayout;

    .line 98
    .line 99
    instance-of v1, v0, Lcom/android/launcher3/Hotseat;

    .line 100
    .line 101
    if-eqz v1, :cond_3

    .line 102
    .line 103
    iget v1, p0, Lcom/android/launcher3/CellLayout$e;->p:I

    .line 104
    .line 105
    if-eqz v1, :cond_2

    .line 106
    .line 107
    int-to-float v1, v1

    .line 108
    mul-float/2addr v1, p1

    .line 109
    check-cast v0, Lcom/android/launcher3/Hotseat;

    .line 110
    .line 111
    invoke-virtual {v0, v1, v3}, Lcom/android/launcher3/Hotseat;->r1(FZ)V

    .line 112
    .line 113
    .line 114
    :cond_2
    iget v0, p0, Lcom/android/launcher3/CellLayout$e;->q:I

    .line 115
    .line 116
    if-eqz v0, :cond_3

    .line 117
    .line 118
    int-to-float v0, v0

    .line 119
    mul-float/2addr p1, v0

    .line 120
    iget-object p0, p0, Lcom/android/launcher3/CellLayout$e;->r:Lcom/android/launcher3/CellLayout;

    .line 121
    .line 122
    check-cast p0, Lcom/android/launcher3/Hotseat;

    .line 123
    .line 124
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Hotseat;->setTableRecentHotseatBgAnimingOffset(F)V

    .line 125
    .line 126
    .line 127
    :cond_3
    return-void
.end method
