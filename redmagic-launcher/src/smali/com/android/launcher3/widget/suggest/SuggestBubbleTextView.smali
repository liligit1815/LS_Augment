.class public Lcom/android/launcher3/widget/suggest/SuggestBubbleTextView;
.super Lcom/android/launcher3/BubbleTextView;
.source "SuggestBubbleTextView.java"

# interfaces
.implements Lcom/android/launcher3/widget/suggest/e;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/suggest/SuggestBubbleTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/BubbleTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/suggest/SuggestBubbleTextView;->setTextVisibility(Z)V

    const/4 p2, 0x0

    .line 4
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 6
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/suggest/SuggestBubbleTextView;->setTextColor(I)V

    return-void
.end method


# virtual methods
.method protected Z(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(FF)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/BubbleTextView;->p0(FF)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getIconRangeDelta()F
    .locals 0

    .line 1
    const p0, -0x42333333    # -0.1f

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method protected onMeasure(II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/BubbleTextView;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 5
    .line 6
    .line 7
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget p2, p0, Lcom/android/launcher3/BubbleTextView;->t:I

    .line 12
    .line 13
    sub-int/2addr p1, p2

    .line 14
    div-int/lit8 p1, p1, 0x2

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingLeft()I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingRight()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p0, p2, p1, v0, p1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public bridge synthetic setForceHideRing(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/H;->setForceHideRing(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setTextColor(I)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-super {p0, p1}, Lcom/android/launcher3/BubbleTextView;->setTextColor(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setTextVisibility(Z)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->setTextAlpha(F)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
