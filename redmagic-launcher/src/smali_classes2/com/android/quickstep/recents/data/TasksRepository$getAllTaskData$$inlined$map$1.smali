.class public final Lcom/android/quickstep/recents/data/TasksRepository$getAllTaskData$$inlined$map$1;
.super Ljava/lang/Object;
.source "SafeCollector.common.kt"

# interfaces
.implements LI4/d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/recents/data/TasksRepository;->getAllTaskData(Z)LI4/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LI4/d<",
        "Ljava/util/List<",
        "+",
        "Lcom/android/systemui/shared/recents/model/Task;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic $this_unsafeTransform$inlined:LI4/d;


# direct methods
.method public constructor <init>(LI4/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository$getAllTaskData$$inlined$map$1;->$this_unsafeTransform$inlined:LI4/d;

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
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TasksRepository$getAllTaskData$$inlined$map$1;->$this_unsafeTransform$inlined:LI4/d;

    .line 2
    .line 3
    new-instance v0, Lcom/android/quickstep/recents/data/TasksRepository$getAllTaskData$$inlined$map$1$2;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Lcom/android/quickstep/recents/data/TasksRepository$getAllTaskData$$inlined$map$1$2;-><init>(LI4/e;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, v0, p2}, LI4/d;->collect(LI4/e;Ll4/d;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-ne p0, p1, :cond_0

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 20
    .line 21
    return-object p0
.end method
