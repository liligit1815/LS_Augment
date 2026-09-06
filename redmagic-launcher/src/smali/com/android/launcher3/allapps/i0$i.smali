.class Lcom/android/launcher3/allapps/i0$i;
.super Ljava/lang/Object;
.source "PrivateProfileManager.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/allapps/i0;->T(Z)Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:Lcom/android/launcher3/allapps/i0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/allapps/i0;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/i0$i;->h:Lcom/android/launcher3/allapps/i0;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/allapps/i0$i;->g:I

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
    iget v0, p0, Lcom/android/launcher3/allapps/i0$i;->g:I

    .line 12
    .line 13
    int-to-float v0, v0

    .line 14
    div-float v0, p1, v0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/allapps/i0$i;->h:Lcom/android/launcher3/allapps/i0;

    .line 17
    .line 18
    invoke-static {v1}, Lcom/android/launcher3/allapps/i0;->F(Lcom/android/launcher3/allapps/i0;)Landroid/widget/TextView;

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
    iget-object p1, p0, Lcom/android/launcher3/allapps/i0$i;->h:Lcom/android/launcher3/allapps/i0;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/android/launcher3/allapps/i0;->H(Lcom/android/launcher3/allapps/i0;)I

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
    iget-object p1, p0, Lcom/android/launcher3/allapps/i0$i;->h:Lcom/android/launcher3/allapps/i0;

    .line 44
    .line 45
    invoke-static {p1}, Lcom/android/launcher3/allapps/i0;->G(Lcom/android/launcher3/allapps/i0;)I

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
    iget-object p1, p0, Lcom/android/launcher3/allapps/i0$i;->h:Lcom/android/launcher3/allapps/i0;

    .line 56
    .line 57
    invoke-static {p1}, Lcom/android/launcher3/allapps/i0;->F(Lcom/android/launcher3/allapps/i0;)Landroid/widget/TextView;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0$i;->h:Lcom/android/launcher3/allapps/i0;

    .line 65
    .line 66
    invoke-static {p0}, Lcom/android/launcher3/allapps/i0;->F(Lcom/android/launcher3/allapps/i0;)Landroid/widget/TextView;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Landroid/widget/TextView;->requestLayout()V

    .line 71
    .line 72
    .line 73
    return-void
.end method
