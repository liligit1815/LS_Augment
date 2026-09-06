.class public Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "AIBubbleWidgetBubbleView.java"


# static fields
.field private static final D:Landroid/view/animation/PathInterpolator;

.field private static final E:Landroid/view/animation/PathInterpolator;

.field private static final F:Landroid/view/animation/PathInterpolator;

.field private static final G:Landroid/view/animation/PathInterpolator;

.field private static final H:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private A:F

.field private B:F

.field private C:F

.field private g:Lx1/v;

.field private h:Landroid/widget/TextView;

.field private i:Landroid/widget/ImageView;

.field private j:Landroid/widget/ImageView;

.field private k:Landroid/widget/ImageView;

.field private l:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

.field private m:Z

.field private n:F

.field private o:F

.field private p:I

.field private q:I

.field private r:I

.field private s:I

.field private t:F

.field private u:F

.field private final v:Landroid/view/animation/PathInterpolator;

.field private final w:Landroid/view/animation/PathInterpolator;

.field private x:F

.field private y:F

.field private z:F


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const v2, 0x3f0ccccd    # 0.55f

    .line 5
    .line 6
    .line 7
    const v3, 0x3ee66666    # 0.45f

    .line 8
    .line 9
    .line 10
    const/high16 v4, 0x3f800000    # 1.0f

    .line 11
    .line 12
    invoke-direct {v0, v1, v2, v3, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->D:Landroid/view/animation/PathInterpolator;

    .line 16
    .line 17
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 18
    .line 19
    const v2, 0x3eae147b    # 0.34f

    .line 20
    .line 21
    .line 22
    const v3, 0x3fb33333    # 1.4f

    .line 23
    .line 24
    .line 25
    const v5, 0x3f23d70a    # 0.64f

    .line 26
    .line 27
    .line 28
    invoke-direct {v0, v2, v3, v5, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->E:Landroid/view/animation/PathInterpolator;

    .line 32
    .line 33
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 34
    .line 35
    const v3, 0x3f266666    # 0.65f

    .line 36
    .line 37
    .line 38
    const v6, 0x3eb33333    # 0.35f

    .line 39
    .line 40
    .line 41
    invoke-direct {v0, v3, v1, v6, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->F:Landroid/view/animation/PathInterpolator;

    .line 45
    .line 46
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 47
    .line 48
    const v1, 0x3fc7ae14    # 1.56f

    .line 49
    .line 50
    .line 51
    invoke-direct {v0, v2, v1, v5, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 52
    .line 53
    .line 54
    sput-object v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->G:Landroid/view/animation/PathInterpolator;

    .line 55
    .line 56
    const-string v0, "com.tencent.mm"

    .line 57
    .line 58
    const-string v1, "com.zte.softda"

    .line 59
    .line 60
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    sput-object v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->H:Ljava/util/List;

    .line 69
    .line 70
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 3
    iput-boolean p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->m:Z

    const/high16 p1, 0x3f800000    # 1.0f

    .line 4
    iput p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->n:F

    .line 5
    iput p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->o:F

    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f070080

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->p:I

    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f070086

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->q:I

    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0c0002

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->r:I

    .line 9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0c0003

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->s:I

    .line 10
    iput p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->t:F

    .line 11
    invoke-direct {p0, p2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->a(I)F

    move-result p2

    iput p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->u:F

    .line 12
    new-instance p2, Landroid/view/animation/PathInterpolator;

    const/high16 p3, 0x3e800000    # 0.25f

    const v0, 0x3dcccccd    # 0.1f

    invoke-direct {p2, p3, v0, p3, p1}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->v:Landroid/view/animation/PathInterpolator;

    .line 13
    new-instance p2, Landroid/view/animation/PathInterpolator;

    const p3, 0x3ea8f5c3    # 0.33f

    const v0, 0x3f2e147b    # 0.68f

    invoke-direct {p2, p3, p1, v0, p1}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->w:Landroid/view/animation/PathInterpolator;

    return-void
.end method

.method private a(I)F
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->s:I

    .line 2
    .line 3
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->r:I

    .line 8
    .line 9
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->s:I

    .line 14
    .line 15
    sub-int/2addr p1, v0

    .line 16
    int-to-float p1, p1

    .line 17
    const/high16 v1, 0x3f800000    # 1.0f

    .line 18
    .line 19
    mul-float/2addr p1, v1

    .line 20
    iget v2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->r:I

    .line 21
    .line 22
    sub-int/2addr v2, v0

    .line 23
    int-to-float v0, v2

    .line 24
    div-float/2addr p1, v0

    .line 25
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->p:I

    .line 26
    .line 27
    iget p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->q:I

    .line 28
    .line 29
    sub-int v2, v0, p0

    .line 30
    .line 31
    int-to-float v2, v2

    .line 32
    mul-float/2addr p1, v2

    .line 33
    int-to-float v2, p0

    .line 34
    add-float/2addr p1, v2

    .line 35
    int-to-float v2, v0

    .line 36
    div-float/2addr p1, v2

    .line 37
    int-to-float p0, p0

    .line 38
    mul-float/2addr p0, v1

    .line 39
    int-to-float v0, v0

    .line 40
    div-float/2addr p0, v0

    .line 41
    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-static {p0, v1}, Ljava/lang/Math;->min(FF)F

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0
.end method

.method private i(FF)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->n:F

    .line 2
    .line 3
    cmpl-float v0, p1, v0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->l()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->t:F

    .line 14
    .line 15
    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->u:F

    .line 20
    .line 21
    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    :cond_0
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->n:F

    .line 26
    .line 27
    cmpl-float v0, p1, v0

    .line 28
    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->o:F

    .line 32
    .line 33
    cmpl-float v0, v0, p2

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-void

    .line 39
    :cond_2
    :goto_0
    mul-float v0, p1, p2

    .line 40
    .line 41
    invoke-super {p0, v0}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 42
    .line 43
    .line 44
    invoke-super {p0, v0}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 45
    .line 46
    .line 47
    iput p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->n:F

    .line 48
    .line 49
    iput p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->o:F

    .line 50
    .line 51
    return-void
.end method

.method private k(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->p()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_0

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_5

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    if-eq v0, v1, :cond_2

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    if-eq v0, v1, :cond_1

    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :cond_1
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->B:F

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iget v2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->z:F

    .line 30
    .line 31
    sub-float/2addr v1, v2

    .line 32
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    add-float/2addr v0, v1

    .line 37
    iput v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->B:F

    .line 38
    .line 39
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->C:F

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    iget v2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->A:F

    .line 46
    .line 47
    sub-float/2addr v1, v2

    .line 48
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    add-float/2addr v0, v1

    .line 53
    iput v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->C:F

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iput v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->z:F

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    iput p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->A:F

    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iget v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->B:F

    .line 81
    .line 82
    int-to-float v0, v0

    .line 83
    cmpl-float v1, v1, v0

    .line 84
    .line 85
    if-gtz v1, :cond_3

    .line 86
    .line 87
    iget v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->C:F

    .line 88
    .line 89
    cmpl-float v0, v1, v0

    .line 90
    .line 91
    if-lez v0, :cond_4

    .line 92
    .line 93
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->y:F

    .line 98
    .line 99
    cmpg-float p1, p1, v0

    .line 100
    .line 101
    if-gez p1, :cond_4

    .line 102
    .line 103
    iget p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->C:F

    .line 104
    .line 105
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->B:F

    .line 106
    .line 107
    cmpl-float p1, p1, v0

    .line 108
    .line 109
    if-lez p1, :cond_4

    .line 110
    .line 111
    const-string p1, "AIBubbleWidgetBubbleView"

    .line 112
    .line 113
    const-string v0, "handleTouchEventForSlide slide to open"

    .line 114
    .line 115
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    instance-of p1, p1, Landroid/view/ViewGroup;

    .line 123
    .line 124
    if-eqz p1, :cond_4

    .line 125
    .line 126
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-interface {p1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    instance-of p1, p1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 135
    .line 136
    if-eqz p1, :cond_4

    .line 137
    .line 138
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-interface {p1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    check-cast p1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 147
    .line 148
    invoke-virtual {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getFloatingLayout()Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p1, p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->g0(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;)V

    .line 153
    .line 154
    .line 155
    :cond_4
    :goto_0
    return-void

    .line 156
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    iput v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->x:F

    .line 161
    .line 162
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    iput v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->y:F

    .line 167
    .line 168
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    iput v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->z:F

    .line 173
    .line 174
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 175
    .line 176
    .line 177
    move-result p1

    .line 178
    iput p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->A:F

    .line 179
    .line 180
    const/4 p1, 0x0

    .line 181
    iput p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->B:F

    .line 182
    .line 183
    iput p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->C:F

    .line 184
    .line 185
    return-void
.end method

.method protected static m(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)Z
    .locals 2

    .line 1
    const-string v0, "GEN_NebulaOS1.0_PQ83A01V1.0.0B16"

    .line 2
    .line 3
    invoke-static {}, Lx1/O;->j0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    if-eqz p0, :cond_3

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    sget-object v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->H:Ljava/util/List;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 27
    .line 28
    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_2

    .line 33
    .line 34
    return v1

    .line 35
    :cond_2
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_3
    :goto_0
    return v1
.end method

.method private p()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    instance-of v0, v0, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->m(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method private setDefaultScale(F)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->o:F

    .line 7
    .line 8
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->i(FF)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->g:Lx1/v;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Lx1/v;

    .line 12
    .line 13
    const-string v1, "AIBubbleWidgetBubbleView"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, p0, v1, v2}, Lx1/v;-><init>(Landroid/view/View;Ljava/lang/String;Z)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->g:Lx1/v;

    .line 20
    .line 21
    invoke-virtual {v0}, Lx1/v;->t()V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->g:Lx1/v;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Lx1/v;->g(Landroid/view/MotionEvent;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->k(Landroid/view/MotionEvent;)V

    .line 32
    .line 33
    .line 34
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method public getDefaultAndAnimScaleXY()F
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->getScaleX()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getDefaultScaleXY()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->n:F

    .line 2
    .line 3
    return p0
.end method

.method public getScaleX()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->o:F

    .line 2
    .line 3
    return p0
.end method

.method public getScaleY()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->o:F

    .line 2
    .line 3
    return p0
.end method

.method protected getUnlockAnimator()Landroid/animation/ValueAnimator;
    .locals 8

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-wide/16 v1, 0x258

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    .line 16
    sget-object v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->D:Landroid/view/animation/PathInterpolator;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 19
    .line 20
    .line 21
    new-instance v2, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$b;

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    const/high16 v5, 0x3f800000    # 1.0f

    .line 25
    .line 26
    const/high16 v6, 0x3f000000    # 0.5f

    .line 27
    .line 28
    const/high16 v7, 0x3f800000    # 1.0f

    .line 29
    .line 30
    move-object v3, p0

    .line 31
    invoke-direct/range {v2 .. v7}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$b;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;FFFF)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 35
    .line 36
    .line 37
    return-object v0

    .line 38
    nop

    .line 39
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method protected j(ZLjava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/ValueAnimator;
    .locals 10

    .line 1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "getShowOrDismissAnimator isShow="

    .line 7
    .line 8
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v0, " getTag="

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    const-string v0, "AIBubbleWidgetBubbleView"

    .line 31
    .line 32
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->l()Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    const/4 v0, 0x0

    .line 40
    const/high16 v1, 0x3f800000    # 1.0f

    .line 41
    .line 42
    const/4 v2, 0x2

    .line 43
    new-array v2, v2, [F

    .line 44
    .line 45
    fill-array-data v2, :array_0

    .line 46
    .line 47
    .line 48
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    if-eqz p1, :cond_0

    .line 53
    .line 54
    const-wide/16 v3, 0x258

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    const-wide/16 v3, 0x190

    .line 58
    .line 59
    :goto_0
    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 60
    .line 61
    .line 62
    if-nez p1, :cond_1

    .line 63
    .line 64
    sget-object v3, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->F:Landroid/view/animation/PathInterpolator;

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_1
    if-eqz p2, :cond_2

    .line 68
    .line 69
    sget-object v3, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->G:Landroid/view/animation/PathInterpolator;

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_2
    sget-object v3, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->E:Landroid/view/animation/PathInterpolator;

    .line 73
    .line 74
    :goto_1
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 75
    .line 76
    .line 77
    if-eqz p1, :cond_3

    .line 78
    .line 79
    move v6, v0

    .line 80
    goto :goto_2

    .line 81
    :cond_3
    move v6, v1

    .line 82
    :goto_2
    if-eqz p1, :cond_4

    .line 83
    .line 84
    move v7, v1

    .line 85
    goto :goto_3

    .line 86
    :cond_4
    move v7, v0

    .line 87
    :goto_3
    if-eqz p1, :cond_6

    .line 88
    .line 89
    if-eqz p2, :cond_5

    .line 90
    .line 91
    const/high16 v0, 0x3f000000    # 0.5f

    .line 92
    .line 93
    :cond_5
    move v8, v0

    .line 94
    goto :goto_4

    .line 95
    :cond_6
    move v8, v1

    .line 96
    :goto_4
    if-eqz p1, :cond_7

    .line 97
    .line 98
    :goto_5
    move v9, v1

    .line 99
    goto :goto_6

    .line 100
    :cond_7
    const v1, 0x3f4ccccd    # 0.8f

    .line 101
    .line 102
    .line 103
    goto :goto_5

    .line 104
    :goto_6
    new-instance v4, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$c;

    .line 105
    .line 106
    move-object v5, p0

    .line 107
    invoke-direct/range {v4 .. v9}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$c;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;FFFF)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v2, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 111
    .line 112
    .line 113
    new-instance p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$d;

    .line 114
    .line 115
    invoke-direct {p0, v5, p3, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$d;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Ljava/lang/Runnable;Z)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v2, p0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 119
    .line 120
    .line 121
    return-object v2

    .line 122
    nop

    .line 123
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method protected l()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;

    .line 6
    .line 7
    return p0
.end method

.method protected n(Z)V
    .locals 3

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    move v2, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move v2, v0

    .line 9
    :goto_0
    if-eqz p1, :cond_1

    .line 10
    .line 11
    move v0, v1

    .line 12
    :cond_1
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->setAnimScale(F)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method protected o(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;Z)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;",
            "Z)",
            "Ljava/util/ArrayList<",
            "Ljava/util/ArrayList<",
            "Landroid/animation/Animator;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "replaceBubbleViewByNotSamePkgBubbleData cur="

    .line 7
    .line 8
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, " newBubbleData="

    .line 19
    .line 20
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    const-string v0, "AIBubbleWidgetBubbleView"

    .line 31
    .line 32
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    new-instance p2, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    if-eqz p1, :cond_3

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    instance-of v0, v0, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 54
    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    new-instance v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$e;

    .line 71
    .line 72
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$e;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;)V

    .line 73
    .line 74
    .line 75
    const/4 v1, 0x1

    .line 76
    const/4 v2, 0x0

    .line 77
    invoke-virtual {p0, v1, v2, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->j(ZLjava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/ValueAnimator;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$f;

    .line 82
    .line 83
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$f;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V

    .line 84
    .line 85
    .line 86
    const/4 p1, 0x0

    .line 87
    invoke-virtual {p0, p1, v2, v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->j(ZLjava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/ValueAnimator;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    new-instance p1, Ljava/util/ArrayList;

    .line 92
    .line 93
    filled-new-array {p0, v0}, [Landroid/animation/ValueAnimator;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-direct {p1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    return-object p2

    .line 108
    :cond_2
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->s(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V

    .line 109
    .line 110
    .line 111
    :cond_3
    :goto_1
    return-object p2
.end method

.method protected onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b008d

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->l:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 14
    .line 15
    const v0, 0x7f0b007c

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/widget/TextView;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->h:Landroid/widget/TextView;

    .line 25
    .line 26
    const v0, 0x7f0b0078

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Landroid/widget/ImageView;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->i:Landroid/widget/ImageView;

    .line 36
    .line 37
    const v0, 0x7f0b007a

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Landroid/widget/ImageView;

    .line 45
    .line 46
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->j:Landroid/widget/ImageView;

    .line 47
    .line 48
    const v0, 0x7f0b0079

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Landroid/widget/ImageView;

    .line 56
    .line 57
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->k:Landroid/widget/ImageView;

    .line 58
    .line 59
    sget-object v0, Lcom/android/launcher3/widget/custom/bubble/l;->u:Lcom/android/launcher3/util/I;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/l;

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/l;->F()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    iput-boolean v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->m:Z

    .line 76
    .line 77
    if-eqz v0, :cond_0

    .line 78
    .line 79
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->i:Landroid/widget/ImageView;

    .line 80
    .line 81
    const/4 v1, 0x1

    .line 82
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setClipToOutline(Z)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const v1, 0x7f070084

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->i:Landroid/widget/ImageView;

    .line 97
    .line 98
    new-instance v2, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$a;

    .line 99
    .line 100
    invoke-direct {v2, p0, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$a;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;I)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 104
    .line 105
    .line 106
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->i:Landroid/widget/ImageView;

    .line 107
    .line 108
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    if-eqz v0, :cond_2

    .line 113
    .line 114
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->m:Z

    .line 119
    .line 120
    if-eqz v1, :cond_1

    .line 121
    .line 122
    const v1, 0x7f070087

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_1
    const v1, 0x7f070083

    .line 127
    .line 128
    .line 129
    :goto_0
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->i:Landroid/widget/ImageView;

    .line 134
    .line 135
    invoke-virtual {v1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 140
    .line 141
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 142
    .line 143
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->i:Landroid/widget/ImageView;

    .line 144
    .line 145
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 146
    .line 147
    .line 148
    :cond_2
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->p()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method protected q(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;Z)Ljava/util/ArrayList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;",
            "Z)",
            "Ljava/util/ArrayList<",
            "Ljava/util/ArrayList<",
            "Landroid/animation/Animator;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p2, 0x2

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3
    .line 4
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 5
    .line 6
    .line 7
    const-string v1, "updateBubbleViewBySamePkgBubbleData cur="

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, " newBubbleData="

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "AIBubbleWidgetBubbleView"

    .line 32
    .line 33
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    new-instance v0, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .line 40
    .line 41
    if-eqz p1, :cond_8

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-nez v1, :cond_0

    .line 48
    .line 49
    goto/16 :goto_4

    .line 50
    .line 51
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    instance-of v1, v1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 56
    .line 57
    if-eqz v1, :cond_7

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    check-cast v1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 64
    .line 65
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-nez v1, :cond_1

    .line 70
    .line 71
    goto/16 :goto_3

    .line 72
    .line 73
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    check-cast v1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 78
    .line 79
    iget v1, v1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->count:I

    .line 80
    .line 81
    iget v2, p1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->count:I

    .line 82
    .line 83
    if-ne v1, v2, :cond_2

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->s(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V

    .line 86
    .line 87
    .line 88
    return-object v0

    .line 89
    :cond_2
    invoke-direct {p0, v2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->a(I)F

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    const/16 v4, 0xa

    .line 94
    .line 95
    if-gt v1, v4, :cond_4

    .line 96
    .line 97
    const v4, 0x3d8f5c29    # 0.07f

    .line 98
    .line 99
    .line 100
    if-le v2, v1, :cond_3

    .line 101
    .line 102
    add-float/2addr v3, v4

    .line 103
    :goto_0
    iget v4, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->n:F

    .line 104
    .line 105
    div-float/2addr v3, v4

    .line 106
    goto :goto_1

    .line 107
    :cond_3
    sub-float/2addr v3, v4

    .line 108
    goto :goto_0

    .line 109
    :cond_4
    if-le v2, v1, :cond_5

    .line 110
    .line 111
    const v3, 0x3f866666    # 1.05f

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_5
    const v3, 0x3f733333    # 0.95f

    .line 116
    .line 117
    .line 118
    :goto_1
    invoke-direct {p0, v2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->a(I)F

    .line 119
    .line 120
    .line 121
    move-result v4

    .line 122
    iget v5, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->n:F

    .line 123
    .line 124
    div-float/2addr v4, v5

    .line 125
    const/high16 v5, 0x3f800000    # 1.0f

    .line 126
    .line 127
    new-array v6, p2, [F

    .line 128
    .line 129
    fill-array-data v6, :array_0

    .line 130
    .line 131
    .line 132
    invoke-static {v6}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 133
    .line 134
    .line 135
    move-result-object v6

    .line 136
    new-array p2, p2, [F

    .line 137
    .line 138
    fill-array-data p2, :array_1

    .line 139
    .line 140
    .line 141
    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 142
    .line 143
    .line 144
    move-result-object p2

    .line 145
    const-wide/16 v7, 0x15e

    .line 146
    .line 147
    invoke-virtual {v6, v7, v8}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 148
    .line 149
    .line 150
    iget-object v7, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->v:Landroid/view/animation/PathInterpolator;

    .line 151
    .line 152
    invoke-virtual {v6, v7}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 153
    .line 154
    .line 155
    new-instance v7, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$g;

    .line 156
    .line 157
    invoke-direct {v7, p0, v5, v3}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$g;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;FF)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v6, v7}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 161
    .line 162
    .line 163
    const-wide/16 v7, 0x258

    .line 164
    .line 165
    invoke-virtual {p2, v7, v8}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 166
    .line 167
    .line 168
    iget-object v5, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->w:Landroid/view/animation/PathInterpolator;

    .line 169
    .line 170
    invoke-virtual {p2, v5}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 171
    .line 172
    .line 173
    new-instance v5, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$h;

    .line 174
    .line 175
    invoke-direct {v5, p0, v3, v4}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$h;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;FF)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p2, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 179
    .line 180
    .line 181
    new-instance v3, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$i;

    .line 182
    .line 183
    invoke-direct {v3, p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$i;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p2, v3}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 187
    .line 188
    .line 189
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->l:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 190
    .line 191
    new-instance p1, Ljava/lang/StringBuilder;

    .line 192
    .line 193
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 194
    .line 195
    .line 196
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    const-string v3, ""

    .line 200
    .line 201
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    const/4 v3, 0x1

    .line 209
    if-ge v2, v1, :cond_6

    .line 210
    .line 211
    move v1, v3

    .line 212
    goto :goto_2

    .line 213
    :cond_6
    const/4 v1, 0x0

    .line 214
    :goto_2
    invoke-virtual {p0, p1, v3, v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->h(Ljava/lang/String;ZZ)Landroid/animation/ValueAnimator;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    new-instance p1, Ljava/util/ArrayList;

    .line 219
    .line 220
    filled-new-array {v6, p2}, [Landroid/animation/ValueAnimator;

    .line 221
    .line 222
    .line 223
    move-result-object p2

    .line 224
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 225
    .line 226
    .line 227
    move-result-object p2

    .line 228
    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    if-eqz p0, :cond_8

    .line 235
    .line 236
    new-instance p1, Ljava/util/ArrayList;

    .line 237
    .line 238
    filled-new-array {p0}, [Landroid/animation/ValueAnimator;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    invoke-direct {p1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    return-object v0

    .line 253
    :cond_7
    :goto_3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->s(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V

    .line 254
    .line 255
    .line 256
    :cond_8
    :goto_4
    return-object v0

    .line 257
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method protected r(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    const v0, 0x7f0b0075

    .line 8
    .line 9
    .line 10
    iget-object v1, p1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;->a:Landroid/graphics/PointF;

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->i:Landroid/widget/ImageView;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setClipToOutline(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->i:Landroid/widget/ImageView;

    .line 22
    .line 23
    const/16 v1, 0x8

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->j:Landroid/widget/ImageView;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->l:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->h:Landroid/widget/TextView;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget p1, p1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;->b:I

    .line 48
    .line 49
    int-to-float p1, p1

    .line 50
    invoke-static {v0, p1}, Lx1/O;->F(Landroid/content/Context;F)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    int-to-float p1, p1

    .line 55
    const/high16 v0, 0x3f800000    # 1.0f

    .line 56
    .line 57
    mul-float/2addr p1, v0

    .line 58
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const v1, 0x7f070080

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    int-to-float v0, v0

    .line 70
    div-float/2addr p1, v0

    .line 71
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->setDefaultScale(F)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method protected s(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->t(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method protected setAnimScale(F)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->n:F

    .line 7
    .line 8
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->i(FF)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setScaleX(F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->setAnimScale(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setScaleY(F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->setAnimScale(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected t(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;Z)V
    .locals 6

    .line 1
    if-eqz p1, :cond_6

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_2

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    const-string v0, ""

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-nez p2, :cond_1

    .line 18
    .line 19
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->l:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 20
    .line 21
    new-instance v2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    iget v3, p1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->count:I

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {p2, v2, v1, v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->h(Ljava/lang/String;ZZ)Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    .line 41
    :cond_1
    iget p2, p1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->count:I

    .line 42
    .line 43
    invoke-direct {p0, p2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->a(I)F

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    const/high16 v2, 0x3f800000    # 1.0f

    .line 48
    .line 49
    invoke-direct {p0, p2, v2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->i(FF)V

    .line 50
    .line 51
    .line 52
    sget-object p2, Lcom/android/launcher3/widget/custom/bubble/l;->u:Lcom/android/launcher3/util/I;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {p2, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Lcom/android/launcher3/widget/custom/bubble/l;

    .line 63
    .line 64
    invoke-virtual {v2, p1}, Lcom/android/launcher3/widget/custom/bubble/l;->C(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)Lcom/android/launcher3/widget/custom/bubble/l$g;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    const/16 v3, 0x8

    .line 69
    .line 70
    if-eqz v2, :cond_5

    .line 71
    .line 72
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->h:Landroid/widget/TextView;

    .line 73
    .line 74
    iget-object v4, v2, Lcom/android/launcher3/widget/custom/bubble/l$g;->c:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->i:Landroid/widget/ImageView;

    .line 80
    .line 81
    iget-object v4, v2, Lcom/android/launcher3/widget/custom/bubble/l$g;->d:Landroid/graphics/drawable/Drawable;

    .line 82
    .line 83
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->j:Landroid/widget/ImageView;

    .line 87
    .line 88
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    if-nez v0, :cond_2

    .line 93
    .line 94
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->j:Landroid/widget/ImageView;

    .line 95
    .line 96
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    const v5, 0x7f08073e

    .line 101
    .line 102
    .line 103
    invoke-virtual {v4, v5}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 108
    .line 109
    .line 110
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->j:Landroid/widget/ImageView;

    .line 111
    .line 112
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iget v2, v2, Lcom/android/launcher3/widget/custom/bubble/l$g;->e:I

    .line 121
    .line 122
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->i:Landroid/widget/ImageView;

    .line 126
    .line 127
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->j:Landroid/widget/ImageView;

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 133
    .line 134
    .line 135
    iget-boolean p1, p1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->doubleApp:Z

    .line 136
    .line 137
    if-eqz p1, :cond_3

    .line 138
    .line 139
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    check-cast p1, Lcom/android/launcher3/widget/custom/bubble/l;

    .line 148
    .line 149
    invoke-virtual {p1}, Lcom/android/launcher3/widget/custom/bubble/l;->F()Z

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    if-eqz p1, :cond_3

    .line 154
    .line 155
    const/4 p1, 0x1

    .line 156
    goto :goto_0

    .line 157
    :cond_3
    move p1, v1

    .line 158
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->k:Landroid/widget/ImageView;

    .line 159
    .line 160
    if-eqz p1, :cond_4

    .line 161
    .line 162
    goto :goto_1

    .line 163
    :cond_4
    move v1, v3

    .line 164
    :goto_1
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_5
    new-instance p2, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 171
    .line 172
    .line 173
    const-string v2, "updateViewsByBubbleData aiBubbleViewData null bubbleData="

    .line 174
    .line 175
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    const-string p2, "AIBubbleWidgetBubbleView"

    .line 186
    .line 187
    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    .line 189
    .line 190
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->h:Landroid/widget/TextView;

    .line 191
    .line 192
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 193
    .line 194
    .line 195
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->l:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 196
    .line 197
    invoke-virtual {p1, v0, v1, v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->h(Ljava/lang/String;ZZ)Landroid/animation/ValueAnimator;

    .line 198
    .line 199
    .line 200
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->i:Landroid/widget/ImageView;

    .line 201
    .line 202
    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 203
    .line 204
    .line 205
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->j:Landroid/widget/ImageView;

    .line 206
    .line 207
    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 208
    .line 209
    .line 210
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->k:Landroid/widget/ImageView;

    .line 211
    .line 212
    invoke-virtual {p0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 213
    .line 214
    .line 215
    :cond_6
    :goto_2
    return-void
.end method
