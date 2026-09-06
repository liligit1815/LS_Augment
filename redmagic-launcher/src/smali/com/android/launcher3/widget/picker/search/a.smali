.class public final Lcom/android/launcher3/widget/picker/search/a;
.super Ljava/lang/Object;
.source "SimpleWidgetsSearchAlgorithm.java"

# interfaces
.implements LI1/a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LI1/a<",
        "Lm2/g;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Landroid/os/Handler;

.field private final b:Lcom/android/launcher3/widget/picker/search/b$a;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/widget/picker/search/b$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/search/a;->a:Landroid/os/Handler;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/search/a;->b:Lcom/android/launcher3/widget/picker/search/b$a;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic c(Ljava/lang/String;LI1/e$b;Lz1/Z4;)Z
    .locals 0

    .line 1
    iget-object p2, p2, Lz1/Z4;->g:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p2, p1}, LI1/e;->d(Ljava/lang/String;Ljava/lang/String;LI1/e$b;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static synthetic d(LI1/b;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1, p2}, LI1/b;->b(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lm2/g;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lm2/o;

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Ljava/lang/String;Ljava/util/ArrayList;Lm2/g;)V
    .locals 2

    .line 1
    iget-object v0, p2, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p2, Lm2/g;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {p0, v0, v1}, Lcom/android/launcher3/widget/picker/search/a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p2, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 22
    .line 23
    iget-object v1, p2, Lm2/g;->b:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0, v1, p0}, Lm2/o;->s(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;)Lm2/o;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    new-instance v0, Lm2/h;

    .line 33
    .line 34
    iget-object v1, p2, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 35
    .line 36
    iget-object p2, p2, Lm2/g;->b:Ljava/lang/String;

    .line 37
    .line 38
    invoke-direct {v0, v1, p2, p0}, Lm2/h;-><init>(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method private static g(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;)",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, LI1/e$b;->a()LI1/e$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, p1, v0}, LI1/e;->d(Ljava/lang/String;Ljava/lang/String;LI1/e$b;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    return-object p2

    .line 12
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance p2, Lp2/e;

    .line 17
    .line 18
    invoke-direct {p2, p0, v0}, Lp2/e;-><init>(Ljava/lang/String;LI1/e$b;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Ljava/util/List;

    .line 34
    .line 35
    return-object p0
.end method

.method public static h(Lcom/android/launcher3/widget/picker/search/b$a;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/widget/picker/search/b$a;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lm2/g;",
            ">;"
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
    invoke-interface {p0}, Lcom/android/launcher3/widget/picker/search/b$a;->a()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v1, Lp2/c;

    .line 15
    .line 16
    invoke-direct {v1}, Lp2/c;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-interface {p0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v1, Lp2/d;

    .line 24
    .line 25
    invoke-direct {v1, p1, v0}, Lp2/d;-><init>(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p0, v1}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 29
    .line 30
    .line 31
    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/String;LI1/b;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "LI1/b<",
            "Lm2/g;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/search/a;->b:Lcom/android/launcher3/widget/picker/search/b$a;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/android/launcher3/widget/picker/search/a;->h(Lcom/android/launcher3/widget/picker/search/b$a;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/search/a;->a:Landroid/os/Handler;

    .line 8
    .line 9
    new-instance v1, Lp2/b;

    .line 10
    .line 11
    invoke-direct {v1, p2, p1, v0}, Lp2/b;-><init>(LI1/b;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public cancel(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/search/a;->a:Landroid/os/Handler;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method
