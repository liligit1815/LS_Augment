.class public final Lcom/android/quickstep/views/FloatingWidgetBackgroundView;
.super Landroid/view/View;
.source "FloatingWidgetBackgroundView.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x1f
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;
    }
.end annotation


# instance fields
.field private final mBackgroundProperties:Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;

.field private final mFallbackDrawable:Landroid/graphics/drawable/ColorDrawable;

.field private mFinalRadius:F

.field private final mForegroundProperties:Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;

.field private mInitialOutlineRadius:F

.field private mIsUsingFallback:Z

.field private mOriginalBackground:Landroid/graphics/drawable/Drawable;

.field private mOriginalForeground:Landroid/graphics/drawable/Drawable;

.field private mOutlineRadius:F

.field private mSourceView:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/drawable/ColorDrawable;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/drawable/ColorDrawable;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mFallbackDrawable:Landroid/graphics/drawable/ColorDrawable;

    .line 10
    .line 11
    new-instance p1, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;

    .line 12
    .line 13
    const/4 p2, 0x0

    .line 14
    invoke-direct {p1, p2}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;-><init>(Lcom/android/quickstep/views/j;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mForegroundProperties:Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;

    .line 18
    .line 19
    new-instance p1, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;

    .line 20
    .line 21
    invoke-direct {p1, p2}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;-><init>(Lcom/android/quickstep/views/j;)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mBackgroundProperties:Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;

    .line 25
    .line 26
    new-instance p1, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$1;

    .line 27
    .line 28
    invoke-direct {p1, p0}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$1;-><init>(Lcom/android/quickstep/views/FloatingWidgetBackgroundView;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic a([FI)D
    .locals 0

    .line 1
    aget p0, p0, p1

    .line 2
    .line 3
    float-to-double p0, p0

    .line 4
    return-wide p0
.end method

.method static bridge synthetic b(Lcom/android/quickstep/views/FloatingWidgetBackgroundView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mOutlineRadius:F

    .line 2
    .line 3
    return p0
.end method

.method private static getMaxRadius(Landroid/graphics/drawable/Drawable;)F
    .locals 5

    .line 1
    instance-of v0, p0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    check-cast p0, Landroid/graphics/drawable/GradientDrawable;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/graphics/drawable/GradientDrawable;->getCornerRadii()[F

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Landroid/graphics/drawable/GradientDrawable;->getCornerRadius()F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const-wide/16 v1, 0x0

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 v3, 0x0

    .line 23
    array-length v4, v0

    .line 24
    invoke-static {v3, v4}, Ljava/util/stream/IntStream;->range(II)Ljava/util/stream/IntStream;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    new-instance v4, Lcom/android/quickstep/views/i;

    .line 29
    .line 30
    invoke-direct {v4, v0}, Lcom/android/quickstep/views/i;-><init>([F)V

    .line 31
    .line 32
    .line 33
    invoke-interface {v3, v4}, Ljava/util/stream/IntStream;->mapToDouble(Ljava/util/function/IntToDoubleFunction;)Ljava/util/stream/DoubleStream;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-interface {v0}, Ljava/util/stream/DoubleStream;->max()Ljava/util/OptionalDouble;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0, v1, v2}, Ljava/util/OptionalDouble;->orElse(D)D

    .line 42
    .line 43
    .line 44
    move-result-wide v1

    .line 45
    :goto_0
    double-to-float v0, v1

    .line 46
    invoke-static {p0, v0}, Ljava/lang/Math;->max(FF)F

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0
.end method

.method private static getOutlineRadius(Lcom/android/launcher3/widget/T;Landroid/view/View;)F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->t()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p1}, Landroid/view/View;->getClipToOutline()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getOutlineProvider()Landroid/view/ViewOutlineProvider;

    move-result-object p0

    instance-of p0, p0, Landroid/widget/RemoteViews$RemoteViewOutlineProvider;

    if-eqz p0, :cond_1

    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getClipToOutline()Z

    move-result p0

    if-eqz p0, :cond_1

    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getOutlineProvider()Landroid/view/ViewOutlineProvider;

    move-result-object p0

    check-cast p0, Landroid/widget/RemoteViews$RemoteViewOutlineProvider;

    invoke-virtual {p0}, Landroid/widget/RemoteViews$RemoteViewOutlineProvider;->getRadius()F

    move-result p0

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0

    .line 5
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->getEnforcedCornerRadius()F

    move-result p0

    return p0
.end method

.method public static isSupportedDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1

    .line 1
    instance-of v0, p0, Landroid/graphics/drawable/ColorDrawable;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    instance-of v0, p0, Landroid/graphics/drawable/GradientDrawable;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Landroid/graphics/drawable/GradientDrawable;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/graphics/drawable/GradientDrawable;->getShape()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method private isUninitialized()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mSourceView:Landroid/view/View;

    .line 2
    .line 3
    if-nez p0, :cond_0

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


# virtual methods
.method finish()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->isUninitialized()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mOriginalForeground:Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mSourceView:Landroid/view/View;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mOriginalBackground:Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mSourceView:Landroid/view/View;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    :cond_2
    :goto_0
    return-void
.end method

.method getMaximumRadius()F
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->isUninitialized()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget v0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mInitialOutlineRadius:F

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mOriginalForeground:Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->getMaxRadius(Landroid/graphics/drawable/Drawable;)F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mOriginalBackground:Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->getMaxRadius(Landroid/graphics/drawable/Drawable;)F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-static {v1, p0}, Ljava/lang/Math;->max(FF)F

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-static {v0, p0}, Ljava/lang/Math;->max(FF)F

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public getOutlineRadius()F
    .locals 0

    .line 6
    iget p0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mOutlineRadius:F

    return p0
.end method

.method init(Lcom/android/launcher3/widget/T;Landroid/view/View;FI)V
    .locals 1

    .line 1
    iput p3, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mFinalRadius:F

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mSourceView:Landroid/view/View;

    .line 4
    .line 5
    invoke-static {p1, p2}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->getOutlineRadius(Lcom/android/launcher3/widget/T;Landroid/view/View;)F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput p1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mInitialOutlineRadius:F

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mIsUsingFallback:Z

    .line 13
    .line 14
    invoke-virtual {p2}, Landroid/view/View;->getForeground()Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-static {p3}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->isSupportedDrawable(Landroid/graphics/drawable/Drawable;)Z

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    if-eqz p3, :cond_1

    .line 23
    .line 24
    const p3, 0x7f0b0504

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2, p3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p2}, Landroid/view/View;->getForeground()Landroid/graphics/drawable/Drawable;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mOriginalForeground:Landroid/graphics/drawable/Drawable;

    .line 38
    .line 39
    invoke-virtual {p2, p3, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-virtual {p2, p3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    check-cast p3, Landroid/graphics/drawable/Drawable;

    .line 48
    .line 49
    iput-object p3, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mOriginalForeground:Landroid/graphics/drawable/Drawable;

    .line 50
    .line 51
    :goto_0
    iget-object p3, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mForegroundProperties:Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;

    .line 52
    .line 53
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mOriginalForeground:Landroid/graphics/drawable/Drawable;

    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p3, v0}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;->init(Landroid/graphics/drawable/Drawable;)V

    .line 68
    .line 69
    .line 70
    iget-object p3, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mForegroundProperties:Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;

    .line 71
    .line 72
    invoke-static {p3}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;->a(Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;)Landroid/graphics/drawable/Drawable;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    invoke-virtual {p0, p3}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 77
    .line 78
    .line 79
    iget-object p3, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mOriginalForeground:Landroid/graphics/drawable/Drawable;

    .line 80
    .line 81
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 82
    .line 83
    .line 84
    move-result-object p3

    .line 85
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 86
    .line 87
    .line 88
    move-result-object p3

    .line 89
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 90
    .line 91
    .line 92
    move-result-object p3

    .line 93
    invoke-virtual {p3, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mSourceView:Landroid/view/View;

    .line 97
    .line 98
    invoke-virtual {v0, p3}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 99
    .line 100
    .line 101
    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 102
    .line 103
    .line 104
    move-result-object p3

    .line 105
    invoke-static {p3}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->isSupportedDrawable(Landroid/graphics/drawable/Drawable;)Z

    .line 106
    .line 107
    .line 108
    move-result p3

    .line 109
    if-eqz p3, :cond_3

    .line 110
    .line 111
    const p3, 0x7f0b0503

    .line 112
    .line 113
    .line 114
    invoke-virtual {p2, p3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p4

    .line 118
    if-nez p4, :cond_2

    .line 119
    .line 120
    invoke-virtual {p2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 121
    .line 122
    .line 123
    move-result-object p4

    .line 124
    iput-object p4, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mOriginalBackground:Landroid/graphics/drawable/Drawable;

    .line 125
    .line 126
    invoke-virtual {p2, p3, p4}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_2
    invoke-virtual {p2, p3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    check-cast p2, Landroid/graphics/drawable/Drawable;

    .line 135
    .line 136
    iput-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mOriginalBackground:Landroid/graphics/drawable/Drawable;

    .line 137
    .line 138
    :goto_1
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mBackgroundProperties:Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;

    .line 139
    .line 140
    iget-object p3, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mOriginalBackground:Landroid/graphics/drawable/Drawable;

    .line 141
    .line 142
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 143
    .line 144
    .line 145
    move-result-object p3

    .line 146
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 147
    .line 148
    .line 149
    move-result-object p3

    .line 150
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 151
    .line 152
    .line 153
    move-result-object p3

    .line 154
    invoke-virtual {p2, p3}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;->init(Landroid/graphics/drawable/Drawable;)V

    .line 155
    .line 156
    .line 157
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mBackgroundProperties:Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;

    .line 158
    .line 159
    invoke-static {p2}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;->a(Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;)Landroid/graphics/drawable/Drawable;

    .line 160
    .line 161
    .line 162
    move-result-object p2

    .line 163
    invoke-virtual {p0, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 164
    .line 165
    .line 166
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mOriginalBackground:Landroid/graphics/drawable/Drawable;

    .line 167
    .line 168
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 177
    .line 178
    .line 179
    move-result-object p2

    .line 180
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 181
    .line 182
    .line 183
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mSourceView:Landroid/view/View;

    .line 184
    .line 185
    invoke-virtual {p0, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 186
    .line 187
    .line 188
    return-void

    .line 189
    :cond_3
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mOriginalForeground:Landroid/graphics/drawable/Drawable;

    .line 190
    .line 191
    if-nez p1, :cond_4

    .line 192
    .line 193
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mFallbackDrawable:Landroid/graphics/drawable/ColorDrawable;

    .line 194
    .line 195
    invoke-virtual {p1, p4}, Landroid/graphics/drawable/ColorDrawable;->setColor(I)V

    .line 196
    .line 197
    .line 198
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mFallbackDrawable:Landroid/graphics/drawable/ColorDrawable;

    .line 199
    .line 200
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 201
    .line 202
    .line 203
    const/4 p1, 0x0

    .line 204
    invoke-virtual {p0, p1}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 205
    .line 206
    .line 207
    const/4 p1, 0x1

    .line 208
    iput-boolean p1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mIsUsingFallback:Z

    .line 209
    .line 210
    :cond_4
    return-void
.end method

.method recycle()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mSourceView:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const v2, 0x7f0b0504

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, v2, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mSourceView:Landroid/view/View;

    .line 13
    .line 14
    const v2, 0x7f0b0503

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v2, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iput-object v1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mSourceView:Landroid/view/View;

    .line 21
    .line 22
    iput-object v1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mOriginalForeground:Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    iput-object v1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mOriginalBackground:Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput v0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mOutlineRadius:F

    .line 28
    .line 29
    iput v0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mFinalRadius:F

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method update(FF)V
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->isUninitialized()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput p1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mOutlineRadius:F

    .line 9
    .line 10
    iget v2, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mInitialOutlineRadius:F

    .line 11
    .line 12
    iget v3, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mFinalRadius:F

    .line 13
    .line 14
    const/high16 v5, 0x3f800000    # 1.0f

    .line 15
    .line 16
    sget-object v6, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    move v1, p1

    .line 20
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mForegroundProperties:Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;

    .line 25
    .line 26
    iget v1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mFinalRadius:F

    .line 27
    .line 28
    invoke-virtual {v0, v1, p1}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;->updateDrawable(FF)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mBackgroundProperties:Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;

    .line 32
    .line 33
    iget v1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mFinalRadius:F

    .line 34
    .line 35
    invoke-virtual {v0, v1, p1}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView$DrawableProperties;->updateDrawable(FF)V

    .line 36
    .line 37
    .line 38
    iget-boolean p1, p0, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->mIsUsingFallback:Z

    .line 39
    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const/high16 p2, 0x3f800000    # 1.0f

    .line 44
    .line 45
    :goto_0
    invoke-virtual {p0, p2}, Landroid/view/View;->setAlpha(F)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
