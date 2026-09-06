.class public Lcom/android/launcher3/allapps/DiscoveryBounce$VerticalProgressWrapper;
.super Ljava/lang/Object;
.source "DiscoveryBounce.java"


# instance fields
.field private final a:Landroid/view/View;

.field private final b:F


# virtual methods
.method public getProgress()F
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/DiscoveryBounce$VerticalProgressWrapper;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget p0, p0, Lcom/android/launcher3/allapps/DiscoveryBounce$VerticalProgressWrapper;->b:F

    .line 8
    .line 9
    div-float/2addr v0, p0

    .line 10
    const/high16 p0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    add-float/2addr v0, p0

    .line 13
    return v0
.end method

.method public setProgress(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/DiscoveryBounce$VerticalProgressWrapper;->a:Landroid/view/View;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/allapps/DiscoveryBounce$VerticalProgressWrapper;->b:F

    .line 4
    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    sub-float/2addr p1, v1

    .line 8
    mul-float/2addr p0, p1

    .line 9
    invoke-virtual {v0, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
