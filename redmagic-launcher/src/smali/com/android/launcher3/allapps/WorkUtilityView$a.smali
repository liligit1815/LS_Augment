.class Lcom/android/launcher3/allapps/WorkUtilityView$a;
.super Ljava/lang/Object;
.source "WorkUtilityView.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/allapps/WorkUtilityView;->s(Z)Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/allapps/WorkUtilityView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/allapps/WorkUtilityView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView$a;->g:Lcom/android/launcher3/allapps/WorkUtilityView;

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
    .locals 1

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
    iget-object v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView$a;->g:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/android/launcher3/allapps/WorkUtilityView;->i(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/ImageButton;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setScaleX(F)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView$a;->g:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->i(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/ImageButton;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setScaleY(F)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
