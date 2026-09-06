.class public Lcom/android/quickstep/util/LauncherViewsMoveFromCenterTranslationApplier;
.super Ljava/lang/Object;
.source "LauncherViewsMoveFromCenterTranslationApplier.java"

# interfaces
.implements Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator$TranslationApplier;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public apply(Landroid/view/View;FF)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/android/launcher3/G5;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/G5;

    .line 6
    .line 7
    invoke-interface {p1}, Lcom/android/launcher3/G5;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 p1, 0x2

    .line 12
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/util/z1;->c(IFF)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationX(F)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p3}, Landroid/view/View;->setTranslationY(F)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
