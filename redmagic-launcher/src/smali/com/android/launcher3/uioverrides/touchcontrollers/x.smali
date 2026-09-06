.class public Lcom/android/launcher3/uioverrides/touchcontrollers/x;
.super Lcom/android/launcher3/touch/d;
.source "PortraitStatesTouchController.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PortraitStatesTouchCtrl"


# instance fields
.field private final mOverviewPortraitStateTouchHelper:Lcom/android/launcher3/uioverrides/touchcontrollers/w;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/touch/H;->w:Lcom/android/launcher3/touch/H$c;

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/touch/d;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/touch/H$c;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/w;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/w;-><init>(Lcom/android/launcher3/C2;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/x;->mOverviewPortraitStateTouchHelper:Lcom/android/launcher3/uioverrides/touchcontrollers/w;

    .line 12
    .line 13
    return-void
.end method

.method static isTouchOverHotseat(Lcom/android/launcher3/C2;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, v0, Lcom/android/launcher3/h0;->f2:I

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 12
    .line 13
    add-int/2addr v1, v0

    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    sub-int/2addr p0, v1

    .line 27
    int-to-float p0, p0

    .line 28
    cmpl-float p0, p1, p0

    .line 29
    .line 30
    if-ltz p0, :cond_0

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0
.end method


# virtual methods
.method protected canInterceptTouch(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    const/4 v4, 0x0

    .line 13
    if-eqz v2, :cond_2

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->E1()Lcom/android/launcher3/allapps/G;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/G;->n()F

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/G;->m()F

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    mul-float/2addr v1, p0

    .line 34
    cmpl-float p0, p1, v1

    .line 35
    .line 36
    if-gez p0, :cond_1

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return v4

    .line 42
    :cond_1
    :goto_0
    return v3

    .line 43
    :cond_2
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 44
    .line 45
    sget-object v5, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 46
    .line 47
    invoke-interface {v2, v5}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    const-string v5, "PortraitStatesTouchCtrl"

    .line 52
    .line 53
    if-eqz v2, :cond_3

    .line 54
    .line 55
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0, p1}, Lcom/android/launcher3/allapps/r;->z0(Landroid/view/MotionEvent;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_5

    .line 66
    .line 67
    return v4

    .line 68
    :cond_3
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 69
    .line 70
    sget-object v6, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 71
    .line 72
    invoke-interface {v2, v6}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_4

    .line 77
    .line 78
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/x;->mOverviewPortraitStateTouchHelper:Lcom/android/launcher3/uioverrides/touchcontrollers/w;

    .line 79
    .line 80
    invoke-virtual {v0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/w;->a(Landroid/view/MotionEvent;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_5

    .line 85
    .line 86
    return v4

    .line 87
    :cond_4
    if-nez v0, :cond_5

    .line 88
    .line 89
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 90
    .line 91
    invoke-static {v0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/x;->isTouchOverHotseat(Lcom/android/launcher3/C2;Landroid/view/MotionEvent;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-nez v0, :cond_5

    .line 96
    .line 97
    new-instance p1, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .line 101
    .line 102
    const-string v0, "canInterceptTouch: do not need intercept. state: "

    .line 103
    .line 104
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string p0, ", "

    .line 121
    .line 122
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-static {v5, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    return v4

    .line 133
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 134
    .line 135
    const v2, 0x7ff8febf

    .line 136
    .line 137
    .line 138
    invoke-static {v0, v2}, Lcom/android/launcher3/a;->getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 143
    .line 144
    invoke-static {v2}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    iget-boolean v2, v2, Lcom/android/launcher3/r4;->g0:Z

    .line 149
    .line 150
    if-eqz v2, :cond_6

    .line 151
    .line 152
    instance-of v2, v0, Lcom/android/launcher3/folder/Folder;

    .line 153
    .line 154
    if-eqz v2, :cond_6

    .line 155
    .line 156
    move v2, v3

    .line 157
    goto :goto_1

    .line 158
    :cond_6
    move v2, v4

    .line 159
    :goto_1
    if-eqz v0, :cond_7

    .line 160
    .line 161
    if-nez v2, :cond_7

    .line 162
    .line 163
    new-instance p0, Ljava/lang/StringBuilder;

    .line 164
    .line 165
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 166
    .line 167
    .line 168
    const-string p1, "canInterceptTouch: open view: "

    .line 169
    .line 170
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-static {v5, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    return v4

    .line 184
    :cond_7
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 185
    .line 186
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->M0()Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-nez v0, :cond_8

    .line 199
    .line 200
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 201
    .line 202
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    if-eqz v0, :cond_8

    .line 207
    .line 208
    const-string v0, "canInterceptTouch: checkUpCanStartAllApps"

    .line 209
    .line 210
    invoke-static {v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    .line 212
    .line 213
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 214
    .line 215
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getRecentProxy()Lcom/android/launcher3/u4;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    new-instance v0, Landroid/graphics/PointF;

    .line 220
    .line 221
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    invoke-direct {v0, v1, p1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {p0, v0}, Lcom/android/launcher3/u4;->d(Landroid/graphics/PointF;)Z

    .line 233
    .line 234
    .line 235
    move-result p0

    .line 236
    return p0

    .line 237
    :cond_8
    return v3
.end method

.method protected clearState()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/touch/d;->clearState()V

    .line 2
    .line 3
    .line 4
    const/16 p0, 0x19

    .line 5
    .line 6
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->cancel(I)V

    .line 7
    .line 8
    .line 9
    const/16 p0, 0x43

    .line 10
    .line 11
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->cancel(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method protected getConfigForStates(Lcom/android/launcher3/V3;Lcom/android/launcher3/V3;)LQ1/f;
    .locals 3

    .line 1
    new-instance v0, LQ1/f;

    .line 2
    .line 3
    invoke-direct {v0}, LQ1/f;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, v0, LQ1/f;->h:I

    .line 7
    .line 8
    or-int/lit8 v1, v1, 0x1

    .line 9
    .line 10
    iput v1, v0, LQ1/f;->h:I

    .line 11
    .line 12
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 13
    .line 14
    if-ne p1, v1, :cond_0

    .line 15
    .line 16
    sget-object v2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 17
    .line 18
    if-ne p2, v2, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 21
    .line 22
    invoke-static {p0, v0}, Lcom/android/launcher3/touch/e;->d(Lcom/android/launcher3/C2;LQ1/f;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget-object v2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 27
    .line 28
    if-ne p1, v2, :cond_1

    .line 29
    .line 30
    if-ne p2, v1, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 33
    .line 34
    invoke-static {p0, v0}, Lcom/android/launcher3/touch/e;->c(Lcom/android/launcher3/C2;LQ1/f;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    invoke-static {}, Lx1/O;->N1()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_3

    .line 42
    .line 43
    sget-object p0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 44
    .line 45
    if-eq p2, p0, :cond_2

    .line 46
    .line 47
    if-ne p1, p0, :cond_3

    .line 48
    .line 49
    :cond_2
    iget p0, v0, LQ1/f;->i:I

    .line 50
    .line 51
    or-int/lit8 p0, p0, 0x4

    .line 52
    .line 53
    iput p0, v0, LQ1/f;->i:I

    .line 54
    .line 55
    :cond_3
    return-object v0
.end method

.method protected getTargetState(Lcom/android/launcher3/V3;Z)Lcom/android/launcher3/V3;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 11
    .line 12
    if-ne p1, v1, :cond_4

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Lcom/android/launcher3/touch/d;->shouldOpenAllApps(Z)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-eqz p2, :cond_4

    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-boolean p1, p1, Lcom/android/launcher3/r4;->g0:Z

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    const/4 p1, 0x1

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const/4 p1, 0x0

    .line 41
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 42
    .line 43
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->M0()Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-nez p0, :cond_3

    .line 56
    .line 57
    if-eqz p1, :cond_2

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_2
    return-object v0

    .line 61
    :cond_3
    :goto_1
    return-object v1

    .line 62
    :cond_4
    return-object p1
.end method

.method protected initCurrentAnimation()F
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/touch/d;->getShiftRange()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x40000000    # 2.0f

    .line 6
    .line 7
    mul-float/2addr v1, v0

    .line 8
    float-to-long v1, v1

    .line 9
    iget-object v3, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 10
    .line 11
    iget-object v4, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {v3, v4}, Lcom/android/launcher3/V3;->s(Lcom/android/launcher3/C2;)F

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    mul-float/2addr v3, v0

    .line 18
    iget-object v4, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 19
    .line 20
    iget-object v5, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 21
    .line 22
    invoke-virtual {v4, v5}, Lcom/android/launcher3/V3;->s(Lcom/android/launcher3/C2;)F

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    mul-float/2addr v4, v0

    .line 27
    sub-float/2addr v4, v3

    .line 28
    const/4 v0, 0x0

    .line 29
    cmpl-float v3, v4, v0

    .line 30
    .line 31
    if-nez v3, :cond_0

    .line 32
    .line 33
    new-instance v3, LQ1/f;

    .line 34
    .line 35
    invoke-direct {v3}, LQ1/f;-><init>()V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object v3, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 40
    .line 41
    iget-object v5, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 42
    .line 43
    invoke-virtual {p0, v3, v5}, Lcom/android/launcher3/uioverrides/touchcontrollers/x;->getConfigForStates(Lcom/android/launcher3/V3;Lcom/android/launcher3/V3;)LQ1/f;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    :goto_0
    iput-wide v1, v3, LQ1/f;->g:J

    .line 48
    .line 49
    iget-object v5, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 50
    .line 51
    if-eqz v5, :cond_1

    .line 52
    .line 53
    invoke-virtual {v5}, Lcom/android/launcher3/anim/q;->r()Landroid/animation/AnimatorSet;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    iget-object v6, p0, Lcom/android/launcher3/touch/d;->mClearStateOnCancelListener:Landroid/animation/Animator$AnimatorListener;

    .line 58
    .line 59
    invoke-virtual {v5, v6}, Landroid/animation/AnimatorSet;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 60
    .line 61
    .line 62
    iget-object v5, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 63
    .line 64
    invoke-virtual {v5}, Lcom/android/launcher3/anim/q;->i()Lcom/android/launcher3/anim/q;

    .line 65
    .line 66
    .line 67
    :cond_1
    const/4 v5, 0x1

    .line 68
    iput-boolean v5, p0, Lcom/android/launcher3/touch/d;->mGoingBetweenStates:Z

    .line 69
    .line 70
    iget-object v6, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 71
    .line 72
    sget-object v7, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 73
    .line 74
    if-ne v6, v7, :cond_2

    .line 75
    .line 76
    iget-object v6, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 77
    .line 78
    sget-object v8, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 79
    .line 80
    if-ne v6, v8, :cond_2

    .line 81
    .line 82
    iget-object v6, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/x;->mOverviewPortraitStateTouchHelper:Lcom/android/launcher3/uioverrides/touchcontrollers/w;

    .line 83
    .line 84
    invoke-virtual {v6}, Lcom/android/launcher3/uioverrides/touchcontrollers/w;->c()Z

    .line 85
    .line 86
    .line 87
    move-result v6

    .line 88
    if-eqz v6, :cond_2

    .line 89
    .line 90
    iget-object v3, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 91
    .line 92
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    const/4 v4, 0x0

    .line 97
    invoke-virtual {v3, v7, v4}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 98
    .line 99
    .line 100
    iput-boolean v4, p0, Lcom/android/launcher3/touch/d;->mGoingBetweenStates:Z

    .line 101
    .line 102
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/x;->mOverviewPortraitStateTouchHelper:Lcom/android/launcher3/uioverrides/touchcontrollers/w;

    .line 103
    .line 104
    sget-object v4, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 105
    .line 106
    invoke-virtual {v3, v1, v2, v4}, Lcom/android/launcher3/uioverrides/touchcontrollers/w;->b(JLandroid/view/animation/Interpolator;)Lcom/android/launcher3/anim/V;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v1}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    iput-object v1, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 115
    .line 116
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 117
    .line 118
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 123
    .line 124
    invoke-virtual {v1, v2}, Lcom/android/launcher3/statemanager/d;->g0(Lcom/android/launcher3/anim/q;)V

    .line 125
    .line 126
    .line 127
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 128
    .line 129
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    check-cast v1, Lcom/android/quickstep/views/RecentsView;

    .line 134
    .line 135
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 136
    .line 137
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->getSizeStrategy()Lcom/android/quickstep/BaseContainerInterface;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-static {v2, v3, v4, v1}, Lcom/android/quickstep/util/LayoutUtils;->getShelfTrackingDistance(Landroid/content/Context;Lcom/android/launcher3/h0;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;Lcom/android/quickstep/BaseContainerInterface;)I

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    int-to-float v4, v1

    .line 154
    goto :goto_1

    .line 155
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 156
    .line 157
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 158
    .line 159
    if-ne v1, v2, :cond_3

    .line 160
    .line 161
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 162
    .line 163
    sget-object v2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 164
    .line 165
    if-ne v1, v2, :cond_3

    .line 166
    .line 167
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 168
    .line 169
    const/4 v2, 0x0

    .line 170
    invoke-interface {v1, v5, v2}, Lcom/android/launcher3/views/k;->finishAppClosingAnim(ZLjava/lang/Runnable;)V

    .line 171
    .line 172
    .line 173
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 174
    .line 175
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->finishFolderAnim()V

    .line 176
    .line 177
    .line 178
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 179
    .line 180
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 185
    .line 186
    invoke-virtual {v1, v2, v3}, Lcom/android/launcher3/statemanager/d;->p(Lcom/android/launcher3/statemanager/a;LQ1/f;)Lcom/android/launcher3/anim/q;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    iput-object v1, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 191
    .line 192
    :goto_1
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 193
    .line 194
    invoke-virtual {v1}, Lcom/android/launcher3/anim/q;->r()Landroid/animation/AnimatorSet;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mClearStateOnCancelListener:Landroid/animation/Animator$AnimatorListener;

    .line 199
    .line 200
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 201
    .line 202
    .line 203
    cmpl-float v0, v4, v0

    .line 204
    .line 205
    if-nez v0, :cond_4

    .line 206
    .line 207
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 208
    .line 209
    iget v0, v0, Lcom/android/launcher3/V3;->a:I

    .line 210
    .line 211
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 212
    .line 213
    iget v1, v1, Lcom/android/launcher3/V3;->a:I

    .line 214
    .line 215
    sub-int/2addr v0, v1

    .line 216
    int-to-float v0, v0

    .line 217
    invoke-static {v0}, Ljava/lang/Math;->signum(F)F

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 222
    .line 223
    invoke-static {p0}, Lf2/d;->J(Lcom/android/launcher3/C2;)F

    .line 224
    .line 225
    .line 226
    move-result p0

    .line 227
    mul-float v4, v0, p0

    .line 228
    .line 229
    :cond_4
    const/high16 p0, 0x3f800000    # 1.0f

    .line 230
    .line 231
    div-float/2addr p0, v4

    .line 232
    return p0
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/views/BaseDragLayer;->isMultiFinger()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/16 v1, 0x43

    .line 28
    .line 29
    const/16 v2, 0x19

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    if-eq v0, v3, :cond_1

    .line 35
    .line 36
    const/4 v3, 0x3

    .line 37
    if-eq v0, v3, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-static {v2}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->cancel(I)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->cancel(I)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v3, "swipe"

    .line 54
    .line 55
    invoke-static {v0, v2, v3}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;ILjava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {v0, v1}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;I)V

    .line 65
    .line 66
    .line 67
    :goto_0
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    return p0
.end method

.method protected onReachedFinalState(Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->onReachedFinalState(Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 5
    .line 6
    if-ne p1, p0, :cond_0

    .line 7
    .line 8
    const/16 p0, 0x19

    .line 9
    .line 10
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget-object p0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 15
    .line 16
    if-ne p1, p0, :cond_1

    .line 17
    .line 18
    const/16 p0, 0x43

    .line 19
    .line 20
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method protected onReinitToState(Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->onReinitToState(Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 5
    .line 6
    if-eq p1, p0, :cond_0

    .line 7
    .line 8
    const/16 p0, 0x19

    .line 9
    .line 10
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->cancel(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    sget-object p0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 14
    .line 15
    if-eq p1, p0, :cond_1

    .line 16
    .line 17
    const/16 p0, 0x43

    .line 18
    .line 19
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->cancel(I)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method protected onSwipeInteractionCompleted(Lcom/android/launcher3/V3;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->onSwipeInteractionCompleted(Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mStartState:Lcom/android/launcher3/V3;

    .line 15
    .line 16
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 17
    .line 18
    if-ne v1, v2, :cond_0

    .line 19
    .line 20
    sget-object v1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 21
    .line 22
    if-ne p1, v1, :cond_0

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    const-string v2, "PortraitStatesTouchCtrl"

    .line 26
    .line 27
    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/SystemUiProxy;->onOverviewShown(ZLjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    sget-object v1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 31
    .line 32
    if-ne p1, v1, :cond_1

    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mDetector:Lcom/android/launcher3/touch/H;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/touch/g;->j()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    sget-object p1, Lw2/a;->i:Lw2/a;

    .line 41
    .line 42
    invoke-virtual {v0, p0, p1}, Lcom/android/quickstep/SystemUiProxy;->updateContextualEduStats(ZLw2/a;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    sget-object v1, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 47
    .line 48
    if-ne p1, v1, :cond_2

    .line 49
    .line 50
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mDetector:Lcom/android/launcher3/touch/H;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/android/launcher3/touch/g;->j()Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_2

    .line 57
    .line 58
    const/4 p0, 0x0

    .line 59
    sget-object p1, Lw2/a;->j:Lw2/a;

    .line 60
    .line 61
    invoke-virtual {v0, p0, p1}, Lcom/android/quickstep/SystemUiProxy;->updateContextualEduStats(ZLw2/a;)V

    .line 62
    .line 63
    .line 64
    :cond_2
    return-void
.end method
