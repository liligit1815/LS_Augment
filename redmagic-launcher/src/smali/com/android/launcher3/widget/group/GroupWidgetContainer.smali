.class public Lcom/android/launcher3/widget/group/GroupWidgetContainer;
.super Landroid/widget/FrameLayout;
.source "GroupWidgetContainer.java"

# interfaces
.implements Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl$a;


# static fields
.field private static final P:Landroid/view/animation/PathInterpolator;

.field private static final Q:Landroid/view/animation/PathInterpolator;


# instance fields
.field private A:F

.field private B:F

.field private C:F

.field private D:I

.field private E:I

.field private F:Z

.field private G:Z

.field private H:Z

.field private I:Z

.field private J:Z

.field private K:F

.field private L:Z

.field private M:F

.field private N:I

.field private O:Landroid/view/VelocityTracker;

.field private g:Lcom/android/launcher3/widget/group/f;

.field private h:Ljava/lang/String;

.field private i:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

.field private j:Z

.field private k:F

.field private l:I

.field private m:I

.field private n:Landroid/view/ViewOutlineProvider;

.field private o:I

.field private p:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

.field private q:I

.field private r:I

.field private s:I

.field private t:Landroid/animation/ValueAnimator;

.field private u:Landroid/view/View;

.field private v:I

.field private w:I

.field private x:Landroidx/viewpager/widget/ViewPager$j;

.field private y:F

.field private z:F


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    const v2, 0x3f2e147b    # 0.68f

    .line 6
    .line 7
    .line 8
    const v3, 0x3ea8f5c3    # 0.33f

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v3, v1, v2, v1}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->P:Landroid/view/animation/PathInterpolator;

    .line 15
    .line 16
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 17
    .line 18
    const v1, 0x3f8ccccd    # 1.1f

    .line 19
    .line 20
    .line 21
    const v2, 0x3f9eb852    # 1.24f

    .line 22
    .line 23
    .line 24
    const v4, 0x3e570a3d    # 0.21f

    .line 25
    .line 26
    .line 27
    invoke-direct {v0, v4, v1, v3, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->Q:Landroid/view/animation/PathInterpolator;

    .line 31
    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    const-string p1, ""

    iput-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->h:Ljava/lang/String;

    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->j:Z

    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/android/launcher3/widget/I0;->b(Landroid/content/Context;)F

    move-result p2

    iput p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->k:F

    .line 6
    new-instance p2, Lcom/android/launcher3/widget/group/GroupWidgetContainer$b;

    invoke-direct {p2, p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer$b;-><init>(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)V

    iput-object p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->n:Landroid/view/ViewOutlineProvider;

    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f07040b

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->q:I

    .line 8
    iput p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 9
    iput p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->s:I

    const/4 p2, 0x2

    .line 10
    new-array p2, p2, [F

    fill-array-data p2, :array_0

    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t:Landroid/animation/ValueAnimator;

    const/4 p2, 0x0

    .line 11
    iput-object p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->u:Landroid/view/View;

    .line 12
    iput p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v:I

    .line 13
    iput p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->w:I

    .line 14
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->D:I

    .line 15
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->E:I

    .line 16
    iput-boolean p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->F:Z

    .line 17
    iput-boolean p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->H:Z

    .line 18
    iput-boolean p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->I:Z

    .line 19
    iput-boolean p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->J:Z

    .line 20
    iput-boolean p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->L:Z

    .line 21
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->M:F

    .line 22
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    const/high16 p2, 0x43fa0000    # 500.0f

    mul-float/2addr p1, p2

    float-to-int p1, p1

    iput p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->N:I

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private A(Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    mul-float/2addr v0, v1

    .line 9
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 10
    .line 11
    int-to-float v1, v1

    .line 12
    div-float/2addr v0, v1

    .line 13
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-direct {p0, v0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->q(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    iget p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->w:I

    .line 24
    .line 25
    if-eq v0, p1, :cond_8

    .line 26
    .line 27
    :cond_0
    iput v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->w:I

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    instance-of v0, p1, Landroid/appwidget/AppWidgetHostView;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    const-string v2, ""

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    const v0, 0x7f0b02b9

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    instance-of v3, v0, Ljava/lang/String;

    .line 48
    .line 49
    if-eqz v3, :cond_1

    .line 50
    .line 51
    check-cast v0, Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-nez v3, :cond_1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    move-object v0, v2

    .line 61
    :goto_0
    const v3, 0x7f0b02b8

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, v3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    instance-of v3, p1, Ljava/lang/Boolean;

    .line 69
    .line 70
    if-eqz v3, :cond_3

    .line 71
    .line 72
    check-cast p1, Ljava/lang/Boolean;

    .line 73
    .line 74
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_3

    .line 79
    .line 80
    const/4 v1, 0x1

    .line 81
    goto :goto_1

    .line 82
    :cond_2
    move-object v0, v2

    .line 83
    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->g:Lcom/android/launcher3/widget/group/f;

    .line 84
    .line 85
    if-eqz p1, :cond_4

    .line 86
    .line 87
    invoke-interface {p1}, Lcom/android/launcher3/widget/group/f;->getRootTitleTextView()Landroid/widget/TextView;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    goto :goto_2

    .line 92
    :cond_4
    const/4 p1, 0x0

    .line 93
    :goto_2
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->g:Lcom/android/launcher3/widget/group/f;

    .line 94
    .line 95
    if-eqz p0, :cond_5

    .line 96
    .line 97
    invoke-interface {p0}, Lcom/android/launcher3/widget/group/f;->getHostViewTitle()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    goto :goto_3

    .line 102
    :cond_5
    move-object p0, v2

    .line 103
    :goto_3
    if-eqz p1, :cond_8

    .line 104
    .line 105
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    if-nez v3, :cond_8

    .line 110
    .line 111
    new-instance v3, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    if-nez p0, :cond_6

    .line 124
    .line 125
    new-instance p0, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .line 129
    .line 130
    const-string v2, " \u00b7 "

    .line 131
    .line 132
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    :cond_6
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    if-eqz v1, :cond_7

    .line 150
    .line 151
    goto :goto_4

    .line 152
    :cond_7
    move-object v0, p0

    .line 153
    :goto_4
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 154
    .line 155
    .line 156
    :cond_8
    return-void
.end method

.method public static synthetic a(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method static bridge synthetic b(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->i:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->L:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->l:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->m:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->k:F

    .line 2
    .line 3
    return p0
.end method

.method private getGroupWidgetHostViewTag()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private getMaxScrollY()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-le v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-direct {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    xor-int/2addr v1, v2

    .line 17
    sub-int/2addr v0, v1

    .line 18
    iget p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 19
    .line 20
    mul-int/2addr v0, p0

    .line 21
    return v0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method private getMinScrollY()I
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-le v0, v1, :cond_0

    .line 13
    .line 14
    iget p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 15
    .line 16
    neg-int p0, p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method private getSlideTopBottomChildIndex()Landroid/graphics/Point;
    .locals 5

    .line 1
    iget v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v2, 0x1

    .line 11
    if-le v0, v2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget v3, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 18
    .line 19
    rem-int/2addr v0, v3

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 27
    .line 28
    div-int v1, v0, p0

    .line 29
    .line 30
    :cond_0
    move p0, v1

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    int-to-float v0, v0

    .line 37
    const/high16 v3, 0x3f800000    # 1.0f

    .line 38
    .line 39
    mul-float/2addr v0, v3

    .line 40
    iget v3, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 41
    .line 42
    int-to-float v3, v3

    .line 43
    div-float/2addr v0, v3

    .line 44
    const/4 v3, 0x0

    .line 45
    cmpg-float v3, v0, v3

    .line 46
    .line 47
    if-ltz v3, :cond_3

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    sub-int/2addr v3, v2

    .line 54
    int-to-float v3, v3

    .line 55
    cmpl-float v3, v0, v3

    .line 56
    .line 57
    if-lez v3, :cond_2

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    float-to-int v1, v0

    .line 61
    add-int/lit8 p0, v1, 0x1

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_3
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    sub-int/2addr p0, v2

    .line 69
    move v4, v1

    .line 70
    move v1, p0

    .line 71
    move p0, v4

    .line 72
    :goto_1
    new-instance v0, Landroid/graphics/Point;

    .line 73
    .line 74
    invoke-direct {v0, v1, p0}, Landroid/graphics/Point;-><init>(II)V

    .line 75
    .line 76
    .line 77
    return-object v0
.end method

.method static bridge synthetic h(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic i(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic j(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->u:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic k(Lcom/android/launcher3/widget/group/GroupWidgetContainer;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->u:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic l(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->getGroupWidgetHostViewTag()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private m(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->O:Landroid/view/VelocityTracker;

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
    iput-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->O:Landroid/view/VelocityTracker;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->O:Landroid/view/VelocityTracker;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private n(IZZ)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, " touchScrollTooFast="

    .line 8
    .line 9
    const-string v2, " noAnim="

    .line 10
    .line 11
    const-string v3, "GroupWidgetContainer"

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v4, "animScrollTo isRunning toY="

    .line 21
    .line 22
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t:Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 50
    .line 51
    .line 52
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-ne p1, v0, :cond_1

    .line 57
    .line 58
    new-instance p0, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    const-string v0, "animScrollTo already here return toY="

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {v3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_1
    if-eqz p3, :cond_2

    .line 92
    .line 93
    iget v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v:I

    .line 94
    .line 95
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    goto :goto_0

    .line 100
    :cond_2
    const/4 v0, 0x0

    .line 101
    :goto_0
    iput-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->u:Landroid/view/View;

    .line 102
    .line 103
    const/high16 v1, 0x3f800000    # 1.0f

    .line 104
    .line 105
    if-eqz v0, :cond_3

    .line 106
    .line 107
    invoke-virtual {v0}, Landroid/view/View;->getScaleX()F

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    move v8, v0

    .line 112
    goto :goto_1

    .line 113
    :cond_3
    move v8, v1

    .line 114
    :goto_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 115
    .line 116
    .line 117
    move-result v6

    .line 118
    const/16 v0, 0x1c2

    .line 119
    .line 120
    const/4 v2, 0x0

    .line 121
    if-eqz p2, :cond_4

    .line 122
    .line 123
    move v4, v2

    .line 124
    goto :goto_2

    .line 125
    :cond_4
    move v4, v0

    .line 126
    :goto_2
    if-nez p2, :cond_5

    .line 127
    .line 128
    iget p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 129
    .line 130
    if-lez p2, :cond_5

    .line 131
    .line 132
    sub-int p2, p1, v6

    .line 133
    .line 134
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 135
    .line 136
    .line 137
    move-result p2

    .line 138
    int-to-float p2, p2

    .line 139
    mul-float/2addr p2, v1

    .line 140
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 141
    .line 142
    div-int/lit8 v1, v1, 0x2

    .line 143
    .line 144
    int-to-float v1, v1

    .line 145
    div-float/2addr p2, v1

    .line 146
    const/high16 v1, 0x437a0000    # 250.0f

    .line 147
    .line 148
    mul-float/2addr p2, v1

    .line 149
    const/high16 v1, 0x43480000    # 200.0f

    .line 150
    .line 151
    add-float/2addr p2, v1

    .line 152
    float-to-int p2, p2

    .line 153
    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    .line 154
    .line 155
    .line 156
    move-result p2

    .line 157
    const/16 v0, 0xc8

    .line 158
    .line 159
    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    .line 160
    .line 161
    .line 162
    move-result v4

    .line 163
    :cond_5
    new-instance p2, Ljava/lang/StringBuilder;

    .line 164
    .line 165
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 166
    .line 167
    .line 168
    const-string v0, "animScrollTo toY="

    .line 169
    .line 170
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    const-string v0, " fromScrollY="

    .line 177
    .line 178
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    const-string v0, " mPageHeight="

    .line 185
    .line 186
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    iget v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 190
    .line 191
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    const-string v0, " animDuration="

    .line 195
    .line 196
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    const-string v0, " mScrollFastAnimView="

    .line 203
    .line 204
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->u:Landroid/view/View;

    .line 208
    .line 209
    if-eqz v0, :cond_6

    .line 210
    .line 211
    const/4 v2, 0x1

    .line 212
    :cond_6
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p2

    .line 219
    invoke-static {v3, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    .line 221
    .line 222
    iget-object p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t:Landroid/animation/ValueAnimator;

    .line 223
    .line 224
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 225
    .line 226
    .line 227
    iget-object p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t:Landroid/animation/ValueAnimator;

    .line 228
    .line 229
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->removeAllListeners()V

    .line 230
    .line 231
    .line 232
    iget-object p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t:Landroid/animation/ValueAnimator;

    .line 233
    .line 234
    int-to-long v0, v4

    .line 235
    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 236
    .line 237
    .line 238
    iget-object p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t:Landroid/animation/ValueAnimator;

    .line 239
    .line 240
    if-eqz p3, :cond_7

    .line 241
    .line 242
    sget-object p3, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->Q:Landroid/view/animation/PathInterpolator;

    .line 243
    .line 244
    goto :goto_3

    .line 245
    :cond_7
    sget-object p3, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->P:Landroid/view/animation/PathInterpolator;

    .line 246
    .line 247
    :goto_3
    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 248
    .line 249
    .line 250
    iget-object p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t:Landroid/animation/ValueAnimator;

    .line 251
    .line 252
    new-instance v4, Lcom/android/launcher3/widget/group/GroupWidgetContainer$c;

    .line 253
    .line 254
    const/high16 v9, 0x3f800000    # 1.0f

    .line 255
    .line 256
    move-object v5, p0

    .line 257
    move v7, p1

    .line 258
    invoke-direct/range {v4 .. v9}, Lcom/android/launcher3/widget/group/GroupWidgetContainer$c;-><init>(Lcom/android/launcher3/widget/group/GroupWidgetContainer;IIFF)V

    .line 259
    .line 260
    .line 261
    invoke-virtual {p2, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 262
    .line 263
    .line 264
    iget-object p0, v5, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t:Landroid/animation/ValueAnimator;

    .line 265
    .line 266
    new-instance p1, Lcom/android/launcher3/widget/group/GroupWidgetContainer$d;

    .line 267
    .line 268
    invoke-direct {p1, v5}, Lcom/android/launcher3/widget/group/GroupWidgetContainer$d;-><init>(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 272
    .line 273
    .line 274
    iget-object p0, v5, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t:Landroid/animation/ValueAnimator;

    .line 275
    .line 276
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 277
    .line 278
    .line 279
    return-void
.end method

.method private p()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->cancelLongPress()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-ge v0, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Landroid/view/View;->cancelLongPress()V

    .line 16
    .line 17
    .line 18
    add-int/lit8 v0, v0, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x1

    .line 22
    invoke-direct {p0, p0, v0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private q(I)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-gt v0, v2, :cond_0

    .line 8
    .line 9
    return v1

    .line 10
    :cond_0
    if-gez p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    sub-int/2addr p0, v2

    .line 17
    return p0

    .line 18
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    sub-int/2addr p0, v2

    .line 23
    if-le p1, p0, :cond_2

    .line 24
    .line 25
    return v1

    .line 26
    :cond_2
    return p1
.end method

.method private r(I)I
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-le v0, v1, :cond_6

    .line 7
    .line 8
    iget v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 9
    .line 10
    if-gtz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 24
    .line 25
    mul-int/2addr v0, v1

    .line 26
    if-lt p1, v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 33
    .line 34
    mul-int/2addr v0, p0

    .line 35
    sub-int/2addr p1, v0

    .line 36
    return p1

    .line 37
    :cond_1
    neg-int v0, v1

    .line 38
    if-gt p1, v0, :cond_2

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 45
    .line 46
    mul-int/2addr v0, p0

    .line 47
    add-int/2addr p1, v0

    .line 48
    :cond_2
    return p1

    .line 49
    :cond_3
    invoke-direct {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->getMinScrollY()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-direct {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->getMaxScrollY()I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    const-string v1, "GroupWidgetContainer"

    .line 58
    .line 59
    if-le p1, p0, :cond_4

    .line 60
    .line 61
    new-instance v2, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    const-string v3, "scrollTo y > max, y= "

    .line 67
    .line 68
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string p1, " max= "

    .line 75
    .line 76
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move p1, p0

    .line 90
    :cond_4
    if-ge p1, v0, :cond_5

    .line 91
    .line 92
    new-instance p0, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string v2, "scrollTo y < min, y= "

    .line 98
    .line 99
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string p1, " min= "

    .line 106
    .line 107
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    return v0

    .line 121
    :cond_5
    return p1

    .line 122
    :cond_6
    :goto_0
    const/4 p0, 0x0

    .line 123
    return p0
.end method

.method private t(Landroid/view/View;Z)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    if-ne p0, p1, :cond_1

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->clearFocus()V

    .line 7
    .line 8
    .line 9
    :cond_1
    instance-of v0, p1, Landroid/view/ViewGroup;

    .line 10
    .line 11
    const-string v1, "GroupWidgetContainer"

    .line 12
    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    move-object v0, p1

    .line 16
    check-cast v0, Landroid/view/ViewGroup;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/ViewGroup;->isPressed()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_2

    .line 23
    .line 24
    new-instance v2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v3, "clearPressedViewPressedStatus viewGroup.isPressed but not setPressed false viewGroup="

    .line 30
    .line 31
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    :cond_2
    const/4 p1, 0x0

    .line 45
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-ge p1, v1, :cond_5

    .line 50
    .line 51
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-direct {p0, v1, p2}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    add-int/lit8 p1, p1, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    if-eqz p2, :cond_4

    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/view/View;->isLongClickable()Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_4

    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/view/View;->cancelLongPress()V

    .line 70
    .line 71
    .line 72
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->isPressed()Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-eqz p0, :cond_5

    .line 77
    .line 78
    new-instance p0, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .line 82
    .line 83
    const-string p2, "clearPressedViewPressedStatus view.isPressed but not setPressed false view="

    .line 84
    .line 85
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    :cond_5
    :goto_1
    return-void
.end method

.method private v()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method private x()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->O:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->O:Landroid/view/VelocityTracker;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->O:Landroid/view/VelocityTracker;

    .line 15
    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method protected B(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->l:I

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->m:I

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidateOutline()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-lt v0, v1, :cond_5

    .line 13
    .line 14
    iget v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 15
    .line 16
    if-lez v0, :cond_5

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-ltz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    sub-int/2addr v2, v1

    .line 33
    iget v3, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 34
    .line 35
    mul-int/2addr v2, v3

    .line 36
    if-le v0, v2, :cond_5

    .line 37
    .line 38
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    sub-int/2addr v0, v1

    .line 43
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    int-to-float v4, v4

    .line 57
    const/high16 v5, 0x3f800000    # 1.0f

    .line 58
    .line 59
    mul-float/2addr v4, v5

    .line 60
    iget v5, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 61
    .line 62
    int-to-float v5, v5

    .line 63
    div-float/2addr v4, v5

    .line 64
    const/4 v5, 0x0

    .line 65
    cmpg-float v6, v4, v5

    .line 66
    .line 67
    if-gez v6, :cond_1

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    iget v4, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 74
    .line 75
    mul-int/2addr v1, v4

    .line 76
    neg-int v1, v1

    .line 77
    move v8, v2

    .line 78
    move v2, v1

    .line 79
    move v1, v8

    .line 80
    goto :goto_0

    .line 81
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 82
    .line 83
    .line 84
    move-result v6

    .line 85
    sub-int/2addr v6, v1

    .line 86
    int-to-float v1, v6

    .line 87
    cmpl-float v1, v4, v1

    .line 88
    .line 89
    if-lez v1, :cond_2

    .line 90
    .line 91
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    iget v4, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 96
    .line 97
    mul-int/2addr v1, v4

    .line 98
    goto :goto_0

    .line 99
    :cond_2
    move v1, v2

    .line 100
    :goto_0
    if-eqz v0, :cond_3

    .line 101
    .line 102
    int-to-float v4, v2

    .line 103
    invoke-virtual {p1, v5, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getDrawingTime()J

    .line 107
    .line 108
    .line 109
    move-result-wide v6

    .line 110
    invoke-virtual {p0, p1, v0, v6, v7}, Landroid/widget/FrameLayout;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 111
    .line 112
    .line 113
    neg-int v0, v2

    .line 114
    int-to-float v0, v0

    .line 115
    invoke-virtual {p1, v5, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 116
    .line 117
    .line 118
    :cond_3
    if-eqz v3, :cond_4

    .line 119
    .line 120
    int-to-float v0, v1

    .line 121
    invoke-virtual {p1, v5, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getDrawingTime()J

    .line 125
    .line 126
    .line 127
    move-result-wide v6

    .line 128
    invoke-virtual {p0, p1, v3, v6, v7}, Landroid/widget/FrameLayout;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 129
    .line 130
    .line 131
    neg-int p0, v1

    .line 132
    int-to-float p0, p0

    .line 133
    invoke-virtual {p1, v5, p0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 134
    .line 135
    .line 136
    :cond_4
    return-void

    .line 137
    :cond_5
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 12

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->u()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_1f

    .line 11
    .line 12
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 13
    .line 14
    if-gtz v1, :cond_0

    .line 15
    .line 16
    goto/16 :goto_10

    .line 17
    .line 18
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->m(Landroid/view/MotionEvent;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/4 v3, 0x0

    .line 26
    const/4 v4, 0x1

    .line 27
    if-nez v1, :cond_3

    .line 28
    .line 29
    iput-boolean v4, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->L:Z

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->y:F

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->z:F

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iput v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->A:F

    .line 48
    .line 49
    iput v3, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->C:F

    .line 50
    .line 51
    iput v3, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->B:F

    .line 52
    .line 53
    iput-boolean v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->F:Z

    .line 54
    .line 55
    iput v3, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->K:F

    .line 56
    .line 57
    iput-boolean v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->G:Z

    .line 58
    .line 59
    iput-boolean v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->H:Z

    .line 60
    .line 61
    iput-boolean v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->I:Z

    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->p:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 64
    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->r()V

    .line 68
    .line 69
    .line 70
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t:Landroid/animation/ValueAnimator;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_2

    .line 77
    .line 78
    iput-boolean v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->J:Z

    .line 79
    .line 80
    goto/16 :goto_f

    .line 81
    .line 82
    :cond_2
    iput-boolean v4, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->J:Z

    .line 83
    .line 84
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t:Landroid/animation/ValueAnimator;

    .line 85
    .line 86
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 87
    .line 88
    .line 89
    goto/16 :goto_f

    .line 90
    .line 91
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    const/4 v5, 0x2

    .line 96
    const-wide/16 v6, 0x0

    .line 97
    .line 98
    const/high16 v8, 0x3f800000    # 1.0f

    .line 99
    .line 100
    if-ne v1, v5, :cond_f

    .line 101
    .line 102
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->B:F

    .line 103
    .line 104
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    iget v9, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->z:F

    .line 109
    .line 110
    sub-float/2addr v5, v9

    .line 111
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    add-float/2addr v1, v5

    .line 116
    iput v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->B:F

    .line 117
    .line 118
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->C:F

    .line 119
    .line 120
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    iget v9, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->A:F

    .line 125
    .line 126
    sub-float/2addr v5, v9

    .line 127
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 128
    .line 129
    .line 130
    move-result v5

    .line 131
    add-float/2addr v1, v5

    .line 132
    iput v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->C:F

    .line 133
    .line 134
    iget-boolean v5, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->J:Z

    .line 135
    .line 136
    if-eqz v5, :cond_6

    .line 137
    .line 138
    iget v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->A:F

    .line 139
    .line 140
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->K:F

    .line 141
    .line 142
    add-float/2addr v0, v1

    .line 143
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    sub-float/2addr v0, v1

    .line 148
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    cmpl-float v1, v1, v8

    .line 153
    .line 154
    if-lez v1, :cond_5

    .line 155
    .line 156
    float-to-int v1, v0

    .line 157
    invoke-virtual {p0, v2, v1}, Landroid/widget/FrameLayout;->scrollBy(II)V

    .line 158
    .line 159
    .line 160
    int-to-float v1, v1

    .line 161
    sub-float v1, v0, v1

    .line 162
    .line 163
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    cmpl-float v0, v0, v3

    .line 168
    .line 169
    if-lez v0, :cond_4

    .line 170
    .line 171
    goto :goto_0

    .line 172
    :cond_4
    neg-float v1, v1

    .line 173
    :goto_0
    iput v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->K:F

    .line 174
    .line 175
    goto/16 :goto_6

    .line 176
    .line 177
    :cond_5
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->K:F

    .line 178
    .line 179
    add-float/2addr v1, v0

    .line 180
    iput v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->K:F

    .line 181
    .line 182
    goto/16 :goto_6

    .line 183
    .line 184
    :cond_6
    iget-boolean v5, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->F:Z

    .line 185
    .line 186
    if-nez v5, :cond_e

    .line 187
    .line 188
    iget v5, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->B:F

    .line 189
    .line 190
    iget v8, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->D:I

    .line 191
    .line 192
    int-to-float v8, v8

    .line 193
    cmpl-float v5, v5, v8

    .line 194
    .line 195
    if-gtz v5, :cond_7

    .line 196
    .line 197
    iget v5, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->E:I

    .line 198
    .line 199
    int-to-float v5, v5

    .line 200
    cmpl-float v1, v1, v5

    .line 201
    .line 202
    if-lez v1, :cond_e

    .line 203
    .line 204
    :cond_7
    iput-boolean v4, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->F:Z

    .line 205
    .line 206
    invoke-direct {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->p()V

    .line 207
    .line 208
    .line 209
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->B:F

    .line 210
    .line 211
    iget v5, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->C:F

    .line 212
    .line 213
    cmpl-float v1, v1, v5

    .line 214
    .line 215
    if-lez v1, :cond_8

    .line 216
    .line 217
    move v1, v4

    .line 218
    goto :goto_1

    .line 219
    :cond_8
    move v1, v2

    .line 220
    :goto_1
    iput-boolean v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->H:Z

    .line 221
    .line 222
    invoke-direct {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v()Z

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    if-nez v1, :cond_9

    .line 227
    .line 228
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    sub-int/2addr v0, v4

    .line 233
    iget v5, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 234
    .line 235
    mul-int/2addr v0, v5

    .line 236
    if-lt v1, v0, :cond_9

    .line 237
    .line 238
    iget v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->B:F

    .line 239
    .line 240
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->C:F

    .line 241
    .line 242
    cmpg-float v0, v0, v1

    .line 243
    .line 244
    if-gez v0, :cond_9

    .line 245
    .line 246
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->y:F

    .line 251
    .line 252
    cmpg-float v0, v0, v1

    .line 253
    .line 254
    if-gez v0, :cond_9

    .line 255
    .line 256
    move v0, v4

    .line 257
    goto :goto_2

    .line 258
    :cond_9
    move v0, v2

    .line 259
    :goto_2
    iput-boolean v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->I:Z

    .line 260
    .line 261
    iget-boolean v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->H:Z

    .line 262
    .line 263
    if-nez v1, :cond_b

    .line 264
    .line 265
    if-eqz v0, :cond_a

    .line 266
    .line 267
    goto :goto_3

    .line 268
    :cond_a
    move v0, v2

    .line 269
    goto :goto_4

    .line 270
    :cond_b
    :goto_3
    move v0, v4

    .line 271
    :goto_4
    iput-boolean v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->G:Z

    .line 272
    .line 273
    if-nez v0, :cond_e

    .line 274
    .line 275
    iput-boolean v4, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->J:Z

    .line 276
    .line 277
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 278
    .line 279
    .line 280
    move-result v0

    .line 281
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->y:F

    .line 282
    .line 283
    sub-float/2addr v0, v1

    .line 284
    cmpl-float v1, v0, v3

    .line 285
    .line 286
    if-lez v1, :cond_c

    .line 287
    .line 288
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->E:I

    .line 289
    .line 290
    int-to-float v1, v1

    .line 291
    sub-float v1, v0, v1

    .line 292
    .line 293
    goto :goto_5

    .line 294
    :cond_c
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->E:I

    .line 295
    .line 296
    int-to-float v1, v1

    .line 297
    add-float/2addr v1, v0

    .line 298
    :goto_5
    float-to-int v1, v1

    .line 299
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 300
    .line 301
    .line 302
    move-result v0

    .line 303
    iget v3, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->E:I

    .line 304
    .line 305
    int-to-float v3, v3

    .line 306
    cmpg-float v0, v0, v3

    .line 307
    .line 308
    if-gez v0, :cond_d

    .line 309
    .line 310
    move v1, v2

    .line 311
    :cond_d
    neg-int v0, v1

    .line 312
    invoke-virtual {p0, v2, v0}, Landroid/widget/FrameLayout;->scrollBy(II)V

    .line 313
    .line 314
    .line 315
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->i:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 316
    .line 317
    if-eqz v0, :cond_e

    .line 318
    .line 319
    invoke-virtual {v0, v4, v4, v6, v7}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->d(ZZJ)V

    .line 320
    .line 321
    .line 322
    :cond_e
    :goto_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    iput v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->z:F

    .line 327
    .line 328
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 329
    .line 330
    .line 331
    move-result v0

    .line 332
    iput v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->A:F

    .line 333
    .line 334
    goto/16 :goto_f

    .line 335
    .line 336
    :cond_f
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 337
    .line 338
    .line 339
    move-result v0

    .line 340
    const/4 v1, 0x3

    .line 341
    if-eq v0, v1, :cond_10

    .line 342
    .line 343
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 344
    .line 345
    .line 346
    move-result v0

    .line 347
    if-ne v0, v4, :cond_1c

    .line 348
    .line 349
    :cond_10
    iput-boolean v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->L:Z

    .line 350
    .line 351
    iget-boolean v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->J:Z

    .line 352
    .line 353
    if-eqz v0, :cond_1a

    .line 354
    .line 355
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->O:Landroid/view/VelocityTracker;

    .line 356
    .line 357
    const/16 v1, 0x3e8

    .line 358
    .line 359
    iget v5, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->M:F

    .line 360
    .line 361
    invoke-virtual {v0, v1, v5}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 362
    .line 363
    .line 364
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 365
    .line 366
    .line 367
    move-result v0

    .line 368
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->y:F

    .line 369
    .line 370
    sub-float/2addr v0, v1

    .line 371
    iget-object v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->O:Landroid/view/VelocityTracker;

    .line 372
    .line 373
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 374
    .line 375
    .line 376
    move-result v1

    .line 377
    float-to-int v1, v1

    .line 378
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 379
    .line 380
    .line 381
    move-result v5

    .line 382
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 383
    .line 384
    .line 385
    move-result v9

    .line 386
    int-to-float v9, v9

    .line 387
    const/high16 v10, 0x3f000000    # 0.5f

    .line 388
    .line 389
    mul-float/2addr v9, v10

    .line 390
    cmpl-float v5, v5, v9

    .line 391
    .line 392
    if-lez v5, :cond_11

    .line 393
    .line 394
    move v5, v4

    .line 395
    goto :goto_7

    .line 396
    :cond_11
    move v5, v2

    .line 397
    :goto_7
    iget v9, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->C:F

    .line 398
    .line 399
    iget v10, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->E:I

    .line 400
    .line 401
    int-to-float v10, v10

    .line 402
    cmpl-float v9, v9, v10

    .line 403
    .line 404
    if-lez v9, :cond_12

    .line 405
    .line 406
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 407
    .line 408
    .line 409
    move-result v9

    .line 410
    iget v10, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->N:I

    .line 411
    .line 412
    if-le v9, v10, :cond_12

    .line 413
    .line 414
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 415
    .line 416
    .line 417
    move-result v9

    .line 418
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 419
    .line 420
    .line 421
    move-result v10

    .line 422
    int-to-float v10, v10

    .line 423
    const v11, 0x3e19999a    # 0.15f

    .line 424
    .line 425
    .line 426
    mul-float/2addr v10, v11

    .line 427
    cmpl-float v9, v9, v10

    .line 428
    .line 429
    if-lez v9, :cond_12

    .line 430
    .line 431
    move v9, v4

    .line 432
    goto :goto_8

    .line 433
    :cond_12
    move v9, v2

    .line 434
    :goto_8
    if-eqz v5, :cond_13

    .line 435
    .line 436
    if-eqz v9, :cond_13

    .line 437
    .line 438
    int-to-float v1, v1

    .line 439
    mul-float/2addr v1, v8

    .line 440
    iget v10, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->N:I

    .line 441
    .line 442
    int-to-float v10, v10

    .line 443
    div-float/2addr v1, v10

    .line 444
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 445
    .line 446
    .line 447
    move-result v1

    .line 448
    const/high16 v10, 0x40a00000    # 5.0f

    .line 449
    .line 450
    cmpl-float v1, v1, v10

    .line 451
    .line 452
    if-lez v1, :cond_13

    .line 453
    .line 454
    move v1, v4

    .line 455
    goto :goto_9

    .line 456
    :cond_13
    move v1, v2

    .line 457
    :goto_9
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 458
    .line 459
    .line 460
    move-result v10

    .line 461
    int-to-float v10, v10

    .line 462
    mul-float/2addr v10, v8

    .line 463
    iget v11, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 464
    .line 465
    int-to-float v11, v11

    .line 466
    div-float/2addr v10, v11

    .line 467
    iget v11, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v:I

    .line 468
    .line 469
    if-nez v5, :cond_16

    .line 470
    .line 471
    if-eqz v9, :cond_14

    .line 472
    .line 473
    goto :goto_b

    .line 474
    :cond_14
    iget-boolean v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->F:Z

    .line 475
    .line 476
    if-nez v0, :cond_19

    .line 477
    .line 478
    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    .line 479
    .line 480
    .line 481
    move-result v0

    .line 482
    float-to-int v3, v10

    .line 483
    sub-int/2addr v0, v3

    .line 484
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 485
    .line 486
    .line 487
    move-result v0

    .line 488
    if-ge v0, v4, :cond_15

    .line 489
    .line 490
    move v11, v3

    .line 491
    goto :goto_d

    .line 492
    :cond_15
    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    .line 493
    .line 494
    .line 495
    move-result v0

    .line 496
    :goto_a
    move v11, v0

    .line 497
    goto :goto_d

    .line 498
    :cond_16
    :goto_b
    cmpl-float v0, v0, v3

    .line 499
    .line 500
    if-lez v0, :cond_18

    .line 501
    .line 502
    float-to-int v0, v10

    .line 503
    invoke-direct {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v()Z

    .line 504
    .line 505
    .line 506
    move-result v5

    .line 507
    if-eqz v5, :cond_17

    .line 508
    .line 509
    cmpg-float v3, v10, v3

    .line 510
    .line 511
    if-gez v3, :cond_17

    .line 512
    .line 513
    const/4 v3, -0x1

    .line 514
    goto :goto_c

    .line 515
    :cond_17
    move v3, v2

    .line 516
    :goto_c
    add-int/2addr v0, v3

    .line 517
    goto :goto_a

    .line 518
    :cond_18
    add-float/2addr v10, v8

    .line 519
    float-to-int v0, v10

    .line 520
    goto :goto_a

    .line 521
    :cond_19
    :goto_d
    invoke-virtual {p0, v11, v2, v1}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->z(IZZ)V

    .line 522
    .line 523
    .line 524
    :cond_1a
    invoke-direct {p0, p0, v2}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t(Landroid/view/View;Z)V

    .line 525
    .line 526
    .line 527
    invoke-direct {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->x()V

    .line 528
    .line 529
    .line 530
    iget v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 531
    .line 532
    if-lez v0, :cond_1b

    .line 533
    .line 534
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 535
    .line 536
    .line 537
    move-result v0

    .line 538
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 539
    .line 540
    rem-int/2addr v0, v1

    .line 541
    if-nez v0, :cond_1b

    .line 542
    .line 543
    move v0, v4

    .line 544
    goto :goto_e

    .line 545
    :cond_1b
    move v0, v2

    .line 546
    :goto_e
    iget-object v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t:Landroid/animation/ValueAnimator;

    .line 547
    .line 548
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 549
    .line 550
    .line 551
    move-result v1

    .line 552
    if-nez v1, :cond_1c

    .line 553
    .line 554
    iget-boolean v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->L:Z

    .line 555
    .line 556
    if-nez v1, :cond_1c

    .line 557
    .line 558
    if-eqz v0, :cond_1c

    .line 559
    .line 560
    iget-object v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->i:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 561
    .line 562
    if-eqz v1, :cond_1c

    .line 563
    .line 564
    invoke-virtual {v1}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->f()Z

    .line 565
    .line 566
    .line 567
    move-result v1

    .line 568
    if-eqz v1, :cond_1c

    .line 569
    .line 570
    new-instance v1, Ljava/lang/StringBuilder;

    .line 571
    .line 572
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 573
    .line 574
    .line 575
    const-string v3, "dispatchTouchEvent doBgScaleAnim action="

    .line 576
    .line 577
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 578
    .line 579
    .line 580
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 581
    .line 582
    .line 583
    move-result v3

    .line 584
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 585
    .line 586
    .line 587
    const-string v3, " x="

    .line 588
    .line 589
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 590
    .line 591
    .line 592
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 593
    .line 594
    .line 595
    move-result v3

    .line 596
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 597
    .line 598
    .line 599
    const-string v3, " y="

    .line 600
    .line 601
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 602
    .line 603
    .line 604
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 605
    .line 606
    .line 607
    move-result v3

    .line 608
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 609
    .line 610
    .line 611
    const-string v3, " getScrollY="

    .line 612
    .line 613
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 614
    .line 615
    .line 616
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 617
    .line 618
    .line 619
    move-result v3

    .line 620
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 621
    .line 622
    .line 623
    const-string v3, " isRunning="

    .line 624
    .line 625
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 626
    .line 627
    .line 628
    iget-object v3, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t:Landroid/animation/ValueAnimator;

    .line 629
    .line 630
    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 631
    .line 632
    .line 633
    move-result v3

    .line 634
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 635
    .line 636
    .line 637
    const-string v3, " mIsTouching="

    .line 638
    .line 639
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 640
    .line 641
    .line 642
    iget-boolean v3, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->L:Z

    .line 643
    .line 644
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 645
    .line 646
    .line 647
    const-string v3, " mPageHeight="

    .line 648
    .line 649
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 650
    .line 651
    .line 652
    iget v3, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 653
    .line 654
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 655
    .line 656
    .line 657
    const-string v3, " justPage="

    .line 658
    .line 659
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 660
    .line 661
    .line 662
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 663
    .line 664
    .line 665
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 666
    .line 667
    .line 668
    move-result-object v0

    .line 669
    const-string v1, "GroupWidgetContainer"

    .line 670
    .line 671
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 672
    .line 673
    .line 674
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->i:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 675
    .line 676
    invoke-virtual {v0, v2, v4, v6, v7}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->d(ZZJ)V

    .line 677
    .line 678
    .line 679
    :cond_1c
    :goto_f
    iget-boolean v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->G:Z

    .line 680
    .line 681
    if-eqz v0, :cond_1d

    .line 682
    .line 683
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 684
    .line 685
    .line 686
    move-result-object v0

    .line 687
    invoke-interface {v0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 688
    .line 689
    .line 690
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 691
    .line 692
    .line 693
    move-result p0

    .line 694
    return p0

    .line 695
    :cond_1d
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 696
    .line 697
    .line 698
    move-result-object v0

    .line 699
    iget-boolean v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->J:Z

    .line 700
    .line 701
    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 702
    .line 703
    .line 704
    iget-boolean v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->J:Z

    .line 705
    .line 706
    if-eqz v0, :cond_1e

    .line 707
    .line 708
    return v4

    .line 709
    :cond_1e
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 710
    .line 711
    .line 712
    move-result p0

    .line 713
    return p0

    .line 714
    :cond_1f
    :goto_10
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 715
    .line 716
    .line 717
    move-result-object v0

    .line 718
    invoke-interface {v0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 719
    .line 720
    .line 721
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 722
    .line 723
    .line 724
    move-result p0

    .line 725
    return p0
.end method

.method public getPageViewChildCount()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getPageViewCurrentPageIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public getPageViewNormalChildWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 2
    .line 3
    return p0
.end method

.method public getPageViewPageCount()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getPageViewScrollX()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public o()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->F:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->J:Z

    .line 14
    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    return v1

    .line 18
    :cond_1
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/widget/group/d;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/android/launcher3/widget/group/d;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$a;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer$a;-><init>(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->n:Landroid/view/ViewOutlineProvider;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->o()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    return v1

    .line 22
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method protected onLayout(ZIIII)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    const/4 p3, 0x0

    .line 20
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 21
    .line 22
    .line 23
    move-result p4

    .line 24
    if-ge p3, p4, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p4

    .line 30
    new-instance p5, Landroid/graphics/Rect;

    .line 31
    .line 32
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredWidth()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    add-int/2addr v0, p1

    .line 37
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredHeight()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    add-int/2addr v1, p2

    .line 42
    invoke-direct {p5, p1, p2, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 43
    .line 44
    .line 45
    iget p2, p5, Landroid/graphics/Rect;->left:I

    .line 46
    .line 47
    iget v0, p5, Landroid/graphics/Rect;->top:I

    .line 48
    .line 49
    iget v1, p5, Landroid/graphics/Rect;->right:I

    .line 50
    .line 51
    iget v2, p5, Landroid/graphics/Rect;->bottom:I

    .line 52
    .line 53
    invoke-virtual {p4, p2, v0, v1, v2}, Landroid/view/View;->layout(IIII)V

    .line 54
    .line 55
    .line 56
    iget p2, p5, Landroid/graphics/Rect;->bottom:I

    .line 57
    .line 58
    iget p4, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->q:I

    .line 59
    .line 60
    add-int/2addr p2, p4

    .line 61
    add-int/lit8 p3, p3, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    return-void
.end method

.method protected onMeasure(II)V
    .locals 4

    .line 1
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->s:I

    .line 6
    .line 7
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->q:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    iput v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-gtz v0, :cond_0

    .line 17
    .line 18
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-lez v0, :cond_2

    .line 31
    .line 32
    if-lez v1, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    sub-int p1, v0, p1

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingRight()I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    sub-int/2addr p1, p2

    .line 45
    const/high16 p2, 0x40000000    # 2.0f

    .line 46
    .line 47
    invoke-static {p1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    sub-int v2, v1, v2

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingBottom()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    sub-int/2addr v2, v3

    .line 62
    invoke-static {v2, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    const/4 v2, 0x0

    .line 67
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-ge v2, v3, :cond_1

    .line 72
    .line 73
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v3, p1, p2}, Landroid/view/View;->measure(II)V

    .line 78
    .line 79
    .line 80
    add-int/lit8 v2, v2, 0x1

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    invoke-virtual {p0, v0, v1}, Landroid/widget/FrameLayout;->setMeasuredDimension(II)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method protected onScrollChanged(IIII)V
    .locals 11

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->onScrollChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 5
    .line 6
    const-string p3, " oldt="

    .line 7
    .line 8
    const-string v0, "GroupWidgetContainer"

    .line 9
    .line 10
    if-gtz p1, :cond_0

    .line 11
    .line 12
    new-instance p0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string p1, "onScrollChanged mPageHeight 0 return, t="

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->p:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 40
    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->o:I

    .line 44
    .line 45
    if-eq v1, p1, :cond_1

    .line 46
    .line 47
    iput p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->o:I

    .line 48
    .line 49
    :cond_1
    int-to-float v1, p4

    .line 50
    const/high16 v2, 0x3f800000    # 1.0f

    .line 51
    .line 52
    mul-float/2addr v1, v2

    .line 53
    int-to-float v3, p1

    .line 54
    div-float/2addr v1, v3

    .line 55
    int-to-float v3, p2

    .line 56
    mul-float/2addr v3, v2

    .line 57
    int-to-float v4, p1

    .line 58
    div-float v4, v3, v4

    .line 59
    .line 60
    div-int v5, p4, p1

    .line 61
    .line 62
    div-int v6, p2, p1

    .line 63
    .line 64
    const/4 v7, 0x1

    .line 65
    const/4 v8, 0x0

    .line 66
    if-lez p4, :cond_2

    .line 67
    .line 68
    if-ltz p2, :cond_3

    .line 69
    .line 70
    :cond_2
    if-gez p4, :cond_4

    .line 71
    .line 72
    if-lez p2, :cond_4

    .line 73
    .line 74
    :cond_3
    move v9, v7

    .line 75
    goto :goto_0

    .line 76
    :cond_4
    move v9, v8

    .line 77
    :goto_0
    rem-int v10, p2, p1

    .line 78
    .line 79
    if-nez v10, :cond_5

    .line 80
    .line 81
    div-int p1, p2, p1

    .line 82
    .line 83
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    goto :goto_1

    .line 88
    :cond_5
    rem-int v10, p4, p1

    .line 89
    .line 90
    if-eqz v10, :cond_7

    .line 91
    .line 92
    if-ne v5, v6, :cond_6

    .line 93
    .line 94
    if-eqz v9, :cond_7

    .line 95
    .line 96
    :cond_6
    int-to-float p1, p1

    .line 97
    div-float/2addr v3, p1

    .line 98
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->q(I)I

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    goto :goto_1

    .line 111
    :cond_7
    const/4 p1, 0x0

    .line 112
    :goto_1
    if-eqz p1, :cond_9

    .line 113
    .line 114
    iget v3, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v:I

    .line 115
    .line 116
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    if-eq v3, v5, :cond_9

    .line 121
    .line 122
    new-instance v3, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 125
    .line 126
    .line 127
    const-string v5, "onScrollChanged onPageSelected new="

    .line 128
    .line 129
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const-string v5, " old="

    .line 136
    .line 137
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    iget v5, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v:I

    .line 141
    .line 142
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    const-string v5, " pro="

    .line 146
    .line 147
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v5, " oldPro="

    .line 154
    .line 155
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    .line 167
    .line 168
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    iput p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v:I

    .line 173
    .line 174
    iget-object v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->x:Landroidx/viewpager/widget/ViewPager$j;

    .line 175
    .line 176
    if-eqz v1, :cond_8

    .line 177
    .line 178
    invoke-interface {v1, p1}, Landroidx/viewpager/widget/ViewPager$j;->c(I)V

    .line 179
    .line 180
    .line 181
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->x:Landroidx/viewpager/widget/ViewPager$j;

    .line 182
    .line 183
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v:I

    .line 184
    .line 185
    const/4 v3, 0x0

    .line 186
    invoke-interface {p1, v1, v3, v8}, Landroidx/viewpager/widget/ViewPager$j;->a(IFI)V

    .line 187
    .line 188
    .line 189
    :cond_8
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->p:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 190
    .line 191
    if-eqz p1, :cond_9

    .line 192
    .line 193
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 194
    .line 195
    .line 196
    move-result p1

    .line 197
    if-le p1, v7, :cond_9

    .line 198
    .line 199
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->p:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 200
    .line 201
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v:I

    .line 202
    .line 203
    invoke-virtual {p1, v1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->setActiveMarker(I)V

    .line 204
    .line 205
    .line 206
    :cond_9
    invoke-direct {p0, v8}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->A(Z)V

    .line 207
    .line 208
    .line 209
    iget p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 210
    .line 211
    rem-int v1, p2, p1

    .line 212
    .line 213
    if-nez v1, :cond_a

    .line 214
    .line 215
    div-int p1, p2, p1

    .line 216
    .line 217
    new-instance v1, Ljava/lang/StringBuilder;

    .line 218
    .line 219
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 220
    .line 221
    .line 222
    const-string v3, "onScrollChanged t="

    .line 223
    .line 224
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    const-string p2, " curIndex="

    .line 237
    .line 238
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    const-string p1, " mCurrentPageIndex="

    .line 245
    .line 246
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    iget p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v:I

    .line 250
    .line 251
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object p1

    .line 258
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    .line 260
    .line 261
    :goto_2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 262
    .line 263
    .line 264
    move-result p1

    .line 265
    if-ge v8, p1, :cond_13

    .line 266
    .line 267
    invoke-virtual {p0, v8}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    invoke-virtual {p1, v2}, Landroid/view/View;->setScaleX(F)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {p1, v2}, Landroid/view/View;->setScaleY(F)V

    .line 275
    .line 276
    .line 277
    add-int/lit8 v8, v8, 0x1

    .line 278
    .line 279
    goto :goto_2

    .line 280
    :cond_a
    div-int p3, p2, p1

    .line 281
    .line 282
    mul-int p4, p3, p1

    .line 283
    .line 284
    sub-int/2addr p2, p4

    .line 285
    int-to-float p4, p2

    .line 286
    mul-float/2addr p4, v2

    .line 287
    int-to-float p1, p1

    .line 288
    div-float/2addr p4, p1

    .line 289
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->x:Landroidx/viewpager/widget/ViewPager$j;

    .line 290
    .line 291
    if-eqz p1, :cond_b

    .line 292
    .line 293
    invoke-interface {p1, p3, p4, p2}, Landroidx/viewpager/widget/ViewPager$j;->a(IFI)V

    .line 294
    .line 295
    .line 296
    :cond_b
    invoke-direct {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->getSlideTopBottomChildIndex()Landroid/graphics/Point;

    .line 297
    .line 298
    .line 299
    move-result-object p1

    .line 300
    iget p1, p1, Landroid/graphics/Point;->x:I

    .line 301
    .line 302
    invoke-direct {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->getSlideTopBottomChildIndex()Landroid/graphics/Point;

    .line 303
    .line 304
    .line 305
    move-result-object p2

    .line 306
    iget p2, p2, Landroid/graphics/Point;->y:I

    .line 307
    .line 308
    iget p3, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v:I

    .line 309
    .line 310
    int-to-float p3, p3

    .line 311
    sub-float/2addr p3, v4

    .line 312
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 313
    .line 314
    .line 315
    move-result p3

    .line 316
    invoke-static {p3, v2}, Ljava/lang/Math;->min(FF)F

    .line 317
    .line 318
    .line 319
    move-result p3

    .line 320
    move p4, v8

    .line 321
    :goto_3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 322
    .line 323
    .line 324
    move-result v0

    .line 325
    if-ge p4, v0, :cond_13

    .line 326
    .line 327
    invoke-virtual {p0, p4}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    iget-object v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->u:Landroid/view/View;

    .line 332
    .line 333
    if-ne v0, v1, :cond_c

    .line 334
    .line 335
    goto :goto_7

    .line 336
    :cond_c
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v:I

    .line 337
    .line 338
    if-ne v1, p4, :cond_d

    .line 339
    .line 340
    move v1, v7

    .line 341
    goto :goto_4

    .line 342
    :cond_d
    move v1, v8

    .line 343
    :goto_4
    if-nez v1, :cond_f

    .line 344
    .line 345
    if-eq p4, p1, :cond_e

    .line 346
    .line 347
    if-ne p4, p2, :cond_f

    .line 348
    .line 349
    :cond_e
    move v3, v7

    .line 350
    goto :goto_5

    .line 351
    :cond_f
    move v3, v8

    .line 352
    :goto_5
    const v4, 0x3e199998    # 0.14999998f

    .line 353
    .line 354
    .line 355
    if-eqz v1, :cond_10

    .line 356
    .line 357
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 358
    .line 359
    .line 360
    move-result v1

    .line 361
    mul-float/2addr v1, v4

    .line 362
    sub-float v1, v2, v1

    .line 363
    .line 364
    goto :goto_6

    .line 365
    :cond_10
    if-eqz v3, :cond_11

    .line 366
    .line 367
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 368
    .line 369
    .line 370
    move-result v1

    .line 371
    mul-float/2addr v1, v4

    .line 372
    const v3, 0x3f59999a    # 0.85f

    .line 373
    .line 374
    .line 375
    add-float/2addr v1, v3

    .line 376
    goto :goto_6

    .line 377
    :cond_11
    move v1, v2

    .line 378
    :goto_6
    iget-boolean v3, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->j:Z

    .line 379
    .line 380
    if-eqz v3, :cond_12

    .line 381
    .line 382
    move v1, v2

    .line 383
    :cond_12
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 384
    .line 385
    .line 386
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 387
    .line 388
    .line 389
    :goto_7
    add-int/lit8 p4, p4, 0x1

    .line 390
    .line 391
    goto :goto_3

    .line 392
    :cond_13
    return-void
.end method

.method public onViewAdded(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onViewAdded(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->getGroupWidgetHostViewTag()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, "onViewAdded getChildCount="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "GroupWidgetContainer"

    .line 33
    .line 34
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->p:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 42
    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    sget-object v1, Lcom/android/launcher3/pageindicators/b;->k:Lcom/android/launcher3/pageindicators/b;

    .line 46
    .line 47
    invoke-virtual {v0, p1, v1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->f(ILcom/android/launcher3/pageindicators/b;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->p:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->x()V

    .line 53
    .line 54
    .line 55
    iget-boolean p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->j:Z

    .line 56
    .line 57
    if-eqz p1, :cond_0

    .line 58
    .line 59
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->p:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 60
    .line 61
    const/4 v0, 0x4

    .line 62
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 63
    .line 64
    .line 65
    :cond_0
    const/4 p1, 0x1

    .line 66
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->A(Z)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public onViewRemoved(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onViewRemoved(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->getGroupWidgetHostViewTag()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v1, "onViewRemoved getChildCount="

    .line 21
    .line 22
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const-string v1, "GroupWidgetContainer"

    .line 37
    .line 38
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->p:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 42
    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->q(I)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->p:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->x()V

    .line 51
    .line 52
    .line 53
    iget-boolean p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->j:Z

    .line 54
    .line 55
    if-eqz p1, :cond_0

    .line 56
    .line 57
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->p:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 58
    .line 59
    const/4 v0, 0x4

    .line 60
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 61
    .line 62
    .line 63
    :cond_0
    const/4 p1, 0x1

    .line 64
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->A(Z)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method protected s()V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "checkScrollIfNeed getChildCount="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, " getScrollY="

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, " mPageHeight="

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v2, " mIsTouching="

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-boolean v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->L:Z

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v2, " isRunning="

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget-object v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t:Landroid/animation/ValueAnimator;

    .line 56
    .line 57
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-string v2, "GroupWidgetContainer"

    .line 69
    .line 70
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    iget-boolean v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->L:Z

    .line 74
    .line 75
    if-nez v0, :cond_1

    .line 76
    .line 77
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->t:Landroid/animation/ValueAnimator;

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_1

    .line 84
    .line 85
    iget v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 86
    .line 87
    if-lez v0, :cond_1

    .line 88
    .line 89
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-gtz v0, :cond_0

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    add-int/lit8 v3, v3, -0x1

    .line 105
    .line 106
    iget v4, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 107
    .line 108
    mul-int/2addr v3, v4

    .line 109
    if-le v0, v3, :cond_1

    .line 110
    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    const-string v3, "checkScrollIfNeed force scroll to top, old getScrollY="

    .line 117
    .line 118
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    const-string v3, " getChildCount()="

    .line 129
    .line 130
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    iget v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    const/4 v1, 0x0

    .line 160
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->scrollTo(II)V

    .line 161
    .line 162
    .line 163
    :cond_1
    :goto_0
    return-void
.end method

.method public scrollTo(II)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r(I)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->scrollTo(II)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->p:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->s()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method protected setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->x:Landroidx/viewpager/widget/ViewPager$j;

    .line 2
    .line 3
    return-void
.end method

.method protected setPageIndicator(Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->p:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->g(Landroid/view/ViewGroup;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-le p0, v0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public w()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->L:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public y(Lcom/android/launcher3/widget/group/f;Ljava/lang/String;Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->g:Lcom/android/launcher3/widget/group/f;

    .line 2
    .line 3
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p2, ""

    .line 11
    .line 12
    :goto_0
    iput-object p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->h:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p3, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->i:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 15
    .line 16
    const/4 p2, 0x0

    .line 17
    const/4 p3, 0x1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-interface {p1}, Lcom/android/launcher3/widget/group/f;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->D(Landroid/appwidget/AppWidgetProviderInfo;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    move p1, p3

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    move p1, p2

    .line 33
    :goto_1
    iput-boolean p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->j:Z

    .line 34
    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->i:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 38
    .line 39
    invoke-virtual {p1, p3}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->e(Z)V

    .line 40
    .line 41
    .line 42
    iput p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->q:I

    .line 43
    .line 44
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->p:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 45
    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    const/4 p1, 0x4

    .line 49
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 50
    .line 51
    .line 52
    :cond_2
    return-void
.end method

.method protected z(IZZ)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, " getScrollY="

    .line 6
    .line 7
    const-string v2, " toY="

    .line 8
    .line 9
    const-string v3, "GroupWidgetContainer"

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    const/4 v5, 0x1

    .line 13
    if-gt v0, v5, :cond_0

    .line 14
    .line 15
    new-instance p2, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string p3, "snapToPage child count <= 1, getChildCount="

    .line 21
    .line 22
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string p3, " toIndex="

    .line 33
    .line 34
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {v3, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    invoke-direct {p0, v4, v4, v4}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->n(IZZ)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    const/4 v4, -0x1

    .line 74
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->v()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_2

    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    goto :goto_0

    .line 85
    :cond_2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    sub-int/2addr v0, v5

    .line 90
    :goto_0
    if-lt p1, v4, :cond_5

    .line 91
    .line 92
    if-le p1, v0, :cond_3

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_3
    iget v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->r:I

    .line 96
    .line 97
    mul-int/2addr v0, p1

    .line 98
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    if-ne v0, v4, :cond_4

    .line 103
    .line 104
    new-instance p2, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .line 108
    .line 109
    const-string p3, "snapToPage ignore, toIndex="

    .line 110
    .line 111
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-static {v3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_4
    new-instance v4, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 144
    .line 145
    .line 146
    const-string v5, "snapToPage toIndex="

    .line 147
    .line 148
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    .line 176
    .line 177
    invoke-direct {p0, v0, p2, p3}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->n(IZZ)V

    .line 178
    .line 179
    .line 180
    return-void

    .line 181
    :cond_5
    :goto_1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 182
    .line 183
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 184
    .line 185
    .line 186
    const-string p3, "snapToPage toIndex error, toIndex="

    .line 187
    .line 188
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    const-string p1, " getChildCount="

    .line 195
    .line 196
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 200
    .line 201
    .line 202
    move-result p0

    .line 203
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    const-string p0, " minIndex="

    .line 207
    .line 208
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    const-string p0, " maxIndex="

    .line 215
    .line 216
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    .line 228
    .line 229
    return-void
.end method
