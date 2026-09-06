.class Lcom/android/launcher3/allapps/i0$l;
.super Ljava/lang/Object;
.source "PrivateProfileManager.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/allapps/i0;->G0(Z)Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/allapps/i0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/allapps/i0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/i0$l;->g:Lcom/android/launcher3/allapps/i0;

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
    iget-object v0, p0, Lcom/android/launcher3/allapps/i0$l;->g:Lcom/android/launcher3/allapps/i0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/allapps/i0;->E(Lcom/android/launcher3/allapps/i0;)Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/allapps/i0$l;->g:Lcom/android/launcher3/allapps/i0;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/android/launcher3/allapps/i0;->E(Lcom/android/launcher3/allapps/i0;)Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ljava/lang/Float;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setTranslationY(F)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
