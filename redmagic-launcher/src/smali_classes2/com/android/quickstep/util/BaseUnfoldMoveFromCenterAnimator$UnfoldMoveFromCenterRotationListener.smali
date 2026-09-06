.class Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator$UnfoldMoveFromCenterRotationListener;
.super Ljava/lang/Object;
.source "BaseUnfoldMoveFromCenterAnimator.java"

# interfaces
.implements LE2/c$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UnfoldMoveFromCenterRotationListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;


# direct methods
.method private constructor <init>(Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator$UnfoldMoveFromCenterRotationListener;->this$0:Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;Lcom/android/quickstep/util/G;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator$UnfoldMoveFromCenterRotationListener;-><init>(Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;)V

    return-void
.end method

.method private onRotationChangedInternal(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator$UnfoldMoveFromCenterRotationListener;->this$0:Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->a(Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;)Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;->updateDisplayProperties(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator$UnfoldMoveFromCenterRotationListener;->this$0:Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->updateRegisteredViewsIfNeeded()V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public onRotationChanged(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator$UnfoldMoveFromCenterRotationListener;->onRotationChangedInternal(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
