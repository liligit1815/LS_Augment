.class public Ln1/x;
.super Ljava/lang/Object;
.source "SysUiScrim.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# instance fields
.field private final g:Lcom/android/launcher3/util/h2$a;

.field private h:Z

.field private i:Z

.field private final j:Landroid/graphics/RectF;

.field private final k:Landroid/graphics/Paint;

.field private final l:Landroid/graphics/Bitmap;

.field private final m:I

.field private final n:Landroid/graphics/RectF;

.field private final o:Landroid/graphics/Paint;

.field private final p:Landroid/graphics/Bitmap;

.field private final q:I

.field private final r:Landroid/view/View;

.field private final s:Lcom/android/launcher3/statemanager/i;

.field private final t:Z

.field private u:Z

.field private v:Z

.field private final w:Lcom/android/launcher3/anim/d;

.field private final x:Lcom/android/launcher3/anim/d;

.field private y:I


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ln1/x$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ln1/x$a;-><init>(Ln1/x;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ln1/x;->g:Lcom/android/launcher3/util/h2$a;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ln1/x;->j:Landroid/graphics/RectF;

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/Paint;

    .line 19
    .line 20
    const/4 v1, 0x6

    .line 21
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ln1/x;->k:Landroid/graphics/Paint;

    .line 25
    .line 26
    new-instance v2, Landroid/graphics/RectF;

    .line 27
    .line 28
    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v2, p0, Ln1/x;->n:Landroid/graphics/RectF;

    .line 32
    .line 33
    new-instance v2, Landroid/graphics/Paint;

    .line 34
    .line 35
    invoke-direct {v2, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 36
    .line 37
    .line 38
    iput-object v2, p0, Ln1/x;->o:Landroid/graphics/Paint;

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    iput-boolean v1, p0, Ln1/x;->u:Z

    .line 42
    .line 43
    iput-boolean v1, p0, Ln1/x;->v:Z

    .line 44
    .line 45
    new-instance v2, Lcom/android/launcher3/anim/d;

    .line 46
    .line 47
    new-instance v3, Ln1/w;

    .line 48
    .line 49
    invoke-direct {v3, p0}, Ln1/w;-><init>(Ln1/x;)V

    .line 50
    .line 51
    .line 52
    invoke-direct {v2, v3}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 53
    .line 54
    .line 55
    iput-object v2, p0, Ln1/x;->w:Lcom/android/launcher3/anim/d;

    .line 56
    .line 57
    new-instance v2, Lcom/android/launcher3/anim/d;

    .line 58
    .line 59
    new-instance v3, Ln1/w;

    .line 60
    .line 61
    invoke-direct {v3, p0}, Ln1/w;-><init>(Ln1/x;)V

    .line 62
    .line 63
    .line 64
    invoke-direct {v2, v3}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 65
    .line 66
    .line 67
    iput-object v2, p0, Ln1/x;->x:Lcom/android/launcher3/anim/d;

    .line 68
    .line 69
    iput v1, p0, Ln1/x;->y:I

    .line 70
    .line 71
    iput-object p1, p0, Ln1/x;->r:Landroid/view/View;

    .line 72
    .line 73
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {v1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    check-cast v1, Lcom/android/launcher3/statemanager/i;

    .line 82
    .line 83
    iput-object v1, p0, Ln1/x;->s:Lcom/android/launcher3/statemanager/i;

    .line 84
    .line 85
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    const/high16 v2, 0x428c0000    # 70.0f

    .line 98
    .line 99
    invoke-static {v2, v1}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    iput v2, p0, Ln1/x;->m:I

    .line 104
    .line 105
    const/high16 v3, 0x43480000    # 200.0f

    .line 106
    .line 107
    invoke-static {v3, v1}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    iput v1, p0, Ln1/x;->q:I

    .line 112
    .line 113
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    const v4, 0x7f04038d

    .line 118
    .line 119
    .line 120
    invoke-static {v3, v4}, Lcom/android/launcher3/util/F2;->c(Landroid/content/Context;I)Z

    .line 121
    .line 122
    .line 123
    move-result v3

    .line 124
    iput-boolean v3, p0, Ln1/x;->t:Z

    .line 125
    .line 126
    const v4, 0xffffff

    .line 127
    .line 128
    .line 129
    const/4 v5, 0x0

    .line 130
    if-eqz v3, :cond_0

    .line 131
    .line 132
    move-object v2, v5

    .line 133
    goto :goto_0

    .line 134
    :cond_0
    const v6, 0x3dffffff    # 0.12499999f

    .line 135
    .line 136
    .line 137
    const v7, 0xaffffff

    .line 138
    .line 139
    .line 140
    filled-new-array {v6, v7, v4}, [I

    .line 141
    .line 142
    .line 143
    move-result-object v6

    .line 144
    const/4 v7, 0x3

    .line 145
    new-array v7, v7, [F

    .line 146
    .line 147
    fill-array-data v7, :array_0

    .line 148
    .line 149
    .line 150
    invoke-direct {p0, v2, v6, v7}, Ln1/x;->c(I[I[F)Landroid/graphics/Bitmap;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    :goto_0
    iput-object v2, p0, Ln1/x;->l:Landroid/graphics/Bitmap;

    .line 155
    .line 156
    const v2, -0xddddde

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 160
    .line 161
    .line 162
    if-eqz v3, :cond_1

    .line 163
    .line 164
    goto :goto_1

    .line 165
    :cond_1
    const v0, 0x2fffffff

    .line 166
    .line 167
    .line 168
    filled-new-array {v4, v0}, [I

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    const/4 v2, 0x2

    .line 173
    new-array v2, v2, [F

    .line 174
    .line 175
    fill-array-data v2, :array_1

    .line 176
    .line 177
    .line 178
    invoke-direct {p0, v1, v0, v2}, Ln1/x;->c(I[I[F)Landroid/graphics/Bitmap;

    .line 179
    .line 180
    .line 181
    move-result-object v5

    .line 182
    :goto_1
    iput-object v5, p0, Ln1/x;->p:Landroid/graphics/Bitmap;

    .line 183
    .line 184
    if-nez v3, :cond_2

    .line 185
    .line 186
    invoke-virtual {p1, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 187
    .line 188
    .line 189
    :cond_2
    return-void

    .line 190
    nop

    .line 191
    :array_0
    .array-data 4
        0x0
        0x3f333333    # 0.7f
        0x3f800000    # 1.0f
    .end array-data

    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic a(Ln1/x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ln1/x;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b(Ln1/x;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ln1/x;->v:Z

    .line 2
    .line 3
    return-void
.end method

.method private c(I[I[F)Landroid/graphics/Bitmap;
    .locals 11

    .line 1
    iget-object p0, p0, Ln1/x;->s:Lcom/android/launcher3/statemanager/i;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/high16 v0, 0x40000000    # 2.0f

    .line 16
    .line 17
    invoke-static {v0, p0}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    sget-object v0, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    .line 22
    .line 23
    invoke-static {p0, p1, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v0, Landroid/graphics/Canvas;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 30
    .line 31
    .line 32
    new-instance v1, Landroid/graphics/Paint;

    .line 33
    .line 34
    const/4 v2, 0x4

    .line 35
    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    .line 36
    .line 37
    .line 38
    new-instance v3, Landroid/graphics/LinearGradient;

    .line 39
    .line 40
    int-to-float v7, p1

    .line 41
    sget-object v10, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 42
    .line 43
    const/4 v4, 0x0

    .line 44
    const/4 v5, 0x0

    .line 45
    const/4 v6, 0x0

    .line 46
    move-object v8, p2

    .line 47
    move-object v9, p3

    .line 48
    invoke-direct/range {v3 .. v10}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->drawPaint(Landroid/graphics/Paint;)V

    .line 55
    .line 56
    .line 57
    return-object p0
.end method

.method private h()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ln1/x;->i()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ln1/x;->r:Landroid/view/View;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private i()V
    .locals 3

    .line 1
    iget-object v0, p0, Ln1/x;->x:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 4
    .line 5
    iget-object v1, p0, Ln1/x;->w:Lcom/android/launcher3/anim/d;

    .line 6
    .line 7
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 8
    .line 9
    mul-float/2addr v0, v1

    .line 10
    iget-boolean v1, p0, Ln1/x;->u:Z

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    const/high16 v0, 0x3f800000    # 1.0f

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Ln1/x;->o:Landroid/graphics/Paint;

    .line 17
    .line 18
    const/high16 v2, 0x437f0000    # 255.0f

    .line 19
    .line 20
    mul-float/2addr v0, v2

    .line 21
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ln1/x;->k:Landroid/graphics/Paint;

    .line 29
    .line 30
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public d(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ln1/x;->t:Z

    .line 2
    .line 3
    if-nez v0, :cond_4

    .line 4
    .line 5
    iget-object v0, p0, Ln1/x;->x:Lcom/android/launcher3/anim/d;

    .line 6
    .line 7
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    cmpg-float v0, v0, v1

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-gtz v0, :cond_0

    .line 14
    .line 15
    iput-boolean v2, p0, Ln1/x;->v:Z

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-boolean v0, p0, Ln1/x;->v:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ln1/x;->w:Lcom/android/launcher3/anim/d;

    .line 23
    .line 24
    iput v1, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 25
    .line 26
    invoke-direct {p0}, Ln1/x;->i()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ln1/x;->w:Lcom/android/launcher3/anim/d;

    .line 30
    .line 31
    const/high16 v1, 0x3f800000    # 1.0f

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-wide/16 v3, 0x258

    .line 38
    .line 39
    invoke-virtual {v0, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Ln1/x;->s:Lcom/android/launcher3/statemanager/i;

    .line 43
    .line 44
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getWindow()Landroid/view/Window;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Landroid/view/Window;->getTransitionBackgroundFadeDuration()J

    .line 49
    .line 50
    .line 51
    move-result-wide v3

    .line 52
    invoke-virtual {v0, v3, v4}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 56
    .line 57
    .line 58
    iput-boolean v2, p0, Ln1/x;->v:Z

    .line 59
    .line 60
    :cond_1
    iget-boolean v0, p0, Ln1/x;->h:Z

    .line 61
    .line 62
    const/4 v1, 0x0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    iget-object v0, p0, Ln1/x;->l:Landroid/graphics/Bitmap;

    .line 66
    .line 67
    iget-object v2, p0, Ln1/x;->j:Landroid/graphics/RectF;

    .line 68
    .line 69
    iget-object v3, p0, Ln1/x;->k:Landroid/graphics/Paint;

    .line 70
    .line 71
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 72
    .line 73
    .line 74
    :cond_2
    iget-boolean v0, p0, Ln1/x;->i:Z

    .line 75
    .line 76
    if-eqz v0, :cond_3

    .line 77
    .line 78
    iget-object v0, p0, Ln1/x;->p:Landroid/graphics/Bitmap;

    .line 79
    .line 80
    iget-object v2, p0, Ln1/x;->n:Landroid/graphics/RectF;

    .line 81
    .line 82
    iget-object p0, p0, Ln1/x;->o:Landroid/graphics/Paint;

    .line 83
    .line 84
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 85
    .line 86
    .line 87
    :cond_3
    return-void

    .line 88
    :cond_4
    iget-object v0, p0, Ln1/x;->s:Lcom/android/launcher3/statemanager/i;

    .line 89
    .line 90
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getForeColor()I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    invoke-static {v0}, Lx1/O;->G0(I)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    iget p0, p0, Ln1/x;->y:I

    .line 99
    .line 100
    invoke-static {v0, p0}, Ls1/q;->h(II)I

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    invoke-virtual {p1, p0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public e()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Ln1/x;->w:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Ln1/x;->x:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ln1/x;->s:Lcom/android/launcher3/statemanager/i;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x1

    .line 11
    if-lez p1, :cond_0

    .line 12
    .line 13
    move p1, v2

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move p1, v1

    .line 16
    :goto_0
    iput-boolean p1, p0, Ln1/x;->h:Z

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    iget-boolean p1, v0, Lcom/android/launcher3/h0;->P0:Z

    .line 25
    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    iget-boolean p1, v0, Lcom/android/launcher3/h0;->p3:Z

    .line 29
    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    move v1, v2

    .line 33
    :cond_1
    iput-boolean v1, p0, Ln1/x;->i:Z

    .line 34
    .line 35
    return-void
.end method

.method public j(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Ln1/x;->j:Landroid/graphics/RectF;

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    iget v1, p0, Ln1/x;->m:I

    .line 5
    .line 6
    int-to-float v1, v1

    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v2, v2, p1, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ln1/x;->n:Landroid/graphics/RectF;

    .line 12
    .line 13
    iget p0, p0, Ln1/x;->q:I

    .line 14
    .line 15
    sub-int p0, p2, p0

    .line 16
    .line 17
    int-to-float p0, p0

    .line 18
    int-to-float p2, p2

    .line 19
    invoke-virtual {v0, v2, p0, p1, p2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/android/launcher3/util/h2;->k:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v0, p0, Ln1/x;->s:Lcom/android/launcher3/statemanager/i;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/android/launcher3/util/h2;

    .line 14
    .line 15
    iget-object p0, p0, Ln1/x;->g:Lcom/android/launcher3/util/h2$a;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/h2;->c(Lcom/android/launcher3/util/h2$a;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/android/launcher3/util/h2;->k:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v0, p0, Ln1/x;->s:Lcom/android/launcher3/statemanager/i;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/android/launcher3/util/h2;

    .line 14
    .line 15
    iget-object p0, p0, Ln1/x;->g:Lcom/android/launcher3/util/h2$a;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/h2;->n(Lcom/android/launcher3/util/h2$a;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
