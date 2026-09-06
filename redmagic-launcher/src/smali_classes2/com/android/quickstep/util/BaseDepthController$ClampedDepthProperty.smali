.class public Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;
.super Landroid/util/FloatProperty;
.source "BaseDepthController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/BaseDepthController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ClampedDepthProperty"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/FloatProperty<",
        "LP1/h;",
        ">;"
    }
.end annotation


# instance fields
.field private mBlur:Z

.field private final mMaxValue:F

.field private final mMinValue:F

.field private mZoom:Z


# direct methods
.method public constructor <init>(FF)V
    .locals 1

    .line 1
    const-string v0, "depthClamped"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Landroid/util/FloatProperty;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;->mBlur:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;->mZoom:Z

    .line 10
    .line 11
    iput p1, p0, Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;->mMinValue:F

    .line 12
    .line 13
    iput p2, p0, Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;->mMaxValue:F

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public get(LP1/h;)Ljava/lang/Float;
    .locals 0

    .line 2
    iget p0, p1, Lcom/android/quickstep/util/BaseDepthController;->mDepth:F

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, LP1/h;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;->get(LP1/h;)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method

.method public setBlur(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;->mBlur:Z

    .line 2
    .line 3
    return-void
.end method

.method public setValue(LP1/h;F)V
    .locals 1

    .line 2
    iget-boolean v0, p0, Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;->mBlur:Z

    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/BaseDepthController;->setBlur(Z)V

    .line 3
    iget-boolean v0, p0, Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;->mZoom:Z

    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/BaseDepthController;->setZoom(Z)V

    .line 4
    iget v0, p0, Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;->mMinValue:F

    iget p0, p0, Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;->mMaxValue:F

    invoke-static {p2, v0, p0}, Lcom/android/launcher3/N5;->b(FFF)F

    move-result p0

    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/BaseDepthController;->setDepth(F)V

    return-void
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;F)V
    .locals 0

    .line 1
    check-cast p1, LP1/h;

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;->setValue(LP1/h;F)V

    return-void
.end method

.method public setZoom(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;->mZoom:Z

    .line 2
    .line 3
    return-void
.end method
