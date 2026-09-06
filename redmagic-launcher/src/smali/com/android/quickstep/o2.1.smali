.class public final synthetic Lcom/android/quickstep/o2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/RecentTasksList;

.field public final synthetic h:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

.field public final synthetic i:Ljava/util/function/Consumer;

.field public final synthetic j:Ljava/util/function/Predicate;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/RecentTasksList;Lcom/android/quickstep/RecentTasksList$TaskLoadResult;Ljava/util/function/Consumer;Ljava/util/function/Predicate;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/o2;->g:Lcom/android/quickstep/RecentTasksList;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/o2;->h:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/o2;->i:Ljava/util/function/Consumer;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/o2;->j:Ljava/util/function/Predicate;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/o2;->g:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/o2;->h:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/o2;->i:Ljava/util/function/Consumer;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/o2;->j:Ljava/util/function/Predicate;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/quickstep/RecentTasksList;->l(Lcom/android/quickstep/RecentTasksList;Lcom/android/quickstep/RecentTasksList$TaskLoadResult;Ljava/util/function/Consumer;Ljava/util/function/Predicate;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
