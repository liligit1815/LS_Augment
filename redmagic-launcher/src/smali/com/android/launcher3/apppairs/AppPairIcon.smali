.class public Lcom/android/launcher3/apppairs/AppPairIcon;
.super Landroid/widget/FrameLayout;
.source "AppPairIcon.java"

# interfaces
.implements Lcom/android/launcher3/dragndrop/y;
.implements Lcom/android/launcher3/G5;


# static fields
.field private static final m:Ljava/lang/Float;

.field private static final n:Ljava/lang/Float;

.field private static final o:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/apppairs/AppPairIcon;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private g:Lcom/android/launcher3/apppairs/AppPairIconGraphic;

.field private h:Lcom/android/launcher3/BubbleTextView;

.field private i:Lcom/android/launcher3/model/data/l;

.field private j:I

.field private final k:Lcom/android/launcher3/util/z1;

.field private l:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/android/launcher3/apppairs/AppPairIcon;->m:Ljava/lang/Float;

    .line 8
    .line 9
    const v0, 0x3f8ccccd    # 1.1f

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, Lcom/android/launcher3/apppairs/AppPairIcon;->n:Ljava/lang/Float;

    .line 17
    .line 18
    new-instance v0, Lcom/android/launcher3/apppairs/AppPairIcon$a;

    .line 19
    .line 20
    const-string v1, "hoverScale"

    .line 21
    .line 22
    invoke-direct {v0, v1}, Lcom/android/launcher3/apppairs/AppPairIcon$a;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/android/launcher3/apppairs/AppPairIcon;->o:Landroid/util/FloatProperty;

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/android/launcher3/util/z1;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/android/launcher3/util/z1;-><init>(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->k:Lcom/android/launcher3/util/z1;

    .line 10
    .line 11
    const/high16 p1, 0x3f800000    # 1.0f

    .line 12
    .line 13
    iput p1, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->l:F

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/model/data/y;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/y;->rank:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/apppairs/AppPairIcon;)Lcom/android/launcher3/apppairs/AppPairIconGraphic;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->g:Lcom/android/launcher3/apppairs/AppPairIconGraphic;

    .line 2
    .line 3
    return-object p0
.end method

.method public static c(ILcom/android/launcher3/views/k;Landroid/view/ViewGroup;Lcom/android/launcher3/model/data/l;I)Lcom/android/launcher3/apppairs/AppPairIcon;
    .locals 3

    .line 1
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    :goto_0
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v1, p0, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 26
    .line 27
    invoke-static {}, Lcom/android/launcher3/y0;->t()Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-eqz p2, :cond_1

    .line 32
    .line 33
    instance-of p2, p1, Lcom/android/launcher3/C2;

    .line 34
    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    move-object p2, p1

    .line 38
    check-cast p2, Lcom/android/launcher3/C2;

    .line 39
    .line 40
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->U1()Lcom/android/launcher3/keyboard/b;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->setDefaultFocusHighlightEnabled(Z)V

    .line 48
    .line 49
    .line 50
    :cond_1
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/l;->y()Ljava/util/ArrayList;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    new-instance v1, LW0/a;

    .line 55
    .line 56
    invoke-direct {v1}, LW0/a;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {v1}, Ljava/util/Comparator;->comparingInt(Ljava/util/function/ToIntFunction;)Ljava/util/Comparator;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->setTag(Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getItemOnClickListener()Landroid/view/View$OnClickListener;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    .line 75
    .line 76
    iput-object p3, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->i:Lcom/android/launcher3/model/data/l;

    .line 77
    .line 78
    iput p4, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->j:I

    .line 79
    .line 80
    const p2, 0x7f0b00de

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    check-cast p2, Lcom/android/launcher3/apppairs/AppPairIconGraphic;

    .line 88
    .line 89
    iput-object p2, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->g:Lcom/android/launcher3/apppairs/AppPairIconGraphic;

    .line 90
    .line 91
    invoke-virtual {p2, p0, p4}, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->c(Lcom/android/launcher3/apppairs/AppPairIcon;I)V

    .line 92
    .line 93
    .line 94
    const p2, 0x7f0b00df

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 102
    .line 103
    iput-object p2, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->h:Lcom/android/launcher3/BubbleTextView;

    .line 104
    .line 105
    invoke-virtual {p2}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    check-cast p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 110
    .line 111
    const/4 p3, 0x2

    .line 112
    if-ne p4, p3, :cond_2

    .line 113
    .line 114
    iget v1, v0, Lcom/android/launcher3/h0;->X1:I

    .line 115
    .line 116
    iget v0, v0, Lcom/android/launcher3/h0;->Z1:I

    .line 117
    .line 118
    :goto_1
    add-int/2addr v1, v0

    .line 119
    goto :goto_2

    .line 120
    :cond_2
    iget v1, v0, Lcom/android/launcher3/h0;->B1:I

    .line 121
    .line 122
    iget v0, v0, Lcom/android/launcher3/h0;->D1:I

    .line 123
    .line 124
    goto :goto_1

    .line 125
    :goto_2
    iput v1, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 126
    .line 127
    iget-object p2, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->h:Lcom/android/launcher3/BubbleTextView;

    .line 128
    .line 129
    if-eq p4, p3, :cond_3

    .line 130
    .line 131
    const/4 v2, 0x1

    .line 132
    :cond_3
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Lcom/android/launcher3/apppairs/AppPairIcon;->l()V

    .line 136
    .line 137
    .line 138
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    .line 143
    .line 144
    .line 145
    return-object p0
.end method


# virtual methods
.method public d(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->g:Lcom/android/launcher3/apppairs/AppPairIconGraphic;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->b(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getContainer()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public getIconDrawableArea()Lcom/android/launcher3/apppairs/AppPairIconGraphic;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->g:Lcom/android/launcher3/apppairs/AppPairIconGraphic;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInfo()Lcom/android/launcher3/model/data/l;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->i:Lcom/android/launcher3/model/data/l;

    .line 2
    .line 3
    return-object p0
.end method

.method public getReorderBounceScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->l:F

    .line 2
    .line 3
    return p0
.end method

.method public getTitleTextView()Lcom/android/launcher3/BubbleTextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->h:Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTranslateDelegate()Lcom/android/launcher3/util/z1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->k:Lcom/android/launcher3/util/z1;

    .line 2
    .line 3
    return-object p0
.end method

.method public getViewType()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public i(Ljava/util/function/Predicate;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/apppairs/AppPairIcon;->getInfo()Lcom/android/launcher3/model/data/l;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Lcom/android/launcher3/model/data/m;->w(Ljava/util/function/Predicate;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/apppairs/AppPairIcon;->l()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->g:Lcom/android/launcher3/apppairs/AppPairIconGraphic;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->e()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public k()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/apppairs/AppPairIcon;->getInfo()Lcom/android/launcher3/model/data/l;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/l;->O()Lcom/android/launcher3/model/data/I;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/apppairs/AppPairIcon;->getInfo()Lcom/android/launcher3/model/data/l;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/l;->P()Lcom/android/launcher3/model/data/I;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const v3, 0x7f140098

    .line 26
    .line 27
    .line 28
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v2, v3, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/apppairs/AppPairIcon;->getInfo()Lcom/android/launcher3/model/data/l;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v1, v2}, Lcom/android/launcher3/model/data/l;->S(Landroid/content/Context;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const v2, 0x7f140191

    .line 55
    .line 56
    .line 57
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    :cond_0
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public l()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/apppairs/AppPairIcon;->m()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/apppairs/AppPairIcon;->k()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/apppairs/AppPairIcon;->getInfo()Lcom/android/launcher3/model/data/l;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/l;->L(Landroid/content/Context;)Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->h:Lcom/android/launcher3/BubbleTextView;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/apppairs/AppPairIcon;->getInfo()Lcom/android/launcher3/model/data/l;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, v0}, Lcom/android/launcher3/model/data/l;->G(Ls1/P;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onHoverChanged(Z)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onHoverChanged(Z)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/apppairs/AppPairIcon;->o:Landroid/util/FloatProperty;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    sget-object p1, Lcom/android/launcher3/apppairs/AppPairIcon;->n:Ljava/lang/Float;

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    sget-object p1, Lcom/android/launcher3/apppairs/AppPairIcon;->m:Ljava/lang/Float;

    .line 12
    .line 13
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const/4 v1, 0x1

    .line 18
    new-array v1, v1, [F

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    aput p1, v1, v2

    .line 22
    .line 23
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-wide/16 v0, 0x96

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method protected onMeasure(II)V
    .locals 5

    .line 1
    iget v0, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->j:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-static {v2}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Lcom/android/launcher3/views/k;

    .line 19
    .line 20
    iget-object v3, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->h:Lcom/android/launcher3/BubbleTextView;

    .line 21
    .line 22
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v3}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    iget v4, v4, Lcom/android/launcher3/h0;->X1:I

    .line 35
    .line 36
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget v2, v2, Lcom/android/launcher3/h0;->Z1:I

    .line 41
    .line 42
    add-int/2addr v4, v2

    .line 43
    iget v2, v3, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 44
    .line 45
    iget v3, v3, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 46
    .line 47
    sub-float/2addr v2, v3

    .line 48
    float-to-double v2, v2

    .line 49
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 50
    .line 51
    .line 52
    move-result-wide v2

    .line 53
    double-to-int v2, v2

    .line 54
    add-int/2addr v4, v2

    .line 55
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    sub-int/2addr v0, v4

    .line 60
    div-int/2addr v0, v1

    .line 61
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingRight()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingBottom()I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    invoke-virtual {p0, v2, v0, v1, v3}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 70
    .line 71
    .line 72
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public setReorderBounceScale(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->l:F

    .line 2
    .line 3
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setTextVisible(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->h:Lcom/android/launcher3/BubbleTextView;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/apppairs/AppPairIcon;->h:Lcom/android/launcher3/BubbleTextView;

    .line 11
    .line 12
    const/4 p1, 0x4

    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
