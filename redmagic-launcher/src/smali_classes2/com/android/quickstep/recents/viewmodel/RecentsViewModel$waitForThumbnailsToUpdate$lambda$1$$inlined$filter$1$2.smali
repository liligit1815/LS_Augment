.class public final Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1$2;
.super Ljava/lang/Object;
.source "Emitters.kt"

# interfaces
.implements LI4/e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1;->collect(LI4/e;Ll4/d;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "LI4/e;"
    }
.end annotation


# instance fields
.field final synthetic $it$inlined:Ljava/util/Map$Entry;

.field final synthetic $this_unsafeFlow:LI4/e;


# direct methods
.method public constructor <init>(LI4/e;Ljava/util/Map$Entry;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1$2;->$this_unsafeFlow:LI4/e;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1$2;->$it$inlined:Ljava/util/Map$Entry;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 8

    .line 1
    instance-of v0, p2, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1$2$1;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1$2$1;

    .line 7
    .line 8
    iget v1, v0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1$2$1;->label:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1$2$1;->label:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1$2$1;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1$2$1;-><init>(Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1$2;Ll4/d;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1$2$1;->result:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v2, v0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1$2$1;->label:I

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    if-ne v2, v3, :cond_1

    .line 37
    .line 38
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 43
    .line 44
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 45
    .line 46
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    throw p0

    .line 50
    :cond_2
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1$2;->$this_unsafeFlow:LI4/e;

    .line 54
    .line 55
    move-object v2, p1

    .line 56
    check-cast v2, Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 57
    .line 58
    if-eqz v2, :cond_3

    .line 59
    .line 60
    invoke-virtual {v2}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getSnapshotId()J

    .line 61
    .line 62
    .line 63
    move-result-wide v4

    .line 64
    iget-object p0, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1$2;->$it$inlined:Ljava/util/Map$Entry;

    .line 65
    .line 66
    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    check-cast p0, Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getSnapshotId()J

    .line 73
    .line 74
    .line 75
    move-result-wide v6

    .line 76
    cmp-long p0, v4, v6

    .line 77
    .line 78
    if-nez p0, :cond_3

    .line 79
    .line 80
    iput v3, v0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1$2$1;->label:I

    .line 81
    .line 82
    invoke-interface {p2, p1, v0}, LI4/e;->emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    if-ne p0, v1, :cond_3

    .line 87
    .line 88
    return-object v1

    .line 89
    :cond_3
    :goto_1
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 90
    .line 91
    return-object p0
.end method
