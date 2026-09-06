.class public Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;
.super Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
.source "SurfaceTransaction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/SurfaceTransaction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MockProperties"
.end annotation


# instance fields
.field public alpha:F

.field public cornerRadius:F

.field public matrix:Landroid/graphics/Matrix;

.field public shadowRadius:F

.field public windowCrop:Landroid/graphics/Rect;


# direct methods
.method protected constructor <init>(Lcom/android/quickstep/util/SurfaceTransaction;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;-><init>(Lcom/android/quickstep/util/SurfaceTransaction;Landroid/view/SurfaceControl;)V

    .line 3
    .line 4
    .line 5
    const/high16 p1, -0x40800000    # -1.0f

    .line 6
    .line 7
    iput p1, p0, Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;->alpha:F

    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;->matrix:Landroid/graphics/Matrix;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;->windowCrop:Landroid/graphics/Rect;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput p1, p0, Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;->cornerRadius:F

    .line 15
    .line 16
    iput p1, p0, Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;->shadowRadius:F

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;->alpha:F

    .line 2
    .line 3
    return-object p0
.end method

.method public setCornerRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;->cornerRadius:F

    .line 2
    .line 3
    return-object p0
.end method

.method public setLayer(I)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
    .locals 0

    .line 1
    return-object p0
.end method

.method public setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;->matrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public setShadowRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;->shadowRadius:F

    .line 2
    .line 3
    return-object p0
.end method

.method public setShow()Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
    .locals 0

    .line 1
    return-object p0
.end method

.method public setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;->windowCrop:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method
