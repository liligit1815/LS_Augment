.class public Lcom/android/launcher3/workprofile/a;
.super Lcom/android/launcher3/V4;
.source "PersonalWorkPagedView.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/V4<",
        "Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/workprofile/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/V4;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    sget-object v0, Lcom/android/launcher3/x5;->d2:[I

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, -0x1

    .line 4
    invoke-virtual {p1, v1, p2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/V4;->mPageIndicatorViewId:I

    .line 5
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method protected canScroll(FF)Z
    .locals 1

    .line 1
    cmpl-float v0, p2, p1

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/V4;->canScroll(FF)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method protected determineScrollingStart(Landroid/view/MotionEvent;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getDownMotionX()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-float/2addr v0, v1

    .line 10
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getDownMotionY()F

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    sub-float/2addr v1, v2

    .line 23
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-static {v0, v2}, Ljava/lang/Float;->compare(FF)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-nez v2, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    div-float v2, v1, v0

    .line 36
    .line 37
    float-to-double v3, v2

    .line 38
    invoke-static {v3, v4}, Ljava/lang/Math;->atan(D)D

    .line 39
    .line 40
    .line 41
    move-result-wide v3

    .line 42
    double-to-float v3, v3

    .line 43
    iget v4, p0, Lcom/android/launcher3/V4;->mTouchSlop:I

    .line 44
    .line 45
    int-to-float v5, v4

    .line 46
    cmpl-float v5, v0, v5

    .line 47
    .line 48
    if-gtz v5, :cond_1

    .line 49
    .line 50
    mul-int/lit8 v4, v4, 0x3

    .line 51
    .line 52
    int-to-float v4, v4

    .line 53
    cmpl-float v4, v1, v4

    .line 54
    .line 55
    if-lez v4, :cond_2

    .line 56
    .line 57
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->cancelCurrentPageLongPress()V

    .line 58
    .line 59
    .line 60
    new-instance v4, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    const-string v5, "determineScrollingStart, cancelCurrentPageLongPress absDeltaX:"

    .line 66
    .line 67
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v0, " absDeltaY:"

    .line 74
    .line 75
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v0, " slope:"

    .line 82
    .line 83
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string v0, " theta:"

    .line 90
    .line 91
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    const-string v1, "PersonalWorkPagedView"

    .line 102
    .line 103
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    :cond_2
    const v0, 0x3f860a92

    .line 107
    .line 108
    .line 109
    cmpl-float v0, v3, v0

    .line 110
    .line 111
    if-lez v0, :cond_3

    .line 112
    .line 113
    :goto_0
    return-void

    .line 114
    :cond_3
    const v0, 0x3f060a92

    .line 115
    .line 116
    .line 117
    cmpl-float v1, v3, v0

    .line 118
    .line 119
    if-lez v1, :cond_4

    .line 120
    .line 121
    sub-float/2addr v3, v0

    .line 122
    div-float/2addr v3, v0

    .line 123
    float-to-double v0, v3

    .line 124
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 125
    .line 126
    .line 127
    move-result-wide v0

    .line 128
    double-to-float v0, v0

    .line 129
    const/high16 v1, 0x40800000    # 4.0f

    .line 130
    .line 131
    mul-float/2addr v0, v1

    .line 132
    const/high16 v1, 0x3f800000    # 1.0f

    .line 133
    .line 134
    add-float/2addr v0, v1

    .line 135
    invoke-super {p0, p1, v0}, Lcom/android/launcher3/V4;->determineScrollingStart(Landroid/view/MotionEvent;F)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_4
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->determineScrollingStart(Landroid/view/MotionEvent;)V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method protected getCurrentPageDescription()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public hasOverlappingRendering()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public initParentViews(Landroid/view/View;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/V4;->mPageIndicatorViewId:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-le v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 11
    .line 12
    check-cast p1, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPanelCount()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    div-int/2addr v0, p0

    .line 23
    invoke-virtual {p1, v0}, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;->setMarkersCount(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method protected onScrollChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/launcher3/V4;->onScrollChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 5
    .line 6
    check-cast p2, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;

    .line 7
    .line 8
    iget p0, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 9
    .line 10
    invoke-virtual {p2, p1, p0}, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;->d(II)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
