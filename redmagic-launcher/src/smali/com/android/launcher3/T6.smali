.class public abstract Lcom/android/launcher3/T6;
.super Lcom/android/launcher3/V4;
.source "ZtePagedViewImpl.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/view/View;",
        ":",
        "Lcom/android/launcher3/pageindicators/d;",
        ">",
        "Lcom/android/launcher3/V4<",
        "TT;>;"
    }
.end annotation


# instance fields
.field protected g:Lcom/android/launcher3/L5;

.field private h:I

.field private i:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/T6;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/V4;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    invoke-static {}, Lx1/O;->O1()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 4
    new-instance p2, Lcom/android/launcher3/L5;

    iget-object p3, p0, Lcom/android/launcher3/V4;->SCROLL_NEBULAOS2:Landroid/view/animation/Interpolator;

    invoke-direct {p2, p1, p3}, Lcom/android/launcher3/L5;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object p2, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    goto :goto_0

    .line 5
    :cond_0
    new-instance p2, Lcom/android/launcher3/L5;

    sget-object p3, LJ0/h;->Z:Landroid/view/animation/Interpolator;

    invoke-direct {p2, p1, p3}, Lcom/android/launcher3/L5;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object p2, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    :goto_0
    const/4 p1, -0x1

    .line 6
    iput p1, p0, Lcom/android/launcher3/V4;->mScrollMode:I

    return-void
.end method

.method protected static final N(F)I
    .locals 1

    .line 1
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 13
    .line 14
    const-string v0, "Cannot round NaN value."

    .line 15
    .line 16
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw p0
.end method


# virtual methods
.method protected H(FI)I
    .locals 0

    .line 1
    int-to-float p0, p2

    .line 2
    div-float/2addr p1, p0

    .line 3
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/high16 p1, 0x447a0000    # 1000.0f

    .line 8
    .line 9
    mul-float/2addr p0, p1

    .line 10
    const/high16 p1, 0x40600000    # 3.5f

    .line 11
    .line 12
    mul-float/2addr p0, p1

    .line 13
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :cond_0
    invoke-static {p0}, Lcom/android/launcher3/T6;->N(F)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method protected K(FII)I
    .locals 6

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/android/launcher3/util/g0;->i(Landroid/content/Context;)Lx2/h;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    add-int v1, p3, p2

    .line 14
    .line 15
    new-instance v2, Lcom/android/quickstep/util/animation/SpringForce;

    .line 16
    .line 17
    int-to-float v3, v1

    .line 18
    invoke-direct {v2, v3}, Lcom/android/quickstep/util/animation/SpringForce;-><init>(F)V

    .line 19
    .line 20
    .line 21
    const v3, 0x7f070490

    .line 22
    .line 23
    .line 24
    invoke-interface {v0, v3}, Lx2/h;->getFloat(I)F

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    invoke-virtual {v2, v3}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    const v3, 0x7f07048f

    .line 33
    .line 34
    .line 35
    invoke-interface {v0, v3}, Lx2/h;->getFloat(I)F

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {v2, v0}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v2, "springForce"

    .line 44
    .line 45
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    new-instance v2, Lcom/android/quickstep/util/animation/SpringHolder;

    .line 49
    .line 50
    const-string v3, "scrollX"

    .line 51
    .line 52
    invoke-direct {v2, v3, v0}, Lcom/android/quickstep/util/animation/SpringHolder;-><init>(Ljava/lang/String;Lcom/android/quickstep/util/animation/SpringForce;)V

    .line 53
    .line 54
    .line 55
    iget v0, p0, Lcom/android/launcher3/T6;->h:I

    .line 56
    .line 57
    iget v3, p0, Lcom/android/launcher3/T6;->i:I

    .line 58
    .line 59
    add-int/2addr v0, v3

    .line 60
    int-to-float v0, v0

    .line 61
    invoke-virtual {v2, v0}, Lcom/android/quickstep/util/animation/SpringHolder;->setStartValue(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 62
    .line 63
    .line 64
    neg-float p1, p1

    .line 65
    invoke-virtual {v2, p1}, Lcom/android/quickstep/util/animation/SpringHolder;->setStartVelocity(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {p1}, Lcom/android/launcher3/util/window/b;->a(Landroid/content/Context;)I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    int-to-long v3, p1

    .line 77
    invoke-virtual {v2, v3, v4}, Lcom/android/quickstep/util/animation/SpringHolder;->getNextFrameObject(J)Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;->getMValue()F

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    iget v0, p0, Lcom/android/launcher3/T6;->h:I

    .line 86
    .line 87
    int-to-float v5, v0

    .line 88
    sub-float/2addr p1, v5

    .line 89
    const/high16 v5, 0x40000000    # 2.0f

    .line 90
    .line 91
    div-float/2addr p1, v5

    .line 92
    int-to-float v0, v0

    .line 93
    add-float/2addr p1, v0

    .line 94
    float-to-int p1, p1

    .line 95
    int-to-float p1, p1

    .line 96
    invoke-virtual {v2, p1}, Lcom/android/quickstep/util/animation/SpringHolder;->setStartValue(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v2, v3, v4}, Lcom/android/quickstep/util/animation/SpringHolder;->getNextFrameValue(J)F

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    iget p0, p0, Lcom/android/launcher3/T6;->h:I

    .line 104
    .line 105
    int-to-float v0, p0

    .line 106
    int-to-float p0, p0

    .line 107
    invoke-static {p1, v0, v5, p0}, Lcom/android/launcher3/L5;->b(FFFF)F

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    float-to-int p0, p0

    .line 112
    new-instance p1, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    const-string v0, "getSmoothStartValue: unboundedScroll="

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string p3, ", fixUpSnapToPageWithVelocityScrollDelta="

    .line 126
    .line 127
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string p2, ", targetScroll="

    .line 134
    .line 135
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string p2, ", final smoothStartValue="

    .line 142
    .line 143
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    const-string p2, "ZtePagedViewImpl"

    .line 154
    .line 155
    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    return p0

    .line 159
    :cond_0
    const p0, 0x7fffffff

    .line 160
    .line 161
    .line 162
    return p0
.end method

.method public L()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 6
    .line 7
    const/4 v1, -0x2

    .line 8
    if-ne v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/L5;->l()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0

    .line 29
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 30
    return p0
.end method

.method protected O(IIIIZ)Z
    .locals 9

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mFirstLayout:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput v1, p0, Lcom/android/launcher3/V4;->mScrollMode:I

    .line 7
    .line 8
    :cond_0
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 11
    .line 12
    .line 13
    return v1

    .line 14
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 15
    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->validateNewPage(I)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    goto :goto_0

    .line 23
    :cond_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    const/4 v0, -0x1

    .line 32
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    const-string v2, "zteSnapToPageSpring  mNextPage ="

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget v2, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v2, "-whichPage ="

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v2, "ZtePagedViewImpl"

    .line 64
    .line 65
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    iput p1, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 69
    .line 70
    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->awakenScrollBars(I)Z

    .line 71
    .line 72
    .line 73
    if-eqz p5, :cond_3

    .line 74
    .line 75
    move v6, v1

    .line 76
    goto :goto_1

    .line 77
    :cond_3
    if-nez p3, :cond_4

    .line 78
    .line 79
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 80
    .line 81
    .line 82
    move-result p3

    .line 83
    :cond_4
    move v6, p3

    .line 84
    :goto_1
    if-eqz v6, :cond_5

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->pageBeginTransition()V

    .line 87
    .line 88
    .line 89
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 90
    .line 91
    invoke-virtual {p1}, Lcom/android/launcher3/L5;->l()Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-nez p1, :cond_6

    .line 96
    .line 97
    iget-object p1, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 98
    .line 99
    invoke-virtual {p1}, Lcom/android/launcher3/L5;->abortAnimation()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, v1}, Lcom/android/launcher3/V4;->doAfterAbortScrollerAnimation(Z)V

    .line 103
    .line 104
    .line 105
    :cond_6
    int-to-float p1, p4

    .line 106
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 107
    .line 108
    .line 109
    move-result p3

    .line 110
    const/high16 p4, 0x45fa0000    # 8000.0f

    .line 111
    .line 112
    cmpl-float p3, p3, p4

    .line 113
    .line 114
    if-ltz p3, :cond_7

    .line 115
    .line 116
    invoke-static {p4, p1}, Ljava/lang/Math;->copySign(FF)F

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    :cond_7
    iget-object p3, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 121
    .line 122
    invoke-interface {p3, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    .line 123
    .line 124
    .line 125
    move-result v4

    .line 126
    invoke-virtual {p0, p1, p2, v4}, Lcom/android/launcher3/T6;->K(FII)I

    .line 127
    .line 128
    .line 129
    move-result v8

    .line 130
    new-instance p3, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 133
    .line 134
    .line 135
    const-string p4, "zteSnapToPageSpring: unboundedScroll="

    .line 136
    .line 137
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string p4, ", fixUpSnapToPageWithVelocityScrollDelta="

    .line 144
    .line 145
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string p4, ", smoothStartValue="

    .line 152
    .line 153
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p3, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p3

    .line 163
    invoke-static {v2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    .line 165
    .line 166
    iget-object v3, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 167
    .line 168
    neg-float v7, p1

    .line 169
    move v5, p2

    .line 170
    invoke-virtual/range {v3 .. v8}, Lcom/android/launcher3/L5;->q(IIIFI)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->updatePageIndicator()V

    .line 174
    .line 175
    .line 176
    if-eqz p5, :cond_8

    .line 177
    .line 178
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->computeScroll()V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0}, Lcom/android/launcher3/T6;->pageEndTransition()V

    .line 182
    .line 183
    .line 184
    :cond_8
    invoke-virtual {p0}, Lcom/android/launcher3/T6;->invalidate()V

    .line 185
    .line 186
    .line 187
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 188
    .line 189
    .line 190
    move-result p0

    .line 191
    if-lez p0, :cond_9

    .line 192
    .line 193
    const/4 p0, 0x1

    .line 194
    return p0

    .line 195
    :cond_9
    return v1
.end method

.method protected computeScrollHelper()Z
    .locals 6

    .line 1
    invoke-static {}, Lx1/O;->K3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Lcom/android/launcher3/V4;->computeScrollHelper()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-static {}, Lx1/Z;->o()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-super {p0}, Lcom/android/launcher3/V4;->computeScrollHelper()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/android/launcher3/L5;->computeScrollOffset()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-super {p0}, Lcom/android/launcher3/V4;->computeScrollHelper()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0

    .line 42
    :cond_2
    const/4 v0, 0x0

    .line 43
    if-eqz v1, :cond_9

    .line 44
    .line 45
    iget-object v1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 46
    .line 47
    invoke-interface {v1, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    iget-object v2, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 52
    .line 53
    invoke-virtual {v2}, Lcom/android/launcher3/L5;->m()Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_4

    .line 58
    .line 59
    iget-object v2, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 60
    .line 61
    invoke-virtual {v2}, Lcom/android/launcher3/L5;->h()F

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    int-to-float v1, v1

    .line 70
    sub-float/2addr v1, v2

    .line 71
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    const/high16 v2, 0x3f000000    # 0.5f

    .line 76
    .line 77
    cmpl-float v1, v1, v2

    .line 78
    .line 79
    if-lez v1, :cond_5

    .line 80
    .line 81
    iget-boolean v1, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 82
    .line 83
    if-eqz v1, :cond_3

    .line 84
    .line 85
    iput v3, p0, Lcom/android/launcher3/V4;->mUnboundedScroll:I

    .line 86
    .line 87
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 88
    .line 89
    sget-object v2, Lcom/android/launcher3/touch/G;->c:Lcom/android/launcher3/touch/G$c;

    .line 90
    .line 91
    invoke-interface {v1, p0, v2, v3}, Lcom/android/launcher3/touch/G;->setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$c;I)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_4
    iget-object v2, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 96
    .line 97
    invoke-virtual {v2}, Landroid/widget/OverScroller;->getCurrX()I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    if-eq v1, v3, :cond_5

    .line 102
    .line 103
    iget-object v1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 104
    .line 105
    sget-object v2, Lcom/android/launcher3/touch/G;->c:Lcom/android/launcher3/touch/G$c;

    .line 106
    .line 107
    iget-object v4, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 108
    .line 109
    invoke-virtual {v4}, Landroid/widget/OverScroller;->getCurrX()I

    .line 110
    .line 111
    .line 112
    move-result v4

    .line 113
    invoke-interface {v1, p0, v2, v4}, Lcom/android/launcher3/touch/G;->setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$c;I)V

    .line 114
    .line 115
    .line 116
    :cond_5
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 117
    .line 118
    invoke-virtual {v1}, Lcom/android/launcher3/L5;->m()Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-eqz v1, :cond_6

    .line 123
    .line 124
    iget-object v1, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 125
    .line 126
    invoke-virtual {v1}, Lcom/android/launcher3/L5;->k()I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    goto :goto_1

    .line 131
    :cond_6
    iget-object v1, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 132
    .line 133
    invoke-virtual {v1}, Landroid/widget/OverScroller;->getFinalX()I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    :goto_1
    if-ne v3, v1, :cond_7

    .line 138
    .line 139
    iget-object v1, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 140
    .line 141
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    if-eqz v1, :cond_7

    .line 146
    .line 147
    iget-object v1, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 148
    .line 149
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-eqz v1, :cond_7

    .line 154
    .line 155
    iget-object v1, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 156
    .line 157
    invoke-virtual {v1}, Lcom/android/launcher3/L5;->abortAnimation()V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->doAfterAbortScrollerAnimation(Z)V

    .line 161
    .line 162
    .line 163
    :cond_7
    iget-object v0, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 164
    .line 165
    if-eqz v0, :cond_8

    .line 166
    .line 167
    invoke-virtual {v0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->s()V

    .line 168
    .line 169
    .line 170
    :cond_8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->postInvalidateOnAnimation()V

    .line 171
    .line 172
    .line 173
    const/4 p0, 0x1

    .line 174
    return p0

    .line 175
    :cond_9
    iget v1, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 176
    .line 177
    const/4 v2, -0x2

    .line 178
    if-eq v1, v2, :cond_c

    .line 179
    .line 180
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->sendScrollAccessibilityEvent()V

    .line 181
    .line 182
    .line 183
    iget v1, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 184
    .line 185
    iget-boolean v3, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 186
    .line 187
    if-eqz v3, :cond_a

    .line 188
    .line 189
    iget v3, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 190
    .line 191
    invoke-virtual {p0, v3}, Lcom/android/launcher3/V4;->transformPageNum(I)I

    .line 192
    .line 193
    .line 194
    move-result v3

    .line 195
    iput v3, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 196
    .line 197
    goto :goto_2

    .line 198
    :cond_a
    iget v3, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 199
    .line 200
    invoke-virtual {p0, v3}, Lcom/android/launcher3/V4;->validateNewPage(I)I

    .line 201
    .line 202
    .line 203
    move-result v3

    .line 204
    iput v3, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 205
    .line 206
    :goto_2
    iget v3, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 207
    .line 208
    iput v3, p0, Lcom/android/launcher3/V4;->mCurrentScrollOverPage:I

    .line 209
    .line 210
    iget-object v4, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 211
    .line 212
    sget-object v5, Lcom/android/launcher3/touch/G;->c:Lcom/android/launcher3/touch/G$c;

    .line 213
    .line 214
    invoke-virtual {p0, v3}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 215
    .line 216
    .line 217
    move-result v3

    .line 218
    invoke-interface {v4, p0, v5, v3}, Lcom/android/launcher3/touch/G;->setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$c;I)V

    .line 219
    .line 220
    .line 221
    iput v2, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 222
    .line 223
    invoke-virtual {p0, v1}, Lcom/android/launcher3/V4;->notifyPageSwitchListener(I)V

    .line 224
    .line 225
    .line 226
    iget-boolean v1, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 227
    .line 228
    if-nez v1, :cond_b

    .line 229
    .line 230
    invoke-virtual {p0}, Lcom/android/launcher3/T6;->pageEndTransition()V

    .line 231
    .line 232
    .line 233
    goto :goto_3

    .line 234
    :cond_b
    const-string v1, "ZtePagedViewImpl"

    .line 235
    .line 236
    const-string v2, "computeScrollHelper: mIsBeingDragged is true."

    .line 237
    .line 238
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    .line 240
    .line 241
    :goto_3
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->canAnnouncePageDescription()Z

    .line 242
    .line 243
    .line 244
    move-result v1

    .line 245
    if-eqz v1, :cond_c

    .line 246
    .line 247
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->announcePageForAccessibility()V

    .line 248
    .line 249
    .line 250
    :cond_c
    iput-boolean v0, p0, Lcom/android/launcher3/V4;->mIsSnapToHome:Z

    .line 251
    .line 252
    const/4 v1, -0x1

    .line 253
    iput v1, p0, Lcom/android/launcher3/V4;->mSnapToHomeStartPage:I

    .line 254
    .line 255
    return v0
.end method

.method protected dispatchDrawHelper(ILandroid/graphics/Canvas;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    invoke-static {}, Lx1/O;->K3()Z

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-nez v3, :cond_0

    .line 12
    .line 13
    invoke-super/range {p0 .. p2}, Lcom/android/launcher3/V4;->dispatchDrawHelper(ILandroid/graphics/Canvas;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {}, Lx1/Z;->o()Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-nez v3, :cond_1

    .line 22
    .line 23
    invoke-super/range {p0 .. p2}, Lcom/android/launcher3/V4;->dispatchDrawHelper(ILandroid/graphics/Canvas;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v4, "dispatchDrawHelper mIsSnapToHome="

    .line 33
    .line 34
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget-boolean v4, v0, Lcom/android/launcher3/V4;->mIsSnapToHome:Z

    .line 38
    .line 39
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v4, ", finalPage="

    .line 43
    .line 44
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v4, ", mNextPage="

    .line 51
    .line 52
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget v4, v0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 56
    .line 57
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v4, ", mCurrentPage="

    .line 61
    .line 62
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    iget v4, v0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 66
    .line 67
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v4, ", mIsBeingDragged="

    .line 71
    .line 72
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    iget-boolean v4, v0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 76
    .line 77
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    const-string v4, "ZtePagedViewImpl"

    .line 85
    .line 86
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    iget-boolean v3, v0, Lcom/android/launcher3/V4;->mIsSnapToHome:Z

    .line 90
    .line 91
    if-eqz v3, :cond_2

    .line 92
    .line 93
    invoke-super/range {p0 .. p2}, Lcom/android/launcher3/V4;->dispatchDrawHelper(ILandroid/graphics/Canvas;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_2
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getDrawingTime()J

    .line 98
    .line 99
    .line 100
    move-result-wide v5

    .line 101
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    int-to-float v3, v3

    .line 106
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 107
    .line 108
    .line 109
    move-result v7

    .line 110
    int-to-float v7, v7

    .line 111
    div-float/2addr v3, v7

    .line 112
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 113
    .line 114
    .line 115
    move-result v7

    .line 116
    iget-boolean v8, v0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 117
    .line 118
    const/4 v9, 0x1

    .line 119
    if-eqz v8, :cond_3

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 122
    .line 123
    .line 124
    move-result v8

    .line 125
    sub-int/2addr v8, v1

    .line 126
    add-int/lit8 v1, v8, -0x1

    .line 127
    .line 128
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 129
    .line 130
    .line 131
    move-result v8

    .line 132
    sub-int/2addr v8, v7

    .line 133
    sub-int/2addr v8, v9

    .line 134
    goto :goto_0

    .line 135
    :cond_3
    move v8, v7

    .line 136
    :goto_0
    iget-boolean v10, v0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 137
    .line 138
    const/4 v11, -0x2

    .line 139
    if-nez v10, :cond_4

    .line 140
    .line 141
    iget v10, v0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 142
    .line 143
    if-eq v10, v11, :cond_12

    .line 144
    .line 145
    :cond_4
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 146
    .line 147
    .line 148
    move-result v10

    .line 149
    iget-boolean v12, v0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 150
    .line 151
    const/4 v13, 0x0

    .line 152
    if-nez v12, :cond_5

    .line 153
    .line 154
    add-int/lit8 v12, v10, -0x1

    .line 155
    .line 156
    invoke-static {v7, v12}, Ljava/lang/Math;->min(II)I

    .line 157
    .line 158
    .line 159
    move-result v7

    .line 160
    invoke-static {v13, v7}, Ljava/lang/Math;->max(II)I

    .line 161
    .line 162
    .line 163
    move-result v7

    .line 164
    :cond_5
    :goto_1
    const/4 v12, 0x2

    .line 165
    if-gt v11, v12, :cond_12

    .line 166
    .line 167
    add-int v12, v7, v11

    .line 168
    .line 169
    iget-boolean v14, v0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 170
    .line 171
    if-eqz v14, :cond_6

    .line 172
    .line 173
    rem-int/2addr v12, v10

    .line 174
    add-int/2addr v12, v10

    .line 175
    rem-int/2addr v12, v10

    .line 176
    goto :goto_3

    .line 177
    :cond_6
    if-ltz v12, :cond_7

    .line 178
    .line 179
    if-lt v12, v10, :cond_8

    .line 180
    .line 181
    :cond_7
    :goto_2
    move/from16 v16, v9

    .line 182
    .line 183
    goto/16 :goto_9

    .line 184
    .line 185
    :cond_8
    :goto_3
    invoke-virtual {v0, v12}, Lcom/android/launcher3/V4;->isScreenValid(I)Z

    .line 186
    .line 187
    .line 188
    move-result v14

    .line 189
    if-nez v14, :cond_9

    .line 190
    .line 191
    new-instance v14, Ljava/lang/StringBuilder;

    .line 192
    .line 193
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 194
    .line 195
    .line 196
    const-string v15, "dispatchDrawHelper continue! isScreenValid("

    .line 197
    .line 198
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    const-string v15, ")="

    .line 205
    .line 206
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v0, v12}, Lcom/android/launcher3/V4;->isScreenValid(I)Z

    .line 210
    .line 211
    .line 212
    move-result v12

    .line 213
    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v12

    .line 220
    invoke-static {v4, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    .line 222
    .line 223
    goto :goto_2

    .line 224
    :cond_9
    invoke-virtual {v0, v12}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 225
    .line 226
    .line 227
    move-result-object v14

    .line 228
    if-eqz v14, :cond_a

    .line 229
    .line 230
    invoke-virtual {v14}, Landroid/view/View;->getVisibility()I

    .line 231
    .line 232
    .line 233
    move-result v15

    .line 234
    if-nez v15, :cond_a

    .line 235
    .line 236
    iget-object v15, v0, Lcom/android/launcher3/V4;->mDragView:Landroid/view/View;

    .line 237
    .line 238
    if-ne v15, v14, :cond_b

    .line 239
    .line 240
    :cond_a
    move/from16 v16, v9

    .line 241
    .line 242
    goto/16 :goto_7

    .line 243
    .line 244
    :cond_b
    invoke-virtual {v0, v12}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 245
    .line 246
    .line 247
    move-result v15

    .line 248
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 249
    .line 250
    .line 251
    move-result v16

    .line 252
    sub-int v15, v15, v16

    .line 253
    .line 254
    move/from16 v16, v9

    .line 255
    .line 256
    iget-boolean v9, v0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 257
    .line 258
    if-eqz v9, :cond_f

    .line 259
    .line 260
    int-to-float v9, v7

    .line 261
    cmpg-float v17, v3, v9

    .line 262
    .line 263
    if-gez v17, :cond_c

    .line 264
    .line 265
    move/from16 v17, v16

    .line 266
    .line 267
    goto :goto_4

    .line 268
    :cond_c
    move/from16 v17, v13

    .line 269
    .line 270
    :goto_4
    cmpl-float v9, v3, v9

    .line 271
    .line 272
    if-lez v9, :cond_d

    .line 273
    .line 274
    move/from16 v9, v16

    .line 275
    .line 276
    goto :goto_5

    .line 277
    :cond_d
    move v9, v13

    .line 278
    :goto_5
    if-nez v7, :cond_e

    .line 279
    .line 280
    add-int/lit8 v13, v10, -0x1

    .line 281
    .line 282
    if-ne v12, v13, :cond_e

    .line 283
    .line 284
    if-eqz v17, :cond_e

    .line 285
    .line 286
    if-gez v11, :cond_e

    .line 287
    .line 288
    sub-int v9, v8, v1

    .line 289
    .line 290
    add-int/lit8 v9, v9, -0x1

    .line 291
    .line 292
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 293
    .line 294
    .line 295
    move-result v12

    .line 296
    mul-int v15, v9, v12

    .line 297
    .line 298
    new-instance v9, Ljava/lang/StringBuilder;

    .line 299
    .line 300
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 301
    .line 302
    .line 303
    const-string v12, "circle wrap RIGHT: relativeOffset="

    .line 304
    .line 305
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v9

    .line 315
    invoke-static {v4, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 316
    .line 317
    .line 318
    goto :goto_6

    .line 319
    :cond_e
    add-int/lit8 v13, v10, -0x1

    .line 320
    .line 321
    if-ne v7, v13, :cond_f

    .line 322
    .line 323
    if-nez v12, :cond_f

    .line 324
    .line 325
    if-eqz v9, :cond_f

    .line 326
    .line 327
    if-lez v11, :cond_f

    .line 328
    .line 329
    sub-int v9, v8, v1

    .line 330
    .line 331
    add-int/lit8 v9, v9, 0x1

    .line 332
    .line 333
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 334
    .line 335
    .line 336
    move-result v12

    .line 337
    mul-int v15, v9, v12

    .line 338
    .line 339
    new-instance v9, Ljava/lang/StringBuilder;

    .line 340
    .line 341
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 342
    .line 343
    .line 344
    const-string v12, "circle wrap LEFT relativeOffset="

    .line 345
    .line 346
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    .line 348
    .line 349
    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object v9

    .line 356
    invoke-static {v4, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    .line 358
    .line 359
    :cond_f
    :goto_6
    invoke-static {v15}, Ljava/lang/Math;->abs(I)I

    .line 360
    .line 361
    .line 362
    move-result v9

    .line 363
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 364
    .line 365
    .line 366
    move-result v12

    .line 367
    if-lt v9, v12, :cond_10

    .line 368
    .line 369
    int-to-float v9, v15

    .line 370
    const/4 v12, 0x0

    .line 371
    invoke-virtual {v2, v9, v12}, Landroid/graphics/Canvas;->translate(FF)V

    .line 372
    .line 373
    .line 374
    invoke-virtual {v0, v2, v14, v5, v6}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 375
    .line 376
    .line 377
    neg-int v9, v15

    .line 378
    int-to-float v9, v9

    .line 379
    invoke-virtual {v2, v9, v12}, Landroid/graphics/Canvas;->translate(FF)V

    .line 380
    .line 381
    .line 382
    goto :goto_9

    .line 383
    :cond_10
    invoke-virtual {v0, v2, v14, v5, v6}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 384
    .line 385
    .line 386
    goto :goto_9

    .line 387
    :goto_7
    new-instance v9, Ljava/lang/StringBuilder;

    .line 388
    .line 389
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 390
    .line 391
    .line 392
    const-string v12, "dispatchDrawHelper continue! pageView ="

    .line 393
    .line 394
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 395
    .line 396
    .line 397
    if-nez v14, :cond_11

    .line 398
    .line 399
    const-string v12, "null"

    .line 400
    .line 401
    goto :goto_8

    .line 402
    :cond_11
    invoke-virtual {v14}, Landroid/view/View;->getVisibility()I

    .line 403
    .line 404
    .line 405
    move-result v12

    .line 406
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 407
    .line 408
    .line 409
    move-result-object v12

    .line 410
    :goto_8
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 411
    .line 412
    .line 413
    const-string v12, ", mDragView="

    .line 414
    .line 415
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 416
    .line 417
    .line 418
    iget-object v12, v0, Lcom/android/launcher3/V4;->mDragView:Landroid/view/View;

    .line 419
    .line 420
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 421
    .line 422
    .line 423
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 424
    .line 425
    .line 426
    move-result-object v9

    .line 427
    invoke-static {v4, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 428
    .line 429
    .line 430
    :goto_9
    add-int/lit8 v11, v11, 0x1

    .line 431
    .line 432
    move/from16 v9, v16

    .line 433
    .line 434
    const/4 v13, 0x0

    .line 435
    goto/16 :goto_1

    .line 436
    .line 437
    :cond_12
    return-void
.end method

.method public getDistanceForScroll(I)I
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->K3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->getDistanceForScroll(I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    if-gez p1, :cond_1

    .line 13
    .line 14
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-lt p1, v0, :cond_3

    .line 23
    .line 24
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 25
    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    mul-int/2addr p1, p0

    .line 33
    return p1

    .line 34
    :cond_3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-lt p1, v0, :cond_4

    .line 39
    .line 40
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 41
    .line 42
    if-eqz v0, :cond_5

    .line 43
    .line 44
    :cond_4
    if-gez p1, :cond_6

    .line 45
    .line 46
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 47
    .line 48
    if-eqz v0, :cond_6

    .line 49
    .line 50
    :cond_5
    iget v0, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    sub-int/2addr p1, v1

    .line 57
    add-int/lit8 p1, p1, 0x1

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    mul-int/2addr p1, p0

    .line 64
    add-int/2addr v0, p1

    .line 65
    return v0

    .line 66
    :cond_6
    const/4 p0, 0x0

    .line 67
    return p0
.end method

.method protected getScrollProgress(IIII)I
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->K3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/launcher3/V4;->getScrollProgress(IIII)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-virtual {p0, p3}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    add-int/2addr v0, p2

    .line 17
    sub-int v0, p1, v0

    .line 18
    .line 19
    invoke-virtual {p0, p4}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    sub-int/2addr v1, p2

    .line 24
    if-le p1, v1, :cond_2

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 27
    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    if-nez p3, :cond_2

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    add-int/lit8 v1, p4, -0x1

    .line 34
    .line 35
    if-ne p3, v1, :cond_2

    .line 36
    .line 37
    :goto_0
    invoke-virtual {p0, p4}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    sub-int v0, p1, v0

    .line 42
    .line 43
    sub-int/2addr v0, p2

    .line 44
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    sub-int/2addr v1, p2

    .line 49
    if-ge p1, v1, :cond_4

    .line 50
    .line 51
    iget-boolean p0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 52
    .line 53
    if-nez p0, :cond_3

    .line 54
    .line 55
    add-int/lit8 p4, p4, -0x1

    .line 56
    .line 57
    if-ne p3, p4, :cond_4

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_3
    if-nez p3, :cond_4

    .line 61
    .line 62
    :goto_1
    add-int/2addr p1, p2

    .line 63
    return p1

    .line 64
    :cond_4
    return v0
.end method

.method public invalidate()V
    .locals 3

    .line 1
    invoke-static {}, Lx1/O;->K3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Lx1/Z;->o()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-super {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    instance-of v0, p0, Lcom/android/launcher3/Workspace;

    .line 22
    .line 23
    if-eqz v0, :cond_4

    .line 24
    .line 25
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->isFirstFrameWhenUp:Z

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Lcom/android/launcher3/V4;->isFirstFrameWhenUp:Z

    .line 31
    .line 32
    move-object v0, p0

    .line 33
    check-cast v0, Lcom/android/launcher3/Workspace;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget v1, p0, Lcom/android/launcher3/T6;->h:I

    .line 40
    .line 41
    sub-int/2addr v0, v1

    .line 42
    iput v0, p0, Lcom/android/launcher3/T6;->i:I

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    move-object v0, p0

    .line 46
    check-cast v0, Lcom/android/launcher3/Workspace;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    iget v2, p0, Lcom/android/launcher3/T6;->h:I

    .line 53
    .line 54
    if-eq v1, v2, :cond_3

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iget v1, p0, Lcom/android/launcher3/T6;->h:I

    .line 61
    .line 62
    sub-int/2addr v0, v1

    .line 63
    iput v0, p0, Lcom/android/launcher3/T6;->i:I

    .line 64
    .line 65
    :cond_3
    :goto_0
    move-object v0, p0

    .line 66
    check-cast v0, Lcom/android/launcher3/Workspace;

    .line 67
    .line 68
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iput v0, p0, Lcom/android/launcher3/T6;->h:I

    .line 73
    .line 74
    :cond_4
    invoke-super {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method protected isSpringOverScrollerFinished()Z
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->K3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Lcom/android/launcher3/V4;->isSpringOverScrollerFinished()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-static {}, Lx1/Z;->o()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-super {p0}, Lcom/android/launcher3/V4;->isSpringOverScrollerFinished()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/L5;->l()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_2
    const/4 p0, 0x0

    .line 36
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    const-string v1, "isSpringOverScrollerFinished  return "

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "ZtePagedViewImpl"

    .line 54
    .line 55
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    return p0
.end method

.method protected isWorkspaceCanScrollToMiBoard()Z
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->K3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Lcom/android/launcher3/V4;->isWorkspaceCanScrollToMiBoard()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-static {}, Lx1/Z;->o()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-super {p0}, Lcom/android/launcher3/V4;->isWorkspaceCanScrollToMiBoard()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    instance-of v0, p0, Lcom/android/launcher3/Workspace;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    move-object v0, p0

    .line 28
    check-cast v0, Lcom/android/launcher3/Workspace;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 31
    .line 32
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 33
    .line 34
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 41
    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->s:Z

    .line 57
    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/android/launcher3/T6;->isSpringOverScrollerFinished()Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-eqz p0, :cond_2

    .line 65
    .line 66
    const/4 p0, 0x1

    .line 67
    goto :goto_0

    .line 68
    :cond_2
    const/4 p0, 0x0

    .line 69
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    const-string v1, "isWorkspaceCanScrollToMiBoard  return "

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const-string v1, "ZtePagedViewImpl"

    .line 87
    .line 88
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    return p0
.end method

.method protected onScrollChanged(IIII)V
    .locals 1

    .line 1
    invoke-static {}, Lx1/O;->K3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/launcher3/V4;->onScrollChanged(IIII)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Lx1/Z;->o()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/launcher3/V4;->onScrollChanged(IIII)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/widget/OverScroller;->isFinished()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_2

    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/android/launcher3/L5;->l()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getDestinationPage()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-ltz p1, :cond_3

    .line 43
    .line 44
    iget p2, p0, Lcom/android/launcher3/V4;->mCurrentScrollOverPage:I

    .line 45
    .line 46
    if-eq p1, p2, :cond_3

    .line 47
    .line 48
    iput p1, p0, Lcom/android/launcher3/V4;->mCurrentScrollOverPage:I

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->onScrollOverPageChanged()V

    .line 51
    .line 52
    .line 53
    :cond_3
    :goto_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-static {}, Lx1/O;->K3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v1, "onTouchEvent ScreenUtil.isSmoothEffect()"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lx1/Z;->o()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "ZtePagedViewImpl"

    .line 34
    .line 35
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    invoke-static {}, Lx1/Z;->o()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    return p0

    .line 49
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    and-int/lit16 v0, v0, 0xff

    .line 54
    .line 55
    if-nez v0, :cond_5

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Lcom/android/launcher3/T6;->updateIsBeingDraggedOnTouchDown(Landroid/view/MotionEvent;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/widget/OverScroller;->getFinalX()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iget-object v2, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 67
    .line 68
    invoke-virtual {v2}, Landroid/widget/OverScroller;->getCurrX()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    sub-int/2addr v0, v2

    .line 73
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    iget-object v2, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 78
    .line 79
    invoke-virtual {v2}, Landroid/widget/OverScroller;->isFinished()Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-nez v2, :cond_3

    .line 84
    .line 85
    iget v2, p0, Lcom/android/launcher3/V4;->mPageSlop:I

    .line 86
    .line 87
    div-int/lit8 v2, v2, 0x3

    .line 88
    .line 89
    if-ge v0, v2, :cond_2

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_2
    const-string v0, "onTouchEvent ACTION_DOWN: call super.onTouchEvent to interrupting parent scroller."

    .line 93
    .line 94
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    return p0

    .line 102
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 103
    .line 104
    invoke-virtual {v0}, Lcom/android/launcher3/L5;->k()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    iget-object v2, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 109
    .line 110
    invoke-virtual {v2}, Lcom/android/launcher3/L5;->h()F

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    float-to-int v2, v2

    .line 115
    sub-int/2addr v0, v2

    .line 116
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    iget-object v2, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 121
    .line 122
    invoke-virtual {v2}, Lcom/android/launcher3/L5;->l()Z

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    if-nez v2, :cond_5

    .line 127
    .line 128
    iget v2, p0, Lcom/android/launcher3/V4;->mPageSlop:I

    .line 129
    .line 130
    div-int/lit8 v2, v2, 0x3

    .line 131
    .line 132
    if-ge v0, v2, :cond_4

    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_4
    const-string v0, "onTouchEvent ACTION_DOWN: stopping animation and allowing finger to drag."

    .line 136
    .line 137
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 141
    .line 142
    invoke-virtual {v0}, Lcom/android/launcher3/L5;->abortAnimation()V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->interruptScroll()V

    .line 146
    .line 147
    .line 148
    :cond_5
    :goto_1
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 149
    .line 150
    .line 151
    move-result p0

    .line 152
    return p0
.end method

.method protected pageEndTransition()V
    .locals 1

    .line 1
    invoke-static {}, Lx1/O;->K3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Lcom/android/launcher3/V4;->pageEndTransition()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Lx1/Z;->o()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-super {p0}, Lcom/android/launcher3/V4;->pageEndTransition()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsPageInTransition:Z

    .line 22
    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/android/launcher3/L5;->l()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isShown()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 60
    .line 61
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_3

    .line 66
    .line 67
    :cond_2
    const/4 v0, 0x0

    .line 68
    iput-boolean v0, p0, Lcom/android/launcher3/V4;->mIsPageInTransition:Z

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->onPageEndTransition()V

    .line 71
    .line 72
    .line 73
    :cond_3
    return-void
.end method

.method public setCurrentPage(II)V
    .locals 1

    .line 1
    invoke-static {}, Lx1/O;->K3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/V4;->setCurrentPage(II)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Lx1/Z;->o()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/V4;->setCurrentPage(II)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/L5;->l()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/android/launcher3/L5;->abortAnimation()V

    .line 32
    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->doAfterAbortScrollerAnimation(Z)V

    .line 36
    .line 37
    .line 38
    :cond_2
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/V4;->setCurrentPage(II)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method protected snapToPageWithVelocity(II)Z
    .locals 7

    .line 1
    invoke-static {}, Lx1/O;->K3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/V4;->snapToPageWithVelocity(II)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-static {}, Lx1/Z;->o()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/V4;->snapToPageWithVelocity(II)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->validateNewPage(I)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    :cond_2
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 32
    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    if-gez p1, :cond_4

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    :cond_3
    :goto_0
    move v1, p1

    .line 42
    goto :goto_1

    .line 43
    :cond_4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-ne p1, v0, :cond_3

    .line 48
    .line 49
    const/4 p1, -0x1

    .line 50
    goto :goto_0

    .line 51
    :goto_1
    invoke-virtual {p0, v1}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 58
    .line 59
    .line 60
    const-string v2, "snapToPageWithVelocity: get scroll for page: newLoc="

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string p1, ", whichPage="

    .line 69
    .line 70
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string p1, ", velocity="

    .line 77
    .line 78
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string p1, ", mMinFlingVelocity="

    .line 85
    .line 86
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    iget p1, p0, Lcom/android/launcher3/V4;->mMinFlingVelocity:I

    .line 90
    .line 91
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string p1, ", mOrientationHandler.getPrimaryScroll(this)="

    .line 95
    .line 96
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 100
    .line 101
    invoke-interface {p1, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    const-string v0, "ZtePagedViewImpl"

    .line 113
    .line 114
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    iget v2, p0, Lcom/android/launcher3/V4;->mMinFlingVelocity:I

    .line 122
    .line 123
    if-ge p1, v2, :cond_5

    .line 124
    .line 125
    const-string p1, "snapToPageWithVelocity: velocity < mMinFlingVelocity, call snapToPage!"

    .line 126
    .line 127
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getSnapAnimationDuration()I

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    invoke-virtual {p0, v1, p1}, Lcom/android/launcher3/V4;->snapToPage(II)Z

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    return p0

    .line 139
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 140
    .line 141
    invoke-interface {p1, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    invoke-virtual {p0, v1}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    sub-int/2addr v2, p1

    .line 150
    iget-object v3, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 151
    .line 152
    invoke-interface {v3, p0}, Lcom/android/launcher3/touch/G;->getMeasuredSize(Landroid/view/View;)I

    .line 153
    .line 154
    .line 155
    move-result v3

    .line 156
    div-int/lit8 v3, v3, 0x2

    .line 157
    .line 158
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 159
    .line 160
    .line 161
    move-result v4

    .line 162
    int-to-float v4, v4

    .line 163
    const/high16 v5, 0x3f800000    # 1.0f

    .line 164
    .line 165
    mul-float/2addr v4, v5

    .line 166
    mul-int/lit8 v6, v3, 0x2

    .line 167
    .line 168
    int-to-float v6, v6

    .line 169
    div-float/2addr v4, v6

    .line 170
    invoke-static {v5, v4}, Ljava/lang/Math;->min(FF)F

    .line 171
    .line 172
    .line 173
    move-result v4

    .line 174
    invoke-virtual {p0, v4}, Lcom/android/launcher3/V4;->distanceInfluenceForSnapDuration(F)F

    .line 175
    .line 176
    .line 177
    move-result v4

    .line 178
    int-to-float v3, v3

    .line 179
    mul-float/2addr v4, v3

    .line 180
    add-float/2addr v4, v3

    .line 181
    iget v3, p0, Lcom/android/launcher3/V4;->mMinSnapVelocity:I

    .line 182
    .line 183
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 184
    .line 185
    .line 186
    move-result v5

    .line 187
    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    .line 188
    .line 189
    .line 190
    move-result v3

    .line 191
    invoke-virtual {p0, v4, v3}, Lcom/android/launcher3/T6;->H(FI)I

    .line 192
    .line 193
    .line 194
    move-result v3

    .line 195
    new-instance v4, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 198
    .line 199
    .line 200
    const-string v5, "snapToPageWithVelocity:  fixUpSnapToPageWithVelocityScrollDelta="

    .line 201
    .line 202
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    const-string v5, ", unboundedScroll="

    .line 209
    .line 210
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    const-string p1, ", getScrollForPage("

    .line 217
    .line 218
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    const-string p1, ")="

    .line 225
    .line 226
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0, v1}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 230
    .line 231
    .line 232
    move-result p1

    .line 233
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    const-string p1, ", mUnboundedScroll="

    .line 237
    .line 238
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    iget p1, p0, Lcom/android/launcher3/V4;->mUnboundedScroll:I

    .line 242
    .line 243
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    .line 252
    .line 253
    const/4 v5, 0x0

    .line 254
    move-object v0, p0

    .line 255
    move v4, p2

    .line 256
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/T6;->O(IIIIZ)Z

    .line 257
    .line 258
    .line 259
    move-result p0

    .line 260
    return p0
.end method

.method protected updateIsBeingDraggedOnTouchDown(Landroid/view/MotionEvent;)V
    .locals 5

    .line 1
    invoke-static {}, Lx1/O;->K3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->updateIsBeingDraggedOnTouchDown(Landroid/view/MotionEvent;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Lx1/Z;->o()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->updateIsBeingDraggedOnTouchDown(Landroid/view/MotionEvent;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsInterruptScrollAnimation:Z

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    new-instance p1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v0, "mIsInterruptScrollAnimation is true, updateIsBeingDraggedOnTouchDown return! to avoid the following scroll frozen. mIsBeingDragged = "

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v0, ", mEdgeGlowLeft.isFinished() = "

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v0, ", mEdgeGlowRight.isFinished() = "

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string p1, "ZtePagedViewImpl"

    .line 73
    .line 74
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 79
    .line 80
    invoke-virtual {v0}, Landroid/widget/OverScroller;->getFinalX()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iget-object v1, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 85
    .line 86
    invoke-virtual {v1}, Landroid/widget/OverScroller;->getCurrX()I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    sub-int/2addr v0, v1

    .line 91
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    iget-object v1, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 96
    .line 97
    invoke-virtual {v1}, Landroid/widget/OverScroller;->isFinished()Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    const/4 v2, 0x1

    .line 102
    const/4 v3, 0x0

    .line 103
    if-nez v1, :cond_4

    .line 104
    .line 105
    iget v1, p0, Lcom/android/launcher3/V4;->mPageSlop:I

    .line 106
    .line 107
    div-int/lit8 v1, v1, 0x3

    .line 108
    .line 109
    if-ge v0, v1, :cond_3

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_3
    move v0, v3

    .line 113
    goto :goto_1

    .line 114
    :cond_4
    :goto_0
    move v0, v2

    .line 115
    :goto_1
    iget-object v1, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 116
    .line 117
    invoke-virtual {v1}, Lcom/android/launcher3/L5;->k()I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    iget-object v4, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 122
    .line 123
    invoke-virtual {v4}, Lcom/android/launcher3/L5;->h()F

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    float-to-int v4, v4

    .line 128
    sub-int/2addr v1, v4

    .line 129
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    iget-object v4, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 134
    .line 135
    invoke-virtual {v4}, Lcom/android/launcher3/L5;->l()Z

    .line 136
    .line 137
    .line 138
    move-result v4

    .line 139
    if-nez v4, :cond_6

    .line 140
    .line 141
    iget v4, p0, Lcom/android/launcher3/V4;->mPageSlop:I

    .line 142
    .line 143
    div-int/lit8 v4, v4, 0x3

    .line 144
    .line 145
    if-ge v1, v4, :cond_5

    .line 146
    .line 147
    goto :goto_2

    .line 148
    :cond_5
    move v1, v3

    .line 149
    goto :goto_3

    .line 150
    :cond_6
    :goto_2
    move v1, v2

    .line 151
    :goto_3
    if-eqz v0, :cond_b

    .line 152
    .line 153
    if-eqz v1, :cond_b

    .line 154
    .line 155
    iput-boolean v3, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 156
    .line 157
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 158
    .line 159
    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-nez v0, :cond_7

    .line 164
    .line 165
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mFreeScroll:Z

    .line 166
    .line 167
    if-nez v0, :cond_7

    .line 168
    .line 169
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->updateIsBeingDraggedOnTouchDown(Landroid/view/MotionEvent;)V

    .line 170
    .line 171
    .line 172
    :cond_7
    iget-object v0, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 173
    .line 174
    invoke-virtual {v0}, Lcom/android/launcher3/L5;->l()Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-nez v0, :cond_8

    .line 179
    .line 180
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mFreeScroll:Z

    .line 181
    .line 182
    if-nez v0, :cond_8

    .line 183
    .line 184
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p0}, Lcom/android/launcher3/T6;->pageEndTransition()V

    .line 192
    .line 193
    .line 194
    :cond_8
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 195
    .line 196
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    if-eqz v0, :cond_a

    .line 201
    .line 202
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 203
    .line 204
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    if-nez v0, :cond_9

    .line 209
    .line 210
    goto :goto_4

    .line 211
    :cond_9
    move v2, v3

    .line 212
    :cond_a
    :goto_4
    iput-boolean v2, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 213
    .line 214
    goto :goto_5

    .line 215
    :cond_b
    iput-boolean v2, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 216
    .line 217
    :goto_5
    iget-object v0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 218
    .line 219
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 224
    .line 225
    .line 226
    move-result v2

    .line 227
    invoke-interface {v0, v1, v2}, Lcom/android/launcher3/touch/G;->getSecondaryValue(FF)F

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    iget-object v1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 232
    .line 233
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 234
    .line 235
    .line 236
    move-result v2

    .line 237
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 238
    .line 239
    .line 240
    move-result v3

    .line 241
    invoke-interface {v1, v2, v3}, Lcom/android/launcher3/touch/G;->getSecondaryValue(II)I

    .line 242
    .line 243
    .line 244
    move-result v1

    .line 245
    int-to-float v1, v1

    .line 246
    div-float/2addr v0, v1

    .line 247
    iget-object v1, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 248
    .line 249
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 250
    .line 251
    .line 252
    move-result v1

    .line 253
    const/4 v2, 0x0

    .line 254
    if-nez v1, :cond_c

    .line 255
    .line 256
    iget-object v1, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 257
    .line 258
    const/high16 v3, 0x3f800000    # 1.0f

    .line 259
    .line 260
    sub-float/2addr v3, v0

    .line 261
    invoke-virtual {v1, v2, v3}, Landroid/widget/EdgeEffect;->onPullDistance(FF)F

    .line 262
    .line 263
    .line 264
    :cond_c
    iget-object v1, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 265
    .line 266
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 267
    .line 268
    .line 269
    move-result v1

    .line 270
    if-nez v1, :cond_d

    .line 271
    .line 272
    iget-object p0, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 273
    .line 274
    invoke-virtual {p0, v2, v0, p1}, Lcom/android/launcher3/util/i0;->b(FFLandroid/view/MotionEvent;)F

    .line 275
    .line 276
    .line 277
    :cond_d
    return-void
.end method

.method public updateMovedDelta(I)I
    .locals 4

    .line 1
    invoke-static {}, Lx1/O;->K3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->updateMovedDelta(I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-static {}, Lx1/Z;->o()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->updateMovedDelta(I)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    instance-of v0, p0, Lcom/android/launcher3/Workspace;

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    move-object v0, p0

    .line 29
    check-cast v0, Lcom/android/launcher3/Workspace;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 32
    .line 33
    sget-object v2, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 34
    .line 35
    invoke-interface {v0, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    move v0, v1

    .line 42
    goto :goto_0

    .line 43
    :cond_2
    const/4 v0, 0x0

    .line 44
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 45
    .line 46
    invoke-interface {v2, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScale(Landroid/view/View;)F

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    iget v3, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 51
    .line 52
    invoke-virtual {p0, v3}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 53
    .line 54
    .line 55
    if-eqz v0, :cond_4

    .line 56
    .line 57
    int-to-float p1, p1

    .line 58
    mul-float/2addr p1, v2

    .line 59
    float-to-int p1, p1

    .line 60
    if-gez p1, :cond_3

    .line 61
    .line 62
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 63
    .line 64
    if-lez v0, :cond_4

    .line 65
    .line 66
    sub-int/2addr v0, v1

    .line 67
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iget-object v1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 72
    .line 73
    invoke-interface {v1, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    sub-int/2addr v0, p0

    .line 78
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    return p0

    .line 83
    :cond_3
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    sub-int/2addr v2, v1

    .line 90
    if-ge v0, v2, :cond_4

    .line 91
    .line 92
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 93
    .line 94
    add-int/2addr v0, v1

    .line 95
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iget-object v1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 100
    .line 101
    invoke-interface {v1, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    sub-int/2addr v0, p0

    .line 106
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    return p0

    .line 111
    :cond_4
    return p1
.end method
