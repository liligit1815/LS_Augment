.class Lcom/android/quickstep/AbsSwipeUpHandler$14;
.super Landroidx/dynamicanimation/animation/g;
.source "AbsSwipeUpHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/AbsSwipeUpHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/dynamicanimation/animation/g<",
        "Lcom/android/quickstep/AbsSwipeUpHandler<",
        "***>;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/dynamicanimation/animation/g;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getValue(Lcom/android/quickstep/AbsSwipeUpHandler;)F
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/AbsSwipeUpHandler<",
            "***>;)F"
        }
    .end annotation

    .line 2
    const-string p0, "handle"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    invoke-virtual {p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->getRecentsViewScaleProgress()F

    move-result p0

    return p0
.end method

.method public bridge synthetic getValue(Ljava/lang/Object;)F
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/AbsSwipeUpHandler;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler$14;->getValue(Lcom/android/quickstep/AbsSwipeUpHandler;)F

    move-result p0

    return p0
.end method

.method public setValue(Lcom/android/quickstep/AbsSwipeUpHandler;F)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/AbsSwipeUpHandler<",
            "***>;F)V"
        }
    .end annotation

    .line 2
    const-string p0, "handle"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    invoke-virtual {p1, p2}, Lcom/android/quickstep/AbsSwipeUpHandler;->updateRecentsViewScaleProgress(F)V

    return-void
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;F)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/AbsSwipeUpHandler;

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/AbsSwipeUpHandler$14;->setValue(Lcom/android/quickstep/AbsSwipeUpHandler;F)V

    return-void
.end method
