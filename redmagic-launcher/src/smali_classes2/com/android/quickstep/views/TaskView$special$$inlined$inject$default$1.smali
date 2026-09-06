.class public final Lcom/android/quickstep/views/TaskView$special$$inlined$inject$default$1;
.super Ljava/lang/Object;
.source "RecentsDependencies.kt"

# interfaces
.implements Lu4/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/TaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/views/TaskViewType;Lcom/android/quickstep/FullscreenDrawParams;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lu4/a<",
        "Li2/b;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic $extras:[Lh4/l;

.field final synthetic $factory:Lu4/l;

.field final synthetic $scope:Ljava/lang/Object;

.field final synthetic $this_inject:Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;Ljava/lang/Object;[Lh4/l;Lu4/l;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/TaskView$special$$inlined$inject$default$1;->$this_inject:Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/views/TaskView$special$$inlined$inject$default$1;->$scope:Ljava/lang/Object;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/views/TaskView$special$$inlined$inject$default$1;->$extras:[Lh4/l;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/quickstep/views/TaskView$special$$inlined$inject$default$1;->$factory:Lu4/l;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Li2/b;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView$special$$inlined$inject$default$1;->$this_inject:Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView$special$$inlined$inject$default$1;->$scope:Ljava/lang/Object;

    .line 4
    .line 5
    new-instance v2, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/views/TaskView$special$$inlined$inject$default$1;->$extras:[Lh4/l;

    .line 8
    .line 9
    invoke-direct {v2, v3}, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;-><init>([Lh4/l;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView$special$$inlined$inject$default$1;->$factory:Lu4/l;

    .line 13
    .line 14
    instance-of v3, v1, Ljava/lang/String;

    .line 15
    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    move-object v3, v1

    .line 19
    check-cast v3, Ljava/lang/String;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v3, 0x0

    .line 23
    :goto_0
    if-nez v3, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    :cond_1
    invoke-virtual {v0}, Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;->getInstance()Lcom/android/quickstep/recents/di/RecentsDependencies;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-class v1, Li2/b;

    .line 38
    .line 39
    invoke-virtual {v0, v1, v3, v2, p0}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method
