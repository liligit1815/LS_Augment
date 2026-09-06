.class final Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;
.super Lkotlin/coroutines/jvm/internal/d;
.source "TasksRepository.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/recents/data/TasksRepository;->fetchIcon(Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/f;
    c = "com.android.quickstep.recents.data.TasksRepository"
    f = "TasksRepository.kt"
    l = {
        0x8d
    }
    m = "fetchIcon"
.end annotation


# instance fields
.field I$0:I

.field L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field label:I

.field synthetic result:Ljava/lang/Object;

.field final synthetic this$0:Lcom/android/quickstep/recents/data/TasksRepository;


# direct methods
.method constructor <init>(Lcom/android/quickstep/recents/data/TasksRepository;Ll4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/recents/data/TasksRepository;",
            "Ll4/d<",
            "-",
            "Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lkotlin/coroutines/jvm/internal/d;-><init>(Ll4/d;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;->result:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;->label:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;->label:I

    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {p1, v0, p0}, Lcom/android/quickstep/recents/data/TasksRepository;->access$fetchIcon(Lcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
