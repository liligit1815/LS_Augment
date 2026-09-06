.class public Lcom/android/launcher3/dragndrop/J;
.super Lcom/android/launcher3/dragndrop/v;
.source "LauncherDragView.java"

# interfaces
.implements Lcom/android/launcher3/statemanager/d$g;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/dragndrop/v<",
        "Lcom/android/launcher3/C2;",
        ">;",
        "Lcom/android/launcher3/statemanager/d$g<",
        "Lcom/android/launcher3/V3;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;Landroid/graphics/drawable/Drawable;IIFFF)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p7}, Lcom/android/launcher3/dragndrop/v;-><init>(Landroid/content/Context;Landroid/graphics/drawable/Drawable;IIFFF)V

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/C2;Landroid/view/View;IIIIFFF)V
    .locals 0

    .line 2
    invoke-direct/range {p0 .. p9}, Lcom/android/launcher3/dragndrop/v;-><init>(Landroid/content/Context;Landroid/view/View;IIIIFFF)V

    return-void
.end method


# virtual methods
.method public G(Lcom/android/launcher3/V3;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    if-eq p1, v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/android/launcher3/V3;->q:Lcom/android/launcher3/V3;

    .line 6
    .line 7
    if-eq p1, v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/V3;->r:Lcom/android/launcher3/V3;

    .line 10
    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p1, 0x4

    .line 15
    goto :goto_1

    .line 16
    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 17
    :goto_1
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public m(IILjava/lang/Runnable;I)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->s:[I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/dragndrop/v;->n:I

    .line 4
    .line 5
    sub-int/2addr p1, v1

    .line 6
    const/4 v1, 0x0

    .line 7
    aput p1, v0, v1

    .line 8
    .line 9
    iget p1, p0, Lcom/android/launcher3/dragndrop/v;->o:I

    .line 10
    .line 11
    sub-int/2addr p2, p1

    .line 12
    const/4 p1, 0x1

    .line 13
    aput p2, v0, p1

    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 16
    .line 17
    check-cast p1, Lcom/android/launcher3/C2;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/v;->s:[I

    .line 24
    .line 25
    iget v4, p0, Lcom/android/launcher3/dragndrop/v;->r:F

    .line 26
    .line 27
    const/4 v6, 0x0

    .line 28
    const/high16 v3, 0x3f800000    # 1.0f

    .line 29
    .line 30
    move v5, v4

    .line 31
    move-object v1, p0

    .line 32
    move-object v7, p3

    .line 33
    move v8, p4

    .line 34
    invoke-virtual/range {v0 .. v8}, Lcom/android/launcher3/dragndrop/DragLayer;->j(Lcom/android/launcher3/dragndrop/v;[IFFFILjava/lang/Runnable;I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p0}, Lcom/android/launcher3/statemanager/d;->j(Lcom/android/launcher3/statemanager/d$g;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p0}, Lcom/android/launcher3/statemanager/d;->b0(Lcom/android/launcher3/statemanager/d$g;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public bridge synthetic onStateTransitionComplete(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/dragndrop/J;->G(Lcom/android/launcher3/V3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
