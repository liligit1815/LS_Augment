.class public abstract Lcom/android/launcher3/widget/h;
.super Lcom/android/launcher3/widget/x0;
.source "BaseLauncherAppWidgetHostView.java"


# static fields
.field private static final x:Landroid/view/ViewOutlineProvider;


# instance fields
.field protected final n:Landroid/view/LayoutInflater;

.field private final o:Landroid/graphics/Rect;

.field private p:F

.field private final q:Landroid/view/ViewOutlineProvider;

.field private r:Z

.field private final s:Landroid/graphics/Rect;

.field private t:Landroid/view/View;

.field private u:Z

.field private final v:F

.field private final w:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/h$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/widget/h$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/widget/h;->x:Landroid/view/ViewOutlineProvider;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/x0;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/widget/h;->o:Landroid/graphics/Rect;

    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/widget/h$b;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/h$b;-><init>(Lcom/android/launcher3/widget/h;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/widget/h;->q:Landroid/view/ViewOutlineProvider;

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/Rect;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/launcher3/widget/h;->s:Landroid/graphics/Rect;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Lcom/android/launcher3/widget/h;->u:Z

    .line 27
    .line 28
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/appwidget/AppWidgetHostView;->setExecutor(Ljava/util/concurrent/Executor;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Lcom/android/launcher3/widget/h;->n:Landroid/view/LayoutInflater;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {p1}, Lcom/android/launcher3/widget/I0;->b(Landroid/content/Context;)F

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput p1, p0, Lcom/android/launcher3/widget/h;->p:F

    .line 48
    .line 49
    iput p1, p0, Lcom/android/launcher3/widget/h;->v:F

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const v0, 0x7f070c9c

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    iput p1, p0, Lcom/android/launcher3/widget/h;->w:F

    .line 63
    .line 64
    return-void
.end method

.method static bridge synthetic n(Lcom/android/launcher3/widget/h;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/h;->t:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic o(Lcom/android/launcher3/widget/h;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/h;->s:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic p(Lcom/android/launcher3/widget/h;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/h;->p:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic q(Lcom/android/launcher3/widget/h;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/h;->o:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic r(Lcom/android/launcher3/widget/h;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/widget/h;->p:F

    .line 2
    .line 3
    return-void
.end method

.method private v()V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/widget/h;->x:Landroid/view/ViewOutlineProvider;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/appwidget/AppWidgetHostView;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/android/launcher3/widget/h;->r:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public d(Landroid/graphics/Rect;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getMeasuredWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    int-to-float v0, v0

    .line 12
    iget v1, p0, Lcom/android/launcher3/widget/x0;->h:F

    .line 13
    .line 14
    mul-float/2addr v0, v1

    .line 15
    float-to-int v0, v0

    .line 16
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getMeasuredHeight()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    int-to-float v1, v1

    .line 21
    iget v2, p0, Lcom/android/launcher3/widget/x0;->h:F

    .line 22
    .line 23
    mul-float/2addr v1, v2

    .line 24
    float-to-int v1, v1

    .line 25
    iget-object p0, p0, Lcom/android/launcher3/widget/x0;->k:Lcom/android/launcher3/views/k;

    .line 26
    .line 27
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance v2, Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 34
    .line 35
    .line 36
    iget v3, p0, Lcom/android/launcher3/X3;->m0:I

    .line 37
    .line 38
    iget v4, p0, Lcom/android/launcher3/X3;->n0:I

    .line 39
    .line 40
    iget p0, p0, Lcom/android/launcher3/X3;->o0:I

    .line 41
    .line 42
    invoke-virtual {v2, v3, v4, v3, p0}, Landroid/graphics/Rect;->set(IIII)V

    .line 43
    .line 44
    .line 45
    iget p0, v2, Landroid/graphics/Rect;->left:I

    .line 46
    .line 47
    iget v3, v2, Landroid/graphics/Rect;->top:I

    .line 48
    .line 49
    iget v4, v2, Landroid/graphics/Rect;->right:I

    .line 50
    .line 51
    sub-int/2addr v0, v4

    .line 52
    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 53
    .line 54
    sub-int/2addr v1, v2

    .line 55
    invoke-virtual {p1, p0, v3, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/x0;->d(Landroid/graphics/Rect;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public getDragViewRectangle()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/h;->s:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEnforcedCornerRadius()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/h;->p:F

    .line 2
    .line 3
    return p0
.end method

.method protected getErrorView()Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/h;->n:Landroid/view/LayoutInflater;

    .line 2
    .line 3
    const v1, 0x7f0e0071

    .line 4
    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getOutlineProvider()Landroid/view/ViewOutlineProvider;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/widget/h;->q:Landroid/view/ViewOutlineProvider;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-super {p0}, Landroid/appwidget/AppWidgetHostView;->getOutlineProvider()Landroid/view/ViewOutlineProvider;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    :try_start_0
    invoke-super/range {p0 .. p5}, Landroid/appwidget/AppWidgetHostView;->onLayout(ZIIII)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    goto :goto_0

    .line 5
    :catch_0
    new-instance p1, Lcom/android/launcher3/widget/g;

    .line 6
    .line 7
    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/g;-><init>(Lcom/android/launcher3/widget/h;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/appwidget/AppWidgetHostView;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->s()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method protected s()V
    .locals 6

    .line 1
    iget v0, p0, Lcom/android/launcher3/widget/h;->p:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpg-float v0, v0, v1

    .line 5
    .line 6
    if-gtz v0, :cond_0

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/widget/h;->v()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {p0}, Lcom/android/launcher3/widget/I0;->d(Landroid/view/View;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_9

    .line 17
    .line 18
    invoke-static {v0}, Lcom/android/launcher3/widget/I0;->h(Landroid/view/View;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    goto/16 :goto_5

    .line 31
    .line 32
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const/4 v2, 0x0

    .line 37
    if-eqz v1, :cond_3

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    const v3, 0x7f0b033f

    .line 44
    .line 45
    .line 46
    if-ne v1, v3, :cond_3

    .line 47
    .line 48
    move v1, v2

    .line 49
    :goto_0
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getChildCount()I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-ge v1, v4, :cond_3

    .line 54
    .line 55
    invoke-virtual {p0, v1}, Landroid/appwidget/AppWidgetHostView;->getChildAt(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    if-eqz v4, :cond_2

    .line 60
    .line 61
    invoke-virtual {p0, v1}, Landroid/appwidget/AppWidgetHostView;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-virtual {v4}, Landroid/view/View;->getId()I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-eq v4, v3, :cond_2

    .line 70
    .line 71
    invoke-virtual {p0, v1}, Landroid/appwidget/AppWidgetHostView;->getChildAt(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-static {v4}, Lcom/android/launcher3/widget/I0;->d(Landroid/view/View;)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    if-eqz v4, :cond_2

    .line 80
    .line 81
    move-object v0, v4

    .line 82
    goto :goto_1

    .line 83
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_3
    :goto_1
    iget-object v1, p0, Lcom/android/launcher3/widget/h;->o:Landroid/graphics/Rect;

    .line 87
    .line 88
    invoke-static {p0, v0, v1}, Lcom/android/launcher3/widget/I0;->c(Landroid/view/View;Landroid/view/View;Landroid/graphics/Rect;)V

    .line 89
    .line 90
    .line 91
    iget-object v1, p0, Lcom/android/launcher3/widget/h;->n:Landroid/view/LayoutInflater;

    .line 92
    .line 93
    invoke-virtual {v1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    const/4 v3, 0x1

    .line 102
    if-eqz v1, :cond_4

    .line 103
    .line 104
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    if-eqz v4, :cond_4

    .line 109
    .line 110
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {v1}, Lcom/android/launcher3/D3;->s0()Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    goto :goto_2

    .line 119
    :cond_4
    move v1, v3

    .line 120
    :goto_2
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    invoke-virtual {v4}, Lcom/android/launcher3/resource/B;->A()Z

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    if-eqz v4, :cond_7

    .line 129
    .line 130
    if-eqz v1, :cond_7

    .line 131
    .line 132
    iput-object v0, p0, Lcom/android/launcher3/widget/h;->t:Landroid/view/View;

    .line 133
    .line 134
    iget-object v1, p0, Lcom/android/launcher3/widget/h;->s:Landroid/graphics/Rect;

    .line 135
    .line 136
    iget-object v4, p0, Lcom/android/launcher3/widget/h;->o:Landroid/graphics/Rect;

    .line 137
    .line 138
    invoke-virtual {v1, v4}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 139
    .line 140
    .line 141
    iget-object v1, p0, Lcom/android/launcher3/widget/h;->o:Landroid/graphics/Rect;

    .line 142
    .line 143
    iget v1, v1, Landroid/graphics/Rect;->left:I

    .line 144
    .line 145
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getPaddingLeft()I

    .line 146
    .line 147
    .line 148
    move-result v4

    .line 149
    if-ge v1, v4, :cond_5

    .line 150
    .line 151
    iget-object v1, p0, Lcom/android/launcher3/widget/h;->o:Landroid/graphics/Rect;

    .line 152
    .line 153
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getPaddingLeft()I

    .line 154
    .line 155
    .line 156
    move-result v4

    .line 157
    iget-object v5, p0, Lcom/android/launcher3/widget/h;->o:Landroid/graphics/Rect;

    .line 158
    .line 159
    iget v5, v5, Landroid/graphics/Rect;->left:I

    .line 160
    .line 161
    sub-int/2addr v4, v5

    .line 162
    iput v4, v1, Landroid/graphics/Rect;->left:I

    .line 163
    .line 164
    goto :goto_3

    .line 165
    :cond_5
    iget-object v1, p0, Lcom/android/launcher3/widget/h;->o:Landroid/graphics/Rect;

    .line 166
    .line 167
    iput v2, v1, Landroid/graphics/Rect;->left:I

    .line 168
    .line 169
    :goto_3
    iget-object v1, p0, Lcom/android/launcher3/widget/h;->o:Landroid/graphics/Rect;

    .line 170
    .line 171
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 172
    .line 173
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getPaddingTop()I

    .line 174
    .line 175
    .line 176
    move-result v4

    .line 177
    if-ge v1, v4, :cond_6

    .line 178
    .line 179
    iget-object v1, p0, Lcom/android/launcher3/widget/h;->o:Landroid/graphics/Rect;

    .line 180
    .line 181
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getPaddingTop()I

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    iget-object v4, p0, Lcom/android/launcher3/widget/h;->o:Landroid/graphics/Rect;

    .line 186
    .line 187
    iget v4, v4, Landroid/graphics/Rect;->top:I

    .line 188
    .line 189
    sub-int/2addr v2, v4

    .line 190
    iput v2, v1, Landroid/graphics/Rect;->top:I

    .line 191
    .line 192
    goto :goto_4

    .line 193
    :cond_6
    iget-object v1, p0, Lcom/android/launcher3/widget/h;->o:Landroid/graphics/Rect;

    .line 194
    .line 195
    iput v2, v1, Landroid/graphics/Rect;->top:I

    .line 196
    .line 197
    :goto_4
    iget-object v1, p0, Lcom/android/launcher3/widget/h;->o:Landroid/graphics/Rect;

    .line 198
    .line 199
    iget v2, v1, Landroid/graphics/Rect;->right:I

    .line 200
    .line 201
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getPaddingRight()I

    .line 202
    .line 203
    .line 204
    move-result v4

    .line 205
    sub-int/2addr v2, v4

    .line 206
    iput v2, v1, Landroid/graphics/Rect;->right:I

    .line 207
    .line 208
    iget-object v1, p0, Lcom/android/launcher3/widget/h;->o:Landroid/graphics/Rect;

    .line 209
    .line 210
    iget v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 211
    .line 212
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getPaddingBottom()I

    .line 213
    .line 214
    .line 215
    move-result v4

    .line 216
    sub-int/2addr v2, v4

    .line 217
    iput v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 218
    .line 219
    iget-object p0, p0, Lcom/android/launcher3/widget/h;->q:Landroid/view/ViewOutlineProvider;

    .line 220
    .line 221
    invoke-virtual {v0, p0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v0, v3}, Landroid/view/View;->setClipToOutline(Z)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {v0}, Landroid/view/View;->invalidateOutline()V

    .line 228
    .line 229
    .line 230
    return-void

    .line 231
    :cond_7
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    if-eqz v1, :cond_8

    .line 236
    .line 237
    iput-object v0, p0, Lcom/android/launcher3/widget/h;->t:Landroid/view/View;

    .line 238
    .line 239
    iget-object v1, p0, Lcom/android/launcher3/widget/h;->s:Landroid/graphics/Rect;

    .line 240
    .line 241
    iget-object v4, p0, Lcom/android/launcher3/widget/h;->o:Landroid/graphics/Rect;

    .line 242
    .line 243
    invoke-virtual {v1, v4}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 244
    .line 245
    .line 246
    iget-object v1, p0, Lcom/android/launcher3/widget/h;->o:Landroid/graphics/Rect;

    .line 247
    .line 248
    iget v4, v1, Landroid/graphics/Rect;->right:I

    .line 249
    .line 250
    iget v5, v1, Landroid/graphics/Rect;->left:I

    .line 251
    .line 252
    sub-int/2addr v4, v5

    .line 253
    iput v4, v1, Landroid/graphics/Rect;->right:I

    .line 254
    .line 255
    iget v4, v1, Landroid/graphics/Rect;->bottom:I

    .line 256
    .line 257
    iget v5, v1, Landroid/graphics/Rect;->top:I

    .line 258
    .line 259
    sub-int/2addr v4, v5

    .line 260
    iput v4, v1, Landroid/graphics/Rect;->bottom:I

    .line 261
    .line 262
    iput v2, v1, Landroid/graphics/Rect;->left:I

    .line 263
    .line 264
    iput v2, v1, Landroid/graphics/Rect;->top:I

    .line 265
    .line 266
    iget-object p0, p0, Lcom/android/launcher3/widget/h;->q:Landroid/view/ViewOutlineProvider;

    .line 267
    .line 268
    invoke-virtual {v0, p0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v0, v3}, Landroid/view/View;->setClipToOutline(Z)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {v0}, Landroid/view/View;->invalidateOutline()V

    .line 275
    .line 276
    .line 277
    return-void

    .line 278
    :cond_8
    invoke-virtual {v0, v2}, Landroid/view/View;->setClipToOutline(Z)V

    .line 279
    .line 280
    .line 281
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 286
    .line 287
    .line 288
    move-result v0

    .line 289
    xor-int/2addr v0, v3

    .line 290
    invoke-virtual {p0, v0}, Landroid/appwidget/AppWidgetHostView;->setClipToOutline(Z)V

    .line 291
    .line 292
    .line 293
    iget-object v0, p0, Lcom/android/launcher3/widget/h;->q:Landroid/view/ViewOutlineProvider;

    .line 294
    .line 295
    invoke-virtual {p0, v0}, Landroid/appwidget/AppWidgetHostView;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 296
    .line 297
    .line 298
    iput-boolean v3, p0, Lcom/android/launcher3/widget/h;->r:Z

    .line 299
    .line 300
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->invalidateOutline()V

    .line 301
    .line 302
    .line 303
    return-void

    .line 304
    :cond_9
    :goto_5
    invoke-direct {p0}, Lcom/android/launcher3/widget/h;->v()V

    .line 305
    .line 306
    .line 307
    return-void
.end method

.method public setEnforcedCornerRadiusDefault(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    instance-of p1, p0, Lcom/android/launcher3/widget/suggest/m;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget p1, p0, Lcom/android/launcher3/widget/h;->v:F

    .line 8
    .line 9
    iput p1, p0, Lcom/android/launcher3/widget/h;->p:F

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget p1, p0, Lcom/android/launcher3/widget/h;->w:F

    .line 13
    .line 14
    iput p1, p0, Lcom/android/launcher3/widget/h;->p:F

    .line 15
    .line 16
    return-void
.end method

.method public setNeedShowWidgetTitle(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/widget/h;->u:Z

    .line 2
    .line 3
    return-void
.end method

.method public t()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/h;->r:Z

    .line 2
    .line 3
    return p0
.end method

.method public u()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/android/launcher3/widget/U;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/launcher3/widget/U;

    .line 14
    .line 15
    iget-boolean v0, v0, Lcom/android/launcher3/widget/U;->t:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-boolean p0, p0, Lcom/android/launcher3/widget/h;->u:Z

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public w()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    instance-of v0, v0, Lcom/android/launcher3/widget/U;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/android/launcher3/widget/U;

    .line 20
    .line 21
    iget-boolean p0, p0, Lcom/android/launcher3/widget/U;->u:Z

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public x()V
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/RemoteViews;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v1, v1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-direct {v0, v1, v2}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/appwidget/AppWidgetHostView;->updateAppWidget(Landroid/widget/RemoteViews;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
