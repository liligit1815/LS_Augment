.class public final Lcom/android/quickstep/recents/viewmodel/RecentsViewData;
.super Ljava/lang/Object;
.source "RecentsViewData.kt"


# instance fields
.field private final centralTaskIds:LI4/r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI4/r<",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private final overlayEnabled:LI4/r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI4/r<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final runningTaskIds:LI4/r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI4/r<",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private final runningTaskShowScreenshot:LI4/r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI4/r<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final settledFullyVisibleTaskIds:LI4/r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI4/r<",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 5
    .line 6
    invoke-static {v0}, LI4/w;->a(Ljava/lang/Object;)LI4/r;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iput-object v1, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->overlayEnabled:LI4/r;

    .line 11
    .line 12
    invoke-static {}, Li4/M;->b()Ljava/util/Set;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v1}, LI4/w;->a(Ljava/lang/Object;)LI4/r;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->settledFullyVisibleTaskIds:LI4/r;

    .line 21
    .line 22
    invoke-static {}, Li4/M;->b()Ljava/util/Set;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v1}, LI4/w;->a(Ljava/lang/Object;)LI4/r;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->centralTaskIds:LI4/r;

    .line 31
    .line 32
    invoke-static {}, Li4/M;->b()Ljava/util/Set;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {v1}, LI4/w;->a(Ljava/lang/Object;)LI4/r;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->runningTaskIds:LI4/r;

    .line 41
    .line 42
    invoke-static {v0}, LI4/w;->a(Ljava/lang/Object;)LI4/r;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->runningTaskShowScreenshot:LI4/r;

    .line 47
    .line 48
    return-void
.end method


# virtual methods
.method public final getCentralTaskIds()LI4/r;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LI4/r<",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->centralTaskIds:LI4/r;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getOverlayEnabled()LI4/r;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LI4/r<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->overlayEnabled:LI4/r;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getRunningTaskIds()LI4/r;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LI4/r<",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->runningTaskIds:LI4/r;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getRunningTaskShowScreenshot()LI4/r;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LI4/r<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->runningTaskShowScreenshot:LI4/r;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getSettledFullyVisibleTaskIds()LI4/r;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LI4/r<",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->settledFullyVisibleTaskIds:LI4/r;

    .line 2
    .line 3
    return-object p0
.end method
