.class public Lcom/android/quickstep/fallback/FallbackRecentsStateController;
.super Ljava/lang/Object;
.source "FallbackRecentsStateController.java"

# interfaces
.implements Lcom/android/launcher3/statemanager/d$f;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/statemanager/d$f<",
        "Lcom/android/quickstep/fallback/RecentsState;",
        ">;"
    }
.end annotation


# instance fields
.field private final mNoConfig:LQ1/f;

.field private final mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

.field private final mRecentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/views/RecentsViewContainer;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, LQ1/f;

    .line 5
    .line 6
    invoke-direct {v0}, LQ1/f;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mNoConfig:LQ1/f;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 12
    .line 13
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/fallback/FallbackRecentsStateController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->lambda$setStateWithAnimation$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/fallback/FallbackRecentsStateController;Lcom/android/quickstep/fallback/RecentsState;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->lambda$setStateWithAnimation$1(Lcom/android/quickstep/fallback/RecentsState;Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getOverviewInterpolator(Lcom/android/quickstep/fallback/RecentsState;)Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/RecentsState;->isRecentsViewVisible()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, LJ0/h;->f:Landroid/view/animation/Interpolator;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, LJ0/h;->g:Landroid/view/animation/Interpolator;

    .line 11
    .line 12
    return-object p0
.end method

.method private isSplitSelectionState(Lcom/android/quickstep/fallback/RecentsState;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/fallback/RecentsState;->OVERVIEW_SPLIT_SELECT:Lcom/android/quickstep/fallback/RecentsState;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method private synthetic lambda$setStateWithAnimation$0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 2
    .line 3
    const/4 v0, 0x7

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->loadVisibleTaskData(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic lambda$setStateWithAnimation$1(Lcom/android/quickstep/fallback/RecentsState;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/RecentsState;->isRecentsViewVisible()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->reset()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->resetSkipTaskCountAlpha()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private setProperties(Lcom/android/quickstep/fallback/RecentsState;LQ1/f;Lcom/android/launcher3/anim/Y;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/RecentsState;->hasClearAllButton()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    move v0, v1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v0, v2

    .line 13
    :goto_0
    iget-object v3, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 14
    .line 15
    invoke-virtual {v3}, Lcom/android/quickstep/views/RecentsView;->getClearAllButton()Lcom/android/quickstep/views/ClearAllButton;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    sget-object v4, Lcom/android/quickstep/views/ClearAllButton;->VISIBILITY_ALPHA:Landroid/util/FloatProperty;

    .line 20
    .line 21
    sget-object v5, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 22
    .line 23
    invoke-virtual {p3, v3, v4, v0, v5}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getAddDeskButton()Lcom/android/quickstep/views/AddDesktopButton;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/RecentsState;->hasAddDeskButton()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    move v0, v1

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    move v0, v2

    .line 43
    :goto_1
    iget-object v3, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 44
    .line 45
    invoke-virtual {v3}, Lcom/android/quickstep/views/RecentsView;->getAddDeskButton()Lcom/android/quickstep/views/AddDesktopButton;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    sget-object v4, Lcom/android/quickstep/views/AddDesktopButton;->VISIBILITY_ALPHA:Landroid/util/FloatProperty;

    .line 50
    .line 51
    invoke-virtual {p3, v3, v4, v0, v5}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    :cond_2
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/RecentsState;->hasOverviewActions()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    move v0, v1

    .line 61
    goto :goto_2

    .line 62
    :cond_3
    move v0, v2

    .line 63
    :goto_2
    iget-object v3, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 64
    .line 65
    invoke-interface {v3}, Lcom/android/quickstep/views/RecentsViewContainer;->getActionsView()Lcom/android/quickstep/views/OverviewActionsView;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {v3}, Lcom/android/quickstep/views/OverviewActionsView;->getVisibilityAlpha()Lcom/android/launcher3/anim/d;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    sget-object v4, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 74
    .line 75
    invoke-virtual {p3, v3, v4, v0, v5}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Lcom/android/quickstep/fallback/RecentsState;->getOverviewScaleAndOffset(Lcom/android/quickstep/views/RecentsViewContainer;)[F

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v3, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 85
    .line 86
    sget-object v4, Lcom/android/quickstep/views/RecentsView;->RECENTS_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 87
    .line 88
    const/4 v6, 0x0

    .line 89
    aget v6, v0, v6

    .line 90
    .line 91
    const/4 v7, 0x6

    .line 92
    invoke-virtual {p2, v7, v5}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 93
    .line 94
    .line 95
    move-result-object v7

    .line 96
    invoke-virtual {p3, v3, v4, v6, v7}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 97
    .line 98
    .line 99
    iget-object v3, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 100
    .line 101
    sget-object v4, Lcom/android/quickstep/views/RecentsView;->ADJACENT_PAGE_HORIZONTAL_OFFSET:Landroid/util/FloatProperty;

    .line 102
    .line 103
    const/4 v6, 0x1

    .line 104
    aget v0, v0, v6

    .line 105
    .line 106
    const/4 v7, 0x7

    .line 107
    invoke-virtual {p2, v7, v5}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 108
    .line 109
    .line 110
    move-result-object v7

    .line 111
    invoke-virtual {p3, v3, v4, v0, v7}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 115
    .line 116
    sget-object v3, Lcom/android/quickstep/views/RecentsView;->TASK_SECONDARY_TRANSLATION:Landroid/util/FloatProperty;

    .line 117
    .line 118
    const/16 v4, 0x8

    .line 119
    .line 120
    invoke-virtual {p2, v4, v5}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    invoke-virtual {p3, v0, v3, v2, v4}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 128
    .line 129
    sget-object v3, Lcom/android/quickstep/views/RecentsView;->TASK_MODALNESS:Landroid/util/FloatProperty;

    .line 130
    .line 131
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/RecentsState;->getOverviewModalness()F

    .line 132
    .line 133
    .line 134
    move-result v4

    .line 135
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 136
    .line 137
    .line 138
    move-result v7

    .line 139
    if-eqz v7, :cond_4

    .line 140
    .line 141
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/RecentsState;->isRecentsViewVisible()Z

    .line 142
    .line 143
    .line 144
    move-result v7

    .line 145
    if-nez v7, :cond_4

    .line 146
    .line 147
    sget-object v7, LJ0/h;->g:Landroid/view/animation/Interpolator;

    .line 148
    .line 149
    goto :goto_3

    .line 150
    :cond_4
    move-object v7, v5

    .line 151
    :goto_3
    const/16 v8, 0xc

    .line 152
    .line 153
    invoke-virtual {p2, v8, v7}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 154
    .line 155
    .line 156
    move-result-object v7

    .line 157
    invoke-virtual {p3, v0, v3, v4, v7}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 161
    .line 162
    sget-object v3, Lcom/android/quickstep/views/RecentsView;->FULLSCREEN_PROGRESS:Landroid/util/FloatProperty;

    .line 163
    .line 164
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/RecentsState;->isFullScreen()Z

    .line 165
    .line 166
    .line 167
    move-result v4

    .line 168
    if-eqz v4, :cond_5

    .line 169
    .line 170
    move v4, v1

    .line 171
    goto :goto_4

    .line 172
    :cond_5
    move v4, v2

    .line 173
    :goto_4
    invoke-virtual {p3, v0, v3, v4, v5}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 177
    .line 178
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {p1, v0}, Lcom/android/quickstep/fallback/RecentsState;->displayOverviewTasksAsGrid(Lcom/android/launcher3/h0;)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    iget-object v3, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 187
    .line 188
    sget-object v4, Lcom/android/quickstep/views/RecentsView;->RECENTS_GRID_PROGRESS:Landroid/util/FloatProperty;

    .line 189
    .line 190
    if-eqz v0, :cond_6

    .line 191
    .line 192
    move v0, v1

    .line 193
    goto :goto_5

    .line 194
    :cond_6
    move v0, v2

    .line 195
    :goto_5
    invoke-direct {p0, p1}, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->getOverviewInterpolator(Lcom/android/quickstep/fallback/RecentsState;)Landroid/view/animation/Interpolator;

    .line 196
    .line 197
    .line 198
    move-result-object v7

    .line 199
    invoke-virtual {p3, v3, v4, v0, v7}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 200
    .line 201
    .line 202
    iget-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 203
    .line 204
    sget-object v3, Lcom/android/quickstep/views/RecentsView;->TASK_THUMBNAIL_SPLASH_ALPHA:Landroid/util/FloatProperty;

    .line 205
    .line 206
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/RecentsState;->showTaskThumbnailSplash()Z

    .line 207
    .line 208
    .line 209
    move-result v4

    .line 210
    if-eqz v4, :cond_7

    .line 211
    .line 212
    move v4, v1

    .line 213
    goto :goto_6

    .line 214
    :cond_7
    move v4, v2

    .line 215
    :goto_6
    invoke-direct {p0, p1}, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->getOverviewInterpolator(Lcom/android/quickstep/fallback/RecentsState;)Landroid/view/animation/Interpolator;

    .line 216
    .line 217
    .line 218
    move-result-object v7

    .line 219
    invoke-virtual {p3, v0, v3, v4, v7}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 220
    .line 221
    .line 222
    invoke-static {}, Lcom/android/launcher3/y0;->C()Z

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    if-eqz v0, :cond_9

    .line 227
    .line 228
    iget-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 229
    .line 230
    sget-object v3, Lcom/android/quickstep/views/RecentsView;->DESKTOP_CAROUSEL_DETACH_PROGRESS:Landroid/util/FloatProperty;

    .line 231
    .line 232
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/RecentsState;->detachDesktopCarousel()Z

    .line 233
    .line 234
    .line 235
    move-result v4

    .line 236
    if-eqz v4, :cond_8

    .line 237
    .line 238
    move v4, v1

    .line 239
    goto :goto_7

    .line 240
    :cond_8
    move v4, v2

    .line 241
    :goto_7
    invoke-direct {p0, p1}, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->getOverviewInterpolator(Lcom/android/quickstep/fallback/RecentsState;)Landroid/view/animation/Interpolator;

    .line 242
    .line 243
    .line 244
    move-result-object v7

    .line 245
    invoke-virtual {p3, v0, v3, v4, v7}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 246
    .line 247
    .line 248
    :cond_9
    invoke-static {}, Lcom/android/launcher3/y0;->l()Z

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    if-eqz v0, :cond_b

    .line 253
    .line 254
    iget-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 255
    .line 256
    sget-object v3, Lcom/android/quickstep/views/RecentsViewUtils;->DESK_EXPLODE_PROGRESS:Lcom/android/quickstep/views/RecentsViewUtils$Companion$RecentsViewFloatProperty;

    .line 257
    .line 258
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/RecentsState;->showExplodedDesktopView()Z

    .line 259
    .line 260
    .line 261
    move-result v4

    .line 262
    if-eqz v4, :cond_a

    .line 263
    .line 264
    goto :goto_8

    .line 265
    :cond_a
    move v1, v2

    .line 266
    :goto_8
    invoke-direct {p0, p1}, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->getOverviewInterpolator(Lcom/android/quickstep/fallback/RecentsState;)Landroid/view/animation/Interpolator;

    .line 267
    .line 268
    .line 269
    move-result-object v4

    .line 270
    invoke-virtual {p3, v0, v3, v1, v4}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 271
    .line 272
    .line 273
    :cond_b
    iget-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 274
    .line 275
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    iget-object v1, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 280
    .line 281
    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 282
    .line 283
    .line 284
    move-result-object v1

    .line 285
    invoke-virtual {p1, v1}, Lcom/android/quickstep/fallback/RecentsState;->getScrimColor(Landroid/content/Context;)I

    .line 286
    .line 287
    .line 288
    move-result v1

    .line 289
    const/16 v3, 0xb

    .line 290
    .line 291
    invoke-virtual {p2, v3, v5}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 292
    .line 293
    .line 294
    move-result-object p2

    .line 295
    invoke-virtual {p3, v0, v1, p2}, Lcom/android/launcher3/anim/Y;->d(Landroid/view/View;ILandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 296
    .line 297
    .line 298
    invoke-direct {p0, p1}, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->isSplitSelectionState(Lcom/android/quickstep/fallback/RecentsState;)Z

    .line 299
    .line 300
    .line 301
    move-result p2

    .line 302
    if-eqz p2, :cond_c

    .line 303
    .line 304
    iget-object p2, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 305
    .line 306
    invoke-virtual {p1, p2, v6}, Lcom/android/quickstep/fallback/RecentsState;->getTransitionDuration(Lcom/android/launcher3/views/k;Z)I

    .line 307
    .line 308
    .line 309
    move-result p2

    .line 310
    new-instance v0, Lcom/android/launcher3/anim/V;

    .line 311
    .line 312
    int-to-long v3, p2

    .line 313
    invoke-direct {v0, v3, v4}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 314
    .line 315
    .line 316
    iget-object v1, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 317
    .line 318
    invoke-virtual {v1, v0, p2}, Lcom/android/quickstep/views/RecentsView;->createSplitSelectInitAnimation(Lcom/android/launcher3/anim/V;I)V

    .line 319
    .line 320
    .line 321
    invoke-virtual {v0}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 322
    .line 323
    .line 324
    move-result-object p2

    .line 325
    invoke-virtual {p3, p2}, Lcom/android/launcher3/anim/Y;->a(Landroid/animation/Animator;)V

    .line 326
    .line 327
    .line 328
    :cond_c
    iget-object p2, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 329
    .line 330
    invoke-virtual {p2}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 331
    .line 332
    .line 333
    move-result-object p2

    .line 334
    sget-object v0, Lcom/android/quickstep/views/RecentsView;->TASK_PRIMARY_SPLIT_TRANSLATION:Landroid/util/FloatProperty;

    .line 335
    .line 336
    sget-object v1, Lcom/android/quickstep/views/RecentsView;->TASK_SECONDARY_SPLIT_TRANSLATION:Landroid/util/FloatProperty;

    .line 337
    .line 338
    iget-object v3, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 339
    .line 340
    invoke-interface {v3}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 341
    .line 342
    .line 343
    move-result-object v3

    .line 344
    invoke-interface {p2, v0, v1, v3}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSplitSelectTaskOffset(Landroid/util/FloatProperty;Landroid/util/FloatProperty;Lcom/android/launcher3/h0;)Landroid/util/Pair;

    .line 345
    .line 346
    .line 347
    move-result-object p2

    .line 348
    iget-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 349
    .line 350
    iget-object v1, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 351
    .line 352
    check-cast v1, Landroid/util/FloatProperty;

    .line 353
    .line 354
    invoke-direct {p0, p1}, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->isSplitSelectionState(Lcom/android/quickstep/fallback/RecentsState;)Z

    .line 355
    .line 356
    .line 357
    move-result p1

    .line 358
    if-eqz p1, :cond_d

    .line 359
    .line 360
    iget-object p1, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 361
    .line 362
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectTranslation()F

    .line 363
    .line 364
    .line 365
    move-result p1

    .line 366
    goto :goto_9

    .line 367
    :cond_d
    move p1, v2

    .line 368
    :goto_9
    invoke-virtual {p3, v0, v1, p1, v5}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 369
    .line 370
    .line 371
    iget-object p0, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 372
    .line 373
    iget-object p1, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 374
    .line 375
    check-cast p1, Landroid/util/FloatProperty;

    .line 376
    .line 377
    invoke-virtual {p3, p0, p1, v2, v5}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 378
    .line 379
    .line 380
    return-void
.end method


# virtual methods
.method public bridge synthetic onBackCancelled(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/statemanager/d$f;->onBackCancelled(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic onBackProgressed(Ljava/lang/Object;F)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/statemanager/d$f;->onBackProgressed(Ljava/lang/Object;F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setState(Lcom/android/quickstep/fallback/RecentsState;)V
    .locals 2

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->updateEmptyMessage()V

    .line 3
    iget-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->resetTaskVisuals()V

    .line 4
    iget-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mNoConfig:LQ1/f;

    sget-object v1, Lcom/android/launcher3/anim/Y;->a:Lcom/android/launcher3/anim/Y;

    invoke-direct {p0, p1, v0, v1}, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->setProperties(Lcom/android/quickstep/fallback/RecentsState;LQ1/f;Lcom/android/launcher3/anim/Y;)V

    return-void
.end method

.method public bridge synthetic setState(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/fallback/RecentsState;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->setState(Lcom/android/quickstep/fallback/RecentsState;)V

    return-void
.end method

.method public setStateWithAnimation(Lcom/android/quickstep/fallback/RecentsState;LQ1/f;Lcom/android/launcher3/anim/V;)V
    .locals 1

    const/4 v0, 0x2

    .line 2
    invoke-virtual {p2, v0}, LQ1/f;->c(I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 3
    :cond_0
    new-instance v0, Lcom/android/quickstep/fallback/a;

    invoke-direct {v0, p0}, Lcom/android/quickstep/fallback/a;-><init>(Lcom/android/quickstep/fallback/FallbackRecentsStateController;)V

    invoke-virtual {p3, v0}, Lcom/android/launcher3/anim/f;->h(Ljava/lang/Runnable;)V

    .line 4
    new-instance v0, Lcom/android/quickstep/fallback/b;

    invoke-direct {v0, p0, p1}, Lcom/android/quickstep/fallback/b;-><init>(Lcom/android/quickstep/fallback/FallbackRecentsStateController;Lcom/android/quickstep/fallback/RecentsState;)V

    invoke-virtual {p3, v0}, Lcom/android/launcher3/anim/f;->f(Ljava/util/function/Consumer;)V

    .line 5
    iget-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->mRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->updateEmptyMessage()V

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->setProperties(Lcom/android/quickstep/fallback/RecentsState;LQ1/f;Lcom/android/launcher3/anim/Y;)V

    return-void
.end method

.method public bridge synthetic setStateWithAnimation(Ljava/lang/Object;LQ1/f;Lcom/android/launcher3/anim/V;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/fallback/RecentsState;

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/fallback/FallbackRecentsStateController;->setStateWithAnimation(Lcom/android/quickstep/fallback/RecentsState;LQ1/f;Lcom/android/launcher3/anim/V;)V

    return-void
.end method
