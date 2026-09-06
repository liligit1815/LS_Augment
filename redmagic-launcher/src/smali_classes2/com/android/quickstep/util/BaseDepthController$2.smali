.class Lcom/android/quickstep/util/BaseDepthController$2;
.super Landroid/util/FloatProperty;
.source "BaseDepthController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/BaseDepthController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/FloatProperty<",
        "Lcom/android/quickstep/util/BaseDepthController;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/util/FloatProperty;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public get(Lcom/android/quickstep/util/BaseDepthController;)Ljava/lang/Float;
    .locals 0

    .line 2
    iget p0, p1, Lcom/android/quickstep/util/BaseDepthController;->mCurrentBlur:I

    invoke-virtual {p1}, Lcom/android/quickstep/util/BaseDepthController;->getMaxBlurRadius()I

    move-result p1

    div-int/2addr p0, p1

    int-to-float p0, p0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/util/BaseDepthController;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/BaseDepthController$2;->get(Lcom/android/quickstep/util/BaseDepthController;)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method

.method public setValue(Lcom/android/quickstep/util/BaseDepthController;F)V
    .locals 1

    const/4 p0, 0x1

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, p2, p0, v0}, Lcom/android/quickstep/util/BaseDepthController;->setDepth(FZZ)V

    return-void
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;F)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/util/BaseDepthController;

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/BaseDepthController$2;->setValue(Lcom/android/quickstep/util/BaseDepthController;F)V

    return-void
.end method
