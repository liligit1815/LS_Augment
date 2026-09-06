.class public Lcom/android/launcher3/views/ClipIconView;
.super Landroid/view/View;
.source "ClipIconView.java"

# interfaces
.implements Lcom/android/launcher3/views/u;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/views/ClipIconView$b;
    }
.end annotation


# static fields
.field private static final J:Landroid/graphics/Rect;


# instance fields
.field private A:F

.field private B:F

.field private C:Z

.field private final D:Landroid/graphics/Path;

.field private E:Landroid/graphics/RectF;

.field private F:F

.field private G:Landroid/graphics/Path;

.field private H:F

.field private I:Lcom/android/launcher3/views/FloatingIconView;

.field private final g:I

.field private final h:Z

.field private i:Landroid/graphics/drawable/Drawable;

.field private j:Landroid/graphics/drawable/Drawable;

.field private k:Z

.field private l:Landroid/animation/ValueAnimator;

.field private m:F

.field private final n:Landroid/graphics/Rect;

.field private final o:Landroid/graphics/Rect;

.field private p:Landroid/graphics/Path;

.field private q:F

.field private final r:Landroid/graphics/Rect;

.field private final s:Landroid/graphics/Rect;

.field private t:Lcom/android/launcher3/views/ClipIconView$b;

.field public u:Landroid/view/View;

.field private final v:Landroid/graphics/Rect;

.field private w:F

.field private x:F

.field private final y:Landroid/graphics/RectF;

.field private z:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/views/ClipIconView;->J:Landroid/graphics/Rect;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/views/ClipIconView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 3
    iput-boolean p1, p0, Lcom/android/launcher3/views/ClipIconView;->k:Z

    .line 4
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->n:Landroid/graphics/Rect;

    .line 5
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->o:Landroid/graphics/Rect;

    .line 6
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->r:Landroid/graphics/Rect;

    .line 7
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->s:Landroid/graphics/Rect;

    .line 8
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->v:Landroid/graphics/Rect;

    .line 9
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->y:Landroid/graphics/RectF;

    .line 10
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->D:Landroid/graphics/Path;

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070144

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/views/ClipIconView;->g:I

    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {p1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/launcher3/views/ClipIconView;->h:Z

    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/views/ClipIconView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/views/ClipIconView;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b(Lcom/android/launcher3/views/ClipIconView;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/ClipIconView;->r:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/views/ClipIconView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/views/ClipIconView;->q:F

    .line 2
    .line 3
    return p0
.end method

.method private synthetic f()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/views/ClipIconView;->l:Landroid/animation/ValueAnimator;

    .line 3
    .line 4
    return-void
.end method

.method private h(FZ)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/views/ClipIconView;->J:Landroid/graphics/Rect;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/views/ClipIconView;->s:Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/launcher3/N5;->Z(Landroid/graphics/Rect;F)V

    .line 9
    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object p2, p0, Lcom/android/launcher3/views/ClipIconView;->s:Landroid/graphics/Rect;

    .line 14
    .line 15
    iget p2, p2, Landroid/graphics/Rect;->left:I

    .line 16
    .line 17
    int-to-float p2, p2

    .line 18
    mul-float/2addr p2, p1

    .line 19
    float-to-int p1, p2

    .line 20
    iget p2, v0, Landroid/graphics/Rect;->top:I

    .line 21
    .line 22
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget p2, v0, Landroid/graphics/Rect;->left:I

    .line 27
    .line 28
    iget-object v1, p0, Lcom/android/launcher3/views/ClipIconView;->s:Landroid/graphics/Rect;

    .line 29
    .line 30
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 31
    .line 32
    int-to-float v1, v1

    .line 33
    mul-float/2addr v1, p1

    .line 34
    float-to-int p1, v1

    .line 35
    invoke-virtual {v0, p2, p1}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 36
    .line 37
    .line 38
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/views/ClipIconView;->j:Landroid/graphics/drawable/Drawable;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private j(Landroid/graphics/RectF;FFFZFFLcom/android/launcher3/h0;)V
    .locals 9

    .line 1
    move-object/from16 v0, p8

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    const/high16 v2, 0x41200000    # 10.0f

    .line 8
    .line 9
    move v7, v2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v7, v1

    .line 12
    :goto_0
    invoke-static {p3, p2}, Ljava/lang/Math;->max(FF)F

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    const/4 v6, 0x0

    .line 17
    sget-object v8, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 18
    .line 19
    const/high16 v5, 0x3f800000    # 1.0f

    .line 20
    .line 21
    move v4, p3

    .line 22
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-static {v2, v3, v1}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iget-boolean v2, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 32
    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    iget-object v2, p0, Lcom/android/launcher3/views/ClipIconView;->r:Landroid/graphics/Rect;

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    div-float/2addr p1, p6

    .line 42
    float-to-int p1, p1

    .line 43
    iput p1, v2, Landroid/graphics/Rect;->right:I

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    iget-object v2, p0, Lcom/android/launcher3/views/ClipIconView;->r:Landroid/graphics/Rect;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    div-float/2addr p1, p6

    .line 53
    float-to-int p1, p1

    .line 54
    iput p1, v2, Landroid/graphics/Rect;->bottom:I

    .line 55
    .line 56
    :goto_1
    div-float/2addr p4, p6

    .line 57
    iput p4, p0, Lcom/android/launcher3/views/ClipIconView;->q:F

    .line 58
    .line 59
    iget-boolean p1, p0, Lcom/android/launcher3/views/ClipIconView;->k:Z

    .line 60
    .line 61
    if-eqz p1, :cond_9

    .line 62
    .line 63
    sget-object p1, Ln1/C;->g:Lcom/android/launcher3/util/I;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object p4

    .line 69
    invoke-virtual {p1, p4}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    check-cast p1, Ln1/C;

    .line 74
    .line 75
    invoke-virtual {p1}, Ln1/C;->k()Ln1/C$c;

    .line 76
    .line 77
    .line 78
    move-result-object p4

    .line 79
    invoke-virtual {p4}, Ln1/C$c;->d()F

    .line 80
    .line 81
    .line 82
    move-result p4

    .line 83
    iput p4, p0, Lcom/android/launcher3/views/ClipIconView;->m:F

    .line 84
    .line 85
    if-eqz p5, :cond_2

    .line 86
    .line 87
    invoke-static {}, Lcom/android/launcher3/y0;->E()Z

    .line 88
    .line 89
    .line 90
    move-result p4

    .line 91
    if-eqz p4, :cond_5

    .line 92
    .line 93
    :cond_2
    cmpl-float p2, p2, p3

    .line 94
    .line 95
    if-ltz p2, :cond_5

    .line 96
    .line 97
    iget-object p2, p0, Lcom/android/launcher3/views/ClipIconView;->l:Landroid/animation/ValueAnimator;

    .line 98
    .line 99
    if-nez p2, :cond_4

    .line 100
    .line 101
    iget-object p2, p0, Lcom/android/launcher3/views/ClipIconView;->u:Landroid/view/View;

    .line 102
    .line 103
    instance-of p2, p2, Lcom/android/launcher3/folder/FolderIcon;

    .line 104
    .line 105
    if-eqz p2, :cond_3

    .line 106
    .line 107
    invoke-virtual {p1}, Ln1/C;->i()Ln1/t;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    :goto_2
    move-object v2, p1

    .line 112
    goto :goto_3

    .line 113
    :cond_3
    invoke-virtual {p1}, Ln1/C;->j()Ln1/t;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    goto :goto_2

    .line 118
    :goto_3
    iget-object v4, p0, Lcom/android/launcher3/views/ClipIconView;->n:Landroid/graphics/Rect;

    .line 119
    .line 120
    iget-object v5, p0, Lcom/android/launcher3/views/ClipIconView;->r:Landroid/graphics/Rect;

    .line 121
    .line 122
    iget v6, p0, Lcom/android/launcher3/views/ClipIconView;->q:F

    .line 123
    .line 124
    xor-int/lit8 v7, p5, 0x1

    .line 125
    .line 126
    move-object v3, p0

    .line 127
    invoke-interface/range {v2 .. v7}, Ln1/t;->a(Landroid/view/View;Landroid/graphics/Rect;Landroid/graphics/Rect;FZ)Landroid/animation/ValueAnimator;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    iput-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->l:Landroid/animation/ValueAnimator;

    .line 132
    .line 133
    new-instance p2, Lcom/android/launcher3/views/t;

    .line 134
    .line 135
    invoke-direct {p2, p0}, Lcom/android/launcher3/views/t;-><init>(Lcom/android/launcher3/views/ClipIconView;)V

    .line 136
    .line 137
    .line 138
    invoke-static {p2}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 143
    .line 144
    .line 145
    iget-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->l:Landroid/animation/ValueAnimator;

    .line 146
    .line 147
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 148
    .line 149
    .line 150
    iget-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->l:Landroid/animation/ValueAnimator;

    .line 151
    .line 152
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->pause()V

    .line 153
    .line 154
    .line 155
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->l:Landroid/animation/ValueAnimator;

    .line 156
    .line 157
    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->setCurrentFraction(F)V

    .line 158
    .line 159
    .line 160
    :cond_5
    iget-boolean p1, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 161
    .line 162
    if-eqz p1, :cond_6

    .line 163
    .line 164
    iget-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->r:Landroid/graphics/Rect;

    .line 165
    .line 166
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    goto :goto_4

    .line 171
    :cond_6
    iget-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->r:Landroid/graphics/Rect;

    .line 172
    .line 173
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    :goto_4
    int-to-float p1, p1

    .line 178
    div-float p1, p1, p7

    .line 179
    .line 180
    iget-boolean p2, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 181
    .line 182
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/views/ClipIconView;->h(FZ)V

    .line 183
    .line 184
    .line 185
    iget-object p2, p0, Lcom/android/launcher3/views/ClipIconView;->s:Landroid/graphics/Rect;

    .line 186
    .line 187
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 188
    .line 189
    .line 190
    move-result p2

    .line 191
    iget-object p3, p0, Lcom/android/launcher3/views/ClipIconView;->s:Landroid/graphics/Rect;

    .line 192
    .line 193
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    .line 194
    .line 195
    .line 196
    move-result p3

    .line 197
    iget-boolean p4, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 198
    .line 199
    const/high16 p5, 0x40000000    # 2.0f

    .line 200
    .line 201
    const/4 v0, 0x0

    .line 202
    if-eqz p4, :cond_7

    .line 203
    .line 204
    move p2, v0

    .line 205
    goto :goto_5

    .line 206
    :cond_7
    int-to-float p2, p2

    .line 207
    mul-float v1, p2, p1

    .line 208
    .line 209
    sub-float/2addr v1, p2

    .line 210
    div-float/2addr v1, p5

    .line 211
    float-to-int p2, v1

    .line 212
    :goto_5
    if-eqz p4, :cond_8

    .line 213
    .line 214
    int-to-float p3, p3

    .line 215
    mul-float/2addr p1, p3

    .line 216
    sub-float/2addr p1, p3

    .line 217
    div-float/2addr p1, p5

    .line 218
    float-to-int v0, p1

    .line 219
    :cond_8
    sget-object p1, Lcom/android/launcher3/views/ClipIconView;->J:Landroid/graphics/Rect;

    .line 220
    .line 221
    iget-object p3, p0, Lcom/android/launcher3/views/ClipIconView;->s:Landroid/graphics/Rect;

    .line 222
    .line 223
    invoke-virtual {p1, p3}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {p1, v0, p2}, Landroid/graphics/Rect;->offset(II)V

    .line 227
    .line 228
    .line 229
    iget-object p2, p0, Lcom/android/launcher3/views/ClipIconView;->i:Landroid/graphics/drawable/Drawable;

    .line 230
    .line 231
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 232
    .line 233
    .line 234
    :cond_9
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 235
    .line 236
    .line 237
    invoke-virtual {p0}, Landroid/view/View;->invalidateOutline()V

    .line 238
    .line 239
    .line 240
    return-void
.end method

.method private m(Landroid/graphics/RectF;FFLandroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/ClipIconView;->G:Landroid/graphics/Path;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/Path;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/views/ClipIconView;->G:Landroid/graphics/Path;

    .line 11
    .line 12
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->E:Landroid/graphics/RectF;

    .line 13
    .line 14
    iput p2, p0, Lcom/android/launcher3/views/ClipIconView;->F:F

    .line 15
    .line 16
    iput p3, p0, Lcom/android/launcher3/views/ClipIconView;->H:F

    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->I:Lcom/android/launcher3/views/FloatingIconView;

    .line 19
    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    instance-of p1, p4, Lcom/android/launcher3/views/FloatingIconView;

    .line 23
    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    check-cast p4, Lcom/android/launcher3/views/FloatingIconView;

    .line 27
    .line 28
    iput-object p4, p0, Lcom/android/launcher3/views/ClipIconView;->I:Lcom/android/launcher3/views/FloatingIconView;

    .line 29
    .line 30
    :cond_1
    return-void
.end method


# virtual methods
.method protected d()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/ClipIconView;->l:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->end()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 6
    .line 7
    .line 8
    move-result v7

    .line 9
    iget-object v2, v0, Lcom/android/launcher3/views/ClipIconView;->E:Landroid/graphics/RectF;

    .line 10
    .line 11
    const/high16 v3, 0x40000000    # 2.0f

    .line 12
    .line 13
    if-eqz v2, :cond_8

    .line 14
    .line 15
    iget-object v2, v0, Lcom/android/launcher3/views/ClipIconView;->G:Landroid/graphics/Path;

    .line 16
    .line 17
    if-eqz v2, :cond_8

    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 20
    .line 21
    .line 22
    iget v2, v0, Lcom/android/launcher3/views/ClipIconView;->H:F

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    cmpl-float v2, v2, v4

    .line 26
    .line 27
    if-lez v2, :cond_0

    .line 28
    .line 29
    iget-object v2, v0, Lcom/android/launcher3/views/ClipIconView;->E:Landroid/graphics/RectF;

    .line 30
    .line 31
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    iget v5, v0, Lcom/android/launcher3/views/ClipIconView;->H:F

    .line 36
    .line 37
    div-float/2addr v2, v5

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object v2, v0, Lcom/android/launcher3/views/ClipIconView;->E:Landroid/graphics/RectF;

    .line 40
    .line 41
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    :goto_0
    iget v5, v0, Lcom/android/launcher3/views/ClipIconView;->H:F

    .line 46
    .line 47
    cmpl-float v5, v5, v4

    .line 48
    .line 49
    if-lez v5, :cond_1

    .line 50
    .line 51
    iget-object v5, v0, Lcom/android/launcher3/views/ClipIconView;->E:Landroid/graphics/RectF;

    .line 52
    .line 53
    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    iget v6, v0, Lcom/android/launcher3/views/ClipIconView;->H:F

    .line 58
    .line 59
    div-float/2addr v5, v6

    .line 60
    goto :goto_1

    .line 61
    :cond_1
    iget-object v5, v0, Lcom/android/launcher3/views/ClipIconView;->E:Landroid/graphics/RectF;

    .line 62
    .line 63
    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    :goto_1
    iget v6, v0, Lcom/android/launcher3/views/ClipIconView;->H:F

    .line 68
    .line 69
    cmpl-float v8, v6, v4

    .line 70
    .line 71
    if-lez v8, :cond_2

    .line 72
    .line 73
    iget v8, v0, Lcom/android/launcher3/views/ClipIconView;->F:F

    .line 74
    .line 75
    div-float/2addr v8, v6

    .line 76
    :goto_2
    move v14, v8

    .line 77
    goto :goto_3

    .line 78
    :cond_2
    iget v8, v0, Lcom/android/launcher3/views/ClipIconView;->F:F

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :goto_3
    iget-object v9, v0, Lcom/android/launcher3/views/ClipIconView;->G:Landroid/graphics/Path;

    .line 82
    .line 83
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    .line 84
    .line 85
    .line 86
    move-result v6

    .line 87
    int-to-float v6, v6

    .line 88
    div-float/2addr v6, v3

    .line 89
    div-float v8, v2, v3

    .line 90
    .line 91
    sub-float v10, v6, v8

    .line 92
    .line 93
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    .line 94
    .line 95
    .line 96
    move-result v6

    .line 97
    int-to-float v6, v6

    .line 98
    div-float/2addr v6, v3

    .line 99
    div-float v11, v5, v3

    .line 100
    .line 101
    sub-float/2addr v6, v11

    .line 102
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    .line 103
    .line 104
    .line 105
    move-result v12

    .line 106
    int-to-float v12, v12

    .line 107
    div-float/2addr v12, v3

    .line 108
    add-float/2addr v12, v8

    .line 109
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    .line 110
    .line 111
    .line 112
    move-result v8

    .line 113
    int-to-float v8, v8

    .line 114
    div-float/2addr v8, v3

    .line 115
    add-float v13, v8, v11

    .line 116
    .line 117
    sget-object v16, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 118
    .line 119
    move v15, v14

    .line 120
    move v11, v6

    .line 121
    invoke-virtual/range {v9 .. v16}, Landroid/graphics/Path;->addRoundRect(FFFFFFLandroid/graphics/Path$Direction;)V

    .line 122
    .line 123
    .line 124
    iget-object v6, v0, Lcom/android/launcher3/views/ClipIconView;->G:Landroid/graphics/Path;

    .line 125
    .line 126
    invoke-virtual {v1, v6}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 127
    .line 128
    .line 129
    iget-object v6, v0, Lcom/android/launcher3/views/ClipIconView;->I:Lcom/android/launcher3/views/FloatingIconView;

    .line 130
    .line 131
    if-eqz v6, :cond_4

    .line 132
    .line 133
    iget-object v8, v6, Lcom/android/launcher3/views/FloatingIconView;->y:Landroid/graphics/drawable/Drawable;

    .line 134
    .line 135
    if-eqz v8, :cond_4

    .line 136
    .line 137
    instance-of v9, v8, Lcom/android/launcher3/dragndrop/E;

    .line 138
    .line 139
    if-eqz v9, :cond_3

    .line 140
    .line 141
    iget-object v8, v6, Lcom/android/launcher3/views/FloatingIconView;->z:Landroid/graphics/drawable/Drawable;

    .line 142
    .line 143
    if-eqz v8, :cond_4

    .line 144
    .line 145
    iget-object v6, v6, Lcom/android/launcher3/views/FloatingIconView;->A:Landroid/graphics/drawable/Drawable;

    .line 146
    .line 147
    if-eqz v6, :cond_4

    .line 148
    .line 149
    invoke-virtual {v8, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 150
    .line 151
    .line 152
    iget-object v6, v0, Lcom/android/launcher3/views/ClipIconView;->I:Lcom/android/launcher3/views/FloatingIconView;

    .line 153
    .line 154
    iget-object v6, v6, Lcom/android/launcher3/views/FloatingIconView;->A:Landroid/graphics/drawable/Drawable;

    .line 155
    .line 156
    invoke-virtual {v6, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 157
    .line 158
    .line 159
    goto :goto_4

    .line 160
    :cond_3
    invoke-virtual {v8, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 161
    .line 162
    .line 163
    :cond_4
    :goto_4
    iget-object v6, v0, Lcom/android/launcher3/views/ClipIconView;->j:Landroid/graphics/drawable/Drawable;

    .line 164
    .line 165
    if-eqz v6, :cond_5

    .line 166
    .line 167
    iget-object v8, v0, Lcom/android/launcher3/views/ClipIconView;->s:Landroid/graphics/Rect;

    .line 168
    .line 169
    invoke-virtual {v6, v8}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 170
    .line 171
    .line 172
    :cond_5
    iget-object v6, v0, Lcom/android/launcher3/views/ClipIconView;->i:Landroid/graphics/drawable/Drawable;

    .line 173
    .line 174
    if-eqz v6, :cond_8

    .line 175
    .line 176
    new-instance v6, Landroid/graphics/Rect;

    .line 177
    .line 178
    iget-object v8, v0, Lcom/android/launcher3/views/ClipIconView;->s:Landroid/graphics/Rect;

    .line 179
    .line 180
    invoke-direct {v6, v8}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    .line 184
    .line 185
    .line 186
    move-result v8

    .line 187
    int-to-float v8, v8

    .line 188
    iget v9, v0, Lcom/android/launcher3/views/ClipIconView;->z:F

    .line 189
    .line 190
    mul-float/2addr v9, v3

    .line 191
    sub-float/2addr v8, v9

    .line 192
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    .line 193
    .line 194
    .line 195
    move-result v9

    .line 196
    int-to-float v9, v9

    .line 197
    iget v10, v0, Lcom/android/launcher3/views/ClipIconView;->z:F

    .line 198
    .line 199
    mul-float/2addr v10, v3

    .line 200
    sub-float/2addr v9, v10

    .line 201
    cmpl-float v10, v8, v4

    .line 202
    .line 203
    if-lez v10, :cond_6

    .line 204
    .line 205
    cmpl-float v10, v8, v2

    .line 206
    .line 207
    if-ltz v10, :cond_6

    .line 208
    .line 209
    sub-float v4, v2, v8

    .line 210
    .line 211
    div-float/2addr v4, v3

    .line 212
    float-to-int v4, v4

    .line 213
    const/4 v5, 0x0

    .line 214
    invoke-virtual {v6, v5, v4}, Landroid/graphics/Rect;->offset(II)V

    .line 215
    .line 216
    .line 217
    div-float/2addr v2, v8

    .line 218
    invoke-static {v6, v2}, Lcom/android/launcher3/N5;->Z(Landroid/graphics/Rect;F)V

    .line 219
    .line 220
    .line 221
    goto :goto_5

    .line 222
    :cond_6
    cmpl-float v2, v9, v4

    .line 223
    .line 224
    if-lez v2, :cond_7

    .line 225
    .line 226
    cmpl-float v2, v9, v5

    .line 227
    .line 228
    if-ltz v2, :cond_7

    .line 229
    .line 230
    div-float/2addr v5, v9

    .line 231
    invoke-static {v6, v5}, Lcom/android/launcher3/N5;->Z(Landroid/graphics/Rect;F)V

    .line 232
    .line 233
    .line 234
    :cond_7
    :goto_5
    iget-object v2, v0, Lcom/android/launcher3/views/ClipIconView;->i:Landroid/graphics/drawable/Drawable;

    .line 235
    .line 236
    invoke-virtual {v2, v6}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 237
    .line 238
    .line 239
    :cond_8
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 240
    .line 241
    .line 242
    move-result v2

    .line 243
    iget-object v4, v0, Lcom/android/launcher3/views/ClipIconView;->s:Landroid/graphics/Rect;

    .line 244
    .line 245
    iget v5, v4, Landroid/graphics/Rect;->right:I

    .line 246
    .line 247
    iget v6, v4, Landroid/graphics/Rect;->left:I

    .line 248
    .line 249
    sub-int/2addr v5, v6

    .line 250
    int-to-float v5, v5

    .line 251
    div-float/2addr v5, v3

    .line 252
    iget v6, v0, Lcom/android/launcher3/views/ClipIconView;->m:F

    .line 253
    .line 254
    mul-float/2addr v5, v6

    .line 255
    iget v8, v4, Landroid/graphics/Rect;->bottom:I

    .line 256
    .line 257
    iget v4, v4, Landroid/graphics/Rect;->top:I

    .line 258
    .line 259
    sub-int/2addr v8, v4

    .line 260
    int-to-float v4, v8

    .line 261
    div-float/2addr v4, v3

    .line 262
    mul-float/2addr v4, v6

    .line 263
    invoke-virtual {v1, v6, v6, v5, v4}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 264
    .line 265
    .line 266
    iget-object v3, v0, Lcom/android/launcher3/views/ClipIconView;->j:Landroid/graphics/drawable/Drawable;

    .line 267
    .line 268
    if-eqz v3, :cond_9

    .line 269
    .line 270
    invoke-virtual {v3, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 271
    .line 272
    .line 273
    :cond_9
    iget-object v3, v0, Lcom/android/launcher3/views/ClipIconView;->i:Landroid/graphics/drawable/Drawable;

    .line 274
    .line 275
    if-eqz v3, :cond_a

    .line 276
    .line 277
    invoke-virtual {v3, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 278
    .line 279
    .line 280
    :cond_a
    invoke-virtual {v1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 281
    .line 282
    .line 283
    invoke-super/range {p0 .. p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 284
    .line 285
    .line 286
    iget-object v2, v0, Lcom/android/launcher3/views/ClipIconView;->t:Lcom/android/launcher3/views/ClipIconView$b;

    .line 287
    .line 288
    if-eqz v2, :cond_b

    .line 289
    .line 290
    iget v3, v2, Lcom/android/launcher3/views/ClipIconView$b;->h:I

    .line 291
    .line 292
    int-to-float v4, v3

    .line 293
    iget v3, v2, Lcom/android/launcher3/views/ClipIconView$b;->i:I

    .line 294
    .line 295
    int-to-float v5, v3

    .line 296
    iget v6, v2, Lcom/android/launcher3/views/ClipIconView$b;->f:I

    .line 297
    .line 298
    const/4 v2, 0x0

    .line 299
    const/4 v3, 0x0

    .line 300
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->saveLayerAlpha(FFFFI)I

    .line 301
    .line 302
    .line 303
    iget-object v2, v0, Lcom/android/launcher3/views/ClipIconView;->t:Lcom/android/launcher3/views/ClipIconView$b;

    .line 304
    .line 305
    iget v3, v2, Lcom/android/launcher3/views/ClipIconView$b;->g:F

    .line 306
    .line 307
    iget v4, v2, Lcom/android/launcher3/views/ClipIconView$b;->b:F

    .line 308
    .line 309
    mul-float/2addr v4, v3

    .line 310
    iget v2, v2, Lcom/android/launcher3/views/ClipIconView$b;->c:F

    .line 311
    .line 312
    mul-float/2addr v2, v3

    .line 313
    invoke-virtual {v1, v4, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 314
    .line 315
    .line 316
    invoke-virtual {v1, v3, v3}, Landroid/graphics/Canvas;->scale(FF)V

    .line 317
    .line 318
    .line 319
    iget-object v0, v0, Lcom/android/launcher3/views/ClipIconView;->t:Lcom/android/launcher3/views/ClipIconView$b;

    .line 320
    .line 321
    iget-object v0, v0, Lcom/android/launcher3/views/ClipIconView$b;->a:LI/a;

    .line 322
    .line 323
    invoke-interface {v0, v1}, LI/a;->accept(Ljava/lang/Object;)V

    .line 324
    .line 325
    .line 326
    :cond_b
    invoke-virtual {v1, v7}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 327
    .line 328
    .line 329
    return-void
.end method

.method public e(Landroid/view/ViewGroup$MarginLayoutParams;ZLcom/android/launcher3/h0;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p2, 0x0

    .line 2
    iput p2, p0, Lcom/android/launcher3/views/ClipIconView;->q:F

    .line 3
    .line 4
    iget-object p4, p0, Lcom/android/launcher3/views/ClipIconView;->v:Landroid/graphics/Rect;

    .line 5
    .line 6
    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 7
    .line 8
    iget p1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p4, v1, v1, v0, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 12
    .line 13
    .line 14
    sget-object p1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object p4

    .line 20
    invoke-virtual {p1, p4}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lcom/android/launcher3/anim/C;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/android/launcher3/anim/C;->c0()Z

    .line 27
    .line 28
    .line 29
    move-result p4

    .line 30
    iput-boolean p4, p0, Lcom/android/launcher3/views/ClipIconView;->C:Z

    .line 31
    .line 32
    iget-object p4, p0, Lcom/android/launcher3/views/ClipIconView;->u:Landroid/view/View;

    .line 33
    .line 34
    instance-of p4, p4, Lcom/android/launcher3/BubbleTextView;

    .line 35
    .line 36
    if-eqz p4, :cond_0

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/android/launcher3/anim/C;->T()I

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    int-to-float p2, p2

    .line 43
    :cond_0
    iput p2, p0, Lcom/android/launcher3/views/ClipIconView;->z:F

    .line 44
    .line 45
    iget-object p2, p0, Lcom/android/launcher3/views/ClipIconView;->u:Landroid/view/View;

    .line 46
    .line 47
    invoke-virtual {p1, p2}, Lcom/android/launcher3/anim/C;->M(Landroid/view/View;)F

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    iput p2, p0, Lcom/android/launcher3/views/ClipIconView;->w:F

    .line 52
    .line 53
    iget-object p2, p0, Lcom/android/launcher3/views/ClipIconView;->u:Landroid/view/View;

    .line 54
    .line 55
    instance-of p2, p2, Lcom/android/launcher3/BubbleTextView;

    .line 56
    .line 57
    if-eqz p2, :cond_1

    .line 58
    .line 59
    iget-object p2, p0, Lcom/android/launcher3/views/ClipIconView;->v:Landroid/graphics/Rect;

    .line 60
    .line 61
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    int-to-float p2, p2

    .line 66
    iget p3, p3, Lcom/android/launcher3/h0;->B1:I

    .line 67
    .line 68
    int-to-float p3, p3

    .line 69
    div-float/2addr p2, p3

    .line 70
    iget p3, p0, Lcom/android/launcher3/views/ClipIconView;->z:F

    .line 71
    .line 72
    mul-float/2addr p3, p2

    .line 73
    iput p3, p0, Lcom/android/launcher3/views/ClipIconView;->z:F

    .line 74
    .line 75
    new-instance p2, Landroid/graphics/RectF;

    .line 76
    .line 77
    iget-object p3, p0, Lcom/android/launcher3/views/ClipIconView;->v:Landroid/graphics/Rect;

    .line 78
    .line 79
    invoke-direct {p2, p3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 80
    .line 81
    .line 82
    iget p3, p0, Lcom/android/launcher3/views/ClipIconView;->z:F

    .line 83
    .line 84
    invoke-virtual {p2, p3, p3}, Landroid/graphics/RectF;->inset(FF)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    iget-object p3, p0, Lcom/android/launcher3/views/ClipIconView;->u:Landroid/view/View;

    .line 92
    .line 93
    invoke-virtual {p1, p3, v1}, Lcom/android/launcher3/anim/C;->P(Landroid/view/View;Z)F

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    mul-float/2addr p2, p1

    .line 98
    iput p2, p0, Lcom/android/launcher3/views/ClipIconView;->w:F

    .line 99
    .line 100
    :cond_1
    iget p1, p0, Lcom/android/launcher3/views/ClipIconView;->w:F

    .line 101
    .line 102
    iput p1, p0, Lcom/android/launcher3/views/ClipIconView;->x:F

    .line 103
    .line 104
    return-void
.end method

.method g()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 3
    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-boolean v1, p0, Lcom/android/launcher3/views/ClipIconView;->k:Z

    .line 7
    .line 8
    iput-object v0, p0, Lcom/android/launcher3/views/ClipIconView;->i:Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/views/ClipIconView;->j:Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/launcher3/views/ClipIconView;->p:Landroid/graphics/Path;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/android/launcher3/views/ClipIconView;->s:Landroid/graphics/Rect;

    .line 15
    .line 16
    invoke-virtual {v2}, Landroid/graphics/Rect;->setEmpty()V

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Lcom/android/launcher3/views/ClipIconView;->l:Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->cancel()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iput-object v0, p0, Lcom/android/launcher3/views/ClipIconView;->l:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    iput v2, p0, Lcom/android/launcher3/views/ClipIconView;->q:F

    .line 30
    .line 31
    iget-object v3, p0, Lcom/android/launcher3/views/ClipIconView;->r:Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-virtual {v3}, Landroid/graphics/Rect;->setEmpty()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/android/launcher3/views/ClipIconView;->t:Lcom/android/launcher3/views/ClipIconView$b;

    .line 37
    .line 38
    iput-object v0, p0, Lcom/android/launcher3/views/ClipIconView;->u:Landroid/view/View;

    .line 39
    .line 40
    iget-object v3, p0, Lcom/android/launcher3/views/ClipIconView;->y:Landroid/graphics/RectF;

    .line 41
    .line 42
    invoke-virtual {v3}, Landroid/graphics/RectF;->setEmpty()V

    .line 43
    .line 44
    .line 45
    iput v2, p0, Lcom/android/launcher3/views/ClipIconView;->w:F

    .line 46
    .line 47
    iput v2, p0, Lcom/android/launcher3/views/ClipIconView;->x:F

    .line 48
    .line 49
    iput v2, p0, Lcom/android/launcher3/views/ClipIconView;->A:F

    .line 50
    .line 51
    iput v2, p0, Lcom/android/launcher3/views/ClipIconView;->B:F

    .line 52
    .line 53
    iget-object v3, p0, Lcom/android/launcher3/views/ClipIconView;->D:Landroid/graphics/Path;

    .line 54
    .line 55
    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    .line 56
    .line 57
    .line 58
    iput-boolean v1, p0, Lcom/android/launcher3/views/ClipIconView;->C:Z

    .line 59
    .line 60
    iput-object v0, p0, Lcom/android/launcher3/views/ClipIconView;->E:Landroid/graphics/RectF;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/android/launcher3/views/ClipIconView;->G:Landroid/graphics/Path;

    .line 63
    .line 64
    iput v2, p0, Lcom/android/launcher3/views/ClipIconView;->F:F

    .line 65
    .line 66
    const/high16 v0, 0x3f800000    # 1.0f

    .line 67
    .line 68
    iput v0, p0, Lcom/android/launcher3/views/ClipIconView;->H:F

    .line 69
    .line 70
    return-void
.end method

.method public i(Landroid/graphics/drawable/Drawable;ILandroid/view/ViewGroup$MarginLayoutParams;ZLcom/android/launcher3/h0;Landroid/view/View;)V
    .locals 4

    .line 1
    instance-of p6, p1, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 2
    .line 3
    iput-boolean p6, p0, Lcom/android/launcher3/views/ClipIconView;->k:Z

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p6, :cond_6

    .line 7
    .line 8
    instance-of p6, p1, Lcom/android/launcher3/dragndrop/E;

    .line 9
    .line 10
    check-cast p1, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .line 19
    .line 20
    invoke-direct {v1, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iput-object v1, p0, Lcom/android/launcher3/views/ClipIconView;->j:Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getForeground()Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    new-instance p1, Landroid/graphics/drawable/ColorDrawable;

    .line 32
    .line 33
    invoke-direct {p1, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 34
    .line 35
    .line 36
    :cond_1
    iput-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->i:Landroid/graphics/drawable/Drawable;

    .line 37
    .line 38
    iget p1, p3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 39
    .line 40
    iget v1, p3, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 41
    .line 42
    iget v2, p0, Lcom/android/launcher3/views/ClipIconView;->g:I

    .line 43
    .line 44
    div-int/lit8 v2, v2, 0x2

    .line 45
    .line 46
    iget-object v3, p0, Lcom/android/launcher3/views/ClipIconView;->s:Landroid/graphics/Rect;

    .line 47
    .line 48
    invoke-virtual {v3, v0, v0, v1, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 49
    .line 50
    .line 51
    if-nez p6, :cond_2

    .line 52
    .line 53
    iget-object v3, p0, Lcom/android/launcher3/views/ClipIconView;->s:Landroid/graphics/Rect;

    .line 54
    .line 55
    sub-int/2addr p2, v2

    .line 56
    invoke-virtual {v3, p2, p2}, Landroid/graphics/Rect;->inset(II)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-static {p2}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v2}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    iget v2, v2, Lcom/android/launcher3/r4;->N:I

    .line 76
    .line 77
    int-to-float v2, v2

    .line 78
    const/high16 v3, 0x3f000000    # 0.5f

    .line 79
    .line 80
    mul-float/2addr v2, v3

    .line 81
    invoke-static {v2}, Lcom/android/launcher3/N5;->i(F)I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    mul-int/2addr v2, v1

    .line 86
    invoke-virtual {p2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    iget p2, p2, Lcom/android/launcher3/h0;->B1:I

    .line 91
    .line 92
    div-int/2addr v2, p2

    .line 93
    iget-object p2, p0, Lcom/android/launcher3/views/ClipIconView;->s:Landroid/graphics/Rect;

    .line 94
    .line 95
    invoke-virtual {p2, v2, v2}, Landroid/graphics/Rect;->inset(II)V

    .line 96
    .line 97
    .line 98
    :cond_2
    iget-object p2, p0, Lcom/android/launcher3/views/ClipIconView;->i:Landroid/graphics/drawable/Drawable;

    .line 99
    .line 100
    iget-object v2, p0, Lcom/android/launcher3/views/ClipIconView;->s:Landroid/graphics/Rect;

    .line 101
    .line 102
    invoke-virtual {p2, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 103
    .line 104
    .line 105
    iget-object p2, p0, Lcom/android/launcher3/views/ClipIconView;->j:Landroid/graphics/drawable/Drawable;

    .line 106
    .line 107
    iget-object v2, p0, Lcom/android/launcher3/views/ClipIconView;->s:Landroid/graphics/Rect;

    .line 108
    .line 109
    invoke-virtual {p2, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 110
    .line 111
    .line 112
    iget-object p2, p0, Lcom/android/launcher3/views/ClipIconView;->n:Landroid/graphics/Rect;

    .line 113
    .line 114
    invoke-virtual {p2, v0, v0, v1, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 115
    .line 116
    .line 117
    if-nez p6, :cond_3

    .line 118
    .line 119
    iget-object p2, p0, Lcom/android/launcher3/views/ClipIconView;->n:Landroid/graphics/Rect;

    .line 120
    .line 121
    const p6, 0x3f6b851f    # 0.92f

    .line 122
    .line 123
    .line 124
    invoke-static {p2, p6}, Lcom/android/launcher3/N5;->Z(Landroid/graphics/Rect;F)V

    .line 125
    .line 126
    .line 127
    :cond_3
    iget-boolean p2, p0, Lcom/android/launcher3/views/ClipIconView;->h:Z

    .line 128
    .line 129
    if-eqz p2, :cond_4

    .line 130
    .line 131
    iget p2, p5, Lcom/android/launcher3/h0;->T0:I

    .line 132
    .line 133
    invoke-virtual {p3}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    .line 134
    .line 135
    .line 136
    move-result p6

    .line 137
    sub-int/2addr p2, p6

    .line 138
    iget p6, p3, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 139
    .line 140
    sub-int/2addr p2, p6

    .line 141
    goto :goto_0

    .line 142
    :cond_4
    iget p2, p3, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 143
    .line 144
    :goto_0
    iget p6, p3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 145
    .line 146
    iget v2, p3, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 147
    .line 148
    add-int/2addr v2, p2

    .line 149
    iget v3, p3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 150
    .line 151
    add-int/2addr v3, p6

    .line 152
    invoke-virtual {p0, p2, p6, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 153
    .line 154
    .line 155
    iget p2, p3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 156
    .line 157
    int-to-float p2, p2

    .line 158
    int-to-float p6, p1

    .line 159
    div-float/2addr p2, p6

    .line 160
    iget p6, p3, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 161
    .line 162
    int-to-float p6, p6

    .line 163
    int-to-float v2, v1

    .line 164
    div-float/2addr p6, v2

    .line 165
    invoke-static {p2, p6}, Ljava/lang/Math;->max(FF)F

    .line 166
    .line 167
    .line 168
    move-result p2

    .line 169
    if-eqz p4, :cond_5

    .line 170
    .line 171
    iget-object p2, p0, Lcom/android/launcher3/views/ClipIconView;->r:Landroid/graphics/Rect;

    .line 172
    .line 173
    invoke-virtual {p2, v0, v0, v1, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 174
    .line 175
    .line 176
    const/high16 p2, 0x3f800000    # 1.0f

    .line 177
    .line 178
    goto :goto_1

    .line 179
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->r:Landroid/graphics/Rect;

    .line 180
    .line 181
    iget p4, p3, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 182
    .line 183
    iget p6, p3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 184
    .line 185
    invoke-virtual {p1, v0, v0, p4, p6}, Landroid/graphics/Rect;->set(IIII)V

    .line 186
    .line 187
    .line 188
    :goto_1
    iget-boolean p1, p5, Lcom/android/launcher3/h0;->N0:Z

    .line 189
    .line 190
    invoke-direct {p0, p2, p1}, Lcom/android/launcher3/views/ClipIconView;->h(FZ)V

    .line 191
    .line 192
    .line 193
    iget-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->o:Landroid/graphics/Rect;

    .line 194
    .line 195
    iget p2, p3, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 196
    .line 197
    iget p3, p3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 198
    .line 199
    invoke-virtual {p1, v0, v0, p2, p3}, Landroid/graphics/Rect;->set(IIII)V

    .line 200
    .line 201
    .line 202
    new-instance p1, Lcom/android/launcher3/views/ClipIconView$a;

    .line 203
    .line 204
    invoke-direct {p1, p0}, Lcom/android/launcher3/views/ClipIconView$a;-><init>(Lcom/android/launcher3/views/ClipIconView;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {p0, p1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 208
    .line 209
    .line 210
    const/4 p1, 0x1

    .line 211
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/ClipIconView;->setClipToOutline(Z)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {p0, v0}, Lcom/android/launcher3/views/ClipIconView;->setClipToOutline(Z)V

    .line 215
    .line 216
    .line 217
    goto :goto_2

    .line 218
    :cond_6
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {p0, v0}, Lcom/android/launcher3/views/ClipIconView;->setClipToOutline(Z)V

    .line 222
    .line 223
    .line 224
    :goto_2
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 225
    .line 226
    .line 227
    invoke-virtual {p0}, Landroid/view/View;->invalidateOutline()V

    .line 228
    .line 229
    .line 230
    return-void
.end method

.method public k(Landroid/graphics/RectF;FFFZLandroid/view/View;Lcom/android/launcher3/h0;)V
    .locals 9

    .line 1
    const/16 v8, 0xff

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move v2, p2

    .line 6
    move v3, p3

    .line 7
    move v4, p4

    .line 8
    move v5, p5

    .line 9
    move-object v6, p6

    .line 10
    move-object/from16 v7, p7

    .line 11
    .line 12
    invoke-virtual/range {v0 .. v8}, Lcom/android/launcher3/views/ClipIconView;->l(Landroid/graphics/RectF;FFFZLandroid/view/View;Lcom/android/launcher3/h0;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public l(Landroid/graphics/RectF;FFFZLandroid/view/View;Lcom/android/launcher3/h0;I)V
    .locals 13

    .line 1
    move-object/from16 v9, p6

    .line 2
    .line 3
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    iget-boolean v2, p0, Lcom/android/launcher3/views/ClipIconView;->h:Z

    .line 10
    .line 11
    const/high16 v10, 0x40000000    # 2.0f

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    move-object/from16 v8, p7

    .line 20
    .line 21
    iget v3, v8, Lcom/android/launcher3/h0;->T0:I

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    sub-int/2addr v3, v4

    .line 28
    int-to-float v3, v3

    .line 29
    iget v4, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 30
    .line 31
    int-to-float v4, v4

    .line 32
    div-float/2addr v4, v10

    .line 33
    sub-float/2addr v3, v4

    .line 34
    :goto_0
    sub-float/2addr v2, v3

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    move-object/from16 v8, p7

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {v1}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    int-to-float v3, v3

    .line 47
    sub-float/2addr v2, v3

    .line 48
    iget v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 49
    .line 50
    int-to-float v3, v3

    .line 51
    div-float/2addr v3, v10

    .line 52
    goto :goto_0

    .line 53
    :goto_1
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    iget v4, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 58
    .line 59
    int-to-float v4, v4

    .line 60
    sub-float/2addr v3, v4

    .line 61
    iget v4, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 62
    .line 63
    int-to-float v4, v4

    .line 64
    div-float/2addr v4, v10

    .line 65
    sub-float/2addr v3, v4

    .line 66
    invoke-virtual {v9, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v9, v3}, Landroid/view/View;->setTranslationY(F)V

    .line 70
    .line 71
    .line 72
    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 73
    .line 74
    if-eqz v2, :cond_c

    .line 75
    .line 76
    iget v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 77
    .line 78
    if-nez v3, :cond_1

    .line 79
    .line 80
    goto/16 :goto_a

    .line 81
    .line 82
    :cond_1
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    int-to-float v7, v2

    .line 87
    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 88
    .line 89
    if-eqz v2, :cond_2

    .line 90
    .line 91
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    iget v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 96
    .line 97
    int-to-float v3, v3

    .line 98
    iget v4, p0, Lcom/android/launcher3/views/ClipIconView;->z:F

    .line 99
    .line 100
    mul-float/2addr v4, v10

    .line 101
    sub-float/2addr v3, v4

    .line 102
    div-float/2addr v2, v3

    .line 103
    :goto_2
    move v11, v2

    .line 104
    goto :goto_3

    .line 105
    :cond_2
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    div-float/2addr v2, v7

    .line 110
    goto :goto_2

    .line 111
    :goto_3
    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 112
    .line 113
    if-eqz v2, :cond_3

    .line 114
    .line 115
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    iget v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 120
    .line 121
    int-to-float v3, v3

    .line 122
    iget v4, p0, Lcom/android/launcher3/views/ClipIconView;->z:F

    .line 123
    .line 124
    mul-float/2addr v4, v10

    .line 125
    sub-float/2addr v3, v4

    .line 126
    div-float/2addr v2, v3

    .line 127
    :goto_4
    move v12, v2

    .line 128
    goto :goto_5

    .line 129
    :cond_3
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    div-float/2addr v2, v7

    .line 134
    goto :goto_4

    .line 135
    :goto_5
    invoke-static {v11, v12}, Ljava/lang/Math;->max(FF)F

    .line 136
    .line 137
    .line 138
    move-result v6

    .line 139
    iget-object v2, p0, Lcom/android/launcher3/views/ClipIconView;->t:Lcom/android/launcher3/views/ClipIconView$b;

    .line 140
    .line 141
    if-eqz v2, :cond_5

    .line 142
    .line 143
    iget v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 144
    .line 145
    iput v3, v2, Lcom/android/launcher3/views/ClipIconView$b;->h:I

    .line 146
    .line 147
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 148
    .line 149
    iput v1, v2, Lcom/android/launcher3/views/ClipIconView$b;->i:I

    .line 150
    .line 151
    move/from16 v4, p8

    .line 152
    .line 153
    iput v4, v2, Lcom/android/launcher3/views/ClipIconView$b;->f:I

    .line 154
    .line 155
    iget-boolean v4, v2, Lcom/android/launcher3/views/ClipIconView$b;->e:Z

    .line 156
    .line 157
    if-eqz v4, :cond_4

    .line 158
    .line 159
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    goto :goto_6

    .line 164
    :cond_4
    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    :goto_6
    int-to-float v1, v1

    .line 169
    iget-object v3, p0, Lcom/android/launcher3/views/ClipIconView;->t:Lcom/android/launcher3/views/ClipIconView$b;

    .line 170
    .line 171
    iget v3, v3, Lcom/android/launcher3/views/ClipIconView$b;->d:F

    .line 172
    .line 173
    div-float/2addr v1, v3

    .line 174
    iput v1, v2, Lcom/android/launcher3/views/ClipIconView$b;->g:F

    .line 175
    .line 176
    :cond_5
    invoke-static {v6}, Ljava/lang/Float;->isNaN(F)Z

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    if-nez v1, :cond_b

    .line 181
    .line 182
    invoke-static {v6}, Ljava/lang/Float;->isInfinite(F)Z

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    if-eqz v1, :cond_6

    .line 187
    .line 188
    goto/16 :goto_9

    .line 189
    .line 190
    :cond_6
    move-object v0, p0

    .line 191
    move-object v1, p1

    .line 192
    move v2, p2

    .line 193
    move/from16 v3, p3

    .line 194
    .line 195
    move/from16 v4, p4

    .line 196
    .line 197
    move/from16 v5, p5

    .line 198
    .line 199
    invoke-direct/range {v0 .. v8}, Lcom/android/launcher3/views/ClipIconView;->j(Landroid/graphics/RectF;FFFZFFLcom/android/launcher3/h0;)V

    .line 200
    .line 201
    .line 202
    move v7, v6

    .line 203
    iget-object v1, p0, Lcom/android/launcher3/views/ClipIconView;->y:Landroid/graphics/RectF;

    .line 204
    .line 205
    iget-object v2, p0, Lcom/android/launcher3/views/ClipIconView;->v:Landroid/graphics/Rect;

    .line 206
    .line 207
    invoke-virtual {v1, v2}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 208
    .line 209
    .line 210
    iget-object v1, p0, Lcom/android/launcher3/views/ClipIconView;->y:Landroid/graphics/RectF;

    .line 211
    .line 212
    iget v2, p0, Lcom/android/launcher3/views/ClipIconView;->z:F

    .line 213
    .line 214
    invoke-virtual {v1, v2, v2}, Landroid/graphics/RectF;->inset(FF)V

    .line 215
    .line 216
    .line 217
    iget-object v1, p0, Lcom/android/launcher3/views/ClipIconView;->y:Landroid/graphics/RectF;

    .line 218
    .line 219
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    iget-object v2, p0, Lcom/android/launcher3/views/ClipIconView;->y:Landroid/graphics/RectF;

    .line 224
    .line 225
    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    .line 226
    .line 227
    .line 228
    move-result v2

    .line 229
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 230
    .line 231
    .line 232
    move-result v3

    .line 233
    mul-float/2addr v2, v3

    .line 234
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    div-float/2addr v2, v3

    .line 239
    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    .line 240
    .line 241
    .line 242
    move-result v1

    .line 243
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    mul-float/2addr v2, v1

    .line 248
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 249
    .line 250
    .line 251
    move-result v3

    .line 252
    div-float/2addr v2, v3

    .line 253
    iget-boolean v3, p0, Lcom/android/launcher3/views/ClipIconView;->C:Z

    .line 254
    .line 255
    if-eqz v3, :cond_8

    .line 256
    .line 257
    sget v3, Lcom/android/launcher3/anim/C;->X:F

    .line 258
    .line 259
    cmpg-float v4, p2, v3

    .line 260
    .line 261
    if-gez v4, :cond_7

    .line 262
    .line 263
    iput v1, p0, Lcom/android/launcher3/views/ClipIconView;->A:F

    .line 264
    .line 265
    iput v2, p0, Lcom/android/launcher3/views/ClipIconView;->B:F

    .line 266
    .line 267
    goto :goto_7

    .line 268
    :cond_7
    iget v4, p0, Lcom/android/launcher3/views/ClipIconView;->A:F

    .line 269
    .line 270
    iget-object v1, p0, Lcom/android/launcher3/views/ClipIconView;->v:Landroid/graphics/Rect;

    .line 271
    .line 272
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    int-to-float v5, v1

    .line 277
    sget-object v6, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 278
    .line 279
    move v2, v3

    .line 280
    const/high16 v3, 0x3f800000    # 1.0f

    .line 281
    .line 282
    move v1, p2

    .line 283
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 284
    .line 285
    .line 286
    move-result v8

    .line 287
    iget v4, p0, Lcom/android/launcher3/views/ClipIconView;->B:F

    .line 288
    .line 289
    iget-object v1, p0, Lcom/android/launcher3/views/ClipIconView;->v:Landroid/graphics/Rect;

    .line 290
    .line 291
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 292
    .line 293
    .line 294
    move-result v1

    .line 295
    int-to-float v5, v1

    .line 296
    move v1, p2

    .line 297
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 298
    .line 299
    .line 300
    move-result v2

    .line 301
    move v1, v8

    .line 302
    :cond_8
    :goto_7
    iget-object v3, p0, Lcom/android/launcher3/views/ClipIconView;->y:Landroid/graphics/RectF;

    .line 303
    .line 304
    iget v4, v3, Landroid/graphics/RectF;->top:F

    .line 305
    .line 306
    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    .line 307
    .line 308
    .line 309
    move-result v3

    .line 310
    sub-float/2addr v3, v2

    .line 311
    div-float/2addr v3, v10

    .line 312
    add-float/2addr v4, v3

    .line 313
    iget-object v3, p0, Lcom/android/launcher3/views/ClipIconView;->y:Landroid/graphics/RectF;

    .line 314
    .line 315
    iget v5, v3, Landroid/graphics/RectF;->left:F

    .line 316
    .line 317
    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    .line 318
    .line 319
    .line 320
    move-result v3

    .line 321
    sub-float/2addr v3, v1

    .line 322
    div-float/2addr v3, v10

    .line 323
    add-float/2addr v5, v3

    .line 324
    add-float v3, v5, v1

    .line 325
    .line 326
    add-float v6, v4, v2

    .line 327
    .line 328
    iget-object v8, p0, Lcom/android/launcher3/views/ClipIconView;->y:Landroid/graphics/RectF;

    .line 329
    .line 330
    invoke-virtual {v8, v5, v4, v3, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 331
    .line 332
    .line 333
    sget-object v3, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 334
    .line 335
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 336
    .line 337
    .line 338
    move-result-object v4

    .line 339
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 340
    .line 341
    .line 342
    move-result-object v3

    .line 343
    check-cast v3, Lcom/android/launcher3/anim/C;

    .line 344
    .line 345
    iget-object v4, p0, Lcom/android/launcher3/views/ClipIconView;->u:Landroid/view/View;

    .line 346
    .line 347
    move/from16 v5, p5

    .line 348
    .line 349
    invoke-virtual {v3, v4, v5}, Lcom/android/launcher3/anim/C;->P(Landroid/view/View;Z)F

    .line 350
    .line 351
    .line 352
    move-result v3

    .line 353
    cmpl-float v4, v12, v11

    .line 354
    .line 355
    if-lez v4, :cond_9

    .line 356
    .line 357
    goto :goto_8

    .line 358
    :cond_9
    move v1, v2

    .line 359
    :goto_8
    mul-float/2addr v1, v3

    .line 360
    iput v1, p0, Lcom/android/launcher3/views/ClipIconView;->x:F

    .line 361
    .line 362
    iget-object v1, p0, Lcom/android/launcher3/views/ClipIconView;->D:Landroid/graphics/Path;

    .line 363
    .line 364
    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 365
    .line 366
    .line 367
    iget-object v1, p0, Lcom/android/launcher3/views/ClipIconView;->D:Landroid/graphics/Path;

    .line 368
    .line 369
    iget-object v2, p0, Lcom/android/launcher3/views/ClipIconView;->y:Landroid/graphics/RectF;

    .line 370
    .line 371
    iget v3, p0, Lcom/android/launcher3/views/ClipIconView;->x:F

    .line 372
    .line 373
    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 374
    .line 375
    invoke-virtual {v1, v2, v3, v3, v4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 376
    .line 377
    .line 378
    instance-of v1, v9, Lcom/android/launcher3/views/FloatingIconView;

    .line 379
    .line 380
    if-eqz v1, :cond_a

    .line 381
    .line 382
    move-object v1, v9

    .line 383
    check-cast v1, Lcom/android/launcher3/views/FloatingIconView;

    .line 384
    .line 385
    iget-object v2, p0, Lcom/android/launcher3/views/ClipIconView;->D:Landroid/graphics/Path;

    .line 386
    .line 387
    invoke-virtual {v1, v2}, Lcom/android/launcher3/views/FloatingIconView;->setClipPath(Landroid/graphics/Path;)V

    .line 388
    .line 389
    .line 390
    :cond_a
    move/from16 v4, p4

    .line 391
    .line 392
    invoke-direct {p0, p1, v4, v7, v9}, Lcom/android/launcher3/views/ClipIconView;->m(Landroid/graphics/RectF;FFLandroid/view/View;)V

    .line 393
    .line 394
    .line 395
    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    .line 396
    .line 397
    .line 398
    move-result v0

    .line 399
    int-to-float v0, v0

    .line 400
    div-float/2addr v0, v10

    .line 401
    invoke-virtual {v9, v0}, Landroid/view/View;->setPivotX(F)V

    .line 402
    .line 403
    .line 404
    invoke-virtual {v9}, Landroid/view/View;->getHeight()I

    .line 405
    .line 406
    .line 407
    move-result v0

    .line 408
    int-to-float v0, v0

    .line 409
    div-float/2addr v0, v10

    .line 410
    invoke-virtual {v9, v0}, Landroid/view/View;->setPivotY(F)V

    .line 411
    .line 412
    .line 413
    invoke-virtual {v9, v7}, Landroid/view/View;->setScaleX(F)V

    .line 414
    .line 415
    .line 416
    invoke-virtual {v9, v7}, Landroid/view/View;->setScaleY(F)V

    .line 417
    .line 418
    .line 419
    invoke-virtual {v9}, Landroid/view/View;->invalidate()V

    .line 420
    .line 421
    .line 422
    :cond_b
    :goto_9
    return-void

    .line 423
    :cond_c
    :goto_a
    new-instance v0, Ljava/lang/StringBuilder;

    .line 424
    .line 425
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 426
    .line 427
    .line 428
    const-string v2, "update: params error. "

    .line 429
    .line 430
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 431
    .line 432
    .line 433
    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 434
    .line 435
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 436
    .line 437
    .line 438
    const-string v2, ", "

    .line 439
    .line 440
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    .line 442
    .line 443
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 444
    .line 445
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 446
    .line 447
    .line 448
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 449
    .line 450
    .line 451
    move-result-object v0

    .line 452
    const-string v1, "ClipIconView"

    .line 453
    .line 454
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 455
    .line 456
    .line 457
    return-void
.end method

.method public setClipPath(Landroid/graphics/Path;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->p:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setClipToOutline(Z)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-super {p0, p1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setTaskViewArtist(Lcom/android/launcher3/views/ClipIconView$b;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/views/ClipIconView;->t:Lcom/android/launcher3/views/ClipIconView$b;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
