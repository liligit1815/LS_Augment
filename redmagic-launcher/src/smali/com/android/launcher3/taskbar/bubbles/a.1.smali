.class public final Lcom/android/launcher3/taskbar/bubbles/a;
.super Landroid/graphics/drawable/Drawable;
.source "BubbleBarBackground.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/bubbles/a$a;
    }
.end annotation


# static fields
.field public static final v:Lcom/android/launcher3/taskbar/bubbles/a$a;


# instance fields
.field private a:F

.field private final b:Landroid/graphics/Paint;

.field private final c:Landroid/graphics/Paint;

.field private final d:F

.field private final e:F

.field private final f:F

.field private final g:F

.field private final h:I

.field private final i:I

.field private final j:I

.field private final k:I

.field private final l:F

.field private final m:F

.field private n:F

.field private o:Z

.field private p:F

.field private q:Z

.field private r:F

.field private s:Z

.field private t:F

.field private u:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/a$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/a$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/taskbar/bubbles/a;->v:Lcom/android/launcher3/taskbar/bubbles/a$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;F)V
    .locals 4

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 7
    .line 8
    .line 9
    iput p2, p0, Lcom/android/launcher3/taskbar/bubbles/a;->a:F

    .line 10
    .line 11
    new-instance p2, Landroid/graphics/Paint;

    .line 12
    .line 13
    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/a;->b:Landroid/graphics/Paint;

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/Paint;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->c:Landroid/graphics/Paint;

    .line 24
    .line 25
    const/high16 v1, 0x3f800000    # 1.0f

    .line 26
    .line 27
    iput v1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->n:F

    .line 28
    .line 29
    iput v1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->t:F

    .line 30
    .line 31
    iput v1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->u:F

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const v2, 0x7f0607e2

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v2}, Landroid/content/Context;->getColor(I)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 45
    .line 46
    .line 47
    const/4 v2, 0x1

    .line 48
    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->setFlags(I)V

    .line 49
    .line 50
    .line 51
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 52
    .line 53
    invoke-virtual {p2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 54
    .line 55
    .line 56
    const p2, 0x7f0607ef

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    iput p2, p0, Lcom/android/launcher3/taskbar/bubbles/a;->i:I

    .line 64
    .line 65
    const v3, 0x10600b4

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v3}, Landroid/content/Context;->getColor(I)I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    iput v3, p0, Lcom/android/launcher3/taskbar/bubbles/a;->j:I

    .line 73
    .line 74
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFlags(I)V

    .line 78
    .line 79
    .line 80
    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 81
    .line 82
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 83
    .line 84
    .line 85
    const p2, 0x7f070c25

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 93
    .line 94
    .line 95
    invoke-static {p1}, Lcom/android/launcher3/N5;->x(Landroid/content/Context;)Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-eqz p1, :cond_0

    .line 100
    .line 101
    const/16 p1, 0x33

    .line 102
    .line 103
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->h:I

    .line 104
    .line 105
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->k:I

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_0
    const/16 p1, 0x29

    .line 109
    .line 110
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->h:I

    .line 111
    .line 112
    const/16 p1, 0x19

    .line 113
    .line 114
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->k:I

    .line 115
    .line 116
    :goto_0
    iget p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->h:I

    .line 117
    .line 118
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 119
    .line 120
    .line 121
    const p1, 0x7f070c22

    .line 122
    .line 123
    .line 124
    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->l:F

    .line 129
    .line 130
    const p1, 0x7f070c1f

    .line 131
    .line 132
    .line 133
    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->m:F

    .line 138
    .line 139
    const p1, 0x7f070177

    .line 140
    .line 141
    .line 142
    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->d:F

    .line 147
    .line 148
    const p1, 0x7f070174

    .line 149
    .line 150
    .line 151
    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->e:F

    .line 156
    .line 157
    const p1, 0x7f070176

    .line 158
    .line 159
    .line 160
    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->g:F

    .line 165
    .line 166
    const p1, 0x7f070175

    .line 167
    .line 168
    .line 169
    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->f:F

    .line 174
    .line 175
    return-void
.end method

.method private final a(Landroid/graphics/Path;F)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->n:F

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    cmpg-float v0, v0, v1

    .line 9
    .line 10
    if-gtz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    new-instance v0, Landroid/graphics/Path;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/a;->c()F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iget v2, p0, Lcom/android/launcher3/taskbar/bubbles/a;->d:F

    .line 23
    .line 24
    iget v3, p0, Lcom/android/launcher3/taskbar/bubbles/a;->f:F

    .line 25
    .line 26
    invoke-static {v2, v1, v3, v0}, Lcom/android/launcher3/popup/A;->a(FFFLandroid/graphics/Path;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Landroid/graphics/Matrix;

    .line 30
    .line 31
    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    .line 32
    .line 33
    .line 34
    iget v3, p0, Lcom/android/launcher3/taskbar/bubbles/a;->d:F

    .line 35
    .line 36
    const/high16 v4, 0x3f000000    # 0.5f

    .line 37
    .line 38
    mul-float/2addr v3, v4

    .line 39
    mul-float/2addr v1, v4

    .line 40
    const/high16 v4, 0x43340000    # 180.0f

    .line 41
    .line 42
    invoke-virtual {v2, v4, v3, v1}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v2}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget v1, v1, Landroid/graphics/Rect;->left:I

    .line 53
    .line 54
    int-to-float v1, v1

    .line 55
    iget v2, p0, Lcom/android/launcher3/taskbar/bubbles/a;->p:F

    .line 56
    .line 57
    add-float/2addr v1, v2

    .line 58
    iget v2, p0, Lcom/android/launcher3/taskbar/bubbles/a;->d:F

    .line 59
    .line 60
    const/high16 v3, 0x40000000    # 2.0f

    .line 61
    .line 62
    div-float/2addr v2, v3

    .line 63
    sub-float/2addr v1, v2

    .line 64
    const/4 v2, 0x1

    .line 65
    int-to-float v2, v2

    .line 66
    iget v3, p0, Lcom/android/launcher3/taskbar/bubbles/a;->n:F

    .line 67
    .line 68
    sub-float/2addr v2, v3

    .line 69
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/a;->d()F

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    mul-float/2addr v2, p0

    .line 74
    sub-float/2addr v2, p2

    .line 75
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->offset(FF)V

    .line 76
    .line 77
    .line 78
    sget-object p0, Landroid/graphics/Path$Op;->UNION:Landroid/graphics/Path$Op;

    .line 79
    .line 80
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 81
    .line 82
    .line 83
    :cond_1
    :goto_0
    return-void
.end method

.method private final c()F
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->e:F

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->u:F

    .line 4
    .line 5
    mul-float/2addr v0, p0

    .line 6
    return v0
.end method

.method private final d()F
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/a;->c()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->e:F

    .line 6
    .line 7
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->g:F

    .line 8
    .line 9
    sub-float/2addr v1, p0

    .line 10
    sub-float/2addr v0, v1

    .line 11
    const/4 p0, 0x0

    .line 12
    invoke-static {p0, v0}, Ljava/lang/Math;->max(FF)F

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method


# virtual methods
.method public final b()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->p:F

    .line 2
    .line 3
    return p0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 13

    .line 1
    const-string v0, "canvas"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->b:Landroid/graphics/Paint;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget v5, p0, Lcom/android/launcher3/taskbar/bubbles/a;->k:I

    .line 16
    .line 17
    sget-object v6, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    const/16 v3, 0xff

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/N5;->O(IIIIILandroid/view/animation/Interpolator;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->b:Landroid/graphics/Paint;

    .line 28
    .line 29
    iget v2, p0, Lcom/android/launcher3/taskbar/bubbles/a;->l:F

    .line 30
    .line 31
    iget v3, p0, Lcom/android/launcher3/taskbar/bubbles/a;->m:F

    .line 32
    .line 33
    const/high16 v4, -0x1000000

    .line 34
    .line 35
    invoke-static {v4, v0}, Ls1/q;->h(II)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const/4 v4, 0x0

    .line 40
    invoke-virtual {v1, v2, v4, v3, v0}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 41
    .line 42
    .line 43
    new-instance v5, Landroid/graphics/Path;

    .line 44
    .line 45
    invoke-direct {v5}, Landroid/graphics/Path;-><init>()V

    .line 46
    .line 47
    .line 48
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->a:F

    .line 49
    .line 50
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->u:F

    .line 51
    .line 52
    mul-float/2addr v0, v1

    .line 53
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->r:F

    .line 54
    .line 55
    iget v2, p0, Lcom/android/launcher3/taskbar/bubbles/a;->t:F

    .line 56
    .line 57
    mul-float/2addr v1, v2

    .line 58
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    int-to-float v2, v2

    .line 67
    sub-float v2, v0, v2

    .line 68
    .line 69
    iget v3, p0, Lcom/android/launcher3/taskbar/bubbles/a;->a:F

    .line 70
    .line 71
    const/high16 v6, 0x40000000    # 2.0f

    .line 72
    .line 73
    div-float v10, v3, v6

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    iget v3, v3, Landroid/graphics/Rect;->left:I

    .line 80
    .line 81
    int-to-float v3, v3

    .line 82
    iget-boolean v6, p0, Lcom/android/launcher3/taskbar/bubbles/a;->s:Z

    .line 83
    .line 84
    if-eqz v6, :cond_0

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    int-to-float v4, v4

    .line 96
    sub-float/2addr v4, v1

    .line 97
    :goto_0
    add-float v6, v3, v4

    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    iget v3, v3, Landroid/graphics/Rect;->left:I

    .line 104
    .line 105
    int-to-float v3, v3

    .line 106
    iget-boolean v4, p0, Lcom/android/launcher3/taskbar/bubbles/a;->s:Z

    .line 107
    .line 108
    if-eqz v4, :cond_1

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    int-to-float v1, v1

    .line 120
    :goto_1
    add-float v8, v3, v1

    .line 121
    .line 122
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 127
    .line 128
    int-to-float v1, v1

    .line 129
    sub-float/2addr v1, v0

    .line 130
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/a;->d()F

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    add-float v7, v1, v0

    .line 135
    .line 136
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 141
    .line 142
    int-to-float v9, v0

    .line 143
    sget-object v12, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 144
    .line 145
    move v11, v10

    .line 146
    invoke-virtual/range {v5 .. v12}, Landroid/graphics/Path;->addRoundRect(FFFFFFLandroid/graphics/Path$Direction;)V

    .line 147
    .line 148
    .line 149
    invoke-direct {p0, v5, v2}, Lcom/android/launcher3/taskbar/bubbles/a;->a(Landroid/graphics/Path;F)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->b:Landroid/graphics/Paint;

    .line 153
    .line 154
    invoke-virtual {p1, v5, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 155
    .line 156
    .line 157
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->c:Landroid/graphics/Paint;

    .line 158
    .line 159
    invoke-virtual {p1, v5, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 163
    .line 164
    .line 165
    return-void
.end method

.method public final e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public final f(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->s:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->s:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final g(F)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, v0, p1

    .line 3
    .line 4
    const/high16 v2, 0x3f800000    # 1.0f

    .line 5
    .line 6
    if-gtz v1, :cond_0

    .line 7
    .line 8
    cmpg-float v1, p1, v2

    .line 9
    .line 10
    if-gtz v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-static {p1, v2}, Ljava/lang/Math;->min(FF)F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    :goto_0
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->n:F

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public getAlpha()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/Paint;->getAlpha()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getOpacity()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/Paint;->getAlpha()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    const/16 v0, 0xff

    .line 10
    .line 11
    if-eq p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, -0x3

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, -0x1

    .line 16
    return p0

    .line 17
    :cond_1
    const/4 p0, -0x2

    .line 18
    return p0
.end method

.method public final h(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->p:F

    .line 2
    .line 3
    return-void
.end method

.method public final i(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->a:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final j(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->t:F

    .line 2
    .line 3
    cmpg-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->t:F

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final k(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->u:F

    .line 2
    .line 3
    cmpg-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->u:F

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final l(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->r:F

    .line 2
    .line 3
    return-void
.end method

.method public final m(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->q:Z

    .line 2
    .line 3
    return-void
.end method

.method public final n(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->o:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->o:Z

    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->j:I

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->i:I

    .line 14
    .line 15
    :goto_0
    if-eqz p1, :cond_2

    .line 16
    .line 17
    const/16 p1, 0xff

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_2
    iget p1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->h:I

    .line 21
    .line 22
    :goto_1
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/a;->c:Landroid/graphics/Paint;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->c:Landroid/graphics/Paint;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public setAlpha(I)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->c:Landroid/graphics/Paint;

    .line 7
    .line 8
    iget v5, p0, Lcom/android/launcher3/taskbar/bubbles/a;->h:I

    .line 9
    .line 10
    sget-object v6, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    const/16 v3, 0xff

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    move v1, p1

    .line 17
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/N5;->O(IIIIILandroid/view/animation/Interpolator;)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/a;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    .line 6
    return-void
.end method
