.class public final Lcom/android/quickstep/util/SingleTask$Companion;
.super Ljava/lang/Object;
.source "GroupTask.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/SingleTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/SingleTask$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final createTaskItemInfo(Lcom/android/quickstep/util/SingleTask;)Lcom/android/launcher3/model/data/D;
    .locals 1

    .line 1
    const-string p0, "task"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Lcom/android/launcher3/model/data/I;

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/model/data/I;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/quickstep/util/SingleTask;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->title:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/android/quickstep/util/SingleTask;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->baseIntent:Landroid/content/Intent;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 28
    .line 29
    const/4 v0, 0x7

    .line 30
    iput v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/android/quickstep/util/SingleTask;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 39
    .line 40
    new-instance v0, Lcom/android/launcher3/model/data/D;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/android/quickstep/util/SingleTask;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 47
    .line 48
    iget p1, p1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 49
    .line 50
    invoke-direct {v0, p1, p0}, Lcom/android/launcher3/model/data/D;-><init>(ILcom/android/launcher3/model/data/I;)V

    .line 51
    .line 52
    .line 53
    return-object v0
.end method
