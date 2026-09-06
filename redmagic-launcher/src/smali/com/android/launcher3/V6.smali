.class public abstract Lcom/android/launcher3/V6;
.super Lcom/android/launcher3/V4;
.source "ZteRecentPagedViewImpl.java"


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


# static fields
.field private static final RECENTS_FLING_VELOCITY_SCALE:F = 1.0f

.field private static final TAG:Ljava/lang/String; = "ZteRecentPagedViewImpl"


# instance fields
.field private mDefaultInterpolator:Landroid/view/animation/Interpolator;

.field private mForceSnapToDestinationOnCancel:Z

.field protected mSplineScroller:Lcom/android/launcher3/L5;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/V6;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/V6;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/V4;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    invoke-static {}, Lx1/O;->O1()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 5
    new-instance p2, Lcom/android/launcher3/L5;

    iget-object p3, p0, Lcom/android/launcher3/V4;->SCROLL_NEBULAOS2:Landroid/view/animation/Interpolator;

    invoke-direct {p2, p1, p3}, Lcom/android/launcher3/L5;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object p2, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    goto :goto_0

    .line 6
    :cond_0
    new-instance p2, Lcom/android/launcher3/L5;

    sget-object p3, LJ0/h;->Z:Landroid/view/animation/Interpolator;

    invoke-direct {p2, p1, p3}, Lcom/android/launcher3/L5;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object p2, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 7
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/V4;->SCROLL_NEBULAOS2:Landroid/view/animation/Interpolator;

    iput-object p1, p0, Lcom/android/launcher3/V6;->mDefaultInterpolator:Landroid/view/animation/Interpolator;

    const/4 p1, -0x1

    .line 8
    iput p1, p0, Lcom/android/launcher3/V4;->mScrollMode:I

    return-void
.end method

.method private isRecentsView()Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    return p0
.end method


# virtual methods
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
    invoke-direct {p0}, Lcom/android/launcher3/V6;->isRecentsView()Z

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
    iget-object v1, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/android/launcher3/L5;->computeScrollOffset()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 38
    .line 39
    invoke-interface {v0, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iget-object v1, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/widget/OverScroller;->getCurrX()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eq v0, v1, :cond_2

    .line 50
    .line 51
    new-instance v2, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    const-string v3, "computeScrollHelper: oldPos="

    .line 57
    .line 58
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v0, ",  newPos="

    .line 65
    .line 66
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    const-string v1, "ZteRecentPagedViewImpl"

    .line 77
    .line 78
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 82
    .line 83
    sget-object v1, Lcom/android/launcher3/touch/G;->c:Lcom/android/launcher3/touch/G$c;

    .line 84
    .line 85
    iget-object v2, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 86
    .line 87
    invoke-virtual {v2}, Landroid/widget/OverScroller;->getCurrX()I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    invoke-interface {v0, p0, v1, v2}, Lcom/android/launcher3/touch/G;->setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$c;I)V

    .line 92
    .line 93
    .line 94
    :cond_2
    invoke-super {p0}, Lcom/android/launcher3/V4;->computeScrollHelper()Z

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    return p0

    .line 99
    :cond_3
    const/4 v0, 0x0

    .line 100
    if-eqz v1, :cond_8

    .line 101
    .line 102
    iget-object v1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 103
    .line 104
    invoke-interface {v1, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    .line 105
    .line 106
    .line 107
    iget-object v1, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 108
    .line 109
    invoke-virtual {v1}, Lcom/android/launcher3/L5;->m()Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_4

    .line 114
    .line 115
    iget-object v1, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 116
    .line 117
    invoke-virtual {v1}, Lcom/android/launcher3/L5;->h()F

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    goto :goto_0

    .line 126
    :cond_4
    iget-object v1, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 127
    .line 128
    invoke-virtual {v1}, Landroid/widget/OverScroller;->getCurrX()I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 133
    .line 134
    sget-object v3, Lcom/android/launcher3/touch/G;->c:Lcom/android/launcher3/touch/G$c;

    .line 135
    .line 136
    invoke-interface {v2, p0, v3, v1}, Lcom/android/launcher3/touch/G;->setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$c;I)V

    .line 137
    .line 138
    .line 139
    iget-object v2, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 140
    .line 141
    invoke-virtual {v2}, Lcom/android/launcher3/L5;->m()Z

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    if-eqz v2, :cond_5

    .line 146
    .line 147
    iget-object v2, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 148
    .line 149
    invoke-virtual {v2}, Lcom/android/launcher3/L5;->k()I

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    goto :goto_1

    .line 154
    :cond_5
    iget-object v2, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 155
    .line 156
    invoke-virtual {v2}, Landroid/widget/OverScroller;->getFinalX()I

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    :goto_1
    if-ne v1, v2, :cond_6

    .line 161
    .line 162
    iget-object v1, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 163
    .line 164
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    if-eqz v1, :cond_6

    .line 169
    .line 170
    iget-object v1, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 171
    .line 172
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    if-eqz v1, :cond_6

    .line 177
    .line 178
    iget-object v1, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 179
    .line 180
    invoke-virtual {v1}, Lcom/android/launcher3/L5;->abortAnimation()V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->doAfterAbortScrollerAnimation(Z)V

    .line 184
    .line 185
    .line 186
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 187
    .line 188
    if-eqz v0, :cond_7

    .line 189
    .line 190
    invoke-virtual {v0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->s()V

    .line 191
    .line 192
    .line 193
    :cond_7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->postInvalidateOnAnimation()V

    .line 194
    .line 195
    .line 196
    const/4 p0, 0x1

    .line 197
    return p0

    .line 198
    :cond_8
    iget v1, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 199
    .line 200
    const/4 v2, -0x2

    .line 201
    if-eq v1, v2, :cond_a

    .line 202
    .line 203
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->sendScrollAccessibilityEvent()V

    .line 204
    .line 205
    .line 206
    iget v1, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 207
    .line 208
    iget v3, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 209
    .line 210
    invoke-virtual {p0, v3}, Lcom/android/launcher3/V4;->validateNewPage(I)I

    .line 211
    .line 212
    .line 213
    move-result v3

    .line 214
    iput v3, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 215
    .line 216
    iput v3, p0, Lcom/android/launcher3/V4;->mCurrentScrollOverPage:I

    .line 217
    .line 218
    iget-object v4, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 219
    .line 220
    sget-object v5, Lcom/android/launcher3/touch/G;->c:Lcom/android/launcher3/touch/G$c;

    .line 221
    .line 222
    invoke-virtual {p0, v3}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 223
    .line 224
    .line 225
    move-result v3

    .line 226
    invoke-interface {v4, p0, v5, v3}, Lcom/android/launcher3/touch/G;->setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$c;I)V

    .line 227
    .line 228
    .line 229
    iput v2, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 230
    .line 231
    invoke-virtual {p0, v1}, Lcom/android/launcher3/V4;->notifyPageSwitchListener(I)V

    .line 232
    .line 233
    .line 234
    iget-boolean v1, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 235
    .line 236
    if-nez v1, :cond_9

    .line 237
    .line 238
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->pageEndTransition()V

    .line 239
    .line 240
    .line 241
    :cond_9
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->canAnnouncePageDescription()Z

    .line 242
    .line 243
    .line 244
    move-result v1

    .line 245
    if-eqz v1, :cond_a

    .line 246
    .line 247
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->announcePageForAccessibility()V

    .line 248
    .line 249
    .line 250
    :cond_a
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

.method protected extendFlingDuration(I)V
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
    iget-object p0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/OverScroller;->extendDuration(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/V6;->isFlingUsingSplineScroller()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/android/launcher3/L5;->d(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/widget/OverScroller;->extendDuration(I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method protected freeScrollFling(IIIIIIIIII)V
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
    invoke-super/range {p0 .. p10}, Lcom/android/launcher3/V4;->freeScrollFling(IIIIIIIIII)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/V6;->isRecentsView()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-super/range {p0 .. p10}, Lcom/android/launcher3/V4;->freeScrollFling(IIIIIIIIII)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 22
    .line 23
    iget-object p2, p0, Lcom/android/launcher3/V6;->mDefaultInterpolator:Landroid/view/animation/Interpolator;

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Lcom/android/launcher3/L5;->n(Landroid/animation/TimeInterpolator;)V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    iput p1, p0, Lcom/android/launcher3/V4;->mScrollMode:I

    .line 30
    .line 31
    iget-object p2, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 32
    .line 33
    invoke-interface {p2, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    .line 34
    .line 35
    .line 36
    move-result p4

    .line 37
    int-to-float p2, p3

    .line 38
    const/high16 p3, 0x3f800000    # 1.0f

    .line 39
    .line 40
    mul-float/2addr p2, p3

    .line 41
    float-to-int p5, p2

    .line 42
    iget-object p3, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 43
    .line 44
    iget p6, p0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 45
    .line 46
    iget p7, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/android/launcher3/V6;->getOverDistance()I

    .line 49
    .line 50
    .line 51
    move-result p8

    .line 52
    invoke-virtual/range {p3 .. p8}, Lcom/android/launcher3/L5;->g(IIIII)V

    .line 53
    .line 54
    .line 55
    iget-object p2, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 56
    .line 57
    invoke-virtual {p2}, Lcom/android/launcher3/L5;->f()V

    .line 58
    .line 59
    .line 60
    iget-object p2, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 61
    .line 62
    invoke-virtual {p2}, Lcom/android/launcher3/L5;->k()I

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    invoke-virtual {p0, p2}, Lcom/android/launcher3/V4;->getDestinationPage(I)I

    .line 67
    .line 68
    .line 69
    move-result p3

    .line 70
    iput p3, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 71
    .line 72
    iget-boolean p4, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 73
    .line 74
    if-eqz p4, :cond_2

    .line 75
    .line 76
    iget p4, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 77
    .line 78
    if-ne p2, p4, :cond_3

    .line 79
    .line 80
    if-lez p3, :cond_3

    .line 81
    .line 82
    sub-int/2addr p3, p1

    .line 83
    iput p3, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 84
    .line 85
    return-void

    .line 86
    :cond_2
    iget p4, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 87
    .line 88
    if-ne p2, p4, :cond_3

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    sub-int/2addr p2, p1

    .line 95
    if-ge p3, p2, :cond_3

    .line 96
    .line 97
    iget p2, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 98
    .line 99
    add-int/2addr p2, p1

    .line 100
    iput p2, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 101
    .line 102
    :cond_3
    return-void
.end method

.method protected getFlingDuration()I
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
    iget-object p0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/OverScroller;->getDuration()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/V6;->isFlingUsingSplineScroller()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/L5;->j()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/OverScroller;->getDuration()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0
.end method

.method protected getFlingFinalPosition()I
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
    iget-object p0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/OverScroller;->getFinalX()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/V6;->isFlingUsingSplineScroller()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/L5;->k()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/OverScroller;->getFinalX()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0
.end method

.method protected getOverDistance()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    const/high16 v0, 0x3f000000    # 0.5f

    .line 7
    .line 8
    mul-float/2addr p0, v0

    .line 9
    const v0, 0x3d8f5c29    # 0.07f

    .line 10
    .line 11
    .line 12
    mul-float/2addr p0, v0

    .line 13
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method protected isFlingUsingSplineScroller()Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "isFlingUsingSplineScroller mScrollMode= "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lcom/android/launcher3/V4;->mScrollMode:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", mSplineScroller="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "ZteRecentPagedViewImpl"

    .line 31
    .line 32
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    iget v0, p0, Lcom/android/launcher3/V4;->mScrollMode:I

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    if-ne v0, v1, :cond_0

    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 41
    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    return v1

    .line 45
    :cond_0
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
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
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/V6;->isRecentsView()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    and-int/lit16 v0, v0, 0xff

    .line 28
    .line 29
    const/4 v1, 0x3

    .line 30
    const/4 v2, 0x1

    .line 31
    const/4 v3, 0x0

    .line 32
    const-string v4, "ZteRecentPagedViewImpl"

    .line 33
    .line 34
    if-nez v0, :cond_6

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V6;->updateIsBeingDraggedOnTouchDown(Landroid/view/MotionEvent;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/widget/OverScroller;->getFinalX()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iget-object v5, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 46
    .line 47
    invoke-virtual {v5}, Landroid/widget/OverScroller;->getCurrX()I

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    sub-int/2addr v0, v5

    .line 52
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iget-object v5, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 57
    .line 58
    invoke-virtual {v5}, Landroid/widget/OverScroller;->isFinished()Z

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    if-nez v5, :cond_3

    .line 63
    .line 64
    iget v5, p0, Lcom/android/launcher3/V4;->mPageSlop:I

    .line 65
    .line 66
    div-int/2addr v5, v1

    .line 67
    if-ge v0, v5, :cond_2

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    move v0, v3

    .line 71
    goto :goto_1

    .line 72
    :cond_3
    :goto_0
    move v0, v2

    .line 73
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    const-string v6, "onTouchEvent ACTION_DOWN: parentFinishedScrolling="

    .line 79
    .line 80
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    if-nez v0, :cond_4

    .line 94
    .line 95
    const-string v0, "onTouchEvent ACTION_DOWN: call super.onTouchEvent to interrupting parent scroller."

    .line 96
    .line 97
    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    return p0

    .line 105
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/android/launcher3/L5;->k()I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    iget-object v5, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 112
    .line 113
    invoke-virtual {v5}, Lcom/android/launcher3/L5;->h()F

    .line 114
    .line 115
    .line 116
    move-result v5

    .line 117
    float-to-int v5, v5

    .line 118
    sub-int/2addr v0, v5

    .line 119
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 123
    .line 124
    invoke-virtual {v0}, Lcom/android/launcher3/L5;->l()Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    new-instance v5, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 131
    .line 132
    .line 133
    const-string v6, "onTouchEvent ACTION_DOWN: childFinishedScrolling="

    .line 134
    .line 135
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v5

    .line 145
    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    .line 147
    .line 148
    if-nez v0, :cond_6

    .line 149
    .line 150
    const-string v0, "onTouchEvent ACTION_DOWN: stopping animation and allowing finger to drag."

    .line 151
    .line 152
    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/android/launcher3/L5;->m()Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_5

    .line 162
    .line 163
    iget-object v0, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 164
    .line 165
    invoke-virtual {v0}, Lcom/android/launcher3/L5;->h()F

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    goto :goto_2

    .line 174
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 175
    .line 176
    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrX()I

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    :goto_2
    iget-object v5, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 181
    .line 182
    invoke-virtual {v5}, Lcom/android/launcher3/L5;->abortAnimation()V

    .line 183
    .line 184
    .line 185
    iget-object v5, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 186
    .line 187
    sget-object v6, Lcom/android/launcher3/touch/G;->c:Lcom/android/launcher3/touch/G$c;

    .line 188
    .line 189
    invoke-interface {v5, p0, v6, v0}, Lcom/android/launcher3/touch/G;->setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$c;I)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->interruptScroll()V

    .line 193
    .line 194
    .line 195
    iput-boolean v2, p0, Lcom/android/launcher3/V6;->mForceSnapToDestinationOnCancel:Z

    .line 196
    .line 197
    :cond_6
    iget-boolean v0, p0, Lcom/android/launcher3/V6;->mForceSnapToDestinationOnCancel:Z

    .line 198
    .line 199
    if-eqz v0, :cond_7

    .line 200
    .line 201
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    if-ne v0, v1, :cond_7

    .line 206
    .line 207
    iput-boolean v3, p0, Lcom/android/launcher3/V6;->mForceSnapToDestinationOnCancel:Z

    .line 208
    .line 209
    new-instance v0, Lcom/android/launcher3/U6;

    .line 210
    .line 211
    invoke-direct {v0, p0}, Lcom/android/launcher3/U6;-><init>(Lcom/android/launcher3/V6;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->runOnPageScrollsInitialized(Ljava/lang/Runnable;)V

    .line 215
    .line 216
    .line 217
    :cond_7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    if-ne v0, v2, :cond_8

    .line 222
    .line 223
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsInterruptScrollAnimation:Z

    .line 224
    .line 225
    if-eqz v0, :cond_8

    .line 226
    .line 227
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 228
    .line 229
    if-nez v0, :cond_8

    .line 230
    .line 231
    iput-boolean v3, p0, Lcom/android/launcher3/V4;->mIsInterruptScrollAnimation:Z

    .line 232
    .line 233
    const-string v0, "onTouchEvent ACTION_UP: interrupted scroll, snapToDestination in Recents"

    .line 234
    .line 235
    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    .line 237
    .line 238
    new-instance v0, Lcom/android/launcher3/U6;

    .line 239
    .line 240
    invoke-direct {v0, p0}, Lcom/android/launcher3/U6;-><init>(Lcom/android/launcher3/V6;)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->runOnPageScrollsInitialized(Ljava/lang/Runnable;)V

    .line 244
    .line 245
    .line 246
    :cond_8
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 247
    .line 248
    .line 249
    move-result p0

    .line 250
    return p0
.end method

.method protected setFlingFinalPosition(I)V
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
    iget-object p0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/OverScroller;->setFinalX(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/V6;->isFlingUsingSplineScroller()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/android/launcher3/L5;->o(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/widget/OverScroller;->setFinalX(I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method protected updateIsBeingDraggedOnTouchDown(Landroid/view/MotionEvent;)V
    .locals 9

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
    invoke-direct {p0}, Lcom/android/launcher3/V6;->isRecentsView()Z

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
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/widget/OverScroller;->getFinalX()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object v1, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/widget/OverScroller;->getCurrX()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    sub-int/2addr v0, v1

    .line 34
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget-object v1, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 39
    .line 40
    invoke-virtual {v1}, Landroid/widget/OverScroller;->isFinished()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    const/4 v2, 0x1

    .line 45
    const/4 v3, 0x0

    .line 46
    if-nez v1, :cond_3

    .line 47
    .line 48
    iget v1, p0, Lcom/android/launcher3/V4;->mPageSlop:I

    .line 49
    .line 50
    div-int/lit8 v1, v1, 0x3

    .line 51
    .line 52
    if-ge v0, v1, :cond_2

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    move v1, v3

    .line 56
    goto :goto_1

    .line 57
    :cond_3
    :goto_0
    move v1, v2

    .line 58
    :goto_1
    iget-object v4, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 59
    .line 60
    invoke-virtual {v4}, Lcom/android/launcher3/L5;->k()I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    iget-object v5, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 65
    .line 66
    invoke-virtual {v5}, Lcom/android/launcher3/L5;->h()F

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    float-to-int v5, v5

    .line 71
    sub-int/2addr v4, v5

    .line 72
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    iget-object v5, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 77
    .line 78
    invoke-virtual {v5}, Lcom/android/launcher3/L5;->l()Z

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    if-eqz v1, :cond_4

    .line 83
    .line 84
    if-eqz v5, :cond_4

    .line 85
    .line 86
    move v6, v2

    .line 87
    goto :goto_2

    .line 88
    :cond_4
    move v6, v3

    .line 89
    :goto_2
    new-instance v7, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    .line 93
    .line 94
    const-string v8, "updateIsBeingDraggedOnTouchDown: parentFinishedScrolling="

    .line 95
    .line 96
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v1, ", childFinishedScrolling="

    .line 103
    .line 104
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-string v1, ", super.mScroller.isFinished()="

    .line 111
    .line 112
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    iget-object v1, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 116
    .line 117
    invoke-virtual {v1}, Landroid/widget/OverScroller;->isFinished()Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string v1, ", mSplineScroller.isSpringFinished()="

    .line 125
    .line 126
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    iget-object v1, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 130
    .line 131
    invoke-virtual {v1}, Lcom/android/launcher3/L5;->l()Z

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    const-string v1, ", parentXDist="

    .line 139
    .line 140
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    const-string v0, ", childXDist="

    .line 147
    .line 148
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    const-string v0, ", mPageSlop="

    .line 155
    .line 156
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    iget v0, p0, Lcom/android/launcher3/V4;->mPageSlop:I

    .line 160
    .line 161
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    const-string v1, "ZteRecentPagedViewImpl"

    .line 169
    .line 170
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    if-eqz v6, :cond_9

    .line 174
    .line 175
    iput-boolean v3, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 176
    .line 177
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 178
    .line 179
    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-nez v0, :cond_5

    .line 184
    .line 185
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mFreeScroll:Z

    .line 186
    .line 187
    if-nez v0, :cond_5

    .line 188
    .line 189
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->updateIsBeingDraggedOnTouchDown(Landroid/view/MotionEvent;)V

    .line 190
    .line 191
    .line 192
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/V6;->mSplineScroller:Lcom/android/launcher3/L5;

    .line 193
    .line 194
    invoke-virtual {v0}, Lcom/android/launcher3/L5;->l()Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-nez v0, :cond_6

    .line 199
    .line 200
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mFreeScroll:Z

    .line 201
    .line 202
    if-nez v0, :cond_6

    .line 203
    .line 204
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->pageEndTransition()V

    .line 212
    .line 213
    .line 214
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 215
    .line 216
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    if-eqz v0, :cond_8

    .line 221
    .line 222
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 223
    .line 224
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    if-nez v0, :cond_7

    .line 229
    .line 230
    goto :goto_3

    .line 231
    :cond_7
    move v2, v3

    .line 232
    :cond_8
    :goto_3
    iput-boolean v2, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 233
    .line 234
    goto :goto_4

    .line 235
    :cond_9
    iput-boolean v2, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 236
    .line 237
    :goto_4
    iget-object v0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 238
    .line 239
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 240
    .line 241
    .line 242
    move-result v1

    .line 243
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    invoke-interface {v0, v1, v2}, Lcom/android/launcher3/touch/G;->getSecondaryValue(FF)F

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    iget-object v1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 252
    .line 253
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 254
    .line 255
    .line 256
    move-result v2

    .line 257
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 258
    .line 259
    .line 260
    move-result v3

    .line 261
    invoke-interface {v1, v2, v3}, Lcom/android/launcher3/touch/G;->getSecondaryValue(II)I

    .line 262
    .line 263
    .line 264
    move-result v1

    .line 265
    int-to-float v1, v1

    .line 266
    div-float/2addr v0, v1

    .line 267
    iget-object v1, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 268
    .line 269
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 270
    .line 271
    .line 272
    move-result v1

    .line 273
    const/4 v2, 0x0

    .line 274
    if-nez v1, :cond_a

    .line 275
    .line 276
    iget-object v1, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 277
    .line 278
    const/high16 v3, 0x3f800000    # 1.0f

    .line 279
    .line 280
    sub-float/2addr v3, v0

    .line 281
    invoke-virtual {v1, v2, v3}, Landroid/widget/EdgeEffect;->onPullDistance(FF)F

    .line 282
    .line 283
    .line 284
    :cond_a
    iget-object v1, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 285
    .line 286
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 287
    .line 288
    .line 289
    move-result v1

    .line 290
    if-nez v1, :cond_b

    .line 291
    .line 292
    iget-object p0, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 293
    .line 294
    invoke-virtual {p0, v2, v0, p1}, Lcom/android/launcher3/util/i0;->b(FFLandroid/view/MotionEvent;)F

    .line 295
    .line 296
    .line 297
    :cond_b
    return-void
.end method
