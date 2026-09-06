.class public Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;
.super Landroid/widget/LinearLayout;
.source "PersonalWorkSlidingTabStrip.java"

# interfaces
.implements Lcom/android/launcher3/pageindicators/d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip$a;
    }
.end annotation


# instance fields
.field private final g:Z

.field private h:Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip$a;

.field private i:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;->i:I

    .line 6
    .line 7
    sget-object v1, Lcom/android/launcher3/x5;->f2:[I

    .line 8
    .line 9
    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    iput-boolean p2, p0, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;->g:Z

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static e(Landroid/content/Context;I)I
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 6
    .line 7
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget v0, p0, Lcom/android/launcher3/h0;->M2:I

    .line 12
    .line 13
    div-int v0, p1, v0

    .line 14
    .line 15
    iget p0, p0, Lcom/android/launcher3/h0;->J2:I

    .line 16
    .line 17
    sub-int/2addr v0, p0

    .line 18
    sub-int/2addr p1, v0

    .line 19
    return p1
.end method


# virtual methods
.method public d(II)V
    .locals 0

    .line 1
    return-void
.end method

.method public f(I)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Landroid/widget/Button;

    .line 14
    .line 15
    if-ne v1, p1, :cond_0

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    move v3, v0

    .line 20
    :goto_1
    invoke-virtual {v2, v3}, Landroid/widget/Button;->setSelected(Z)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return-void
.end method

.method public hasOverlappingRendering()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected onMeasure(II)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0, p1}, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;->e(Landroid/content/Context;I)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const/high16 v0, 0x40000000    # 2.0f

    .line 18
    .line 19
    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public setActiveMarker(I)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;->f(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;->h:Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip$a;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget v1, p0, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;->i:I

    .line 9
    .line 10
    if-eq v1, p1, :cond_0

    .line 11
    .line 12
    invoke-interface {v0, p1}, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip$a;->i(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iput p1, p0, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;->i:I

    .line 16
    .line 17
    return-void
.end method

.method public setArrowClickListener(Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Lcom/android/launcher3/pageindicators/a;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public setMarkersCount(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public setOnActivePageChangedListener(Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;->h:Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip$a;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic setPaintColor(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/pageindicators/d;->setPaintColor(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic setShouldAutoHide(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/pageindicators/d;->setShouldAutoHide(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
