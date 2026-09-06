.class public abstract Lcom/android/launcher3/model/data/m;
.super Lcom/android/launcher3/model/data/y;
.source "CollectionInfo.kt"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/model/data/y;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onAddToDatabase(Lcom/android/launcher3/util/G;)V
    .locals 1

    .line 1
    const-string v0, "writer"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Lcom/android/launcher3/model/data/y;->onAddToDatabase(Lcom/android/launcher3/util/G;)V

    .line 7
    .line 8
    .line 9
    const-string v0, "title"

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 12
    .line 13
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/util/G;->g(Ljava/lang/String;Ljava/lang/CharSequence;)Lcom/android/launcher3/util/G;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public abstract v(Lcom/android/launcher3/model/data/y;)V
.end method

.method public final w(Ljava/util/function/Predicate;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const-string v0, "matcher"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/m;->y()Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public abstract x()Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;"
        }
    .end annotation
.end method

.method public abstract y()Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end method
