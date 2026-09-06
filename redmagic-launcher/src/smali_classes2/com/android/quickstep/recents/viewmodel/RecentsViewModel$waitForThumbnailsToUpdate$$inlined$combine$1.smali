.class public final Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1;
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
        "Lh4/t;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic $flowArray$inlined:[LI4/d;


# direct methods
.method public constructor <init>([LI4/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1;->$flowArray$inlined:[LI4/d;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public collect(LI4/e;Ll4/d;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1;->$flowArray$inlined:[LI4/d;

    .line 2
    .line 3
    new-instance v0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1$2;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1$2;-><init>([LI4/d;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1$3;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-direct {v1, v2}, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1$3;-><init>(Ll4/d;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, p0, v0, v1, p2}, LJ4/k;->a(LI4/e;[LI4/d;Lu4/a;Lu4/q;Ll4/d;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-ne p0, p1, :cond_0

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 26
    .line 27
    return-object p0
.end method
