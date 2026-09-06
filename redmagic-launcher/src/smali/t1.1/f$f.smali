.class public final Lt1/f$f;
.super Li4/d;
.source "BaseIconCache.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lt1/f;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Looper;IIZLs1/T;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Li4/d<",
        "Lcom/android/launcher3/util/E;",
        "Lt1/f$a;",
        ">;"
    }
.end annotation


# instance fields
.field private final g:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Lcom/android/launcher3/util/E;",
            "Lt1/f$a;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Li4/d;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lt1/f$f;->g:Ljava/util/Set;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Lcom/android/launcher3/util/E;",
            "Lt1/f$a;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lt1/f$f;->g:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public final bridge containsKey(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/util/E;

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
    check-cast p1, Lcom/android/launcher3/util/E;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lt1/f$f;->e(Lcom/android/launcher3/util/E;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final bridge containsValue(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    instance-of v0, p1, Lt1/f$a;

    .line 6
    .line 7
    :goto_0
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    check-cast p1, Lt1/f$a;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lt1/f$f;->f(Lt1/f$a;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public bridge e(Lcom/android/launcher3/util/E;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge f(Lt1/f$a;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ljava/util/AbstractMap;->containsValue(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge g(Lcom/android/launcher3/util/E;)Lt1/f$a;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lt1/f$a;

    .line 6
    .line 7
    return-object p0
.end method

.method public final bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/util/E;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    check-cast p1, Lcom/android/launcher3/util/E;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lt1/f$f;->g(Lcom/android/launcher3/util/E;)Lt1/f$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final bridge synthetic getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/util/E;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-object p2

    .line 6
    :cond_0
    check-cast p1, Lcom/android/launcher3/util/E;

    .line 7
    .line 8
    check-cast p2, Lt1/f$a;

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Lt1/f$f;->h(Lcom/android/launcher3/util/E;Lt1/f$a;)Lt1/f$a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public bridge h(Lcom/android/launcher3/util/E;Lt1/f$a;)Lt1/f$a;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ljava/util/AbstractMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lt1/f$a;

    .line 6
    .line 7
    return-object p0
.end method

.method public i(Lcom/android/launcher3/util/E;Lt1/f$a;)Lt1/f$a;
    .locals 0

    .line 1
    const-string p0, "key"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object p2
.end method

.method public bridge j(Lcom/android/launcher3/util/E;)Lt1/f$a;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lt1/f$a;

    .line 6
    .line 7
    return-object p0
.end method

.method public bridge k(Lcom/android/launcher3/util/E;Lt1/f$a;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/util/E;

    .line 2
    .line 3
    check-cast p2, Lt1/f$a;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lt1/f$f;->i(Lcom/android/launcher3/util/E;Lt1/f$a;)Lt1/f$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final bridge synthetic remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/util/E;

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    check-cast p1, Lcom/android/launcher3/util/E;

    invoke-virtual {p0, p1}, Lt1/f$f;->j(Lcom/android/launcher3/util/E;)Lt1/f$a;

    move-result-object p0

    return-object p0
.end method

.method public final bridge remove(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2

    .line 2
    instance-of v0, p1, Lcom/android/launcher3/util/E;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    if-nez p2, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    instance-of v0, p2, Lt1/f$a;

    :goto_0
    if-nez v0, :cond_2

    return v1

    :cond_2
    check-cast p1, Lcom/android/launcher3/util/E;

    check-cast p2, Lt1/f$a;

    invoke-virtual {p0, p1, p2}, Lt1/f$f;->k(Lcom/android/launcher3/util/E;Lt1/f$a;)Z

    move-result p0

    return p0
.end method
