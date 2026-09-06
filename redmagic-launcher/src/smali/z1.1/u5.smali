.class public Lz1/u5;
.super Ljava/lang/Object;
.source "WidgetsModel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lz1/u5$c;,
        Lz1/u5$a;,
        Lz1/u5$b;,
        Lz1/u5$d;
    }
.end annotation


# instance fields
.field private final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/android/launcher3/model/data/B;",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;>;"
        }
    .end annotation
.end field

.field private b:Lz1/u5$c;

.field private final c:Landroid/content/Context;

.field private final d:Lcom/android/launcher3/F1;

.field private final e:Ls1/P;

.field private final f:Lcom/android/launcher3/f;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 8
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    move-result-object v0

    .line 9
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/launcher3/P2;->f()Ls1/P;

    move-result-object v1

    new-instance v2, Lcom/android/launcher3/f;

    invoke-direct {v2, p1}, Lcom/android/launcher3/f;-><init>(Landroid/content/Context;)V

    .line 10
    invoke-direct {p0, p1, v0, v1, v2}, Lz1/u5;-><init>(Landroid/content/Context;Lcom/android/launcher3/F1;Ls1/P;Lcom/android/launcher3/f;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/F1;Ls1/P;Lcom/android/launcher3/f;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lz1/u5;->a:Ljava/util/Map;

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lz1/u5;->b:Lz1/u5$c;

    .line 4
    iput-object p1, p0, Lz1/u5;->c:Landroid/content/Context;

    .line 5
    iput-object p2, p0, Lz1/u5;->d:Lcom/android/launcher3/F1;

    .line 6
    iput-object p3, p0, Lz1/u5;->e:Ls1/P;

    .line 7
    iput-object p4, p0, Lz1/u5;->f:Lcom/android/launcher3/f;

    return-void
.end method

.method public static synthetic a(Landroid/util/Pair;)Lcom/android/launcher3/model/data/B;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/model/data/B;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic b(Ljava/util/Map$Entry;)Z
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    return p0
.end method

.method public static synthetic c(Lz1/Z4;)Lcom/android/launcher3/util/E;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/E;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static synthetic d(Ljava/util/List;Lz1/Z4;Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    new-instance p2, Lcom/android/launcher3/util/L1;

    .line 9
    .line 10
    iget-object v0, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object p1, p1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 17
    .line 18
    invoke-direct {p2, v0, p1}, Lcom/android/launcher3/util/L1;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    new-instance v0, Lcom/android/launcher3/util/L1;

    .line 26
    .line 27
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    iget-object p1, p1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 32
    .line 33
    invoke-direct {v0, p2, p1}, Lcom/android/launcher3/util/L1;-><init>(ILandroid/os/UserHandle;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic e(Lz1/u5;Lz1/Z4;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/u5;->o(Lz1/Z4;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic f(Lz1/u5;Lz1/u5$a;Lz1/Z4;)Ljava/util/stream/Stream;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lz1/u5;->q(Lz1/u5$a;Lz1/Z4;)Ljava/util/stream/Stream;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic g(Landroid/util/Pair;)Lz1/Z4;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lz1/Z4;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic h(Lz1/u5$a;Lz1/Z4;Lcom/android/launcher3/util/L1;)Landroid/util/Pair;
    .locals 1

    .line 1
    new-instance v0, Landroid/util/Pair;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lz1/u5$a;->a(Lcom/android/launcher3/util/L1;)Lcom/android/launcher3/model/data/B;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static synthetic i(Lz1/u5;Lz1/Z4;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/u5;->n(Lz1/Z4;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic j(Lz1/u5;Ljava/util/Map$Entry;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/u5;->p(Ljava/util/Map$Entry;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private k(Landroid/content/Context;Lz1/Z4;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lz1/Z4;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/L1;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/widget/Z0;->b(Landroid/content/Context;)Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/android/launcher3/util/z0;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/util/z0;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v0, Lz1/k5;

    .line 28
    .line 29
    invoke-direct {v0, p1, p2}, Lz1/k5;-><init>(Ljava/util/List;Lz1/Z4;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p0, v0}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    .line 33
    .line 34
    .line 35
    return-object p1

    .line 36
    :cond_1
    :goto_0
    new-instance p0, Lcom/android/launcher3/util/L1;

    .line 37
    .line 38
    iget-object p1, p2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object p2, p2, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 45
    .line 46
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/util/L1;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 47
    .line 48
    .line 49
    filled-new-array {p0}, [Lcom/android/launcher3/util/L1;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method

.method private synthetic n(Lz1/Z4;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/u5;->b:Lz1/u5$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lz1/u5$c;->a(Lz1/Z4;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private synthetic o(Lz1/Z4;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/u5;->b:Lz1/u5$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lz1/u5$c;->a(Lz1/Z4;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private synthetic p(Ljava/util/Map$Entry;)Ljava/util/List;
    .locals 1

    .line 1
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Lz1/j5;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lz1/j5;-><init>(Lz1/u5;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ljava/util/List;

    .line 29
    .line 30
    return-object p0
.end method

.method private synthetic q(Lz1/u5$a;Lz1/Z4;)Ljava/util/stream/Stream;
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/u5;->c:Landroid/content/Context;

    .line 2
    .line 3
    invoke-direct {p0, v0, p2}, Lz1/u5;->k(Landroid/content/Context;Lz1/Z4;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Lz1/i5;

    .line 12
    .line 13
    invoke-direct {v0, p1, p2}, Lz1/i5;-><init>(Lz1/u5$a;Lz1/Z4;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static r(Landroid/content/Context;Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/B;
    .locals 3

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/widget/Z0;->b(Landroid/content/Context;)Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/android/launcher3/util/z0;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/util/z0;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v0, -0x1

    .line 22
    move v1, v0

    .line 23
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    if-ne v1, v0, :cond_0

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ljava/lang/Integer;

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    new-instance p0, Lcom/android/launcher3/model/data/B;

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-direct {p0, p1, v1, p2}, Lcom/android/launcher3/model/data/B;-><init>(Ljava/lang/String;ILandroid/os/UserHandle;)V

    .line 49
    .line 50
    .line 51
    return-object p0

    .line 52
    :cond_1
    new-instance p0, Lcom/android/launcher3/model/data/B;

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/model/data/B;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 59
    .line 60
    .line 61
    return-object p0
.end method

.method private t(Landroid/appwidget/AppWidgetProviderInfo;FF)V
    .locals 0

    .line 1
    iget p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    .line 2
    .line 3
    int-to-float p0, p0

    .line 4
    div-float/2addr p0, p2

    .line 5
    mul-float/2addr p0, p3

    .line 6
    float-to-int p0, p0

    .line 7
    iput p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    .line 8
    .line 9
    iget p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    .line 10
    .line 11
    int-to-float p0, p0

    .line 12
    div-float/2addr p0, p2

    .line 13
    mul-float/2addr p0, p3

    .line 14
    float-to-int p0, p0

    .line 15
    iput p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    .line 16
    .line 17
    iget p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minResizeWidth:I

    .line 18
    .line 19
    int-to-float p0, p0

    .line 20
    div-float/2addr p0, p2

    .line 21
    mul-float/2addr p0, p3

    .line 22
    float-to-int p0, p0

    .line 23
    iput p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minResizeWidth:I

    .line 24
    .line 25
    iget p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minResizeHeight:I

    .line 26
    .line 27
    int-to-float p0, p0

    .line 28
    div-float/2addr p0, p2

    .line 29
    mul-float/2addr p0, p3

    .line 30
    float-to-int p0, p0

    .line 31
    iput p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minResizeHeight:I

    .line 32
    .line 33
    iget p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->maxResizeWidth:I

    .line 34
    .line 35
    int-to-float p0, p0

    .line 36
    div-float/2addr p0, p2

    .line 37
    mul-float/2addr p0, p3

    .line 38
    float-to-int p0, p0

    .line 39
    iput p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->maxResizeWidth:I

    .line 40
    .line 41
    iget p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->maxResizeHeight:I

    .line 42
    .line 43
    int-to-float p0, p0

    .line 44
    div-float/2addr p0, p2

    .line 45
    mul-float/2addr p0, p3

    .line 46
    float-to-int p0, p0

    .line 47
    iput p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->maxResizeHeight:I

    .line 48
    .line 49
    return-void
.end method

.method private declared-synchronized u(Ljava/util/ArrayList;Lcom/android/launcher3/util/L1;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lz1/Z4;",
            ">;",
            "Lcom/android/launcher3/util/L1;",
            ")V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Lz1/u5$c;

    .line 3
    .line 4
    iget-object v1, p0, Lz1/u5;->c:Landroid/content/Context;

    .line 5
    .line 6
    iget-object v2, p0, Lz1/u5;->d:Lcom/android/launcher3/F1;

    .line 7
    .line 8
    iget-object v3, p0, Lz1/u5;->f:Lcom/android/launcher3/f;

    .line 9
    .line 10
    invoke-direct {v0, v1, v2, v3}, Lz1/u5$c;-><init>(Landroid/content/Context;Lcom/android/launcher3/F1;Lcom/android/launcher3/f;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lz1/u5;->b:Lz1/u5$c;

    .line 14
    .line 15
    new-instance v0, Lz1/u5$a;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-direct {v0, v1}, Lz1/u5$a;-><init>(Lz1/v5;)V

    .line 19
    .line 20
    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    iget-object p2, p0, Lz1/u5;->a:Ljava/util/Map;

    .line 24
    .line 25
    invoke-interface {p2}, Ljava/util/Map;->clear()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p1

    .line 30
    goto :goto_2

    .line 31
    :cond_0
    iget-object v2, p0, Lz1/u5;->a:Ljava/util/Map;

    .line 32
    .line 33
    invoke-virtual {v0, p2}, Lz1/u5$a;->a(Lcom/android/launcher3/util/L1;)Lcom/android/launcher3/model/data/B;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-interface {v2, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    :goto_0
    iget-object p2, p0, Lz1/u5;->a:Ljava/util/Map;

    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    new-instance v2, Lz1/u5$b;

    .line 47
    .line 48
    invoke-direct {v2, v1}, Lz1/u5$b;-><init>(Lz1/v5;)V

    .line 49
    .line 50
    .line 51
    invoke-interface {p1, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    new-instance v1, Lz1/u5$d;

    .line 56
    .line 57
    iget-object v2, p0, Lz1/u5;->c:Landroid/content/Context;

    .line 58
    .line 59
    invoke-direct {v1, v2}, Lz1/u5$d;-><init>(Landroid/content/Context;)V

    .line 60
    .line 61
    .line 62
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    new-instance v1, Lz1/o5;

    .line 67
    .line 68
    invoke-direct {v1, p0, v0}, Lz1/o5;-><init>(Lz1/u5;Lz1/u5$a;)V

    .line 69
    .line 70
    .line 71
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->flatMap(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    new-instance v1, Lz1/p5;

    .line 76
    .line 77
    invoke-direct {v1}, Lz1/p5;-><init>()V

    .line 78
    .line 79
    .line 80
    new-instance v2, Lz1/q5;

    .line 81
    .line 82
    invoke-direct {v2}, Lz1/q5;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-static {v2, v3}, Ljava/util/stream/Collectors;->mapping(Ljava/util/function/Function;Ljava/util/stream/Collector;)Ljava/util/stream/Collector;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-static {v1, v2}, Ljava/util/stream/Collectors;->groupingBy(Ljava/util/function/Function;Ljava/util/stream/Collector;)Ljava/util/stream/Collector;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    check-cast p1, Ljava/util/Map;

    .line 102
    .line 103
    invoke-interface {p2, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0}, Lz1/u5$a;->b()Ljava/util/Collection;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    if-eqz p2, :cond_1

    .line 119
    .line 120
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    check-cast p2, Lcom/android/launcher3/model/data/B;

    .line 125
    .line 126
    iget-object v0, p0, Lz1/u5;->e:Ls1/P;

    .line 127
    .line 128
    sget-object v1, Lt1/g;->d:Lt1/g;

    .line 129
    .line 130
    invoke-virtual {v1}, Lt1/g;->j()Lt1/g;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v0, p2, v1}, Ls1/P;->I0(Lcom/android/launcher3/model/data/B;Lt1/g;)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Lz1/u5;->e:Ls1/P;

    .line 138
    .line 139
    invoke-virtual {v0, p2}, Ls1/P;->Y0(Lcom/android/launcher3/model/data/B;)V

    .line 140
    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_1
    iget-object p1, p0, Lz1/u5;->c:Landroid/content/Context;

    .line 144
    .line 145
    invoke-direct {p0, p1}, Lz1/u5;->w(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 146
    .line 147
    .line 148
    monitor-exit p0

    .line 149
    return-void

    .line 150
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 151
    throw p1
.end method

.method private w(Landroid/content/Context;)V
    .locals 8

    .line 1
    const-string v0, "updateAIGCWidgetGroupName: "

    .line 2
    .line 3
    const-string v1, "WidgetsModel"

    .line 4
    .line 5
    const-string v2, "widgetGroupName"

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p0, p0, Lz1/u5;->a:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_4

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Ljava/util/Map$Entry;

    .line 32
    .line 33
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    check-cast v4, Lcom/android/launcher3/model/data/B;

    .line 38
    .line 39
    :try_start_0
    const-string v5, "com.zte.aigc"

    .line 40
    .line 41
    iget-object v6, v4, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    if-eqz v5, :cond_0

    .line 48
    .line 49
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    check-cast v3, Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v5

    .line 63
    if-eqz v5, :cond_0

    .line 64
    .line 65
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    check-cast v5, Lz1/Z4;

    .line 70
    .line 71
    iget-object v5, v5, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 72
    .line 73
    const/4 v6, 0x0

    .line 74
    if-eqz v5, :cond_2

    .line 75
    .line 76
    invoke-virtual {v5}, Landroid/appwidget/AppWidgetProviderInfo;->getActivityInfo()Landroid/content/pm/ActivityInfo;

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    goto :goto_1

    .line 81
    :catch_0
    move-exception v3

    .line 82
    goto :goto_2

    .line 83
    :cond_2
    move-object v5, v6

    .line 84
    :goto_1
    if-eqz v5, :cond_1

    .line 85
    .line 86
    iget-object v7, v5, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    .line 87
    .line 88
    if-eqz v7, :cond_1

    .line 89
    .line 90
    invoke-virtual {v7, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v7

    .line 94
    if-eqz v7, :cond_3

    .line 95
    .line 96
    iget-object v5, v5, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    .line 97
    .line 98
    invoke-virtual {v5, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    :cond_3
    instance-of v5, v6, Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    .line 104
    if-eqz v5, :cond_1

    .line 105
    .line 106
    :try_start_1
    iget-object v3, v4, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p1, v3}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    check-cast v6, Ljava/lang/Integer;

    .line 113
    .line 114
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    iput-object v3, v4, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :catch_1
    move-exception v3

    .line 126
    :try_start_2
    invoke-static {v1, v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :goto_2
    invoke-static {v1, v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 131
    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_4
    return-void
.end method


# virtual methods
.method public declared-synchronized l()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/E;",
            "Lz1/Z4;",
            ">;"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lz1/u5;->b:Lz1/u5$c;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    monitor-exit p0

    .line 9
    return-object v0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    :try_start_1
    iget-object v0, p0, Lz1/u5;->a:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Lz1/r5;

    .line 23
    .line 24
    invoke-direct {v1}, Lz1/r5;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->flatMap(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Ljava/util/stream/Stream;->distinct()Ljava/util/stream/Stream;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Lz1/s5;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Lz1/s5;-><init>(Lz1/u5;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Lz1/t5;

    .line 45
    .line 46
    invoke-direct {v1}, Lz1/t5;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Ljava/util/function/Function;->identity()Ljava/util/function/Function;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {v1, v2}, Ljava/util/stream/Collectors;->toMap(Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/stream/Collector;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ljava/util/Map;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    .line 63
    monitor-exit p0

    .line 64
    return-object v0

    .line 65
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 66
    throw v0
.end method

.method public declared-synchronized m()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/model/data/B;",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;>;"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lz1/u5;->b:Lz1/u5$c;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    monitor-exit p0

    .line 9
    return-object v0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    :try_start_1
    iget-object v0, p0, Lz1/u5;->a:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Ljava/util/Set;->stream()Ljava/util/stream/Stream;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Lz1/h5;

    .line 23
    .line 24
    invoke-direct {v1}, Lz1/h5;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v2, Lz1/l5;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Lz1/l5;-><init>(Lz1/u5;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, v2}, Ljava/util/stream/Collectors;->toMap(Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/stream/Collector;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ljava/util/Map;

    .line 41
    .line 42
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-interface {v0}, Ljava/util/Set;->stream()Ljava/util/stream/Stream;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Lz1/m5;

    .line 51
    .line 52
    invoke-direct {v1}, Lz1/m5;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Lz1/h5;

    .line 60
    .line 61
    invoke-direct {v1}, Lz1/h5;-><init>()V

    .line 62
    .line 63
    .line 64
    new-instance v2, Lz1/n5;

    .line 65
    .line 66
    invoke-direct {v2}, Lz1/n5;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {v1, v2}, Ljava/util/stream/Collectors;->toMap(Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/stream/Collector;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Ljava/util/Map;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 78
    .line 79
    monitor-exit p0

    .line 80
    return-object v0

    .line 81
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 82
    throw v0
.end method

.method public s(Ljava/util/Set;Landroid/os/UserHandle;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/os/UserHandle;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lz1/u5;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_3

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/util/Map$Entry;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Lcom/android/launcher3/model/data/B;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 30
    .line 31
    invoke-interface {p1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    const/4 v3, 0x0

    .line 48
    :goto_0
    if-ge v3, v2, :cond_0

    .line 49
    .line 50
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    check-cast v4, Lz1/Z4;

    .line 55
    .line 56
    iget-object v5, v4, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 57
    .line 58
    invoke-virtual {v5, p2}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    if-eqz v5, :cond_2

    .line 63
    .line 64
    iget-object v5, v4, Lz1/Z4;->e:LD1/i;

    .line 65
    .line 66
    if-eqz v5, :cond_1

    .line 67
    .line 68
    new-instance v4, Lz1/Z4;

    .line 69
    .line 70
    iget-object v6, p0, Lz1/u5;->e:Ls1/P;

    .line 71
    .line 72
    invoke-direct {v4, v5, v6}, Lz1/Z4;-><init>(LD1/i;Ls1/P;)V

    .line 73
    .line 74
    .line 75
    invoke-interface {v1, v3, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_1
    new-instance v5, Lz1/Z4;

    .line 80
    .line 81
    iget-object v4, v4, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 82
    .line 83
    iget-object v6, p0, Lz1/u5;->d:Lcom/android/launcher3/F1;

    .line 84
    .line 85
    iget-object v7, p0, Lz1/u5;->e:Ls1/P;

    .line 86
    .line 87
    iget-object v8, p0, Lz1/u5;->c:Landroid/content/Context;

    .line 88
    .line 89
    invoke-direct {v5, v4, v6, v7, v8}, Lz1/Z4;-><init>(Lcom/android/launcher3/widget/U;Lcom/android/launcher3/F1;Ls1/P;Landroid/content/Context;)V

    .line 90
    .line 91
    .line 92
    invoke-interface {v1, v3, v5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_3
    return-void
.end method

.method public v(Lcom/android/launcher3/util/L1;)Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/util/L1;",
            ")",
            "Ljava/util/List<",
            "Lt1/h;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->d()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lz1/u5;->c:Landroid/content/Context;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 15
    .line 16
    sget v1, Landroid/util/DisplayMetrics;->DENSITY_DEVICE_STABLE:I

    .line 17
    .line 18
    int-to-float v1, v1

    .line 19
    const/high16 v2, 0x3f800000    # 1.0f

    .line 20
    .line 21
    mul-float/2addr v1, v2

    .line 22
    const/high16 v2, 0x43200000    # 160.0f

    .line 23
    .line 24
    div-float/2addr v1, v2

    .line 25
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->s()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_0

    .line 34
    .line 35
    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    const/4 v2, 0x1

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const/4 v2, 0x0

    .line 44
    :goto_0
    if-eqz v2, :cond_1

    .line 45
    .line 46
    new-instance v3, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    const-string v4, "update: need recalculate widget info, density: "

    .line 52
    .line 53
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v4, ", default: "

    .line 60
    .line 61
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v4, ", "

    .line 68
    .line 69
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    const-string v4, "WidgetsModel"

    .line 80
    .line 81
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 87
    .line 88
    .line 89
    new-instance v4, Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .line 93
    .line 94
    :try_start_0
    new-instance v5, Lcom/android/launcher3/widget/Y0;

    .line 95
    .line 96
    iget-object v6, p0, Lz1/u5;->c:Landroid/content/Context;

    .line 97
    .line 98
    invoke-direct {v5, v6}, Lcom/android/launcher3/widget/Y0;-><init>(Landroid/content/Context;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v5, p1}, Lcom/android/launcher3/widget/Y0;->e(Lcom/android/launcher3/util/L1;)Ljava/util/List;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 110
    .line 111
    .line 112
    move-result v6

    .line 113
    if-eqz v6, :cond_3

    .line 114
    .line 115
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v6

    .line 119
    check-cast v6, Landroid/appwidget/AppWidgetProviderInfo;

    .line 120
    .line 121
    if-eqz v2, :cond_2

    .line 122
    .line 123
    invoke-direct {p0, v6, v0, v1}, Lz1/u5;->t(Landroid/appwidget/AppWidgetProviderInfo;FF)V

    .line 124
    .line 125
    .line 126
    goto :goto_2

    .line 127
    :catch_0
    move-exception p0

    .line 128
    goto :goto_4

    .line 129
    :cond_2
    :goto_2
    iget-object v7, p0, Lz1/u5;->c:Landroid/content/Context;

    .line 130
    .line 131
    invoke-static {v7, v6}, Lcom/android/launcher3/widget/U;->j(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)Lcom/android/launcher3/widget/U;

    .line 132
    .line 133
    .line 134
    move-result-object v6

    .line 135
    new-instance v7, Lz1/Z4;

    .line 136
    .line 137
    iget-object v8, p0, Lz1/u5;->d:Lcom/android/launcher3/F1;

    .line 138
    .line 139
    iget-object v9, p0, Lz1/u5;->e:Ls1/P;

    .line 140
    .line 141
    iget-object v10, p0, Lz1/u5;->c:Landroid/content/Context;

    .line 142
    .line 143
    invoke-direct {v7, v6, v8, v9, v10}, Lz1/Z4;-><init>(Lcom/android/launcher3/widget/U;Lcom/android/launcher3/F1;Ls1/P;Landroid/content/Context;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_3
    iget-object v0, p0, Lz1/u5;->c:Landroid/content/Context;

    .line 154
    .line 155
    invoke-static {v0, p1}, LD1/i;->i(Landroid/content/Context;Lcom/android/launcher3/util/L1;)Ljava/util/List;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    if-eqz v1, :cond_4

    .line 168
    .line 169
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    check-cast v1, LD1/i;

    .line 174
    .line 175
    new-instance v2, Lz1/Z4;

    .line 176
    .line 177
    iget-object v5, p0, Lz1/u5;->e:Ls1/P;

    .line 178
    .line 179
    invoke-direct {v2, v1, v5}, Lz1/Z4;-><init>(LD1/i;Ls1/P;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    goto :goto_3

    .line 189
    :cond_4
    invoke-direct {p0, v3, p1}, Lz1/u5;->u(Ljava/util/ArrayList;Lcom/android/launcher3/util/L1;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 190
    .line 191
    .line 192
    return-object v4

    .line 193
    :goto_4
    invoke-static {p0}, Lcom/android/launcher3/N5;->v(Ljava/lang/Exception;)Z

    .line 194
    .line 195
    .line 196
    move-result p1

    .line 197
    if-eqz p1, :cond_5

    .line 198
    .line 199
    return-object v4

    .line 200
    :cond_5
    throw p0
.end method
