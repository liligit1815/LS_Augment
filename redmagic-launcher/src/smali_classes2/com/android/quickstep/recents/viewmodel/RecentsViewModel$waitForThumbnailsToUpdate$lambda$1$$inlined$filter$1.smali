.class public final Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1;
.super Ljava/lang/Object;
.source "SafeCollector.common.kt"

# interfaces
.implements LI4/d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;->waitForThumbnailsToUpdate(Ljava/util/Map;Ll4/d;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LI4/d<",
        "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic $it$inlined:Ljava/util/Map$Entry;

.field final synthetic $this_unsafeTransform$inlined:LI4/d;


# direct methods
.method public constructor <init>(LI4/d;Ljava/util/Map$Entry;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1;->$this_unsafeTransform$inlined:LI4/d;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1;->$it$inlined:Ljava/util/Map$Entry;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public collect(LI4/e;Ll4/d;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1;->$this_unsafeTransform$inlined:LI4/d;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1$2;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1;->$it$inlined:Ljava/util/Map$Entry;

    .line 6
    .line 7
    invoke-direct {v1, p1, p0}, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1$2;-><init>(LI4/e;Ljava/util/Map$Entry;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1, p2}, LI4/d;->collect(LI4/e;Ll4/d;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-ne p0, p1, :cond_0

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 22
    .line 23
    return-object p0
.end method
