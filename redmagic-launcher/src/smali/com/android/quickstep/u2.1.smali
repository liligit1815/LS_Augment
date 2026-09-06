.class public final synthetic Lcom/android/quickstep/u2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/l;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/RecentTasksList;

.field public final synthetic h:Ljava/util/Set;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/RecentTasksList;Ljava/util/Set;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/u2;->g:Lcom/android/quickstep/RecentTasksList;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/u2;->h:Ljava/util/Set;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/u2;->g:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/u2;->h:Ljava/util/Set;

    .line 4
    .line 5
    check-cast p1, Landroid/app/TaskInfo;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/quickstep/RecentTasksList;->c(Lcom/android/quickstep/RecentTasksList;Ljava/util/Set;Landroid/app/TaskInfo;)Lcom/android/systemui/shared/recents/model/Task;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
