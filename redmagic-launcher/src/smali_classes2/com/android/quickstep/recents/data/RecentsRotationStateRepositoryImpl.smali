.class public final Lcom/android/quickstep/recents/data/RecentsRotationStateRepositoryImpl;
.super Ljava/lang/Object;
.source "RecentsRotationStateRepositoryImpl.kt"

# interfaces
.implements Lcom/android/quickstep/recents/data/RecentsRotationStateRepository;


# instance fields
.field private final state:Lcom/android/quickstep/util/RecentsOrientedState;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/util/RecentsOrientedState;)V
    .locals 1

    .line 1
    const-string v0, "state"

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
    iput-object p1, p0, Lcom/android/quickstep/recents/data/RecentsRotationStateRepositoryImpl;->state:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public getRecentsRotationState()Lcom/android/quickstep/recents/data/RecentsRotationState;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/data/RecentsRotationStateRepositoryImpl;->state:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 2
    .line 3
    new-instance v0, Lcom/android/quickstep/recents/data/RecentsRotationState;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->getRecentsActivityRotation()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getRotation()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-direct {v0, v1, p0}, Lcom/android/quickstep/recents/data/RecentsRotationState;-><init>(II)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method
