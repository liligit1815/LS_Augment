.class public final Lm2/o;
.super Lm2/g;
.source "WidgetsListHeaderEntry.java"


# static fields
.field private static final j:Ljava/util/function/BiFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/BiFunction<",
            "Landroid/content/Context;",
            "Lm2/o;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final g:Z

.field private final h:I

.field private final i:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lm2/l;

    .line 2
    .line 3
    invoke-direct {v0}, Lm2/l;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lm2/o;->j:Ljava/util/function/BiFunction;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;IZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/model/data/B;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;IZZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lm2/g;-><init>(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;)V

    .line 2
    iput p4, p0, Lm2/o;->h:I

    .line 3
    iput-boolean p5, p0, Lm2/o;->i:Z

    .line 4
    iput-boolean p6, p0, Lm2/o;->g:Z

    return-void
.end method

.method private constructor <init>(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/model/data/B;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;ZZ)V"
        }
    .end annotation

    .line 5
    invoke-direct {p0, p1, p2, p3}, Lm2/g;-><init>(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;)V

    .line 6
    invoke-interface {p3}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object p1

    new-instance p2, Lm2/m;

    invoke-direct {p2}, Lm2/m;-><init>()V

    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/stream/Stream;->count()J

    move-result-wide p1

    long-to-int p1, p1

    iput p1, p0, Lm2/o;->h:I

    .line 7
    iput-boolean p4, p0, Lm2/o;->i:Z

    .line 8
    iput-boolean p5, p0, Lm2/o;->g:Z

    .line 9
    invoke-virtual {p0}, Lm2/o;->v()V

    return-void
.end method

.method public static synthetic n(Landroid/content/Context;Lm2/o;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p1, Lm2/g;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p1, Lm2/n;

    .line 8
    .line 9
    invoke-direct {p1}, Lm2/n;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Ljava/util/stream/Stream;->sorted()Ljava/util/stream/Stream;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string p1, ", "

    .line 21
    .line 22
    invoke-static {p1}, Ljava/util/stream/Collectors;->joining(Ljava/lang/CharSequence;)Ljava/util/stream/Collector;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Ljava/lang/String;

    .line 31
    .line 32
    return-object p0
.end method

.method public static synthetic o(Lz1/Z4;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 2
    .line 3
    if-eqz p0, :cond_0

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

.method public static synthetic p(Lz1/Z4;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/Z4;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static q(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;)Lm2/o;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/model/data/B;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;)",
            "Lm2/o;"
        }
    .end annotation

    .line 1
    new-instance v0, Lm2/o;

    .line 2
    .line 3
    const/4 v4, 0x0

    .line 4
    const/4 v5, 0x0

    .line 5
    move-object v1, p0

    .line 6
    move-object v2, p1

    .line 7
    move-object v3, p2

    .line 8
    invoke-direct/range {v0 .. v5}, Lm2/o;-><init>(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;ZZ)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static r(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;I)Lm2/o;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/model/data/B;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;I)",
            "Lm2/o;"
        }
    .end annotation

    .line 1
    new-instance v0, Lm2/o;

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    const/4 v6, 0x0

    .line 5
    move-object v1, p0

    .line 6
    move-object v2, p1

    .line 7
    move-object v3, p2

    .line 8
    move v4, p3

    .line 9
    invoke-direct/range {v0 .. v6}, Lm2/o;-><init>(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;IZZ)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static s(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;)Lm2/o;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/model/data/B;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;)",
            "Lm2/o;"
        }
    .end annotation

    .line 1
    new-instance v0, Lm2/o;

    .line 2
    .line 3
    const/4 v4, 0x1

    .line 4
    const/4 v5, 0x0

    .line 5
    move-object v1, p0

    .line 6
    move-object v2, p1

    .line 7
    move-object v3, p2

    .line 8
    invoke-direct/range {v0 .. v5}, Lm2/o;-><init>(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;ZZ)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public d()Lm2/g;
    .locals 7

    .line 1
    new-instance v0, Lm2/o;

    .line 2
    .line 3
    iget-object v1, p0, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 4
    .line 5
    iget-object v2, p0, Lm2/g;->b:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Lm2/g;->c:Ljava/util/List;

    .line 8
    .line 9
    iget v4, p0, Lm2/o;->h:I

    .line 10
    .line 11
    iget-boolean v5, p0, Lm2/o;->i:Z

    .line 12
    .line 13
    iget-boolean v6, p0, Lm2/o;->g:Z

    .line 14
    .line 15
    invoke-direct/range {v0 .. v6}, Lm2/o;-><init>(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;IZZ)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lm2/o;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    check-cast p1, Lm2/o;

    .line 8
    .line 9
    iget-object v0, p0, Lm2/g;->c:Ljava/util/List;

    .line 10
    .line 11
    iget-object v2, p1, Lm2/g;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0, v2}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 20
    .line 21
    iget-object v2, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Lcom/android/launcher3/model/data/B;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lm2/g;->b:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v2, p1, Lm2/g;->b:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-boolean v0, p0, Lm2/o;->g:Z

    .line 40
    .line 41
    iget-boolean v2, p1, Lm2/o;->g:Z

    .line 42
    .line 43
    if-ne v0, v2, :cond_1

    .line 44
    .line 45
    iget v0, p0, Lm2/o;->h:I

    .line 46
    .line 47
    iget v2, p1, Lm2/o;->h:I

    .line 48
    .line 49
    if-ne v0, v2, :cond_1

    .line 50
    .line 51
    iget-boolean p0, p0, Lm2/o;->i:Z

    .line 52
    .line 53
    iget-boolean p1, p1, Lm2/o;->i:Z

    .line 54
    .line 55
    if-ne p0, p1, :cond_1

    .line 56
    .line 57
    const/4 p0, 0x1

    .line 58
    return p0

    .line 59
    :cond_1
    return v1
.end method

.method public t()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lm2/o;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Header:"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, ":"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lm2/g;->c:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public u()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lm2/o;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public v()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lm2/o;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lm2/g;->e:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lm2/g;->e:Ljava/util/List;

    .line 11
    .line 12
    iget-object p0, p0, Lm2/g;->c:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public w()Lm2/o;
    .locals 8

    .line 1
    iget-boolean v0, p0, Lm2/o;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance v1, Lm2/o;

    .line 7
    .line 8
    iget-object v2, p0, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 9
    .line 10
    iget-object v3, p0, Lm2/g;->b:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v4, p0, Lm2/g;->c:Ljava/util/List;

    .line 13
    .line 14
    iget v5, p0, Lm2/o;->h:I

    .line 15
    .line 16
    iget-boolean v6, p0, Lm2/o;->i:Z

    .line 17
    .line 18
    const/4 v7, 0x1

    .line 19
    invoke-direct/range {v1 .. v7}, Lm2/o;-><init>(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;IZZ)V

    .line 20
    .line 21
    .line 22
    return-object v1
.end method
