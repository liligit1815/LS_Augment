.class public Lcom/android/launcher3/dragndrop/z;
.super Ljava/lang/Object;
.source "FlingToDeleteHelper.java"


# instance fields
.field private final a:Lcom/android/launcher3/C2;

.field private b:Lcom/android/launcher3/ButtonDropTarget;

.field private c:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/z;->a:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    return-void
.end method

.method private a(Landroid/graphics/PointF;Landroid/graphics/PointF;)F
    .locals 2

    .line 1
    iget p0, p1, Landroid/graphics/PointF;->x:F

    .line 2
    .line 3
    iget v0, p2, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    mul-float/2addr p0, v0

    .line 6
    iget v0, p1, Landroid/graphics/PointF;->y:F

    .line 7
    .line 8
    iget v1, p2, Landroid/graphics/PointF;->y:F

    .line 9
    .line 10
    mul-float/2addr v0, v1

    .line 11
    add-float/2addr p0, v0

    .line 12
    invoke-virtual {p1}, Landroid/graphics/PointF;->length()F

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-virtual {p2}, Landroid/graphics/PointF;->length()F

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    mul-float/2addr p1, p2

    .line 21
    div-float/2addr p0, p1

    .line 22
    float-to-double p0, p0

    .line 23
    invoke-static {p0, p1}, Ljava/lang/Math;->acos(D)D

    .line 24
    .line 25
    .line 26
    move-result-wide p0

    .line 27
    double-to-float p0, p0

    .line 28
    return p0
.end method

.method private d()Landroid/graphics/PointF;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/z;->c:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/z;->a:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/z;->a:Lcom/android/launcher3/C2;

    .line 16
    .line 17
    sget-object v2, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 18
    .line 19
    invoke-interface {v0, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    return-object v1

    .line 26
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/z;->b:Lcom/android/launcher3/ButtonDropTarget;

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/z;->a:Lcom/android/launcher3/C2;

    .line 31
    .line 32
    const v2, 0x7f0b0204

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v2}, Lcom/android/launcher3/statemanager/h;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/android/launcher3/ButtonDropTarget;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/z;->b:Lcom/android/launcher3/ButtonDropTarget;

    .line 42
    .line 43
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/z;->b:Lcom/android/launcher3/ButtonDropTarget;

    .line 44
    .line 45
    if-eqz v0, :cond_7

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/ButtonDropTarget;->D()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_3

    .line 52
    .line 53
    goto/16 :goto_1

    .line 54
    .line 55
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/z;->a:Lcom/android/launcher3/C2;

    .line 56
    .line 57
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/z;->c:Landroid/view/VelocityTracker;

    .line 62
    .line 63
    if-nez v2, :cond_4

    .line 64
    .line 65
    const-string p0, "FlingToDeleteHelper"

    .line 66
    .line 67
    const-string v0, "isFlingingToDelete mVelcocityTracker is null"

    .line 68
    .line 69
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    return-object v1

    .line 73
    :cond_4
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    int-to-float v0, v0

    .line 78
    const/16 v3, 0x3e8

    .line 79
    .line 80
    invoke-virtual {v2, v3, v0}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 81
    .line 82
    .line 83
    new-instance v0, Landroid/graphics/PointF;

    .line 84
    .line 85
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/z;->c:Landroid/view/VelocityTracker;

    .line 86
    .line 87
    invoke-virtual {v2}, Landroid/view/VelocityTracker;->getXVelocity()F

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/z;->c:Landroid/view/VelocityTracker;

    .line 92
    .line 93
    invoke-virtual {v3}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    invoke-direct {v0, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 98
    .line 99
    .line 100
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/z;->a:Lcom/android/launcher3/C2;

    .line 101
    .line 102
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/z;->c:Landroid/view/VelocityTracker;

    .line 107
    .line 108
    invoke-virtual {v3}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    iget v4, v2, Lcom/android/launcher3/h0;->y3:I

    .line 113
    .line 114
    int-to-float v4, v4

    .line 115
    cmpg-float v3, v3, v4

    .line 116
    .line 117
    const/high16 v4, -0x40800000    # -1.0f

    .line 118
    .line 119
    const/4 v5, 0x0

    .line 120
    if-gez v3, :cond_5

    .line 121
    .line 122
    new-instance v2, Landroid/graphics/PointF;

    .line 123
    .line 124
    invoke-direct {v2, v5, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 125
    .line 126
    .line 127
    invoke-direct {p0, v0, v2}, Lcom/android/launcher3/dragndrop/z;->a(Landroid/graphics/PointF;Landroid/graphics/PointF;)F

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    goto :goto_0

    .line 132
    :cond_5
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/z;->a:Lcom/android/launcher3/C2;

    .line 133
    .line 134
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    invoke-virtual {v3}, Lcom/android/launcher3/h0;->T0()Z

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    if-eqz v3, :cond_6

    .line 143
    .line 144
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/z;->c:Landroid/view/VelocityTracker;

    .line 145
    .line 146
    invoke-virtual {v3}, Landroid/view/VelocityTracker;->getXVelocity()F

    .line 147
    .line 148
    .line 149
    move-result v3

    .line 150
    iget v2, v2, Lcom/android/launcher3/h0;->y3:I

    .line 151
    .line 152
    int-to-float v2, v2

    .line 153
    cmpg-float v2, v3, v2

    .line 154
    .line 155
    if-gez v2, :cond_6

    .line 156
    .line 157
    new-instance v2, Landroid/graphics/PointF;

    .line 158
    .line 159
    invoke-direct {v2, v4, v5}, Landroid/graphics/PointF;-><init>(FF)V

    .line 160
    .line 161
    .line 162
    invoke-direct {p0, v0, v2}, Lcom/android/launcher3/dragndrop/z;->a(Landroid/graphics/PointF;Landroid/graphics/PointF;)F

    .line 163
    .line 164
    .line 165
    move-result p0

    .line 166
    goto :goto_0

    .line 167
    :cond_6
    const/high16 p0, 0x42100000    # 36.0f

    .line 168
    .line 169
    :goto_0
    float-to-double v2, p0

    .line 170
    const-wide v4, 0x4041800000000000L    # 35.0

    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    invoke-static {v4, v5}, Ljava/lang/Math;->toRadians(D)D

    .line 176
    .line 177
    .line 178
    move-result-wide v4

    .line 179
    cmpg-double p0, v2, v4

    .line 180
    .line 181
    if-gtz p0, :cond_7

    .line 182
    .line 183
    return-object v0

    .line 184
    :cond_7
    :goto_1
    return-object v1
.end method


# virtual methods
.method public b()Lcom/android/launcher3/n0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/z;->b:Lcom/android/launcher3/ButtonDropTarget;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)Ljava/lang/Runnable;
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/z;->d()Landroid/graphics/PointF;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    if-eqz v3, :cond_1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_1
    const/4 v1, 0x0

    .line 14
    :goto_0
    iput-boolean v1, p2, Lcom/android/launcher3/dragndrop/p;->g:Z

    .line 15
    .line 16
    if-nez v1, :cond_2

    .line 17
    .line 18
    return-object v0

    .line 19
    :cond_2
    new-instance v1, Lcom/android/launcher3/util/r0;

    .line 20
    .line 21
    iget-object v4, p0, Lcom/android/launcher3/dragndrop/z;->b:Lcom/android/launcher3/ButtonDropTarget;

    .line 22
    .line 23
    iget-object v5, p0, Lcom/android/launcher3/dragndrop/z;->a:Lcom/android/launcher3/C2;

    .line 24
    .line 25
    move-object v2, p1

    .line 26
    move-object v6, p2

    .line 27
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/util/r0;-><init>(Lcom/android/launcher3/n0$a;Landroid/graphics/PointF;Lcom/android/launcher3/ButtonDropTarget;Lcom/android/launcher3/C2;Lcom/android/launcher3/dragndrop/p;)V

    .line 28
    .line 29
    .line 30
    return-object v1
.end method

.method public e(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/z;->c:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/z;->c:Landroid/view/VelocityTracker;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/z;->c:Landroid/view/VelocityTracker;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/z;->c:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/z;->c:Landroid/view/VelocityTracker;

    .line 10
    .line 11
    :cond_0
    return-void
.end method
