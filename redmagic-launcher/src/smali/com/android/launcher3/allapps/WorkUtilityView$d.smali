.class Lcom/android/launcher3/allapps/WorkUtilityView$d;
.super Ljava/lang/Object;
.source "WorkUtilityView.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/allapps/WorkUtilityView;->u(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:Lcom/android/launcher3/allapps/WorkUtilityView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/allapps/WorkUtilityView;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$d;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/allapps/WorkUtilityView$d;->g:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
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
    iget v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView$d;->g:I

    .line 12
    .line 13
    int-to-float v0, v0

    .line 14
    div-float v0, p1, v0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$d;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 17
    .line 18
    invoke-static {v1}, Lcom/android/launcher3/allapps/WorkUtilityView;->h(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/TextView;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 27
    .line 28
    float-to-int p1, p1

    .line 29
    iput p1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 30
    .line 31
    iget-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$d;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/android/launcher3/allapps/WorkUtilityView;->l(Lcom/android/launcher3/allapps/WorkUtilityView;)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    int-to-float p1, p1

    .line 38
    mul-float/2addr p1, v0

    .line 39
    float-to-int p1, p1

    .line 40
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$d;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 44
    .line 45
    invoke-static {p1}, Lcom/android/launcher3/allapps/WorkUtilityView;->k(Lcom/android/launcher3/allapps/WorkUtilityView;)I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    int-to-float p1, p1

    .line 50
    mul-float/2addr p1, v0

    .line 51
    float-to-int p1, p1

    .line 52
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$d;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 56
    .line 57
    invoke-static {p1}, Lcom/android/launcher3/allapps/WorkUtilityView;->h(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/TextView;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$d;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 65
    .line 66
    invoke-static {p1}, Lcom/android/launcher3/allapps/WorkUtilityView;->m(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/ImageView;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 75
    .line 76
    iget-object v1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$d;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 77
    .line 78
    invoke-static {v1}, Lcom/android/launcher3/allapps/WorkUtilityView;->g(Lcom/android/launcher3/allapps/WorkUtilityView;)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    int-to-float v1, v1

    .line 83
    mul-float/2addr v1, v0

    .line 84
    float-to-int v0, v1

    .line 85
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView$d;->h:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 89
    .line 90
    invoke-static {p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->m(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/ImageView;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method
