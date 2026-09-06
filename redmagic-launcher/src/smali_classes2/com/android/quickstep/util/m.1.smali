.class public final synthetic Lcom/android/quickstep/util/m;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/util/AppPairsController;

.field public final synthetic b:Lcom/android/launcher3/taskbar/I1;

.field public final synthetic c:Lcom/android/launcher3/apppairs/AppPairIcon;

.field public final synthetic d:Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

.field public final synthetic e:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/util/AppPairsController;Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/apppairs/AppPairIcon;Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/m;->a:Lcom/android/quickstep/util/AppPairsController;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/m;->b:Lcom/android/launcher3/taskbar/I1;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/util/m;->c:Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/util/m;->d:Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/quickstep/util/m;->e:Ljava/util/List;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/m;->a:Lcom/android/quickstep/util/AppPairsController;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/m;->b:Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/util/m;->c:Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/util/m;->d:Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/android/quickstep/util/m;->e:Ljava/util/List;

    .line 10
    .line 11
    move-object v5, p1

    .line 12
    check-cast v5, [Lcom/android/systemui/shared/recents/model/Task;

    .line 13
    .line 14
    invoke-static/range {v0 .. v5}, Lcom/android/quickstep/util/AppPairsController;->g(Lcom/android/quickstep/util/AppPairsController;Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/apppairs/AppPairIcon;Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;Ljava/util/List;[Lcom/android/systemui/shared/recents/model/Task;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
