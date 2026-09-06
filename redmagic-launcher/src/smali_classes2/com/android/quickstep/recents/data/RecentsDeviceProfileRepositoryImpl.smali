.class public final Lcom/android/quickstep/recents/data/RecentsDeviceProfileRepositoryImpl;
.super Ljava/lang/Object;
.source "RecentsDeviceProfileRepositoryImpl.kt"

# interfaces
.implements Lcom/android/quickstep/recents/data/RecentsDeviceProfileRepository;


# instance fields
.field private final container:Lcom/android/quickstep/views/RecentsViewContainer;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/views/RecentsViewContainer;)V
    .locals 1

    .line 1
    const-string v0, "container"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/recents/data/RecentsDeviceProfileRepositoryImpl;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public getRecentsDeviceProfile()Lcom/android/quickstep/recents/data/RecentsDeviceProfile;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/recents/data/RecentsDeviceProfileRepositoryImpl;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/android/quickstep/recents/data/RecentsDeviceProfile;

    .line 8
    .line 9
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/recents/data/RecentsDeviceProfileRepositoryImpl;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 12
    .line 13
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, LO2/d;->c(Landroid/content/Context;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-direct {v1, v0, p0}, Lcom/android/quickstep/recents/data/RecentsDeviceProfile;-><init>(ZZ)V

    .line 22
    .line 23
    .line 24
    return-object v1
.end method
