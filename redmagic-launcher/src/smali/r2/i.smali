.class public final Lr2/i;
.super Ljava/lang/Object;
.source "WidgetsTableUtils.java"


# static fields
.field private static final a:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lz1/Z4;",
            ">;"
        }
    .end annotation
.end field

.field public static final b:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Ljava/util/ArrayList<",
            "Lz1/Z4;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final c:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Ljava/util/ArrayList<",
            "Lz1/Z4;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lr2/c;

    .line 2
    .line 3
    invoke-direct {v0}, Lr2/c;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lr2/i;->a:Ljava/util/Comparator;

    .line 7
    .line 8
    new-instance v0, Lr2/d;

    .line 9
    .line 10
    invoke-direct {v0}, Lr2/d;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Ljava/util/Comparator;->comparingInt(Ljava/util/function/ToIntFunction;)Ljava/util/Comparator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Lr2/i;->b:Ljava/util/Comparator;

    .line 18
    .line 19
    new-instance v0, Lr2/e;

    .line 20
    .line 21
    invoke-direct {v0}, Lr2/e;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Ljava/util/Comparator;->comparingInt(Ljava/util/function/ToIntFunction;)Ljava/util/Comparator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sput-object v0, Lr2/i;->c:Ljava/util/Comparator;

    .line 29
    .line 30
    return-void
.end method

.method public static synthetic a(Lz1/Z4;)I
    .locals 0

    .line 1
    iget p0, p0, Lz1/Z4;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Lz1/Z4;Lz1/Z4;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    iget v0, p0, Lz1/Z4;->j:I

    .line 18
    .line 19
    iget v1, p1, Lz1/Z4;->j:I

    .line 20
    .line 21
    if-ne v0, v1, :cond_3

    .line 22
    .line 23
    iget p0, p0, Lz1/Z4;->i:I

    .line 24
    .line 25
    iget p1, p1, Lz1/Z4;->i:I

    .line 26
    .line 27
    if-ne p0, p1, :cond_2

    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    return p0

    .line 31
    :cond_2
    if-le p0, p1, :cond_4

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_3
    if-le v0, v1, :cond_4

    .line 35
    .line 36
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_4
    :goto_1
    const/4 p0, -0x1

    .line 39
    return p0
.end method

.method public static synthetic c(Lz1/Z4;)I
    .locals 0

    .line 1
    iget p0, p0, Lz1/Z4;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d(Ljava/util/ArrayList;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

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
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    neg-int p0, p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Lr2/h;

    .line 19
    .line 20
    invoke-direct {v1}, Lr2/h;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->mapToInt(Ljava/util/function/ToIntFunction;)Ljava/util/stream/IntStream;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Ljava/util/stream/IntStream;->sum()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Lz1/Z4;

    .line 37
    .line 38
    iget p0, p0, Lz1/Z4;->j:I

    .line 39
    .line 40
    mul-int/2addr v0, p0

    .line 41
    return v0
.end method

.method public static synthetic e(Ljava/util/ArrayList;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lr2/f;

    .line 6
    .line 7
    invoke-direct {v1}, Lr2/f;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const p0, 0x7fffffff

    .line 17
    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Lr2/g;

    .line 25
    .line 26
    invoke-direct {v1}, Lr2/g;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->mapToInt(Ljava/util/function/ToIntFunction;)Ljava/util/stream/IntStream;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Ljava/util/stream/IntStream;->sum()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Lz1/Z4;

    .line 43
    .line 44
    iget p0, p0, Lz1/Z4;->j:I

    .line 45
    .line 46
    mul-int/2addr v0, p0

    .line 47
    return v0
.end method

.method public static f(Ljava/util/List;Landroid/content/Context;Lcom/android/launcher3/h0;II)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;",
            "Landroid/content/Context;",
            "Lcom/android/launcher3/h0;",
            "II)",
            "Ljava/util/List<",
            "Ljava/util/ArrayList<",
            "Lz1/Z4;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lr2/i;->a:Ljava/util/Comparator;

    .line 6
    .line 7
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->sorted(Ljava/util/Comparator;)Ljava/util/stream/Stream;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/util/List;

    .line 20
    .line 21
    invoke-static {p0, p1, p2, p3, p4}, Lr2/i;->g(Ljava/util/List;Landroid/content/Context;Lcom/android/launcher3/h0;II)Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget-object p1, Lr2/i;->b:Ljava/util/Comparator;

    .line 30
    .line 31
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->sorted(Ljava/util/Comparator;)Ljava/util/stream/Stream;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Ljava/util/List;

    .line 44
    .line 45
    return-object p0
.end method

.method public static g(Ljava/util/List;Landroid/content/Context;Lcom/android/launcher3/h0;II)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;",
            "Landroid/content/Context;",
            "Lcom/android/launcher3/h0;",
            "II)",
            "Ljava/util/List<",
            "Ljava/util/ArrayList<",
            "Lz1/Z4;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance p1, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    check-cast p2, Lz1/Z4;

    .line 21
    .line 22
    new-instance p3, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-object p1
.end method
