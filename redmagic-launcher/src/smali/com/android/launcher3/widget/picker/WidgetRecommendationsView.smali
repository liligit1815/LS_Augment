.class public final Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;
.super Lcom/android/launcher3/V4;
.source "WidgetRecommendationsView.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/V4<",
        "Lcom/android/launcher3/pageindicators/PageIndicatorDots;",
        ">;"
    }
.end annotation


# instance fields
.field private g:F

.field private h:F

.field private i:I

.field private j:Z

.field private k:Landroid/widget/TextView;

.field private final l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private n:Landroid/view/View$OnLongClickListener;

.field private o:Landroid/view/View$OnClickListener;

.field private p:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/content/ComponentName;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/V4;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const v0, 0x7f7fffff    # Float.MAX_VALUE

    .line 3
    iput v0, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->g:F

    const/4 v0, 0x0

    .line 4
    iput v0, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->h:F

    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->i:I

    const/4 v1, 0x0

    .line 6
    iput-boolean v1, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->j:Z

    .line 7
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->l:Ljava/util/List;

    .line 8
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->m:Ljava/util/List;

    .line 9
    sget-object v2, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    iput-object v2, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->p:Ljava/util/Set;

    .line 10
    sget-object v2, Lcom/android/launcher3/x5;->d2:[I

    invoke-virtual {p1, p2, v2, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 11
    invoke-virtual {p1, v1, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/V4;->mPageIndicatorViewId:I

    .line 12
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public static synthetic H(Lz1/Z4;)Landroid/content/ComponentName;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic K(ILjava/util/function/Consumer;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p1, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic L(Ljava/util/List;)Z
    .locals 1

    .line 1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x2

    .line 6
    if-ge p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public static synthetic N(Ljava/util/ArrayList;)Ljava/util/stream/Stream;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Lcom/android/launcher3/widget/picker/j;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/android/launcher3/widget/picker/j;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic O(Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;Lz1/Z4;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->T(Lz1/Z4;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private R()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 14
    .line 15
    check-cast p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->setActiveMarker(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic T(Lz1/Z4;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->p:Ljava/util/Set;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private U(Ljava/util/List;Lcom/android/launcher3/h0;II)Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;",
            "Lcom/android/launcher3/h0;",
            "II)",
            "Ljava/util/Set<",
            "Landroid/content/ComponentName;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->p:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance v0, Lcom/android/launcher3/widget/picker/h;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/picker/h;-><init>(Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Ljava/util/List;

    .line 31
    .line 32
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {p1, v0, p2, p3, p4}, Lr2/i;->f(Ljava/util/List;Landroid/content/Context;Lcom/android/launcher3/h0;II)Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const p3, 0x7f0e0261

    .line 45
    .line 46
    .line 47
    const/4 p4, 0x0

    .line 48
    invoke-virtual {v1, p3, p0, p4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    check-cast p3, Lcom/android/launcher3/widget/picker/WidgetsRecommendationTableLayout;

    .line 53
    .line 54
    iget-object p4, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->o:Landroid/view/View$OnClickListener;

    .line 55
    .line 56
    invoke-virtual {p3, p4}, Lcom/android/launcher3/widget/picker/WidgetsRecommendationTableLayout;->setWidgetCellOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    iget-object p4, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->n:Landroid/view/View$OnLongClickListener;

    .line 60
    .line 61
    invoke-virtual {p3, p4}, Lcom/android/launcher3/widget/picker/WidgetsRecommendationTableLayout;->setWidgetCellLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 62
    .line 63
    .line 64
    iget p4, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->g:F

    .line 65
    .line 66
    invoke-virtual {p3, p1, p2, p4}, Lcom/android/launcher3/widget/picker/WidgetsRecommendationTableLayout;->d(Ljava/util/List;Lcom/android/launcher3/h0;F)Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    if-nez p2, :cond_1

    .line 75
    .line 76
    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    new-instance p1, Lcom/android/launcher3/widget/picker/i;

    .line 84
    .line 85
    invoke-direct {p1}, Lcom/android/launcher3/widget/picker/i;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->flatMap(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {}, Ljava/util/stream/Collectors;->toSet()Ljava/util/stream/Collector;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    check-cast p0, Ljava/util/Set;

    .line 101
    .line 102
    return-object p0
.end method

.method private Y(Ljava/util/Map;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/widget/picker/d;",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;>;)Z"
        }
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->j:Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_3

    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/Map;->size()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/4 v1, 0x3

    .line 11
    const/4 v2, 0x1

    .line 12
    if-ge p0, v1, :cond_0

    .line 13
    .line 14
    move p0, v2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move p0, v0

    .line 17
    :goto_0
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-wide/16 v3, 0x3

    .line 26
    .line 27
    invoke-interface {p1, v3, v4}, Ljava/util/stream/Stream;->limit(J)Ljava/util/stream/Stream;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance v1, Lcom/android/launcher3/widget/picker/g;

    .line 32
    .line 33
    invoke-direct {v1}, Lcom/android/launcher3/widget/picker/g;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-interface {p1}, Ljava/util/stream/Stream;->count()J

    .line 41
    .line 42
    .line 43
    move-result-wide v3

    .line 44
    if-nez p0, :cond_2

    .line 45
    .line 46
    const-wide/16 p0, 0x1

    .line 47
    .line 48
    cmp-long p0, v3, p0

    .line 49
    .line 50
    if-lez p0, :cond_1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    return v0

    .line 54
    :cond_2
    :goto_1
    return v2

    .line 55
    :cond_3
    return v0
.end method

.method private Z(IF)Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->h:F

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    cmpl-float p1, v0, p1

    .line 5
    .line 6
    if-nez p1, :cond_1

    .line 7
    .line 8
    iget p1, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->g:F

    .line 9
    .line 10
    cmpl-float p1, p1, p2

    .line 11
    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget p1, p1, Landroid/content/res/Configuration;->uiMode:I

    .line 27
    .line 28
    iget p0, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->i:I

    .line 29
    .line 30
    if-eq p1, p0, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0

    .line 35
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 36
    return p0
.end method

.method private a0(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->k:Landroid/widget/TextView;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->k:Landroid/widget/TextView;

    .line 15
    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p1, ", "

    .line 25
    .line 26
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPageDescription()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private b0(I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-le v0, v2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v2, v1

    .line 11
    :goto_0
    if-eqz v2, :cond_1

    .line 12
    .line 13
    move v0, v1

    .line 14
    goto :goto_1

    .line 15
    :cond_1
    const/16 v0, 0x8

    .line 16
    .line 17
    :goto_1
    iget-object v3, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->k:Landroid/widget/TextView;

    .line 18
    .line 19
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object v3, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 23
    .line 24
    check-cast v3, Lcom/android/launcher3/pageindicators/PageIndicatorDots;

    .line 25
    .line 26
    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    if-eqz v2, :cond_4

    .line 30
    .line 31
    if-lez p1, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-lt p1, v0, :cond_3

    .line 38
    .line 39
    :cond_2
    move p1, v1

    .line 40
    :cond_3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 44
    .line 45
    check-cast v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->setActiveMarker(I)V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->a0(I)V

    .line 51
    .line 52
    .line 53
    :cond_4
    return-void
.end method


# virtual methods
.method public Q(Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public S()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->j:Z

    .line 3
    .line 4
    return-void
.end method

.method public V(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/android/launcher3/N5;->f:Z

    .line 2
    .line 3
    const-string v1, "widgetRecommendationsView:mDisplayedWidgets"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-class v0, Landroid/content/ComponentName;

    .line 8
    .line 9
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :goto_0
    if-eqz p1, :cond_1

    .line 19
    .line 20
    new-instance v0, Ljava/util/HashSet;

    .line 21
    .line 22
    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->p:Ljava/util/Set;

    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public W(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->p:Ljava/util/Set;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "widgetRecommendationsView:mDisplayedWidgets"

    .line 9
    .line 10
    invoke-virtual {p1, p0, v0}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public X(Ljava/util/Map;Lcom/android/launcher3/h0;FIIIZ)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/widget/picker/d;",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;>;",
            "Lcom/android/launcher3/h0;",
            "FIIIZ)I"
        }
    .end annotation

    .line 1
    if-nez p7, :cond_1

    .line 2
    .line 3
    invoke-direct {p0, p4, p3}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->Z(IF)Z

    .line 4
    .line 5
    .line 6
    move-result p7

    .line 7
    if-eqz p7, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->p:Ljava/util/Set;

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/util/Set;->size()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_1
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object p7

    .line 21
    iput p3, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->g:F

    .line 22
    .line 23
    int-to-float p3, p4

    .line 24
    iput p3, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->h:F

    .line 25
    .line 26
    invoke-virtual {p7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    invoke-virtual {p3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    iget p3, p3, Landroid/content/res/Configuration;->uiMode:I

    .line 35
    .line 36
    iput p3, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->i:I

    .line 37
    .line 38
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->Y(Ljava/util/Map;)Z

    .line 39
    .line 40
    .line 41
    move-result p3

    .line 42
    if-eqz p3, :cond_2

    .line 43
    .line 44
    sget-object p3, Lcom/android/launcher3/widget/picker/d;->i:Lcom/android/launcher3/widget/picker/d;

    .line 45
    .line 46
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-interface {p1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    new-instance v0, Lz1/r5;

    .line 55
    .line 56
    invoke-direct {v0}, Lz1/r5;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->flatMap(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-interface {p1}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-static {p3, p1}, Ljava/util/Map;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    :cond_2
    iget-object p3, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 72
    .line 73
    check-cast p3, Lcom/android/launcher3/pageindicators/PageIndicatorDots;

    .line 74
    .line 75
    const/4 v0, 0x1

    .line 76
    const/4 v1, 0x0

    .line 77
    invoke-virtual {p3, v0, v1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->b(ZZ)V

    .line 78
    .line 79
    .line 80
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->R()V

    .line 81
    .line 82
    .line 83
    new-instance p3, Ljava/util/HashSet;

    .line 84
    .line 85
    invoke-direct {p3}, Ljava/util/HashSet;-><init>()V

    .line 86
    .line 87
    .line 88
    new-instance v0, Ljava/util/TreeMap;

    .line 89
    .line 90
    invoke-direct {v0, p1}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    move v0, v1

    .line 102
    :cond_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    if-eqz v2, :cond_5

    .line 107
    .line 108
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    check-cast v2, Ljava/util/Map$Entry;

    .line 113
    .line 114
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    check-cast v3, Ljava/util/List;

    .line 119
    .line 120
    invoke-direct {p0, v3, p2, p4, p5}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->U(Ljava/util/List;Lcom/android/launcher3/h0;II)Ljava/util/Set;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    if-nez v4, :cond_4

    .line 129
    .line 130
    iget-object v4, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->l:Ljava/util/List;

    .line 131
    .line 132
    invoke-virtual {p7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    check-cast v2, Lcom/android/launcher3/widget/picker/d;

    .line 141
    .line 142
    iget v2, v2, Lcom/android/launcher3/widget/picker/d;->g:I

    .line 143
    .line 144
    invoke-virtual {v5, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    add-int/lit8 v0, v0, 0x1

    .line 152
    .line 153
    invoke-interface {p3, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 154
    .line 155
    .line 156
    :cond_4
    const/4 v2, 0x3

    .line 157
    if-ne v0, v2, :cond_3

    .line 158
    .line 159
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->p:Ljava/util/Set;

    .line 160
    .line 161
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-eqz p1, :cond_6

    .line 166
    .line 167
    iput-object p3, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->p:Ljava/util/Set;

    .line 168
    .line 169
    :cond_6
    invoke-direct {p0, p6}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->b0(I)V

    .line 170
    .line 171
    .line 172
    iget-object p0, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 173
    .line 174
    check-cast p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;

    .line 175
    .line 176
    invoke-virtual {p0, v1, v1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->b(ZZ)V

    .line 177
    .line 178
    .line 179
    invoke-interface {p3}, Ljava/util/Set;->size()I

    .line 180
    .line 181
    .line 182
    move-result p0

    .line 183
    return p0
.end method

.method protected canAnnouncePageDescription()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected canScroll(FF)Z
    .locals 1

    .line 1
    cmpl-float v0, p2, p1

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/V4;->canScroll(FF)Z

    .line 6
    .line 7
    .line 8
    move-result p0

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

.method public getViewForEducationTip()Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Landroid/view/ViewGroup;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public initParentViews(Landroid/view/View;)V
    .locals 2

    .line 1
    const v0, 0x7f0b04cd

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/widget/TextView;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->k:Landroid/widget/TextView;

    .line 11
    .line 12
    iget v0, p0, Lcom/android/launcher3/V4;->mPageIndicatorViewId:I

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    if-le v0, v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 22
    .line 23
    check-cast p1, Lcom/android/launcher3/pageindicators/PageIndicatorDots;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPanelCount()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    div-int/2addr v0, p0

    .line 34
    invoke-virtual {p1, v0}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->setMarkersCount(I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method protected notifyPageSwitchListener(I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

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
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-direct {p0, v0}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->a0(I)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->m:Ljava/util/List;

    .line 16
    .line 17
    new-instance v2, Lcom/android/launcher3/widget/picker/f;

    .line 18
    .line 19
    invoke-direct {v2, v0}, Lcom/android/launcher3/widget/picker/f;-><init>(I)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v1, v2}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 23
    .line 24
    .line 25
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->notifyPageSwitchListener(I)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_1

    .line 6
    .line 7
    iget v0, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->h:F

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    move v2, v1

    .line 15
    move v3, v2

    .line 16
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    if-ge v2, v4, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    const/high16 v5, 0x40000000    # 2.0f

    .line 27
    .line 28
    invoke-static {v0, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    iget v6, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->g:F

    .line 33
    .line 34
    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    const/high16 v7, -0x80000000

    .line 39
    .line 40
    invoke-static {v6, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 41
    .line 42
    .line 43
    move-result v6

    .line 44
    invoke-virtual {p0, v4, v5, v6}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    add-int/lit8 v2, v2, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    invoke-static {v3, p2, v1}, Landroid/view/ViewGroup;->resolveSizeAndState(III)I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    invoke-static {v0, p1, v1}, Landroid/view/ViewGroup;->resolveSizeAndState(III)I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/V4;->onMeasure(II)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method protected onScrollChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/launcher3/V4;->onScrollChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 5
    .line 6
    check-cast p2, Lcom/android/launcher3/pageindicators/PageIndicatorDots;

    .line 7
    .line 8
    iget p0, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 9
    .line 10
    invoke-virtual {p2, p1, p0}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->d(II)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setWidgetCellLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->n:Landroid/view/View$OnLongClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public setWidgetCellOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->o:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-void
.end method
