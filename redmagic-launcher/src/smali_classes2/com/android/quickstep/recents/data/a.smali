.class public final synthetic Lcom/android/quickstep/recents/data/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/a;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;

.field public final synthetic h:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

.field public final synthetic i:Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskIconChangedCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskIconChangedCallback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/recents/data/a;->g:Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/recents/data/a;->h:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/recents/data/a;->i:Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskIconChangedCallback;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/recents/data/a;->g:Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/recents/data/a;->h:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/recents/data/a;->i:Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskIconChangedCallback;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->a(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskIconChangedCallback;)Lh4/t;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
