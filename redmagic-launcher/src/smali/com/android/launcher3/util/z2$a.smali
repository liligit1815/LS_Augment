.class public final Lcom/android/launcher3/util/z2$a;
.super Ljava/lang/Object;
.source "StableViewInfo.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/util/z2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/z2$a;-><init>()V

    return-void
.end method

.method private final c(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/z2;
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getStableId()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_2

    .line 7
    .line 8
    iget v1, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 9
    .line 10
    const/4 v2, -0x1

    .line 11
    if-ne v1, v2, :cond_1

    .line 12
    .line 13
    iget v1, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 14
    .line 15
    if-eq v1, v2, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-object v0

    .line 19
    :cond_1
    :goto_0
    new-instance v0, Lcom/android/launcher3/util/z2;

    .line 20
    .line 21
    iget v1, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 22
    .line 23
    iget p1, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 24
    .line 25
    invoke-direct {v0, v1, p1, p0}, Lcom/android/launcher3/util/z2;-><init>(IILjava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    return-object v0
.end method


# virtual methods
.method public final a(Ljava/util/List;)Lcom/android/launcher3/util/z2;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroid/os/IBinder;",
            ">;)",
            "Lcom/android/launcher3/util/z2;"
        }
    .end annotation

    .line 1
    const-string p0, "launchCookies"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Landroid/os/IBinder;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/android/launcher3/util/F1;->b(Landroid/os/IBinder;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/android/launcher3/util/z2;

    .line 27
    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    return-object p1

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method

.method public final b(Lcom/android/launcher3/model/data/y;)Landroid/os/IBinder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/z2$a;->c(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/z2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/util/F1;->c(Ljava/lang/Object;)Landroid/os/IBinder;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method
