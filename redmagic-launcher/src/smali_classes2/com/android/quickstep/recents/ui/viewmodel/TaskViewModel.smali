.class public final Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;
.super Ljava/lang/Object;
.source "TaskViewModel.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$Companion;
    }
.end annotation


# static fields
.field private static final Companion:Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$Companion;

.field public static final TAG:Ljava/lang/String; = "TaskViewModel"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# instance fields
.field private final getSysUiStatusNavFlagsUseCase:Lcom/android/quickstep/recents/domain/usecase/GetSysUiStatusNavFlagsUseCase;

.field private final getTaskUseCase:Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase;

.field private final getThumbnailPositionUseCase:Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;

.field private final isCentralTask:LI4/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI4/d<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final isLiveTile:LI4/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI4/d<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final isThumbnailValidUseCase:Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;

.field private final overlayEnabled:LI4/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI4/d<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final state:LI4/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI4/d<",
            "Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;",
            ">;"
        }
    .end annotation
.end field

.field private final taskData:LI4/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI4/d<",
            "Ljava/util/List<",
            "Lcom/android/quickstep/recents/ui/viewmodel/TaskData;",
            ">;>;"
        }
    .end annotation
.end field

.field private taskIds:LI4/r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI4/r<",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private final taskViewType:Lcom/android/quickstep/views/TaskViewType;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->Companion:Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/quickstep/views/TaskViewType;Lcom/android/quickstep/recents/viewmodel/RecentsViewData;Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase;Lcom/android/quickstep/recents/domain/usecase/GetSysUiStatusNavFlagsUseCase;Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;Li2/b;)V
    .locals 1

    .line 1
    const-string v0, "taskViewType"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "recentsViewData"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "getTaskUseCase"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "getSysUiStatusNavFlagsUseCase"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "isThumbnailValidUseCase"

    .line 22
    .line 23
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string v0, "getThumbnailPositionUseCase"

    .line 27
    .line 28
    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string v0, "dispatcherProvider"

    .line 32
    .line 33
    invoke-static {p7, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->taskViewType:Lcom/android/quickstep/views/TaskViewType;

    .line 40
    .line 41
    iput-object p3, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->getTaskUseCase:Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase;

    .line 42
    .line 43
    iput-object p4, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->getSysUiStatusNavFlagsUseCase:Lcom/android/quickstep/recents/domain/usecase/GetSysUiStatusNavFlagsUseCase;

    .line 44
    .line 45
    iput-object p5, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->isThumbnailValidUseCase:Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;

    .line 46
    .line 47
    iput-object p6, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->getThumbnailPositionUseCase:Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;

    .line 48
    .line 49
    invoke-static {}, Li4/M;->b()Ljava/util/Set;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-static {p1}, LI4/w;->a(Ljava/lang/Object;)LI4/r;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->taskIds:LI4/r;

    .line 58
    .line 59
    invoke-virtual {p2}, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->getRunningTaskIds()LI4/r;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    invoke-virtual {p2}, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->getRunningTaskShowScreenshot()LI4/r;

    .line 64
    .line 65
    .line 66
    move-result-object p4

    .line 67
    new-instance p5, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$isLiveTile$1;

    .line 68
    .line 69
    const/4 p6, 0x0

    .line 70
    invoke-direct {p5, p6}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$isLiveTile$1;-><init>(Ll4/d;)V

    .line 71
    .line 72
    .line 73
    invoke-static {p1, p3, p4, p5}, LI4/f;->g(LI4/d;LI4/d;LI4/d;Lu4/r;)LI4/d;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-static {p1}, LI4/f;->i(LI4/d;)LI4/d;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iput-object p1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->isLiveTile:LI4/d;

    .line 82
    .line 83
    iget-object p3, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->taskIds:LI4/r;

    .line 84
    .line 85
    invoke-virtual {p2}, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->getCentralTaskIds()LI4/r;

    .line 86
    .line 87
    .line 88
    move-result-object p4

    .line 89
    new-instance p5, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$isCentralTask$1;

    .line 90
    .line 91
    invoke-direct {p5, p6}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$isCentralTask$1;-><init>(Ll4/d;)V

    .line 92
    .line 93
    .line 94
    invoke-static {p3, p4, p5}, LI4/f;->h(LI4/d;LI4/d;Lu4/q;)LI4/d;

    .line 95
    .line 96
    .line 97
    move-result-object p3

    .line 98
    invoke-static {p3}, LI4/f;->i(LI4/d;)LI4/d;

    .line 99
    .line 100
    .line 101
    move-result-object p3

    .line 102
    iput-object p3, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->isCentralTask:LI4/d;

    .line 103
    .line 104
    iget-object p4, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->taskIds:LI4/r;

    .line 105
    .line 106
    new-instance p5, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$special$$inlined$flatMapLatest$1;

    .line 107
    .line 108
    invoke-direct {p5, p6, p0}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$special$$inlined$flatMapLatest$1;-><init>(Ll4/d;Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;)V

    .line 109
    .line 110
    .line 111
    invoke-static {p4, p5}, LI4/f;->s(LI4/d;Lu4/q;)LI4/d;

    .line 112
    .line 113
    .line 114
    move-result-object p4

    .line 115
    iput-object p4, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->taskData:LI4/d;

    .line 116
    .line 117
    invoke-virtual {p2}, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->getOverlayEnabled()LI4/r;

    .line 118
    .line 119
    .line 120
    move-result-object p5

    .line 121
    invoke-virtual {p2}, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->getSettledFullyVisibleTaskIds()LI4/r;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    new-instance v0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$overlayEnabled$1;

    .line 126
    .line 127
    invoke-direct {v0, p0, p6}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$overlayEnabled$1;-><init>(Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;Ll4/d;)V

    .line 128
    .line 129
    .line 130
    invoke-static {p5, p2, v0}, LI4/f;->h(LI4/d;LI4/d;Lu4/q;)LI4/d;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    invoke-static {p2}, LI4/f;->i(LI4/d;)LI4/d;

    .line 135
    .line 136
    .line 137
    move-result-object p2

    .line 138
    iput-object p2, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->overlayEnabled:LI4/d;

    .line 139
    .line 140
    new-instance p5, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$state$1;

    .line 141
    .line 142
    invoke-direct {p5, p0}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$state$1;-><init>(Ljava/lang/Object;)V

    .line 143
    .line 144
    .line 145
    invoke-static {p4, p1, p2, p3, p5}, LI4/f;->f(LI4/d;LI4/d;LI4/d;LI4/d;Lu4/s;)LI4/d;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-static {p1}, LI4/f;->i(LI4/d;)LI4/d;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    invoke-interface {p7}, Li2/b;->getBackground()LF4/E;

    .line 154
    .line 155
    .line 156
    move-result-object p2

    .line 157
    invoke-static {p1, p2}, LI4/f;->q(LI4/d;Ll4/g;)LI4/d;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    iput-object p1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->state:LI4/d;

    .line 162
    .line 163
    return-void
.end method

.method public static final synthetic access$getGetTaskUseCase$p(Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;)Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->getTaskUseCase:Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getTaskIds$p(Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;)LI4/r;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->taskIds:LI4/r;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$mapToTaskData(Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;[Lh4/l;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->mapToTaskData([Lh4/l;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic access$state$mapToTaskTile(Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;Ljava/util/List;ZZZLl4/d;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->state$mapToTaskTile(Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;Ljava/util/List;ZZZLl4/d;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final mapToTaskData(ILcom/android/quickstep/recents/domain/model/TaskModel;)Lcom/android/quickstep/recents/ui/viewmodel/TaskData;
    .locals 8

    if-eqz p2, :cond_0

    .line 1
    new-instance v0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;

    .line 2
    invoke-virtual {p2}, Lcom/android/quickstep/recents/domain/model/TaskModel;->getTitle()Ljava/lang/String;

    move-result-object v2

    .line 3
    invoke-virtual {p2}, Lcom/android/quickstep/recents/domain/model/TaskModel;->getTitleDescription()Ljava/lang/String;

    move-result-object v3

    .line 4
    invoke-virtual {p2}, Lcom/android/quickstep/recents/domain/model/TaskModel;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 5
    invoke-virtual {p2}, Lcom/android/quickstep/recents/domain/model/TaskModel;->getThumbnail()Lcom/android/systemui/shared/recents/model/ThumbnailData;

    move-result-object v5

    .line 6
    invoke-virtual {p2}, Lcom/android/quickstep/recents/domain/model/TaskModel;->getBackgroundColor()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->removeAlpha(I)I

    move-result v6

    .line 7
    invoke-virtual {p2}, Lcom/android/quickstep/recents/domain/model/TaskModel;->isLocked()Z

    move-result v7

    move v1, p1

    .line 8
    invoke-direct/range {v0 .. v7}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;-><init>(ILjava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;Lcom/android/systemui/shared/recents/model/ThumbnailData;IZ)V

    return-object v0

    :cond_0
    move v1, p1

    .line 9
    new-instance p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;

    invoke-direct {p0, v1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;-><init>(I)V

    return-object p0
.end method

.method private final mapToTaskData([Lh4/l;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lh4/l<",
            "Ljava/lang/Integer;",
            "Lcom/android/quickstep/recents/domain/model/TaskModel;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/android/quickstep/recents/ui/viewmodel/TaskData;",
            ">;"
        }
    .end annotation

    .line 10
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 11
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p1, v2

    .line 12
    invoke-virtual {v3}, Lh4/l;->c()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    invoke-virtual {v3}, Lh4/l;->d()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/quickstep/recents/domain/model/TaskModel;

    invoke-direct {p0, v4, v3}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->mapToTaskData(ILcom/android/quickstep/recents/domain/model/TaskModel;)Lcom/android/quickstep/recents/ui/viewmodel/TaskData;

    move-result-object v3

    .line 13
    invoke-interface {v0, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private final mapToTaskTile(Ljava/util/List;ZZZ)Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/android/quickstep/recents/ui/viewmodel/TaskData;",
            ">;ZZZ)",
            "Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Li4/m;->d0(Ljava/util/List;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    check-cast v0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move-object v0, v2

    .line 14
    :goto_0
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getThumbnailData()Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    :cond_1
    new-instance v3, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->taskViewType:Lcom/android/quickstep/views/TaskViewType;

    .line 23
    .line 24
    sget-object v1, Lcom/android/quickstep/views/TaskViewType;->DESKTOP:Lcom/android/quickstep/views/TaskViewType;

    .line 25
    .line 26
    if-ne v0, v1, :cond_2

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    :goto_1
    move v6, v0

    .line 30
    goto :goto_2

    .line 31
    :cond_2
    const/4 v0, 0x0

    .line 32
    goto :goto_1

    .line 33
    :goto_2
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->getSysUiStatusNavFlagsUseCase:Lcom/android/quickstep/recents/domain/usecase/GetSysUiStatusNavFlagsUseCase;

    .line 34
    .line 35
    invoke-virtual {p0, v2}, Lcom/android/quickstep/recents/domain/usecase/GetSysUiStatusNavFlagsUseCase;->invoke(Lcom/android/systemui/shared/recents/model/ThumbnailData;)I

    .line 36
    .line 37
    .line 38
    move-result v7

    .line 39
    move-object v4, p1

    .line 40
    move v5, p2

    .line 41
    move v8, p3

    .line 42
    move v9, p4

    .line 43
    invoke-direct/range {v3 .. v9}, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;-><init>(Ljava/util/List;ZZIZZ)V

    .line 44
    .line 45
    .line 46
    return-object v3
.end method

.method private final removeAlpha(I)I
    .locals 0

    .line 1
    const/16 p0, 0xff

    .line 2
    .line 3
    invoke-static {p1, p0}, LB/a;->r(II)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private static final synthetic state$mapToTaskTile(Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;Ljava/util/List;ZZZLl4/d;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->mapToTaskTile(Ljava/util/List;ZZZ)Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public final varargs bind([I)V
    .locals 2

    .line 1
    const-string v0, "taskId"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->taskIds:LI4/r;

    .line 7
    .line 8
    invoke-static {p1}, Li4/g;->c0([I)Ljava/util/Set;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v1, "bind: "

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "TaskViewModel"

    .line 30
    .line 31
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    invoke-interface {p0, p1}, LI4/r;->setValue(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final getState()LI4/d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LI4/d<",
            "Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->state:LI4/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getThumbnailPosition(Lcom/android/systemui/shared/recents/model/ThumbnailData;IIZ)Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->getThumbnailPositionUseCase:Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;->invoke(Lcom/android/systemui/shared/recents/model/ThumbnailData;IIZ)Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final isThumbnailValid(Lcom/android/systemui/shared/recents/model/ThumbnailData;II)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->isThumbnailValidUseCase:Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;->invoke(Lcom/android/systemui/shared/recents/model/ThumbnailData;II)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
