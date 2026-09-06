.class public Lcom/android/quickstep/logging/StatsLogCompatManager;
.super Lcom/android/launcher3/logging/StatsLogManager;
.source "StatsLogCompatManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;,
        Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;,
        Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;,
        Lcom/android/quickstep/logging/StatsLogCompatManager$StatsLogConsumer;
    }
.end annotation


# static fields
.field private static final ALL_APPS_HIERARCHY_OFFSET:I = 0x190

.field private static final DEBUG:Z

.field private static final DEFAULT_INSTANCE_ID:Lcom/android/launcher3/logging/d;

.field private static final DEFAULT_PAGE_INDEX:I = -0x2

.field private static final EXTENDED_CONTAINERS_HIERARCHY_OFFSET:I = 0x12c

.field private static final FOLDER_HIERARCHY_OFFSET:I = 0x64

.field private static final IMPRESSION_TAG:Ljava/lang/String; = "StatsImpressionLog"

.field private static final IS_VERBOSE:Z

.field private static final LATENCY_TAG:Ljava/lang/String; = "StatsLatencyLog"

.field public static final LOGS_CONSUMER:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/android/quickstep/logging/StatsLogCompatManager$StatsLogConsumer;",
            ">;"
        }
    .end annotation
.end field

.field private static final SEARCH_ATTRIBUTES_CORRECTED_QUERY:I = 0x1

.field private static final SEARCH_ATTRIBUTES_DIRECT_MATCH:I = 0x2

.field private static final SEARCH_ATTRIBUTES_ENTRY_STATE_ALL_APPS:I = 0x4

.field private static final SEARCH_ATTRIBUTES_ENTRY_STATE_OVERVIEW:I = 0x10

.field private static final SEARCH_ATTRIBUTES_ENTRY_STATE_QSB:I = 0x8

.field private static final SEARCH_ATTRIBUTES_ENTRY_STATE_TASKBAR:I = 0x20

.field private static final SEARCH_RESULT_HIERARCHY_OFFSET:I = 0xc8

.field private static final TAG:Ljava/lang/String; = "StatsLog"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "StatsLog"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/N5;->C(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput-boolean v0, Lcom/android/quickstep/logging/StatsLogCompatManager;->IS_VERBOSE:Z

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    xor-int/lit8 v0, v0, 0x1

    .line 14
    .line 15
    sput-boolean v0, Lcom/android/quickstep/logging/StatsLogCompatManager;->DEBUG:Z

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-static {v0}, Lcom/android/launcher3/logging/d;->a(I)Lcom/android/launcher3/logging/d;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Lcom/android/quickstep/logging/StatsLogCompatManager;->DEFAULT_INSTANCE_ID:Lcom/android/launcher3/logging/d;

    .line 23
    .line 24
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/android/quickstep/logging/StatsLogCompatManager;->LOGS_CONSUMER:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic a()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/android/quickstep/logging/StatsLogCompatManager;->DEBUG:Z

    .line 2
    .line 3
    return v0
.end method

.method static bridge synthetic b()Lcom/android/launcher3/logging/d;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/logging/StatsLogCompatManager;->DEFAULT_INSTANCE_ID:Lcom/android/launcher3/logging/d;

    .line 2
    .line 3
    return-object v0
.end method

.method public static buildStatsEvent(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Lcom/android/launcher3/logging/d;)Landroid/util/StatsEvent;
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->x0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/android/launcher3/logging/StatsLogManager$e;->getId()I

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getItemCase()Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$ItemCase;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$ItemCase;->getNumber()I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    const/4 v1, 0x0

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    move v5, v1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/android/launcher3/logging/d;->b()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    move v5, v2

    .line 27
    :goto_0
    invoke-static {v0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getPackageName(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v7

    .line 31
    invoke-static {v0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getComponentName(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v8

    .line 35
    invoke-static {v0, v1}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getGridX(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Z)I

    .line 36
    .line 37
    .line 38
    move-result v9

    .line 39
    invoke-static {v0, v1}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getGridY(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Z)I

    .line 40
    .line 41
    .line 42
    move-result v10

    .line 43
    invoke-static {v0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getPageId(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 44
    .line 45
    .line 46
    move-result v11

    .line 47
    const/4 v1, 0x1

    .line 48
    invoke-static {v0, v1}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getGridX(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Z)I

    .line 49
    .line 50
    .line 51
    move-result v12

    .line 52
    invoke-static {v0, v1}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getGridY(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Z)I

    .line 53
    .line 54
    .line 55
    move-result v13

    .line 56
    invoke-static {v0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getParentPageId(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 57
    .line 58
    .line 59
    move-result v14

    .line 60
    invoke-static {v0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getHierarchy(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 61
    .line 62
    .line 63
    move-result v15

    .line 64
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getIsWork()Z

    .line 65
    .line 66
    .line 67
    move-result v16

    .line 68
    invoke-static {v0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getCardinality(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 69
    .line 70
    .line 71
    move-result v18

    .line 72
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getWidget()Lcom/android/launcher3/logger/LauncherAtom$Widget;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v1}, Lcom/android/launcher3/logger/LauncherAtom$Widget;->getSpanX()I

    .line 77
    .line 78
    .line 79
    move-result v19

    .line 80
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getWidget()Lcom/android/launcher3/logger/LauncherAtom$Widget;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v1}, Lcom/android/launcher3/logger/LauncherAtom$Widget;->getSpanY()I

    .line 85
    .line 86
    .line 87
    move-result v20

    .line 88
    invoke-static {v0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getAttributes(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)[B

    .line 89
    .line 90
    .line 91
    move-result-object v21

    .line 92
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getIsKidsMode()Z

    .line 93
    .line 94
    .line 95
    move-result v22

    .line 96
    const/16 v2, 0x277c

    .line 97
    .line 98
    const/4 v6, 0x0

    .line 99
    const/16 v17, 0x0

    .line 100
    .line 101
    invoke-static/range {v2 .. v22}, Lcom/android/systemui/shared/system/SysUiStatsLog;->buildStatsEvent(IIIIILjava/lang/String;Ljava/lang/String;IIIIIIIZIIII[BZ)Landroid/util/StatsEvent;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    return-object v0
.end method

.method static bridge synthetic c()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/android/quickstep/logging/StatsLogCompatManager;->IS_VERBOSE:Z

    .line 2
    .line 3
    return v0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)[B
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getAttributes(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getCardinality(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getComponentName(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getFeatures(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static getAttributes(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)[B
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$LauncherAttributes;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$LauncherAttributes$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getItemAttributesList()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v1, Lcom/android/quickstep/logging/j;

    .line 14
    .line 15
    invoke-direct {v1}, Lcom/android/quickstep/logging/j;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-interface {p0, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    new-instance v1, Lcom/android/quickstep/logging/k;

    .line 26
    .line 27
    invoke-direct {v1, v0}, Lcom/android/quickstep/logging/k;-><init>(Lcom/android/launcher3/logger/LauncherAtom$LauncherAttributes$Builder;)V

    .line 28
    .line 29
    .line 30
    invoke-interface {p0, v1}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$LauncherAttributes;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/google/protobuf/a;->toByteArray()[B

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method private static getCardinality(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I
    .locals 6

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    sget-object v0, Lcom/android/quickstep/logging/StatsLogCompatManager$1;->$SwitchMap$com$android$launcher3$logger$LauncherAtom$ContainerInfo$ContainerCase:[I

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getContainerCase()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    aget v0, v0, v2

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    if-eq v0, v2, :cond_8

    .line 27
    .line 28
    const/4 v3, 0x2

    .line 29
    if-eq v0, v3, :cond_7

    .line 30
    .line 31
    const/4 v4, 0x3

    .line 32
    if-eq v0, v4, :cond_6

    .line 33
    .line 34
    const/4 v4, 0x4

    .line 35
    if-eq v0, v4, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getExtendedContainers()Lcom/android/launcher3/logger/d;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lcom/android/launcher3/logger/d;->b()Lcom/android/launcher3/logger/d$b;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    sget-object v5, Lcom/android/launcher3/logger/d$b;->h:Lcom/android/launcher3/logger/d$b;

    .line 51
    .line 52
    if-ne v4, v5, :cond_3

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/android/launcher3/logger/d;->d()Lcom/android/launcher3/logger/c;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Lcom/android/launcher3/logger/c;->hasQueryLength()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/android/launcher3/logger/c;->getQueryLength()I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    return p0

    .line 69
    :cond_2
    const/4 p0, -0x1

    .line 70
    return p0

    .line 71
    :cond_3
    :goto_0
    sget-object v0, Lcom/android/quickstep/logging/StatsLogCompatManager$1;->$SwitchMap$com$android$launcher3$logger$LauncherAtom$ItemInfo$ItemCase:[I

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getItemCase()Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$ItemCase;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    aget v0, v0, v4

    .line 82
    .line 83
    if-eq v0, v2, :cond_5

    .line 84
    .line 85
    if-eq v0, v3, :cond_4

    .line 86
    .line 87
    return v1

    .line 88
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getTaskView()Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->getCardinality()I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    return p0

    .line 97
    :cond_5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getFolderIcon()Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->getCardinality()I

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    return p0

    .line 106
    :cond_6
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getSearchResultContainer()Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer;->getQueryLength()I

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    return p0

    .line 119
    :cond_7
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getTaskBarContainer()Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;->getCardinality()I

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    return p0

    .line 132
    :cond_8
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getPredictedHotseatContainer()Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer;->getCardinality()I

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    return p0
.end method

.method private static getComponentName(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/logging/StatsLogCompatManager$1;->$SwitchMap$com$android$launcher3$logger$LauncherAtom$ItemInfo$ItemCase:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getItemCase()Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$ItemCase;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    aget v0, v0, v1

    .line 12
    .line 13
    packed-switch v0, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return-object p0

    .line 18
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getSlice()Lcom/android/launcher3/logger/LauncherAtom$Slice;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$Slice;->getUri()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getSearchActionItem()Lcom/android/launcher3/logger/LauncherAtom$SearchActionItem;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$SearchActionItem;->getTitle()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getTask()Lcom/android/launcher3/logger/LauncherAtom$Task;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$Task;->getComponentName()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0

    .line 45
    :pswitch_3
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getWidget()Lcom/android/launcher3/logger/LauncherAtom$Widget;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$Widget;->getComponentName()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0

    .line 54
    :pswitch_4
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getShortcut()Lcom/android/launcher3/logger/LauncherAtom$Shortcut;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$Shortcut;->getShortcutName()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0

    .line 63
    :pswitch_5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getApplication()Lcom/android/launcher3/logger/LauncherAtom$Application;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$Application;->getComponentName()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0

    .line 72
    :pswitch_6
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getTaskView()Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->getComponentName()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0

    .line 81
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getFeatures(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/logging/StatsLogCompatManager$1;->$SwitchMap$com$android$launcher3$logger$LauncherAtom$ItemInfo$ItemCase:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getItemCase()Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$ItemCase;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    aget v0, v0, v1

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    if-eq v0, v1, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x5

    .line 17
    if-eq v0, v1, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getWidget()Lcom/android/launcher3/logger/LauncherAtom$Widget;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$Widget;->getWidgetFeatures()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getTaskView()Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->getType()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method private static getGridX(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Z)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getContainerCase()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;->FOLDER:Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 10
    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getFolder()Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;->getWorkspace()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->getGridX()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getFolder()Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;->getGridX()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0

    .line 37
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getContainerCase()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    sget-object v0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;->EXTENDED_CONTAINERS:Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 42
    .line 43
    if-ne p1, v0, :cond_2

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getExtendedContainers()Lcom/android/launcher3/logger/d;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Lcom/android/launcher3/logger/d;->d()Lcom/android/launcher3/logger/c;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Lcom/android/launcher3/logger/c;->getGridX()I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0

    .line 58
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getWorkspace()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->getGridX()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    return p0
.end method

.method private static getGridY(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Z)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getContainerCase()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;->FOLDER:Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 10
    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getFolder()Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;->getWorkspace()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->getGridY()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getFolder()Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;->getGridY()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getWorkspace()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->getGridY()I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0
.end method

.method private static getHierarchy(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getContainerCase()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;->FOLDER:Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 18
    .line 19
    if-ne v0, v1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getFolder()Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;->getParentContainerCase()Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$ParentContainerCase;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$ParentContainerCase;->getNumber()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    add-int/lit8 p0, p0, 0x64

    .line 38
    .line 39
    return p0

    .line 40
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getContainerCase()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget-object v1, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;->SEARCH_RESULT_CONTAINER:Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 49
    .line 50
    if-ne v0, v1, :cond_2

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getSearchResultContainer()Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer;->getParentContainerCase()Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer$ParentContainerCase;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer$ParentContainerCase;->getNumber()I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    add-int/lit16 p0, p0, 0xc8

    .line 69
    .line 70
    return p0

    .line 71
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getContainerCase()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    sget-object v1, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;->EXTENDED_CONTAINERS:Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 80
    .line 81
    if-ne v0, v1, :cond_3

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getExtendedContainers()Lcom/android/launcher3/logger/d;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0}, Lcom/android/launcher3/logger/d;->b()Lcom/android/launcher3/logger/d$b;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Lcom/android/launcher3/logger/d$b;->getNumber()I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    add-int/lit16 p0, p0, 0x12c

    .line 100
    .line 101
    return p0

    .line 102
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getContainerCase()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    sget-object v1, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;->ALL_APPS_CONTAINER:Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 111
    .line 112
    if-ne v0, v1, :cond_4

    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getAllAppsContainer()Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer;->getParentContainerCase()Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer$ParentContainerCase;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$AllAppsContainer$ParentContainerCase;->getNumber()I

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    add-int/lit16 p0, p0, 0x190

    .line 131
    .line 132
    return p0

    .line 133
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getContainerCase()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;->getNumber()I

    .line 142
    .line 143
    .line 144
    move-result p0

    .line 145
    return p0
.end method

.method private static getPackageName(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/logging/StatsLogCompatManager$1;->$SwitchMap$com$android$launcher3$logger$LauncherAtom$ItemInfo$ItemCase:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getItemCase()Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$ItemCase;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    aget v0, v0, v1

    .line 12
    .line 13
    const/4 v1, 0x3

    .line 14
    if-eq v0, v1, :cond_4

    .line 15
    .line 16
    const/4 v1, 0x4

    .line 17
    if-eq v0, v1, :cond_3

    .line 18
    .line 19
    const/4 v1, 0x5

    .line 20
    if-eq v0, v1, :cond_2

    .line 21
    .line 22
    const/4 v1, 0x6

    .line 23
    if-eq v0, v1, :cond_1

    .line 24
    .line 25
    const/4 v1, 0x7

    .line 26
    if-eq v0, v1, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return-object p0

    .line 30
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getSearchActionItem()Lcom/android/launcher3/logger/LauncherAtom$SearchActionItem;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$SearchActionItem;->getPackageName()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getTask()Lcom/android/launcher3/logger/LauncherAtom$Task;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$Task;->getPackageName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getWidget()Lcom/android/launcher3/logger/LauncherAtom$Widget;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$Widget;->getPackageName()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0

    .line 57
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getShortcut()Lcom/android/launcher3/logger/LauncherAtom$Shortcut;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$Shortcut;->getShortcutName()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getApplication()Lcom/android/launcher3/logger/LauncherAtom$Application;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$Application;->getPackageName()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0
.end method

.method private static getPageId(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/logging/StatsLogCompatManager$1;->$SwitchMap$com$android$launcher3$logger$LauncherAtom$ItemInfo$ItemCase:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getItemCase()Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$ItemCase;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    aget v0, v0, v1

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    if-eq v0, v1, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x6

    .line 17
    if-eq v0, v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getPageIdFromContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getTask()Lcom/android/launcher3/logger/LauncherAtom$Task;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$Task;->getIndex()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0

    .line 37
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getTaskView()Lcom/android/launcher3/logger/LauncherAtom$TaskView;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskView;->getIndex()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0
.end method

.method private static getPageIdFromContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)I
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/logging/StatsLogCompatManager$1;->$SwitchMap$com$android$launcher3$logger$LauncherAtom$ContainerInfo$ContainerCase:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getContainerCase()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    aget v0, v0, v1

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    if-eq v0, v1, :cond_3

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    if-eq v0, v1, :cond_2

    .line 18
    .line 19
    const/4 v1, 0x5

    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    const/4 v1, 0x6

    .line 23
    if-eq v0, v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getWorkspace()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->getPageIndex()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getHotseat()Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;->getIndex()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    return p0

    .line 43
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getFolder()Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;->getPageIndex()I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    return p0

    .line 52
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getTaskBarContainer()Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$TaskBarContainer;->getIndex()I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    return p0

    .line 61
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getPredictedHotseatContainer()Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer;->getIndex()I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    return p0
.end method

.method private static getParentPageId(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/logging/StatsLogCompatManager$1;->$SwitchMap$com$android$launcher3$logger$LauncherAtom$ContainerInfo$ContainerCase:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getContainerCase()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    aget v0, v0, v1

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-eq v0, v1, :cond_2

    .line 19
    .line 20
    const/4 v1, 0x5

    .line 21
    if-eq v0, v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getWorkspace()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->getPageIndex()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getFolder()Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;->getParentContainerCase()Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$ParentContainerCase;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget-object v1, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$ParentContainerCase;->HOTSEAT:Lcom/android/launcher3/logger/LauncherAtom$FolderContainer$ParentContainerCase;

    .line 49
    .line 50
    if-ne v0, v1, :cond_1

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getFolder()Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;->getHotseat()Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$HotseatContainer;->getIndex()I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    return p0

    .line 69
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getFolder()Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$FolderContainer;->getWorkspace()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->getPageIndex()I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    return p0

    .line 86
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getSearchResultContainer()Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer;->getWorkspace()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->getPageIndex()I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    return p0
.end method

.method private static getSearchAttributes(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getContainerCase()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v2, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;->EXTENDED_CONTAINERS:Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 18
    .line 19
    if-ne v0, v2, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getExtendedContainers()Lcom/android/launcher3/logger/d;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/logger/d;->b()Lcom/android/launcher3/logger/d$b;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget-object v2, Lcom/android/launcher3/logger/d$b;->h:Lcom/android/launcher3/logger/d$b;

    .line 30
    .line 31
    if-ne v0, v2, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getExtendedContainers()Lcom/android/launcher3/logger/d;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/logger/d;->d()Lcom/android/launcher3/logger/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/logger/c;->d()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getExtendedContainers()Lcom/android/launcher3/logger/d;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Lcom/android/launcher3/logger/d;->d()Lcom/android/launcher3/logger/c;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Lcom/android/launcher3/logger/c;->c()Lcom/android/launcher3/logger/c$b;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->searchAttributesToInt(Lcom/android/launcher3/logger/c$b;)I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    return p0

    .line 64
    :cond_1
    return v1
.end method

.method private static getStateString(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, v0, :cond_3

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p0, v0, :cond_2

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    if-eq p0, v0, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x4

    .line 11
    if-eq p0, v0, :cond_0

    .line 12
    .line 13
    const-string p0, "INVALID"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p0, "ALLAPPS"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    const-string p0, "OVERVIEW"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_2
    const-string p0, "HOME"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_3
    const-string p0, "BACKGROUND"

    .line 26
    .line 27
    return-object p0
.end method

.method static bridge synthetic h(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Z)I
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getGridX(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Z)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic i(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Z)I
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getGridY(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Z)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic j(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getHierarchy(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic k(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getPackageName(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic l(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getPageId(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic m(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getParentPageId(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic n(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getSearchAttributes(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic o(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getStateString(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static searchAttributesToInt(Lcom/android/launcher3/logger/c$b;)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/logger/c$b;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/c$b;->d()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    or-int/lit8 v0, v0, 0x2

    .line 12
    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/logger/c$b;->e()Lcom/android/launcher3/logger/c$b$b;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget-object v2, Lcom/android/launcher3/logger/c$b$b;->i:Lcom/android/launcher3/logger/c$b$b;

    .line 18
    .line 19
    if-ne v1, v2, :cond_1

    .line 20
    .line 21
    or-int/lit8 p0, v0, 0x4

    .line 22
    .line 23
    return p0

    .line 24
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/logger/c$b;->e()Lcom/android/launcher3/logger/c$b$b;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    sget-object v2, Lcom/android/launcher3/logger/c$b$b;->j:Lcom/android/launcher3/logger/c$b$b;

    .line 29
    .line 30
    if-ne v1, v2, :cond_2

    .line 31
    .line 32
    or-int/lit8 p0, v0, 0x8

    .line 33
    .line 34
    return p0

    .line 35
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/logger/c$b;->e()Lcom/android/launcher3/logger/c$b$b;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sget-object v2, Lcom/android/launcher3/logger/c$b$b;->k:Lcom/android/launcher3/logger/c$b$b;

    .line 40
    .line 41
    if-ne v1, v2, :cond_3

    .line 42
    .line 43
    or-int/lit8 p0, v0, 0x10

    .line 44
    .line 45
    return p0

    .line 46
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher3/logger/c$b;->e()Lcom/android/launcher3/logger/c$b$b;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    sget-object v1, Lcom/android/launcher3/logger/c$b$b;->l:Lcom/android/launcher3/logger/c$b$b;

    .line 51
    .line 52
    if-ne p0, v1, :cond_4

    .line 53
    .line 54
    or-int/lit8 p0, v0, 0x20

    .line 55
    .line 56
    return p0

    .line 57
    :cond_4
    return v0
.end method

.method public static writeSnapshot(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Lcom/android/launcher3/logging/d;)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    sget-boolean v1, Lcom/android/quickstep/logging/StatsLogCompatManager;->IS_VERBOSE:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-virtual/range {p1 .. p1}, Lcom/android/launcher3/logging/d;->b()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "\nwriteSnapshot(%d):\n%s"

    .line 20
    .line 21
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "StatsLog"

    .line 26
    .line 27
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->x0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/android/launcher3/logging/StatsLogManager$e;->getId()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getItemCase()Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$ItemCase;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$ItemCase;->getNumber()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    invoke-virtual/range {p1 .. p1}, Lcom/android/launcher3/logging/d;->b()I

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    invoke-static {v0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getPackageName(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    invoke-static {v0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getComponentName(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v8

    .line 63
    const/4 v1, 0x0

    .line 64
    invoke-static {v0, v1}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getGridX(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Z)I

    .line 65
    .line 66
    .line 67
    move-result v9

    .line 68
    invoke-static {v0, v1}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getGridY(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Z)I

    .line 69
    .line 70
    .line 71
    move-result v10

    .line 72
    invoke-static {v0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getPageId(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 73
    .line 74
    .line 75
    move-result v11

    .line 76
    const/4 v1, 0x1

    .line 77
    invoke-static {v0, v1}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getGridX(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Z)I

    .line 78
    .line 79
    .line 80
    move-result v12

    .line 81
    invoke-static {v0, v1}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getGridY(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Z)I

    .line 82
    .line 83
    .line 84
    move-result v13

    .line 85
    invoke-static {v0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getParentPageId(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 86
    .line 87
    .line 88
    move-result v14

    .line 89
    invoke-static {v0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getHierarchy(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 90
    .line 91
    .line 92
    move-result v15

    .line 93
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getIsWork()Z

    .line 94
    .line 95
    .line 96
    move-result v16

    .line 97
    invoke-static {v0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getCardinality(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 98
    .line 99
    .line 100
    move-result v18

    .line 101
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getWidget()Lcom/android/launcher3/logger/LauncherAtom$Widget;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v1}, Lcom/android/launcher3/logger/LauncherAtom$Widget;->getSpanX()I

    .line 106
    .line 107
    .line 108
    move-result v19

    .line 109
    invoke-virtual {v0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getWidget()Lcom/android/launcher3/logger/LauncherAtom$Widget;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v1}, Lcom/android/launcher3/logger/LauncherAtom$Widget;->getSpanY()I

    .line 114
    .line 115
    .line 116
    move-result v20

    .line 117
    invoke-static {v0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getFeatures(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)I

    .line 118
    .line 119
    .line 120
    move-result v21

    .line 121
    invoke-static {v0}, Lcom/android/quickstep/logging/StatsLogCompatManager;->getAttributes(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;)[B

    .line 122
    .line 123
    .line 124
    move-result-object v22

    .line 125
    const/16 v2, 0x106

    .line 126
    .line 127
    const/4 v6, 0x0

    .line 128
    const/16 v17, 0x0

    .line 129
    .line 130
    invoke-static/range {v2 .. v22}, Lcom/android/systemui/shared/system/SysUiStatsLog;->write(IIIIILjava/lang/String;Ljava/lang/String;IIIIIIIZIIIII[B)V

    .line 131
    .line 132
    .line 133
    return-void
.end method


# virtual methods
.method protected createImpressionLogger()Lcom/android/launcher3/logging/StatsLogManager$g;
    .locals 1

    .line 1
    new-instance p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, v0}, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;-><init>(Lcom/android/quickstep/logging/w;)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method protected createLatencyLogger()Lcom/android/launcher3/logging/StatsLogManager$h;
    .locals 1

    .line 1
    new-instance p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, v0}, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;-><init>(Lcom/android/quickstep/logging/w;)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method protected createLogger()Lcom/android/launcher3/logging/StatsLogManager$i;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/logging/StatsLogManager;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/logging/StatsLogManager;->mActivityContext:Lcom/android/launcher3/views/k;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLogger;-><init>(Landroid/content/Context;Lcom/android/launcher3/views/k;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method
