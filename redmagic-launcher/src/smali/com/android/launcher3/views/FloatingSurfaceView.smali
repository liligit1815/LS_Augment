.class public Lcom/android/launcher3/views/FloatingSurfaceView;
.super Lcom/android/launcher3/a;
.source "FloatingSurfaceView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Lcom/android/launcher3/g1;
.implements Landroid/view/SurfaceHolder$Callback2;


# instance fields
.field private final g:Landroid/graphics/RectF;

.field private final h:Lcom/android/launcher3/C2;

.field private final i:Landroid/graphics/RectF;

.field private final j:Landroid/graphics/Rect;

.field private final k:Landroid/graphics/Picture;

.field private final l:Ljava/lang/Runnable;

.field private final m:Landroid/view/SurfaceView;

.field private n:Landroid/view/View;

.field private o:Lcom/android/launcher3/z0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/views/FloatingSurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->g:Landroid/graphics/RectF;

    .line 4
    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->i:Landroid/graphics/RectF;

    .line 5
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->j:Landroid/graphics/Rect;

    .line 6
    new-instance p2, Landroid/graphics/Picture;

    invoke-direct {p2}, Landroid/graphics/Picture;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->k:Landroid/graphics/Picture;

    .line 7
    new-instance p2, Lcom/android/launcher3/views/I;

    invoke-direct {p2, p0}, Lcom/android/launcher3/views/I;-><init>(Lcom/android/launcher3/views/FloatingSurfaceView;)V

    iput-object p2, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->l:Ljava/lang/Runnable;

    .line 8
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->h:Lcom/android/launcher3/C2;

    .line 9
    new-instance p2, Landroid/view/SurfaceView;

    invoke-direct {p2, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->m:Landroid/view/SurfaceView;

    const/4 p1, 0x1

    .line 10
    invoke-virtual {p2, p1}, Landroid/view/SurfaceView;->setZOrderOnTop(Z)V

    .line 11
    invoke-virtual {p2}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p3

    const/4 v0, -0x3

    invoke-interface {p3, v0}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 12
    invoke-virtual {p2}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p3

    invoke-interface {p3, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 13
    iput-boolean p1, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 14
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic N(Lcom/android/launcher3/views/FloatingSurfaceView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/views/FloatingSurfaceView;->Q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private O()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->m:Landroid/view/SurfaceView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Landroid/view/SurfaceHolder;->lockHardwareCanvas()Landroid/graphics/Canvas;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->k:Landroid/graphics/Picture;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/graphics/Picture;->draw(Landroid/graphics/Canvas;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private Q()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->k:Landroid/graphics/Picture;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1, v1}, Landroid/graphics/Picture;->beginRecording(II)Landroid/graphics/Canvas;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->k:Landroid/graphics/Picture;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/graphics/Picture;->endRecording()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->h:Lcom/android/launcher3/C2;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->removeViewInLayout(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private R()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->l:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Lcom/android/launcher3/views/FloatingSurfaceView;->Q()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private S()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->o:Lcom/android/launcher3/z0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->i:Landroid/graphics/RectF;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->h:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->m:Landroid/view/SurfaceView;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getSurfaceControl()Landroid/view/SurfaceControl;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, v1, v2, p0}, Lcom/android/launcher3/z0;->b(Landroid/graphics/RectF;Lcom/android/launcher3/views/k;Landroid/view/SurfaceControl;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static T(Lcom/android/launcher3/C2;Lcom/android/launcher3/z0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getViewCache()Lcom/android/launcher3/util/X2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f0e00d9

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0, v1, p0, v2}, Lcom/android/launcher3/util/X2;->b(ILandroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/android/launcher3/views/FloatingSurfaceView;

    .line 17
    .line 18
    iput-object p1, v0, Lcom/android/launcher3/views/FloatingSurfaceView;->o:Lcom/android/launcher3/z0;

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    iput-boolean p1, v0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 22
    .line 23
    invoke-direct {v0}, Lcom/android/launcher3/views/FloatingSurfaceView;->R()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private U()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->o:Lcom/android/launcher3/z0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_1

    .line 6
    .line 7
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->h:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/android/launcher3/z0;->a:Landroid/content/ComponentName;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v2, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->o:Lcom/android/launcher3/z0;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/android/launcher3/z0;->b:Landroid/os/UserHandle;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {v1, v3, v0, v2}, Lcom/android/launcher3/C2;->S1(Lcom/android/launcher3/util/z2;Ljava/lang/String;Landroid/os/UserHandle;)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->n:Landroid/view/View;

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    const/4 v3, 0x0

    .line 28
    if-eq v1, v0, :cond_1

    .line 29
    .line 30
    move v1, v2

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    move v1, v3

    .line 33
    :goto_0
    if-eqz v1, :cond_2

    .line 34
    .line 35
    invoke-direct {p0, v2}, Lcom/android/launcher3/views/FloatingSurfaceView;->setCurrentIconVisible(Z)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->n:Landroid/view/View;

    .line 39
    .line 40
    invoke-direct {p0, v3}, Lcom/android/launcher3/views/FloatingSurfaceView;->setCurrentIconVisible(Z)V

    .line 41
    .line 42
    .line 43
    :cond_2
    if-eqz v0, :cond_3

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-eqz v4, :cond_3

    .line 50
    .line 51
    iget-object v4, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->h:Lcom/android/launcher3/C2;

    .line 52
    .line 53
    iget-object v5, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->g:Landroid/graphics/RectF;

    .line 54
    .line 55
    iget-object v6, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->j:Landroid/graphics/Rect;

    .line 56
    .line 57
    invoke-static {v4, v0, v3, v5, v6}, Lcom/android/launcher3/views/FloatingIconView;->y(Lcom/android/launcher3/C2;Landroid/view/View;ZLandroid/graphics/RectF;Landroid/graphics/Rect;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->g:Landroid/graphics/RectF;

    .line 61
    .line 62
    iget-object v4, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->i:Landroid/graphics/RectF;

    .line 63
    .line 64
    invoke-virtual {v0, v4}, Landroid/graphics/RectF;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_3

    .line 69
    .line 70
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->i:Landroid/graphics/RectF;

    .line 71
    .line 72
    iget-object v4, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->g:Landroid/graphics/RectF;

    .line 73
    .line 74
    invoke-virtual {v0, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->m:Landroid/view/SurfaceView;

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 84
    .line 85
    iget-object v4, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->i:Landroid/graphics/RectF;

    .line 86
    .line 87
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 96
    .line 97
    iget-object v4, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->i:Landroid/graphics/RectF;

    .line 98
    .line 99
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 108
    .line 109
    iget-object v4, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->i:Landroid/graphics/RectF;

    .line 110
    .line 111
    iget v4, v4, Landroid/graphics/RectF;->left:F

    .line 112
    .line 113
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    .line 114
    .line 115
    .line 116
    move-result v4

    .line 117
    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 118
    .line 119
    iget-object v4, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->i:Landroid/graphics/RectF;

    .line 120
    .line 121
    iget v4, v4, Landroid/graphics/RectF;->top:F

    .line 122
    .line 123
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 128
    .line 129
    :cond_3
    invoke-direct {p0}, Lcom/android/launcher3/views/FloatingSurfaceView;->S()V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->n:Landroid/view/View;

    .line 133
    .line 134
    if-eqz v0, :cond_4

    .line 135
    .line 136
    if-eqz v1, :cond_4

    .line 137
    .line 138
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->j:Landroid/graphics/Rect;

    .line 139
    .line 140
    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-nez v0, :cond_4

    .line 145
    .line 146
    invoke-direct {p0, v2}, Lcom/android/launcher3/views/FloatingSurfaceView;->setCurrentIconVisible(Z)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->k:Landroid/graphics/Picture;

    .line 150
    .line 151
    iget-object v1, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->j:Landroid/graphics/Rect;

    .line 152
    .line 153
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    iget-object v2, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->j:Landroid/graphics/Rect;

    .line 158
    .line 159
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Picture;->beginRecording(II)Landroid/graphics/Canvas;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    iget-object v1, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->j:Landroid/graphics/Rect;

    .line 168
    .line 169
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 170
    .line 171
    neg-int v2, v2

    .line 172
    int-to-float v2, v2

    .line 173
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 174
    .line 175
    neg-int v1, v1

    .line 176
    int-to-float v1, v1

    .line 177
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 178
    .line 179
    .line 180
    iget-object v1, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->n:Landroid/view/View;

    .line 181
    .line 182
    invoke-virtual {v1, v0}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 183
    .line 184
    .line 185
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->k:Landroid/graphics/Picture;

    .line 186
    .line 187
    invoke-virtual {v0}, Landroid/graphics/Picture;->endRecording()V

    .line 188
    .line 189
    .line 190
    invoke-direct {p0, v3}, Lcom/android/launcher3/views/FloatingSurfaceView;->setCurrentIconVisible(Z)V

    .line 191
    .line 192
    .line 193
    invoke-direct {p0}, Lcom/android/launcher3/views/FloatingSurfaceView;->O()V

    .line 194
    .line 195
    .line 196
    :cond_4
    :goto_1
    return-void
.end method

.method private setCurrentIconVisible(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->n:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/android/launcher3/views/H;->a(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method protected handleClose(Z)V
    .locals 3

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-direct {p0, p1}, Lcom/android/launcher3/views/FloatingSurfaceView;->setCurrentIconVisible(Z)V

    .line 3
    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->h:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getViewCache()Lcom/android/launcher3/util/X2;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const v0, 0x7f0e00d9

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/util/X2;->c(ILandroid/view/View;)V

    .line 15
    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput-object p1, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->o:Lcom/android/launcher3/z0;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->n:Landroid/view/View;

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput-boolean p1, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 24
    .line 25
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->l:Ljava/lang/Runnable;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingSurfaceView;->h:Lcom/android/launcher3/C2;

    .line 34
    .line 35
    invoke-static {p0}, Lcom/android/launcher3/util/window/b;->a(Landroid/content/Context;)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    int-to-long v1, p0

    .line 40
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    and-int/lit16 p0, p1, 0x2000

    .line 2
    .line 3
    if-eqz p0, :cond_0

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

.method protected onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/views/FloatingSurfaceView;->U()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->close(Z)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/views/FloatingSurfaceView;->R()V

    .line 6
    .line 7
    .line 8
    return p1
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-direct {p0, v0}, Lcom/android/launcher3/views/FloatingSurfaceView;->setCurrentIconVisible(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onGlobalLayout()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/views/FloatingSurfaceView;->U()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/views/FloatingSurfaceView;->O()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/views/FloatingSurfaceView;->O()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/views/FloatingSurfaceView;->S()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    return-void
.end method

.method public surfaceRedrawNeeded(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/views/FloatingSurfaceView;->O()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
