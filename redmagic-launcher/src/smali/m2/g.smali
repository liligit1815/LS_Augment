.class public abstract Lm2/g;
.super Ljava/lang/Object;
.source "WidgetsListBaseEntry.java"


# instance fields
.field public final a:Lcom/android/launcher3/model/data/B;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;"
        }
    .end annotation
.end field

.field public d:I

.field public final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/model/data/B;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lm2/g;->d:I

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lm2/g;->e:Ljava/util/List;

    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lm2/g;->f:Ljava/util/List;

    .line 20
    .line 21
    iput-object p1, p0, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 22
    .line 23
    iput-object p2, p0, Lm2/g;->b:Ljava/lang/String;

    .line 24
    .line 25
    invoke-interface {p3}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance p2, Lcom/android/launcher3/widget/W0;

    .line 30
    .line 31
    invoke-direct {p2}, Lcom/android/launcher3/widget/W0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->sorted(Ljava/util/Comparator;)Ljava/util/stream/Stream;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Ljava/util/List;

    .line 47
    .line 48
    iput-object p1, p0, Lm2/g;->c:Ljava/util/List;

    .line 49
    .line 50
    invoke-direct {p0}, Lm2/g;->h()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public static synthetic a(Lm2/g;Lz1/Z4;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lm2/g;->j(Lz1/Z4;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ljava/util/ArrayList;Lz1/Z4;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, v0, Lcom/android/launcher3/widget/U;->t:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic c(Lm2/g;Ljava/util/ArrayList;Lz1/Z4;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lm2/g;->k(Ljava/util/ArrayList;Lz1/Z4;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private h()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lm2/g;->l()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lm2/g;->c:Ljava/util/List;

    .line 5
    .line 6
    new-instance v1, Lm2/f;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lm2/f;-><init>(Lm2/g;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {v0, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic j(Lz1/Z4;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 2
    .line 3
    invoke-static {v0}, Lf1/d;->a(Landroid/content/ComponentName;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lm2/g;->e:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-boolean v0, v0, Lcom/android/launcher3/widget/U;->t:Z

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Lm2/g;->e:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    iget-object p0, p0, Lm2/g;->f:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private synthetic k(Ljava/util/ArrayList;Lz1/Z4;)V
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lm2/g;->i(Landroid/content/ComponentName;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public abstract d()Lm2/g;
.end method

.method public e()Lz1/Z4;
    .locals 5

    .line 1
    iget v0, p0, Lm2/g;->d:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_5

    .line 5
    .line 6
    iget-object v0, p0, Lm2/g;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-ne v0, v2, :cond_0

    .line 14
    .line 15
    goto :goto_2

    .line 16
    :cond_0
    iget-object v0, p0, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 19
    .line 20
    const-string v2, "com.zte.mifavor.zsearch"

    .line 21
    .line 22
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Lm2/g;->c:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lz1/Z4;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_1
    iget-object v0, p0, Lm2/g;->c:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lz1/Z4;

    .line 44
    .line 45
    :goto_0
    iget-object v2, p0, Lm2/g;->c:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-ge v1, v2, :cond_4

    .line 52
    .line 53
    iget-object v2, p0, Lm2/g;->c:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Lz1/Z4;

    .line 60
    .line 61
    iget-object v3, v2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 62
    .line 63
    invoke-virtual {p0, v3}, Lm2/g;->i(Landroid/content/ComponentName;)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_3

    .line 68
    .line 69
    iget v3, v2, Lz1/Z4;->i:I

    .line 70
    .line 71
    iget v4, v0, Lz1/Z4;->i:I

    .line 72
    .line 73
    if-le v3, v4, :cond_2

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_2
    if-ne v3, v4, :cond_3

    .line 77
    .line 78
    iget v3, v2, Lz1/Z4;->j:I

    .line 79
    .line 80
    iget v4, v0, Lz1/Z4;->j:I

    .line 81
    .line 82
    if-le v3, v4, :cond_3

    .line 83
    .line 84
    :goto_1
    move-object v0, v2

    .line 85
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_4
    return-object v0

    .line 89
    :cond_5
    :goto_2
    iget-object p0, p0, Lm2/g;->c:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    check-cast p0, Lz1/Z4;

    .line 96
    .line 97
    return-object p0
.end method

.method public f()I
    .locals 2

    .line 1
    iget-object v0, p0, Lm2/g;->c:Ljava/util/List;

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
    iget-object v0, p0, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const-string v1, "com.zte.mifavor.zsearch"

    .line 12
    .line 13
    iget-object v0, v0, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget p0, p0, Lm2/g;->d:I

    .line 22
    .line 23
    return p0

    .line 24
    :cond_1
    iget-object p0, p0, Lm2/g;->c:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lm2/g;->f:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-lez p0, :cond_0

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

.method public i(Landroid/content/ComponentName;)Z
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    invoke-static {p1}, Lf1/d;->l(Landroid/content/ComponentName;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public l()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lm2/g;->c:Ljava/util/List;

    .line 7
    .line 8
    new-instance v2, Lm2/d;

    .line 9
    .line 10
    invoke-direct {v2, p0, v0}, Lm2/d;-><init>(Lm2/g;Ljava/util/ArrayList;)V

    .line 11
    .line 12
    .line 13
    invoke-interface {v1, v2}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lm2/g;->d:I

    .line 21
    .line 22
    return-void
.end method

.method public m()Z
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lm2/g;->c:Ljava/util/List;

    .line 7
    .line 8
    new-instance v1, Lm2/e;

    .line 9
    .line 10
    invoke-direct {v1, v0}, Lm2/e;-><init>(Ljava/util/ArrayList;)V

    .line 11
    .line 12
    .line 13
    invoke-interface {p0, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-lez p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method
