.class Lcom/android/launcher3/w0$a;
.super Ljava/lang/Object;
.source "FirstFrameAnimatorHelper.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/w0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field private g:J

.field private h:J

.field private i:Z

.field private j:Z

.field final synthetic k:Lcom/android/launcher3/w0;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/w0;)V
    .locals 2

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/w0$a;->k:Lcom/android/launcher3/w0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    .line 3
    iput-wide v0, p0, Lcom/android/launcher3/w0$a;->h:J

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/w0;Lcom/android/launcher3/x0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/w0$a;-><init>(Lcom/android/launcher3/w0;)V

    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/w0$a;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/w0$a;->b(Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic b(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->removeUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    iget-wide v4, v0, Lcom/android/launcher3/w0$a;->h:J

    .line 10
    .line 11
    const-wide/16 v6, -0x1

    .line 12
    .line 13
    cmp-long v4, v4, v6

    .line 14
    .line 15
    if-nez v4, :cond_0

    .line 16
    .line 17
    iget-object v4, v0, Lcom/android/launcher3/w0$a;->k:Lcom/android/launcher3/w0;

    .line 18
    .line 19
    invoke-static {v4}, Lcom/android/launcher3/w0;->a(Lcom/android/launcher3/w0;)J

    .line 20
    .line 21
    .line 22
    move-result-wide v4

    .line 23
    iput-wide v4, v0, Lcom/android/launcher3/w0$a;->g:J

    .line 24
    .line 25
    iput-wide v2, v0, Lcom/android/launcher3/w0$a;->h:J

    .line 26
    .line 27
    :cond_0
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->getCurrentPlayTime()J

    .line 28
    .line 29
    .line 30
    move-result-wide v4

    .line 31
    const/high16 v6, 0x3f800000    # 1.0f

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    invoke-static {v6, v7}, Ljava/lang/Float;->compare(FF)I

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    const/4 v7, 0x0

    .line 42
    const/4 v8, 0x1

    .line 43
    if-nez v6, :cond_1

    .line 44
    .line 45
    move v6, v8

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    move v6, v7

    .line 48
    :goto_0
    iget-boolean v9, v0, Lcom/android/launcher3/w0$a;->i:Z

    .line 49
    .line 50
    if-nez v9, :cond_5

    .line 51
    .line 52
    iget-object v9, v0, Lcom/android/launcher3/w0$a;->k:Lcom/android/launcher3/w0;

    .line 53
    .line 54
    invoke-static {v9}, Lcom/android/launcher3/w0;->b(Lcom/android/launcher3/w0;)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v9

    .line 58
    if-eqz v9, :cond_5

    .line 59
    .line 60
    iget-object v9, v0, Lcom/android/launcher3/w0$a;->k:Lcom/android/launcher3/w0;

    .line 61
    .line 62
    invoke-static {v9}, Lcom/android/launcher3/w0;->b(Lcom/android/launcher3/w0;)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v9

    .line 66
    invoke-virtual {v9}, Landroid/view/View;->getWindowVisibility()I

    .line 67
    .line 68
    .line 69
    move-result v9

    .line 70
    if-nez v9, :cond_5

    .line 71
    .line 72
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->getDuration()J

    .line 73
    .line 74
    .line 75
    move-result-wide v9

    .line 76
    cmp-long v9, v4, v9

    .line 77
    .line 78
    if-gez v9, :cond_5

    .line 79
    .line 80
    if-nez v6, :cond_5

    .line 81
    .line 82
    iput-boolean v8, v0, Lcom/android/launcher3/w0$a;->i:Z

    .line 83
    .line 84
    iget-object v6, v0, Lcom/android/launcher3/w0$a;->k:Lcom/android/launcher3/w0;

    .line 85
    .line 86
    invoke-static {v6}, Lcom/android/launcher3/w0;->a(Lcom/android/launcher3/w0;)J

    .line 87
    .line 88
    .line 89
    move-result-wide v9

    .line 90
    iget-wide v11, v0, Lcom/android/launcher3/w0$a;->g:J

    .line 91
    .line 92
    sub-long/2addr v9, v11

    .line 93
    const-wide/16 v11, 0x0

    .line 94
    .line 95
    cmp-long v6, v9, v11

    .line 96
    .line 97
    const-wide/16 v15, 0x3e8

    .line 98
    .line 99
    if-nez v6, :cond_2

    .line 100
    .line 101
    iget-wide v13, v0, Lcom/android/launcher3/w0$a;->h:J

    .line 102
    .line 103
    add-long/2addr v13, v15

    .line 104
    cmp-long v6, v2, v13

    .line 105
    .line 106
    if-gez v6, :cond_2

    .line 107
    .line 108
    cmp-long v6, v4, v11

    .line 109
    .line 110
    if-lez v6, :cond_2

    .line 111
    .line 112
    iget-object v2, v0, Lcom/android/launcher3/w0$a;->k:Lcom/android/launcher3/w0;

    .line 113
    .line 114
    invoke-static {v2}, Lcom/android/launcher3/w0;->b(Lcom/android/launcher3/w0;)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    invoke-virtual {v2}, Landroid/view/View;->invalidate()V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v1, v11, v12}, Landroid/animation/ValueAnimator;->setCurrentPlayTime(J)V

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_2
    iget-object v6, v0, Lcom/android/launcher3/w0$a;->k:Lcom/android/launcher3/w0;

    .line 126
    .line 127
    invoke-static {v6}, Lcom/android/launcher3/w0;->b(Lcom/android/launcher3/w0;)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v6

    .line 131
    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 132
    .line 133
    .line 134
    move-result-object v6

    .line 135
    invoke-static {v6}, Lcom/android/launcher3/util/window/b;->a(Landroid/content/Context;)I

    .line 136
    .line 137
    .line 138
    move-result v6

    .line 139
    const-wide/16 v11, 0x1

    .line 140
    .line 141
    cmp-long v9, v9, v11

    .line 142
    .line 143
    if-nez v9, :cond_3

    .line 144
    .line 145
    iget-wide v10, v0, Lcom/android/launcher3/w0$a;->h:J

    .line 146
    .line 147
    add-long v13, v10, v15

    .line 148
    .line 149
    cmp-long v12, v2, v13

    .line 150
    .line 151
    if-gez v12, :cond_3

    .line 152
    .line 153
    iget-boolean v12, v0, Lcom/android/launcher3/w0$a;->j:Z

    .line 154
    .line 155
    if-nez v12, :cond_3

    .line 156
    .line 157
    int-to-long v12, v6

    .line 158
    add-long/2addr v10, v12

    .line 159
    cmp-long v2, v2, v10

    .line 160
    .line 161
    if-lez v2, :cond_3

    .line 162
    .line 163
    cmp-long v2, v4, v12

    .line 164
    .line 165
    if-lez v2, :cond_3

    .line 166
    .line 167
    invoke-virtual {v1, v12, v13}, Landroid/animation/ValueAnimator;->setCurrentPlayTime(J)V

    .line 168
    .line 169
    .line 170
    iput-boolean v8, v0, Lcom/android/launcher3/w0$a;->j:Z

    .line 171
    .line 172
    goto :goto_1

    .line 173
    :cond_3
    if-lez v9, :cond_4

    .line 174
    .line 175
    iget-object v2, v0, Lcom/android/launcher3/w0$a;->k:Lcom/android/launcher3/w0;

    .line 176
    .line 177
    invoke-static {v2}, Lcom/android/launcher3/w0;->b(Lcom/android/launcher3/w0;)Landroid/view/View;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    new-instance v3, Lcom/android/launcher3/v0;

    .line 182
    .line 183
    invoke-direct {v3, v0, v1}, Lcom/android/launcher3/v0;-><init>(Lcom/android/launcher3/w0$a;Landroid/animation/ValueAnimator;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v2, v3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 187
    .line 188
    .line 189
    :cond_4
    :goto_1
    iput-boolean v7, v0, Lcom/android/launcher3/w0$a;->i:Z

    .line 190
    .line 191
    :cond_5
    return-void
.end method
