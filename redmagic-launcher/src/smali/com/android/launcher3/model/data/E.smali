.class public final Lcom/android/launcher3/model/data/E;
.super Lcom/android/launcher3/model/data/I;
.source "TaskViewItemInfo.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/model/data/E$a;
    }
.end annotation


# static fields
.field public static final B:Lcom/android/launcher3/model/data/E$a;


# instance fields
.field private final A:Lcom/android/launcher3/logger/LauncherAtom$TaskView;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/model/data/E$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/model/data/E$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/model/data/E;->B:Lcom/android/launcher3/model/data/E$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;)V
    .locals 3

    .line 1
    const-string v0, "taskView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/model/data/I;-><init>()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x7

    .line 10
    iput v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 11
    .line 12
    const/16 v0, -0x6d

    .line 13
    .line 14
    iput v0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 15
    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/android/quickstep/TaskUtils;->getLaunchComponentKeyForTask(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Lcom/android/launcher3/util/E;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, v0, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 29
    .line 30
    iput-object v1, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 31
    .line 32
    new-instance v1, Landroid/content/Intent;

    .line 33
    .line 34
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 35
    .line 36
    .line 37
    iget-object v2, v0, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iput-object v1, p0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 44
    .line 45
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    iget-object p2, p2, Lcom/android/systemui/shared/recents/model/Task;->title:Ljava/lang/String;

    .line 50
    .line 51
    iput-object p2, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 52
    .line 53
    invoke-static {}, Lcom/android/launcher3/y0;->x0()Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    if-eqz p2, :cond_0

    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-static {p2}, LD1/t;->k(Landroid/content/Context;)LD1/t;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    iget-object v1, v0, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 68
    .line 69
    invoke-virtual {p2, v1}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {p2}, Lcom/android/launcher3/util/N2;->d()Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-eqz p2, :cond_0

    .line 78
    .line 79
    iget p2, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 80
    .line 81
    or-int/lit16 p2, p2, 0x2000

    .line 82
    .line 83
    iput p2, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 84
    .line 85
    :cond_0
    iget-object p2, v0, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 86
    .line 87
    invoke-virtual {p2}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    goto :goto_0

    .line 92
    :cond_1
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    iput-object p2, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 97
    .line 98
    new-instance p2, Landroid/content/Intent;

    .line 99
    .line 100
    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    .line 101
    .line 102
    .line 103
    iput-object p2, p0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 104
    .line 105
    const-string p2, ""

    .line 106
    .line 107
    :goto_0
    sget-object v0, Lcom/android/launcher3/model/data/E;->B:Lcom/android/launcher3/model/data/E$a;

    .line 108
    .line 109
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getType()Lcom/android/quickstep/views/TaskViewType;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    if-eqz v2, :cond_2

    .line 122
    .line 123
    invoke-virtual {v2, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    goto :goto_1

    .line 128
    :cond_2
    const/4 v2, -0x1

    .line 129
    :goto_1
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    invoke-virtual {v0, v1, v2, p2, p1}, Lcom/android/launcher3/model/data/E$a;->a(IILjava/lang/String;I)Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iput-object p1, p0, Lcom/android/launcher3/model/data/E;->A:Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 142
    .line 143
    return-void
.end method


# virtual methods
.method public buildProto(Lcom/android/launcher3/model/data/m;Landroid/content/Context;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/model/data/y;->buildProto(Lcom/android/launcher3/model/data/m;Landroid/content/Context;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Lcom/google/protobuf/y;->toBuilder()Lcom/google/protobuf/y$a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/model/data/E;->A:Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setTaskView(Lcom/android/launcher3/logger/LauncherAtom$TaskView;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p1, "build(...)"

    .line 27
    .line 28
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 32
    .line 33
    return-object p0
.end method
