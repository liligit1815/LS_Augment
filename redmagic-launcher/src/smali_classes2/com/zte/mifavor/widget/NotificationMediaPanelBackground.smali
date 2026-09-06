.class public Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;
.super Landroid/view/View;
.source "NotificationMediaPanelBackground.java"


# instance fields
.field private g:Landroid/graphics/Paint;

.field private h:Landroid/graphics/Paint;

.field private i:Landroid/graphics/Paint;

.field private j:Landroid/graphics/Path;

.field private k:Landroid/graphics/RectF;

.field private l:I

.field private m:I

.field private n:F

.field private o:F

.field private p:F

.field private q:Lcom/zte/mifavor/widget/k;

.field private final r:Landroid/os/Handler;

.field private s:I

.field private t:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-direct {p2, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->r:Landroid/os/Handler;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->t:Landroid/content/Context;

    .line 16
    .line 17
    new-instance p1, Landroid/graphics/Paint;

    .line 18
    .line 19
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->g:Landroid/graphics/Paint;

    .line 23
    .line 24
    const/4 p2, 0x1

    .line 25
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    iput p1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->l:I

    .line 30
    .line 31
    iput p1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->m:I

    .line 32
    .line 33
    const/4 p1, 0x0

    .line 34
    iput p1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->n:F

    .line 35
    .line 36
    iput p1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->o:F

    .line 37
    .line 38
    const-string p1, "#1FFFFFFF"

    .line 39
    .line 40
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    iput p1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->s:I

    .line 45
    .line 46
    invoke-direct {p0}, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->e()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method static bridge synthetic a(Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;)Landroid/graphics/Path;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->j:Landroid/graphics/Path;

    .line 2
    .line 3
    return-object p0
.end method

.method private b(F)F
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 14
    .line 15
    mul-float/2addr p1, p0

    .line 16
    return p1
.end method

.method private c()V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->j:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/graphics/RectF;

    .line 7
    .line 8
    iget v1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->n:F

    .line 9
    .line 10
    iget v2, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->l:I

    .line 11
    .line 12
    div-int/lit8 v3, v2, 0x2

    .line 13
    .line 14
    int-to-float v3, v3

    .line 15
    sub-float v3, v1, v3

    .line 16
    .line 17
    iget v4, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->o:F

    .line 18
    .line 19
    iget v5, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->m:I

    .line 20
    .line 21
    div-int/lit8 v6, v5, 0x2

    .line 22
    .line 23
    int-to-float v6, v6

    .line 24
    sub-float v6, v4, v6

    .line 25
    .line 26
    div-int/lit8 v2, v2, 0x2

    .line 27
    .line 28
    int-to-float v2, v2

    .line 29
    add-float/2addr v1, v2

    .line 30
    div-int/lit8 v5, v5, 0x2

    .line 31
    .line 32
    int-to-float v2, v5

    .line 33
    add-float/2addr v4, v2

    .line 34
    invoke-direct {v0, v3, v6, v1, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->k:Landroid/graphics/RectF;

    .line 38
    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string v1, "drawPath: zjw0115, "

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->k:Landroid/graphics/RectF;

    .line 50
    .line 51
    iget v1, v1, Landroid/graphics/RectF;->left:F

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v1, " , "

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->k:Landroid/graphics/RectF;

    .line 62
    .line 63
    iget v2, v2, Landroid/graphics/RectF;->top:F

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget-object v2, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->k:Landroid/graphics/RectF;

    .line 72
    .line 73
    iget v2, v2, Landroid/graphics/RectF;->right:F

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->k:Landroid/graphics/RectF;

    .line 82
    .line 83
    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    const-string v1, "notification_media_panel_bg"

    .line 93
    .line 94
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    iget v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->l:I

    .line 98
    .line 99
    int-to-double v1, v0

    .line 100
    iget v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->m:I

    .line 101
    .line 102
    int-to-double v3, v0

    .line 103
    iget v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->p:F

    .line 104
    .line 105
    float-to-double v5, v0

    .line 106
    float-to-double v7, v0

    .line 107
    float-to-double v9, v0

    .line 108
    float-to-double v11, v0

    .line 109
    invoke-static/range {v1 .. v12}, Lcom/zte/mifavor/widget/h;->c(DDDDDD)Landroid/graphics/Path;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iput-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->j:Landroid/graphics/Path;

    .line 114
    .line 115
    iget v1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->n:F

    .line 116
    .line 117
    iget v2, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->l:I

    .line 118
    .line 119
    div-int/lit8 v2, v2, 0x2

    .line 120
    .line 121
    int-to-float v2, v2

    .line 122
    sub-float/2addr v1, v2

    .line 123
    iget v2, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->o:F

    .line 124
    .line 125
    iget v3, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->m:I

    .line 126
    .line 127
    div-int/lit8 v3, v3, 0x2

    .line 128
    .line 129
    int-to-float v3, v3

    .line 130
    sub-float/2addr v2, v3

    .line 131
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->offset(FF)V

    .line 132
    .line 133
    .line 134
    invoke-direct {p0}, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->f()V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method private d(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->q:Lcom/zte/mifavor/widget/k;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->j:Landroid/graphics/Path;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/graphics/Path;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->q:Lcom/zte/mifavor/widget/k;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->j:Landroid/graphics/Path;

    .line 18
    .line 19
    invoke-virtual {v0, p1, p0}, Lcom/zte/mifavor/widget/k;->c(Landroid/graphics/Canvas;Landroid/graphics/Path;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catch_0
    move-exception p0

    .line 24
    new-instance p1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v0, "drawVisualEffects exception: "

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string v0, "notification_media_panel_bg"

    .line 42
    .line 43
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method private e()V
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->h:Landroid/graphics/Paint;

    .line 8
    .line 9
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->h:Landroid/graphics/Paint;

    .line 15
    .line 16
    const/high16 v3, 0x1a000000

    .line 17
    .line 18
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Landroid/graphics/Paint;

    .line 22
    .line 23
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->i:Landroid/graphics/Paint;

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->i:Landroid/graphics/Paint;

    .line 32
    .line 33
    iget v2, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->s:I

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 36
    .line 37
    .line 38
    new-instance v0, Landroid/graphics/Path;

    .line 39
    .line 40
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->j:Landroid/graphics/Path;

    .line 44
    .line 45
    const/high16 v0, 0x41a80000    # 21.0f

    .line 46
    .line 47
    invoke-direct {p0, v0}, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->b(F)F

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    float-to-int v0, v0

    .line 52
    int-to-float v0, v0

    .line 53
    iput v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->p:F

    .line 54
    .line 55
    new-instance v0, Lcom/zte/mifavor/widget/k;

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-direct {v0, v2}, Lcom/zte/mifavor/widget/k;-><init>(Landroid/content/Context;)V

    .line 62
    .line 63
    .line 64
    iput-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->q:Lcom/zte/mifavor/widget/k;

    .line 65
    .line 66
    invoke-virtual {v0, v1, v1}, Lcom/zte/mifavor/widget/k;->g(ZZ)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method private f()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->j:Landroid/graphics/Path;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/Path;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->k:Landroid/graphics/RectF;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->r:Landroid/os/Handler;

    .line 17
    .line 18
    new-instance v1, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a;-><init>(Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->k:Landroid/graphics/RectF;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->j:Landroid/graphics/Path;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/graphics/Path;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    return-void

    .line 18
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->c()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->j:Landroid/graphics/Path;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->i:Landroid/graphics/Paint;

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->d(Landroid/graphics/Canvas;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method protected onMeasure(II)V
    .locals 6

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    const/high16 v2, 0x42280000    # 42.0f

    .line 18
    .line 19
    invoke-direct {p0, v2}, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->b(F)F

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    float-to-int v3, v3

    .line 24
    invoke-direct {p0, v2}, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->b(F)F

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    float-to-int v2, v2

    .line 29
    const/high16 v4, -0x80000000

    .line 30
    .line 31
    const/high16 v5, 0x40000000    # 2.0f

    .line 32
    .line 33
    if-ne v0, v5, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    if-ne v0, v4, :cond_1

    .line 37
    .line 38
    invoke-static {v3, p1}, Ljava/lang/Math;->min(II)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    move p1, v3

    .line 44
    :goto_0
    if-ne v1, v5, :cond_2

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    if-ne v1, v4, :cond_3

    .line 48
    .line 49
    invoke-static {v2, p2}, Ljava/lang/Math;->min(II)I

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    goto :goto_1

    .line 54
    :cond_3
    move p2, v2

    .line 55
    :goto_1
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 56
    .line 57
    .line 58
    iput p1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->l:I

    .line 59
    .line 60
    iput p2, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->m:I

    .line 61
    .line 62
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->l:I

    .line 5
    .line 6
    iput p2, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->m:I

    .line 7
    .line 8
    int-to-float p1, p1

    .line 9
    const/high16 p3, 0x40000000    # 2.0f

    .line 10
    .line 11
    div-float/2addr p1, p3

    .line 12
    iput p1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->n:F

    .line 13
    .line 14
    int-to-float p1, p2

    .line 15
    div-float/2addr p1, p3

    .line 16
    iput p1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->o:F

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->c()V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->f()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public setBgColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->s:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->i:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method protected setDynamicPanelPaint(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->q:Lcom/zte/mifavor/widget/k;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->h:Landroid/graphics/Paint;

    .line 6
    .line 7
    if-eqz v1, :cond_2

    .line 8
    .line 9
    iget-object v1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->i:Landroid/graphics/Paint;

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v1, 0x1

    .line 15
    invoke-virtual {v0, p1, v1}, Lcom/zte/mifavor/widget/k;->g(ZZ)V

    .line 16
    .line 17
    .line 18
    const v0, 0x1f0f87f7

    .line 19
    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->h:Landroid/graphics/Paint;

    .line 24
    .line 25
    const/high16 v1, 0x1a000000

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->i:Landroid/graphics/Paint;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    iget-object p1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->h:Landroid/graphics/Paint;

    .line 37
    .line 38
    const v1, 0x1affffff

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->i:Landroid/graphics/Paint;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 47
    .line 48
    .line 49
    :cond_2
    :goto_0
    return-void
.end method
