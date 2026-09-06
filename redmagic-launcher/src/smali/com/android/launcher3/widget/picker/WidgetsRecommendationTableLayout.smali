.class public final Lcom/android/launcher3/widget/picker/WidgetsRecommendationTableLayout;
.super Landroid/widget/TableLayout;
.source "WidgetsRecommendationTableLayout.java"


# instance fields
.field private final g:F

.field private final h:F

.field private final i:F

.field private j:Landroid/view/View$OnLongClickListener;

.field private k:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/TableLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/TableLayout;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const p2, 0x7f070c92

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    mul-int/lit8 p1, p1, 0x2

    .line 16
    .line 17
    int-to-float p1, p1

    .line 18
    iput p1, p0, Lcom/android/launcher3/widget/picker/WidgetsRecommendationTableLayout;->g:F

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/widget/TableLayout;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const p2, 0x7f070c68

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    mul-int/lit8 p1, p1, 0x2

    .line 32
    .line 33
    int-to-float p1, p1

    .line 34
    iput p1, p0, Lcom/android/launcher3/widget/picker/WidgetsRecommendationTableLayout;->h:F

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/widget/TableLayout;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const p2, 0x7f070c66

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput p1, p0, Lcom/android/launcher3/widget/picker/WidgetsRecommendationTableLayout;->i:F

    .line 48
    .line 49
    return-void
.end method

.method private a(Lcom/android/launcher3/widget/b1;)Lcom/android/launcher3/widget/WidgetCell;
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/TableLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const v1, 0x7f0e0258

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/launcher3/widget/WidgetCell;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/android/launcher3/widget/WidgetCell;->e(Lcom/android/launcher3/widget/WidgetCell$c;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsRecommendationTableLayout;->k:Landroid/view/View$OnClickListener;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    const v1, 0x7f0b068e

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object v3, p0, Lcom/android/launcher3/widget/picker/WidgetsRecommendationTableLayout;->k:Landroid/view/View$OnClickListener;

    .line 35
    .line 36
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsRecommendationTableLayout;->j:Landroid/view/View$OnLongClickListener;

    .line 40
    .line 41
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v2}, Lcom/android/launcher3/widget/WidgetCell;->setAnimatePreview(Z)V

    .line 45
    .line 46
    .line 47
    const/16 p0, -0x6f

    .line 48
    .line 49
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/WidgetCell;->setSourceContainer(I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroid/widget/TableRow;->addView(Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    return-object v0
.end method

.method private b(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/ArrayList<",
            "Lz1/Z4;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/16 p1, 0x8

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/TableLayout;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TableLayout;->removeAllViews()V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    move v1, v0

    .line 18
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-ge v1, v2, :cond_2

    .line 23
    .line 24
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Ljava/util/List;

    .line 29
    .line 30
    new-instance v3, Lcom/android/launcher3/widget/b1;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/widget/TableLayout;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-direct {v3, v4}, Lcom/android/launcher3/widget/b1;-><init>(Landroid/content/Context;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    invoke-virtual {v3, v4, v0}, Lcom/android/launcher3/widget/b1;->d(II)V

    .line 44
    .line 45
    .line 46
    const/16 v4, 0x30

    .line 47
    .line 48
    invoke-virtual {v3, v4}, Landroid/widget/TableRow;->setGravity(I)V

    .line 49
    .line 50
    .line 51
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    if-eqz v4, :cond_1

    .line 60
    .line 61
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    check-cast v4, Lz1/Z4;

    .line 66
    .line 67
    invoke-direct {p0, v3}, Lcom/android/launcher3/widget/picker/WidgetsRecommendationTableLayout;->a(Lcom/android/launcher3/widget/b1;)Lcom/android/launcher3/widget/WidgetCell;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    invoke-virtual {v5, v4}, Lcom/android/launcher3/widget/WidgetCell;->g(Lz1/Z4;)V

    .line 72
    .line 73
    .line 74
    const/4 v4, 0x1

    .line 75
    invoke-virtual {v5, v4}, Lcom/android/launcher3/widget/WidgetCell;->x(Z)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v5, v0}, Lcom/android/launcher3/widget/WidgetCell;->y(Z)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v5, v0}, Lcom/android/launcher3/widget/WidgetCell;->z(Z)V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    invoke-virtual {p0, v3}, Landroid/widget/TableLayout;->addView(Landroid/view/View;)V

    .line 86
    .line 87
    .line 88
    add-int/lit8 v1, v1, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_2
    invoke-virtual {p0, v0}, Landroid/widget/TableLayout;->setVisibility(I)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method private c(Ljava/util/List;FLcom/android/launcher3/h0;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/ArrayList<",
            "Lz1/Z4;",
            ">;>;F",
            "Lcom/android/launcher3/h0;",
            ")",
            "Ljava/util/List<",
            "Ljava/util/ArrayList<",
            "Lz1/Z4;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/android/launcher3/widget/picker/WidgetsRecommendationTableLayout;->g:F

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    move v3, v2

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    if-ge v3, v4, :cond_2

    .line 15
    .line 16
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    check-cast v4, Ljava/util/List;

    .line 21
    .line 22
    const/4 v5, 0x0

    .line 23
    move v6, v2

    .line 24
    :goto_1
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v7

    .line 28
    if-ge v6, v7, :cond_0

    .line 29
    .line 30
    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v7

    .line 34
    check-cast v7, Lz1/Z4;

    .line 35
    .line 36
    sget-object v8, Lq2/a;->c:Lq2/a$a;

    .line 37
    .line 38
    invoke-virtual {v8, v7, p3}, Lq2/a$a;->c(Lz1/Z4;Lcom/android/launcher3/h0;)Lq2/a;

    .line 39
    .line 40
    .line 41
    move-result-object v7

    .line 42
    iget v8, v7, Lq2/a;->a:I

    .line 43
    .line 44
    iget v7, v7, Lq2/a;->b:I

    .line 45
    .line 46
    invoke-static {p3, v8, v7}, Lr2/b;->e(Lcom/android/launcher3/h0;II)Landroid/util/Size;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    invoke-virtual {v7}, Landroid/util/Size;->getHeight()I

    .line 51
    .line 52
    .line 53
    move-result v7

    .line 54
    int-to-float v7, v7

    .line 55
    iget v8, p0, Lcom/android/launcher3/widget/picker/WidgetsRecommendationTableLayout;->i:F

    .line 56
    .line 57
    add-float/2addr v7, v8

    .line 58
    iget v8, p0, Lcom/android/launcher3/widget/picker/WidgetsRecommendationTableLayout;->h:F

    .line 59
    .line 60
    add-float/2addr v7, v8

    .line 61
    invoke-static {v5, v7}, Ljava/lang/Math;->max(FF)F

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    add-int/lit8 v6, v6, 0x1

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_0
    add-float/2addr v5, v1

    .line 69
    cmpg-float v6, v5, p2

    .line 70
    .line 71
    if-gtz v6, :cond_1

    .line 72
    .line 73
    new-instance v1, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 76
    .line 77
    .line 78
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move v1, v5

    .line 82
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    sget-object p1, Lr2/i;->c:Ljava/util/Comparator;

    .line 90
    .line 91
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->sorted(Ljava/util/Comparator;)Ljava/util/stream/Stream;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    check-cast p0, Ljava/util/List;

    .line 104
    .line 105
    return-object p0
.end method


# virtual methods
.method public d(Ljava/util/List;Lcom/android/launcher3/h0;F)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/ArrayList<",
            "Lz1/Z4;",
            ">;>;",
            "Lcom/android/launcher3/h0;",
            "F)",
            "Ljava/util/List<",
            "Ljava/util/ArrayList<",
            "Lz1/Z4;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p3, p2}, Lcom/android/launcher3/widget/picker/WidgetsRecommendationTableLayout;->c(Ljava/util/List;FLcom/android/launcher3/h0;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsRecommendationTableLayout;->b(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public setWidgetCellLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsRecommendationTableLayout;->j:Landroid/view/View$OnLongClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public setWidgetCellOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsRecommendationTableLayout;->k:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-void
.end method
