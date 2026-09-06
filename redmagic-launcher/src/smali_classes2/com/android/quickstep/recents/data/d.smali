.class public final synthetic Lcom/android/quickstep/recents/data/d;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/a;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;

.field public final synthetic h:Lcom/android/systemui/shared/recents/model/Task$TaskKey;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/recents/data/d;->g:Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/recents/data/d;->h:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/recents/data/d;->g:Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/recents/data/d;->h:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->d(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Lh4/t;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
